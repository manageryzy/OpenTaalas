# Implementation Plans Archive

Dated design + implementation plans from earlier project phases. All listed plans are **completed** — they are kept as a project history record, not an active todo list. For current state see [`../project-status.md`](../project-status.md) and [`../backend-metrics.md`](../backend-metrics.md).

| Date | Plan | What it produced |
|---|---|---|
| 2026-02-25 | LLaMA 3.1 8B accelerator design + implementation | Initial Kanagawa modules, SystemC reference models |
| 2026-02-25 | Validation pipeline | weight_generator + gguf_converter + golden FP32 reference |
| 2026-02-26 | Full-layer blackbox ROM | NOR ROM macro library + HAL integration |
| 2026-02-26 | IQ3_S hardware adoption | Q3_K weight format, sign absorption, FP8 normalization |
| 2026-02-26 | Verilator co-sim | Per-module test harness; 19 standalone tests + layer_e2e + real_data |
| 2026-02-27 | Layer E2E verification | 44-check 3-phase E2E test; full FSM walk |
| 2026-02-27 | Real-data E2E | 16-check real-data test at LLaMA 3.1 8B dims |

Subsequent work (backend PnR, density improvement, SRAM/ROM macro integration) is in [`../superpowers/`](../superpowers/).
