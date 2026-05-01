export DESIGN_NICKNAME = rope_apply
export DESIGN_NAME     = rope_apply
export PLATFORM        = sky130hd

_this_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
_project  := $(abspath $(_this_dir)/../../../..)

include $(_this_dir)/../../kanagawa_runtime.mk

export VERILOG_FILES   = $(_project)/rtl/generated/kanagawa/rope_applyrope_apply.sv \
                         $(_project)/rtl/generated/kanagawa/rope_applyrope_apply_types.sv \
                         $(KANAGAWA_RUNTIME_SV)
export VERILOG_DEFINES = $(KANAGAWA_VERILOG_DEFINES)
export SDC_FILE        = $(_this_dir)/constraint.sdc

export SYNTH_HDL_FRONTEND = slang
# Pure stdcell (no macros) — small tile sized for two BF16-mult+add datapaths
# at [[schedule(8)]]. Cell estimate ~25K based on swiglu_compute footprint × 2.
export DIE_AREA  = 0 0 800 800
export CORE_AREA = 10 10 790 790
export PLACE_DENSITY_LB_ADDON = 0.20
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1
