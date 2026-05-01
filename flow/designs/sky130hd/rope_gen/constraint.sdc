# rope_gen — chip-level RoPE table generator (single instance per chip).
# Drives a 1024-bit cos/sin bus that crosses the chip to per-layer rope_apply
# tiles. The broadcast bus is the critical chip-level wire; budget 40% of
# clock period for inter-tile wire delay (~5mm worst case at sky130hd met4/5
# adds ~1.2-1.5 ns; 1.6 ns gives a 0.1-0.4 ns repeater margin).
set clk_period 4.0
create_clock -name clk -period $clk_period [get_ports clk]
set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports clk]]
if {[llength $non_clock_inputs] > 0} {
    # Inputs are short-hop control (position, write data, handshake).
    set_input_delay  [expr $clk_period * 0.2] -clock clk $non_clock_inputs
}
# Output bus crosses chip — needs the larger budget.
set_output_delay [expr $clk_period * 0.4] -clock clk [all_outputs]
