# OpenTaalas RTL2GDS Flow — TODO List

Consolidated action items from `docs/orfs-flow-review.md`. Read-only audit deliverables; nothing in this list has been applied. Each item carries effort, risk, validation strategy, and rationale so it can be picked up later without re-deriving the context.

**Status legend:** ☐ open · ◐ partial · ☑ done · ⊘ wontfix

**Validation tiering** (apply lowest-risk first):
- **Tier 0 (sanity)**: smoke_adder (trivial), async_fifo (small, no macros)
- **Tier 1 (logic)**: codebook_decoder (smallest macro user, MET timing)
- **Tier 2 (macro)**: rope_apply (smallest, no actual macros) → swiglu (3 small SRAMs) → kv_cache_demo (densest, 0 DRC)
- **Tier 3 (full)**: rmsnorm, lut_interp, embed_rom, llama_chip
- **Tier 4 (blocked)**: mac_array, rope_gen, vector_unit, multi_layer_chip

---

## Phase 1 — Mechanical cleanup (low effort, low risk)

### ☐ A1. Replace `REMOVE_ABC_BUFFERS=1` with `SKIP_LAST_GASP=1`

**Why:** ORFS docs explicitly mark `REMOVE_ABC_BUFFERS` as DEPRECATED. Recommended replacements: `SETUP_SLACK_MARGIN`/`HOLD_SLACK_MARGIN` (numerical slack target) or `SKIP_LAST_GASP=1` (skip the last-gasp gate-resize phase that re-introduces the buffers we want to strip).

**Affected designs:** 24 of 25 (every design except `smoke_adder`). Verified by `grep -l 'REMOVE_ABC_BUFFERS' flow/designs/sky130hd/*/config.mk`.

**Implementation:**
- Add `export SKIP_LAST_GASP = 1` to `kanagawa_runtime.mk` (line near top, before per-design includes can override).
- In each per-design `config.mk`, change `export REMOVE_ABC_BUFFERS = 1` → delete the line (let shared include set `SKIP_LAST_GASP`).
- Designs with no Kanagawa include (`async_fifo`, `smoke_adder`) need explicit `export SKIP_LAST_GASP = 1` if their timing changes when `REMOVE_ABC_BUFFERS` is removed.

**Validation:**
1. Tier 0 — smoke_adder + async_fifo. Diff metrics: WNS, cell area, DRC count. Must be ≤ baseline.
2. Tier 1 — codebook_decoder. Currently MET (-0.02 ns); regression here would be most visible.
3. Tier 3 — full pass on rmsnorm + lut_interp.

**Risk:** low. The two flags are nearly equivalent, but `SKIP_LAST_GASP` is more surgical (only skips the LAST_GASP phase, not all ABC buffer cleanup).

**References:** ORFS FlowVariables doc; review §3.1, §6 row A1.

---

### ☐ A3. Drop `-allow_congestion` from designs that route clean without it

**Why:** `-allow_congestion` tells GRT to *accept* overflow violations rather than retry. Currently set defensively on 12 of 13 macro designs. Three of those route to 0 DRC with no overflow — meaning the flag never fires but masks any future regression.

**Affected designs:** rmsnorm (0 DRC, MET adjacent), lut_interp (0 DRC, MET timing).

(Note: rom_bank already lacks `-allow_congestion` and is 0 DRC — confirms this works.)

**Implementation:**
- In `flow/designs/sky130hd/rmsnorm/config.mk` and `flow/designs/sky130hd/lut_interp/config.mk`, change:
  ```make
  export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
  ```
  to:
  ```make
  export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose
  ```

**Validation:** re-PnR each design. If GRT converges with 0 overflow as before, ship. If not, restore.

**Risk:** low — easy revert.

---

### ☐ A4. Codify `MACRO_PLACE_HALO=10 10` default in shared include

**Why:** sky130hd platform default is **40 µm**. We've empirically established (memory item 11) that 10 µm works for non-congested macro layouts; 40 µm becomes a hidden density floor. Currently 5 of 13 macro designs leave it unset (mac_array, multi_layer_chip, rope, rope_gen, vector_unit) — falling back to 40.

