// Black-box stub for rope_gen tile macro (hierarchical PnR).
// Exposes only the top-level Kanagawa ports — internal nor_rom_4096x1024
// instances are hidden inside the abstract LEF/Liberty.
(* blackbox *)
module rope_gen (
  input  wire          clk,
  input  wire          rst,
  input  wire          read_cos_row_valid_in,
  input  wire [11:0]   read_cos_row_position_in,
  input  wire          read_cos_row_rden_in,
  input  wire          read_sin_row_valid_in,
  input  wire [11:0]   read_sin_row_position_in,
  input  wire          read_sin_row_rden_in,
  input  wire          write_cos_row_valid_in,
  input  wire [11:0]   write_cos_row_position_in,
  input  wire [1023:0] write_cos_row_value_in,
  input  wire          write_cos_row_rden_in,
  input  wire          write_sin_row_valid_in,
  input  wire [11:0]   write_sin_row_position_in,
  input  wire [1023:0] write_sin_row_value_in,
  input  wire          write_sin_row_rden_in,
  input  wire [2:0]    stall_rate_in,
  input  wire          stall_rate_valid_in,
  output wire          rst_and_startup_done_out,
  output wire          read_cos_row_rdy_out,
  output wire          read_cos_row_empty_out,
  output wire [1023:0] read_cos_row_result_out,
  output wire          read_sin_row_rdy_out,
  output wire          read_sin_row_empty_out,
  output wire [1023:0] read_sin_row_result_out,
  output wire          write_cos_row_rdy_out,
  output wire          write_cos_row_empty_out,
  output wire          write_sin_row_rdy_out,
  output wire          write_sin_row_empty_out,
  output wire          stall_rate_supported_out
);
endmodule
