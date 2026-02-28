// test_vl_vector_unit.cpp — Verilator co-simulation tests for vector_unit
// Mirrors test/systemc/test_vector_unit.cpp against the Kanagawa-generated RTL.
//
// Tests real BF16 arithmetic:
//   - swiglu_compute: sigmoid_lut[gate>>8] * gate * up
//   - residual_add: BF16 add(a, b)

#include "kanagawa_harness.h"
#include "Vvector_unit.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vvector_unit>;

// ---------------------------------------------------------------------------
// Method wrappers — Kanagawa valid/rdy/rden/empty protocol
// ---------------------------------------------------------------------------

// --- rmsnorm_accumulate: x_bf16_in[15:0] → void ---
static void call_rmsnorm_accumulate(Harness& h, uint16_t x_bf16) {
  auto* d = h.dut();
  h.wait_ready(d->rmsnorm_accumulate_rdy_out);
  d->rmsnorm_accumulate_valid_in = 1;
  d->rmsnorm_accumulate_x_bf16_in = x_bf16;
  h.tick();
  d->rmsnorm_accumulate_valid_in = 0;
  h.drain_fifo(d->rmsnorm_accumulate_rden_in, d->rmsnorm_accumulate_empty_out);
}

// --- rmsnorm_get_sum: → result_out[31:0] ---
static uint32_t call_rmsnorm_get_sum(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->rmsnorm_get_sum_rdy_out);
  d->rmsnorm_get_sum_valid_in = 1;
  h.tick();
  d->rmsnorm_get_sum_valid_in = 0;
  return h.read_fifo(d->rmsnorm_get_sum_rden_in, d->rmsnorm_get_sum_empty_out,
                     d->rmsnorm_get_sum_result_out);
}

// --- rmsnorm_reset: → void ---
static void call_rmsnorm_reset(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->rmsnorm_reset_rdy_out);
  d->rmsnorm_reset_valid_in = 1;
  h.tick();
  d->rmsnorm_reset_valid_in = 0;
  h.drain_fifo(d->rmsnorm_reset_rden_in, d->rmsnorm_reset_empty_out);
}

// --- set_gamma_pre_attn: index_in[15:0], value_in[15:0] → void ---
static void call_set_gamma_pre_attn(Harness& h, uint16_t index,
                                     uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_gamma_pre_attn_rdy_out);
  d->set_gamma_pre_attn_valid_in = 1;
  d->set_gamma_pre_attn_index_in = index;
  d->set_gamma_pre_attn_value_in = value;
  h.tick();
  d->set_gamma_pre_attn_valid_in = 0;
  h.drain_fifo(d->set_gamma_pre_attn_rden_in,
               d->set_gamma_pre_attn_empty_out);
}

// --- get_gamma_pre_attn: index_in[15:0] → result_out[15:0] ---
static uint16_t call_get_gamma_pre_attn(Harness& h, uint16_t index) {
  auto* d = h.dut();
  h.wait_ready(d->get_gamma_pre_attn_rdy_out);
  d->get_gamma_pre_attn_valid_in = 1;
  d->get_gamma_pre_attn_index_in = index;
  h.tick();
  d->get_gamma_pre_attn_valid_in = 0;
  return h.read_fifo(d->get_gamma_pre_attn_rden_in,
                     d->get_gamma_pre_attn_empty_out,
                     d->get_gamma_pre_attn_result_out);
}

// --- set_gamma_pre_mlp: index_in[15:0], value_in[15:0] → void ---
static void call_set_gamma_pre_mlp(Harness& h, uint16_t index,
                                    uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_gamma_pre_mlp_rdy_out);
  d->set_gamma_pre_mlp_valid_in = 1;
  d->set_gamma_pre_mlp_index_in = index;
  d->set_gamma_pre_mlp_value_in = value;
  h.tick();
  d->set_gamma_pre_mlp_valid_in = 0;
  h.drain_fifo(d->set_gamma_pre_mlp_rden_in,
               d->set_gamma_pre_mlp_empty_out);
}

