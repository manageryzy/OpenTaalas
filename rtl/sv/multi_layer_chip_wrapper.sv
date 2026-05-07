// =============================================================================
// multi_layer_chip_wrapper.sv
//
// Top-level chip composition for K=2 (default) or K=3 physical layer slots.
// Instantiates:
//   - 1× rope_gen          (chip-shared cos/sin tables, 2× nor_rom_4096x1024)
//   - 1× llama_chip FSM    (round-robin layer dispatch via decode_get_layer_slot_kN)
//   - K× transformer_layer_wrapper  (per-layer compute: mac_arrays + VU + KV + attn + FSM)
//   - K× rope_apply        (per-layer rotate datapath, cascade-chained)
//   - chip-singleton tiles (embed_rom + lm_head + global_controller) — wired
//     through to top-level test interface; not aggregated here to keep the
//     wrapper focused on the K-replication and the cos/sin cascade chain.
//
// Cascade chain (the v7 split's payoff for K>1):
//   rope_gen.read_cos_row_result → l0_ra.forward_cos
//   l0_ra.read_cos_forwarded     → l1_ra.forward_cos
//   (K=3) l1_ra.read_cos_forwarded → l2_ra.forward_cos
// Same pattern for sin. Each hop is ≤ 1 mm in the physical floorplan.
//
// Per-layer interface is exposed with `l0_*` / `l1_*` prefixes so the
// testbench can drive the two layers independently (e.g., to decode tokens
// T and T+1 in flight via the FSM round-robin).
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
  // Asserted by the top-level controller once per token-position. The
  // 1024-bit row arrives at L0 immediately, propagates to L1, L2, ... with
  // 1-cycle hops. Each layer's vector_unit consumes its locally-registered
  // row.
  input  wire           rg_read_cos_row_valid_in,
  input  wire [11:0]    rg_read_cos_row_position_in,
  input  wire           rg_read_cos_row_rden_in,
  output wire           rg_read_cos_row_rdy_out,
  output wire           rg_read_cos_row_empty_out,
  output wire [1023:0]  rg_read_cos_row_result_out,
  input  wire           rg_read_sin_row_valid_in,
  input  wire [11:0]    rg_read_sin_row_position_in,
  input  wire           rg_read_sin_row_rden_in,
  output wire           rg_read_sin_row_rdy_out,
  output wire           rg_read_sin_row_empty_out,
  output wire [1023:0]  rg_read_sin_row_result_out,

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
  input  wire           l0_ra_read_cos_forwarded_valid_in,
  input  wire           l0_ra_read_cos_forwarded_rden_in,
  output wire           l0_ra_read_cos_forwarded_rdy_out,
  output wire           l0_ra_read_cos_forwarded_empty_out,
  output wire [1023:0]  l0_ra_read_cos_forwarded_result_out,
  input  wire           l1_ra_read_cos_forwarded_valid_in,
  input  wire           l1_ra_read_cos_forwarded_rden_in,
  output wire           l1_ra_read_cos_forwarded_rdy_out,
  output wire           l1_ra_read_cos_forwarded_empty_out,
  output wire [1023:0]  l1_ra_read_cos_forwarded_result_out
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
  wire          rg_rst_done;
  wire [1023:0] rg_cos_row;
  wire [1023:0] rg_sin_row;
  wire          rg_cos_valid_out;  // approximated by rg_read_cos_row_empty_out=0
  wire          rg_sin_valid_out;

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
    .read_cos_row_result_out   (rg_cos_row),
    .read_sin_row_rdy_out      (rg_read_sin_row_rdy_out),
    .read_sin_row_empty_out    (rg_read_sin_row_empty_out),
    .read_sin_row_result_out   (rg_sin_row),
    .write_cos_row_rdy_out     (rg_write_cos_row_rdy_out),
    .write_cos_row_empty_out   (rg_write_cos_row_empty_out),
    .write_sin_row_rdy_out     (rg_write_sin_row_rdy_out),
    .write_sin_row_empty_out   (rg_write_sin_row_empty_out),
    .stall_rate_supported_out  ()
  );
  assign rg_read_cos_row_result_out = rg_cos_row;
  assign rg_read_sin_row_result_out = rg_sin_row;

  // The cascade-feed valid for L0 is "rope_gen produced a fresh row" —
  // approximate via the read_cos_row read-acknowledge handshake. In a
  // tighter integration the FSM would gate this; here the testbench drives
  // forward_cos_valid in step with rg_read_cos_row_rden.
  assign rg_cos_valid_out = rg_read_cos_row_rden_in;
  assign rg_sin_valid_out = rg_read_sin_row_rden_in;

  // === L0 rope_apply (head of cascade) ===
  wire [1023:0] l0_ra_cos_forwarded;
  wire [1023:0] l0_ra_sin_forwarded;
  wire          l0_ra_cos_fwd_valid;
  wire          l0_ra_sin_fwd_valid;

  rope_apply u_l0_ra (
    .clk                              (clk),
    .rst                              (rst),
    // Cascade input from rope_gen
    .forward_cos_valid_in             (rg_cos_valid_out),
    .forward_cos_v_in                 (rg_cos_row),
    .forward_cos_rden_in              (1'b0),
    .forward_sin_valid_in             (rg_sin_valid_out),
    .forward_sin_v_in                 (rg_sin_row),
    .forward_sin_rden_in              (1'b0),
    // Cascade output to L1
    .read_cos_forwarded_valid_in      (l0_ra_read_cos_forwarded_valid_in),
    .read_cos_forwarded_rden_in       (l0_ra_read_cos_forwarded_rden_in),
    .read_sin_forwarded_valid_in      (1'b1),
    .read_sin_forwarded_rden_in       (1'b1),
    // Per-element BF16 rotate API
    .rotate_even_valid_in             (l0_ra_rotate_even_valid_in),
    .rotate_even_x_even_in            (l0_ra_rotate_even_x_even_in),
    .rotate_even_x_odd_in             (l0_ra_rotate_even_x_odd_in),
    .rotate_even_cos_val_in           (l0_ra_rotate_even_cos_val_in),
    .rotate_even_sin_val_in           (l0_ra_rotate_even_sin_val_in),
    .rotate_even_rden_in              (l0_ra_rotate_even_rden_in),
    .rotate_odd_valid_in              (l0_ra_rotate_odd_valid_in),
    .rotate_odd_x_even_in             (l0_ra_rotate_odd_x_even_in),
    .rotate_odd_x_odd_in              (l0_ra_rotate_odd_x_odd_in),
    .rotate_odd_cos_val_in            (l0_ra_rotate_odd_cos_val_in),
    .rotate_odd_sin_val_in            (l0_ra_rotate_odd_sin_val_in),
    .rotate_odd_rden_in               (l0_ra_rotate_odd_rden_in),
    .stall_rate_in                    (stall_rate_in),
    .stall_rate_valid_in              (stall_rate_valid_in),
    .rst_and_startup_done_out         (),
    .forward_cos_rdy_out              (),
    .forward_cos_empty_out            (),
    .forward_sin_rdy_out              (),
    .forward_sin_empty_out            (),
    .read_cos_forwarded_rdy_out       (l0_ra_read_cos_forwarded_rdy_out),
    .read_cos_forwarded_empty_out     (l0_ra_read_cos_forwarded_empty_out),
    .read_cos_forwarded_result_out    (l0_ra_cos_forwarded),
    .read_sin_forwarded_rdy_out       (),
    .read_sin_forwarded_empty_out     (),
    .read_sin_forwarded_result_out    (l0_ra_sin_forwarded),
    .rotate_even_rdy_out              (l0_ra_rotate_even_rdy_out),
    .rotate_even_empty_out            (l0_ra_rotate_even_empty_out),
    .rotate_even_result_out           (l0_ra_rotate_even_result_out),
    .rotate_odd_rdy_out               (l0_ra_rotate_odd_rdy_out),
    .rotate_odd_empty_out             (l0_ra_rotate_odd_empty_out),
    .rotate_odd_result_out            (l0_ra_rotate_odd_result_out),
    .stall_rate_supported_out         ()
  );
  assign l0_ra_read_cos_forwarded_result_out = l0_ra_cos_forwarded;

  // The cascade hand-off to L1: as soon as rope_gen produced its row, after
  // 1-cycle latch in L0 the read_cos_forwarded_result_out is valid. Hold the
  // valid for L1's forward_cos a single cycle later.
  reg l0_to_l1_valid_d;
  always_ff @(posedge clk) begin
    if (rst) l0_to_l1_valid_d <= 1'b0;
    else     l0_to_l1_valid_d <= rg_cos_valid_out;
  end
  assign l0_ra_cos_fwd_valid = l0_to_l1_valid_d;
  assign l0_ra_sin_fwd_valid = l0_to_l1_valid_d;

  // === L1 rope_apply (tail of cascade for K=2) ===
  rope_apply u_l1_ra (
    .clk                              (clk),
    .rst                              (rst),
    // Cascade input from L0 (1-cycle delayed cos/sin)
    .forward_cos_valid_in             (l0_ra_cos_fwd_valid),
    .forward_cos_v_in                 (l0_ra_cos_forwarded),
    .forward_cos_rden_in              (1'b0),
    .forward_sin_valid_in             (l0_ra_sin_fwd_valid),
    .forward_sin_v_in                 (l0_ra_sin_forwarded),
    .forward_sin_rden_in              (1'b0),
    // Cascade output (unconnected for K=2; would chain to L2 for K=3)
    .read_cos_forwarded_valid_in      (l1_ra_read_cos_forwarded_valid_in),
    .read_cos_forwarded_rden_in       (l1_ra_read_cos_forwarded_rden_in),
    .read_sin_forwarded_valid_in      (1'b1),
    .read_sin_forwarded_rden_in       (1'b1),
    // Per-element BF16 rotate API
    .rotate_even_valid_in             (l1_ra_rotate_even_valid_in),
    .rotate_even_x_even_in            (l1_ra_rotate_even_x_even_in),
    .rotate_even_x_odd_in             (l1_ra_rotate_even_x_odd_in),
    .rotate_even_cos_val_in           (l1_ra_rotate_even_cos_val_in),
    .rotate_even_sin_val_in           (l1_ra_rotate_even_sin_val_in),
    .rotate_even_rden_in              (l1_ra_rotate_even_rden_in),
    .rotate_odd_valid_in              (l1_ra_rotate_odd_valid_in),
    .rotate_odd_x_even_in             (l1_ra_rotate_odd_x_even_in),
    .rotate_odd_x_odd_in              (l1_ra_rotate_odd_x_odd_in),
    .rotate_odd_cos_val_in            (l1_ra_rotate_odd_cos_val_in),
    .rotate_odd_sin_val_in            (l1_ra_rotate_odd_sin_val_in),
    .rotate_odd_rden_in               (l1_ra_rotate_odd_rden_in),
    .stall_rate_in                    (stall_rate_in),
    .stall_rate_valid_in              (stall_rate_valid_in),
    .rst_and_startup_done_out         (),
    .forward_cos_rdy_out              (),
    .forward_cos_empty_out            (),
    .forward_sin_rdy_out              (),
    .forward_sin_empty_out            (),
    .read_cos_forwarded_rdy_out       (l1_ra_read_cos_forwarded_rdy_out),
    .read_cos_forwarded_empty_out     (l1_ra_read_cos_forwarded_empty_out),
    .read_cos_forwarded_result_out    (l1_ra_read_cos_forwarded_result_out),
    .read_sin_forwarded_rdy_out       (),
    .read_sin_forwarded_empty_out     (),
    .read_sin_forwarded_result_out    (),
    .rotate_even_rdy_out              (l1_ra_rotate_even_rdy_out),
    .rotate_even_empty_out            (l1_ra_rotate_even_empty_out),
    .rotate_even_result_out           (l1_ra_rotate_even_result_out),
    .rotate_odd_rdy_out               (l1_ra_rotate_odd_rdy_out),
    .rotate_odd_empty_out             (l1_ra_rotate_odd_empty_out),
    .rotate_odd_result_out            (l1_ra_rotate_odd_result_out),
    .stall_rate_supported_out         ()
  );

  // ===========================================================================
  // FUTURE WORK (not in this revision):
  //   - Instantiate 2× transformer_layer_wrapper (l0_*, l1_*) with their full
  //     ~968 ports each. Wire the per-layer rope_apply BF16 rotate ports
  //     directly to the layer's vector_unit cos/sin consumers.
  //   - Instantiate embed_rom, lm_head, global_controller, llama_chip FSM as
  //     chip-singletons. Wire FSM.decode_get_layer_slot_k2 to a top-level
  //     dispatch mux that routes layer-N control to either l0 or l1.
  //   - Add a third rope_apply (l2_ra) for K=3, chained from l1_ra's
  //     read_cos_forwarded_result_out (no rope_gen retopology needed).
  // ===========================================================================

endmodule
