# Transformer Layer End-to-End Verification Design

## Goal

Verify that the Kanagawa HLS-generated RTL for one complete transformer layer produces correct results by running the Verilator RTL model and SystemC reference models in lockstep, comparing outputs at every stage boundary.

## Architecture

A single new test file `test/verilator/test_vl_layer_e2e.cpp` instantiates both:

- **Verilator RTL model** (`Vtransformer_layer_wrapper`) — the structural SV wrapper composing 7 mac_arrays, vector_unit, kv_cache, attention_unit, and layer_tile
- **SystemC C++ reference models** — `MacArray`×7, `vector_unit<>`, `KvCache<8,4,16>`, `AttentionUnit`, `layer_tile`

Both models are programmed with identical deterministic weights from `generate_deterministic_weights(42)` (IQ3_S codebooks, ROM blocks, gamma, rsqrt/sigmoid LUTs, RoPE sin/cos tables).

CI dimensions: DIM=64, HEADS=4, HEAD_DIM=16, FFN_DIM=172, SEQ_LEN=8.

## Data Flow — 17-State Forward Pass

| State | Operation | RTL sub-modules | SystemC models |
|-------|-----------|-----------------|----------------|
| 0 IDLE | Program weights, LUTs, tables | all mac_arrays, vpu, kvc | MacArray×7, vector_unit, KvCache |
| 1 RMSNORM_PRE_ATTN | x² accumulate, rsqrt LUT, gamma multiply | vpu | vector_unit |
| 2 ATTN_Q_PROJ | GEMV: norm_x × W_q → q_vec | mac_q | MacArray |
| 3 ATTN_K_PROJ | GEMV: norm_x × W_k → k_vec | mac_k | MacArray |
| 4 ATTN_V_PROJ | GEMV: norm_x × W_v → v_vec | mac_v | MacArray |
| 5 ROPE_APPLY | Rotate q, k by position embeddings | vpu | vector_unit |
| 6 KV_CACHE_APPEND | Store k, v at current position | kv_cache | KvCache |
| 7 ATTN_COMPUTE | QK dot → scores, score × V → attn_out | attn, kv_cache | AttentionUnit, KvCache |
| 8 ATTN_O_PROJ | GEMV: attn_out × W_o → o_vec | mac_o | MacArray |
| 9 RESIDUAL_ADD_1 | output = input + o_vec | vpu | vector_unit |
| 10 RMSNORM_PRE_MLP | RMSNorm with pre-MLP gamma | vpu | vector_unit |
| 11 MLP_GATE_PROJ | GEMV: norm × W_gate → gate_vec | mac_gate | MacArray |
| 12 MLP_UP_PROJ | GEMV: norm × W_up → up_vec | mac_up | MacArray |
| 13 SWIGLU | SiLU(gate) × up → swiglu_vec | vpu | vector_unit |
| 14 MLP_DOWN_PROJ | GEMV: swiglu × W_down → down_vec | mac_down | MacArray |
| 15 RESIDUAL_ADD_2 | output = residual_1 + down_vec | vpu | vector_unit |
| 16 DONE | Compare final output vectors | — | — |

## GEMV Mechanics

All 7 MAC projections follow the same IQ3_S pattern:

1. Program codebook (512 entries) and ROM blocks (110 bytes/256 weights)
2. For each output row group (4 rows at a time via 4 PEs):
   - Clear PE accumulators
   - For each input element: decode codebook → magnitudes/signs → `mac_step`
   - Read INT24 accumulators → dequantize → FP32 accumulate
3. Convert FP32 → BF16 output vector
4. Compare RTL vs SystemC

A single parameterized GEMV helper handles all 7 projections.

## Comparison Strategy

Three tiers:

1. **Exact match** — INT24 MAC accumulators, INT8 KV cache entries, INT32 attention scores, FSM state. Pure integer, no rounding.
2. **BF16 ±1 ULP** — RMSNorm output, RoPE vectors, residual adds, dequantized BF16 values. Compare raw bit patterns: `abs(rtl_bits - ref_bits) <= 1`.
3. **FP32 relative 1e-5** — FP32 accumulators (intermediate dequant sums before BF16 conversion).

Per-stage reporting: `[STATE N] stage_name: PASS (max_err=X)` or `FAIL (element[i]: rtl=0xABCD ref=0x1234)` with full vector dump on failure.

## Test Phases

**Phase 0: Setup** — Instantiate both models, program identical weights, generate seeded input activation vector.

**Phase 1: Manual-sequenced forward pass** — Walk states 1–16, execute operations on both models, compare at each boundary. Proves data correctness.

**Phase 2: FSM-driven forward pass** — Same pass, but testbench reads `layer_tile.get_state()` from RTL to decide which operations to dispatch. Calls `advance_state()` on both. Proves orchestration correctness.

**Phase 3: Multi-token sequence (2 tokens)** — Run forward pass twice with different activations. Token 2's attention dots against both cached K/V entries. Proves KV cache accumulation across tokens.

## Build Integration

Changes to `test/verilator/CMakeLists.txt`:

- New target `test_vl_layer_e2e`
- Links `opentaalas_model` (INTERFACE — adds include paths for ac_int, bf16_math.h, SystemC model headers)
- Same `verilate()` call as existing transformer layer test
- Guard: `VERILATOR_FOUND AND SYSTEMC_FOUND AND AC_TYPES_FOUND`
- Timeout: 300 seconds
- CTest labels: `verilator,e2e`

Existing `test_vl_transformer_layer` unchanged. No changes to SystemC models or RTL wrapper.

## Files

- Create: `test/verilator/test_vl_layer_e2e.cpp`
- Modify: `test/verilator/CMakeLists.txt` (add new target)
