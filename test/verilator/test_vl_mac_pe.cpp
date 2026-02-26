// test_vl_mac_pe.cpp — Verilator co-simulation tests for mac_pe
// Mirrors test/systemc/test_mac_pe.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vmac_pe.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vmac_pe>;

// Sign-extend a 24-bit value stored in a uint32_t to int32_t.
static int32_t sext24(uint32_t v) {
  if (v & 0x800000) return static_cast<int32_t>(v | 0xFF000000);
  return static_cast<int32_t>(v & 0x00FFFFFF);
}

// Call mac(magnitude, sign_bit, activation) and return the sign-extended result.
static int32_t call_mac(Harness& h, uint8_t mag, uint8_t sign, int8_t act) {
  auto* d = h.dut();
  h.wait_ready(d->mac_rdy_out);
  d->mac_valid_in = 1;
  d->mac_magnitude_in = mag & 0xF;
  d->mac_sign_bit_in = sign & 1;
  d->mac_activation_in = static_cast<uint8_t>(act);
  h.tick();
  d->mac_valid_in = 0;
  uint32_t raw = h.read_fifo(d->mac_rden_in, d->mac_empty_out, d->mac_result_out);
  return sext24(raw);
}

// Call read_accum() and return the sign-extended accumulator value.
static int32_t call_read_accum(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->read_accum_rdy_out);
  d->read_accum_valid_in = 1;
  h.tick();
  d->read_accum_valid_in = 0;
  uint32_t raw = h.read_fifo(d->read_accum_rden_in, d->read_accum_empty_out,
                              d->read_accum_result_out);
  return sext24(raw);
}

// Call clear() — void return, just drain the FIFO.
static void call_clear(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->clear_rdy_out);
  d->clear_valid_in = 1;
  h.tick();
  d->clear_valid_in = 0;
  h.drain_fifo(d->clear_rden_in, d->clear_empty_out);
}

// ---- Tests (mirror test/systemc/test_mac_pe.cpp exactly) ----

static void test_all_magnitudes_positive() {
  const int mags[] = {1, 3, 5, 7, 9, 11, 13, 15};
  for (int m : mags) {
    Harness h;
    h.reset();
    int32_t result = call_mac(h, m, 0, 10);
    assert(result == m * 10);
  }
  std::puts("[PASS] all magnitudes with positive sign, act=10");
}

static void test_all_magnitudes_negative() {
  const int mags[] = {1, 3, 5, 7, 9, 11, 13, 15};
  for (int m : mags) {
    Harness h;
    h.reset();
    int32_t result = call_mac(h, m, 1, 10);
    assert(result == -(m * 10));
  }
  std::puts("[PASS] all magnitudes with negative sign, act=10");
}

static void test_negative_activation() {
  {
    Harness h;
    h.reset();
    int32_t result = call_mac(h, 5, 0, -7);
    assert(result == -35);
  }
  {
    Harness h;
    h.reset();
    int32_t result = call_mac(h, 5, 1, -7);
    assert(result == 35);
  }
  std::puts("[PASS] negative activation");
}

static void test_accumulation_32_weights() {
  Harness h;
  h.reset();
  for (int i = 0; i < 32; ++i)
    call_mac(h, 1, 0, 1);
  int32_t accum = call_read_accum(h);
  assert(accum == 32);
  std::puts("[PASS] accumulation over 32 weights");
}

static void test_worst_case_accumulation() {
  Harness h;
  h.reset();
  for (int i = 0; i < 32; ++i)
    call_mac(h, 15, 0, 127);
  int32_t accum = call_read_accum(h);
  assert(accum == 60960);
  std::puts("[PASS] worst case accumulation (60960 fits INT24)");
}

static void test_clear() {
  Harness h;
  h.reset();
  call_mac(h, 15, 0, 100);
  int32_t a1 = call_read_accum(h);
  assert(a1 == 1500);
  call_clear(h);
  int32_t a2 = call_read_accum(h);
  assert(a2 == 0);
  call_mac(h, 3, 0, 7);
  int32_t a3 = call_read_accum(h);
  assert(a3 == 21);
  std::puts("[PASS] clear resets accumulator");
}

static void test_shift_and_add_correctness() {
  Harness h;
  h.reset();
  for (int k = 0; k < 8; ++k) {
    int mag = 2 * k + 1;
    for (int a : {1, -1, 42, -128, 127}) {
      call_clear(h);
      int32_t result = call_mac(h, mag, 0, static_cast<int8_t>(a));
      assert(result == mag * a);
    }
  }
  std::puts("[PASS] shift-and-add matches mag*act for all k");
}

int main() {
  test_all_magnitudes_positive();
  test_all_magnitudes_negative();
  test_negative_activation();
  test_accumulation_32_weights();
  test_worst_case_accumulation();
  test_clear();
  test_shift_and_add_correctness();
  std::puts("\nAll mac_pe Verilator co-sim tests passed.");
  return 0;
}