**Implementation:**
- Add `export MACRO_PLACE_HALO ?= 10 10` to `kanagawa_runtime_sky130.mk` (use `?=` so per-design overrides still work).
- Per-design configs that explicitly set `10 10` can keep their lines (no-op) or drop them.
- Designs that need a different halo (mac_array might need wider for 641-DRC pin-density issue) can override.

**Validation:**
1. Tier 0 — confirms shared-include logic does not break baseline.
2. Tier 2 — rope_apply, swiglu, kv_cache_demo (already set 10 10 — no-op verification).
3. Tier 3 — rmsnorm, lut_interp.
4. Tier 4 — multi_layer_chip, vector_unit. Watch for new PDN-0179 errors if halo change interacts with strap channels.

**Risk:** low for designs already at 10 µm; medium for the 5 designs currently relying on platform 40 µm default — those may see different placement.

**Cross-reference:** Part of §5.2 PDN strap-channel codification.

---

### ☐ A7. Document `GLOBAL_ROUTE_ARGS` full-replace semantics

**Why:** Setting `GLOBAL_ROUTE_ARGS` fully replaces the ORFS defaults rather than appending. Our 13 macro designs duplicate the defaults explicitly (`-congestion_iterations 30 -congestion_report_iter_step 5 -verbose`) and append `-allow_congestion`. If ORFS upgrades default iteration count to 50, our configs lock to 30 forever — silent regression.

**Implementation:**
- Add comment block to `kanagawa_runtime_sky130.mk` explaining the full-replace behavior.
- Optionally extract `_KANAGAWA_GRT_DEFAULTS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose` into a make variable that per-design configs append to:
  ```make
  export GLOBAL_ROUTE_ARGS = $(_KANAGAWA_GRT_DEFAULTS) -allow_congestion
  ```

**Validation:** mechanical; no PnR change expected.

**Risk:** low (doc-only).

---

### ☐ A12. Write `docs/macro-shape-design.md`

**Why:** Four reshape patterns underpin our densification wins; none documented upstream. Codifying preserves project IP and enables onboarding.

**Content outline:**
1. **SRAM `col_mux` reshape** — single-column bitcell strip → ~1:1 aspect (memory item 10). Reference `tools/rom_compiler/sram_compiler.py`.
2. **NOR ROM `fold` parameter** — bit-cell rearrangement (memory item 14). Reference `tools/rom_compiler/nor_rom_compiler.py`.
3. **NOR ROM internal-mux** — moving 16:1 column mux into macro periphery (memory item 6). 15× pin-count drop.
4. **Pin-side orientation** — wide-bus dout pins must face routing capacity, not other macros (memory item 15). Always read PIN coords from LEF.

**Validation:** doc-only.

---

### ☐ A13. Write `docs/kanagawa-retiming-policy.md`

**Why:** `[[schedule(N)]]` retiming is the highest-leverage WNS recovery tool we have. Ours-fine-undocumented; future maintainers shouldn't re-derive the floor table.

**Content outline:**
- The schedule(N)-floor table for swiglu/rmsnorm/attention_unit/mac_pe/mac_array (memory item 13).
- The ~12 logic levels per stage rule for sky130 BF16 multipliers.
- The compile flags `--frequency=250 --register-ratio=8 --max-register-ratio=16` and where they're set (`add_kanagawa_rtl()` in `rtl/CMakeLists.txt`).
- The trade-off: pushing N+1 typically regresses; always test deeper schedules.
- Compatibility note: SyncRam read-latency disrupts existing pipelines (swiglu v5 regression).

**Validation:** doc-only.

---

### ☐ A16. Mark full-scale `kv_cache` / `lm_head` configs experimental

**Why:** Per `docs/backend-metrics.md`, full-scale variants are physically impossible at sky130 (4–22× shuttle reticle). Currently both configs exist alongside the working `*_demo` variants and could mislead a new contributor.

**Options:**
1. Rename to `kv_cache_unfeasible/` and `lm_head_unfeasible/` with a stub README.
2. Move to `flow/designs/sky130hd/_experimental/`.
3. Delete entirely; `git log` preserves history.

**Recommended:** Option 1 (preserves discoverability for the area-budget conversation but signals status).

