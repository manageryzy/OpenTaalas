# SmokeAdder timing constraints
# Combinational-only design — define a virtual clock for I/O timing

create_clock -name clk -period 10.0
set_input_delay  -clock clk 0.0 [all_inputs]
set_output_delay -clock clk 0.0 [all_outputs]
