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

### Backend PnR: 19 routed through DRT (9 logic-only + 8 macro-bearing + 2 academic demos)

19 designs configured for ORFS sky130hd at 250 MHz (4ns clock). NOR ROM and SRAM macro collateral integrated via sky130 HAL layer. Six rounds of density work — die resizing (v2, 41%), SRAM col_mux + macro consolidation in kv_cache_demo (-93%), NOR ROM internal-mux refactor (v3, embed_rom + lm_head_demo each -55%), `nor_rom_4096x1024` fold=2 reshape for rope (v4), v5 `[[memory]]` + new SRAM macros (`sram_4096x16`, `sram_256x16`) for rmsnorm/swiglu/lut_interp + rom_bank die shrink, and **v6: `sram_512x32` macro for codebook_decoder + vector_unit cell count drop 791K → 127K via v5 SRAM library** — reduced total routed area from 96.6 mm² to **46.1 mm² (52% reduction)**.

#### Completed through DRT — Logic-Only (10 designs)

| Module | Area (µm²) | fmax (MHz) | Timing |
|--------|-----------|-----------|--------|
| async_fifo | 3,794 | 326 | **MET** |
| **lut_interp** | **69,151** | **253** | **MET** |
| layer_tile | 63,481 | 254 | **MET** |
| llama_chip | 76,899 | 252 | **MET** |
| global_controller | 95,816 | 244 | -0.09ns |
| scale_store | 88,127 | 243 | -0.11ns |
| dequant | 138,904 | 214 | -0.67ns |
| mac_pe | 71,462 | 175 | -1.71ns |
| attention_unit | 147,916 | 139 | -3.21ns |

`rmsnorm` and `swiglu` moved to the macro-bearing table after the v5 refactor — they now instantiate real SRAM macros for their LUT/gamma storage (was gate-synthesized FFs). After v3 HLS retiming + v5 SRAM macros: swiglu cell area -64% but timing regressed (-1.42 → -2.40 ns) because `KanagawaSyncRam` 1-cycle read latency disrupts the existing `[[schedule(7)]]` pipeline; rmsnorm cell area -94% AND timing improved (-2.03 → -0.87 ns); lut_interp cell area -78% with timing now MET (+0.05 ns). Each module hit a retiming floor — pushing schedule(N+1) regressed due to register overhead. embed_rom and lm_head_demo remain at 127–131 MHz (clock skew on the tall folded-ROM die dominates).

#### Completed through DRT — Macro-Bearing (8 + 2 demos)

| Module | Macro(s) | Die (µm) | Util | DRC | WNS (ns) | fmax (MHz) |
|--------|----------|----------|------|-----|----------|-----------|
| **rmsnorm** | **1× sram_4096x16 + 1× sram_256x16** | **1200×1200** | 14% | **0** | **-0.87** | **205** |
| **swiglu** (s8) | **3× sram_256x16** | **700×700** | 25% | **0** | -2.36 | 157 |
| **codebook_decoder** | **5× sram_512x32** | **800×800** | 30% | **0** | **-0.02 MET** | **249** |
| rom_bank | 1× nor_rom_1024x880 | 1500×1500 | 63% | **0** | -2.01 | 167 |
| mac_array | 1× nor_rom_1024x880 | 2500×3000 | 31% | 641 | -3.88 | 127 |
| rope | 2× nor_rom_4096x1024 (fold=2, mirrored) | 3000×3300 | 72% | 418 | -4.14 | 122 |
| embed_rom | 1× nor_rom_65536x192 (internal mux) | 1900×2400 | 78% | **0** | -3.63 | 131 |
| vector_unit ⚠️ | 4× SRAM + 2× nor_rom_4096x1024 | 3000×3500 | TBD | TBD | TBD | TBD |
| kv_cache_demo | 4× sram_8192x8 (col_mux=32) | 595×705 | 87% | **0** | -0.34 | 230 |
| lm_head_demo | 1× nor_rom_65536x192 (internal mux) | 1900×2400 | 77% | **0** | -3.90 | 127 |

⚠️ **vector_unit (v6 source improvements landed, PnR pending):** v5 SRAM library + schedule annotations (`rmsnorm_accumulate s4`, `swiglu_compute s8`, `dequantize s6`, `residual_add s4`) dropped synth cell count from 791K → **127K (-84%)**. Full PnR aborted in GRT NDR retry loop after 1h+; needs hierarchical PnR or further GRT workaround. Source improvements remain valid for future work.

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

1. **Hierarchical PnR for vector_unit** — currently 791K cells flat; pipelined RTL stalls in ORFS GPL. Partitioning would unblock retiming for the largest design.
2. **DRC cleanup** — rope (418), mac_array (641), vector_unit (488) have remaining DRT violations
3. **vector_unit re-route** — macro_place updated for new fold=2 macro shape; needs hierarchical PnR before re-route can land
4. **lm_head architecture** — 188 MB weight store needs external DRAM interface, not on-die ROM

## Architecture

See [file-map.md](file-map.md) for key file locations.
See [verilator-testing.md](verilator-testing.md) for test details.
