export DESIGN_NICKNAME = multi_layer_chip
export DESIGN_NAME     = multi_layer_chip_wrapper
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

# Macro-bearing (rope_gen pulls in NOR ROM macros)
include $(_this_dir)/../../kanagawa_runtime_sky130.mk

# Cascade integration test: rope_gen + 2× rope_apply wired in a daisy chain.
# Per-layer compute (transformer_layer_wrapper × 2) is NOT instantiated in
# this revision — it requires regenerating transformer_layer_wrapper.sv to
# expose rope_apply ports. The skeleton here validates the cascade wiring,
# the SDC budget for inter-tile hops, and the rope_gen reorientation.
export VERILOG_FILES   = $(_project)/rtl/sv/multi_layer_chip_wrapper.sv \
                         $(MACRO_BB)
# Hierarchical PnR: rope_gen and rope_apply are black-box macros (LEF/LIB/GDS
# in flow/macros/sky130hd/, .bb.v stubs in MACRO_BB). Internal Kanagawa SV
# files are NOT compiled at the chip level — only the abstract views matter.
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
# Top wrapper is a thin pass-through; SYNTH_HIERARCHICAL not needed for it.
# Tile macros are black boxes — Yosys won't try to flatten them.
export SYNTH_HIERARCHICAL = 0

# K=2 cascade integration test. Tile sizes (post-v8 PnR):
#   rope_gen   3000×3300, MY/R0 macros (R270 attempts failed PDN-0233)
#   rope_apply 2800×2800, cascade ports + IO_CONSTRAINTS split cos/sin axes
# Layout: rope_gen TOP band, 2× rope_apply BOTTOM band side-by-side.
# Width: max(3000 + margins, 2× 2800 + channel) = 6000 µm
# Height: 3300 (rope_gen) + 200 (channel) + 2800 (rope_apply) + 200 (margin) = 6500 µm
# v10 (shrunk): rope_gen tucked above L0 (left column), L1 stays right.
# Layout:
#   rope_gen 3000×3300 at (50, 3750), above L0
#   L0       3000×3500 at (50,   50)
#   L1       3000×3500 at (3250, 50), 200µm cascade channel from L0
# Width:  50 + 3000 + 200 + 3000 + 50 = 6300
# Height: 50 + 3500 + 200 + 3300 + 50 = 7100
# Die: 6300 × 7100 = 44.7 mm² (8% smaller than 6600×7400 = 48.8 mm²)
# Empty area: top-right 3000×3300 = 9.9 mm² (rope_gen could be expanded here in K=3)
export DIE_AREA  = 0 0 6300 7100
export CORE_AREA = 10 10 6290 7090
export PLACE_DENSITY_LB_ADDON = 0.05
# Hierarchical PnR (v9). rope_gen + 2× rope_apply imported as black-box
# macros via flow/macros/sky130hd/{rope_gen,rope_apply}.{lef,lib,gds,bb.v}.
# Top-level cell count drops from 302K (flat) to 4 stdcells of glue logic.
# GPL_TIMING_DRIVEN kept off — the wrapper is essentially a single register
# between rope_gen output and L0/L1 cascade; no datapath to optimize.
# DONT_BUFFER_PORTS=1 — cascade exposes 12K bits of pass-through I/O,
# default port buffering would insert hundreds of thousands of buffers.
export GPL_TIMING_DRIVEN = 0
export DONT_BUFFER_PORTS = 1
# Disable LEC: abstract LIB doesn't have functional truth tables for the
# 2094-output rope_apply / 4170-pin rope_gen tiles, only timing arcs.
export EQUIVALENCE_CHECK = 0
export LEC_CHECK = 0
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

# Custom PDN: skip macro internal grids (layer_block has met4 fully obstructed;
# chip met5 stripes align with macro's met5 power pins for direct connection).
export PDN_TCL = $(_this_dir)/pdn.tcl
