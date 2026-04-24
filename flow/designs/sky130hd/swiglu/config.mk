export DESIGN_NICKNAME = swiglu
export DESIGN_NAME     = swiglu_unit
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime_sky130.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/swigluswiglu_unit.sv \
                         $(_project)/rtl/generated/kanagawa/swigluswiglu_unit_types.sv \
                         $(KANAGAWA_RUNTIME_SV) \
                         $(MACRO_BB)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export SYNTH_HIERARCHICAL = 1
# 3× sram_256x16 (78×85 µm) hold _sigmoid_lut (Kanagawa replicates per read site).
# Logic was 24K cells / 0.60 mm²; new logic ~6K cells. Die sized for PDN strap channel margins.
export DIE_AREA  = 0 0 700 700
export CORE_AREA = 10 10 690 690
export PLACE_DENSITY_LB_ADDON = 0.10
export MACRO_PLACEMENT_TCL = $(_this_dir)/macro_place.tcl
export GENERATE_ARTIFACTS_ON_FAILURE = 1
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
export SKIP_INCREMENTAL_REPAIR = 1
export RECOVER_POWER = 0
export SKIP_ANTENNA_REPAIR = 1
export SKIP_ANTENNA_REPAIR_POST_DRT = 1
export MACRO_PLACE_HALO = 10 10
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1

export ADDITIONAL_LEFS = $(MACRO_LEFS)
export ADDITIONAL_LIBS = $(MACRO_LIBS)
export ADDITIONAL_GDS  = $(MACRO_GDS)
