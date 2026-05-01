# rope_apply — per-layer rotation datapath. Macro-free.
# Inputs include cos_val/sin_val from chip-level rope_gen broadcast bus
# (~5mm worst-case wire), so input_delay is bumped to 40% of clock to
# match rope_gen's output_delay. x_even/x_odd come from the adjacent
# mac_array (short hop) but get the same conservative budget for safety.
set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  [expr $clk_period * 0.4] -clock clk $non_clock_inputs
}
# Output goes to local mac_array (short hop).
set_output_delay [expr $clk_period * 0.2] -clock clk [all_outputs]
