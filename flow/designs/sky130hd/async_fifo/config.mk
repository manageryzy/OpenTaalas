export DESIGN_NICKNAME = async_fifo
export DESIGN_NAME     = async_fifo
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

export VERILOG_FILES   = $(_project)/rtl/sv/async_fifo.sv
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export PLACE_DENSITY_LB_ADDON = 0.20
export REMOVE_ABC_BUFFERS = 1
# Small design — explicit die area (CORE_UTILIZATION omitted to avoid conflict)
export DIE_AREA  = 0 0 80 80
export CORE_AREA = 5 5 75 75
