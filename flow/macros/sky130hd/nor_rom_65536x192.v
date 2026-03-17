// Folded wrapper for nor_rom_65536x192
// Logical: 65536 rows x 192 cols
// Physical: 4096 rows x 3072 cols (fold=16)
// addr[15:12] selects fold bank, addr[11:0] selects row
module nor_rom_65536x192 (
  input  wire              clk,
  input  wire              ce,
  input  wire [ 15:0] addr,
  output wire [191:0] dout
);

  // Split address: upper bits select fold bank, lower bits select physical row
  wire [11:0] phys_addr = addr[11:0];
  wire [3:0] fold_sel = addr[15:12];

  // Physical ROM read — full width
  wire [3071:0] phys_dout;
  nor_rom_65536x192_phys u_phys_rom (
    .clk  (clk),
    .ce   (ce),
    .addr (phys_addr),
    .dout (phys_dout)
  );

  // Register fold_sel to align with ROM output (1-cycle read latency)
  reg [3:0] fold_sel_r;
  always @(posedge clk) begin
    if (ce)
      fold_sel_r <= fold_sel;
  end

  // Column mux: select the correct 192-bit slice
  assign dout = phys_dout[fold_sel_r * 192 +: 192];

endmodule