// --- get_gamma_pre_mlp: index_in[15:0] → result_out[15:0] ---
static uint16_t call_get_gamma_pre_mlp(Harness& h, uint16_t index) {
  auto* d = h.dut();
  h.wait_ready(d->get_gamma_pre_mlp_rdy_out);
  d->get_gamma_pre_mlp_valid_in = 1;
  d->get_gamma_pre_mlp_index_in = index;
  h.tick();
  d->get_gamma_pre_mlp_valid_in = 0;
  return h.read_fifo(d->get_gamma_pre_mlp_rden_in,
                     d->get_gamma_pre_mlp_empty_out,
                     d->get_gamma_pre_mlp_result_out);
}

// --- set_rsqrt_lut: index_in[7:0], value_in[15:0] → void ---
static void call_set_rsqrt_lut(Harness& h, uint8_t index, uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_rsqrt_lut_rdy_out);
  d->set_rsqrt_lut_valid_in = 1;
  d->set_rsqrt_lut_index_in = index;
  d->set_rsqrt_lut_value_in = value;
  h.tick();
  d->set_rsqrt_lut_valid_in = 0;
  h.drain_fifo(d->set_rsqrt_lut_rden_in, d->set_rsqrt_lut_empty_out);
}

// --- lookup_rsqrt: index_in[7:0] → result_out[15:0] ---
static uint16_t call_lookup_rsqrt(Harness& h, uint8_t index) {
  auto* d = h.dut();
  h.wait_ready(d->lookup_rsqrt_rdy_out);
  d->lookup_rsqrt_valid_in = 1;
  d->lookup_rsqrt_index_in = index;
  h.tick();
  d->lookup_rsqrt_valid_in = 0;
  return h.read_fifo(d->lookup_rsqrt_rden_in, d->lookup_rsqrt_empty_out,
                     d->lookup_rsqrt_result_out);
}

// --- rope_set_cos: position_in[11:0], freq_idx_in[5:0], value_in[15:0] → void ---
static void call_rope_set_cos(Harness& h, uint16_t pos, uint8_t freq,
                               uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->rope_set_cos_rdy_out);
  d->rope_set_cos_valid_in = 1;
  d->rope_set_cos_position_in = pos & 0xFFF;
  d->rope_set_cos_freq_idx_in = freq & 0x3F;
  d->rope_set_cos_value_in = value;
  h.tick();
  d->rope_set_cos_valid_in = 0;
  h.drain_fifo(d->rope_set_cos_rden_in, d->rope_set_cos_empty_out);
}

// --- rope_set_sin: position_in[11:0], freq_idx_in[5:0], value_in[15:0] → void ---
static void call_rope_set_sin(Harness& h, uint16_t pos, uint8_t freq,
                               uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->rope_set_sin_rdy_out);
  d->rope_set_sin_valid_in = 1;
  d->rope_set_sin_position_in = pos & 0xFFF;
  d->rope_set_sin_freq_idx_in = freq & 0x3F;
  d->rope_set_sin_value_in = value;
  h.tick();
  d->rope_set_sin_valid_in = 0;
  h.drain_fifo(d->rope_set_sin_rden_in, d->rope_set_sin_empty_out);
}

// --- rope_get_cos: position_in[11:0], freq_idx_in[5:0] → result_out[15:0] ---
static uint16_t call_rope_get_cos(Harness& h, uint16_t pos, uint8_t freq) {
  auto* d = h.dut();
  h.wait_ready(d->rope_get_cos_rdy_out);
  d->rope_get_cos_valid_in = 1;
  d->rope_get_cos_position_in = pos & 0xFFF;
  d->rope_get_cos_freq_idx_in = freq & 0x3F;
  h.tick();
  d->rope_get_cos_valid_in = 0;
  return h.read_fifo(d->rope_get_cos_rden_in, d->rope_get_cos_empty_out,
                     d->rope_get_cos_result_out);
}

