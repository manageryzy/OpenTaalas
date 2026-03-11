# OpenTaalas Project Status

## Overview

Open-source LLM inference ASIC targeting sky130hd PDK. Kanagawa HLS → SystemVerilog RTL → Verilator co-simulation verification → OpenROAD synthesis and place-and-route.

## Current State (2026-03-11)

### Hardware Verification: COMPLETE
All RTL modules verified against SystemC reference models with **100% exact match**.

Real-data verification at full LLaMA 3.1 8B dimensions (DIM=4096, HEADS=32, KV_HEADS=8, FFN_DIM=14336) shows high cosine similarity vs FP32 golden:

| Stage | Cosine vs Golden |
|-------|-----------------|
| RMSNorm pre-attention | 1.000000 |
| Q/K/V/O projections | 1.000000 |
| Post-attention residual | 0.999996 |
| Gate/Up projections | 0.999965 |
| SwiGLU activation | 0.998585 |
| Down projection | 0.995683 |
| Post-MLP residual | 0.999701 |

### Backend PnR: 12 GDS + 2–3 GRT + 4 BLOCKED

19 designs configured for ORFS sky130hd at 250 MHz (4ns clock). NOR ROM and SRAM macro collateral integrated via sky130 HAL layer.

#### Completed to GDS (12 logic-only modules)

| Module | Area (um²) | fmax (MHz) | Timing |
|--------|-----------|-----------|--------|
| async_fifo | 3,794 | 326 | **MET** |
| layer_tile | 63,481 | 254 | **MET** |
| llama_chip | 76,899 | 252 | **MET** |
| global_controller | 95,816 | 244 | -0.09ns |
| scale_store | 88,127 | 243 | -0.11ns |
| lut_interp | 317,621 | 227 | -0.41ns |
| codebook_decoder | 936,451 | 215 | -0.66ns |
| dequant | 138,904 | 214 | -0.67ns |
| mac_pe | 84,186 | 138 | -3.23ns |
| attention_unit | 167,055 | 76 | -9.15ns |
| rmsnorm | 3,223,470 | 77 | -9.02ns |
| swiglu | 368,319 | 47 | -17.5ns |

#### Macro-Bearing Designs (NOR ROM integrated)

| Module | Macro(s) | Stage Reached | Blocker |
|--------|----------|---------------|---------|
| mac_array | 1× nor\_rom\_1024x880 | GRT | 880-pin output congestion |
| rom_bank | 1× nor\_rom\_1024x880 | GRT | 880-pin output congestion |
| embed_rom | 16× nor\_rom\_4096x192 | GRT (running) | Congestion TBD |
| rope | 2× nor\_rom\_4096x1024 | Placement | 101K net resizer timeout |

#### Physically Blocked

| Module | Blocker |
|--------|---------|
| vector_unit | 307K line RTL, 101K nets — flat PnR impractical |
| kv_cache | 2048 SRAM tiles — impractical for flat PnR |
| lm_head | 188 MB ROM — physically impossible at sky130 |

See [backend-metrics.md](backend-metrics.md) for full metrics, timing analysis, and lessons learned.

### Test Suite
- **44 E2E checks** at CI dimensions — all passing
- **16 real-data checks** at full LLaMA dims — all passing
- **19 individual** module co-sim tests
- **17 SystemC** reference model unit tests

### Bug Fixes Applied
1. RMSNorm: square BF16 values before accumulation
2. Sigmoid LUT: correct `gate >> 8` indexing (was `>> 7`)
3. SwiGLU: replaced stub with real sigmoid LUT + BF16 multiply
4. GGUF converter: sign absorption into weights, unsigned FP8 bank scales
5. FP8 bank scale normalization: prevents underflow for small tensors
6. Sigmoid LUT values: bin-average initialization halves RMSE

### Remaining Accuracy Limits
The ~0.14% SwiGLU error vs FP32 is inherent to the 256-entry sigmoid LUT. Error decomposition shows:
- Sigmoid LUT quantization: 99.6% of total error
- BF16 multiply truncation: 0.1% — rounding adds negligible improvement
- BF16 input quantization: 0.3% — inherent to format

Further improvement requires more LUT entries or piecewise-linear interpolation (hardware change).

## Next Steps

1. **Timing closure** — pipeline insertion for modules with severe negative slack (swiglu -17.5ns, rmsnorm -9.0ns, attention_unit -9.2ns)
2. **Pin multiplexing** — serialize 880-pin NOR ROM output to reduce routing congestion for mac_array/rom_bank
3. **Hierarchical PnR** — partition vector_unit for tractable place-and-route
4. **lm_head architecture** — 188 MB weight store needs external DRAM interface, not on-die ROM

## Architecture

See [file-map.md](file-map.md) for key file locations.
See [verilator-testing.md](verilator-testing.md) for test details.
