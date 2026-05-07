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
# v8 multi-layer cascade: pure stdcell rotate datapath + 2× 1024-bit cos/sin
# cascade pass-through. Cell count actually climbed from v7's 25K to **111K**
# (5×) — Kanagawa pipelines the 1024-bit forward_cos/sin methods through
# multiple FIFO stages plus the read_*_forwarded methods, far more than the
# naive "2× 1024-bit reg = 2K FFs" estimate. Synth area 2.72 mm², 79%
# sequential. Die sized for BOTH (a) 47% util at 111K cells AND (b) 2056-pin
# escape on LEFT/RIGHT edges (1024 cos + 1024 sin + handshake). At met3
# pitch (1.36 µm with 2-track min spacing), each edge needs ≥ 2800 µm to
# fit 2056 pins. 2400×2400 first try failed PPL-0111 (only 1763 slots).
# 2800×2800 (7.84 mm², 33% util) gives the pin headroom.
export DIE_AREA  = 0 0 2800 2800
export CORE_AREA = 10 10 2790 2790
export PLACE_DENSITY_LB_ADDON = 0.10
export SYNTH_MEMORY_MAX_BITS = 65536
export REMOVE_ABC_BUFFERS = 1

# v8 IO_CONSTRAINTS: pin cos_out/sin_out (read_cos_forwarded_result_out,
# read_sin_forwarded_result_out) on the EAST die edge so the cascade hop to
# the next layer's rope_apply (placed to the east in the floorplan) is short.
# cos_in/sin_in (forward_cos_v_in, forward_sin_v_in) pinned on WEST edge,
# arriving from the upstream tile.
export IO_CONSTRAINTS = $(_this_dir)/io_constraints.tcl
