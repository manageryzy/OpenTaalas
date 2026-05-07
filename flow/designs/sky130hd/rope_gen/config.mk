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
# v8 multi-layer: kept v7's PROVEN 3000×3300 die. Two failed attempts:
#   v8a 3300×3000 + R270 macros — failed PDN-0233 (LEF SYMMETRY X Y rules
#       out 90° rotations).
#   v8b/c 3300×3000 + MY/R0 macros + IO_CONSTRAINTS pushing dout SOUTH —
#       failed GRT 8-NDR death spiral; pin congestion in the y=0..941
#       channel below the macros killed routing.
#   v8d 3300×3000 + MY/R0 macros, no IO_CONSTRAINTS — same death spiral
#       (7 NDR disables incl. root clknet_0_clk).
# Conclusion: the wider die (3300 vs 3000) shifts the PDN met4 strap density
# distribution and breaks routability for this macro layout. v7's proven
# 3000×3300 (taller than wide) is what the macros + macros-route layout
# converges on. Chip-level multi_layer_chip absorbs the 3000×3300 footprint
# into its top band by laying it out on its side relative to the layer band.
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
