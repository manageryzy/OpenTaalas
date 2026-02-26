# IQ3_S Hardware Adoption Design

## Goal

Upgrade the OpenTaalas quantized compute pipeline from Q3_K (INT3 + FP8 E4M3 scales) to IQ3_S (codebook + BF16/FP32 scales) to match SOTA 3-bit quantization quality. Current design achieves cosine=0.38 vs llama.cpp reference; IQ3_S should achieve cosine>0.99.

## Background

### Why Q3_K Failed (cosine=0.38)

The dominant error source is FP8 E4M3 bank scales (3-bit mantissa ≈ 4-bit effective precision). Q3_K uses FP16 super-scale × 6-bit sub-scales (≈14-bit effective), but our hardware truncated these to FP8 E4M3, destroying scale information.

### Why IQ3_S

IQ3_S achieves 40-70% lower quantization error than Q3_K_S at identical file size (3.4375 bpw) through:

1. **512-entry codebook**: Non-uniform weight values {1,3,5,7,9,11,13,15} optimized via importance matrix. Captures real weight distributions better than uniform INT3.
2. **FP16 super-scale + 4-bit sub-scales**: ≈14-bit effective scale precision vs our FP8 E4M3's ≈4-bit.
3. **Separate sign bits**: Decouples magnitude from sign, enabling unsigned codebook optimization.

### Hardware-Friendly Properties of IQ3_S

All 8 codebook magnitudes are `2k+1` where k=0..7. The multiply `(2k+1) × activation = (k×a)<<1 + a` uses the same shift-and-add approach as current INT3 MAC. Gate complexity is comparable.

---

## Architecture

### Precision Chain (matches llama.cpp)

```
Stage                    Precision         Notes
─────────────────────────────────────────────────────────
Weight storage           9-bit index       Per 4 weights, into 512-entry codebook
                         + 1-bit sign      Per weight
Weight scales            BF16 super        Per 256 weights (super-block)
                         + 4-bit sub       Per 32 weights (sub-block)
Activation pre-quant     FP32              From RMSNorm / residual
Activation quantized     INT8 + FP32 d     Symmetric per-tensor (Q8_* style)
Integer dot product      INT24             Per 32-weight sub-block
Post-scale partial       FP32              INT24 × FP32(BF16_d) × (1+2×sub4)
Row accumulation         FP32              Sum of partials across sub-blocks
Output                   FP32 → BF16       Truncate (no round-to-nearest needed)
```

### No Subnormal Support

All FP32 and BF16 datapaths use flush-to-zero (FTZ). No denormal handling in dequant, accumulation, or BF16 truncation. Simplifies FP hardware significantly.

### Datapath Diagram

```
                    ┌─────────────┐
  9-bit index ─────►│  Codebook   │──► 4× 4-bit unsigned magnitudes
                    │  512×32-bit │
                    │  LUT (2KB)  │
                    └─────────────┘
                           │
                    ┌──────▼──────┐
  1-bit sign ──────►│ Sign Apply  │──► 4× signed values (5-bit)
                    └──────┬──────┘
                           │ (one at a time)
                    ┌──────▼──────┐
  INT8 activation ─►│   MAC PE    │──► INT24 accumulator
                    │ (2k+1)×a   │    (32 products per sub-block)
                    │ shift+add   │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
  BF16 super-d ────►│  Dequant    │──► FP32 partial sum
  4-bit sub-scale ─►│  INT24→FP32 │
                    │  ×d×(1+2×s) │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │ FP32 Accum  │──► FP32 row result
                    │ (across all │
                    │  sub-blocks)│
                    └──────┬──────┘
                           │
  FP32 act_scale ──►│  × act_scale │──► FP32 → truncate → BF16
                    └──────────────┘
```

---

## Module Changes

### 1. MacPE (modified)

**Current:** INT3 × INT8 → INT32, unsigned weight 0-7 interpreted as signed -4..+3
**New:** (2k+1) × INT8 → INT24, unsigned magnitude from codebook + separate sign

