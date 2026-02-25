# Validation Pipeline Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Validate our SystemC C model against llama.cpp with a real LLaMA 3.1 8B Q3_K_S GGUF, then validate HLS against C model.

**Architecture:** Two-stage pipeline. Stage 1: GGUF weight converter + C model forward pass + llama.cpp tensor extraction + comparison tool. Stage 2 (deferred): Verilator HLS co-simulation.

**Tech Stack:** C++17, SystemC, ac_int, llama.cpp (submodule), GGUF format

---

### Task 1: Add llama.cpp as third-party submodule

**Files:**
- Modify: `.gitmodules`
- Create: `third-party/llama.cpp/` (submodule)
- Modify: `CMakeLists.txt` (add llama.cpp build)
- Create: `tools/CMakeLists.txt`

**Step 1: Add submodule**

```bash
cd /home/mana/workspace/OpenTaalas
git submodule add https://github.com/ggml-org/llama.cpp.git third-party/llama.cpp
```

**Step 2: Create tools/CMakeLists.txt**

```cmake
# tools/CMakeLists.txt — Validation pipeline tools
# Populated by subsequent tasks
```

**Step 3: Update top-level CMakeLists.txt**

Add after the `add_subdirectory(model)` block:

```cmake
if(SYSTEMC_FOUND AND AC_TYPES_FOUND)
  add_subdirectory(tools)
endif()
```

**Step 4: Verify cmake configures**

```bash
cmake -B build 2>&1 | grep -E "llama|tools"
```

**Step 5: Commit**

```bash
git add -A && git commit -m "feat: add llama.cpp submodule and tools/ directory"
```

---

### Task 2: Implement BF16 arithmetic library

**Files:**
- Create: `model/systemc/src/bf16_math.h`
- Create: `test/systemc/test_bf16_math.cpp`
- Modify: `test/systemc/CMakeLists.txt` (add test_bf16_math)

**Step 1: Write test_bf16_math.cpp**

Test cases:
- `bf16_from_float(1.0f)` → `0x3F80`
- `bf16_from_float(-1.0f)` → `0xBF80`
- `bf16_from_float(0.0f)` → `0x0000`
- `bf16_to_float(0x3F80)` → `1.0f`
- `bf16_to_float(0x4000)` → `2.0f`
- `bf16_add(1.0, 2.0)` → `3.0`
- `bf16_add(1.0, -1.0)` → `0.0`
- `bf16_mul(2.0, 3.0)` → `6.0`
- `bf16_mul(-2.0, 3.0)` → `-6.0`
- `bf16_mul(0.0, 5.0)` → `0.0`

**Step 2: Run test to verify it fails**

```bash
cmake --build build --target test_bf16_math 2>&1
```

