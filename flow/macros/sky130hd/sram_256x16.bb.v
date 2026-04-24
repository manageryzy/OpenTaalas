// Blackbox for sram_256x16 SRAM macro
// 256 rows x 16 bits
(* blackbox *)
module sram_256x16 (
  input  wire              clk,
  input  wire              ce,
  input  wire              we,
  input  wire [  7:0] addr,
  input  wire [ 15:0] din,
  output reg  [ 15:0] dout
);
endmodule
