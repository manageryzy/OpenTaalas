# layer_orchestrator — pure-Kanagawa orchestrator (rope_apply + vector_unit)
# v12 standalone PnR. Cascade I/O has chip-level placement implications;
# input/output delays use 0.4×clk to match v11.3 rope_gen ↔ rope_apply
# inter-tile budget. Local methods (rmsnorm/swiglu/residual/rotate) are
# called by chip-level FSM with short hops, but use the same conservative
# budget for safety.
set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  [expr $clk_period * 0.4] -clock clk $non_clock_inputs
}
set_output_delay [expr $clk_period * 0.4] -clock clk [all_outputs]