Expected: compilation error (bf16_math.h doesn't exist)

**Step 3: Implement bf16_math.h**

```cpp
#pragma once
#include <opentaalas/types.h>
#include <cstring>
#include <cmath>

namespace opentaalas {

// BF16 ↔ float conversion via bit manipulation
inline uint16 bf16_from_float(float f) {
  uint32_t bits;
  std::memcpy(&bits, &f, 4);
  return uint16(static_cast<uint16_t>(bits >> 16));
}

inline float bf16_to_float(uint16 bf16) {
  uint32_t bits = static_cast<uint32_t>(bf16.to_uint64()) << 16;
  float f;
  std::memcpy(&f, &bits, 4);
  return f;
}

// BF16 arithmetic: unpack → FP32 op → repack
inline uint16 bf16_add(uint16 a, uint16 b) {
  return bf16_from_float(bf16_to_float(a) + bf16_to_float(b));
}

inline uint16 bf16_mul(uint16 a, uint16 b) {
  return bf16_from_float(bf16_to_float(a) * bf16_to_float(b));
}

inline uint16 bf16_neg(uint16 a) {
  return uint16(a.to_uint64() ^ 0x8000);
}

inline uint16 bf16_rsqrt(uint16 a) {
  float v = bf16_to_float(a);
  return bf16_from_float(1.0f / std::sqrt(v));
}

} // namespace opentaalas
```

**Step 4: Add to test CMakeLists.txt**

Add `bf16_math` to `_systemc_modules` list in `test/systemc/CMakeLists.txt`.

**Step 5: Build and run**

```bash
cmake --build build --target test_bf16_math && ./build/test/systemc/test_bf16_math
```

**Step 6: Commit**

```bash
git add -A && git commit -m "feat: add BF16 arithmetic library with tests"
```

---

### Task 3: Upgrade model stubs to real BF16 arithmetic

**Files:**
- Modify: `model/systemc/src/swiglu.h` (lines 19-30)
- Modify: `model/systemc/src/rope.h` (lines 32-35)
- Modify: `model/systemc/src/rmsnorm.h` (line 29 — fix missing return)
- Modify: `model/systemc/src/vector_unit.h` (lines 86-89, 93-106, 110)
- Modify: `test/systemc/test_swiglu.cpp`
- Modify: `test/systemc/test_rope.cpp`
- Modify: `test/systemc/test_vector_unit.cpp`

**Step 1: Fix rmsnorm.h bug**

Line 29: `uint16 lookup_rsqrt(uint8 index) const { _rsqrt_lut[...]; }` → add `return`.

**Step 2: Upgrade swiglu.h**

Replace `compute_silu` and `compute_swiglu` with real BF16 math:
- `compute_silu(gate)`: sigmoid = LUT[gate>>8], return bf16_mul(gate, sigmoid)
- `compute_swiglu(gate, up)`: return bf16_mul(compute_silu(gate), up)

**Step 3: Upgrade rope.h**

Replace `rotate_pair` with real rotation:
```cpp
uint16 rotate_pair(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) {
  // x_even * cos - x_odd * sin
  return bf16_add(bf16_mul(x_even, cos_val), bf16_neg(bf16_mul(x_odd, sin_val)));
}
```

Note: this returns the even component. The odd component (x_even*sin + x_odd*cos) needs a second method or the caller computes it.

**Step 4: Upgrade vector_unit.h**

- `swiglu_compute`: use real sigmoid LUT + bf16_mul
- `residual_add`: use bf16_add
- `dequantize`: already implemented, keep as-is

**Step 5: Update tests to verify real arithmetic**

- test_swiglu: populate sigmoid LUT with known values, verify compute_silu and compute_swiglu produce correct BF16 results
- test_rope: set cos/sin to known BF16 values, verify rotate_pair computes x*cos - y*sin
- test_vector_unit: verify swiglu_compute and residual_add produce correct results

**Step 6: Build and run all SystemC tests**

```bash
cmake --build build && ctest --test-dir build -L systemc -V
```

All 17 + bf16_math = 18 tests must pass.

**Step 7: Commit**

```bash
git add -A && git commit -m "feat: upgrade model stubs to real BF16 arithmetic"
```

---

### Task 4: Implement GGUF weight converter

**Files:**
- Create: `tools/gguf_converter.h`
- Create: `tools/gguf_converter_main.cpp`
- Create: `test/systemc/test_gguf_converter.cpp`
- Modify: `tools/CMakeLists.txt`

**Step 1: Write test for weight conversion logic**

Test the Q3_K → our format conversion with a synthetic Q3_K block:
- Create a known 256-weight Q3_K block with known scale
- Convert to our INT3 + FP8 E4M3 format
- Verify weight values and scale conversion

**Step 2: Implement gguf_converter.h**

Key functions:
- `fp16_to_fp8_e4m3(uint16_t fp16) → uint8_t`: lossy FP16 → FP8 E4M3 scale conversion
- `q3k_block_to_our_format(const block_q3_K& block, ...)`: per-block conversion
- `convert_gguf(const char* gguf_path, const char* output_path)`: full file conversion

Uses llama.cpp's `ggml.h` for GGUF parsing and `block_q3_K` struct definition.

**Step 3: Implement gguf_converter_main.cpp**

CLI: `./gguf_converter input.gguf output_dir/`

Outputs per-tensor binary files:
- `token_embd.weights.bin` (flat uint3)
- `token_embd.scales.bin` (FP8 bank + FP32 tensor)
- `blk.0.attn_q.weights.bin`, etc.

**Step 4: Add to tools/CMakeLists.txt**

```cmake
add_executable(gguf_converter gguf_converter_main.cpp)
target_link_libraries(gguf_converter PRIVATE opentaalas_model)
target_include_directories(gguf_converter PRIVATE
  ${CMAKE_SOURCE_DIR}/third-party/llama.cpp/ggml/include)
```

**Step 5: Build and test with synthetic data**

```bash
cmake --build build --target gguf_converter test_gguf_converter
./build/test/systemc/test_gguf_converter
```

**Step 6: Commit**

```bash
git add -A && git commit -m "feat: add GGUF Q3_K weight converter"
```

---

### Task 5: Implement C model forward pass runner

**Files:**
- Create: `tools/cmodel_runner.h` (forward pass logic)
- Create: `tools/cmodel_runner_main.cpp` (CLI)
- Create: `tools/tensor_io.h` (tensor dump/load utilities)
- Modify: `tools/CMakeLists.txt`

**Step 1: Implement tensor_io.h**

Utilities for writing/reading tensor dumps:
- `write_tensor(path, data, shape, dtype)`: write flat binary + metadata
- `read_tensor(path) → vector<float>`: read back
- `write_manifest(dir, entries)`: write manifest.json

**Step 2: Implement cmodel_runner.h**

Class `CModelRunner` that:
- Loads converted weights into model hierarchy (EmbedRom, 32× MacArray for each projection, VectorUnit, KvCache, AttentionUnit, LmHead)
- Runs forward pass for a single token
- Dumps intermediate tensors at layer boundaries

Key method: `run_single_token(uint32_t token_id, const std::string& output_dir)`

Forward pass sequence (from design doc):
1. Embed lookup → dequant → BF16 vector
2. Per-layer: RMSNorm → Q/K/V proj → RoPE → KV cache → attention → O proj → residual → RMSNorm → gate/up proj → SwiGLU → down proj → residual
3. Final RMSNorm → LM head → argmax

**Step 3: Implement cmodel_runner_main.cpp**

CLI: `./cmodel_runner --weights converted_dir/ --token 1234 --output tensors/`

**Step 4: Build**

```bash
cmake --build build --target cmodel_runner
```

**Step 5: Test with small synthetic weights**

Create a small test that loads tiny weights (VOCAB=8, DIM=4) and runs one token through the pipeline. Verify tensor dumps are written.

**Step 6: Commit**

```bash
git add -A && git commit -m "feat: add C model forward pass runner with tensor dumping"
```

---

### Task 6: Implement llama.cpp tensor extractor

**Files:**
- Create: `tools/tensor_extractor.cpp`
- Modify: `tools/CMakeLists.txt`

**Step 1: Implement tensor_extractor.cpp**

Uses llama.cpp's C API:
- `llama_model_load()` to load GGUF
- `llama_decode()` to run inference
- Hook into `ggml_backend_tensor_get()` to extract intermediate tensors
- Alternative: use `llama_get_embeddings()` for final hidden state, and `ggml_graph_get_tensor()` for intermediates

Extraction points: embed_out, per-layer post_norm/post_attn/post_mlp, final_norm, logits.

**Step 2: Add to tools/CMakeLists.txt**

```cmake
add_executable(tensor_extractor tensor_extractor.cpp)
target_link_libraries(tensor_extractor PRIVATE llama ggml)
target_include_directories(tensor_extractor PRIVATE
  ${CMAKE_SOURCE_DIR}/third-party/llama.cpp/include
  ${CMAKE_SOURCE_DIR}/third-party/llama.cpp/ggml/include)
```

**Step 3: Build**

```bash
cmake --build build --target tensor_extractor
```

**Step 4: Commit**

```bash
git add -A && git commit -m "feat: add llama.cpp tensor extractor"
```

---

### Task 7: Implement comparison tool

**Files:**
- Create: `tools/compare_tensors.cpp`
- Modify: `tools/CMakeLists.txt`

**Step 1: Implement compare_tensors.cpp**

CLI: `./compare_tensors --ref tensors_llamacpp/ --test tensors_cmodel/`

For each matching tensor pair:
- Compute max absolute error
- Compute mean absolute error
- Compute cosine similarity
- Report PASS/FAIL per tolerance tier

Output example:
```
embed_out:       max_abs=0.0012  mean_abs=0.0003  cosine=0.9998  PASS
layer_00_post_norm: max_abs=0.0015  mean_abs=0.0004  cosine=0.9997  PASS
...
logits:          argmax_match=YES  token=3681("Paris")  PASS
```

**Step 2: Build and test with synthetic data**

Create two identical tensor directories, verify all-zero errors. Then perturb one, verify error detection.

**Step 3: Commit**

```bash
git add -A && git commit -m "feat: add tensor comparison tool"
```

---

### Task 8: Download GGUF and run Stage 1 validation

**Files:**
- Create: `models/.gitignore` (ignore *.gguf and converted weights)
- Create: `scripts/run_validation.sh`

**Step 1: Download LLaMA 3.1 8B Q3_K_S GGUF**

```bash
mkdir -p models/llama-3.1-8b
# Download from HuggingFace (bartowski or similar)
huggingface-cli download bartowski/Meta-Llama-3.1-8B-Instruct-GGUF \
  Meta-Llama-3.1-8B-Instruct-Q3_K_S.gguf \
  --local-dir models/llama-3.1-8b/
```

**Step 2: Convert weights**

```bash
./build/tools/gguf_converter \
  models/llama-3.1-8b/Meta-Llama-3.1-8B-Instruct-Q3_K_S.gguf \
  models/llama-3.1-8b/converted/
```

**Step 3: Extract llama.cpp reference tensors**

```bash
./build/tools/tensor_extractor \
  --model models/llama-3.1-8b/Meta-Llama-3.1-8B-Instruct-Q3_K_S.gguf \
  --prompt "The capital of France is" \
  --output models/llama-3.1-8b/tensors_ref/
```

**Step 4: Run C model forward pass**

```bash
./build/tools/cmodel_runner \
  --weights models/llama-3.1-8b/converted/ \
  --token <first_token_id> \
  --output models/llama-3.1-8b/tensors_cmodel/
```

**Step 5: Compare**

```bash
./build/tools/compare_tensors \
  --ref models/llama-3.1-8b/tensors_ref/ \
  --test models/llama-3.1-8b/tensors_cmodel/
```

**Step 6: Create run_validation.sh wrapping steps 2-5**

**Step 7: Commit**

```bash
git add -A && git commit -m "feat: add validation script and model directory"
```

---

### Success Criteria

- **Task 2:** bf16_math tests pass (conversions and arithmetic)
- **Task 3:** All 18 SystemC tests pass with real BF16 math
- **Task 4:** GGUF converter produces valid weight files
- **Task 5:** C model runner produces tensor dumps
- **Task 7:** Comparison tool reports metrics correctly
- **Task 8:** Functional — same predicted token. Numerical — cosine similarity > 0.99 per layer.
