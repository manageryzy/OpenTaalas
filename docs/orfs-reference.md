# ORFS (OpenROAD Flow Scripts) Reference

## Configuration Template

**config.mk example:**
```makefile
export DESIGN_NICKNAME = mydesign
export DESIGN_NAME = TopModule
export PLATFORM    = sky130hd

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.sv))

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc
export SYNTH_HDL_FRONTEND = slang
export SYNTH_HIERARCHICAL = 1
export SYNTH_MINIMUM_KEEP_SIZE = 5000
export CORE_UTILIZATION = 60
export PLACE_DENSITY_LB_ADDON = 0.2
export SKIP_LAST_GASP = 1     # replaces deprecated REMOVE_ABC_BUFFERS
export SYNTH_MEMORY_MAX_BITS = 65536
export LEC_CHECK = 0
```

> The project's existing 24 designs still use `REMOVE_ABC_BUFFERS = 1` (deprecated upstream); migration to `SKIP_LAST_GASP` is tracked in [`orfs-flow-todo.md`](orfs-flow-todo.md) item A1.

**constraint.sdc example:**
```sdc
set clk_name  core_clock
set clk_port  clock
set clk_period 15.0

current_design TopModule

create_clock -name $clk_name -period $clk_period [get_ports $clk_port]

set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports $clk_port]]

if {[llength $non_clock_inputs] > 0} {
  set_input_delay  [expr $clk_period * 0.2] -clock $clk_name $non_clock_inputs
}
set_output_delay [expr $clk_period * 0.2] -clock $clk_name [all_outputs]
```

**SDC gotcha:** Must exclude clock port from `set_input_delay` using `lsearch` with `[get_ports $clk_port]` (port object, not string). Otherwise STA-0441 warning.

## Key Config Parameters

| Parameter | Purpose | Notes |
|-----------|---------|-------|
| `SYNTH_HDL_FRONTEND = slang` | SystemVerilog parser | Required for `.sv` files |
| `SYNTH_HIERARCHICAL = 1` | Hierarchical synthesis | Essential for complex designs |
| `SYNTH_MEMORY_MAX_BITS = 65536` | Max memory as flip-flops | Default 4096 too small for 512x64 SRAMs |
| `SYNTH_MINIMUM_KEEP_SIZE = 5000` | Min module size to keep hierarchy | Prevents flattening large modules |
| `SKIP_LAST_GASP = 1` | Skip ABC last-gasp resize | Replaces deprecated `REMOVE_ABC_BUFFERS = 1` |
| `LEC_CHECK = 0` | Skip logic equivalence check | Speeds up flow |
| `GPL_TIMING_DRIVEN = 0` | Skip GPL-internal repair_design | Essential for designs >250K cells (GPL repair hangs silently); resize.tcl still does timing repair |
| `SKIP_INCREMENTAL_REPAIR = 1` | Skip repair_design/timing in GRT | Prevents incremental GRT NDR retry loops |
| `RECOVER_POWER = 0` | Skip incremental GRT power recovery | Pairs with `SKIP_INCREMENTAL_REPAIR` to avoid GRT-0116 → DRT refusal |
| `SKIP_ANTENNA_REPAIR = 1` + `SKIP_ANTENNA_REPAIR_POST_DRT = 1` | Skip antenna repair before+after DRT | Antenna repair triggers incremental GRT that gets stuck |
| `SYNTH_HIERARCHICAL = 1` | Hierarchical synthesis | **Mandatory** for macro-bearing designs (avoids 15h+ synthesis on flatten) |
| `MACRO_PLACE_HALO = 10 10` | Macro-to-stdcell halo | Default 40 µm too large for small macros — drop to 10 if cells sparse |
| `EQUIVALENCE_CHECK = 0` + `LEC_CHECK = 0` | Skip LEC | Required for designs that include macro abstracts (KeplerFormal LEC crashes on >500-output truth tables) |

## Failure Modes & Diagnosis

