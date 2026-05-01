export DESIGN_NICKNAME = rope_gen
export DESIGN_NAME     = rope_gen
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime_sky130.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/rope_genrope_gen.sv \
                         $(_project)/rtl/generated/kanagawa/rope_genrope_gen_types.sv \
                         $(KANAGAWA_RUNTIME_SV) \
                         $(MACRO_BB)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export SYNTH_HIERARCHICAL = 1
# Match proven rope die size (3000×3300) — original rope routed at this size
# with 418 DRC. Despite rope_gen having 6× fewer cells (rotate datapath moved
# to rope_apply), the macro-edge pin congestion (2× 1024-bit dout = 2048 wide
# pins) is unchanged and dominates routability. Tried 3000×2400 first; GRT
# entered 8-round NDR death spiral disabling clknet_0_clk — same pattern as
# vector_unit. Pin congestion is cell-count-independent, so shrinking the die
# below the original rope footprint provides no margin for pin escape.
export DIE_AREA  = 0 0 3000 3300
export CORE_AREA = 10 10 2990 3290
export PLACE_DENSITY_LB_ADDON = 0.20
export GENERATE_ARTIFACTS_ON_FAILURE = 1
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
export SKIP_INCREMENTAL_REPAIR = 1
export RECOVER_POWER = 0
export SKIP_ANTENNA_REPAIR = 1
export SKIP_ANTENNA_REPAIR_POST_DRT = 1
export MACRO_PLACEMENT_TCL = $(_this_dir)/macro_place.tcl
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1

export ADDITIONAL_LEFS = $(MACRO_LEFS)
export ADDITIONAL_LIBS = $(MACRO_LIBS)
export ADDITIONAL_GDS  = $(MACRO_GDS)
