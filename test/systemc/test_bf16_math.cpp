// test_bf16_math.cpp — Tests for BF16 arithmetic library
#include <bf16_math.h>
#include <cassert>
#include <cmath>
#include <cstdio>

using namespace opentaalas;

static bool bf16_approx(uint16 val, float expected, float tol = 0.02f) {
  return std::fabs(bf16_to_float(val) - expected) <= tol;
}

static void test_roundtrip() {
  const float vals[] = {0.0f, 1.0f, -1.0f, 2.0f, 0.5f, -0.5f, 3.14159f};
  for (float v : vals) {
    uint16 bf = bf16_from_float(v);
    assert(bf16_approx(bf, v));
  }
  std::puts("[PASS] round-trip conversion");
}

static void test_add() {
  assert(bf16_approx(bf16_add(bf16_from_float(1.0f), bf16_from_float(2.0f)), 3.0f));
  assert(bf16_approx(bf16_add(bf16_from_float(1.0f), bf16_from_float(-1.0f)), 0.0f));
  assert(bf16_approx(bf16_add(bf16_from_float(1000.0f), bf16_from_float(0.01f)), 1000.0f, 1.0f));
  std::puts("[PASS] bf16_add");
}

static void test_sub() {
  assert(bf16_approx(bf16_sub(bf16_from_float(3.0f), bf16_from_float(1.0f)), 2.0f));
  std::puts("[PASS] bf16_sub");
}

static void test_mul() {
  assert(bf16_approx(bf16_mul(bf16_from_float(2.0f), bf16_from_float(3.0f)), 6.0f));
  assert(bf16_approx(bf16_mul(bf16_from_float(-2.0f), bf16_from_float(3.0f)), -6.0f));
  assert(bf16_approx(bf16_mul(bf16_from_float(0.0f), bf16_from_float(5.0f)), 0.0f));
  std::puts("[PASS] bf16_mul");
}

static void test_neg() {
  assert(bf16_approx(bf16_neg(bf16_from_float(1.0f)), -1.0f));
  assert(bf16_approx(bf16_neg(bf16_from_float(-1.0f)), 1.0f));
  std::puts("[PASS] bf16_neg");
}

static void test_abs() {
  assert(bf16_approx(bf16_abs(bf16_from_float(-3.0f)), 3.0f));
  assert(bf16_approx(bf16_abs(bf16_from_float(3.0f)), 3.0f));
  std::puts("[PASS] bf16_abs");
}

static void test_rsqrt() {
  assert(bf16_approx(bf16_rsqrt(bf16_from_float(4.0f)), 0.5f));
  assert(bf16_approx(bf16_rsqrt(bf16_from_float(1.0f)), 1.0f));
  std::puts("[PASS] bf16_rsqrt");
}

static void test_div() {
  assert(bf16_approx(bf16_div(bf16_from_float(6.0f), bf16_from_float(2.0f)), 3.0f));
  std::puts("[PASS] bf16_div");
}

static void test_gt() {
  assert(bf16_gt(bf16_from_float(2.0f), bf16_from_float(1.0f)) == true);
  assert(bf16_gt(bf16_from_float(1.0f), bf16_from_float(2.0f)) == false);
  std::puts("[PASS] bf16_gt");
}

static void test_fp16_to_bf16() {
  // FP16 1.0 = 0x3C00: sign=0, exp=15, mant=0
  // BF16 1.0 = 0x3F80: sign=0, exp=127, mant=0
  assert(opentaalas::fp16_to_bf16(0x3C00).to_int() == 0x3F80);

  // FP16 -1.0 = 0xBC00 → BF16 -1.0 = 0xBF80
  assert(opentaalas::fp16_to_bf16(0xBC00).to_int() == 0xBF80);

  // FP16 0.5 = 0x3800: sign=0, exp=14, mant=0
  // BF16: exp=14+112=126, mant=0 → 0x3F00
  assert(opentaalas::fp16_to_bf16(0x3800).to_int() == 0x3F00);

  // FP16 subnormal → FTZ to 0
  assert(opentaalas::fp16_to_bf16(0x0001).to_int() == 0x0000);

  // FP16 negative subnormal → FTZ to -0
  assert(opentaalas::fp16_to_bf16(0x8001).to_int() == 0x8000);

  std::puts("[PASS] fp16_to_bf16 conversion");
}

int main() {
  test_roundtrip();
  test_add();
  test_sub();
  test_mul();
  test_neg();
  test_abs();
  test_rsqrt();
  test_div();
  test_gt();
  test_fp16_to_bf16();
  std::puts("\nAll bf16_math tests passed.");
  return 0;
}
