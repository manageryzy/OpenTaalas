// Blackbox for nor_rom_1024x880 NOR ROM macro
// 1024 rows x 880 cols = 901120 bits
(* blackbox *)
module nor_rom_1024x880 (
  input  wire              clk,
  input  wire              ce,
  input  wire [  9:0] addr,
  output reg  [879:0] dout
);
endmodule
