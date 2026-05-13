# Superpowers Plans + Specs Archive

Backend PnR + density improvement work, organized as design specs (in `specs/`) paired with implementation plans (in `plans/`). All listed work is **completed**. For current state see [`../project-status.md`](../project-status.md) and [`../backend-metrics.md`](../backend-metrics.md).

| Date | Spec | Plan | What it produced |
|---|---|---|---|
| 2026-03-10 | `specs/2026-03-10-backend-pnr-design.md` | `plans/2026-03-10-backend-pnr.md` | Initial backend PnR flow: 12 logic-only designs through GDS |
| 2026-03-11 | `specs/2026-03-11-sram-rom-macro-integration-design.md` | `plans/2026-03-11-stage1a-kanagawa-wide-word.md` | NOR ROM + SRAM macros, HAL `hal_dual_port_ram.sv`, LEF/Liberty/GDS collateral |
| 2026-03-17 | `specs/2026-03-17-density-improvement-design.md` | `plans/2026-03-17-density-improvement.md` | NOR ROM folding, internal-mux refactor, die-shrink for macro-bearing tiles, 41% area reduction |

Subsequent work (multi-layer chip integration, RoPE table/datapath split, pure-Kanagawa orchestrator) is documented inline in [`../backend-metrics.md`](../backend-metrics.md) v10–v12 sections rather than as new spec/plan pairs.