**Validation:** mechanical rename + `flow/CMakeLists.txt` `add_orfs_design()` line update.

**Risk:** low.

**Confirmed wired in CMake** (verified during this review):
```
add_orfs_design(NAME kv_cache          PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/kv_cache")
add_orfs_design(NAME lm_head           PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/lm_head")
```
Both `pnr_kv_cache` and `pnr_lm_head` targets are buildable today and would burn engineer time before failing on physical limits.

---

## Phase 2 — Shared infrastructure (medium effort, low risk)

### ☐ A2. Promote shared GRT/DRT workarounds into `kanagawa_runtime_sky130_macro.mk`

**Why:** 13 macro designs currently duplicate this 6-line block:
```make
export RECOVER_POWER = 0
export SKIP_INCREMENTAL_REPAIR = 1
export SKIP_ANTENNA_REPAIR = 1
export SKIP_ANTENNA_REPAIR_POST_DRT = 1
export GENERATE_ARTIFACTS_ON_FAILURE = 1
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
```

This is 78 lines of duplication. One file to update, one place to validate the patched-`global_route.tcl` contract.

**Implementation:**
- Create `flow/designs/kanagawa_runtime_sky130_macro.mk` that includes `kanagawa_runtime_sky130.mk` and adds the shared workaround block.
- Migrate the 13 designs' `config.mk` to include the new file.
- Combine with A4 (default `MACRO_PLACE_HALO`) — single place for all macro defaults.

**Validation:**
1. Tier 2 — rope_apply (most isolated).
2. Tier 3 — rmsnorm, lut_interp, codebook_decoder, swiglu (mid-size macro designs).
3. Tier 4 — vector_unit, multi_layer_chip (verify no behavior change).

**Risk:** low. Pure refactor.

---

### ☐ A5. `metrics_aggregate.py` + `make metrics` target

**Why:** `docs/backend-metrics.md` is hand-maintained; updates lag actual flow runs. ORFS has a documented `make metadata` target with `metadata-base-ok.json` golden file. Auto-aggregation gives:
- AutoTuner compatibility (free).
- CI gating (`pnr_<name>` target fails if WNS regresses by more than X ns).
- Eliminates manual update step on `backend-metrics.md`.

**Implementation:**
- New file `flow/scripts/metrics_aggregate.py`:
  - Reads `~/workspace/OpenROAD-flow-scripts/flow/logs/sky130hd/<design>/base/6_report.json` for each design listed in `flow/CMakeLists.txt`.
  - Extracts: `finish__design__die__area`, `finish__design__instance__area__stdcell`, `finish__design__instance__utilization`, `finish__timing__setup__ws`, `finish__timing__setup__tns`, `finish__timing__drv__setup_violation_count`, `finish__power__total`, `finish__route__drc_errors`.
  - Emits `docs/backend-metrics.json` (machine-readable) + optionally regenerates the table sections of `docs/backend-metrics.md`.
- New CMake target `metrics` in top-level `flow/CMakeLists.txt`:
  ```cmake
  add_custom_target(metrics
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/scripts/metrics_aggregate.py
                    --designs ${_orfs_designs}
                    --output ${CMAKE_SOURCE_DIR}/docs/backend-metrics.json)
  ```

**Validation:**
- Run `make metrics` after a known-good PnR pass; diff resulting JSON against hand-counted values from `backend-metrics.md`.
- Add CI gate: `pnr_<design>` target depends on `metrics` for that design and fails if WNS regresses.

**Risk:** low. Read-only against ORFS report files.

---

## Phase 3 — Tuning experiments (low–medium effort, low–medium risk)

### ☐ A6. CTS `-balance_levels` for embed_rom / lm_head_demo

**Why:** Both designs have a single 35-mm-tall NOR ROM macro and 1.99 ns clock skew (memory item 6). CTS `-balance_levels` equalizes non-register depths in the clock tree — should help when the macro creates a tall, narrow clock-distribution problem.

**Implementation:** Per-design override in `config.mk`:
```make
export CTS_ARGS = -balance_levels
```
(Verify `CTS_ARGS` is the right ORFS variable name; if not, pass via `POST_FLOOR_PLAN_TCL` hook.)

