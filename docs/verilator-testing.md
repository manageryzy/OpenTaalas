# Verilator Co-Sim Testing

## E2E Layer Test (`test/verilator/test_vl_layer_e2e.cpp`)

~1540 lines. Runs RTL and SystemC models in lockstep at CI dimensions (DIM=64).

### Phase 1: Manual-Sequenced Forward Pass (20 checks)
Walks all 17 FSM states with explicit operation dispatch:
- State 0: Weight programming (7 MACs, gamma, rsqrt/sigmoid LUTs, RoPE tables)
- State 1: RMSNorm pre-attention (sum + rsqrt lookup)
- States 2-4: Q/K/V GEMV projections (INT24 accumulator exact match)
- State 5: RoPE cos/sin table lookups
- State 6: KV cache append + readback
- State 7: Attention dot product scores
- State 8: O projection GEMV
- State 9: Residual add 1 (BF16 add with exponent alignment)
- State 10: RMSNorm pre-MLP
- States 11-12: Gate/Up GEMV projections
- State 13: SwiGLU (sigmoid LUT + two BF16 multiplies)
- State 14: Down projection GEMV
- State 15: Residual add 2 (BF16 add)
- State 16: FSM done check

### Phase 2: FSM-Driven (20 checks)
Verifies FSM orchestration without re-running data operations:
- 16 state transitions (IDLE→DONE)
- is_done flag at state 16
- Saturation (advance beyond 16 stays at 16)
- Reset back to IDLE

### Phase 3: Multi-Token KV Cache (4 checks)
- Write K/V for 2 tokens
- Verify both tokens readable
- Cross-token attention dot products

## Real-Data Layer Test (`test/verilator/test_vl_layer_real_data.cpp`)

Runs layer 0 at full LLaMA 3.1 8B dimensions (DIM=4096, HEADS=32, KV_HEADS=8, FFN_DIM=14336) using real Q3_K weights from a converted GGUF model.

### Data Sources
- **Converted weights**: `models/llama-3.1-8b/converted/` — Q3_K weight/scale/meta files from `gguf_converter`
- **Golden vectors**: `models/llama-3.1-8b/tensors_quantized/` — FP32 intermediate tensors from `llama_quantized_forward`

### Test Stages (16 checks)
1. **RMSNorm pre-attention** — RTL vs SystemC sum exact match
2. **Q/K/V/O projections** — INT8×INT3 MAC in software, single-token attention with GQA broadcast
3. **Residual add post-attention** — RTL vs SystemC exact match
4. **RMSNorm pre-MLP** — RTL vs SystemC sum exact match
5. **Gate/Up projections** — INT8×INT3 MAC in software
6. **SwiGLU compute** — RTL vs SystemC exact match (100%)
7. **Down projection + residual add** — RTL vs SystemC exact match
8. **Cosine similarity diagnostics** — Per-stage cosine vs golden FP32 vectors

### Current Results (16 passed, 0 failed)

| Stage | Cosine vs Golden |
|-------|-----------------|
| norm_pre_attn | 1.000000 |
| Q/K/V projection | 1.000000 |
| attn_out / O projection | 1.000000 |
| Post-attn (BF16 residual) | 0.999996 |
| norm_pre_mlp | 0.999997 |
| gate / up projection | 0.999965 |
| swiglu output | 0.998585 |
| down projection | 0.995683 |
| Post-MLP (BF16 residual) | 0.999701 |

### Error Analysis
RTL vs SystemC is **100% exact match** on all VPU operations. The remaining gap vs golden FP32 comes from:
- **Sigmoid LUT quantization** (99.6% of SwiGLU error) — 256 entries indexed by upper byte of BF16, bin-average initialization halves RMSE
- **BF16 truncating multiply** (0.1% of SwiGLU error) — adding rounding gives negligible improvement
- **BF16 input quantization** (0.3% of SwiGLU error) — inherent to BF16 format

## Individual Co-Sim Tests

19 standalone tests in `test/verilator/test_vl_*.cpp`, one per module:
- mac_pe, rom_bank, scale_store, lut_interp, codebook_decoder, dequant, mac_array
- kv_cache, attention_unit, rmsnorm, swiglu, rope, vector_unit
- layer_tile, embed_rom, lm_head, global_controller, llama_chip
- transformer_layer (per-sub-module pipeline)
