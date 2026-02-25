# LLaMA 3.1 8B Validation Pipeline: C Model ↔ llama.cpp ↔ HLS

## Context

We have 17 Kanagawa HLS modules and 17 matching SystemC reference models for a LLaMA 3.1 8B accelerator. The models currently pass unit tests but have no end-to-end validation against a known-good reference. Several C model methods are stubs (SwiGLU, RoPE rotation, residual add).

This design establishes a two-stage validation pipeline:
1. C model vs llama.cpp — verify our compute matches a known-good LLM implementation
2. HLS vs C model — verify the generated RTL matches our C model bit-exactly

## Dependencies

- **llama.cpp** — added as `third-party/llama.cpp` git submodule, built from source
- **LLaMA 3.1 8B Q3_K_S GGUF** — downloaded from HuggingFace (bartowski or similar)
- **Existing** — SystemC 2.3.4, ac_types, Kanagawa compiler, Verilator

## Architecture

```
                    Stage 1                          Stage 2
  ┌──────────┐    ┌──────────────┐    ┌──────────┐    ┌──────────┐
  │ GGUF     │───>│ Weight       │───>│ C Model  │<──>│ Verilator│
  │ Q3_K_S   │    │ Converter    │    │ Forward  │    │ HLS Sim  │
  └──────────┘    └──────────────┘    │ Pass     │    └──────────┘
                                      └──────────┘
  ┌──────────┐    ┌──────────────┐         │
  │ GGUF     │───>│ llama.cpp    │         │
  │ Q3_K_S   │    │ Tensor       │    ┌──────────┐
  └──────────┘    │ Extractor    │───>│ Compare  │
                  └──────────────┘    │ Tool     │
                                      └──────────┘
```

## Component 1: GGUF Weight Converter

**Purpose:** Read Q3_K GGUF and repack to our hardware's weight format.

**Input:** LLaMA 3.1 8B Q3_K_S `.gguf` file