**Validation:** Tier 3. Compare clock skew, WNS, runtime against baseline.

**Risk:** medium. CTS changes ripple into placement/routing.

---

### ☐ A8. `set_multicycle_path -setup 2` on multi_layer_chip broadcast

**Why:** rope_gen → rope_apply 1024-bit cos/sin broadcast spans ~5 mm sky130hd met4/5. Currently we use 40% I/O delay budget (memory: ~1.6 ns reserved) — works but is a magic number. Multicycle is the documented STA pattern for known-slow inter-tile paths.

**Implementation:**
- In `flow/designs/sky130hd/multi_layer_chip/constraint.sdc`, add:
  ```tcl
  set_multicycle_path -setup 2 -from [get_pins {rope_gen_inst/cos_table*/Q rope_gen_inst/sin_table*/Q}] -to [get_pins {layer_*_inst/x_*_reg*/D}]
  set_multicycle_path -hold 1 -from [get_pins {rope_gen_inst/cos_table*/Q rope_gen_inst/sin_table*/Q}] -to [get_pins {layer_*_inst/x_*_reg*/D}]
  ```
- Drop the 40% input/output_delay on rope_gen / rope_apply SDCs (or reduce to 20%).

**Validation:** Tier 4 (multi_layer_chip). Compare WNS on the broadcast paths specifically.

**Risk:** medium. Multicycle requires the receiving register to actually clock 2 cycles between launches — verify Kanagawa wavefront-thread scheduling supports this.

---

### ☐ A9. Wire RCX SPEF extraction + STA refinement (Stage 6)

**Why:** Current STA uses placement-based parasitics; routed parasitics differ significantly on macro-bearing designs. RCX gives real numbers for the 12 GDS-clean modules. Pairs with PSM IR-drop for full sign-off.

**Implementation:**
- Add `extract_parasitics` step after DRT in ORFS (RCX has its own ORFS stage).
- Calibrate sky130hd RCX rules once: `rcx::calibrate -ext_model_file <golden>`.
- Re-run STA with `read_spef <design>.spef` after extraction.
- Add `pnr_<design>_rcx` CMake target.

**Validation:** all 12 GDS-clean designs. Compare WNS placement-based vs SPEF-based; expect 10–20% pessimism on routed.

**Risk:** medium. RCX calibration is one-time but non-trivial. PSM (IR drop) is a separate follow-up after RCX lands.

**References:** Tier-C summary §1, action item A9.

---

### ☐ A10. RMP small-WNS recovery for global_controller / scale_store

**Why:** Both designs are within 0.11 ns of MET. RMP `restructure -target delay -slack_threshold 0.2` is documented for exactly this gap-closing use case. Cheaper than re-running Kanagawa retiming.

**Implementation:**
- Per-design hook (`POST_GPL_TCL`?) calling `restructure -target delay -slack_threshold 0.2 -tielo_pin sky130_fd_sc_hd__conb_1/LO -tiehi_pin sky130_fd_sc_hd__conb_1/HI`.
- Or run as separate stage between `place` and `cts`.

**Validation:** Tier 1. Compare WNS, area, runtime.

**Risk:** medium. RMP regressions can hurt area; tune `-slack_threshold` carefully.

**References:** Tier-C summary §6 / RMP README.

---

### ☐ A11. DRT `-min_access_points 2` for mac_array

**Why:** mac_array stuck at 641 DRC after 64 DRT iterations. Pin-density limited — 880-pin nor_rom_1024x880 macro pins crowd the routing channels. `-min_access_points 2` forces DRT to find at least 2 access points per pin before declaring legal — increases pin-access success rate at cost of runtime.

**Implementation:**
- ORFS exposes `MIN_ACCESS_POINTS` env var? Check FlowVariables; if not, patch `detail_route.tcl` to pass through.
- Alternative: `MACRO_EXTENSION 2` to give the blockage some breathing room, slightly relieving the pin congestion zone.

**Validation:** Tier 4. Compare DRC count, DRT iteration count, runtime. Likely 2–4× longer DRT but should reduce DRC.

