// Blackbox for sram_8192x8 SRAM macro
// 8192 rows x 8 bits
(* blackbox *)
module sram_8192x8 (
  input  wire              clk,
  input  wire              ce,
  input  wire              we,
  input  wire [ 12:0] addr,
  input  wire [  7:0] din,
  output reg  [  7:0] dout
);
endmodule
