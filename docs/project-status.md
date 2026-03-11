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

### Backend PnR: 12/18 COMPLETE, 7 BLOCKED

All 18 Kanagawa modules have ORFS configs for sky130hd at 250 MHz (4ns clock). 12 modules completed full PnR; 7 are blocked on SRAM macro integration.

#### Completed Modules

| Module | Tier | Area (um²) | fmax (MHz) | Power (mW) | Timing |
|--------|------|-----------|-----------|-----------|--------|
| async_fifo | CDC | 3,794 | 326 | 2.9 | **MET** |
| layer_tile | 4 | 63,481 | 254 | 29.5 | **MET** |
| llama_chip | 4 | 76,899 | 252 | 35.3 | **MET** |
| global_controller | 4 | 95,816 | 244 | 44.2 | -0.09ns |
| scale_store | 2 | 88,127 | 243 | 43.3 | -0.11ns |
| lut_interp | 1 | 317,621 | 227 | 136.9 | -0.41ns |
| codebook_decoder | 1 | 936,451 | 215 | 426.3 | -0.66ns |
| dequant | 1 | 138,904 | 214 | 80.2 | -0.67ns |
| mac_pe | 1 | 84,186 | 138 | 41.4 | -3.23ns |
| attention_unit | 2 | 167,055 | 76 | 93.1 | -9.15ns |
| rmsnorm | 2 | 3,223,470 | 77 | 1586.9 | -9.02ns |
| swiglu | 2 | 368,319 | 47 | 227.5 | -17.5ns |

#### Blocked Modules (Need SRAM Macros)

| Module | Memory | Size |
|--------|--------|------|
| rom_bank | `uint8[112640] _data` | 110 KB |
| mac_array | `uint8[112640] _rom` + `uint32[512] _grid` | 112 KB |
| rope | `uint16[262144] _cos/sin_table` x2 | 1 MB |
| vector_unit | rope tables inherited | 1 MB |
| embed_rom | `uint3[4194304] _embeddings` | 1.5 MB |
| kv_cache | `int8[4194304] _k/v_store` x2 | 8 MB |
| lm_head | `uint3[525336576] _weights` | 189 MB |

These modules contain large behavioral memory arrays (`[[memory]]` annotation in Kanagawa) that Yosys cannot flatten into gates. They need OpenRAM SRAM macros or efabless sky130_sram_macros to replace behavioral RAMs with physical macro instances.

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

1. **OpenRAM SRAM macro integration** — generate sky130hd SRAM macros, create wrapper modules, update ORFS configs
2. **Timing closure** — pipeline insertion for modules with negative slack (mac_pe, attention_unit, rmsnorm, swiglu)
3. **lm_head architecture** — 189 MB weight store likely needs external DRAM interface rather than on-die SRAM

## Architecture

See [file-map.md](file-map.md) for key file locations.
See [verilator-testing.md](verilator-testing.md) for test details.