**Risk:** medium. Long DRT runs lose data on partial convergence (see A14 — file upstream).

---

## Phase 4 — Upstream contributions (low effort each, requires followup)

### ☐ A14. File upstream issue: DRT `.odb` checkpointing

**Title:** "DRT should periodically checkpoint .odb during long runs"

**Body:**
- Current behavior: DRT writes `.odb` only on full convergence (all DRC clean).
- Failure mode: long runs (e.g. 11h on rope) that converge to a low-but-nonzero DRC count and then exit at iter cap lose all routing data; only `5_route_drc.rpt-N.rpt` files survive.
- Suggested fix: every M iterations (configurable via `-checkpoint_iter_step`), write a snapshot `.odb` so partial-convergence runs are recoverable.

**Repo:** https://github.com/The-OpenROAD-Project/OpenROAD/issues

---

### ☐ A15. File upstream issue: PDN strap-channel docs

**Title:** "PDN README should document minimum strap-channel widths per platform; PDN-0179 should appear in messages reference"

**Body:**
- PDN-0179 "Unable to repair all channels" is a common failure mode for compact dies with macros.
- No upstream guidance exists on minimum channel widths.
- Empirical floors (sky130hd): ~17 µm met1 x-axis, ~34 µm met4 y-axis between macro edge and die edge.
- Suggested: per-platform PDN reference page, plus messages reference entry.

**Repo:** https://github.com/The-OpenROAD-Project/OpenROAD/issues

---

### ☐ A17. File upstream issue: `recover_power` graceful failure

**Title:** "recover_power_helper should support `RECOVER_POWER=0` natively, with documented retry policy on residual congestion"

**Body:**
- Our patched `flow/scripts/global_route.tcl` (see review §C) wraps the `global_route -end_incremental` after `recover_power_helper` in a `catch {}` block and adds a `RECOVER_POWER==0` short-circuit.
- The unguarded original makes DRT refuse (`grt::have_routes` returns false) when GRT-0116 fires inside `recover_power_helper`.
- Suggested: native support, plus a `--continue_on_recover_power_failure` flag.

**Repo:** OpenROAD-flow-scripts

**Live evidence captured during this review:** `multi_layer_chip` GRT log showed:
```
[INFO GRT-0102] Start extra iteration 28/30
[INFO GRT-0102] Start extra iteration 29/30
[WARNING GRT-0273] Disabled NDR (to reduce congestion) for net: delaynet_29_clk
[INFO GRT-0102] Start extra iteration 1/30
```
This is the textbook NDR retry pattern — confirmed reproducible, not a project artifact. Should make the upstream issue easy to write.

---

### ☐ A20. File upstream issue: `flow.sh` trap hardening

**Title:** "flow.sh trap should tolerate missing tmp.log on early exit"

**Body:**
- Original: `trap 'mv "$LOG_DIR/$1.tmp.log" "$LOG_DIR/$1.log"' EXIT`
- Patched (project-side): `trap '[ -f "$LOG_DIR/$1.tmp.log" ] && mv "$LOG_DIR/$1.tmp.log" "$LOG_DIR/$1.log" || true' EXIT`
- Failure case: if OpenROAD aborts via SIGKILL before any log is written, the trap fails with a non-zero exit code, masking the real failure.
- Suggested: one-line change as above.

**Repo:** OpenROAD-flow-scripts

**Note:** This was a second ORFS patch found in the local repo during the review (in addition to `global_route.tcl`). See review §C.2 for the diff.

---

## Phase 5 — Project-internal documentation (low effort, no risk)

### ☐ A18 (new). Add architecture diagram of ORFS flow stages we use

**Why:** New contributors need a single overview of: synth → IFP → PDN → MPL → GPL → DPL → CTS → GRT → DRT → ANT → FIN. Mark which stages we patch (GRT) and which knobs we override per-design (most stages).

**Implementation:** ASCII or Mermaid diagram in `docs/orfs-reference.md` (extend the existing file).

---

### ☐ A21 (new). Clean stale comments in macro_place.tcl files

**Findings observed during this review (read-only check):**

