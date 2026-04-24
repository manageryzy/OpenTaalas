export DESIGN_NICKNAME = layer_tile
export DESIGN_NAME     = layer_tile
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/layer_tilelayer_tile.sv \
                         $(_project)/rtl/generated/kanagawa/layer_tilelayer_tile_types.sv \
                         $(KANAGAWA_RUNTIME_SV)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
export CORE_UTILIZATION = 65
export PLACE_DENSITY_LB_ADDON = 0.05
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1
