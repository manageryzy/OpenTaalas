# OpenTaalas Project Status

## Overview

Open-source LLM inference ASIC targeting sky130hd PDK. Kanagawa HLS → SystemVerilog RTL → Verilator co-simulation verification → OpenROAD synthesis and place-and-route.

## Current State (2026-03-19)

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

### Backend PnR: 19 routed through DRT (12 logic-only + 7 macro-bearing)

19 designs configured for ORFS sky130hd at 250 MHz (4ns clock). NOR ROM and SRAM macro collateral integrated via sky130 HAL layer. Density improvement via NOR ROM folding reduced total macro-bearing die area from 96.6 mm² to 57.0 mm² (**41% reduction**).

#### Completed through DRT — Logic-Only (12 designs)

| Module | Area (µm²) | fmax (MHz) | Timing |
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

#### Completed through DRT — Macro-Bearing (7 designs)

| Module | Macro(s) | Die (µm) | Util | DRC | WNS (ns) | fmax (MHz) |
|--------|----------|----------|------|-----|----------|-----------|
| rom_bank | 1× nor_rom_1024x880 | 2400×2400 | 60% | **0** | -2.35 | 157 |
| mac_array | 1× nor_rom_1024x880 | 2500×3000 | 35% | 641 | -3.88 | 127 |
| rope | 2× nor_rom_4096x1024 | 2000×3500 | 76% | 1,029 | -4.56 | 69 |
| embed_rom | 1× nor_rom_65536x192_phys | 3200×3200 | 38% | 103 | -9.06 | 77 |
| vector_unit | 2× nor_rom_4096x1024 | 4000×5500 | 55% | 488 | -17.68 | 43 |
| kv_cache_demo | 8× sram_4096x8 | 1200×5000 | 18% | **0** | -0.25 | 235 |
| lm_head_demo | 1× nor_rom_65536x192_phys | 3200×3200 | 39% | **0** | -9.80 | 61 |

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

1. **Timing closure** — pipeline insertion for modules with severe negative slack (swiglu -17.5ns, vector_unit -17.7ns, rmsnorm -9.0ns, attention_unit -9.2ns)
2. **DRC cleanup** — rope (1,029), mac_array (641), vector_unit (488), embed_rom (103) have remaining DRT violations
3. **Hierarchical PnR** — partition vector_unit for tractable routing (791K cells, 488 DRC at 55% util)
4. **lm_head architecture** — 188 MB weight store needs external DRAM interface, not on-die ROM

## Architecture

See [file-map.md](file-map.md) for key file locations.
See [verilator-testing.md](verilator-testing.md) for test details.
