// transformer_layer_block — minimal wrapper around rope_apply with layer-block
// pin layout. Per the v10 plan, rope_apply "just fits" within what a per-layer
// compute block would normally occupy.
//
// This revision instantiates ONLY rope_apply (no mac_arrays/vector_unit/etc).
// The full layer compute path requires hardening the much larger transformer_
// layer_wrapper which has 561K cells and hangs OpenROAD repair_design at 1+ hr.
// Pragmatic scope: prove the cascade timing/floorplan with the rotate datapath
// alone. Future revision can expand to include per-layer compute when
// repair_design throughput improves or hierarchical synth is wired up.
//
// Cascade interface (47 ports — v11 added phase signals) is identical to what
// the full wrapper exposes, so chip-level integration is forward-compatible.
//
// v11 (256-bit phased cascade): forward_cos/sin and read_cos/sin_forwarded use
// 256-bit data + 2-bit phase, delivered over 4 cycles. Drops boundary pin count
// from 4290 → ~1230 to fit chip-level routing channel capacity.

module transformer_layer_block (
  input  wire           clk,
  input  wire           rst,
  input  wire [   2:0]  stall_rate_in,
  input  wire           stall_rate_valid_in,
  // Cascade input from upstream (rope_gen for L0, prior layer's read_*_forwarded for L>0)
  // v11: 256-bit phased cascade — producer asserts phase 0,1,2,3 over 4 cycles.
  input  wire           ra_forward_cos_valid_in,
  input  wire [   1:0]  ra_forward_cos_phase_in,
  input  wire [ 255:0]  ra_forward_cos_v_in,
  input  wire           ra_forward_cos_rden_in,
  input  wire           ra_forward_sin_valid_in,
  input  wire [   1:0]  ra_forward_sin_phase_in,
  input  wire [ 255:0]  ra_forward_sin_v_in,
  input  wire           ra_forward_sin_rden_in,
  // Cascade output to downstream layer's forward_*
  input  wire           ra_read_cos_forwarded_valid_in,
  input  wire [   1:0]  ra_read_cos_forwarded_phase_in,
  input  wire           ra_read_cos_forwarded_rden_in,
  input  wire           ra_read_sin_forwarded_valid_in,
  input  wire [   1:0]  ra_read_sin_forwarded_phase_in,
  input  wire           ra_read_sin_forwarded_rden_in,
  // BF16 rotate API (testbench-driven)
  input  wire           ra_rotate_even_valid_in,
  input  wire [  15:0]  ra_rotate_even_x_even_in,
  input  wire [  15:0]  ra_rotate_even_x_odd_in,
  input  wire [  15:0]  ra_rotate_even_cos_val_in,
  input  wire [  15:0]  ra_rotate_even_sin_val_in,
  input  wire           ra_rotate_even_rden_in,
  input  wire           ra_rotate_odd_valid_in,
  input  wire [  15:0]  ra_rotate_odd_x_even_in,
  input  wire [  15:0]  ra_rotate_odd_x_odd_in,
  input  wire [  15:0]  ra_rotate_odd_cos_val_in,
  input  wire [  15:0]  ra_rotate_odd_sin_val_in,
  input  wire           ra_rotate_odd_rden_in,
  output wire           ra_rst_and_startup_done_out,
  output wire           ra_forward_cos_rdy_out,
  output wire           ra_forward_cos_empty_out,
  output wire           ra_forward_sin_rdy_out,
  output wire           ra_forward_sin_empty_out,
  output wire           ra_read_cos_forwarded_rdy_out,
  output wire           ra_read_cos_forwarded_empty_out,
  output wire [ 255:0]  ra_read_cos_forwarded_result_out,
  output wire           ra_read_sin_forwarded_rdy_out,
  output wire           ra_read_sin_forwarded_empty_out,
  output wire [ 255:0]  ra_read_sin_forwarded_result_out,
  output wire           ra_rotate_even_rdy_out,
  output wire           ra_rotate_even_empty_out,
  output wire [  15:0]  ra_rotate_even_result_out,
  output wire           ra_rotate_odd_rdy_out,
  output wire           ra_rotate_odd_empty_out,
  output wire [  15:0]  ra_rotate_odd_result_out
);

  rope_apply u_l_rope (
    .clk                              (clk),
    .rst                              (rst),
    .forward_cos_valid_in             (ra_forward_cos_valid_in),
    .forward_cos_phase_in             (ra_forward_cos_phase_in),
    .forward_cos_v_in                 (ra_forward_cos_v_in),
    .forward_cos_rden_in              (ra_forward_cos_rden_in),
    .forward_sin_valid_in             (ra_forward_sin_valid_in),
    .forward_sin_phase_in             (ra_forward_sin_phase_in),
    .forward_sin_v_in                 (ra_forward_sin_v_in),
    .forward_sin_rden_in              (ra_forward_sin_rden_in),
    .read_cos_forwarded_valid_in      (ra_read_cos_forwarded_valid_in),
    .read_cos_forwarded_phase_in      (ra_read_cos_forwarded_phase_in),
    .read_cos_forwarded_rden_in       (ra_read_cos_forwarded_rden_in),
    .read_sin_forwarded_valid_in      (ra_read_sin_forwarded_valid_in),
    .read_sin_forwarded_phase_in      (ra_read_sin_forwarded_phase_in),
    .read_sin_forwarded_rden_in       (ra_read_sin_forwarded_rden_in),
    .rotate_even_valid_in             (ra_rotate_even_valid_in),
    .rotate_even_x_even_in            (ra_rotate_even_x_even_in),
    .rotate_even_x_odd_in             (ra_rotate_even_x_odd_in),
    .rotate_even_cos_val_in           (ra_rotate_even_cos_val_in),
    .rotate_even_sin_val_in           (ra_rotate_even_sin_val_in),
    .rotate_even_rden_in              (ra_rotate_even_rden_in),
    .rotate_odd_valid_in              (ra_rotate_odd_valid_in),
    .rotate_odd_x_even_in             (ra_rotate_odd_x_even_in),
    .rotate_odd_x_odd_in              (ra_rotate_odd_x_odd_in),
    .rotate_odd_cos_val_in            (ra_rotate_odd_cos_val_in),
    .rotate_odd_sin_val_in            (ra_rotate_odd_sin_val_in),
    .rotate_odd_rden_in               (ra_rotate_odd_rden_in),
    .stall_rate_in                    (stall_rate_in),
    .stall_rate_valid_in              (stall_rate_valid_in),
    .rst_and_startup_done_out         (ra_rst_and_startup_done_out),
    .forward_cos_rdy_out              (ra_forward_cos_rdy_out),
    .forward_cos_empty_out            (ra_forward_cos_empty_out),
    .forward_sin_rdy_out              (ra_forward_sin_rdy_out),
    .forward_sin_empty_out            (ra_forward_sin_empty_out),
    .read_cos_forwarded_rdy_out       (ra_read_cos_forwarded_rdy_out),
    .read_cos_forwarded_empty_out     (ra_read_cos_forwarded_empty_out),
    .read_cos_forwarded_result_out    (ra_read_cos_forwarded_result_out),
    .read_sin_forwarded_rdy_out       (ra_read_sin_forwarded_rdy_out),
    .read_sin_forwarded_empty_out     (ra_read_sin_forwarded_empty_out),
    .read_sin_forwarded_result_out    (ra_read_sin_forwarded_result_out),
    .rotate_even_rdy_out              (ra_rotate_even_rdy_out),
    .rotate_even_empty_out            (ra_rotate_even_empty_out),
    .rotate_even_result_out           (ra_rotate_even_result_out),
    .rotate_odd_rdy_out               (ra_rotate_odd_rdy_out),
    .rotate_odd_empty_out             (ra_rotate_odd_empty_out),
    .rotate_odd_result_out            (ra_rotate_odd_result_out),
    .stall_rate_supported_out         ()
  );

endmodule
