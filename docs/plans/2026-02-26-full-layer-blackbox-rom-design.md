# Full Transformer Layer with Blackbox ROM — Design

## Goal

Compose a full LLaMA transformer layer in Kanagawa by instantiating existing
sub-modules, generate SV blackbox ROMs with baked-in weights, and verify the
composed layer against the SystemC reference model via Verilator.

## Component 1: Composed Transformer Layer (`rtl/kanagawa/transformer_layer.k`)

A single Kanagawa class that instantiates and wires together all sub-modules
needed for one transformer layer:

```
transformer_layer
├── _rmsnorm_attn    (rmsnorm_unit)     — pre-attention RMSNorm
├── _mac_q           (mac_array)        — Q projection GEMV
├── _mac_k           (mac_array)        — K projection GEMV
├── _mac_v           (mac_array)        — V projection GEMV
├── _rope            (rope_unit)        — rotary position embeddings
├── _kv_cache        (kv_cache)         — K/V circular buffer
├── _attention       (attention_unit)   — QK dot product + score tracking
├── _mac_o           (mac_array)        — O projection GEMV
├── _rmsnorm_mlp     (rmsnorm_unit)     — pre-MLP RMSNorm
├── _mac_gate        (mac_array)        — gate projection GEMV
├── _mac_up          (mac_array)        — up projection GEMV
├── _swiglu          (swiglu_unit)      — SiLU(gate) × up activation
├── _mac_down        (mac_array)        — down projection GEMV
└── _fsm             (layer_tile)       — FSM controller
```

### Public Interface

Weight loading (delegates to sub-module methods):
- `write_q_rom_byte(block_addr, byte_offset, value)` (and k/v/o/gate/up/down)
- `write_q_grid_entry(index, value)` (codebook per mac_array)
- `set_attn_gamma(index, value)` / `set_mlp_gamma(index, value)`
- `set_rope_sin(pos, dim, value)` / `set_rope_cos(pos, dim, value)`

Compute:
- `forward_step()` — advance one FSM step of the layer pipeline
- `set_input(dim_idx, value)` — load input activation vector
- `get_output(dim_idx)` — read output activation vector
- `get_state()` / `is_done()` — FSM status

Control:
- `reset()` — reset all sub-modules
- `set_layer_id(id)` — configure layer index (for RoPE position offset)

### Dataflow (per token)

1. Input activation vector (BF16, dim=4096) loaded via `set_input()`
2. Pre-attention RMSNorm: `_rmsnorm_attn` normalizes input
3. Q/K/V projections: `_mac_q/k/v` GEMV with IQ3_S weights → dequant → BF16
4. RoPE: `_rope` rotates Q and K vectors
5. KV cache: `_kv_cache` stores K/V for current position
6. Attention: `_attention` computes QK scores, weighted V sum
7. O projection: `_mac_o` GEMV → dequant → BF16
8. Residual add: output += input
9. Pre-MLP RMSNorm: `_rmsnorm_mlp` normalizes
10. Gate/Up projections: `_mac_gate/up` GEMV → dequant → BF16
11. SwiGLU: `_swiglu` computes SiLU(gate) × up
12. Down projection: `_mac_down` GEMV → dequant → BF16
13. Residual add: output += pre-MLP input
14. Output available via `get_output()`

## Component 2: ROM Blackbox Generator (`tools/rom_generator.cpp`)

C++ tool that produces SV modules with pre-initialized memory.

### Output Format

For each mac_array ROM, generates a SV file:

```systemverilog
// Auto-generated blackbox ROM for Q projection weights
module KanagawaHALDualPortRAM #(same params as mock) (same ports);
  reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
  initial begin
    mem[0] = 8'hXX;
    mem[1] = 8'hXX;
    // ...
  end
  // Standard read/write logic (same as mock HAL)
endmodule
```

### Weight Sources

1. **Deterministic generator** (for CI): Creates reproducible IQ3_S weight
   patterns using a seeded PRNG. Small dimensions (DIM=64, HEADS=4) to keep
   sim time under 30s.

2. **GGUF import** (for validation): Reads gguf_converter output and packs
   into ROM format. Full LLaMA 3.1 8B dimensions.

### Generated Files

Per transformer layer instance:
- `rom_q_weights.sv`, `rom_k_weights.sv`, ... (7 mac_array weight ROMs)
- `rom_q_codebook.sv`, ... (7 codebook ROMs)
- `rom_attn_gamma.sv`, `rom_mlp_gamma.sv` (RMSNorm gamma tables)
- `rom_rope_sin.sv`, `rom_rope_cos.sv` (RoPE tables)
- `rom_rsqrt_lut.sv` (shared rsqrt LUT)

## Component 3: Full Layer Verilator Test

### Test Structure

```
test/verilator/
  test_vl_transformer_layer.cpp   — main test driver
  gen/                            — generated blackbox ROM SVs (gitignored)
```

### Test Flow

1. ROM generator produces SV blackbox files with deterministic weights
2. CMake wires generated ROMs into Verilator build (replacing mock HAL)
3. Test loads same weights into SystemC reference model
4. Both run identical forward pass on same input vector
5. Compare outputs at each pipeline stage

### Dimensions for CI

- DIM = 64 (hidden dimension)
- HEADS = 4 (attention heads)
- HEAD_DIM = 16
- KV_DIM = 64
- FFN_DIM = 172 (≈ 2.7× hidden, rounded to multiple of 4)
- SEQ_LEN = 8 (context length)
- VOCAB = 256 (for embed/lm_head, not used in layer test)

### Comparison

- Integer MAC accumulators: bit-exact match
- BF16 outputs: bit-exact match (same rounding)
- FP32 dequant: bit-exact match (deterministic path)

## Implementation Order

1. **transformer_layer.k** — Kanagawa composed module
2. **rom_generator.cpp** — SV blackbox ROM generator + deterministic weight gen
3. **CMake integration** — ROM generation target + Verilator test wiring
4. **SystemC composed layer** — matching reference model (or reuse existing)
5. **test_vl_transformer_layer.cpp** — Verilator test driver
6. **Verify** — all tests pass, full suite green

## Success Criteria

- `transformer_layer.k` compiles and generates valid SV via Kanagawa
- ROM generator produces valid SV blackbox modules
- Verilator test passes with deterministic weights
- Full CTest suite (59 existing + new) passes
- Sim time for layer test < 60s
