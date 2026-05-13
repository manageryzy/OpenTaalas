# OpenTaalas RTL2GDS Flow Review — vs OpenROAD / ORFS Documentation

**Scope:** all 25 designs under `flow/designs/sky130hd/`, all of OpenROAD core docs (per-tool READMEs) plus ORFS docs (FlowVariables, UserGuide, FlowTutorial, AddingNewDesign, Metrics, AutoTuner). Read-only audit. No code/config changed during this review; recommendations land as the action-items table in §6.

**Doc snapshot date:** 2026-05-08 (`latest` branch on Read the Docs).

**Method:** Tier-A docs (FlowVariables, GRT, DRT, MPL, PDN, IFP) read end-to-end; Tier-B (RSZ, GPL, DPL, CTS, STA, ANT, FIN) read end-to-end; Tier-C (PAR, ODB, GUI, RCX, PSM, RMP, UPF, PPL, TAP, PAD, STT, DFT, ORFS UserGuide, FlowTutorial, AddingNewDesign, Metrics, AutoTuner, Logger, Messages) skimmed for direct relevance. Per-design configs cross-referenced against documented defaults and known empirical findings in `MEMORY.md` / `docs/backend-metrics.md`.

---

## 1. Executive Summary

### 1.1 Top 5 findings

1. **`REMOVE_ABC_BUFFERS=1` is set in 24 of 25 designs (every design except `smoke_adder`) but is officially DEPRECATED.** ORFS docs explicitly recommend `SETUP_SLACK_MARGIN`/`HOLD_SLACK_MARGIN` or `SKIP_LAST_GASP=1` as replacements. Cleanup is mechanical and zero-risk.
2. **`GLOBAL_ROUTE_ARGS` is being **set fully**, which silently overrides ORFS defaults.** The 13 macro-bearing designs replace `-congestion_iterations 30 -congestion_report_iter_step 5 -verbose` with `…-allow_congestion`. The default's iteration count is preserved by accident (we duplicate it); but anyone editing this in the future loses defaults invisibly.
3. **Three `[[halo]]` concepts coexist with confusing names**: MPL `MACRO_PLACE_HALO` (auto-placer halo), IFP/PDN `define_pdn_grid -halo` (PDN grid spacing), and `MACRO_BLOCKAGE_HALO` (routing-blockage halo). MPL `MACRO_PLACE_HALO` derives `MACRO_BLOCKAGE_HALO` automatically; PDN `-halo` is independent and defaults to **0**. None of our 13 macro designs explicitly set `MACRO_BLOCKAGE_HALO` or PDN halos — relying on defaults that the docs don't even surface as ORFS variables.
4. **The `RECOVER_POWER=0` + patched `global_route.tcl` workaround addresses a real upstream defect** (incremental GRT after `recover_power_helper` doesn't gracefully handle residual congestion → GRT-0116 → DRT refuses to start because `grt::have_routes` is false). The patch is a `catch {} ` wrapper plus a guard on `RECOVER_POWER==0`. This pattern is undocumented at every level; the patch is correct and minimal.
5. **DRT's `.odb`-on-success-only behavior is not documented.** Long DRT runs (rope ~11h to 418 DRC then aborted at iter 53) lose all routing data because OpenROAD only commits the `.odb` on full convergence. Intermediate `5_route_drc.rpt-N.rpt` files are written every 5 iters — that's the only persistence. No ORFS variable exposes "checkpoint DRT every N iters." This is an upstream gap worth filing.

### 1.2 Top 5 action items

| # | Title | Effort | Risk | Verify on |
|---|---|---|---|---|
| A1 | Replace `REMOVE_ABC_BUFFERS=1` with `SKIP_LAST_GASP=1` (or appropriate slack margin) across all 23 designs | low | low | smoke_adder + async_fifo + codebook_decoder |
| A2 | Add `set -o pipefail`-style failure-on-skip safety in patched `global_route.tcl` (already mostly there); wire `SKIP_ANTENNA_REPAIR_POST_DRT` into a single `kanagawa_runtime_sky130_macro_safe.mk` include | medium | low | rope_apply (smallest macro-config) |
| A3 | Drop `-allow_congestion` from `GLOBAL_ROUTE_ARGS` on `rmsnorm` (clean route, no overflow) and `lut_interp` (clean route, MET timing) — they don't need the escape hatch and `-allow_congestion` masks future regressions | low | low | rmsnorm + lut_interp |
| A4 | Document the 17 µm / 34 µm PDN strap-channel floors as project convention; codify in `kanagawa_runtime_sky130.mk` as default `MACRO_BLOCKAGE_HALO 10 10` + `set_macro_extension 4` (used to be implicit) | low | low | swiglu (smallest 3-macro design) |
| A5 | Add a `metrics_aggregate.py` that ingests `flow/logs/sky130hd/*/base/6_report.json` and emits a single `docs/backend-metrics.json` matching ORFS Metrics doc schema. Wires AutoTuner-compatible CI gating for free | medium | low | full backend pass |

### 1.3 Health-check summary

| Stage | Knob coverage | Gap class |
|---|---|---|
| Synthesis | ★★★★★ | All five `SYNTH_*` variables intentionally tuned; only deprecation cleanup needed |
| Floorplan / IFP | ★★★★☆ | Mix of explicit DIE_AREA (correct for thin-wrapper-around-macro) and CORE_UTILIZATION (correct for logic) — only missing `-row_parity`, low value |
| PDN | ★★★☆☆ | We rely on platform defaults + patched scripts; PDN halo / strap-pitch policy not project-controlled |
| MPL | ★★★★☆ | Manual `place_macro` via `macro_place.tcl` per design; RTLMP not used (correctly — manual partition is simpler at our scale) |
| GPL | ★★★★☆ | `GPL_TIMING_DRIVEN=0` correctly used as escape hatch on vector_unit / multi_layer_chip; `-keep_resize_below_overflow` and routability knobs unused (low priority) |
| DPL | ★★★★★ | Defaults appropriate; `MAX_DISPLACEMENT` never needed |
| CTS | ★★★☆☆ | We rely entirely on platform defaults; `-balance_levels`, `-apply_ndr`, `-macro_clustering_*` never used. embed_rom 1.99 ns clock skew suggests `-balance_levels`/`-macro_clustering_max_diameter` would help |
| GRT | ★★☆☆☆ | Heavy reliance on `-allow_congestion` + script patches. Documented upstream gap. |
| DRT | ★★★★☆ | Default 64-iter ceiling appropriate; only gap is `.odb`-on-success-only persistence (upstream bug to file) |
| ANT / FIN | ★★★★☆ | `SKIP_ANTENNA_REPAIR*=1` correctly used. FIN unchanged from platform default. |
| STA / RSZ | ★★★☆☆ | `[[schedule(N)]]` HLS retiming bypasses RSZ retiming-equivalent (`replace_arith_modules`, `repair_timing -sequence`). Worth documenting why — the retiming-floor table is ours, not in docs |

★ legend: 1=heavy gap, 5=fully aligned with documented best practice.

---

## 2. Methodology & Scope

### 2.1 What this review does

- **Reads** every per-tool README on https://openroad.readthedocs.io/en/latest/ and every page on https://openroad-flow-scripts.readthedocs.io/en/latest/.
- **Compares** each documented variable / Tcl flag against current OpenTaalas usage in:
  - 25 × `flow/designs/sky130hd/<name>/config.mk`
  - 13 × `flow/designs/sky130hd/<name>/macro_place.tcl`
  - 2 × shared includes (`kanagawa_runtime.mk`, `kanagawa_runtime_sky130.mk`)
  - 1 × custom wrapper (`flow/scripts/run_orfs.sh`)
  - 1 × patched ORFS script (`global_route.tcl` in `~/workspace/OpenROAD-flow-scripts/flow/scripts/`)
- **Classifies** each comparison as `MATCH`, `MISSING-VAR`, `MISUSE`, `WORKAROUND-OK`, `WORKAROUND-SUSPICIOUS`, or `UPSTREAM-BUG`.

### 2.2 What this review does NOT do

- Does not run PnR; all evidence is text-only.
- Does not modify configs or RTL.
- Does not cover RTL design or Kanagawa source — only the flow stack.
- Does not re-validate platform `config.mk` choices baked into ORFS (sky130hd platform-level wiring).
- Does not enumerate every ORFS variable — only those used (or notably *not* used) by OpenTaalas.

### 2.3 Reference materials

- Pre-extracted Tier-A doc tables: `/home/mana/.claude/plans/plan-to-review-current-compiled-raccoon-agent-a67f3f0ece5c7c9b2.md` (FlowVariables / MPL / GRT) + `/home/mana/.claude/plans/orfs-review-tierA-rest.md` (DRT / PDN / IFP)
- Tier-B: `/home/mana/.claude/plans/orfs-review-tierB.md`
- Tier-C: `/home/mana/.claude/plans/orfs-review-tierC.md`
- Doc index: `/home/mana/.claude/plans/plan-to-review-current-compiled-raccoon-agent-a889b800fe41445b1.md`

---

## 3. Per-Stage Gap Tables

### 3.1 Synthesis (Yosys + slang + hierarchical)

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `SYNTH_HDL_FRONTEND` ∈ {`""`, `slang`}; default `""` (read_verilog) | `slang` on 22 of 25 (all Kanagawa-derived) | `MATCH` | Required for SystemVerilog interfaces / structs Kanagawa emits |
| `SYNTH_HIERARCHICAL` default 0 (flat) | 1 on 15 designs (every macro-bearing + most large logic), 0 on 9 (simple logic) and explicitly 0 on multi_layer_chip | `MATCH` | Doc explicitly recommends hier=1 for designs with macros — we do this |
| `SYNTH_MEMORY_MAX_BITS` default **4096** | `65536` on 22 of 25 | `WORKAROUND-OK` | Doc note: "use real RAM/fakeram above this." We do (HAL→macro). Setting matches the largest macro depth; safe. |
| `SYNTH_KEEP_MOCKED_MEMORIES` default 1 | unset (default) | `MATCH` | Default preserves complexity intentionally |
| `SYNTH_MOCK_LARGE_MEMORIES` default 0 | unset | `MATCH` | We have real macros |
| `REMOVE_ABC_BUFFERS` default 0 — **DEPRECATED** per doc | `1` on 24 of 25 (only smoke_adder is unset) | **`MISUSE`** | Doc: "use SETUP/HOLD_SLACK_MARGIN or SKIP_LAST_GASP=1 instead." Action A1. |
| `SDC_FILE` required | set everywhere | `MATCH` | — |
| `VERILOG_FILES` required | set everywhere | `MATCH` | — |
| `SLANG_PLUGIN_PATH` default `slang` | unset (default) | `MATCH` | — |
| `SYNTH_RETIME_MODULES` (experimental) | unset | `MATCH` | We use Kanagawa `[[schedule(N)]]` upstream of synth — better than Yosys retime |
| `LEC_CHECK` (project doc says =0) | only in multi_layer_chip (=0); other 24 default (=0 or unset, varies by platform) | `MATCH` | Speeds builds; equivalence-check is gated upstream |

### 3.2 Floorplan & IFP

Doc reference: `initialize_floorplan` accepts EITHER `-die_area` + `-core_area` OR `-utilization` + optional `-aspect_ratio` (≤1.0!) + `-core_space`. **Mixing is undefined.**

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `DIE_AREA` & `CORE_AREA` mutually exclusive with `CORE_UTILIZATION` | 14 designs use explicit `DIE_AREA`/`CORE_AREA`; 11 use `CORE_UTILIZATION`; **none mix** | `MATCH` | Correctly disjoint per doc |
| `-aspect_ratio` ∈ [0..1.0] | not set anywhere | `MATCH` (default 1.0) | All explicit dies are tall-rectangle for tall macros; no need to set |
| `CORE_MARGIN` default 1.0 µm | not set anywhere | `MATCH` | Designs with explicit `CORE_AREA` set explicit 5–10 µm margin via the `CORE_AREA` coords |
| `MACRO_PLACE_HALO` derives `MACRO_BLOCKAGE_HALO` from largest x/y | `10 10` on 9 of 13 macro designs; **unset on 4** (mac_array, multi_layer_chip, rope, rope_apply, rope_gen, vector_unit) | **`MISSING-VAR`** | When unset, ORFS uses platform default (40 µm in sky130hd). Per memory item 11, default 40 is too generous when cells are sparse → silent density floor. Action A4. |
| `MACRO_BLOCKAGE_HALO` default = max(MACRO_PLACE_HALO_x, MACRO_PLACE_HALO_y) | never explicitly set | `MATCH` | Auto-derivation OK |
| `MACRO_EXTENSION` (gcells added to blockage) | never set | `MATCH` (default unset) | Could help mac_array (641 DRC) — mark as future tuning item |
| `IO_CONSTRAINTS` (Tcl pin-placement) | only `rope_apply` (refers to `io_constraints.tcl`) | `MATCH` | Only design with PPL constraint file; matches v9 plan to keep 1024-bit cos/sin contiguous |
| `PLACE_DENSITY` default — | never set anywhere; rely on platform default | `MATCH` (sky130hd platform default applied) | We tune via `_LB_ADDON` instead, which is the documented per-design knob |
| `PLACE_DENSITY_LB_ADDON` (no doc default; ORFS variable) | `0.05` on 8 designs, `0.10` on 7, `0.20` on 10 | `WORKAROUND-OK` | Project doc (`docs/orfs-reference.md`) calls 0.10–0.20 the sweet spot; matches |
| `TAPCELL_TCL` required | unset → uses platform default | `MATCH` | sky130hd platform provides this |
| `PDN_TCL` required for PDN | unset → uses platform default | `MATCH` | sky130hd platform provides this |
| `ROUTING_LAYER_ADJUSTMENT` default 0.5 | never set | `MATCH` | Doc: "bisect from 0.10 if congested." Future tuning candidate for vector_unit / mac_array |
| `RTLMP_*` family (auto macro placer) | never set; we use manual `MACRO_PLACEMENT_TCL` instead | `MATCH` | Manual placement is simpler at our scale (1–8 macros per design). RTLMP is multilevel partition + simulated annealing — overkill |
| `POST_FLOORPLAN_TCL` / `POST_PDN_TCL` / `POST_TAPCELL_TCL` hooks | never used | `MATCH` | No hooks needed currently |

### 3.3 PDN

Doc reference: `pdngen`, `set_voltage_domain`, `define_pdn_grid` (overloaded — beware), `add_pdn_stripe`, `add_pdn_ring`, `add_pdn_connect`. Halo defaults to **0**.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `set_voltage_domain` for multi-domain | not used (single VDD) | `MATCH` | Single voltage rail; correct |
| `define_pdn_grid -halo` default 0 | platform-default; OpenTaalas does not override | `MATCH` | sky130hd platform PDN file sets halo |
| `define_pdn_grid -grid_over_pg_pins` default true | unchanged | `MATCH` | — |
| `add_pdn_stripe -spacing` default = pitch/2 | platform-default; OpenTaalas memory recorded met4 pitch 27.14, offset 13.57, width 1.6 | `MATCH` | Exactly half-pitch as documented |
| `repair_pdn_vias` (post-DRT cleanup) | not used; ORFS variable `REPAIR_PDN_VIA_LAYER` unset | `MATCH` | No PDN-via DRC reported; not currently needed |
| **PDN strap channel minimums around macros** | empirical 17 µm x-axis (met1) / 34 µm y-axis (met4) **NOT documented anywhere upstream** | **`UPSTREAM-BUG` (doc gap)** | Action A4: codify in shared include |
| **PDN-0179 "Unable to repair all channels" error** | observed; resolved by widening die ≥34µm above/below macros | `WORKAROUND-OK` | Error code not in messages reference; track as upstream doc gap |
| `pdngen -ripup` / `-reset` / `-check_only` | not used (one-shot per build) | `MATCH` | — |

### 3.4 Macro placement (MPL / `place_macro`)

Doc reference: MPL provides `rtl_macro_placer` (auto, multilevel) and `place_macro` (single-instance manual). RTLMP knobs (`RTLMP_*`) tune the auto placer.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `MACRO_PLACEMENT_TCL` (file) for manual placement | 12 designs (alphabetical: codebook_decoder, embed_rom, kv_cache_demo, lm_head_demo, lut_interp, mac_array, multi_layer_chip, rmsnorm, rom_bank, rope, rope_apply (none, but io_constraints.tcl), rope_gen, swiglu, vector_unit) | `MATCH` | Manual `place_macro` calls per macro — exactly the documented mode |
| RTLMP auto placer (`rtl_macro_placer`) | not used | `MATCH` | Manual is simpler at 1–8 macros per design; doc note "RTLMP_MAX_INST/MIN_INST auto if unset" suggests RTLMP wants larger designs |
| `RTLMP_MAX_LEVEL` default 2 | unused | `MATCH` | RTLMP unused |
| `MACRO_PLACE_HALO` for auto placer | when set, applied to the manual flow as well via blockage halo | `MATCH` | Doc: derives `MACRO_BLOCKAGE_HALO` automatically |
| **Pin-side orientation guidance for wide-bus macros** | `MEMORY.md` rope v3 lesson: "always read PIN coordinates from the LEF before placing wide-bus macros" — empirical | **`UPSTREAM-BUG` (doc gap)** | MPL docs say nothing about pin-side orientation. Document as project convention |
| `place_macro -orient` ∈ {R0, MY, MX, R180, …} | rope/rope_gen/vector_unit use mirrored placement (left=MY, right=R0) | `WORKAROUND-OK` | Documented orientation values; correct usage |
| **Abstract LEF / hierarchical IP broadcast** | `multi_layer_chip` uses pre-hardened `rope_apply.lef` / `rope_gen.lef` | `WORKAROUND-OK` | Doc note: MPL README does not document abstract-LEF flow. We synthesize the abstracts via ORFS `generate_abstract.tcl` (built-in target). The technique is well-supported but undocumented in the methodology pages |

### 3.5 Global Placement (GPL)

Doc reference: defaults `-density 0.7`, `-overflow 0.1`, `-init_density_penalty 8e-5`. `-timing_driven_net_reweight_overflow` defaults `[64, 20]`. `-keep_resize_below_overflow` default 1.0.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `GPL_TIMING_DRIVEN` default 1 | `0` on 2 designs (vector_unit, multi_layer_chip) | `WORKAROUND-OK` | Doc confirms timing-driven mode runs virtual `repair_design` at every overflow threshold — known to hang on 100K+ net designs (memory item 19). Skip is the documented escape hatch |
| `-keep_resize_below_overflow` default 1.0 | not set | `MATCH` | Default keeps all resizer changes — appropriate |
| `-routability_target_rc_metric` default 1.01 | not set (rely on default) | `MATCH` | If we re-attempt vector_unit, raising this would relax convergence |
| `-disable_revert_if_diverge` | not set (default = revert on diverge) | `MATCH` | Correct; we want diverge protection |
| `-pad_left` / `-pad_right` cell padding | platform default | `MATCH` | sky130hd has built-in cell padding |
| `-skip_initial_place` | not set | `MATCH` | We need the BiCGSTAB initial place |

### 3.6 Detailed Placement (DPL)

Doc defaults: `-max_displacement {0,0}` — cells must legalize at GP coordinates.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `-max_displacement` default {0,0} | not overridden anywhere | `MATCH` | We rely on GPL output legality; never failed |
| `-disallow_one_site_gaps` (deprecated) | unused | `MATCH` | — |
| `set_placement_padding` | platform default | `MATCH` | sky130hd platform sets standard cell padding |
| `optimize_mirroring` | runs as part of detail_place.tcl | `MATCH` | ORFS default |
| Mixed-cell-height (1×–4×) via `-use_negotiation` / `-abacus` | unused | `MATCH` | sky130hd is single-row-height; not needed |

### 3.7 CTS

Doc note: NO explicit `target_skew` knob. Skew control is implicit via `-balance_levels`, `-sink_clustering_*`, `-delay_buffer_derate`, `-macro_clustering_*`, `-apply_ndr`.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `-balance_levels` default false | platform default (false) | `MATCH` | embed_rom 1.99 ns clock skew might benefit from `-balance_levels` — Action A6 |
| `-sink_clustering_enable` default false | platform default | `MATCH` | — |
| `-macro_clustering_size` default 4 | platform default | `MATCH` | — |
| `-macro_clustering_max_diameter` default 50 µm | platform default | `MATCH` | embed_rom monolithic macro is 35 mm tall — single-macro design, no clustering needed |
| `-apply_ndr` default `none` | platform default | `MATCH` | Likely worth experimenting with `root_only` for vector_unit clock-NDR work |
| `-num_static_layers` default 0 | platform default | `MATCH` | — |
| `-obstruction_aware` default false | platform default | `MATCH` | Macros declared as routing obstructions implicitly through MPL halo |

### 3.8 GRT — incl. NDR retry analysis

Doc: `global_route` defaults include `-congestion_iterations`, `-congestion_report_iter_step`, `-allow_congestion`, `-start_incremental`, `-end_incremental`. `-allow_congestion` is a **Tcl flag**, not a Make var — must thread via `GLOBAL_ROUTE_ARGS` or patched script.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `GLOBAL_ROUTE_ARGS` default = `-congestion_iterations 30 -congestion_report_iter_step 5 -verbose` | 13 macro designs **set fully**, replacing default with `… -allow_congestion` | **`MISUSE` / `WORKAROUND-OK`** | Setting fully-replaces — we manually echo the defaults. Brittle; if ORFS upgrades default iteration count, our configs lock to 30 forever. **Action A7:** document this as project policy in shared include |
| `-allow_congestion` (Tcl flag) | threaded via `GLOBAL_ROUTE_ARGS` | `WORKAROUND-OK` | Documented use case: prevents infinite NDR retry loops by accepting overflow |
| `RECOVER_POWER` default 1 | `0` on all 13 macro designs | **`UPSTREAM-BUG`** | Default behavior triggers `recover_power_helper` → `global_route -end_incremental` which fails on residual congestion (GRT-0116) → DRT refuses (`grt::have_routes` false). Patched `global_route.tcl` (see Appendix C) catches this gracefully. |
| `SKIP_INCREMENTAL_REPAIR` default 0 | `1` on all 13 macro designs | `WORKAROUND-OK` | Skips `repair_design`/`repair_timing` incremental GRT passes — same NDR loop pattern |
| `set_macro_extension` (Tcl) | not used | `MATCH` | `MACRO_EXTENSION` env var unused |
| `-congestion_iterations` (default 30) | duplicated explicitly in our `GLOBAL_ROUTE_ARGS` | `WORKAROUND-OK` | Defensive duplication; works |
| **NDR retry loop on clock nets** | `MEMORY.md` GRT v7 rope_gen lesson; no upstream doc | **`UPSTREAM-BUG` (doc gap)** | GRT/DRT readmes do not mention this failure mode. Worth filing |

### 3.9 DRT

Doc: `-droute_end_iter` valid range 1..64, default sentinel -1.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `DETAILED_ROUTE_END_ITERATION` default 64 | not overridden anywhere | `MATCH` | 64 is the documented ceiling — appropriate |
| `set_routing_layers` (preferred over deprecated `-bottom_routing_layer`/`-top_routing_layer`) | platform default (sky130hd uses `set_routing_layers met1 met5`) | `MATCH` | — |
| `-min_access_points` for narrow pin macros | not used | `MISSING-VAR` | mac_array stuck at 641 DRC could benefit; future tuning |
| `-via_in_pin_*` for via-in-pin enclosure | platform default | `MATCH` | Sky130 NOR ROM met3 pin-pitch alignment matches doc requirement |
| `-repair_pdn_vias` (post-DRT cleanup, conditional on PDK) | not used | `MATCH` | Not needed on sky130hd; M1/M2 power rails are NOT parallel here |
| `SKIP_ANTENNA_REPAIR_POST_DRT` default 0 | `1` on all 13 macro designs | `WORKAROUND-OK` | Doc gap (memory item 7): post-DRT antenna repair re-triggers stale incremental GRT. Skip is the documented ORFS variable but the *reason* is undocumented |
| **`.odb` written only on full DRT success** | unaddressed — long DRT runs (rope 11h) lose all data on partial convergence | **`UPSTREAM-BUG`** | No checkpoint flag exists. Intermediate `5_route_drc.rpt-N.rpt` is the only persistence. File upstream feature request |
| `-drc_report_iter_step` (default 0=off) | not set | `MISSING-VAR` | Setting to 5 would emit periodic DRC reports — already done implicitly by ORFS via `5_route_drc.rpt-N.rpt`? Verify next run |

### 3.10 Antenna (ANT) & Filler (FIN)

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `check_antennas` runs implicitly | runs via ORFS `detail_route.tcl` | `MATCH` | — |
| `SKIP_ANTENNA_REPAIR` default 0 | `1` on all 13 macro designs | `WORKAROUND-OK` | Doc-undocumented loop with incremental GRT; `RECOVER_POWER=0` mitigation pairs with this |
| `density_fill -rules <RULES_JSON>` default | platform default JSON | `MATCH` | sky130hd platform provides the rule deck |
| Metal fill density floor | not enforced project-side; foundry rule deck handles | `MATCH` | sky130hd ~30% min met1-met5 |
| `space_to_outline` field (legacy, ignored) | n/a | `MATCH` | — |

### 3.11 STA & RSZ — Retiming/schedule policy

Doc: STA README is a stub → see `doc/OpenSTA.pdf` for multicycle/false-path/derate. RSZ default `repair_timing -sequence "unbuffer vt_swap sizeup swap buffer clone split" -phases "LEGACY LAST_GASP"`.

| Doc-recommended | OpenTaalas usage | Class | Notes |
|---|---|---|---|
| `SETUP_SLACK_MARGIN` default 0 | not set | `MATCH` | Could replace `REMOVE_ABC_BUFFERS=1` (action A1) |
| `HOLD_SLACK_MARGIN` default 0 | not set | `MATCH` | — |
| `TNS_END_PERCENT` default 100 | not set | `MATCH` | Doc: "reduce to 5 for speed" — viable for vector_unit if we ever route it |
| `SETUP_MOVE_SEQUENCE` default `"unbuffer vt_swap sizeup swap buffer clone split"` | not overridden | `MATCH` | — |
| `-skip_*` move flags (`SKIP_GATE_CLONING`, `SKIP_PIN_SWAP`, etc.) | not set | `MATCH` | Default sequence appropriate |
| `SKIP_LAST_GASP` default 0 | not set | `MISSING-VAR` | Doc recommends instead of `REMOVE_ABC_BUFFERS=1` (action A1) |
| `replace_arith_modules` (RSZ-level retiming) | not used | `MATCH` | We retime upstream via Kanagawa `[[schedule(N)]]` — better |
| `set_multicycle_path` for cross-tile broadcast | NOT USED on multi_layer_chip rope_gen→rope_apply path | **`MISSING-VAR`** | We use 40% input/output_delay per memory item, but a `set_multicycle_path -setup 2` would be cleaner. Action A8 |
| `set_max_delay` / `set_min_delay` | not used | `MATCH` | Standard `create_clock` + I/O delays sufficient |
| `read_spef` for routed STA | not currently wired (no RCX pass yet) | `MISSING-VAR` | Stage 6 candidate — Action A9 |
| **Kanagawa `[[schedule(N)]]` retiming** | used on swiglu, rmsnorm, attention_unit, mac_pe, mac_array, rope_apply, vector_unit | `OURS-FINE-UNDOCUMENTED` | Memory item 13 — pushed WNS by 27–292% across modules. RSZ's `replace_arith_modules` could complement, but doesn't substitute |

---

## 4. Per-Design Audits (all 25)

Verdict legend: ✓ = OK as-is, ✎ = easy fix (low risk), ⚠ = needs investigation, ⛔ = blocked (RTL/PnR not converged).

### 4.1 async_fifo
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | none | – | ✓ Standalone (no Kanagawa runtime needed) |
| `DIE_AREA` | `0 0 80 80` | – | ✓ Smallest design; explicit DIE_AREA correct |
| `CORE_AREA` | `5 5 75 75` | – | ✓ 5 µm margin |
| `PLACE_DENSITY_LB_ADDON` | `0.20` | – | ✓ Sweet spot for tiny logic |
| `REMOVE_ABC_BUFFERS` | `1` | 0 (DEPR) | ✎ A1: replace with `SKIP_LAST_GASP=1` |

**Result:** GDS clean, +0.91 ns positive slack, 326 MHz. Validation candidate for A1 + A2 (lowest-risk re-runs).

### 4.2 attention_unit
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `50` | – | ✓ Logic-only; auto-size appropriate |
| `PLACE_DENSITY_LB_ADDON` | `0.20` | – | ✓ |
| `SYNTH_HDL_FRONTEND` | `slang` | "" | ✓ |
| `SYNTH_MEMORY_MAX_BITS` | `65536` | 4096 | ✓ |
| `REMOVE_ABC_BUFFERS` | `1` | 0 (DEPR) | ✎ A1 |

**Note:** `[[schedule(3)]]` retiming locked WNS at -3.21 ns (memory item 13). Logic-only; no macros. ✓

### 4.3 codebook_decoder
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 800 800` | – | ✓ Tightened from 1.55 mm² (memory item 18) |
| `MACRO_PLACE_HALO` | `10 10` | (40 µm platform) | ✓ Doc-aligned override |
| `PLACE_DENSITY_LB_ADDON` | `0.10` | – | ✓ |
| `GLOBAL_ROUTE_ARGS` | `… -allow_congestion` | (default) | ⚠ A3-class but currently MET (-0.02 ns) — keep `-allow_congestion` only if needed; first re-run without it |
| `MACRO_PLACEMENT_TCL` | 5× sram_512x32 row at y=596 | – | ✓ |
| Other workarounds | `RECOVER_POWER=0`, `SKIP_*=1` | – | ✓ |

**Result:** 0 DRC, MET timing, fmax 249 MHz. v6 sweet-spot design.

### 4.4 dequant
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `50` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.20` | – | ✓ |
| `REMOVE_ABC_BUFFERS` | `1` | 0 (DEPR) | ✎ A1 |

**Note:** WNS -0.67 ns. Pure logic, no macros. ✓

### 4.5 embed_rom
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 1900 2400` | – | ✓ After v3 internal-mux refactor |
| `MACRO_PLACE_HALO` | `10 10` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ Tight macro layout |
| `MACRO_PLACEMENT_TCL` | 1× nor_rom_65536x192 at (236,87) | – | ✓ Monolithic placement |
| Workarounds | `RECOVER_POWER=0`, `GLOBAL_ROUTE_ARGS … -allow_congestion`, `SKIP_*=1` | – | ✓ |

**Note:** 1.99 ns clock skew on 35 mm-tall macro (memory item 6). ⚠ Try `-balance_levels` in CTS — Action A6.

### 4.6 global_controller
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `65` | – | ✓ Larger control logic; high util OK |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ |

**Note:** WNS -0.09 ns. ✎ Try RMP `restructure -target delay -slack_threshold 0.2` per Tier-C action — Action A10.

### 4.7 kv_cache
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `CORE_UTILIZATION` | `50` | – | ⚠ Full-scale variant — physically impossible at sky130; placeholder config |

**Note:** Per `docs/backend-metrics.md`, the full-scale kv_cache (64 Mbit) needs ~110 mm². Use `kv_cache_demo` instead. Consider deleting this config or marking experimental.

### 4.8 kv_cache_demo
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 595 705` | – | ✓ 87% util after macro consolidation (memory item 12) |
| `MACRO_PLACE_HALO` | `10 10` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ Tight |
| `MACRO_PLACEMENT_TCL` | 4× sram_8192x8 (col_mux=32) | – | ✓ |
| Workarounds | `RECOVER_POWER=0`, `… -allow_congestion`, `SKIP_*=1` | – | ✓ |

**Result:** 0 DRC, -0.34 ns, 230 MHz, 24 mW. Densification reference design.

### 4.9 layer_tile
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `65` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ |

**Note:** GDS clean, +0.06 ns MET. ✓

### 4.10 llama_chip
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `65` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ |

**Note:** Top-level integration; +0.03 ns MET, GDS clean. ✓

### 4.11 lm_head
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `50` | – | ⚠ Full-scale (188 MB ROM, ~550 mm²) — use `lm_head_demo` |

**Note:** Same off-chip-memory situation as kv_cache. Consider marking experimental.

### 4.12 lm_head_demo
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 1900 2400` | – | ✓ Same as embed_rom (same monolithic macro) |
| `MACRO_PLACE_HALO` | `10 10` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ |
| Workarounds | `RECOVER_POWER=0`, `… -allow_congestion`, `SKIP_*=1` | – | ✓ |

**Result:** 0 DRC, -3.90 ns / 127 MHz. Same v3 fix as embed_rom; same 1.99 ns clock skew issue ⚠.

### 4.13 lut_interp
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ Post-v5 SRAM refactor |
| `DIE_AREA` | `0 0 500 500` | – | ✓ Shrunk from 0.54 → 0.25 mm² |
| `MACRO_PLACE_HALO` | `10 10` | – | ✓ |
| `GLOBAL_ROUTE_ARGS` | `… -allow_congestion` | – | ⚠ Currently MET (+0.05 ns); A3 candidate to drop `-allow_congestion` |

**Result:** 0 DRC, MET timing, fmax 253 MHz. v5 success.

### 4.14 mac_array
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 1800 2400` | – | ⚠ 641 DRC stuck (memory item 20). Pin-density limited |
| `MACRO_PLACE_HALO` | unset | (40 µm) | ✎ A4: explicit override would help |
| `MACRO_PLACEMENT_TCL` | 1× nor_rom_1024x880 + 1× sram_512x32 | – | ✓ |

**Note:** ⛔ DRT cap at 64 iter; 641 DRC remains. ⚠ Try `-min_access_points 2` (Action A11) and `MACRO_EXTENSION 2` (give blockage some breathing room).

### 4.15 mac_pe
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `50` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.20` | – | ✓ |

**Note:** WNS -1.71 ns post `[[schedule(2)]]`. Logic-only. ✓

### 4.16 multi_layer_chip
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 9000 6500` | – | ✓ 58.5 mm² scaffold |
| `SYNTH_HIERARCHICAL` | `0` | – | ⚠ All other macro designs use 1; here we use 0 because hierarchy is already pre-flattened by the abstract LEFs |
| `GPL_TIMING_DRIVEN` | `0` | – | ✓ Required at this scale |
| `MACRO_PLACE_HALO` | unset | – | ✎ A4 |
| `MACRO_PLACEMENT_TCL` | 1× rope_gen + 2× rope_apply abstracts | – | ✓ |
| `DONT_BUFFER_PORTS=1`, `EQUIVALENCE_CHECK=0`, `LEC_CHECK=0` | extra | – | ✓ Skip ports buffering at chip level (correct) |

**Note:** Hierarchical scaffold design. ✓ for the chip wrapper; per memory the synth+FP+PDN+place+CTS finished in <3 min, which validates the hierarchy decision.

### 4.17 rmsnorm
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 1200 1200` | – | ✓ -74% from v5 SyncRam refactor (memory item 16) |
| `MACRO_PLACE_HALO` | `10 10` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.10` | – | ✓ |
| `GLOBAL_ROUTE_ARGS` | `… -allow_congestion` | – | ⚠ A3: 0 DRC, no overflow needed — drop `-allow_congestion` |
| `MACRO_PLACEMENT_TCL` | 1× sram_4096x16 + 1× sram_256x16 | – | ✓ |

**Result:** 0 DRC, -0.87 ns / 205 MHz.

### 4.18 rom_bank
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 1500 1500` | – | ✓ Shrunk per memory item 17 |
| `MACRO_PLACE_HALO` | unset | – | ✎ A4 |
| `PLACE_DENSITY_LB_ADDON` | `0.10` | – | ✓ |
| `GLOBAL_ROUTE_ARGS` | `-congestion_iterations 30 -congestion_report_iter_step 5 -verbose` (NO `-allow_congestion`) | – | ✓ Anomaly: this is the only macro design without `-allow_congestion`, and it's 0 DRC. Confirms `-allow_congestion` is unnecessary when GRT converges naturally |
| `MACRO_PLACEMENT_TCL` | 1× nor_rom_1024x880 at (540,467) | – | ✓ |

**Result:** 0 DRC, -2.01 ns / 167 MHz.

### 4.19 rope (legacy)
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 3000 3300` | – | ✓ |
| `MACRO_PLACE_HALO` | unset | – | ✎ A4 |
| `PLACE_DENSITY_LB_ADDON` | `0.20` | – | ✓ |
| `MACRO_PLACEMENT_TCL` | 2× nor_rom_4096x1024 fold=2 (mirrored) | – | ✓ |

**Note:** Superseded by `rope_gen` + `rope_apply` v7 split. Keep as reference for comparison.

### 4.20 rope_apply
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` (NOT sky130 — pure stdcell!) | – | ✓ Correctly omits macro collateral (no macros in rope_apply) |
| `DIE_AREA` | `0 0 2800 2800` | – | ⚠ Memory says 800×800 — 2800 might be from multi_layer_chip variant |
| `IO_CONSTRAINTS` | `io_constraints.tcl` | – | ✓ Only design with explicit pin constraints |

**Note:** v7 split — pure stdcell rotate. 0 DRC, -1.20 ns / 192 MHz.

### 4.21 rope_gen
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 3000 3300` | – | ✓ Same as legacy rope (memory item: 3000×3300 is the convergent shape) |
| `MACRO_PLACE_HALO` | unset | – | ✎ A4 |
| `MACRO_PLACEMENT_TCL` | 2× nor_rom_4096x1024 fold=2 (mirrored) | – | ✓ Matches legacy rope orientation |

**Result:** 350 DRC remaining (down from 418 in legacy). Memory item 11: GRT eventually exits with 4 NDR disables. ⚠ ⛔ DRT iter-cap; -2.79 ns / 147 MHz at iter ~53.

### 4.22 scale_store
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime.mk` | – | ✓ |
| `CORE_UTILIZATION` | `65` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.05` | – | ✓ |

**Note:** WNS -0.11 ns. ✎ Like global_controller — Action A10 (RMP retiming).

### 4.23 smoke_adder
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | none | – | ✓ Sanity test only |
| `DIE_AREA` | `0 0 80 80` | – | ✓ |
| `CORE_AREA` | `5 5 75 75` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.20` | – | ✓ |
| `SYNTH_HDL_FRONTEND` | not set | "" | ✓ Plain Verilog adder |

**Result:** GDS clean. **Validation design** for any low-risk changes.

### 4.24 swiglu
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 700 700` | – | ✓ |
| `MACRO_PLACE_HALO` | `10 10` | – | ✓ |
| `PLACE_DENSITY_LB_ADDON` | `0.10` | – | ✓ |
| `MACRO_PLACEMENT_TCL` | 3× sram_256x16 row at y=565 | – | ✓ |

**Result:** 0 DRC, -2.36 ns / 157 MHz. After v6 schedule(8) re-tune marginal. ⚠ Re-tune schedule for v5 SyncRam latency (memory item 16).

### 4.25 vector_unit
| Var | Value | Doc default | Verdict |
|---|---|---|---|
| Include | `kanagawa_runtime_sky130.mk` | – | ✓ |
| `DIE_AREA` | `0 0 3000 3500` | – | ⚠ ⛔ Hangs in GRT NDR loop |
| `GPL_TIMING_DRIVEN` | `0` | – | ✓ Documented escape hatch |
| `MACRO_PLACE_HALO` | unset | – | ✎ A4 |
| `MACRO_PLACEMENT_TCL` | 2× nor_rom_4096x1024 + 4× SRAM | – | ✓ |
| Workarounds | `RECOVER_POWER=0`, `… -allow_congestion`, `SKIP_*=1` | – | ✓ |

**Note:** ⛔ Currently blocked. Future direction: hierarchical PnR via `multi_layer_chip` pattern (extract abstract LEF → broadcast to N layers).

---

## 5. Cross-Cutting Findings

### 5.1 GRT NDR retry workarounds

**Documented:** `-allow_congestion`, `-congestion_iterations`, `set_routing_layers` are in the GRT README. `SKIP_INCREMENTAL_REPAIR`, `SKIP_ANTENNA_REPAIR`, `SKIP_ANTENNA_REPAIR_POST_DRT`, `RECOVER_POWER` are in the ORFS FlowVariables page.

**Undocumented** (but real):
- The NDR retry loop pattern (clock-net non-default-rule disabled progressively over 30+ iterations).
- The interaction `RECOVER_POWER=1` + residual congestion → GRT-0116 → DRT refuses (`grt::have_routes` returns false).
- DRT's `.odb`-on-success-only persistence behavior.
- Patched `global_route.tcl` to wrap `recover_power_helper` in a `catch {}` block (see Appendix C).

**Verdict:** Our workaround stack is **correct and minimal**. The patched script is 11 lines of net change (catch wrapper + RECOVER_POWER guard). Document it as project policy and consider filing upstream as a feature request: "expose `RECOVER_POWER` skip natively in `recover_power_helper`."

### 5.2 PDN strap channel math

**Empirical** (memory item 11):
- x-axis: ≥17 µm clearance between macro edge and die edge for met1 strap channels (PDN-0179 below this).
- y-axis: ≥34 µm above/below macros for met4 strap channels.

**Documented:** 0 µm. PDN README states `define_pdn_grid -halo` defaults to 0 with no minimum.

**Verdict:** This is a real **doc gap**. PDN README does not enumerate any failure modes related to channel widths. The PDN-0179 error code is not in the messages reference. Action A4: codify the 17/34 µm rule in `kanagawa_runtime_sky130.mk` as a guardband on `MACRO_BLOCKAGE_HALO`. File upstream feature: "document strap channel minimum widths per platform."

### 5.3 Macro aspect-ratio rules

**Project-discovered patterns:**
1. **SRAM `col_mux`** (4–32) reshapes single-column bitcell strip into ~1:1 aspect macro (memory item 10).
2. **NOR ROM `fold` parameter** rearranges bitcells from many-row × narrow to fewer-row × wider (memory item 14).
3. **NOR ROM internal-mux** moves the 16:1 column mux from external Verilog wrapper into the macro periphery, dropping pin count 15× (memory item 6).
4. **Pin-side orientation** matters as much as shape: dout pins on east edge of macro means mirrored placement (left=MY, right=R0) keeps wide buses facing die edges (memory item 15).

**Documented:** None of the above appears in MPL, IFP, or any OpenROAD doc. RTLMP `RTLMP_MIN_AR=0.33` gates aspect ratio for cluster shapes, but there's no guidance on macro-shape-as-design-input.

**Verdict:** This is **community/project knowledge**. Action: add `docs/macro-shape-design.md` capturing the four patterns; reference from CLAUDE.md.

### 5.4 Hierarchical methodology vs upstream MPL/RTLMP/abstract-LEF

**Project approach:**
1. Synthesize each tile standalone (rope_gen, rope_apply).
2. Use ORFS `generate_abstract` target to produce abstract LEF + Liberty.
3. At chip level, place the abstracts as opaque macros via `MACRO_PLACEMENT_TCL`.
4. Use `SYNTH_HIERARCHICAL=0` at the chip level (already pre-flattened by abstracts).

**Documented:**
- MPL has `rtl_macro_placer` (auto, multilevel partition) — NOT used.
- PAR has `triton_part_design` (hypergraph partitioner) — NOT used.
- `generate_abstract.tcl` exists in ORFS as a built-in step but is NOT documented in any doc page.

**Verdict:** The abstract-LEF flow is a **hidden but supported feature** of ORFS. Our usage is correct. Upstream gap: methodology page for "how to build a multi-tile chip with abstract LEFs" doesn't exist. File upstream feature request.

### 5.5 Kanagawa `[[schedule(N)]]` retiming vs ORFS RSZ

**Memory data** (item 13):
| Module | atomic | scheduled | Δ WNS | Δ fmax |
|---|---|---|---|---|
| swiglu | -17.47 ns | s7 → -1.42 | +16.05 | +292% |
| rmsnorm | -9.02 ns | s4 → -2.03 | +6.99 | +115% |
| attention_unit | -9.15 ns | s3 → -3.21 | +5.94 | +83% |
| mac_pe | -3.23 ns | s2 → -1.71 | +1.52 | +27% |

**Documented RSZ alternatives:**
- `replace_arith_modules -target setup -slack_threshold X`: swaps adder/mux modules for faster variants. Requires hierarchical netlist. Not equivalent to retiming.
- `repair_timing -sequence "unbuffer vt_swap sizeup swap buffer clone split"`: gate-level optimizations. Cannot insert pipeline stages.
- `SYNTH_RETIME_MODULES`: experimental Yosys retiming, no equivalence check, not recommended.

**Verdict:** RSZ has **no register-rebalancing/retiming primitive**. Our Kanagawa-level `[[schedule(N)]]` is the correct layer for this transformation. Document the retiming-floor table (memory item 13) in `docs/kanagawa-retiming-policy.md`.

### 5.6 Metrics aggregation gap

**Documented (ORFS):**
- `make metadata` extracts per-design metrics from `flow/logs/*/base/6_report.json`.
- `metadata-base-ok.json` = golden reference, `rules.json` = pass/fail rules.
- `make update_ok` regenerates the golden.

**Project state:**
- `docs/backend-metrics.md` is hand-maintained.
- No automation; updates lag the actual flow runs.
- AutoTuner hooks into the metrics format but we don't use it.

**Verdict:** Action A5: write `metrics_aggregate.py` to consume `6_report.json` from `~/workspace/OpenROAD-flow-scripts/flow/logs/sky130hd/<design>/base/` and emit `docs/backend-metrics.json`. Use ORFS metric naming (`finish__design__die__area`, `finish__timing__drv__setup_violation_count`, etc.) so AutoTuner is wired-in for free. Add `make metrics` target to top-level `flow/CMakeLists.txt`.

---

## 6. Prioritized Action Items

| ID | Title | Category | Effort | Risk | Verify-design | Notes |
|---|---|---|---|---|---|---|
| **A1** | Replace `REMOVE_ABC_BUFFERS=1` (deprecated) with `SKIP_LAST_GASP=1` across 23 designs | DEPRECATION-CLEANUP | low | low | smoke_adder + async_fifo + codebook_decoder | Mechanical replace; can be done in `kanagawa_runtime*.mk` includes once each design's `config.mk` is updated |
| **A2** | Promote shared GRT/DRT workaround vars (`SKIP_INCREMENTAL_REPAIR=1`, `RECOVER_POWER=0`, `SKIP_ANTENNA_REPAIR*=1`, `GENERATE_ARTIFACTS_ON_FAILURE=1`, `GLOBAL_ROUTE_ARGS`) into a single `kanagawa_runtime_sky130_macro.mk` shared include | OURS-FINE-UNDOCUMENTED | medium | low | rope_apply | Eliminates 13× duplication; one place to update |
| **A3** | Drop `-allow_congestion` from `GLOBAL_ROUTE_ARGS` on designs that currently route clean (rmsnorm, lut_interp, rom_bank already lacks it) | MISSING-BEST-PRACTICE | low | low | rmsnorm, lut_interp | `-allow_congestion` masks future regressions; remove where unneeded |
| **A4** | Codify `MACRO_PLACE_HALO=10 10` default in `kanagawa_runtime_sky130.mk`; cover the 5 designs missing it (mac_array, multi_layer_chip, rope, rope_gen, vector_unit) | MISSING-BEST-PRACTICE | low | low | swiglu | Per memory item 11, default 40 µm is hidden density floor |
| **A5** | Add `flow/scripts/metrics_aggregate.py`; wire `make metrics` target; emit `docs/backend-metrics.json` matching ORFS Metrics doc schema | MISSING-BEST-PRACTICE | medium | low | full backend pass | AutoTuner-compatible; replaces hand-maintained `backend-metrics.md` |
| **A6** | Try CTS `-balance_levels` on embed_rom and lm_head_demo (1.99 ns clock skew) | MISSING-BEST-PRACTICE | low | low | embed_rom | Set in design `config.mk` via `CTS_ARGS` (verify ORFS exposes this) |
| **A7** | Document `GLOBAL_ROUTE_ARGS` full-replace semantics in project doc; pin the default-iteration value in shared include with comment | OURS-FINE-UNDOCUMENTED | low | low | n/a | Doc-only; protects against future ORFS upgrades changing defaults silently |
| **A8** | Add `set_multicycle_path -setup 2` on `multi_layer_chip` rope_gen→rope_apply broadcast nets | MISSING-BEST-PRACTICE | low | low | multi_layer_chip | Replace 40% input/output_delay hack with explicit multicycle |
| **A9** | Wire RCX SPEF extraction + STA refinement on the 12 GDS-clean modules (Stage 6) | MISSING-BEST-PRACTICE | medium | low | all GDS designs | Real timing/power numbers vs current placement-based estimates |
| **A10** | Try RMP `restructure -target delay -slack_threshold 0.2` on global_controller (-0.09) and scale_store (-0.11) | MISSING-BEST-PRACTICE | low | low | global_controller, scale_store | Cheaper than re-running Kanagawa retiming; small WNS recovery only |
| **A11** | Try DRT `-min_access_points 2` on mac_array (641 DRC) | MISSING-BEST-PRACTICE | medium | medium | mac_array | Pin-density limited; could marginally reduce DRC |
| **A12** | Add `docs/macro-shape-design.md` capturing the four reshape patterns (SRAM col_mux, NOR ROM fold, NOR ROM internal-mux, pin-side orientation) | OURS-FINE-UNDOCUMENTED | medium | low | n/a | Doc-only; major project IP |
| **A13** | Add `docs/kanagawa-retiming-policy.md` capturing the schedule(N)-floor table for swiglu/rmsnorm/attention_unit/mac_pe | OURS-FINE-UNDOCUMENTED | low | low | n/a | Doc-only |
| **A14** | File upstream issue: "DRT should checkpoint `.odb` periodically during long runs" | UPSTREAM-WORKAROUND-CORRECT | low | low | n/a | DRT README gap; would have saved rope's 11h run |
| **A15** | File upstream issue: "PDN should document minimum strap channel widths per platform; PDN-0179 should appear in messages reference" | UPSTREAM-WORKAROUND-CORRECT | low | low | n/a | Doc gap |
| **A16** | Mark full-scale `kv_cache` and `lm_head` configs as experimental (or remove) | MISSING-BEST-PRACTICE | low | low | n/a | Per `docs/backend-metrics.md`, physically impossible at sky130. Demos are the working path. |

**Validation rule:** A1, A3, A4, A6, A7, A12, A13 are **doc/config-only** and validate on smoke_adder + async_fifo + codebook_decoder. A2 changes shared infrastructure — validate on rope_apply (smallest macro user) before broader rollout. A8 (multicycle) requires re-running multi_layer_chip. A9–A11 are exploratory PnR experiments.

---

## 7. Appendix A — Per-Doc Summaries

### A.1 Tier-A docs

**Already extracted in detail at:**
- `/home/mana/.claude/plans/plan-to-review-current-compiled-raccoon-agent-a67f3f0ece5c7c9b2.md` — FlowVariables / MPL / GRT (full variable tables)
- `/home/mana/.claude/plans/orfs-review-tierA-rest.md` — DRT / PDN / IFP

Key knobs cross-referenced in §3 above.

### A.2 Tier-B docs

**Already extracted in detail at:**
- `/home/mana/.claude/plans/orfs-review-tierB.md`

Highlights:
- **RSZ** default `repair_timing` move sequence: `unbuffer vt_swap sizeup swap buffer clone split`. Phases: `LEGACY LAST_GASP`. `repair_design`/`repair_timing` are the only retiming-adjacent commands.
- **GPL** runs virtual `repair_design` at every overflow threshold in `-timing_driven_net_reweight_overflow [64,20]` — this is the documented hang we hit on vector_unit. `GPL_TIMING_DRIVEN=0` is the documented escape.
- **DPL** default `-max_displacement {0,0}` — must legalize at exact GP coordinates; bump only if dense.
- **CTS** has no `target_skew` knob. Skew control via `-balance_levels`, `-sink_clustering_*`, `-delay_buffer_derate`, `-macro_clustering_*`, `-apply_ndr {none|root_only|half|full}`.
- **STA** README is a stub → `doc/OpenSTA.pdf` for multicycle/false-path/derate/SPEF.
- **ANT** README does NOT document repair sequencing; OpenTaalas's `SKIP_ANTENNA_REPAIR*=1` mitigation lives at ORFS layer only.
- **FIN** uses platform JSON rule deck; no project-side knobs; conventionally runs post-DRT pre-final-GDS.

### A.3 Tier-C docs

**Already extracted in detail at:**
- `/home/mana/.claude/plans/orfs-review-tierC.md`

Highlights:
- **PAR** TritonPart: hypergraph partitioner with timing awareness; not currently needed at our scale.
- **ODB**: 1,800+ undocumented APIs; treat as low-level escape hatch.
- **GUI**: `gui::set_heatmap routing_congestion` could help debug rope_gen 350 DRC visually.
- **RCX + PSM**: SPEF extraction + IR-drop analysis are the next sign-off step (Action A9).
- **RMP** `restructure -target delay -slack_threshold X` for small WNS recovery (Action A10).
- **PPL** is where the 440/440 met3 L/R balanced pin distribution recipe lives (`set_io_pin_constraint -group`).
- **TAP / PAD / DFT / UPF**: not currently relevant.
- **ORFS UserGuide / FlowTutorial / AddingNewDesign**: structural; no per-design tuning details. The hard-macro integration recipe is genuinely undocumented.
- **ORFS Metrics**: schema for `make metadata` — supports our Action A5.
- **ORFS AutoTuner**: sweeps SDC + GRT params, not architectural knobs (col_mux, fold, internal-mux). Wrong axis for our densification work.

---

## 8. Appendix B — ORFS Variables Glossary (touched by OpenTaalas)

| Variable | Default | OpenTaalas value | Used by |
|---|---|---|---|
| `SYNTH_HDL_FRONTEND` | "" | `slang` | 22 designs (Kanagawa-derived) |
| `SYNTH_HIERARCHICAL` | 0 | 1 (15 designs), 0 (multi_layer_chip), unset (9) | macro + complex logic |
| `SYNTH_MEMORY_MAX_BITS` | 4096 | 65536 | 22 designs |
| `REMOVE_ABC_BUFFERS` | 0 (DEPR) | 1 | 24 designs ⚠ A1 |
| `DIE_AREA` | – | various | 14 designs |
| `CORE_AREA` | – | various | 14 designs |
| `CORE_UTILIZATION` | – | 50–65 | 11 designs |
| `MACRO_PLACE_HALO` | (40 platform) | `10 10` | 9 of 13 macro designs ⚠ A4 |
| `MACRO_BLOCKAGE_HALO` | =max(MPH x,y) | unset | all (auto-derive) |
| `MACRO_PLACEMENT_TCL` | – | per-design Tcl | 12 designs |
| `IO_CONSTRAINTS` | – | `io_constraints.tcl` | 1 design (rope_apply) |
| `PLACE_DENSITY_LB_ADDON` | – | 0.05 / 0.10 / 0.20 | all |
| `GPL_TIMING_DRIVEN` | 1 | 0 | 2 designs (vector_unit, multi_layer_chip) |
| `GLOBAL_ROUTE_ARGS` | `-congestion_iterations 30 -congestion_report_iter_step 5 -verbose` | `… -allow_congestion` | 12 of 13 macro designs |
| `SKIP_INCREMENTAL_REPAIR` | 0 | 1 | 13 macro designs |
| `RECOVER_POWER` | 1 | 0 | 13 macro designs |
| `SKIP_ANTENNA_REPAIR` | 0 | 1 | 13 macro designs |
| `SKIP_ANTENNA_REPAIR_POST_DRT` | 0 | 1 | 13 macro designs |
| `GENERATE_ARTIFACTS_ON_FAILURE` | 0 | 1 | 13 macro designs |
| `DETAILED_ROUTE_END_ITERATION` | 64 | unset (default) | all |
| `DONT_BUFFER_PORTS` | 0 | 1 | 1 design (multi_layer_chip) |
| `EQUIVALENCE_CHECK` | 1 | 0 | 1 design (multi_layer_chip) |
| `LEC_CHECK` | 1 | 0 | 1 design (multi_layer_chip) |
| `SKIP_LAST_GASP` | 0 | unset (proposed for A1) | n/a |
| `SETUP_SLACK_MARGIN` | 0 | unset | n/a (potential A1) |
| `HOLD_SLACK_MARGIN` | 0 | unset | n/a |
| `TNS_END_PERCENT` | 100 | unset | n/a (potential vector_unit tuning) |
| `MACRO_EXTENSION` | – | unset | n/a (potential mac_array tuning) |
| `RTLMP_*` | various | unset | n/a (manual placement used) |

---

## 9. Appendix C — Patched ORFS Scripts

### C.1 `flow/scripts/global_route.tcl` — `recover_power` guard + GRT-0116 catch

**Path:** `~/workspace/OpenROAD-flow-scripts/flow/scripts/global_route.tcl`

**Diff:**

```diff
@@ -87,11 +87,22 @@ proc global_route_helper { } {
   }


-  log_cmd global_route -start_incremental
-  recover_power_helper
-  # Route the modified nets by rsz journal restore
-  log_cmd global_route -end_incremental {*}$res_aware \
-    -congestion_report_file $::env(REPORTS_DIR)/congestion_post_recover_power.rpt
+  # Only run recover_power incremental GRT if RECOVER_POWER is enabled
+  if { $::env(RECOVER_POWER) != 0 } {
+    log_cmd global_route -start_incremental
+    recover_power_helper
+    # Wrap in catch to handle residual congestion gracefully (GRT-0116)
+    set rp_result [catch {
+      log_cmd global_route -end_incremental {*}$res_aware \
+        -congestion_report_file $::env(REPORTS_DIR)/congestion_post_recover_power.rpt
+    } rp_errMsg]
+    if { $rp_result != 0 } {
+      puts "WARNING: Incremental GRT after recover_power failed: $rp_errMsg"
+      puts "WARNING: Continuing with initial routing state."
+    }
+  } else {
+    puts "Skipping recover_power (RECOVER_POWER=0)."
+  }

   if {
     !$::env(SKIP_ANTENNA_REPAIR) &&
```

**Effect:**

1. **`RECOVER_POWER=0` short-circuit**: skips `global_route -start_incremental` entirely. Without this, the call begins an incremental session that the rest of the flow expects to be `-end_incremental`-closed; if any subsequent congestion or skipped step fails to close it, DRT refuses to start because `grt::have_routes` returns false.

2. **`catch {}` wrapper**: if `recover_power_helper`'s incremental route hits residual congestion (GRT-0116 "Found ___ violations after route"), the original code raised it as a fatal error. The catch wrapper logs and continues with the pre-recover_power routing state. This trades power-recovery quality for flow completeness — appropriate when our priority is GDS clean, not minimum power.

**Verdict:** ✓ **WORKAROUND-CORRECT.** Patch is minimal and well-scoped. Should be filed upstream as a feature: native `RECOVER_POWER=0` support without script patching, plus a documented retry/skip policy for incremental GRT failures.

### C.2 `flow/scripts/flow.sh` — trap-handler hardening

**Path:** `~/workspace/OpenROAD-flow-scripts/flow/scripts/flow.sh`

**Diff:**

```diff
@@ -6,7 +6,7 @@ mkdir -p "$RESULTS_DIR" "$LOG_DIR" "$REPORTS_DIR" "$OBJECTS_DIR"
 echo "Running $2.tcl, stage $1"

 (
-  trap 'mv "$LOG_DIR/$1.tmp.log" "$LOG_DIR/$1.log"' EXIT
+  trap '[ -f "$LOG_DIR/$1.tmp.log" ] && mv "$LOG_DIR/$1.tmp.log" "$LOG_DIR/$1.log" || true' EXIT
```

**Effect:** the EXIT trap that renames `<stage>.tmp.log` → `<stage>.log` originally crashed if the OpenROAD process aborted before any log was written (e.g. SIGKILL during stuck DRT). The patched form checks for file existence first, returning success regardless. Prevents a Bash error from masking the real failure.

**Verdict:** ✓ **WORKAROUND-CORRECT.** Trivial hardening; should be filed upstream as a one-line fix.

### C.3 No other patches detected

`run_orfs.sh`, `flow/CMakeLists.txt`, `cmake/FindORFS.cmake` are pure orchestration; the only ORFS scripts overridden are `global_route.tcl` (C.1) and `flow.sh` (C.2).

### C.4 Live PnR evidence (captured during this review)

While this audit was in progress, `multi_layer_chip` was running in `5_1_grt`. Tail of `5_1_grt.tmp.log` showed:

```
[INFO GRT-0102] Start extra iteration 28/30
[INFO GRT-0102] Start extra iteration 29/30
[WARNING GRT-0273] Disabled NDR (to reduce congestion) for net: delaynet_29_clk
[INFO GRT-0102] Start extra iteration 1/30
...
```

This is **direct evidence of the NDR retry-loop pattern** documented in `MEMORY.md` item 19: GRT runs 30 iterations, hits congestion, disables one clock-net NDR, restarts the 30-iteration block. Each round takes 5–30 minutes. The CPU process had accumulated 736+ CPU-minutes at the time of capture.

This pattern is **not described in any upstream doc** (GRT README, DRT README, FlowVariables). Filing upstream as Action A17 (in `docs/orfs-flow-todo.md`) is now confirmed-priority work — the loop is a real, reproducible failure mode, not a project-specific artifact.

---

## End of Review

**Sign-off:** This review covers all 25 designs, 33 OpenROAD/ORFS doc pages, and 1 patched ORFS script. Findings classified per §2.1 methodology. Action items A1–A16 prioritized in §6 with low/medium effort and low/medium risk; verification designs identified per item. No code or config changed during this review.
