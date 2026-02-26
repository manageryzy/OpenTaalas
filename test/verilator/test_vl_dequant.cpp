// test_vl_dequant.cpp — Verilator co-simulation tests for dequant_unit
// Mirrors test/systemc/test_dequant.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vdequant_unit.h"

#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vdequant_unit>;

// Reinterpret a 32-bit uint as IEEE 754 float.
static float bits_to_float(uint32_t bits) {
  float f;
  std::memcpy(&f, &bits, sizeof(f));
  return f;
}

// Call dequantize(accum, super_scale_bf16, sub_scale) and return the FP32 result.
// accum is signed 24-bit — pass the lower 24 bits of the two's complement value.
static float call_dequantize(Harness& h, int32_t accum, uint16_t super_scale_bf16,
                             uint8_t sub_scale) {
  auto* d = h.dut();
  h.wait_ready(d->dequantize_rdy_out);
  d->dequantize_valid_in = 1;
  d->dequantize_accum_in = static_cast<uint32_t>(accum) & 0xFFFFFF;
  d->dequantize_super_scale_bf16_in = super_scale_bf16;
  d->dequantize_sub_scale_in = sub_scale & 0xF;
  h.tick();
  d->dequantize_valid_in = 0;
  uint32_t raw = h.read_fifo(d->dequantize_rden_in, d->dequantize_empty_out,
                              d->dequantize_result_out);
  return bits_to_float(raw);
}

// ---- Tests (mirror test/systemc/test_dequant.cpp) ----

static void test_unit_scale() {
  // accum=100, super_scale=BF16(1.0)=0x3F80, sub_scale=0
  // result = 100 * 1.0 * (1+2*0) = 100.0
  Harness h;
  h.reset();
  float result = call_dequantize(h, 100, 0x3F80, 0);
  assert(std::fabs(result - 100.0f) < 0.01f);
  std::puts("[PASS] unit scale: accum=100, d=1.0, sub=0 -> 100.0");
}

static void test_sub_scale_multiplier() {
  // accum=10, d=BF16(1.0)=0x3F80, sub_scale=3
  // result = 10 * 1.0 * (1+2*3) = 10 * 7 = 70.0
  Harness h;
  h.reset();
  float result = call_dequantize(h, 10, 0x3F80, 3);
  assert(std::fabs(result - 70.0f) < 0.01f);
  std::puts("[PASS] sub_scale=3: 10 * 1.0 * 7 = 70.0");
}

static void test_max_sub_scale() {
  // sub_scale=15: multiplier = 1+2*15 = 31
  // accum=1, d=BF16(1.0)
  // result = 1 * 1.0 * 31 = 31.0
  Harness h;
  h.reset();
  float result = call_dequantize(h, 1, 0x3F80, 15);
  assert(std::fabs(result - 31.0f) < 0.01f);
  std::puts("[PASS] max sub_scale=15: 1 * 1.0 * 31 = 31.0");
}

static void test_negative_accum() {
  // accum=-50, d=BF16(2.0)=0x4000, sub_scale=0
  // result = -50 * 2.0 * 1 = -100.0
  Harness h;
  h.reset();
  float result = call_dequantize(h, -50, 0x4000, 0);
  assert(std::fabs(result - (-100.0f)) < 0.01f);
  std::puts("[PASS] negative accum: -50 * 2.0 * 1 = -100.0");
}

static void test_bf16_scale_precision() {
  // d=BF16(0.125)=0x3E00, accum=80, sub_scale=1
  // result = 80 * 0.125 * (1+2) = 80 * 0.125 * 3 = 30.0
  Harness h;
  h.reset();
  float result = call_dequantize(h, 80, 0x3E00, 1);
  assert(std::fabs(result - 30.0f) < 0.01f);
  std::puts("[PASS] BF16 scale 0.125: 80 * 0.125 * 3 = 30.0");
}

static void test_ftz_zero_accum() {
  // accum=0 should always produce 0 regardless of scales
  Harness h;
  h.reset();
  float result = call_dequantize(h, 0, 0x4000, 15);
  assert(result == 0.0f);
  std::puts("[PASS] zero accum -> 0.0");
}

static void test_realistic_values() {
  // accum=1234, d=BF16(0.00390625)=0x3B80, sub=5
  // result = 1234 * 0.00390625 * (1+10) = 1234 * 0.00390625 * 11 = 53.015625
  Harness h;
  h.reset();
  float result = call_dequantize(h, 1234, 0x3B80, 5);
  float expected = 1234.0f * 0.00390625f * 11.0f;
  assert(std::fabs(result - expected) < 0.1f);
  std::puts("[PASS] realistic values");
}

int main() {
  test_unit_scale();
  test_sub_scale_multiplier();
  test_max_sub_scale();
  test_negative_accum();
  test_bf16_scale_precision();
  test_ftz_zero_accum();
  test_realistic_values();
  std::puts("\nAll dequant Verilator co-sim tests passed.");
  return 0;
}
