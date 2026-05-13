// =============================================================================
// multi_layer_chip_wrapper.sv (v11 — 256-bit phased cascade bus)
//
// Top-level chip composition for K=2 (default) or K=3 physical layer slots.
// Instantiates:
//   - 1× rope_gen                  (chip-shared cos/sin tables, 2× nor_rom_4096x1024)
//   - K× transformer_layer_block   (per-layer compute INCLUDING rope_apply
//                                    folded inside; replaces v9's standalone
//                                    rope_apply + transformer_layer_wrapper pair)
//
// v11 phased cascade — rope_gen and rope_apply now use 256-bit data + 2-bit
// phase. Producer asserts phase 0,1,2,3 over 4 cycles to deliver one full
// 1024-bit row. Drops chip-level cascade pin count from 4096 → 1024 wires per
// layer_block boundary, which fits the 200µm inter-macro routing channel
// capacity (was 3× over before, causing v10 DRT to plateau at 3M shorts).
//
// Cascade chain (rope_gen feeds L0 → L0 forwards to L1 → ...):
//   rope_gen.read_cos_row_result[255:0] → l0_block.ra_forward_cos_v_in[255:0]
//   l0_block.ra_read_cos_forwarded_result_out[255:0] → l1_block.ra_forward_cos_v_in[255:0]
//   (K=3) l1_block.ra_read_cos_forwarded → l2_block.ra_forward_cos
// Phase signal travels in parallel, with 1-cycle delay between L0 and L1.
//
// Per-layer interface is exposed with `l0_*` / `l1_*` prefixes so the
// testbench can drive the two layers' rotate API independently.
// transformer_layer_block hides 656 of transformer_layer_wrapper's 699 ports
// (mac_*, vpu_*, kvc_*, attn_*, fsm_*) — those are tied off internally.
// =============================================================================

`ifndef MULTI_LAYER_K
  `define MULTI_LAYER_K 2
