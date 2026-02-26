// test_dequant.cpp — Tests for IQ3_S dequantization
// New: INT24 × BF16_d × (1+2×sub_scale_4bit) → FP32
#include <dequant.h>
#include <bf16_math.h>
#include <cassert>
#include <cmath>
#include <cstdio>

using namespace opentaalas;

static void test_unit_scale() {
  // accum=100, super_scale=BF16(1.0)=0x3F80, sub_scale=0
  // result = 100 × 1.0 × (1+2×0) = 100.0
  DequantUnit dq;
  float result = dq.dequantize(int24(100), uint16(0x3F80), uint4(0));
  assert(std::fabs(result - 100.0f) < 0.01f);
  std::puts("[PASS] unit scale: accum=100, d=1.0, sub=0 → 100.0");
}

static void test_sub_scale_multiplier() {
  // accum=10, d=BF16(1.0)=0x3F80, sub_scale=3
  // result = 10 × 1.0 × (1+2×3) = 10 × 7 = 70.0
  DequantUnit dq;
  float result = dq.dequantize(int24(10), uint16(0x3F80), uint4(3));
  assert(std::fabs(result - 70.0f) < 0.01f);
  std::puts("[PASS] sub_scale=3: 10 × 1.0 × 7 = 70.0");
}

static void test_max_sub_scale() {
  // sub_scale=15: multiplier = 1+2×15 = 31
  // accum=1, d=BF16(1.0)
  // result = 1 × 1.0 × 31 = 31.0
  DequantUnit dq;
  float result = dq.dequantize(int24(1), uint16(0x3F80), uint4(15));
  assert(std::fabs(result - 31.0f) < 0.01f);
  std::puts("[PASS] max sub_scale=15: 1 × 1.0 × 31 = 31.0");
}

static void test_negative_accum() {
  // accum=-50, d=BF16(2.0)=0x4000, sub_scale=0
  // result = -50 × 2.0 × 1 = -100.0
  DequantUnit dq;
  float result = dq.dequantize(int24(-50), uint16(0x4000), uint4(0));
  assert(std::fabs(result - (-100.0f)) < 0.01f);
  std::puts("[PASS] negative accum: -50 × 2.0 × 1 = -100.0");
}

static void test_bf16_scale_precision() {
  // d=BF16(0.125)=0x3E00, accum=80, sub_scale=1
  // result = 80 × 0.125 × (1+2) = 80 × 0.125 × 3 = 30.0
  DequantUnit dq;
  float result = dq.dequantize(int24(80), uint16(0x3E00), uint4(1));
  assert(std::fabs(result - 30.0f) < 0.01f);
  std::puts("[PASS] BF16 scale 0.125: 80 × 0.125 × 3 = 30.0");
}

static void test_ftz_zero_accum() {
  // accum=0 should always produce 0 regardless of scales
  DequantUnit dq;
  float result = dq.dequantize(int24(0), uint16(0x4000), uint4(15));
  assert(result == 0.0f);
  std::puts("[PASS] zero accum → 0.0");
}

static void test_realistic_values() {
  // Simulate a realistic sub-block: accum=1234, d=BF16(0.00390625)=0x3B80, sub=5
  // result = 1234 × 0.00390625 × (1+10) = 1234 × 0.00390625 × 11 = 53.015625
  DequantUnit dq;
  float d_val = 0.00390625f;  // 2^-8
  uint16 d_bf16 = bf16_from_float(d_val);
  float result = dq.dequantize(int24(1234), d_bf16, uint4(5));
  float expected = 1234.0f * d_val * 11.0f;
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
  std::puts("\nAll dequant tests passed.");
  return 0;
}
