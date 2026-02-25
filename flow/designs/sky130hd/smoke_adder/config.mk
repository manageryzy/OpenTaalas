export DESIGN_NAME     = SmokeAdder
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

export VERILOG_FILES   = $(_project)/rtl/generated/SmokeAdder.sv
export SDC_FILE        = $(_this_dir)/constraint.sdc

export CORE_UTILIZATION       = 40
export PLACE_DENSITY_LB_ADDON = 0.20