```
Interface:
  mac(uint4 magnitude, uint1 sign, int8 activation) → int24
  read_accum() → int24
  clear()

MAC logic (shift-and-add, no multiplier):
  k = magnitude >> 1    // magnitude = 2k+1, so k = (mag-1)/2 = mag>>1
  product = (k × a) << 1 + a   // where k×a uses 3-bit shift-and-add
  if (sign) product = -product
  accum += product

k×a shift-and-add (k is 3-bit, 0..7):
  k=0: 0        k=4: a<<2
  k=1: a        k=5: (a<<2)+a
  k=2: a<<1     k=6: (a<<2)+(a<<1)
  k=3: (a<<1)+a k=7: (a<<2)+(a<<1)+a
```

**Accumulator width:** INT24 signed. Worst case per 32-weight sub-block: 32 × 15 × 127 = 60,960 (fits in 17 bits signed). INT24 provides headroom for up to 128-weight sub-blocks.

### 2. CodebookDecoder (new module)

512-entry × 32-bit lookup table. Each entry encodes 4 unsigned 4-bit magnitudes.

```
Interface:
  decode(uint9 index) → (uint4, uint4, uint4, uint4)  // 4 magnitudes
  // LUT is hardcoded (ROM) — values from iq3s_grid[] in ggml-common.h

Storage: 512 × 32 bits = 2KB (negligible vs 24 Gbit weight ROM)
```

The codebook is constant across all layers and weight matrices — single shared instance.

### 3. DequantUnit (rewritten)

**Current:** INT32 × FP8_E4M3 → BF16 (simplified truncation)
**New:** INT24 × FP32(BF16_d) × (1+2×sub_scale_4bit) → FP32

```
Interface:
  dequantize(int24 accum, uint16 super_scale_bf16, uint4 sub_scale) → fp32

Logic:
  1. int_scale = 1 + 2 × sub_scale          // 5-bit unsigned: 1,3,5,...,31
  2. scaled_accum = accum × int_scale        // INT24 × 5-bit → INT29 (fits INT32)
  3. fp_accum = int_to_fp32(scaled_accum)    // Integer → FP32 conversion (FTZ)
  4. d = bf16_to_fp32(super_scale_bf16)      // BF16 expand (zero-fill lower 16 bits)
  5. result = fp_accum × d                   // FP32 multiply (no subnormals)
  6. return result
```

### 4. RomBank (rewritten)

**Current:** Flat 3-bit array, `uint3[4096×8192]`
**New:** Block-packed IQ3_S format, 110 bytes per 256-weight block

```
IQ3_S block layout (110 bytes = 880 bits for 256 weights):
  Offset  Size     Field
  ──────────────────────────────────────
  0       2        BF16 super-scale (d)
  2       64       qs[64]: codebook indices, low 8 bits
  66      8        qh[8]: codebook indices, high 1 bit (9th bit)
  74      32       signs[32]: 1 sign bit per weight (256 bits)
  106     4        scales[4]: 4-bit sub-scales, packed pairs
  ──────────────────────────────────────
  Total: 110 bytes = 3.4375 bpw

Interface:
  read_block(uint_addr block_addr) → IQ3SBlock
  write_block(uint_addr block_addr, IQ3SBlock data)

  // Convenience accessors:
  get_codebook_index(block, weight_group) → uint9
  get_sign(block, weight_idx) → uint1
  get_sub_scale(block, sub_block_idx) → uint4
  get_super_scale(block) → uint16  // BF16

Addressing:
  block_addr = (row × cols + col) / 256
  weight_group = ((row × cols + col) % 256) / 4
```

### 5. ScaleStore (removed)

Scales are now embedded in ROM blocks. No separate ScaleStore module needed.

### 6. MacArray (rewritten)

Composes: 4× MacPE + RomBank + CodebookDecoder + DequantUnit + FP32 accumulator

```
Interface:
  // Full sub-block MAC (32 weights)
  mac_subblock(uint2 pe_id, uint_addr block_addr, uint4 sub_block_idx,
               int8[32] activations) → void

  // Read dequantized FP32 partial for a sub-block
  read_partial(uint2 pe_id, uint16 super_scale, uint4 sub_scale) → fp32

  // FP32 row accumulator
  accumulate_partial(uint2 pe_id, fp32 partial) → void
  read_row_result(uint2 pe_id) → fp32

  // Control
  clear_pe(uint2 pe_id)
  clear_all()
```

---

## ROM Storage Impact

### Per-Layer (LLaMA 3.1 8B)

