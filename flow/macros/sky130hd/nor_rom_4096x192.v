// Folded wrapper for nor_rom_4096x192
// Logical: 4096 rows x 192 cols
// Physical: 2048 rows x 384 cols (fold=2)
// addr[11:11] selects fold bank, addr[10:0] selects row
module nor_rom_4096x192 (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 11:0] addr,
  output wire [191:0] dout
);

  // Split address: upper bits select fold bank, lower bits select physical row
  wire [10:0] phys_addr = addr[10:0];
  wire [0:0] fold_sel = addr[11:11];

  // Physical ROM read — full width
  wire [383:0] phys_dout;
  nor_rom_4096x192_phys u_phys_rom (
    .clk  (clk),
    .ce   (ce),
    .addr (phys_addr),
    .dout (phys_dout)
  );

  // Register fold_sel to align with ROM output (1-cycle read latency)
  reg [0:0] fold_sel_r;
  always @(posedge clk) begin
    if (ce)
      fold_sel_r <= fold_sel;
  end

  // Column mux: select the correct 192-bit slice
  assign dout = phys_dout[fold_sel_r * 192 +: 192];

endmodule
