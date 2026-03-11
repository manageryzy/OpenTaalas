# Backend Physical Design: Bottom-Up Module Synthesis & PnR

## Goal

Synthesize and place-and-route all 18 Kanagawa LLM inference modules on sky130hd at 250 MHz, bottom-up from leaf cells to full chip. Collect area, timing, and power metrics per module. (Excludes smoke_adder and smoke_accumulator test modules, which already have their own configs.)

## Architecture Constraint

Each module has its own clock domain. Inter-module communication uses async FIFOs (gray-code CDC). Kanagawa's FIFO ports define the module boundaries.

## Target

- **PDK:** sky130hd
- **Frequency:** 250 MHz (4ns period)
- **Tool:** OpenROAD 26Q1 via ORFS

## Module Tiers

### Tier 1 -- Leaf Modules (fast iterations, validate flow)

| Module | DESIGN_NAME | SV Files |
|--------|-------------|----------|
| mac_pe | `mac_pe` | `mac_pemac_pe.sv`, `mac_pemac_pe_types.sv` |
| dequant | `dequant_unit` | `dequantdequant_unit.sv`, `dequantdequant_unit_types.sv` |
| codebook_decoder | `codebook_decoder` | `codebook_decodercodebook_decoder.sv`, `codebook_decodercodebook_decoder_types.sv` |
| lut_interp | `lut_unit` | `lut_interplut_unit.sv`, `lut_interplut_unit_types.sv` |

### Tier 2 -- Medium Complexity (storage + datapath)

| Module | DESIGN_NAME | SV Files |
|--------|-------------|----------|
| rom_bank | `rom_bank` | `rom_bankrom_bank.sv`, `rom_bankrom_bank_types.sv` |
| scale_store | `scale_store` | `scale_storescale_store.sv`, `scale_storescale_store_types.sv` |
| rmsnorm | `rmsnorm_unit` | `rmsnormrmsnorm_unit.sv`, `rmsnormrmsnorm_unit_types.sv` |
| swiglu | `swiglu_unit` | `swigluswiglu_unit.sv`, `swigluswiglu_unit_types.sv` |
| rope | `rope_unit` | `roperope_unit.sv`, `roperope_unit_types.sv` |
| attention_unit | `attention_unit` | `attention_unitattention_unit.sv`, `attention_unitattention_unit_types.sv` |

### Tier 3 -- Composites (hierarchy, many ports, async FIFO integration)

| Module | DESIGN_NAME | SV Files |
|--------|-------------|----------|
| mac_array | `mac_array` | `mac_arraymac_array.sv`, `mac_arraymac_array_types.sv` |
| vector_unit | `vector_unit` | `vector_unitvector_unit.sv`, `vector_unitvector_unit_types.sv` (canonical; ignore older `vector_unit_vector_unit*.sv` duplicates) |
| kv_cache | `kv_cache` | `kv_cachekv_cache.sv`, `kv_cachekv_cache_types.sv` |

### Tier 4 -- Controllers + Top-Level

| Module | DESIGN_NAME | SV Files |
|--------|-------------|----------|
| layer_tile | `layer_tile` | `layer_tilelayer_tile.sv`, `layer_tilelayer_tile_types.sv` |
| embed_rom | `embed_rom` | `embed_romembed_rom.sv`, `embed_romembed_rom_types.sv` |
| lm_head | `lm_head` | `lm_headlm_head.sv`, `lm_headlm_head_types.sv` |
| global_controller | `global_controller` | `global_controllerglobal_controller.sv`, `global_controllerglobal_controller_types.sv` |
| llama_chip | `llama_chip` | `llama_chipllama_chip.sv`, `llama_chipllama_chip_types.sv` |

## Async FIFO

A hand-written, parameterized async FIFO module for clock domain crossing between Kanagawa modules.

- **Location:** `rtl/sv/async_fifo.sv` (new file, to be authored as part of this work)
- **Parameters:** `DATA_WIDTH`, `DEPTH` (must be power of 2)
- **CDC:** Gray-code write/read pointers with 2-FF synchronizers
- **Interface:** Write side: `wr_clk`, `wr_rst_n`, `wr_en`, `wr_data`, `wr_full`; Read side: `rd_clk`, `rd_rst_n`, `rd_en`, `rd_data`, `rd_empty`
- **Adapter logic:** Thin wrappers map Kanagawa FIFO signals (`valid_in`/`rdy_out` write, `rden_in`/`empty_out`/`result_out` read) to async FIFO ports
- Synthesized standalone first to get area/timing baseline, then used in Tier 3+ compositions

## SDC Templates

### Clocked modules (all Kanagawa modules)

