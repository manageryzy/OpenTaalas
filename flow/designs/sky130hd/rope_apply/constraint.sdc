# rope_apply — per-layer rotation datapath. Macro-free.
# v8 multi-layer cascade: cos_in/sin_in arrives from upstream rope_gen (L0)
# or upstream rope_apply (L>0) on the WEST/NORTH die edge. cos_out/sin_out
# (registered 1-cycle pass-through) exits the EAST die edge for the next
# layer's rope_apply. All cascade hops are ≤ 1 mm in the floorplan, so the
# input_delay is dropped from v7's 0.4×clk (broadcast budget) to 0.2×clk
# (cascade short-hop budget). x_even/x_odd come from local mac_array.
set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  [expr $clk_period * 0.2] -clock clk $non_clock_inputs
}
# Outputs: rotate_even/odd → local mac_array (short hop); cos_out/sin_out →
# next rope_apply via cascade (also short hop ≤ 1 mm).
set_output_delay [expr $clk_period * 0.2] -clock clk [all_outputs]