// --- rope_get_sin: position_in[11:0], freq_idx_in[5:0] → result_out[15:0] ---
static uint16_t call_rope_get_sin(Harness& h, uint16_t pos, uint8_t freq) {
  auto* d = h.dut();
  h.wait_ready(d->rope_get_sin_rdy_out);
  d->rope_get_sin_valid_in = 1;
  d->rope_get_sin_position_in = pos & 0xFFF;
  d->rope_get_sin_freq_idx_in = freq & 0x3F;
  h.tick();
  d->rope_get_sin_valid_in = 0;
  return h.read_fifo(d->rope_get_sin_rden_in, d->rope_get_sin_empty_out,
                     d->rope_get_sin_result_out);
}

// --- set_sigmoid_lut: index_in[7:0], value_in[15:0] → void ---
static void call_set_sigmoid_lut(Harness& h, uint8_t index, uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_sigmoid_lut_rdy_out);
  d->set_sigmoid_lut_valid_in = 1;
  d->set_sigmoid_lut_index_in = index;
  d->set_sigmoid_lut_value_in = value;
  h.tick();
  d->set_sigmoid_lut_valid_in = 0;
  h.drain_fifo(d->set_sigmoid_lut_rden_in, d->set_sigmoid_lut_empty_out);
}

// --- swiglu_compute: gate_bf16_in[15:0], up_bf16_in[15:0] → result_out[15:0] ---
// STUB: returns gate_bf16 unchanged.
static uint16_t call_swiglu_compute(Harness& h, uint16_t gate_bf16,
                                     uint16_t up_bf16) {
  auto* d = h.dut();
  h.wait_ready(d->swiglu_compute_rdy_out);
  d->swiglu_compute_valid_in = 1;
  d->swiglu_compute_gate_bf16_in = gate_bf16;
  d->swiglu_compute_up_bf16_in = up_bf16;
  h.tick();
  d->swiglu_compute_valid_in = 0;
  return h.read_fifo(d->swiglu_compute_rden_in, d->swiglu_compute_empty_out,
                     d->swiglu_compute_result_out);
}

