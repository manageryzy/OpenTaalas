export DESIGN_NAME     = SmokeAdder
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

export VERILOG_FILES   = $(_project)/rtl/generated/SmokeAdder.sv
export SDC_FILE        = $(_this_dir)/constraint.sdc

# Explicit die area — SmokeAdder is tiny, needs minimum size for PDN straps
export DIE_AREA  = 0 0 80 80
export CORE_AREA = 5 5 75 75

export PLACE_DENSITY_LB_ADDON = 0.20
