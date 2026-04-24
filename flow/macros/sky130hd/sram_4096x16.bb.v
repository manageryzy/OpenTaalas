// Blackbox for sram_4096x16 SRAM macro
// 4096 rows x 16 bits
(* blackbox *)
module sram_4096x16 (
  input  wire              clk,
  input  wire              ce,
  input  wire              we,
  input  wire [ 11:0] addr,
  input  wire [ 15:0] din,
  output reg  [ 15:0] dout
);
endmodule
