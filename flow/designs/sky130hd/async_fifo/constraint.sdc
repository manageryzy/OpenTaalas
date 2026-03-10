set clk_period 4.0
create_clock -name wr_clk -period $clk_period [get_ports wr_clk]
create_clock -name rd_clk -period $clk_period [get_ports rd_clk]
set_clock_groups -asynchronous -group {wr_clk} -group {rd_clk}

set wr_inputs [get_ports {wr_en wr_data* wr_rst_n}]
set rd_inputs [get_ports {rd_en rd_rst_n}]

set_input_delay  [expr $clk_period * 0.2] -clock wr_clk $wr_inputs
set_input_delay  [expr $clk_period * 0.2] -clock rd_clk $rd_inputs
set_output_delay [expr $clk_period * 0.2] -clock wr_clk [get_ports wr_full]
set_output_delay [expr $clk_period * 0.2] -clock rd_clk [get_ports {rd_data* rd_empty}]
