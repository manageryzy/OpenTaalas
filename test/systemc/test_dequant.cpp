// test_dequant.cpp — Tests for FP8 E4M3 dequantization to BF16
#include <dequant.h>
#include <cassert>
#include <cstdint>
#include <cstdio>

using namespace opentaalas;

// Helper: manually compute expected BF16 from the Kanagawa algorithm
static std::uint16_t ref_dequant(std::uint32_t accum, std::uint8_t fp8,
                                 std::uint32_t /*tensor_scale*/) {
  std::uint32_t sign = (accum >> 31) & 1u;
  std::uint32_t fp8_sign = (fp8 >> 7) & 1u;
  std::uint32_t fp8_exp = (fp8 >> 3) & 0xFu;
  std::uint32_t fp8_mant = fp8 & 0x7u;
  std::uint32_t fp32_exp = fp8_exp + 120u;
  std::uint32_t fp32_scale =
      (fp8_sign << 31) | (fp32_exp << 23) | (fp8_mant << 20);
  std::uint32_t combined = (sign << 31) | (fp32_scale & 0x7FFFFFFFu);
  return static_cast<std::uint16_t>(combined >> 16);
}

static void test_bank_scale_one() {
  // FP8 E4M3 encoding of 1.0: sign=0, exp=7 (bias=7, so 2^0), mant=0
  // Binary: 0_0111_000 = 0x38
  DequantUnit dq;
  uint16 result = dq.dequantize(uint32(100), uint8(0x38), uint32(0));

  // exp=7, fp32_exp=7+120=127, mant=0
  // fp32_scale = (0<<31)|(127<<23)|(0<<20) = 0x3F800000 (IEEE 1.0)
  // sign from accum=100 is 0
  // combined = (0<<31) | (0x3F800000 & 0x7FFFFFFF) = 0x3F800000
  // BF16 = 0x3F800000 >> 16 = 0x3F80
  assert(result.to_int() == 0x3F80);
  std::puts("[PASS] bank_scale=0x38 (1.0 in E4M3) -> BF16 0x3F80");
}

static void test_bank_scale_zero() {
  // FP8 = 0x00: sign=0, exp=0, mant=0
  // fp32_exp = 0+120 = 120, fp32_scale = (120<<23)|(0<<20) = 0x3C000000
  // BF16 = 0x3C000000 >> 16 = 0x3C00
  DequantUnit dq;
  uint16 result = dq.dequantize(uint32(42), uint8(0x00), uint32(0));
  std::uint16_t expected = ref_dequant(42, 0x00, 0);
  assert(result.to_int() == expected);
  std::puts("[PASS] bank_scale=0x00 (subnormal zero)");
}

static void test_sign_bit_from_accum() {
  // accum with bit 31 set (negative INT32 reinterpreted as uint32)
  // accum = 0x80000000 -> sign=1
  DequantUnit dq;
  uint16 result = dq.dequantize(uint32(0x80000000u), uint8(0x38), uint32(0));

  // sign=1, fp32_scale=0x3F800000
  // combined = (1<<31) | 0x3F800000 = 0xBF800000
  // BF16 = 0xBF800000 >> 16 = 0xBF80
  assert(result.to_int() == 0xBF80);
  std::puts("[PASS] accum sign bit propagates to BF16 sign");
}

static void test_negative_fp8_sign() {
  // FP8 = 0xB8: sign=1, exp=7, mant=0 -> -1.0 in E4M3
  // fp32_scale = (1<<31)|(127<<23)|(0<<20) = 0xBF800000
  // accum=0 -> sign=0
  // combined = (0<<31) | (0xBF800000 & 0x7FFFFFFF) = 0x3F800000
  // BF16 = 0x3F80
  DequantUnit dq;
  uint16 result = dq.dequantize(uint32(0), uint8(0xB8), uint32(0));
  assert(result.to_int() == 0x3F80);
  std::puts("[PASS] negative FP8 sign, positive accum");
}

static void test_both_signs_negative() {
  // accum sign=1, fp8 sign=1
  // combined = (1<<31) | (0x3F800000) = 0xBF800000
  // BF16 = 0xBF80
  DequantUnit dq;
  uint16 result =
      dq.dequantize(uint32(0x80000000u), uint8(0xB8), uint32(0));
  assert(result.to_int() == 0xBF80);
  std::puts("[PASS] both accum and FP8 negative");
}

static void test_various_fp8_patterns() {
  // Verify model matches reference for a sweep of FP8 values
  DequantUnit dq;
  for (unsigned fp8 = 0; fp8 < 256; ++fp8) {
    for (std::uint32_t acc : {0u, 1u, 0x7FFFFFFFu, 0x80000000u}) {
      uint16 got = dq.dequantize(uint32(acc), uint8(fp8), uint32(0));
      std::uint16_t expected = ref_dequant(acc, static_cast<std::uint8_t>(fp8), 0);
      assert(got.to_int() == expected);
    }
  }
  std::puts("[PASS] exhaustive FP8 sweep (256 values x 4 accum patterns)");
}

int main() {
  test_bank_scale_one();
  test_bank_scale_zero();
  test_sign_bit_from_accum();
  test_negative_fp8_sign();
  test_both_signs_negative();
  test_various_fp8_patterns();
  std::puts("\nAll dequant tests passed.");
  return 0;
}