// --- residual_add: a_bf16_in[15:0], b_bf16_in[15:0] → result_out[15:0] ---
// STUB: returns a_bf16 unchanged.
static uint16_t call_residual_add(Harness& h, uint16_t a_bf16,
                                   uint16_t b_bf16) {
  auto* d = h.dut();
  h.wait_ready(d->residual_add_rdy_out);
  d->residual_add_valid_in = 1;
  d->residual_add_a_bf16_in = a_bf16;
  d->residual_add_b_bf16_in = b_bf16;
  h.tick();
  d->residual_add_valid_in = 0;
  return h.read_fifo(d->residual_add_rden_in, d->residual_add_empty_out,
                     d->residual_add_result_out);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

static void test_rmsnorm() {
  Harness h;
  h.reset();

  // BF16(1.0)=0x3F80, squared=BF16(1.0)=0x3F80
  call_rmsnorm_accumulate(h, 0x3F80);
  // BF16(2.0)=0x4000, squared=BF16(4.0)=0x4080
  call_rmsnorm_accumulate(h, 0x4000);
  // BF16(0.5)=0x3F00, squared=BF16(0.25)=0x3E80
  call_rmsnorm_accumulate(h, 0x3F00);
  // sum = 0x3F80 + 0x4080 + 0x3E80 = 0xBE80
  assert(call_rmsnorm_get_sum(h) == 0x3F80 + 0x4080 + 0x3E80);

  call_rmsnorm_reset(h);
  assert(call_rmsnorm_get_sum(h) == 0);

  // BF16(3.0)=0x4040, squared=BF16(9.0)=0x4110
  call_rmsnorm_accumulate(h, 0x4040);
  assert(call_rmsnorm_get_sum(h) == 0x4110);

  std::puts("[PASS] rmsnorm: BF16 squaring, accumulate, reset");
}

static void test_gamma_pre_attn() {
  Harness h;
  h.reset();

  call_set_gamma_pre_attn(h, 0, 0xABCD);
  call_set_gamma_pre_attn(h, 4095, 0x1234);

  assert(call_get_gamma_pre_attn(h, 0) == 0xABCD);
  assert(call_get_gamma_pre_attn(h, 4095) == 0x1234);

  // Overwrite index 0
  call_set_gamma_pre_attn(h, 0, 0x5678);
  assert(call_get_gamma_pre_attn(h, 0) == 0x5678);

  std::puts("[PASS] gamma_pre_attn: set/get at 0 and 4095, overwrite");
}

static void test_gamma_pre_mlp() {
  Harness h;
  h.reset();

  call_set_gamma_pre_mlp(h, 100, 0xBEEF);
  assert(call_get_gamma_pre_mlp(h, 100) == 0xBEEF);

  // Overwrite
  call_set_gamma_pre_mlp(h, 100, 0xCAFE);
  assert(call_get_gamma_pre_mlp(h, 100) == 0xCAFE);

  std::puts("[PASS] gamma_pre_mlp: set/get at 100, overwrite");
}

static void test_rsqrt_lut() {
  Harness h;
  h.reset();

  call_set_rsqrt_lut(h, 0, 0x3F80);
  call_set_rsqrt_lut(h, 255, 0x0001);

  assert(call_lookup_rsqrt(h, 0) == 0x3F80);
  assert(call_lookup_rsqrt(h, 255) == 0x0001);

  std::puts("[PASS] rsqrt_lut: set/lookup at 0 and 255");
}

static void test_rope_tables() {
  Harness h;
  h.reset();

  call_rope_set_cos(h, 0, 0, 0x3C00);
  call_rope_set_sin(h, 0, 0, 0x0000);
  call_rope_set_cos(h, 31, 63, 0x1111);
  call_rope_set_sin(h, 31, 63, 0x2222);

  assert(call_rope_get_cos(h, 0, 0) == 0x3C00);
  assert(call_rope_get_sin(h, 0, 0) == 0x0000);
  assert(call_rope_get_cos(h, 31, 63) == 0x1111);
  assert(call_rope_get_sin(h, 31, 63) == 0x2222);

  // Overwrite
  call_rope_set_cos(h, 0, 0, 0xFFFF);
  assert(call_rope_get_cos(h, 0, 0) == 0xFFFF);

  std::puts("[PASS] rope_tables: set/get cos+sin at (0,0) and (31,63), overwrite");
}

static void test_swiglu() {
  Harness h;
  h.reset();

  // Fill sigmoid LUT with 0x3F00 (BF16 0.5) — sigmoid(x) = 0.5 for all x
  for (int i = 0; i < 256; ++i)
    call_set_sigmoid_lut(h, static_cast<uint8_t>(i), 0x3F00);

  // swiglu(gate, up) = gate * sigmoid(gate) * up = gate * 0.5 * up
  // gate=2.0(0x4000), up=3.0(0x4040): 2.0*0.5*3.0 = 3.0 = 0x4040
  uint16_t r1 = call_swiglu_compute(h, 0x4000, 0x4040);
  assert(r1 == 0x4040);

  // gate=4.0(0x4080), up=0.5(0x3F00): 4.0*0.5*0.5 = 1.0 = 0x3F80
  uint16_t r2 = call_swiglu_compute(h, 0x4080, 0x3F00);
  assert(r2 == 0x3F80);

  std::puts("[PASS] swiglu_compute (real: gate*sigmoid*up)");
}

static void test_residual_add() {
  Harness h;
  h.reset();

  // add(1.0, 2.0) = 3.0: 0x3F80 + 0x4000 = 0x4040
  uint16_t r1 = call_residual_add(h, 0x3F80, 0x4000);
  assert(r1 == 0x4040);

  // add(4.0, 0.5) = 4.5: 0x4080 + 0x3F00 = 0x4090
  uint16_t r2 = call_residual_add(h, 0x4080, 0x3F00);
  assert(r2 == 0x4090);

  // add(0.0, x) = x: zero exponent returns b_bf16
  uint16_t r3 = call_residual_add(h, 0x0000, 0xBEEF);
  assert(r3 == 0xBEEF);

  std::puts("[PASS] residual_add (real: BF16 add)");
}

int main() {
  test_rmsnorm();
  test_gamma_pre_attn();
  test_gamma_pre_mlp();
  test_rsqrt_lut();
  test_rope_tables();
  test_swiglu();
  test_residual_add();
  std::puts("\nAll vector_unit Verilator co-sim tests passed.");
  return 0;
}
