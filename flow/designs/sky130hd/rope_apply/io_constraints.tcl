# rope_apply IO_CONSTRAINTS — v8 multi-layer cascade
#
# Cascade direction: rope_gen (or upstream rope_apply) → THIS tile → next rope_apply.
# Pin layout (split cos/sin on opposite axes to fit 4× 1024-bit buses around
# the die without exceeding any single edge's slot capacity):
#   left   edge: cos_in  (forward_cos_v_in[1023:0])
#   right  edge: cos_out (read_cos_forwarded_result_out[1023:0])
#   top    edge: sin_in  (forward_sin_v_in[1023:0]) + clk/rst
#   bottom edge: sin_out (read_sin_forwarded_result_out[1023:0]) + rotate ports
#
# Cascade routing: cos enters LEFT, exits RIGHT (clean L→R east-bound).
# sin enters TOP, exits BOTTOM (clean N→S south-bound).
# In the chip-level cascade chain (rope_gen → L0.RA → L1.RA), this means
# cos hops west-to-east while sin hops north-to-south. Both directions are
# short (≤ 1mm) since cascade tiles are physically adjacent.
#
# We deliberately omit `-group -order` constraints — the pins can be freely
# placed along the constrained edge. With ~1024 pins on a 2800µm edge
# (~1.36 µm met3 pitch with 2-track spacing) we use ~50% of available
# slots, leaving plenty of headroom and avoiding the PPL-0093 contiguity
# error.

set_io_pin_constraint -region left:* -pin_names {forward_cos_v_in*}
set_io_pin_constraint -region left:* -pin_names {forward_cos_valid_in forward_cos_rden_in forward_cos_rdy_out forward_cos_empty_out}

set_io_pin_constraint -region right:* -pin_names {read_cos_forwarded_result_out*}
set_io_pin_constraint -region right:* -pin_names {read_cos_forwarded_valid_in read_cos_forwarded_rden_in read_cos_forwarded_rdy_out read_cos_forwarded_empty_out}

set_io_pin_constraint -region top:* -pin_names {forward_sin_v_in*}
set_io_pin_constraint -region top:* -pin_names {forward_sin_valid_in forward_sin_rden_in forward_sin_rdy_out forward_sin_empty_out clk rst stall_rate*}

set_io_pin_constraint -region bottom:* -pin_names {read_sin_forwarded_result_out*}
set_io_pin_constraint -region bottom:* -pin_names {read_sin_forwarded_valid_in read_sin_forwarded_rden_in read_sin_forwarded_rdy_out read_sin_forwarded_empty_out}
set_io_pin_constraint -region bottom:* -pin_names {rotate_even_* rotate_odd_*}
