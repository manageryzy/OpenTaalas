export DESIGN_NICKNAME = vector_unit
export DESIGN_NAME     = vector_unit
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/vector_unitvector_unit.sv \
                         $(_project)/rtl/generated/kanagawa/vector_unitvector_unit_types.sv \
                         $(KANAGAWA_RUNTIME_SV)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export CORE_UTILIZATION = 50
export PLACE_DENSITY_LB_ADDON = 0.20
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1
