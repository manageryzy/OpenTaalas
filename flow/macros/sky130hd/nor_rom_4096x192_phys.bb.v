// Blackbox for nor_rom_4096x192_phys NOR ROM macro
// 2048 rows x 384 cols = 786432 bits
(* blackbox *)
module nor_rom_4096x192_phys (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 10:0] addr,
  output reg  [383:0] dout
);
endmodule