All Kanagawa-generated modules use `clk` as the clock port name.

```sdc
set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  [expr $clk_period * 0.2] -clock clk $non_clock_inputs
}
set_output_delay [expr $clk_period * 0.2] -clock clk [all_outputs]
```

### Combinational modules (if needed)

```sdc
create_clock -name clk -period 4.0
set_input_delay  -clock clk 0.0 [all_inputs]
set_output_delay -clock clk 0.0 [all_outputs]
```

## ORFS Config Template

Each module gets `flow/designs/sky130hd/<module>/config.mk`:

```makefile
export DESIGN_NICKNAME = <module>
export DESIGN_NAME     = <top_module_name>
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/<prefix><name>.sv \
                         $(_project)/rtl/generated/kanagawa/<prefix><name>_types.sv \
                         $(KANAGAWA_RUNTIME_SV)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export CORE_UTILIZATION = 50
export PLACE_DENSITY_LB_ADDON = 0.20
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1
```

### Kanagawa Runtime Library

Kanagawa-generated SV instantiates runtime modules (`KanagawaFlipFlopChainNoEnable`, `KanagawaResetControl`, `KanagawaWriteDelayFifo`, `KanagawaSyncRam`, etc.) from `third-party/kanagawa/runtime/rtl/`. A shared include file `flow/designs/kanagawa_runtime.mk` provides the curated file list and `-DSIMULATION` define (needed to bypass mock HAL `error guards). Uses `sync_ram.sv` (not `sync_ram_with_error.sv`) and `hal/mock/` behavioral implementations.

Additional flags for Tier 3+:
```makefile
export SYNTH_HIERARCHICAL = 1
export SYNTH_MINIMUM_KEEP_SIZE = 5000
```

Small modules (Tier 1) may need explicit `DIE_AREA`/`CORE_AREA` if utilization-based sizing produces dies too small for PDN straps.

Large modules (Tier 2-4, especially `lm_head`, `vector_unit`, `rmsnorm_unit`) may need `CORE_UTILIZATION` and `SYNTH_MEMORY_MAX_BITS` tuned per-module based on embedded memory sizes.

## Tier 3 Hierarchy: Sub-Module Sources

Kanagawa generates flat SV files — each module's `.sv` contains all its sub-modules inline (e.g., `mac_array.sv` already contains `mac_pe_*` sub-module definitions). Therefore `VERILOG_FILES` for a composite module only needs its own `.sv` + `_types.sv` files. No black-boxing or separate sub-module sources required.

## CMake Integration

All modules registered in `flow/CMakeLists.txt` via existing `add_orfs_design()`. The `backend_all` target must be updated to depend on all `gds_<module>` targets (currently only depends on `gds_smoke_adder`).

## Deliverables Per Module

After each tier completes:
1. Clean synthesis + PnR (no DRC violations)
2. Timing closure at 250 MHz (or documented WNS if not met)
3. Metrics table: area (um2), cell count, WNS, TNS, power (mW)

## Execution Order

1. Tier 1 modules (4 designs) -- validate flow, iterate configs; confirm `slang` frontend works with Kanagawa SV
2. Async FIFO -- author `rtl/sv/async_fifo.sv`, lint, synthesize standalone
3. Tier 2 modules (6 designs)
4. Tier 3 modules (3 designs) -- integrate async FIFOs at composition boundaries
5. Tier 4 modules (5 designs)
6. Update `backend_all` CMake target to depend on all module GDS targets
7. Summary metrics table across all modules

## Outcome (2026-03-11)

**12/18 modules completed full PnR.** 7 modules blocked on SRAM macro integration.

### Key Findings

1. **slang frontend works** — all Kanagawa-generated SV parsed successfully by Yosys/slang
2. **Kanagawa runtime** — `-DSIMULATION` define required; `sync_ram.sv` (not `_with_error`) needed
3. **Behavioral memories are the bottleneck** — modules with `[[memory]]` arrays >100KB cause Yosys FLATTEN/CHECK to run indefinitely (12+ hours, 84GB RAM for kv_cache)
4. **FSM-only modules meet timing** — layer_tile (254 MHz), llama_chip (252 MHz), global_controller (244 MHz)
5. **Datapath modules need pipelining** — mac_pe (138 MHz), attention_unit (76 MHz), swiglu (47 MHz) have significant negative slack

### Next: OpenRAM SRAM Macro Integration

7 blocked modules need behavioral RAMs replaced with physical SRAM macro instances. Memory requirements range from 110 KB (rom_bank) to 189 MB (lm_head). The lm_head weight store likely requires an external DRAM interface rather than on-die SRAM.
