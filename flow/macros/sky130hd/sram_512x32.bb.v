// Blackbox for sram_512x32 SRAM macro
// 512 rows x 32 bits
(* blackbox *)
module sram_512x32 (
  input  wire              clk,
  input  wire              ce,
  input  wire              we,
  input  wire [  8:0] addr,
  input  wire [ 31:0] din,
  output reg  [ 31:0] dout
);
endmodule
