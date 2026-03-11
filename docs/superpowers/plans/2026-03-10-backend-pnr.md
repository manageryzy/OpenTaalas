# Backend PnR Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create ORFS configs for all 18 Kanagawa modules, synthesize and PnR each on sky130hd at 250 MHz, and collect area/timing/power metrics.

**Architecture:** Bottom-up — Tier 1 leaf modules first to validate the flow, then Tier 2-4 progressively. Each module gets a `config.mk` + `constraint.sdc` in `flow/designs/sky130hd/<module>/`. An async FIFO module is authored for Tier 3+ clock domain crossings.

**Tech Stack:** OpenROAD 26Q1 via ORFS, sky130hd PDK, slang SV frontend, Verilator (lint)

**Spec:** `docs/superpowers/specs/2026-03-10-backend-pnr-design.md`

## Execution Status (2026-03-11)

**Tasks 1-9: COMPLETE.** All 18 ORFS configs created, registered in CMakeLists.txt, async FIFO authored.

**Results:** 12/18 modules completed full PnR. 7 modules blocked — behavioral memory arrays too large for Yosys gate-level synthesis. These need OpenRAM SRAM macros (see Task #11 in project backlog).

**Task 10 (metrics summary): PARTIAL.** Results captured in `docs/project-status.md` and project memory. Standalone `docs/backend-metrics.md` not yet created.

---

## Chunk 1: Tier 1 Modules (mac_pe, dequant, codebook_decoder, lut_interp)

### Task 1: Create mac_pe ORFS config and run synthesis

The first module validates that slang + Kanagawa-generated SV works with ORFS.

**Files:**
- Create: `flow/designs/sky130hd/mac_pe/config.mk`
- Create: `flow/designs/sky130hd/mac_pe/constraint.sdc`

- [x] **Step 1: Create config.mk**

```makefile
export DESIGN_NICKNAME = mac_pe
export DESIGN_NAME     = mac_pe
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/mac_pemac_pe.sv \
                         $(_project)/rtl/generated/kanagawa/mac_pemac_pe_types.sv
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export CORE_UTILIZATION = 50
export PLACE_DENSITY_LB_ADDON = 0.20
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1
```

- [x] **Step 2: Create constraint.sdc**

```sdc
set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  [expr $clk_period * 0.2] -clock clk $non_clock_inputs
}
set_output_delay [expr $clk_period * 0.2] -clock clk [all_outputs]
```

- [x] **Step 3: Run synthesis to validate slang + Kanagawa SV**

```bash
source ~/workspace/eda-env.sh
make -C ~/workspace/OpenROAD-flow-scripts/flow \
  DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/mac_pe/config.mk \
  WORK_HOME=$(pwd)/.build/flow/sky130hd/mac_pe \
  synth
```

Expected: Synthesis completes without errors. Check for slang parse errors in the log. If synthesis fails due to slang issues with Kanagawa SV constructs, troubleshoot before proceeding.

- [x] **Step 4: Run full PnR**

```bash
make -C ~/workspace/OpenROAD-flow-scripts/flow \
  DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/mac_pe/config.mk \
  WORK_HOME=$(pwd)/.build/flow/sky130hd/mac_pe \
  all
```

Expected: Clean PnR. If `DPL-0036` (placement failure), the module is too small for utilization-based sizing — add explicit `DIE_AREA`/`CORE_AREA` like smoke_adder.

- [x] **Step 5: Extract metrics**

```bash
python3 -c "
import json, sys
with open('.build/flow/sky130hd/mac_pe/results/sky130hd/mac_pe/base/6_report.json') as f:
    d = json.load(f)
print(f'Die area:     {d[\"finish__design__die__area\"]} um2')
print(f'Utilization:  {d[\"finish__design__instance__utilization\"]:.1%}')
print(f'Cell count:   {d[\"finish__design__instance__count\"]}')
print(f'WNS:          {d[\"finish__timing__setup__ws\"]} ns')
print(f'TNS:          {d[\"finish__timing__setup__tns\"]} ns')
print(f'Power:        {d[\"finish__power__total\"]:.6f} W')
"
```

Record results. This establishes the baseline flow.

- [x] **Step 6: Commit**

```bash
git add flow/designs/sky130hd/mac_pe/
git commit -m "flow: add mac_pe ORFS config (sky130hd, 250 MHz)"
```

### Task 2: Create remaining Tier 1 configs (dequant, codebook_decoder, lut_interp)

All three follow the same pattern as mac_pe. Create configs in parallel.

**Files:**
- Create: `flow/designs/sky130hd/dequant/config.mk`
- Create: `flow/designs/sky130hd/dequant/constraint.sdc`
- Create: `flow/designs/sky130hd/codebook_decoder/config.mk`
- Create: `flow/designs/sky130hd/codebook_decoder/constraint.sdc`
- Create: `flow/designs/sky130hd/lut_interp/config.mk`
- Create: `flow/designs/sky130hd/lut_interp/constraint.sdc`

- [x] **Step 1: Create dequant config**

`config.mk` — same template, with:
```
DESIGN_NICKNAME = dequant
DESIGN_NAME     = dequant_unit
VERILOG_FILES   = .../dequantdequant_unit.sv .../dequantdequant_unit_types.sv
```

`constraint.sdc` — identical to mac_pe (same 4ns clock on `clk`).

- [x] **Step 2: Create codebook_decoder config**

`config.mk`:
```
DESIGN_NICKNAME = codebook_decoder
DESIGN_NAME     = codebook_decoder
VERILOG_FILES   = .../codebook_decodercodebook_decoder.sv .../codebook_decodercodebook_decoder_types.sv
```

`constraint.sdc` — identical.

- [x] **Step 3: Create lut_interp config**

`config.mk`:
```
DESIGN_NICKNAME = lut_interp
DESIGN_NAME     = lut_unit
VERILOG_FILES   = .../lut_interplut_unit.sv .../lut_interplut_unit_types.sv
```

`constraint.sdc` — identical.

- [x] **Step 4: Run synthesis for all three**

```bash
for mod in dequant codebook_decoder lut_interp; do
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    synth 2>&1 | tee .build/flow/sky130hd/${mod}_synth.log &
done
wait
```

Check all three logs for errors.

- [x] **Step 5: Run full PnR for all three**

```bash
for mod in dequant codebook_decoder lut_interp; do
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    all 2>&1 | tee .build/flow/sky130hd/${mod}_pnr.log &
done
wait
```

If any fail with `DPL-0036`, add explicit `DIE_AREA`/`CORE_AREA`.

- [x] **Step 6: Extract metrics for all Tier 1 modules**

Run the metrics extraction script for each of: mac_pe, dequant, codebook_decoder, lut_interp. Record a table:

```
| Module            | DESIGN_NAME       | Area (um2) | Cells | WNS (ns) | TNS (ns) | Power (mW) |
|-------------------|-------------------|------------|-------|----------|----------|------------|
| mac_pe            | mac_pe            |            |       |          |          |            |
| dequant           | dequant_unit      |            |       |          |          |            |
| codebook_decoder  | codebook_decoder  |            |       |          |          |            |
| lut_interp        | lut_unit          |            |       |          |          |            |
```

- [x] **Step 7: Commit**

```bash
git add flow/designs/sky130hd/dequant/ flow/designs/sky130hd/codebook_decoder/ flow/designs/sky130hd/lut_interp/
git commit -m "flow: add Tier 1 ORFS configs (dequant, codebook_decoder, lut_interp)"
```

### Task 3: Register Tier 1 in CMakeLists.txt

**Files:**
- Modify: `flow/CMakeLists.txt`

- [x] **Step 1: Add Tier 1 designs to flow/CMakeLists.txt**

After the existing `smoke_adder` registration, add:

```cmake
add_orfs_design(
  NAME       mac_pe
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/mac_pe"
)

add_orfs_design(
  NAME       dequant
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/dequant"
)

add_orfs_design(
  NAME       codebook_decoder
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/codebook_decoder"
)

add_orfs_design(
  NAME       lut_interp
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/lut_interp"
)
```

- [x] **Step 2: Verify CMake configure succeeds**

```bash
cmake -B .build 2>&1 | grep -E "ORFS|Backend"
```

Expected: No errors. Backend targets registered.

- [x] **Step 3: Commit**

```bash
git add flow/CMakeLists.txt
git commit -m "flow: register Tier 1 modules in CMakeLists.txt"
```

---

## Chunk 2: Async FIFO + Tier 2 Modules

### Task 4: Author async FIFO module

**Files:**
- Create: `rtl/sv/async_fifo.sv`

- [x] **Step 1: Write async_fifo.sv**

Standard dual-clock FIFO with gray-code pointers and 2-FF synchronizers. Parameters: `DATA_WIDTH` (default 16), `DEPTH` (default 4, must be power of 2).

Write side: `wr_clk`, `wr_rst_n`, `wr_en`, `wr_data[DATA_WIDTH-1:0]`, `wr_full`
Read side: `rd_clk`, `rd_rst_n`, `rd_en`, `rd_data[DATA_WIDTH-1:0]`, `rd_empty`

Implementation:
- Binary write/read pointers (ADDR_WIDTH = $clog2(DEPTH))
- Gray-code conversion for CDC: `gray = bin ^ (bin >> 1)`
- 2-FF synchronizer for cross-domain gray pointers
- Full: write gray pointer == {~sync_rd_gray[MSB:MSB-1], sync_rd_gray[MSB-2:0]}
- Empty: read gray pointer == sync_wr_gray
- Dual-port RAM inferred from `reg [DATA_WIDTH-1:0] mem [0:DEPTH-1]`

- [x] **Step 2: Lint with Verilator**

```bash
verilator --lint-only -Wall rtl/sv/async_fifo.sv
```

Expected: Clean lint (0 warnings, 0 errors).

- [x] **Step 3: Create ORFS config for standalone synthesis**

Create `flow/designs/sky130hd/async_fifo/config.mk` and `constraint.sdc`.

The async FIFO has two clocks (`wr_clk`, `rd_clk`). SDC:

```sdc
set clk_period 4.0
create_clock -name wr_clk -period $clk_period [get_ports wr_clk]
create_clock -name rd_clk -period $clk_period [get_ports rd_clk]
set_clock_groups -asynchronous -group {wr_clk} -group {rd_clk}

set wr_inputs [get_ports {wr_en wr_data* wr_rst_n}]
set rd_inputs [get_ports {rd_en rd_rst_n}]

set_input_delay  [expr $clk_period * 0.2] -clock wr_clk $wr_inputs
set_input_delay  [expr $clk_period * 0.2] -clock rd_clk $rd_inputs
set_output_delay [expr $clk_period * 0.2] -clock wr_clk [get_ports wr_full]
set_output_delay [expr $clk_period * 0.2] -clock rd_clk [get_ports {rd_data* rd_empty}]
```

`config.mk`:
```makefile
export DESIGN_NICKNAME = async_fifo
export DESIGN_NAME     = async_fifo
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

export VERILOG_FILES   = $(_project)/rtl/sv/async_fifo.sv
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export CORE_UTILIZATION = 50
export PLACE_DENSITY_LB_ADDON = 0.20
export REMOVE_ABC_BUFFERS = 1
# Small design — explicit die area
export DIE_AREA  = 0 0 80 80
export CORE_AREA = 5 5 75 75
```

- [x] **Step 4: Run synthesis + PnR**

```bash
source ~/workspace/eda-env.sh
make -C ~/workspace/OpenROAD-flow-scripts/flow \
  DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/async_fifo/config.mk \
  WORK_HOME=$(pwd)/.build/flow/sky130hd/async_fifo \
  all
```

- [x] **Step 5: Extract metrics and commit**

```bash
git add rtl/sv/async_fifo.sv flow/designs/sky130hd/async_fifo/
git commit -m "rtl: add async FIFO with gray-code CDC; flow: ORFS config"
```

### Task 5: Create Tier 2 configs (rom_bank, scale_store, rmsnorm, swiglu, rope, attention_unit)

**Files:**
- Create: `flow/designs/sky130hd/{rom_bank,scale_store,rmsnorm,swiglu,rope,attention_unit}/config.mk`
- Create: `flow/designs/sky130hd/{rom_bank,scale_store,rmsnorm,swiglu,rope,attention_unit}/constraint.sdc`

All use the same `constraint.sdc` (4ns clock on `clk`). Each `config.mk` follows the template.

- [x] **Step 1: Create all 6 config directories and files**

| Directory | DESIGN_NICKNAME | DESIGN_NAME | VERILOG prefix |
|-----------|----------------|-------------|----------------|
| `rom_bank/` | `rom_bank` | `rom_bank` | `rom_bankrom_bank` |
| `scale_store/` | `scale_store` | `scale_store` | `scale_storescale_store` |
| `rmsnorm/` | `rmsnorm` | `rmsnorm_unit` | `rmsnormrmsnorm_unit` |
| `swiglu/` | `swiglu` | `swiglu_unit` | `swigluswiglu_unit` |
| `rope/` | `rope` | `rope_unit` | `roperope_unit` |
| `attention_unit/` | `attention_unit` | `attention_unit` | `attention_unitattention_unit` |

Each `constraint.sdc` is identical to Tier 1 (4ns clock on `clk` port).

- [x] **Step 2: Run synthesis for all 6**

```bash
for mod in rom_bank scale_store rmsnorm swiglu rope attention_unit; do
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    synth 2>&1 | tee .build/flow/sky130hd/${mod}_synth.log &
done
wait
```

Check logs. For large modules (`rmsnorm`, `swiglu`) watch for memory synthesis issues — if `SYNTH_MEMORY_MAX_BITS = 65536` is too small, increase it.

- [x] **Step 3: Run full PnR for all 6**

```bash
for mod in rom_bank scale_store rmsnorm swiglu rope attention_unit; do
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    all 2>&1 | tee .build/flow/sky130hd/${mod}_pnr.log &
done
wait
```

Troubleshoot failures individually. Common issues:
- `DPL-0036`: Reduce `CORE_UTILIZATION` or add explicit `DIE_AREA`
- `GRT-0116`: Reduce utilization or increase `PLACE_DENSITY_LB_ADDON`

- [x] **Step 4: Extract metrics and record Tier 2 table**

```
| Module          | DESIGN_NAME      | Area (um2) | Cells | WNS (ns) | TNS (ns) | Power (mW) |
|-----------------|------------------|------------|-------|----------|----------|------------|
| rom_bank        | rom_bank         |            |       |          |          |            |
| scale_store     | scale_store      |            |       |          |          |            |
| rmsnorm         | rmsnorm_unit     |            |       |          |          |            |
| swiglu          | swiglu_unit      |            |       |          |          |            |
| rope            | rope_unit        |            |       |          |          |            |
| attention_unit  | attention_unit   |            |       |          |          |            |
```

- [x] **Step 5: Commit**

```bash
git add flow/designs/sky130hd/rom_bank/ flow/designs/sky130hd/scale_store/ \
        flow/designs/sky130hd/rmsnorm/ flow/designs/sky130hd/swiglu/ \
        flow/designs/sky130hd/rope/ flow/designs/sky130hd/attention_unit/
git commit -m "flow: add Tier 2 ORFS configs (rom_bank, scale_store, rmsnorm, swiglu, rope, attention_unit)"
```

### Task 6: Register Tier 2 + async_fifo in CMakeLists.txt

**Files:**
- Modify: `flow/CMakeLists.txt`

- [x] **Step 1: Add all Tier 2 + async_fifo designs**

Add after Tier 1 registrations:

```cmake
add_orfs_design(
  NAME       async_fifo
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/async_fifo"
)

add_orfs_design(
  NAME       rom_bank
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rom_bank"
)

add_orfs_design(
  NAME       scale_store
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/scale_store"
)

add_orfs_design(
  NAME       rmsnorm
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rmsnorm"
)

add_orfs_design(
  NAME       swiglu
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/swiglu"
)

add_orfs_design(
  NAME       rope
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rope"
)

add_orfs_design(
  NAME       attention_unit
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/attention_unit"
)
```

- [x] **Step 2: Verify CMake configure**

```bash
cmake -B .build 2>&1 | grep -E "ORFS|Backend"
```

- [x] **Step 3: Commit**

```bash
git add flow/CMakeLists.txt
git commit -m "flow: register async_fifo + Tier 2 modules in CMakeLists.txt"
```

---

## Chunk 3: Tier 3 + Tier 4 + Final Integration

### Task 7: Create Tier 3 configs (mac_array, vector_unit, kv_cache)

These are composite modules. Add `SYNTH_HIERARCHICAL = 1` and `SYNTH_MINIMUM_KEEP_SIZE = 5000`.

**Files:**
- Create: `flow/designs/sky130hd/{mac_array,vector_unit,kv_cache}/config.mk`
- Create: `flow/designs/sky130hd/{mac_array,vector_unit,kv_cache}/constraint.sdc`

- [x] **Step 1: Create all 3 config directories and files**

| Directory | DESIGN_NICKNAME | DESIGN_NAME | VERILOG prefix |
|-----------|----------------|-------------|----------------|
| `mac_array/` | `mac_array` | `mac_array` | `mac_arraymac_array` |
| `vector_unit/` | `vector_unit` | `vector_unit` | `vector_unitvector_unit` |
| `kv_cache/` | `kv_cache` | `kv_cache` | `kv_cachekv_cache` |

Each `config.mk` adds these lines compared to Tier 1/2 template:
```makefile
export SYNTH_HIERARCHICAL = 1
export SYNTH_MINIMUM_KEEP_SIZE = 5000
```

For `vector_unit` — this is the largest module (~306k lines SV). May need `CORE_UTILIZATION = 40` or lower. Start at 50, reduce if placement fails.

`constraint.sdc` — identical to Tier 1 (4ns clock on `clk`).

- [x] **Step 2: Run synthesis for all 3**

Run sequentially — these are large and may use significant memory:

```bash
for mod in mac_array kv_cache vector_unit; do
  echo "=== Synthesizing $mod ==="
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    synth 2>&1 | tee .build/flow/sky130hd/${mod}_synth.log
done
```

- [x] **Step 3: Run full PnR**

```bash
for mod in mac_array kv_cache vector_unit; do
  echo "=== PnR $mod ==="
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    all 2>&1 | tee .build/flow/sky130hd/${mod}_pnr.log
done
```

- [x] **Step 4: Extract metrics and record Tier 3 table**

- [x] **Step 5: Commit**

```bash
git add flow/designs/sky130hd/mac_array/ flow/designs/sky130hd/vector_unit/ flow/designs/sky130hd/kv_cache/
git commit -m "flow: add Tier 3 ORFS configs (mac_array, vector_unit, kv_cache)"
```

### Task 8: Create Tier 4 configs (layer_tile, embed_rom, lm_head, global_controller, llama_chip)

**Files:**
- Create: `flow/designs/sky130hd/{layer_tile,embed_rom,lm_head,global_controller,llama_chip}/config.mk`
- Create: `flow/designs/sky130hd/{layer_tile,embed_rom,lm_head,global_controller,llama_chip}/constraint.sdc`

- [x] **Step 1: Create all 5 config directories and files**

| Directory | DESIGN_NICKNAME | DESIGN_NAME | VERILOG prefix |
|-----------|----------------|-------------|----------------|
| `layer_tile/` | `layer_tile` | `layer_tile` | `layer_tilelayer_tile` |
| `embed_rom/` | `embed_rom` | `embed_rom` | `embed_romembed_rom` |
| `lm_head/` | `lm_head` | `lm_head` | `lm_headlm_head` |
| `global_controller/` | `global_controller` | `global_controller` | `global_controllerglobal_controller` |
| `llama_chip/` | `llama_chip` | `llama_chip` | `llama_chipllama_chip` |

`layer_tile` and `global_controller` are FSM-only — small, should synthesize fast.
`embed_rom` and `lm_head` have large weight tables — add `SYNTH_HIERARCHICAL = 1`.
`llama_chip` is top-level — add `SYNTH_HIERARCHICAL = 1`.

`constraint.sdc` — identical 4ns clock on `clk`.

- [x] **Step 2: Run synthesis for all 5**

```bash
for mod in layer_tile global_controller embed_rom lm_head llama_chip; do
  echo "=== Synthesizing $mod ==="
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    synth 2>&1 | tee .build/flow/sky130hd/${mod}_synth.log
done
```

- [x] **Step 3: Run full PnR**

```bash
for mod in layer_tile global_controller embed_rom lm_head llama_chip; do
  echo "=== PnR $mod ==="
  make -C ~/workspace/OpenROAD-flow-scripts/flow \
    DESIGN_CONFIG=$(pwd)/flow/designs/sky130hd/$mod/config.mk \
    WORK_HOME=$(pwd)/.build/flow/sky130hd/$mod \
    all 2>&1 | tee .build/flow/sky130hd/${mod}_pnr.log
done
```

- [x] **Step 4: Extract metrics and record Tier 4 table**

- [x] **Step 5: Commit**

```bash
git add flow/designs/sky130hd/layer_tile/ flow/designs/sky130hd/embed_rom/ \
        flow/designs/sky130hd/lm_head/ flow/designs/sky130hd/global_controller/ \
        flow/designs/sky130hd/llama_chip/
git commit -m "flow: add Tier 4 ORFS configs (layer_tile, embed_rom, lm_head, global_controller, llama_chip)"
```

### Task 9: Register Tier 3+4 in CMakeLists.txt and update backend_all

**Files:**
- Modify: `flow/CMakeLists.txt`

- [x] **Step 1: Add all Tier 3+4 designs**

Add after Tier 2 registrations. Follow same pattern as Tasks 3/6.

8 new `add_orfs_design()` calls for: mac_array, vector_unit, kv_cache, layer_tile, embed_rom, lm_head, global_controller, llama_chip.

- [x] **Step 2: Update backend_all to depend on all GDS targets**

Replace the existing `backend_all` target:

```cmake
add_custom_target(backend_all
  DEPENDS
    gds_smoke_adder
    gds_mac_pe
    gds_dequant
    gds_codebook_decoder
    gds_lut_interp
    gds_async_fifo
    gds_rom_bank
    gds_scale_store
    gds_rmsnorm
    gds_swiglu
    gds_rope
    gds_attention_unit
    gds_mac_array
    gds_vector_unit
    gds_kv_cache
    gds_layer_tile
    gds_embed_rom
    gds_lm_head
    gds_global_controller
    gds_llama_chip
  COMMENT "Building all backend GDS targets"
)
```

- [x] **Step 3: Verify CMake configure**

```bash
cmake -B .build 2>&1 | grep -E "ORFS|Backend"
```

- [x] **Step 4: Commit**

```bash
git add flow/CMakeLists.txt
git commit -m "flow: register Tier 3+4 modules; update backend_all target"
```

### Task 10: Compile summary metrics table

**Files:**
- Create: `docs/backend-metrics.md`

- [x] **Step 1: Collect all metrics into a summary table**

Write a script or manually collect from all 18 `6_report.json` files. Format:

```markdown
# Backend Metrics — sky130hd @ 250 MHz

| Module            | DESIGN_NAME        | Area (um2) | Cells | WNS (ns) | TNS (ns) | Power (mW) | DRC |
|-------------------|--------------------|------------|-------|----------|----------|------------|-----|
| **Tier 1**        |                    |            |       |          |          |            |     |
| mac_pe            | mac_pe             |            |       |          |          |            |     |
| dequant           | dequant_unit       |            |       |          |          |            |     |
| codebook_decoder  | codebook_decoder   |            |       |          |          |            |     |
| lut_interp        | lut_unit           |            |       |          |          |            |     |
| **Tier 2**        |                    |            |       |          |          |            |     |
| rom_bank          | rom_bank           |            |       |          |          |            |     |
| scale_store       | scale_store        |            |       |          |          |            |     |
| rmsnorm           | rmsnorm_unit       |            |       |          |          |            |     |
| swiglu            | swiglu_unit        |            |       |          |          |            |     |
| rope              | rope_unit          |            |       |          |          |            |     |
| attention_unit    | attention_unit     |            |       |          |          |            |     |
| **Tier 3**        |                    |            |       |          |          |            |     |
| mac_array         | mac_array          |            |       |          |          |            |     |
| vector_unit       | vector_unit        |            |       |          |          |            |     |
| kv_cache          | kv_cache           |            |       |          |          |            |     |
| **Tier 4**        |                    |            |       |          |          |            |     |
| layer_tile        | layer_tile         |            |       |          |          |            |     |
| embed_rom         | embed_rom          |            |       |          |          |            |     |
| lm_head           | lm_head            |            |       |          |          |            |     |
| global_controller | global_controller  |            |       |          |          |            |     |
| llama_chip        | llama_chip         |            |       |          |          |            |     |
| **Async FIFO**    | async_fifo         |            |       |          |          |            |     |
```

DRC column: 0 = clean, otherwise count from `5_route_drc.rpt`.

- [x] **Step 2: Note any modules that failed timing closure**

For any module with WNS < 0: document the critical path and potential fixes (pipeline insertion, frequency reduction, etc.)

- [x] **Step 3: Commit**

```bash
git add docs/backend-metrics.md
git commit -m "docs: add backend PnR metrics summary for all modules"
```