- `flow/designs/sky130hd/multi_layer_chip/macro_place.tcl` ASCII art header says die is "6000 wide × 6500 tall" but the actual `DIE_AREA` in the same design's `config.mk` is `0 0 9000 6500`. The script logic correctly uses 9000 (rope_gen at x=3000 = (9000-3000)/2 centered). Only the comment is stale.
- `flow/designs/sky130hd/kv_cache_demo/macro_place.tcl` line 2 says "centered in 595×710 die" but `DIE_AREA` is `0 0 595 705`. 5 µm difference — likely from a die-shrink iteration where the comment didn't follow.

**Implementation:** trivial comment fix; rerun PnR not required.

**Risk:** zero (comment-only).

---

### ☐ A19. Move `docs/orfs-flow-review.md` references into `CLAUDE.md`

**Why:** The review references several memory-only findings. Once the review is the source of truth, link from CLAUDE.md so memory entries can decay without losing the data.

**Implementation:** add "Flow review" section to project-level `CLAUDE.md` pointing at `docs/orfs-flow-review.md` and `docs/orfs-flow-todo.md`.

---

## Quick reference: dependency order for picking these up

```
Phase 1 (cleanup, parallel) → Phase 2 (shared infra) → Phase 3 (experiments)
                                                       └─ Phase 4 (upstream, anytime)
                                                       └─ Phase 5 (docs, anytime)

Within Phase 1:
  A1, A4, A7 can run in parallel
  A3 depends on A7 (so refactor doesn't break -allow_congestion intent)
  A12, A13, A16 are doc-only, fully independent

Within Phase 2:
  A2 depends on A4 (consolidates MACRO_PLACE_HALO default)
  A5 fully independent

Phase 3 items are all independent of each other.
```

## Validation harness checklist

Before any Phase 1+ change ships:

- [ ] Snapshot pre-change metrics: `make metrics` output to `docs/backend-metrics-pre-{action}.json`
- [ ] Apply change to **one Tier 0 design** first (smoke_adder). Re-run PnR.
- [ ] Diff: WNS, TNS, cell area, DRC count, runtime. Must be ≤ baseline.
- [ ] Promote to next tier (1 → 2 → 3).
- [ ] Tier 4 designs validate **last**, never first (long PnR runs).
- [ ] Document the validation result in this TODO file (move from ☐ to ☑ with one-line note).

## Out of scope for this TODO

- RTL changes (Kanagawa source, Chisel source).
- Platform-level `config.mk` changes in `~/workspace/OpenROAD-flow-scripts/flow/platforms/sky130hd/`.
- Tooling changes outside `flow/`, `tools/rom_compiler/`, and `docs/`.
- Anything that would alter results of in-flight PnR runs.

---

## Session notes (2026-05-08)

Captured during the review (this session):

- **Live PnR observed:** `multi_layer_chip` is in `5_1_grt`, has accumulated 739+ CPU-minutes and is actively cycling through GRT extra-iteration rounds with NDR disable retries (most recent: `delaynet_29_clk` disabled). This is the documented NDR retry pattern, not a stuck flow.
- **Local ORFS modifications discovered:**
  - `flow/scripts/global_route.tcl` — patched (catch wrapper + `RECOVER_POWER==0` guard). Already documented in review §C.1.
  - `flow/scripts/flow.sh` — patched (trap-handler tolerates missing `tmp.log`). Newly documented in review §C.2; tracked here as A20.
  - Untracked `flow/designs/sky130hd/rocketchip*/` directories (7 variants) — appear unrelated to OpenTaalas; investigate provenance before any cleanup.
- **Pre-existing untracked items** (`git status` from `~/workspace/OpenROAD-flow-scripts/`): rocketchip variants in both `designs/sky130hd/` and `designs/src/`. Not part of OpenTaalas; mark for separate triage.
- **No PnR-blocking issues identified** during the audit. All findings are cleanup, codification, or upstream feature requests.

**Next session pickup:**
1. Read this file end-to-end.
2. Pick a Phase 1 item (A1, A3, A4, A7, A12, A13, A16, A21 are all parallelizable doc-only or low-risk config-only).
3. Validate per the §"Validation harness checklist" above.
4. Move ☐ → ☑ with a one-line note when complete.
