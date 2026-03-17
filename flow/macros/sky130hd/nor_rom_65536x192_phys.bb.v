// Blackbox for nor_rom_65536x192_phys NOR ROM macro
// 4096 rows x 3072 cols = 12582912 bits
(* blackbox *)
module nor_rom_65536x192_phys (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 11:0] addr,
  output reg  [3071:0] dout
);
endmodule
