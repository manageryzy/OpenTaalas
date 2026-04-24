// Blackbox for nor_rom_4096x192 NOR ROM macro
// 4096 rows x 192 cols = 786432 bits
(* blackbox *)
module nor_rom_4096x192 (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 11:0] addr,
  output reg  [191:0] dout
);
endmodule
