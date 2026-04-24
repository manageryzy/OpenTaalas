export DESIGN_NICKNAME = vector_unit
export DESIGN_NAME     = vector_unit
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime_sky130.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/vector_unitvector_unit.sv \
                         $(_project)/rtl/generated/kanagawa/vector_unitvector_unit_types.sv \
                         $(KANAGAWA_RUNTIME_SV) \
                         $(MACRO_BB)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export SYNTH_HIERARCHICAL = 1
# v6: cell count dropped 791K → 127K after v5 SRAM library + schedule annotations.
# Old 4000×5500 die was sized for 791K cells — now massively oversized; resizer
# couldn't converge in 80+ min. Shrunk to 3000×3500 (10.5 mm², -52%).
export DIE_AREA  = 0 0 3000 3500
export CORE_AREA = 10 10 2990 3490
export PLACE_DENSITY_LB_ADDON = 0.10
export GENERATE_ARTIFACTS_ON_FAILURE = 1
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
export SKIP_INCREMENTAL_REPAIR = 1
export RECOVER_POWER = 0
export SKIP_ANTENNA_REPAIR = 1
export SKIP_ANTENNA_REPAIR_POST_DRT = 1
# v6: GPL timing-driven repair_design phase hangs on 128K nets at 33-cores active
# but no progress for 30+ min. Skip it entirely; downstream resizer (3_4_place_resized)
# still does timing repair after global placement converges.
export GPL_TIMING_DRIVEN = 0
export MACRO_PLACEMENT_TCL = $(_this_dir)/macro_place.tcl
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1

export ADDITIONAL_LEFS = $(MACRO_LEFS)
export ADDITIONAL_LIBS = $(MACRO_LIBS)
export ADDITIONAL_GDS  = $(MACRO_GDS)