| Matrix | Dimensions | Weights | Blocks (×256) | Bytes | Mbit |
|--------|-----------|---------|---------------|-------|------|
| Q | 4096×4096 | 16.8M | 65,536 | 7.2 MB | 57.6 |
| K | 1024×4096 | 4.2M | 16,384 | 1.8 MB | 14.4 |
| V | 1024×4096 | 4.2M | 16,384 | 1.8 MB | 14.4 |
| O | 4096×4096 | 16.8M | 65,536 | 7.2 MB | 57.6 |
| Gate | 14336×4096 | 58.7M | 229,376 | 25.2 MB | 201.8 |
| Up | 14336×4096 | 58.7M | 229,376 | 25.2 MB | 201.8 |
| Down | 4096×14336 | 58.7M | 229,376 | 25.2 MB | 201.8 |

**Per-layer total:** 93.6 MB (749 Mbit)
**32 layers:** 3.0 GB (24.0 Gbit)
**+ Embedding + LM head:** ~3.5 GB total

vs current Q3_K design: ~3.0 GB (24.35 Gbit) — **~15% increase** from 3.0→3.4375 bpw, but scales are now included (previously separate).

### Codebook ROM

512 × 32-bit = 2 KB. Single shared instance. Negligible.

---

## GGUF Integration

### Direct IQ3_S GGUF Loading

Instead of converting Q3_K → our format, we load IQ3_S GGUF files directly:

1. Download `Meta-Llama-3.1-8B-Instruct-IQ3_S.gguf` from HuggingFace
2. Parse `block_iq3_s` structures directly (no conversion needed)
3. Convert FP16 super-scale `d` → BF16 (truncate lower 3 mantissa bits)
4. Codebook indices, signs, sub-scales used as-is

The `block_iq3_s` struct maps directly to our ROM block layout:
```c
typedef struct {
    ggml_half d;                    // → BF16 super-scale
    uint8_t qs[QK_K/4];            // → codebook indices (low 8 bits)
    uint8_t qh[QK_K/32];           // → codebook indices (high 1 bit)
    uint8_t signs[QK_K/8];         // → sign bits
    uint8_t scales[IQ3S_N_SCALE];  // → 4-bit sub-scales
} block_iq3_s;                     // QK_K=256, IQ3S_N_SCALE=4
```

### FP16 → BF16 Super-Scale Conversion

FP16: 1 sign + 5 exponent (bias 15) + 10 mantissa
BF16: 1 sign + 8 exponent (bias 127) + 7 mantissa

Conversion: `bf16_exp = fp16_exp - 15 + 127 = fp16_exp + 112`, truncate mantissa 10→7 bits. No subnormal handling (FTZ).

---

## Validation Plan

### Stage 1c: IQ3_S Quantized Forward Pass

1. Download `Meta-Llama-3.1-8B-Instruct-IQ3_S.gguf`
2. Implement `llama_iq3s_forward.cpp`:
   - Parse `block_iq3_s` directly
   - Use `iq3s_grid[]` codebook from ggml-common.h
   - MAC: (2k+1) × INT8 shift-and-add
   - Dequant: INT24 × FP32(BF16_d) × (1+2×sub4) → FP32
   - FP32 accumulation, no subnormals
3. Compare against tensor_extractor output (llama.cpp IQ3_S reference)
4. Target: cosine > 0.99, argmax MATCH

### Stage 2: HLS Co-simulation (future)

Update Kanagawa modules → Verilator → bit-exact comparison with C model.

---

## Design Decisions

1. **BF16 super-scale** (not FP16): Simpler hardware (8-bit exponent, 7-bit mantissa). Tiny precision loss vs FP16 (3 mantissa bits). Already used in VPU.
2. **INT24 accumulator** (not INT17 or INT32): Minimum for 32-weight sub-blocks is INT17. INT24 provides headroom for up to 128-weight sub-blocks. Saves 8 bits vs INT32.
3. **Block-packed ROM**: Scales co-located with weights. Eliminates separate ScaleStore. Simpler addressing.
4. **No subnormals**: FTZ for all FP32/BF16 paths. Matches common inference accelerator practice.
5. **FP32 post-dequant accumulation**: Matches llama.cpp precision chain. Prevents error accumulation across sub-blocks.
6. **Direct IQ3_S GGUF loading**: No custom quantization tooling needed. Leverage llama.cpp ecosystem.
7. **Shared codebook ROM**: 2KB, single instance. Codebook is constant across all weights.
