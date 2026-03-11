// Blackbox for nor_rom_4096x1024 NOR ROM macro
// 4096 rows x 1024 cols = 4194304 bits
(* blackbox *)
module nor_rom_4096x1024 (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 11:0] addr,
  output reg  [1023:0] dout
);
endmodule
