set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  [expr $clk_period * 0.2] -clock clk $non_clock_inputs
}
set_output_delay [expr $clk_period * 0.2] -clock clk [all_outputs]
