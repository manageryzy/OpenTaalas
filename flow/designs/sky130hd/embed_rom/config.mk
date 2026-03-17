export DESIGN_NICKNAME = embed_rom
export DESIGN_NAME     = embed_rom
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime_sky130.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/embed_rom_embed_rom.sv \
                         $(_project)/rtl/generated/kanagawa/embed_rom_embed_rom_types.sv \
                         $(KANAGAWA_RUNTIME_SV) \
                         $(MACRO_BB)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export SYNTH_HIERARCHICAL = 1
export DIE_AREA  = 0 0 3200 3200
export CORE_AREA = 10 10 3190 3190
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
