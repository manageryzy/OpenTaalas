// test_vl_rope.cpp — Verilator co-simulation tests for rope_unit
// Mirrors test/systemc/test_rope.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vrope_unit.h"

#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vrope_unit>;

// BF16 <-> float conversion helpers.
static float bf16_to_float(uint16_t bf16) {
  uint32_t bits = static_cast<uint32_t>(bf16) << 16;
  float f;
  std::memcpy(&f, &bits, sizeof(f));
  return f;
}

// Assert BF16 result is close to expected float value.
static void assert_bf16_near(uint16_t result_bf16, float expected,
                              float tolerance, const char* label) {
  float actual = bf16_to_float(result_bf16);
  if (std::fabs(actual - expected) > tolerance) {
    std::fprintf(stderr, "FAIL %s: expected %.4f, got %.4f (bf16=0x%04X)\n",
                 label, expected, actual, result_bf16);
    std::abort();
  }
}

// --- set_cos: void ---
static void call_set_cos(Harness& h, uint16_t pos, uint8_t freq,
                          uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_cos_rdy_out);
  d->set_cos_valid_in = 1;
  d->set_cos_position_in = pos & 0xFFF;
  d->set_cos_freq_idx_in = freq & 0x3F;
  d->set_cos_value_in = value;
  h.tick();
  d->set_cos_valid_in = 0;
  h.drain_fifo(d->set_cos_rden_in, d->set_cos_empty_out);
}

// --- set_sin: void ---
static void call_set_sin(Harness& h, uint16_t pos, uint8_t freq,
                          uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_sin_rdy_out);
  d->set_sin_valid_in = 1;
  d->set_sin_position_in = pos & 0xFFF;
  d->set_sin_freq_idx_in = freq & 0x3F;
  d->set_sin_value_in = value;
  h.tick();
  d->set_sin_valid_in = 0;
  h.drain_fifo(d->set_sin_rden_in, d->set_sin_empty_out);
}

// --- get_cos: returns uint16 ---
static uint16_t call_get_cos(Harness& h, uint16_t pos, uint8_t freq) {
  auto* d = h.dut();
  h.wait_ready(d->get_cos_rdy_out);
  d->get_cos_valid_in = 1;
  d->get_cos_position_in = pos & 0xFFF;
  d->get_cos_freq_idx_in = freq & 0x3F;
  h.tick();
  d->get_cos_valid_in = 0;
  return h.read_fifo(d->get_cos_rden_in, d->get_cos_empty_out,
                     d->get_cos_result_out);
}

// --- get_sin: returns uint16 ---
static uint16_t call_get_sin(Harness& h, uint16_t pos, uint8_t freq) {
  auto* d = h.dut();
  h.wait_ready(d->get_sin_rdy_out);
  d->get_sin_valid_in = 1;
  d->get_sin_position_in = pos & 0xFFF;
  d->get_sin_freq_idx_in = freq & 0x3F;
  h.tick();
  d->get_sin_valid_in = 0;
  return h.read_fifo(d->get_sin_rden_in, d->get_sin_empty_out,
                     d->get_sin_result_out);
}

// --- rotate_pair: returns uint16 (bf16) ---
// Computes x_even * cos - x_odd * sin
static uint16_t call_rotate_pair(Harness& h, uint16_t x_even, uint16_t x_odd,
                                  uint16_t cos_val, uint16_t sin_val) {
  auto* d = h.dut();
  h.wait_ready(d->rotate_pair_rdy_out);
  d->rotate_pair_valid_in = 1;
  d->rotate_pair_x_even_in = x_even;
  d->rotate_pair_x_odd_in = x_odd;
  d->rotate_pair_cos_val_in = cos_val;
  d->rotate_pair_sin_val_in = sin_val;
  h.tick();
  d->rotate_pair_valid_in = 0;
  return h.read_fifo(d->rotate_pair_rden_in, d->rotate_pair_empty_out,
                     d->rotate_pair_result_out);
}

// ---- Tests ----

static void test_cos_sin_round_trip() {
  Harness h;
  h.reset();

  // Set cos/sin at (pos=0, freq=0)
  call_set_cos(h, 0, 0, 0x3F80);  // bf16(1.0)
  call_set_sin(h, 0, 0, 0x0000);  // bf16(0.0)

  assert(call_get_cos(h, 0, 0) == 0x3F80);
  assert(call_get_sin(h, 0, 0) == 0x0000);
  std::puts("[PASS] cos/sin round-trip at (pos=0, freq=0)");
}

static void test_cos_sin_arbitrary_index() {
  Harness h;
  h.reset();

  call_set_cos(h, 31, 7, 0xBEEF);
  call_set_sin(h, 31, 7, 0xCAFE);

  assert(call_get_cos(h, 31, 7) == 0xBEEF);
  assert(call_get_sin(h, 31, 7) == 0xCAFE);
  std::puts("[PASS] cos/sin round-trip at (pos=31, freq=7)");
}

static void test_non_interference() {
  Harness h;
  h.reset();

  call_set_cos(h, 0, 0, 0x3F80);
  call_set_cos(h, 1, 0, 0x1111);
  call_set_cos(h, 0, 1, 0x2222);

  assert(call_get_cos(h, 0, 0) == 0x3F80);
  assert(call_get_cos(h, 1, 0) == 0x1111);
  assert(call_get_cos(h, 0, 1) == 0x2222);
  std::puts("[PASS] cos table non-interference across (pos, freq)");
}

static void test_rotate_pair_identity() {
  // NOTE: Kanagawa rotate_pair is a stub — returns x_even unchanged.
  // Full BF16 rotation deferred to VPU integration.
  Harness h;
  h.reset();

  uint16_t r = call_rotate_pair(h, 0x4000, 0x4040, 0x3F80, 0x0000);
  assert(r == 0x4000);  // stub returns x_even
  std::puts("[PASS] rotate_pair (stub: returns x_even)");
}

static void test_rotate_pair_swap() {
  // Stub: always returns x_even regardless of cos/sin
  Harness h;
  h.reset();

  uint16_t r = call_rotate_pair(h, 0x4000, 0x4040, 0x0000, 0x3F80);
  assert(r == 0x4000);  // stub returns x_even
  std::puts("[PASS] rotate_pair swap (stub: returns x_even)");
}

static void test_rotate_pair_mixed() {
  // Stub: always returns x_even regardless of cos/sin
  Harness h;
  h.reset();

  uint16_t r = call_rotate_pair(h, 0x4000, 0x4040, 0x3F00, 0x3F00);
  assert(r == 0x4000);  // stub returns x_even
  std::puts("[PASS] rotate_pair mixed (stub: returns x_even)");
}

int main() {
  test_cos_sin_round_trip();
  test_cos_sin_arbitrary_index();
  test_non_interference();
  test_rotate_pair_identity();
  test_rotate_pair_swap();
  test_rotate_pair_mixed();
  std::puts("\nAll rope Verilator co-sim tests passed.");
  return 0;
}