**Output:** Binary weight file in our format:
- Flat INT3 weights (values 0-7, where 4-7 map to -4..-1)
- FP8 E4M3 bank scales (per-block, converted from Q3_K's FP16 scales)
- FP32 tensor scales (per-tensor)

**Q3_K → Our Format Mapping:**
- Q3_K superblock: 256 weights, FP16 d-scale, 12-byte high-bits, 3-byte hmask, FP16 mins
- Our format: flat uint3 array + FP8 E4M3 scale per bank (32 weights) + FP32 per-tensor
- Scale conversion: FP16 → FP8 E4M3 is lossy (reduced exponent/mantissa range)
- Weight remapping: Q3_K uses unsigned 0-7 with min subtraction; we use signed -4..+3 encoding

**Implementation:** `tools/gguf_converter.cpp` — standalone CLI tool using llama.cpp's GGUF parsing API.

**File:** `tools/gguf_converter.h` (library) + `tools/gguf_converter_main.cpp` (CLI)

## Component 2: llama.cpp Tensor Extractor

**Purpose:** Run inference through llama.cpp and dump intermediate tensors at layer boundaries.

**Extraction points per layer (32 layers):**
- Post-RMSNorm (pre-attention): BF16 vector, dim=4096
- Post-attention (after O projection + residual): BF16 vector, dim=4096
- Post-MLP (after down projection + residual): BF16 vector, dim=4096

**Additional extraction points:**
- Embedding output: BF16 vector, dim=4096
- Final RMSNorm output: BF16 vector, dim=4096
- Logits: FP32 vector, dim=128256

**Output format:** Directory of flat binary files with a manifest JSON:
```
tensors/
  manifest.json          # shapes, dtypes, extraction points
  embed_out.bin          # [4096] BF16
  layer_00_post_norm.bin # [4096] BF16
  layer_00_post_attn.bin # [4096] BF16
  layer_00_post_mlp.bin  # [4096] BF16
  ...
  layer_31_post_mlp.bin
  final_norm.bin         # [4096] BF16
  logits.bin             # [128256] FP32
```

**Implementation:** `tools/tensor_extractor.cpp` — links against llama.cpp, uses callback hooks or graph evaluation API to capture intermediate results.

## Component 3: C Model Forward Pass Runner

**Purpose:** Load converted weights, run full LLaMA 3.1 8B forward pass, dump tensors at same extraction points.

**Required C model upgrades (stubs → real arithmetic):**
- `residual_add`: BF16 addition (unpack to FP32, add, repack to BF16)
- `swiglu_compute`: BF16 SiLU(gate) × up (sigmoid LUT lookup, BF16 multiply)
- `rope rotate_pair`: x_even×cos - x_odd×sin, x_even×sin + x_odd×cos (BF16 multiply/add)
- `rmsnorm`: Full normalize — compute rsqrt(mean(x²)+eps), multiply by gamma
- `dequantize`: Already implemented, verify against llama.cpp's dequant

**New code:**
- `tools/cmodel_runner.cpp` — loads weights, runs forward pass through model hierarchy
- `model/systemc/src/bf16_math.h` — BF16 arithmetic utilities (add, mul, from_fp32, to_fp32)
- Updates to existing model headers to use real BF16 math

**Forward pass sequence:**
1. Embed: lookup token → INT3 weights → dequant → BF16 vector
2. For each layer (0..31):
   a. RMSNorm pre-attention
   b. Q/K/V projections (MAC array + dequant)
   c. RoPE on Q and K
   d. KV cache append
   e. Attention: QK dot product → softmax → V aggregation
   f. O projection (MAC array + dequant)
   g. Residual add
   h. RMSNorm pre-MLP
   i. Gate/Up projections (MAC array + dequant)
   j. SwiGLU activation
   k. Down projection (MAC array + dequant)
   l. Residual add
3. Final RMSNorm
4. LM head projection → logits → argmax

## Component 4: Comparison Tool

**Purpose:** Compare tensor dumps from llama.cpp and C model.

**Metrics:**
- Per-element absolute error: |a - b|
- Per-element relative error: |a - b| / max(|a|, |b|, ε)
- Max absolute error across tensor
- Mean absolute error
- Cosine similarity between tensors
- Argmax match (for logits)

**Tolerance tiers:**
- Functional: argmax of logits matches (same predicted token)
- Numerical: max relative error < 1% per layer (accounts for FP8 scale quantization loss)
- Strict: max absolute error < 1e-3 (for bit-exact stages like integer MAC)

**Implementation:** `tools/compare_tensors.cpp` — CLI tool, reads two tensor directories, reports per-layer metrics.

## Component 5 (Stage 2): HLS vs C Model via Verilator

**Purpose:** Verify Kanagawa-generated SystemVerilog matches C model bit-exactly.

**Approach:**
- Generate SV for each module via Kanagawa
- Create Verilator testbenches that drive the same inputs as C model unit tests
- Compare outputs — should be bit-exact (no floating-point tolerance needed)
- Start with leaf modules (mac_pe, dequant) and work up to mac_array, attention_unit

**This is deferred to after Stage 1 is validated.**

## Directory Structure

```
third-party/
  llama.cpp/           # NEW: git submodule
tools/
  gguf_converter.h     # Weight format conversion library
  gguf_converter_main.cpp  # CLI: gguf → our format
  tensor_extractor.cpp # llama.cpp tensor dumper
  cmodel_runner.cpp    # C model forward pass + tensor dump
  compare_tensors.cpp  # Tensor comparison tool
  CMakeLists.txt       # Build targets for all tools
model/
  systemc/
    src/
      bf16_math.h      # NEW: BF16 arithmetic (add, mul, conversions)
      # Updated: swiglu.h, rope.h, rmsnorm.h, vector_unit.h (stubs → real math)
models/
  llama-3.1-8b/        # Downloaded GGUF + converted weights (gitignored)
```

## Implementation Order

1. Add llama.cpp submodule + CMake integration
2. Implement `bf16_math.h` (BF16 add, mul, from/to FP32)
3. Upgrade C model stubs to real BF16 arithmetic
4. Implement GGUF weight converter
5. Implement C model forward pass runner
6. Implement llama.cpp tensor extractor
7. Implement comparison tool
8. Download GGUF, run Stage 1 validation
9. (Later) Stage 2: Verilator HLS comparison

## Success Criteria

- **Functional:** Same predicted token for "The capital of France is" prompt
- **Numerical:** Per-layer cosine similarity > 0.99, max relative error < 5% (FP8 scale loss)
- **Bit-exact (Stage 2):** HLS output == C model output for integer operations (MAC, attention dot product)