`endif

module multi_layer_chip_wrapper #(
  parameter int K = `MULTI_LAYER_K   // K=2 default; K=3 supported via override
) (
  input  wire           clk,
  input  wire           rst,
  input  wire [   2:0]  stall_rate_in,
  input  wire           stall_rate_valid_in,

  // === rope_gen programming interface (one-time table fill at boot) ===
  input  wire           rg_write_cos_row_valid_in,
  input  wire [11:0]    rg_write_cos_row_position_in,
  input  wire [1023:0]  rg_write_cos_row_value_in,
  input  wire           rg_write_cos_row_rden_in,
  output wire           rg_write_cos_row_rdy_out,
  output wire           rg_write_cos_row_empty_out,
  input  wire           rg_write_sin_row_valid_in,
  input  wire [11:0]    rg_write_sin_row_position_in,
  input  wire [1023:0]  rg_write_sin_row_value_in,
  input  wire           rg_write_sin_row_rden_in,
  output wire           rg_write_sin_row_rdy_out,
  output wire           rg_write_sin_row_empty_out,

  // === Per-step FSM-driven cos/sin row read (drives the cascade) ===
  // v11.3: rope_gen returns the FULL 1024-bit row (v9 design). Chip-level
  // glue performs the 4:1 phase slice into 256-bit chunks for the cascade
  // (see assign block below). Test ports expose the post-slice 256-bit view
  // so the testbench drives phase like before.
  input  wire           rg_read_cos_row_valid_in,
  input  wire [11:0]    rg_read_cos_row_position_in,
  input  wire [ 1:0]    rg_read_cos_row_phase_in,
  input  wire           rg_read_cos_row_rden_in,
  output wire           rg_read_cos_row_rdy_out,
  output wire           rg_read_cos_row_empty_out,
  output wire [255:0]   rg_read_cos_row_result_out,
  input  wire           rg_read_sin_row_valid_in,
  input  wire [11:0]    rg_read_sin_row_position_in,
  input  wire [ 1:0]    rg_read_sin_row_phase_in,
  input  wire           rg_read_sin_row_rden_in,
  output wire           rg_read_sin_row_rdy_out,
  output wire           rg_read_sin_row_empty_out,
  output wire [255:0]   rg_read_sin_row_result_out,

  // === Per-layer rotate API (BF16 element-wise) — exposed independently
  // for L0 and L1 so the testbench can verify both layers see the right
  // rope values (with K-1 cycles of cascade skew at most).
  input  wire           l0_ra_rotate_even_valid_in,
  input  wire [15:0]    l0_ra_rotate_even_x_even_in,
  input  wire [15:0]    l0_ra_rotate_even_x_odd_in,
  input  wire [15:0]    l0_ra_rotate_even_cos_val_in,
  input  wire [15:0]    l0_ra_rotate_even_sin_val_in,
  input  wire           l0_ra_rotate_even_rden_in,
  output wire           l0_ra_rotate_even_rdy_out,
  output wire           l0_ra_rotate_even_empty_out,
  output wire [15:0]    l0_ra_rotate_even_result_out,
  input  wire           l0_ra_rotate_odd_valid_in,
  input  wire [15:0]    l0_ra_rotate_odd_x_even_in,
  input  wire [15:0]    l0_ra_rotate_odd_x_odd_in,
  input  wire [15:0]    l0_ra_rotate_odd_cos_val_in,
  input  wire [15:0]    l0_ra_rotate_odd_sin_val_in,
  input  wire           l0_ra_rotate_odd_rden_in,
  output wire           l0_ra_rotate_odd_rdy_out,
  output wire           l0_ra_rotate_odd_empty_out,
  output wire [15:0]    l0_ra_rotate_odd_result_out,

  input  wire           l1_ra_rotate_even_valid_in,
  input  wire [15:0]    l1_ra_rotate_even_x_even_in,
  input  wire [15:0]    l1_ra_rotate_even_x_odd_in,
  input  wire [15:0]    l1_ra_rotate_even_cos_val_in,
  input  wire [15:0]    l1_ra_rotate_even_sin_val_in,
  input  wire           l1_ra_rotate_even_rden_in,
  output wire           l1_ra_rotate_even_rdy_out,
  output wire           l1_ra_rotate_even_empty_out,
  output wire [15:0]    l1_ra_rotate_even_result_out,
  input  wire           l1_ra_rotate_odd_valid_in,
  input  wire [15:0]    l1_ra_rotate_odd_x_even_in,
  input  wire [15:0]    l1_ra_rotate_odd_x_odd_in,
  input  wire [15:0]    l1_ra_rotate_odd_cos_val_in,
  input  wire [15:0]    l1_ra_rotate_odd_sin_val_in,
  input  wire           l1_ra_rotate_odd_rden_in,
  output wire           l1_ra_rotate_odd_rdy_out,
  output wire           l1_ra_rotate_odd_empty_out,
  output wire [15:0]    l1_ra_rotate_odd_result_out,

  // === Cascade observation taps (test-only) ===
  // Expose the registered cos/sin from each layer's rope_apply so the
  // testbench can confirm the 1-cycle hop semantics.
  // v11: phase parameter selects which 256-bit segment to read from _cos_seg[4].
  input  wire           l0_ra_read_cos_forwarded_valid_in,
  input  wire [ 1:0]    l0_ra_read_cos_forwarded_phase_in,
  input  wire           l0_ra_read_cos_forwarded_rden_in,
  output wire           l0_ra_read_cos_forwarded_rdy_out,
  output wire           l0_ra_read_cos_forwarded_empty_out,
  output wire [255:0]   l0_ra_read_cos_forwarded_result_out,
  input  wire           l1_ra_read_cos_forwarded_valid_in,
  input  wire [ 1:0]    l1_ra_read_cos_forwarded_phase_in,
  input  wire           l1_ra_read_cos_forwarded_rden_in,
  output wire           l1_ra_read_cos_forwarded_rdy_out,
  output wire           l1_ra_read_cos_forwarded_empty_out,
  output wire [255:0]   l1_ra_read_cos_forwarded_result_out
);

  // === Initial sanity: K=2 only in this skeleton; K=3 needs L2 wiring. ===
  // synthesis translate_off
  initial begin
    if (K != 2) begin
      $fatal(1, "multi_layer_chip_wrapper: K=%0d not supported in this revision (only K=2). For K=3, extend cascade chain to l2_ra.", K);
    end
  end
  // synthesis translate_on

  // === rope_gen instance (chip-shared cos/sin tables) ===
  // v11.3: rope_gen returns full 1024-bit rows (v9 design — proven routable).
  wire           rg_rst_done;
  wire [1023:0]  rg_cos_row_full;
  wire [1023:0]  rg_sin_row_full;
  wire           rg_cos_valid_out;  // approximated by rg_read_cos_row_empty_out=0
  wire           rg_sin_valid_out;

  rope_gen u_rope_gen (
    .clk                       (clk),
    .rst                       (rst),
    .read_cos_row_valid_in     (rg_read_cos_row_valid_in),
    .read_cos_row_position_in  (rg_read_cos_row_position_in),
    .read_cos_row_rden_in      (rg_read_cos_row_rden_in),
    .read_sin_row_valid_in     (rg_read_sin_row_valid_in),
    .read_sin_row_position_in  (rg_read_sin_row_position_in),
    .read_sin_row_rden_in      (rg_read_sin_row_rden_in),
    .write_cos_row_valid_in    (rg_write_cos_row_valid_in),
    .write_cos_row_position_in (rg_write_cos_row_position_in),
    .write_cos_row_value_in    (rg_write_cos_row_value_in),
    .write_cos_row_rden_in     (rg_write_cos_row_rden_in),
    .write_sin_row_valid_in    (rg_write_sin_row_valid_in),
    .write_sin_row_position_in (rg_write_sin_row_position_in),
    .write_sin_row_value_in    (rg_write_sin_row_value_in),
    .write_sin_row_rden_in     (rg_write_sin_row_rden_in),
    .stall_rate_in             (stall_rate_in),
    .stall_rate_valid_in       (stall_rate_valid_in),
    .rst_and_startup_done_out  (rg_rst_done),
    .read_cos_row_rdy_out      (rg_read_cos_row_rdy_out),
    .read_cos_row_empty_out    (rg_read_cos_row_empty_out),
    .read_cos_row_result_out   (rg_cos_row_full),
    .read_sin_row_rdy_out      (rg_read_sin_row_rdy_out),
    .read_sin_row_empty_out    (rg_read_sin_row_empty_out),
    .read_sin_row_result_out   (rg_sin_row_full),
    .write_cos_row_rdy_out     (rg_write_cos_row_rdy_out),
    .write_cos_row_empty_out   (rg_write_cos_row_empty_out),
    .write_sin_row_rdy_out     (rg_write_sin_row_rdy_out),
    .write_sin_row_empty_out   (rg_write_sin_row_empty_out),
    .stall_rate_supported_out  ()
  );

  // === Chip-level phase slicer (4:1 mux on phase) ===
  // Slices the 1024-bit rope_gen output into a 256-bit chunk based on phase.
  // ~256×4:1 mux pair = ~1000 stdcells, placed in the chip glue area near
  // rope_gen. Drops the rope_gen→layer_block channel demand from 1024→256
  // wires per cos/sin without needing the mux inside the macro.
  reg [255:0] rg_cos_row;
  reg [255:0] rg_sin_row;
  always_comb begin
    case (rg_read_cos_row_phase_in)
      2'd0: rg_cos_row = rg_cos_row_full[ 255:  0];
      2'd1: rg_cos_row = rg_cos_row_full[ 511:256];
      2'd2: rg_cos_row = rg_cos_row_full[ 767:512];
      2'd3: rg_cos_row = rg_cos_row_full[1023:768];
    endcase
    case (rg_read_sin_row_phase_in)
      2'd0: rg_sin_row = rg_sin_row_full[ 255:  0];
      2'd1: rg_sin_row = rg_sin_row_full[ 511:256];
      2'd2: rg_sin_row = rg_sin_row_full[ 767:512];
      2'd3: rg_sin_row = rg_sin_row_full[1023:768];
    endcase
  end
  assign rg_read_cos_row_result_out = rg_cos_row;
  assign rg_read_sin_row_result_out = rg_sin_row;

  // The cascade-feed valid for L0 is "rope_gen produced a fresh row" —
  // approximate via the read_cos_row read-acknowledge handshake. In a
  // tighter integration the FSM would gate this; here the testbench drives
  // forward_cos_valid in step with rg_read_cos_row_rden.
  assign rg_cos_valid_out = rg_read_cos_row_rden_in;
  assign rg_sin_valid_out = rg_read_sin_row_rden_in;

  // === L0 layer_block (head of cascade — contains rope_apply folded inside) ===
  // v11: 256-bit phased cascade. Phase signal travels in parallel with data.
  wire [255:0] l0_ra_cos_forwarded;
  wire [255:0] l0_ra_sin_forwarded;
  wire         l0_ra_cos_fwd_valid;
  wire         l0_ra_sin_fwd_valid;
  wire [1:0]   l0_ra_cos_fwd_phase;
  wire [1:0]   l0_ra_sin_fwd_phase;

  transformer_layer_block u_l0_block (
    .clk                                 (clk),
    .rst                                 (rst),
    .stall_rate_in                       (stall_rate_in),
    .stall_rate_valid_in                 (stall_rate_valid_in),
    // Cascade input from rope_gen — phase + 256-bit chunk
    .ra_forward_cos_valid_in             (rg_cos_valid_out),
    .ra_forward_cos_phase_in             (rg_read_cos_row_phase_in),
    .ra_forward_cos_v_in                 (rg_cos_row),
    .ra_forward_cos_rden_in              (1'b0),
    .ra_forward_sin_valid_in             (rg_sin_valid_out),
    .ra_forward_sin_phase_in             (rg_read_sin_row_phase_in),
    .ra_forward_sin_v_in                 (rg_sin_row),
    .ra_forward_sin_rden_in              (1'b0),
    // Cascade output to L1 — testbench drives phase to read each segment
    .ra_read_cos_forwarded_valid_in      (l0_ra_read_cos_forwarded_valid_in),
    .ra_read_cos_forwarded_phase_in      (l0_ra_read_cos_forwarded_phase_in),
    .ra_read_cos_forwarded_rden_in       (l0_ra_read_cos_forwarded_rden_in),
    .ra_read_sin_forwarded_valid_in      (1'b1),
    .ra_read_sin_forwarded_phase_in      (l0_ra_read_cos_forwarded_phase_in),
    .ra_read_sin_forwarded_rden_in       (1'b1),
    // Per-element BF16 rotate API
    .ra_rotate_even_valid_in             (l0_ra_rotate_even_valid_in),
    .ra_rotate_even_x_even_in            (l0_ra_rotate_even_x_even_in),
    .ra_rotate_even_x_odd_in             (l0_ra_rotate_even_x_odd_in),
    .ra_rotate_even_cos_val_in           (l0_ra_rotate_even_cos_val_in),
    .ra_rotate_even_sin_val_in           (l0_ra_rotate_even_sin_val_in),
    .ra_rotate_even_rden_in              (l0_ra_rotate_even_rden_in),
    .ra_rotate_odd_valid_in              (l0_ra_rotate_odd_valid_in),
    .ra_rotate_odd_x_even_in             (l0_ra_rotate_odd_x_even_in),
    .ra_rotate_odd_x_odd_in              (l0_ra_rotate_odd_x_odd_in),
    .ra_rotate_odd_cos_val_in            (l0_ra_rotate_odd_cos_val_in),
    .ra_rotate_odd_sin_val_in            (l0_ra_rotate_odd_sin_val_in),
    .ra_rotate_odd_rden_in               (l0_ra_rotate_odd_rden_in),
    .ra_rst_and_startup_done_out         (),
    .ra_forward_cos_rdy_out              (),
    .ra_forward_cos_empty_out            (),
    .ra_forward_sin_rdy_out              (),
    .ra_forward_sin_empty_out            (),
    .ra_read_cos_forwarded_rdy_out       (l0_ra_read_cos_forwarded_rdy_out),
    .ra_read_cos_forwarded_empty_out     (l0_ra_read_cos_forwarded_empty_out),
    .ra_read_cos_forwarded_result_out    (l0_ra_cos_forwarded),
    .ra_read_sin_forwarded_rdy_out       (),
    .ra_read_sin_forwarded_empty_out     (),
    .ra_read_sin_forwarded_result_out    (l0_ra_sin_forwarded),
    .ra_rotate_even_rdy_out              (l0_ra_rotate_even_rdy_out),
    .ra_rotate_even_empty_out            (l0_ra_rotate_even_empty_out),
    .ra_rotate_even_result_out           (l0_ra_rotate_even_result_out),
    .ra_rotate_odd_rdy_out               (l0_ra_rotate_odd_rdy_out),
    .ra_rotate_odd_empty_out             (l0_ra_rotate_odd_empty_out),
    .ra_rotate_odd_result_out            (l0_ra_rotate_odd_result_out)
  );
  assign l0_ra_read_cos_forwarded_result_out = l0_ra_cos_forwarded;

  // The cascade hand-off to L1: as soon as rope_gen produced its row, after
  // 1-cycle latch in L0 the read_cos_forwarded_result_out is valid. Hold the
  // valid + phase for L1's forward_cos a single cycle later.
  // v11: pipeline phase along with valid so L1 sees the right segment index.
  reg       l0_to_l1_valid_d;
  reg [1:0] l0_to_l1_cos_phase_d;
  reg [1:0] l0_to_l1_sin_phase_d;
  always_ff @(posedge clk) begin
    if (rst) begin
      l0_to_l1_valid_d     <= 1'b0;
      l0_to_l1_cos_phase_d <= 2'b00;
      l0_to_l1_sin_phase_d <= 2'b00;
    end else begin
      l0_to_l1_valid_d     <= rg_cos_valid_out;
      l0_to_l1_cos_phase_d <= rg_read_cos_row_phase_in;
      l0_to_l1_sin_phase_d <= rg_read_sin_row_phase_in;
    end
  end
  assign l0_ra_cos_fwd_valid = l0_to_l1_valid_d;
  assign l0_ra_sin_fwd_valid = l0_to_l1_valid_d;
  assign l0_ra_cos_fwd_phase = l0_to_l1_cos_phase_d;
  assign l0_ra_sin_fwd_phase = l0_to_l1_sin_phase_d;

  // === L1 layer_block (tail of cascade for K=2 — contains rope_apply folded inside) ===
  // v11: 256-bit phased cascade. L1 receives (phase, data) pair from L0 with 1-cycle delay.
  transformer_layer_block u_l1_block (
    .clk                                 (clk),
    .rst                                 (rst),
    .stall_rate_in                       (stall_rate_in),
    .stall_rate_valid_in                 (stall_rate_valid_in),
    // Cascade input from L0 (1-cycle delayed cos/sin) — phase + 256-bit chunk
    .ra_forward_cos_valid_in             (l0_ra_cos_fwd_valid),
    .ra_forward_cos_phase_in             (l0_ra_cos_fwd_phase),
    .ra_forward_cos_v_in                 (l0_ra_cos_forwarded),
    .ra_forward_cos_rden_in              (1'b0),
    .ra_forward_sin_valid_in             (l0_ra_sin_fwd_valid),
    .ra_forward_sin_phase_in             (l0_ra_sin_fwd_phase),
    .ra_forward_sin_v_in                 (l0_ra_sin_forwarded),
    .ra_forward_sin_rden_in              (1'b0),
    // Cascade output (unconnected for K=2; would chain to L2 for K=3)
    .ra_read_cos_forwarded_valid_in      (l1_ra_read_cos_forwarded_valid_in),
    .ra_read_cos_forwarded_phase_in      (l1_ra_read_cos_forwarded_phase_in),
    .ra_read_cos_forwarded_rden_in       (l1_ra_read_cos_forwarded_rden_in),
    .ra_read_sin_forwarded_valid_in      (1'b1),
    .ra_read_sin_forwarded_phase_in      (l1_ra_read_cos_forwarded_phase_in),
    .ra_read_sin_forwarded_rden_in       (1'b1),
    // Per-element BF16 rotate API
    .ra_rotate_even_valid_in             (l1_ra_rotate_even_valid_in),
    .ra_rotate_even_x_even_in            (l1_ra_rotate_even_x_even_in),
    .ra_rotate_even_x_odd_in             (l1_ra_rotate_even_x_odd_in),
    .ra_rotate_even_cos_val_in           (l1_ra_rotate_even_cos_val_in),
    .ra_rotate_even_sin_val_in           (l1_ra_rotate_even_sin_val_in),
    .ra_rotate_even_rden_in              (l1_ra_rotate_even_rden_in),
    .ra_rotate_odd_valid_in              (l1_ra_rotate_odd_valid_in),
    .ra_rotate_odd_x_even_in             (l1_ra_rotate_odd_x_even_in),
    .ra_rotate_odd_x_odd_in              (l1_ra_rotate_odd_x_odd_in),
    .ra_rotate_odd_cos_val_in            (l1_ra_rotate_odd_cos_val_in),
    .ra_rotate_odd_sin_val_in            (l1_ra_rotate_odd_sin_val_in),
    .ra_rotate_odd_rden_in               (l1_ra_rotate_odd_rden_in),
    .ra_rst_and_startup_done_out         (),
    .ra_forward_cos_rdy_out              (),
    .ra_forward_cos_empty_out            (),
    .ra_forward_sin_rdy_out              (),
    .ra_forward_sin_empty_out            (),
    .ra_read_cos_forwarded_rdy_out       (l1_ra_read_cos_forwarded_rdy_out),
    .ra_read_cos_forwarded_empty_out     (l1_ra_read_cos_forwarded_empty_out),
    .ra_read_cos_forwarded_result_out    (l1_ra_read_cos_forwarded_result_out),
    .ra_read_sin_forwarded_rdy_out       (),
    .ra_read_sin_forwarded_empty_out     (),
    .ra_read_sin_forwarded_result_out    (),
    .ra_rotate_even_rdy_out              (l1_ra_rotate_even_rdy_out),
    .ra_rotate_even_empty_out            (l1_ra_rotate_even_empty_out),
    .ra_rotate_even_result_out           (l1_ra_rotate_even_result_out),
    .ra_rotate_odd_rdy_out               (l1_ra_rotate_odd_rdy_out),
    .ra_rotate_odd_empty_out             (l1_ra_rotate_odd_empty_out),
    .ra_rotate_odd_result_out            (l1_ra_rotate_odd_result_out)
  );

  // ===========================================================================
  // V10 NOTES:
  //   - Layer compute (mac_arrays + vector_unit + KV + attention + FSM + the
  //     rope_apply rotate datapath) is encapsulated inside transformer_layer_block.
  //     The 656 non-cascade layer ports are tied off in transformer_layer_block.sv.
  //   - To activate full layer compute, drive those tied-off ports through a
  //     chip-level llama_chip FSM (orthogonal work; layer_tile FSM is currently
  //     passive and just sits in IDLE state).
  //   - Embed_rom / lm_head / global_controller are chip-singletons (separately
  //     hardened); their integration to the chip wrapper is a future revision.
  //   - For K=3, append `transformer_layer_block u_l2_block` and chain
  //     l1_ra_read_cos_forwarded_result_out -> u_l2_block.ra_forward_cos_v_in.
  // ===========================================================================

endmodule
