# Key File Locations

## RTL
- `rtl/kanagawa/` — 21 Kanagawa HLS source files (.k)
- `rtl/kanagawa/layer_orchestrator.k` — v12 pure-Kanagawa orchestrator composing rope_apply + vector_unit
- `rtl/kanagawa/opentaalas/` — symlink to `.` so cross-file imports (`import opentaalas.rope_apply`) resolve
- `rtl/generated/kanagawa/` — Generated SV (types + module per design; orchestrator emits `layer_orchestrator{layer_orchestrator,rope_apply,vector_unit}.sv`)
- `rtl/sv/transformer_layer_wrapper.sv` — Structural wrapper composing all sub-modules
- `rtl/sv/transformer_layer_block.sv` — v11.3 hardened layer_block (rope_apply only, 256-bit phased cascade)
- `rtl/sv/multi_layer_chip_wrapper.sv` — v11.3 chip wrapper with chip-level 4:1 phase slicer

## Models
- `model/systemc/src/` — 17 header-only C++ reference models
- `model/systemc/src/bf16_math.h` — RTL-matching BF16 arithmetic (mul, add, sub, etc.)
- `model/systemc/include/opentaalas/types.h` — ac_int typedefs
- `model/systemc/CMakeLists.txt` — INTERFACE library `opentaalas_model`

## Tests
- `test/verilator/test_vl_layer_real_data.cpp` — Real-data layer 0 at full LLaMA 3.1 8B dims (16 checks)
- `test/verilator/test_vl_layer_e2e.cpp` — E2E layer verification at CI dims (44 checks)
- `test/verilator/test_vl_transformer_layer.cpp` — Per-sub-module pipeline tests
- `test/verilator/test_vl_*.cpp` — 19 individual co-sim tests
- `test/verilator/kanagawa_harness.h` — Shared test harness template
- `test/verilator/CMakeLists.txt` — All verilator test targets
- `test/systemc/` — 17 SystemC-only reference model tests

## Tools
- `tools/weight_generator.h` — Deterministic weight/LUT generator for CI testing
- `tools/gguf_converter.cpp` — GGUF Q3_K → binary weight/scale converter (sign absorption into weights)
- `tools/gguf_converter.h` — FP8 E4M3/FP16/BF16 conversion utilities
- `tools/llama_quantized_forward.cpp` — Golden reference: quantized forward pass generating FP32 intermediate vectors

## Backend Flow
- `flow/CMakeLists.txt` — Backend synthesis/PnR/GDS targets (20 modules + smoke_adder, including layer_orchestrator)
- `flow/scripts/run_orfs.sh` — ORFS invocation wrapper (requires absolute paths)
- `flow/designs/kanagawa_runtime.mk` — Shared Kanagawa runtime include for stdcell-only ORFS configs
- `flow/designs/kanagawa_runtime_sky130.mk` — Macro-bearing runtime (HAL + SRAM/ROM macros + composition runtime: semaphore, extern_return_router, context_saver)
- `flow/designs/sky130hd/<module>/config.mk` — Per-module ORFS config
- `flow/designs/sky130hd/<module>/constraint.sdc` — Per-module timing constraints
- `flow/designs/sky130hd/layer_orchestrator/` — v12 pure-Kanagawa composition design
- `flow/macros/sky130hd/{nor_rom,sram}_*.{lef,lib,gds,bb.v}` — Custom macro collateral
- `rtl/sv/async_fifo.sv` — Gray-code dual-clock async FIFO for CDC
- `rtl/hal/sky130/hal_dual_port_ram.sv` — sky130 HAL mapping KanagawaSyncRam → physical macros

## Docs
- `docs/project-status.md` — Project status with backend PnR results (current; v12 milestone documented)
- `docs/backend-metrics.md` — Per-design PnR metrics (current; v12 section)
- `docs/file-map.md` — This file
- `docs/verilator-testing.md` — Test descriptions and current results
- `docs/orfs-flow-review.md` — Read-only audit of all 25 sky130 designs vs ORFS doc best practice
- `docs/orfs-flow-todo.md` — Action items derived from the review
- `docs/orfs-reference.md` — ORFS config templates, failure modes, metrics extraction
- `docs/transistor-budget-53B.md` — Transistor budget projection for full LLaMA 3.1 8B in advanced nodes
- `docs/tsmc-3nm-projection.md` — Same content scaled to TSMC 3nm
- `docs/outdated/pnr-reports.md` — Historical per-design PnR walkthroughs (moved to outdated/; metrics superseded by v5 SRAM refactor + v7 RoPE split + v12 orchestrator — see backend-metrics.md)
- `docs/plans/2026-02-27-real-data-e2e-design.md` — Real-data test design
- `docs/plans/2026-02-27-layer-e2e-verification-design.md` — E2E design doc
- `docs/plans/2026-02-27-layer-e2e-verification-plan.md` — Implementation plan (8 tasks)
- `docs/superpowers/specs/2026-03-10-backend-pnr-design.md` — Backend PnR spec
- `docs/superpowers/plans/2026-03-10-backend-pnr.md` — Backend PnR implementation plan (10 tasks)
- `docs/outdated/` — Historical docs superseded by current state
