export DESIGN_NICKNAME = transformer_layer_block
export DESIGN_NAME     = transformer_layer_block
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

# v10 layer_block: thin wrapper around rope_apply only.
# Sized to match what a per-layer compute block would normally occupy at the
# chip level. Per-layer compute (mac_arrays + vector_unit + KV + attn + FSM)
# is NOT included in this revision — that combination is 561K cells which
# hangs OpenROAD repair_design at ~1hr+. Keeping rope_apply alone (~111K)
# proves the chip-level cascade timing/floorplan and gives forward-compatible
# pin layout for when full compute is folded in.
include $(_this_dir)/../../kanagawa_runtime.mk

export VERILOG_FILES = \
  $(_project)/rtl/sv/transformer_layer_block.sv \
  $(_project)/rtl/generated/kanagawa/rope_applyrope_apply.sv \
  $(_project)/rtl/generated/kanagawa/rope_applyrope_apply_types.sv \
  $(KANAGAWA_RUNTIME_SV)

export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang

# Sized for ~111K cells (rope_apply alone) at ~50% util plus pin perimeter
# requirements. cos+sin in/out is 4×1024 bits = 4096 boundary pins. With
# split-axis pin layout per io_constraints.tcl (cos on E/W, sin on N/S),
# each axis needs ~2800 µm minimum.
# Layer-block-realistic shape (matches what a multi-layer chip would budget):
# 3000 wide × 3500 tall = 10.5 mm². At ~111K cells (0.55 mm²) → 5% util — very
# loose but pin perimeter dominates the shape requirement here.
export DIE_AREA  = 0 0 3000 3500
export CORE_AREA = 10 10 2990 3490
export PLACE_DENSITY_LB_ADDON = 0.20

export IO_CONSTRAINTS = $(_this_dir)/io_constraints.tcl

# Layer block has no macros (rope_apply alone), so simplified flow.
export GENERATE_ARTIFACTS_ON_FAILURE = 1
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1
