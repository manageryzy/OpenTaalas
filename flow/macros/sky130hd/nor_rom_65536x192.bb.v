// Blackbox for nor_rom_65536x192 NOR ROM macro
// 65536 rows x 192 cols = 12582912 bits
(* blackbox *)
module nor_rom_65536x192 (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 15:0] addr,
  output reg  [191:0] dout
);
endmodule
