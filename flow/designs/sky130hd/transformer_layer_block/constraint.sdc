# transformer_layer_block — sky130hd timing constraints (v10 layer block)
#
# Clock: 250 MHz (4 ns) baseline. fmax target ≥ 130 MHz.
#
# I/O budgets (input_delay / output_delay):
# - rope cascade ports (ra_*) — short hop (~200 µm chip-level layer_block to
#   layer_block adjacency). 0.2 × clk_period (0.8 ns) is sufficient.
# - other layer ports (mac_*, vpu_*, kvc_*, attn_*, fsm_*) — driven by
#   testbench during standalone PnR. Generic 0.4 × clk_period budget.
#
# When integrated into multi_layer_chip, the ra_cos_out → next_layer_block.ra_cos_in
# path is ≤ 200 µm intra-chip with met4/met5 routing. SDC at the chip level
# can apply set_multicycle_path -setup 2 if any cascade slack issues remain.

set sdc_version 2.0

set clk_period 4.0
set clk_name   clk
set clk_port   clk

create_clock -name $clk_name -period $clk_period [get_ports $clk_port]

set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] [get_ports $clk_port]]

# Generic 0.4×period budget for general ports
if {[llength $non_clock_inputs] > 0} {
    set_input_delay  -clock $clk_name [expr 0.4 * $clk_period] $non_clock_inputs
}
set_output_delay -clock $clk_name [expr 0.4 * $clk_period] [all_outputs]

# Rope cascade ports — tight 0.2×period (short chip-level hop)
set_input_delay  -clock $clk_name [expr 0.2 * $clk_period] [get_ports {ra_forward_cos_v_in[*] ra_forward_sin_v_in[*]}]
set_output_delay -clock $clk_name [expr 0.2 * $clk_period] [get_ports {ra_read_cos_forwarded_result_out[*] ra_read_sin_forwarded_result_out[*]}]

# Drive strength for chip-level connections
set_driving_cell -lib_cell sky130_fd_sc_hd__buf_4 [all_inputs]
set_load 0.05 [all_outputs]
