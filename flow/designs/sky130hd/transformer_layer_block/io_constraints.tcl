# transformer_layer_block — IO_CONSTRAINTS (v11 — 256-bit phased cascade)
#
# Cascade direction: rope_gen → layer_block_L0 → layer_block_L1 → ... (left-to-right
# at the chip level). Pin layout reflects this:
#   WEST edge: ra_forward_cos_v_in (256-bit) + phase + ra_forward_sin_v_in (256-bit) + phase
#   EAST edge: ra_read_cos_forwarded_result_out (256-bit) + ra_read_sin_forwarded_result_out (256-bit)
#   NORTH/SOUTH: control + testbench-facing ports (mac_*, vpu_*, kvc_*, attn_*, fsm_*)
#
# v11 cuts cascade data pins from 4×1024=4096 to 4×256=1024 (3.97× reduction).
# Phase signals (2-bit each, 4×2=8 wires) added on the same edges as their data.

set_io_pin_constraint -region left:* -pin_names {ra_forward_cos_v_in*}
set_io_pin_constraint -region left:* -pin_names {ra_forward_cos_phase_in*}
set_io_pin_constraint -region left:* -pin_names {ra_forward_cos_valid_in ra_forward_cos_rden_in ra_forward_cos_rdy_out ra_forward_cos_empty_out}
set_io_pin_constraint -region left:* -pin_names {ra_forward_sin_v_in*}
set_io_pin_constraint -region left:* -pin_names {ra_forward_sin_phase_in*}
set_io_pin_constraint -region left:* -pin_names {ra_forward_sin_valid_in ra_forward_sin_rden_in ra_forward_sin_rdy_out ra_forward_sin_empty_out}

set_io_pin_constraint -region right:* -pin_names {ra_read_cos_forwarded_result_out*}
set_io_pin_constraint -region right:* -pin_names {ra_read_cos_forwarded_phase_in*}
set_io_pin_constraint -region right:* -pin_names {ra_read_cos_forwarded_valid_in ra_read_cos_forwarded_rden_in ra_read_cos_forwarded_rdy_out ra_read_cos_forwarded_empty_out}
set_io_pin_constraint -region right:* -pin_names {ra_read_sin_forwarded_result_out*}
set_io_pin_constraint -region right:* -pin_names {ra_read_sin_forwarded_phase_in*}
set_io_pin_constraint -region right:* -pin_names {ra_read_sin_forwarded_valid_in ra_read_sin_forwarded_rden_in ra_read_sin_forwarded_rdy_out ra_read_sin_forwarded_empty_out}
