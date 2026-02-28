// test_vl_rmsnorm.cpp — Verilator co-simulation tests for rmsnorm_unit
// Mirrors test/systemc/test_rmsnorm.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vrmsnorm_unit.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vrmsnorm_unit>;

// --- accumulate_sq: void ---
static void call_accumulate_sq(Harness& h, uint16_t x_bf16) {
  auto* d = h.dut();
  h.wait_ready(d->accumulate_sq_rdy_out);
  d->accumulate_sq_valid_in = 1;
  d->accumulate_sq_x_bf16_in = x_bf16;
  h.tick();
  d->accumulate_sq_valid_in = 0;
  h.drain_fifo(d->accumulate_sq_rden_in, d->accumulate_sq_empty_out);
}

// --- get_sum_sq: returns uint32 ---
static uint32_t call_get_sum_sq(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_sum_sq_rdy_out);
  d->get_sum_sq_valid_in = 1;
  h.tick();
  d->get_sum_sq_valid_in = 0;
  return h.read_fifo(d->get_sum_sq_rden_in, d->get_sum_sq_empty_out,
                     d->get_sum_sq_result_out);
}

// --- reset_accum: void ---
static void call_reset_accum(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->reset_accum_rdy_out);
  d->reset_accum_valid_in = 1;
  h.tick();
  d->reset_accum_valid_in = 0;
  h.drain_fifo(d->reset_accum_rden_in, d->reset_accum_empty_out);
}

// --- set_gamma: void ---
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

// --- get_gamma: returns uint16 ---
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

// --- set_rsqrt_lut: void ---
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

// --- lookup_rsqrt: returns uint16 ---
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

// ---- Tests ----

static void test_accumulate_and_read() {
  Harness h;
  h.reset();

  // BF16(1.0)=0x3F80, squared=BF16(1.0)=0x3F80
  call_accumulate_sq(h, 0x3F80);
  assert(call_get_sum_sq(h) == 0x3F80);

  // BF16(2.0)=0x4000, squared=BF16(4.0)=0x4080
  call_accumulate_sq(h, 0x4000);
  assert(call_get_sum_sq(h) == 0x3F80 + 0x4080);

  // BF16(0.5)=0x3F00, squared=BF16(0.25)=0x3E80
  call_accumulate_sq(h, 0x3F00);
  assert(call_get_sum_sq(h) == 0x3F80 + 0x4080 + 0x3E80);
  std::puts("[PASS] accumulate_sq: BF16 1.0+2.0+0.5 squared and summed");
}

static void test_reset_accum() {
  Harness h;
  h.reset();

  call_accumulate_sq(h, 0x3F80);
  call_accumulate_sq(h, 0x4000);
  call_accumulate_sq(h, 0x3F00);
  assert(call_get_sum_sq(h) == 0x3F80 + 0x4080 + 0x3E80);

  call_reset_accum(h);
  assert(call_get_sum_sq(h) == 0);

  // BF16(3.0)=0x4040, squared=BF16(9.0)=0x4110
  call_accumulate_sq(h, 0x4040);
  assert(call_get_sum_sq(h) == 0x4110);
  std::puts("[PASS] reset_accum: sum -> 0, then 3.0^2 = 0x4110");
}

static void test_gamma_round_trip() {
  Harness h;
  h.reset();

  call_set_gamma(h, 0, 0xBEEF);
  call_set_gamma(h, 4095, 0xCAFE);

  assert(call_get_gamma(h, 0) == 0xBEEF);
  assert(call_get_gamma(h, 4095) == 0xCAFE);
  std::puts("[PASS] gamma round-trip: index 0 and 4095");
}

static void test_rsqrt_lut_round_trip() {
  Harness h;
  h.reset();

  call_set_rsqrt_lut(h, 0, 0x1234);
  call_set_rsqrt_lut(h, 255, 0x5678);

  assert(call_lookup_rsqrt(h, 0) == 0x1234);
  assert(call_lookup_rsqrt(h, 255) == 0x5678);
  std::puts("[PASS] rsqrt_lut round-trip: index 0 and 255");
}

int main() {
  test_accumulate_and_read();
  test_reset_accum();
  test_gamma_round_trip();
  test_rsqrt_lut_round_trip();
  std::puts("\nAll rmsnorm Verilator co-sim tests passed.");
  return 0;
}
