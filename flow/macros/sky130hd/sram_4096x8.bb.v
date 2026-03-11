// Blackbox for sram_4096x8 SRAM macro
// 4096 rows x 8 bits
(* blackbox *)
module sram_4096x8 (
  input  wire              clk,
  input  wire              ce,
  input  wire              we,
  input  wire [ 11:0] addr,
  input  wire [  7:0] din,
  output reg  [  7:0] dout
);
endmodule
