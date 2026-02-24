# OpenTaalas — Project Instructions

## Project Overview

Open-source ASIC for LLM inference, inspired by [Taalas](https://taalas.com). Target: sky130hd PDK via OpenROAD.

## EDA Environment Setup

### Tool Chain

**Required tools (all in `~/workspace/`):**

| Tool | Version | Why This Version | Location |
|------|---------|-----------------|----------|
| Mill | 0.11.1 | From `overlay.nix` in rocket-chip | `~/workspace/bin/mill` |
| firtool | 1.59.0 | From `chisel/etc/circt.json` | `~/workspace/firtool-1.59.0/` |
| JDK | 17 | Scala 2.13 incompatible with JDK 25 | `~/workspace/jdk-17.0.2/` |
| dtc | latest | Required for boot ROM generation | `~/workspace/bin/dtc` |
| OpenROAD | 26Q1 | ORFS install | `~/workspace/OpenROAD-flow-scripts/` |

**Critical version rules:**
- firtool version MUST match `chisel/etc/circt.json` — newer versions remove flags (`-dedup`) and change verification encoding
- Mill version MUST match `overlay.nix` — newer versions break Scala compilation
- JDK 17 required — JDK 25 causes `bad constant pool index` with Scala 2.13

**firtool wrapper script** (`~/workspace/bin/firtool`):
```sh
#!/bin/sh
LD_LIBRARY_PATH=/home/mana/workspace/firtool-1.59.0/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH} exec /home/mana/workspace/firtool-1.59.0/bin/firtool "$@"
```

**Environment activation:**
```bash
# eda-env.sh loads OpenROAD tools
source ~/workspace/eda-env.sh

# For Chisel/Mill elaboration
export JAVA_HOME=~/workspace/jdk-17.0.2
export PATH=~/workspace/bin:$PATH
```

### ORFS Configuration Template

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
export REMOVE_ABC_BUFFERS = 1
export SYNTH_MEMORY_MAX_BITS = 65536
export LEC_CHECK = 0
```

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

### Key ORFS Config Parameters

| Parameter | Purpose | Notes |
|-----------|---------|-------|
| `SYNTH_HDL_FRONTEND = slang` | SystemVerilog parser | Required for `.sv` files |
| `SYNTH_HIERARCHICAL = 1` | Hierarchical synthesis | Essential for complex designs |
| `SYNTH_MEMORY_MAX_BITS = 65536` | Max memory as flip-flops | Default 4096 too small for 512x64 SRAMs |
| `SYNTH_MINIMUM_KEEP_SIZE = 5000` | Min module size to keep hierarchy | Prevents flattening large modules |
| `REMOVE_ABC_BUFFERS = 1` | Remove ABC-inserted buffers | Lets OpenROAD handle buffering |
| `LEC_CHECK = 0` | Skip logic equivalence check | Speeds up flow |

### ORFS Failure Modes & Diagnosis

| Error | Stage | Meaning | Fix |
|-------|-------|---------|-----|
| `DPL-0036` | Detailed placement | N cells can't be placed | Reduce CORE_UTILIZATION or PLACE_DENSITY_LB_ADDON |
| `GRT-0116` | Global routing | Congestion overflow | Reduce utilization OR increase PLACE_DENSITY_LB_ADDON (better cell distribution) |
| `DPL-0036` in CTS | Clock tree synthesis | CTS buffers pushed util over edge | Need ~5% headroom beyond post-resize util |
| `STA-0441` | Timing analysis | Input delay on clock port | Exclude clock from `set_input_delay` in SDC |

**Key insights from prior P&R work:**
- Post-resize utilization != final utilization — CTS adds ~4-5% utilization from clock buffers, fill cells add more
- Buffer insertion chain: synthesis resize (+0.5%) -> CTS clock buffers (+4%) -> timing repair (+1%) = ~5.5% total overhead
- PLACE_DENSITY_LB_ADDON of 0.0 causes uneven cell distribution -> routing congestion; 0.1-0.2 is the sweet spot
- Relaxed timing helps — fewer timing repair buffers = more cell headroom
- On sky130hd, practical utilization ceiling is ~60% CORE_UTILIZATION -> ~68% final utilization for complex designs

### Running Parallel P&R Experiments

**Each variant needs:**
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

**Gotcha:** All variants share synthesis if DESIGN_NICKNAME differs only in the config — synthesis is cached per DESIGN_NICKNAME. Clean with `make clean_all DESIGN_CONFIG=...` if needed.

### ORFS Output Files

```
flow/results/sky130hd/<nickname>/base/6_final.gds    # Final GDS
flow/reports/sky130hd/<nickname>/base/6_finish.rpt    # Final timing report
flow/reports/sky130hd/<nickname>/base/5_route_drc.rpt # DRC violations (empty = clean)
flow/logs/sky130hd/<nickname>/base/6_report.json      # Machine-readable metrics
```

### Quick Metrics Extraction

```bash
# From JSON
python3 -c "
import json
with open('flow/logs/sky130hd/<nickname>/base/6_report.json') as f:
    d = json.load(f)
print(f'Die area: {d[\"finish__design__die__area\"]} um²')
print(f'Utilization: {d[\"finish__design__instance__utilization\"]:.1%}')
print(f'Setup violations: {d[\"finish__timing__drv__setup_violation_count\"]}')
print(f'Power: {d[\"finish__power__total\"]:.3f} W')
"

# From report
head -20 flow/reports/sky130hd/<nickname>/base/6_finish.rpt  # WNS, TNS, fmax
wc -l flow/reports/sky130hd/<nickname>/base/5_route_drc.rpt  # 0 = clean
```
