export DESIGN_NICKNAME = layer_orchestrator
export DESIGN_NAME     = layer_orchestrator
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

# v12 pure-Kanagawa orchestrator: composes rope_apply (~111K cells) +
# vector_unit (~127K cells with [[memory]] SyncRams) into one macro.
# Sub-modules instantiated as private class fields; Kanagawa emits hierarchical
# SV. 4× SyncRam → 2× sram_4096x16 (gamma) + 2× sram_256x16 (LUTs) macros.
# Total estimated cell count: ~240K.
include $(_this_dir)/../../kanagawa_runtime_sky130.mk

export VERILOG_FILES = \
  $(_project)/rtl/generated/kanagawa/layer_orchestratorlayer_orchestrator.sv \
  $(_project)/rtl/generated/kanagawa/layer_orchestratorlayer_orchestrator_types.sv \
  $(_project)/rtl/generated/kanagawa/layer_orchestratorrope_apply.sv \
  $(_project)/rtl/generated/kanagawa/layer_orchestratorrope_apply_types.sv \
  $(_project)/rtl/generated/kanagawa/layer_orchestratorvector_unit.sv \
  $(_project)/rtl/generated/kanagawa/layer_orchestratorvector_unit_types.sv \
  $(KANAGAWA_RUNTIME_SV) \
  $(MACRO_BB)

export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export SYNTH_HIERARCHICAL = 1
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1

# Synth area is 5.04 mm² (rope_apply 0.82 + vector_unit 0.41 + orchestrator
# glue 3.81 — pass-through method FIFOs dominate). Need ~9 mm² die for ~55%
# util. 3000×3000 leaves comfortable pin perimeter (1516 / 4 = 380/edge ×
# 1.36µm met3 pitch = 520µm minimum).
export DIE_AREA  = 0 0 3000 3000
export CORE_AREA = 10 10 2990 2990
export PLACE_DENSITY_LB_ADDON = 0.10
export MACRO_PLACE_HALO = 10 10

export GENERATE_ARTIFACTS_ON_FAILURE = 1
export GLOBAL_ROUTE_ARGS = -congestion_iterations 30 -congestion_report_iter_step 5 -verbose -allow_congestion
export SKIP_INCREMENTAL_REPAIR = 1
export RECOVER_POWER = 0
export SKIP_ANTENNA_REPAIR = 1
export SKIP_ANTENNA_REPAIR_POST_DRT = 1
# GPL_TIMING_DRIVEN=0: skip the timing-driven repair_design phase that hung
# silently on vector_unit at 791K cells (v6 memory). Downstream
# 3_4_place_resized still runs timing repair, just not during global place.
export GPL_TIMING_DRIVEN = 0

export EQUIVALENCE_CHECK = 0
export LEC_CHECK = 0

export ADDITIONAL_LEFS = $(MACRO_LEFS)
export ADDITIONAL_LIBS = $(MACRO_LIBS)
export ADDITIONAL_GDS  = $(MACRO_GDS)
