// test_vl_lm_head.cpp — Verilator co-simulation tests for lm_head
// Mirrors test/systemc/test_lm_head.cpp against the Kanagawa-generated RTL.
//
// lm_head stores 3-bit weights indexed by (output_idx, dim_idx), provides
// gamma/rsqrt_lut configuration, and tracks argmax over FP32 scores.

#include "kanagawa_harness.h"
#include "Vlm_head.h"

#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vlm_head>;

// ---------------------------------------------------------------------------
// FP32 bit conversion
// ---------------------------------------------------------------------------

static uint32_t float_to_bits(float f) {
  uint32_t b;
  std::memcpy(&b, &f, 4);
  return b;
}

// ---------------------------------------------------------------------------
// Method wrappers
// ---------------------------------------------------------------------------

// --- write_weight: output_idx_in[16:0], dim_idx_in[11:0], value_in[2:0] → void
static void call_write_weight(Harness& h, uint32_t output_idx,
                              uint16_t dim_idx, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->write_weight_rdy_out);
  d->write_weight_valid_in = 1;
  d->write_weight_output_idx_in = output_idx;
  d->write_weight_dim_idx_in = dim_idx;
  d->write_weight_value_in = value & 0x7;
  h.tick();
  d->write_weight_valid_in = 0;
  h.drain_fifo(d->write_weight_rden_in, d->write_weight_empty_out);
}

// --- read_weight: output_idx_in[16:0], dim_idx_in[11:0] → result_out[2:0]
static uint8_t call_read_weight(Harness& h, uint32_t output_idx,
                                uint16_t dim_idx) {
  auto* d = h.dut();
  h.wait_ready(d->read_weight_rdy_out);
  d->read_weight_valid_in = 1;
  d->read_weight_output_idx_in = output_idx;
  d->read_weight_dim_idx_in = dim_idx;
  h.tick();
  d->read_weight_valid_in = 0;
  return h.read_fifo(d->read_weight_rden_in, d->read_weight_empty_out,
                     d->read_weight_result_out);
}

// --- set_gamma: index_in[15:0], value_in[15:0] → void
static void call_set_gamma(Harness& h, uint16_t index, uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_gamma_rdy_out);
  d->set_gamma_valid_in = 1;
  d->set_gamma_index_in = index;
  d->set_gamma_value_in = value;
  h.tick();
  d->set_gamma_valid_in = 0;
  h.drain_fifo(d->set_gamma_rden_in, d->set_gamma_empty_out);
}

// --- get_gamma: index_in[15:0] → result_out[15:0]
static uint16_t call_get_gamma(Harness& h, uint16_t index) {
  auto* d = h.dut();
  h.wait_ready(d->get_gamma_rdy_out);
  d->get_gamma_valid_in = 1;
  d->get_gamma_index_in = index;
  h.tick();
  d->get_gamma_valid_in = 0;
  return h.read_fifo(d->get_gamma_rden_in, d->get_gamma_empty_out,
                     d->get_gamma_result_out);
}

// --- set_rsqrt_lut: index_in[7:0], value_in[15:0] → void
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

// --- set_bank_scale: value_in[7:0] → void
static void call_set_bank_scale(Harness& h, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_bank_scale_rdy_out);
  d->set_bank_scale_valid_in = 1;
  d->set_bank_scale_value_in = value;
  h.tick();
  d->set_bank_scale_valid_in = 0;
  h.drain_fifo(d->set_bank_scale_rden_in, d->set_bank_scale_empty_out);
}

// --- set_tensor_scale: value_in[31:0] → void
static void call_set_tensor_scale(Harness& h, uint32_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_tensor_scale_rdy_out);
  d->set_tensor_scale_valid_in = 1;
  d->set_tensor_scale_value_in = value;
  h.tick();
  d->set_tensor_scale_valid_in = 0;
  h.drain_fifo(d->set_tensor_scale_rden_in, d->set_tensor_scale_empty_out);
}

// --- update_argmax: token_idx_in[16:0], score_in[31:0] → void
static void call_update_argmax(Harness& h, uint32_t token_idx, float score) {
  auto* d = h.dut();
  h.wait_ready(d->update_argmax_rdy_out);
  d->update_argmax_valid_in = 1;
  d->update_argmax_token_idx_in = token_idx;
  d->update_argmax_score_in = float_to_bits(score);
  h.tick();
  d->update_argmax_valid_in = 0;
  h.drain_fifo(d->update_argmax_rden_in, d->update_argmax_empty_out);
}

// --- get_best_token: → result_out[16:0]
static uint32_t call_get_best_token(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_best_token_rdy_out);
  d->get_best_token_valid_in = 1;
  h.tick();
  d->get_best_token_valid_in = 0;
  return h.read_fifo(d->get_best_token_rden_in, d->get_best_token_empty_out,
                     d->get_best_token_result_out);
}

// --- reset_argmax: → void
static void call_reset_argmax(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->reset_argmax_rdy_out);
  d->reset_argmax_valid_in = 1;
  h.tick();
  d->reset_argmax_valid_in = 0;
  h.drain_fifo(d->reset_argmax_rden_in, d->reset_argmax_empty_out);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

static void test_weight_write_read() {
  Harness h;
  h.reset();

  call_write_weight(h, 10, 5, 3);
  assert(call_read_weight(h, 10, 5) == 3);

  // Unwritten location should read 0
  assert(call_read_weight(h, 10, 6) == 0);

  std::puts("[PASS] weight_write_read: write(10,5,3)=3, read(10,6)=0");
}

static void test_gamma_write_read() {
  Harness h;
  h.reset();

  call_set_gamma(h, 0, 0x3F80);
  call_set_gamma(h, 31, 0x4000);

  assert(call_get_gamma(h, 0) == 0x3F80);
  assert(call_get_gamma(h, 31) == 0x4000);

  std::puts("[PASS] gamma_write_read: set(0,0x3F80), set(31,0x4000)");
}

static void test_argmax_increasing() {
  Harness h;
  h.reset();

  call_update_argmax(h, 10, 1.0f);
  call_update_argmax(h, 20, 2.0f);
  call_update_argmax(h, 30, 3.0f);

  assert(call_get_best_token(h) == 30);

  std::puts("[PASS] argmax_increasing: 1.0<2.0<3.0 → best=30");
}

static void test_argmax_decreasing() {
  Harness h;
  h.reset();

  call_update_argmax(h, 5, 5.0f);
  call_update_argmax(h, 6, 4.0f);
  call_update_argmax(h, 7, 3.0f);

  assert(call_get_best_token(h) == 5);

  std::puts("[PASS] argmax_decreasing: 5.0>4.0>3.0 → best=5");
}

static void test_argmax_reset() {
  Harness h;
  h.reset();

  call_update_argmax(h, 42, 999.0f);
  assert(call_get_best_token(h) == 42);

  call_reset_argmax(h);

  // After reset, any score (even negative) should become the new best
  call_update_argmax(h, 1, -100.0f);
  assert(call_get_best_token(h) == 1);

  std::puts("[PASS] argmax_reset: 42→reset→1 with -100.0");
}

int main() {
  test_weight_write_read();
  test_gamma_write_read();
  test_argmax_increasing();
  test_argmax_decreasing();
  test_argmax_reset();
  std::puts("\nAll lm_head Verilator co-sim tests passed.");
  return 0;
}
