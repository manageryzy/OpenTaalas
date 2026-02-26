// test_vl_mac_array.cpp — Verilator co-simulation tests for mac_array
// Mirrors test/systemc/test_mac_array.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vmac_array.h"

#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vmac_array>;

static int32_t sext24(uint32_t val) {
  if (val & 0x800000) return (int32_t)(val | 0xFF000000u);
  return (int32_t)val;
}

static float bits_to_float(uint32_t bits) {
  float f;
  std::memcpy(&f, &bits, sizeof(f));
  return f;
}

static uint32_t float_to_bits(float f) {
  uint32_t bits;
  std::memcpy(&bits, &f, sizeof(bits));
  return bits;
}

// --- Method helpers ---

static int32_t call_mac_step(Harness& h, uint8_t pe_id, uint8_t mag,
                              uint8_t sign, int8_t act) {
  auto* d = h.dut();
  h.wait_ready(d->mac_step_rdy_out);
  d->mac_step_pe_id_in = pe_id;
  d->mac_step_magnitude_in = mag;
  d->mac_step_sign_bit_in = sign;
  d->mac_step_activation_in = (uint8_t)act;
  d->mac_step_valid_in = 1;
  h.tick();
  d->mac_step_valid_in = 0;
  return sext24(h.read_fifo(d->mac_step_rden_in, d->mac_step_empty_out,
                             d->mac_step_result_out));
}

static int32_t call_read_accum(Harness& h, uint8_t pe_id) {
  auto* d = h.dut();
  h.wait_ready(d->read_accum_rdy_out);
  d->read_accum_pe_id_in = pe_id;
  d->read_accum_valid_in = 1;
  h.tick();
  d->read_accum_valid_in = 0;
  return sext24(h.read_fifo(d->read_accum_rden_in, d->read_accum_empty_out,
                             d->read_accum_result_out));
}

static void call_clear_pe(Harness& h, uint8_t pe_id) {
  auto* d = h.dut();
  h.wait_ready(d->clear_pe_rdy_out);
  d->clear_pe_pe_id_in = pe_id;
  d->clear_pe_valid_in = 1;
  h.tick();
  d->clear_pe_valid_in = 0;
  h.drain_fifo(d->clear_pe_rden_in, d->clear_pe_empty_out);
}

static void call_clear_all(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->clear_all_rdy_out);
  d->clear_all_valid_in = 1;
  h.tick();
  d->clear_all_valid_in = 0;
  h.drain_fifo(d->clear_all_rden_in, d->clear_all_empty_out);
}

static void call_set_fp32_accum(Harness& h, uint8_t pe_id, float val) {
  auto* d = h.dut();
  h.wait_ready(d->set_fp32_accum_rdy_out);
  d->set_fp32_accum_pe_id_in = pe_id;
  d->set_fp32_accum_value_in = float_to_bits(val);
  d->set_fp32_accum_valid_in = 1;
  h.tick();
  d->set_fp32_accum_valid_in = 0;
  h.drain_fifo(d->set_fp32_accum_rden_in, d->set_fp32_accum_empty_out);
}

static float call_read_fp32_accum(Harness& h, uint8_t pe_id) {
  auto* d = h.dut();
  h.wait_ready(d->read_fp32_accum_rdy_out);
  d->read_fp32_accum_pe_id_in = pe_id;
  d->read_fp32_accum_valid_in = 1;
  h.tick();
  d->read_fp32_accum_valid_in = 0;
  return bits_to_float(h.read_fifo(d->read_fp32_accum_rden_in,
                                    d->read_fp32_accum_empty_out,
                                    d->read_fp32_accum_result_out));
}

static void call_clear_fp32(Harness& h, uint8_t pe_id) {
  auto* d = h.dut();
  h.wait_ready(d->clear_fp32_rdy_out);
  d->clear_fp32_pe_id_in = pe_id;
  d->clear_fp32_valid_in = 1;
  h.tick();
  d->clear_fp32_valid_in = 0;
  h.drain_fifo(d->clear_fp32_rden_in, d->clear_fp32_empty_out);
}

// --- Tests ---

static void test_single_mac() {
  Harness h;
  h.reset();
  call_mac_step(h, 0, 3, 0, 10);
  assert(call_read_accum(h, 0) == 30);
  std::puts("[PASS] single MAC step");
}

static void test_independent_pes() {
  Harness h;
  h.reset();
  call_mac_step(h, 0, 1, 0, 10);   // PE0: +10
  call_mac_step(h, 1, 5, 0, 3);    // PE1: +15
  call_mac_step(h, 2, 7, 1, 2);    // PE2: -14
  call_mac_step(h, 3, 15, 0, 1);   // PE3: +15
  assert(call_read_accum(h, 0) == 10);
  assert(call_read_accum(h, 1) == 15);
  assert(call_read_accum(h, 2) == -14);
  assert(call_read_accum(h, 3) == 15);
  std::puts("[PASS] independent PE accumulation");
}

static void test_fp32_accumulator() {
  Harness h;
  h.reset();
  call_set_fp32_accum(h, 0, 30.0f);
  call_set_fp32_accum(h, 0, 75.0f);  // overwrite
  float result = call_read_fp32_accum(h, 0);
  assert(std::fabs(result - 75.0f) < 0.01f);
  std::puts("[PASS] FP32 accumulator set/read");
}

static void test_clear_pe_resets() {
  Harness h;
  h.reset();
  call_mac_step(h, 0, 15, 0, 100);
  assert(call_read_accum(h, 0) == 1500);
  call_clear_pe(h, 0);
  assert(call_read_accum(h, 0) == 0);
  std::puts("[PASS] clear_pe resets INT24 accumulator");
}

static void test_clear_all() {
  Harness h;
  h.reset();
  for (int i = 0; i < 4; ++i)
    call_mac_step(h, i, 3, 0, 10);
  call_set_fp32_accum(h, 0, 42.0f);
  call_clear_all(h);
  for (int i = 0; i < 4; ++i) {
    assert(call_read_accum(h, i) == 0);
    assert(call_read_fp32_accum(h, i) == 0.0f);
  }
  std::puts("[PASS] clear_all resets INT24 and FP32 accumulators");
}

int main() {
  test_single_mac();
  test_independent_pes();
  test_fp32_accumulator();
  test_clear_pe_resets();
  test_clear_all();
  std::puts("\nAll mac_array Verilator co-sim tests passed.");
  return 0;
}
