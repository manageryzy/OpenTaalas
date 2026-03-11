# Key File Locations

## RTL
- `rtl/kanagawa/` — 20 Kanagawa HLS source files (.k)
- `rtl/generated/kanagawa/` — Generated SV (types + module per design)
- `rtl/sv/transformer_layer_wrapper.sv` — Structural wrapper composing all sub-modules

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
- `flow/CMakeLists.txt` — Backend synthesis/PnR/GDS targets (18 modules + smoke_adder)
- `flow/scripts/run_orfs.sh` — ORFS invocation wrapper (requires absolute paths)
- `flow/designs/kanagawa_runtime.mk` — Shared Kanagawa runtime include for ORFS configs
- `flow/designs/sky130hd/<module>/config.mk` — Per-module ORFS config
- `flow/designs/sky130hd/<module>/constraint.sdc` — Per-module timing constraints
- `rtl/sv/async_fifo.sv` — Gray-code dual-clock async FIFO for CDC

## Docs
- `docs/project-status.md` — Project status with backend PnR results
- `docs/verilator-testing.md` — Test descriptions and current results
- `docs/plans/2026-02-27-real-data-e2e-design.md` — Real-data test design
- `docs/plans/2026-02-27-layer-e2e-verification-design.md` — E2E design doc
- `docs/plans/2026-02-27-layer-e2e-verification-plan.md` — Implementation plan (8 tasks)
- `docs/superpowers/specs/2026-03-10-backend-pnr-design.md` — Backend PnR spec
- `docs/superpowers/plans/2026-03-10-backend-pnr.md` — Backend PnR implementation plan (10 tasks)
