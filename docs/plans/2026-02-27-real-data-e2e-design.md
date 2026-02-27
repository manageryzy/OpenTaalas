# Real-Data End-to-End Layer Verification Design

## Goal

Fix RTL stubs and run one complete transformer layer (layer 0) at full LLaMA 3.1 8B dimensions (DIM=4096, HEADS=32, HEAD_DIM=128) using real Q3_K_S weights, comparing against both SystemC lockstep and golden reference tensors.

## Part 1: Fix 3 RTL Stubs

In `rtl/kanagawa/vector_unit.k`:

| Operation | Current (stub) | Fix |
|-----------|---------------|-----|
| `residual_add` | returns `a_bf16` | BF16 add: unpack to FP32, add, repack |
| `swiglu_compute` | returns `gate_bf16` | `sigmoid_lut[gate>>8] × gate × up` |
| `dequantize` | broken FP8 expansion | `accum × (1+2×sub_scale) × super_scale` |

After fixing, regenerate RTL and update existing e2e test to compare against real math.

## Part 2: Real-Data Test

New file: `test/verilator/test_vl_layer_real_data.cpp`

### Weight Loading

From `models/llama-3.1-8b/converted/`:
- 7 projections: `blk_0_attn_{q,k,v,output}_weight.*`, `blk_0_ffn_{gate,up,down}_weight.*`
- 2 norms: `blk_0_attn_norm_weight.float.bin`, `blk_0_ffn_norm_weight.float.bin`
- Uses existing `gguf_converter.h::load_converted_tensor()`

### Golden Vectors

From `models/llama-3.1-8b/tensors_quantized/`:
- Input: `embed_out.bin` (4096 × FP32)
- Post-attention: `layer0_post_attn.bin` (4096 × FP32)
- Post-MLP: `layer0_post_mlp.bin` (4096 × FP32)

### Comparison Strategy

- Tier 1: RTL vs SystemC lockstep (exact INT24, ±1 ULP BF16)
- Tier 2: RTL vs golden FP32 vectors (relative tolerance ~1e-3)

### Build Integration

- Target: `test_vl_layer_real_data`
- Guard: `VERILATOR_FOUND AND SYSTEMC_FOUND AND AC_TYPES_FOUND`
- Skip gracefully if `models/llama-3.1-8b/converted/` absent
- Timeout: 600s
- Labels: `verilator`, `e2e`, `real-data`