| Error | Stage | Meaning | Fix |
|-------|-------|---------|-----|
| `DPL-0036` | Detailed placement | N cells can't be placed | Reduce CORE_UTILIZATION or PLACE_DENSITY_LB_ADDON |
| `GRT-0116` | Global routing | Congestion overflow | Reduce utilization OR increase PLACE_DENSITY_LB_ADDON |
| `DPL-0036` in CTS | Clock tree synthesis | CTS buffers pushed util over edge | Need ~5% headroom beyond post-resize util |
| `STA-0441` | Timing analysis | Input delay on clock port | Exclude clock from `set_input_delay` in SDC |
| GPL silent hang on big designs | Global place (3_3) | repair_design uses 1 core for hours, no log progress | Set `GPL_TIMING_DRIVEN = 0`. Documented on vector_unit (791K cells); applies to designs >250K |
| KLayout `Stream has unknown format` | GDS merge (6_1_merge) | Macro `.gds` files are placeholder stubs (~250 bytes) | Cosmetic — routing/odb is valid. Real macro GDS would fix it |
| `MPL-0055` "Couldn't find solution at requested utilization" | Macro placement (2_2) | Halo + density too tight for the macro count | Reduce `MACRO_PLACE_HALO` or increase die area |
| GRT NDR retry death-spiral | Global routing (5_1) | Single-cell overflow loops disabling NDR for hours | Use `-allow_congestion` (eventually accepts overflow) |

**Key insights:**
- Post-resize utilization != final utilization -- CTS adds ~4-5% from clock buffers, fill cells add more
- Buffer insertion chain: synthesis resize (+0.5%) -> CTS clock buffers (+4%) -> timing repair (+1%) = ~5.5% total overhead
- PLACE_DENSITY_LB_ADDON of 0.0 causes uneven cell distribution -> routing congestion; 0.1-0.2 is the sweet spot
- Relaxed timing helps -- fewer timing repair buffers = more cell headroom
- On sky130hd, practical utilization ceiling is ~60% CORE_UTILIZATION -> ~68% final utilization for complex designs

## Running Parallel P&R Experiments

Each variant needs:
1. Unique `DESIGN_NICKNAME` in config.mk
2. Unique SDC file path (avoid double-suffix: hardcode path)
3. Symlinked source directory: `ln -sfn mydesign mydesign_variant`
4. Separate output directories (automatic from DESIGN_NICKNAME)

```bash
# Create variant
mkdir -p flow/designs/sky130hd/mydesign_fast/
# Write config.mk and constraint.sdc
cd flow/designs/src && ln -sfn mydesign mydesign_fast

# Run (from flow/ directory)
source ~/workspace/eda-env.sh
make DESIGN_CONFIG=designs/sky130hd/mydesign_fast/config.mk 2>&1 &
```

**Gotcha:** All variants share synthesis if DESIGN_NICKNAME differs only in the config -- synthesis is cached per DESIGN_NICKNAME. Clean with `make clean_all DESIGN_CONFIG=...` if needed.

## Output Files

```
flow/results/sky130hd/<nickname>/base/6_final.gds    # Final GDS
flow/reports/sky130hd/<nickname>/base/6_finish.rpt    # Final timing report
flow/reports/sky130hd/<nickname>/base/5_route_drc.rpt # DRC violations (empty = clean)
flow/logs/sky130hd/<nickname>/base/6_report.json      # Machine-readable metrics
```

## Quick Metrics Extraction

```bash
# From JSON
python3 -c "
import json
with open('flow/logs/sky130hd/<nickname>/base/6_report.json') as f:
    d = json.load(f)
print(f'Die area: {d[\"finish__design__die__area\"]} um2')
print(f'Utilization: {d[\"finish__design__instance__utilization\"]:.1%}')
print(f'Setup violations: {d[\"finish__timing__drv__setup_violation_count\"]}')
print(f'Power: {d[\"finish__power__total\"]:.3f} W')
"

# From report
head -20 flow/reports/sky130hd/<nickname>/base/6_finish.rpt  # WNS, TNS, fmax
wc -l flow/reports/sky130hd/<nickname>/base/5_route_drc.rpt  # 0 = clean
```
