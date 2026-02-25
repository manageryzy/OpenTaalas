// test_vector_unit.cpp — Tests for the VPU reference model
#include <vector_unit.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

// Small RoPE table: 32 positions x 64 freqs = 2048 entries
using small_vpu = vector_unit<2048>;

static void test_rmsnorm() {
  small_vpu vpu;

  // Accumulate a few values
  vpu.rmsnorm_accumulate(uint16(10));
  vpu.rmsnorm_accumulate(uint16(20));
  vpu.rmsnorm_accumulate(uint16(30));

  // sum_sq should be 10+20+30 = 60 (model adds x, not x*x)
  assert(vpu.rmsnorm_get_sum() == 60);

  // Reset clears accumulator
  vpu.rmsnorm_reset();
  assert(vpu.rmsnorm_get_sum() == 0);

  // Accumulate after reset
  vpu.rmsnorm_accumulate(uint16(42));
  assert(vpu.rmsnorm_get_sum() == 42);

  std::puts("  rmsnorm: PASS");
}

static void test_gamma_pre_attn() {
  small_vpu vpu;

  vpu.set_gamma_pre_attn(uint16(0), uint16(0xABCD));
  vpu.set_gamma_pre_attn(uint16(4095), uint16(0x1234));

  assert(vpu.get_gamma_pre_attn(uint16(0)) == 0xABCD);
  assert(vpu.get_gamma_pre_attn(uint16(4095)) == 0x1234);

  // Overwrite
  vpu.set_gamma_pre_attn(uint16(0), uint16(0x5678));
  assert(vpu.get_gamma_pre_attn(uint16(0)) == 0x5678);

  std::puts("  gamma_pre_attn: PASS");
}

static void test_gamma_pre_mlp() {
  small_vpu vpu;

  vpu.set_gamma_pre_mlp(uint16(100), uint16(0xBEEF));
  assert(vpu.get_gamma_pre_mlp(uint16(100)) == 0xBEEF);

  vpu.set_gamma_pre_mlp(uint16(100), uint16(0xCAFE));
  assert(vpu.get_gamma_pre_mlp(uint16(100)) == 0xCAFE);

  std::puts("  gamma_pre_mlp: PASS");
}

static void test_rsqrt_lut() {
  small_vpu vpu;

  vpu.set_rsqrt_lut(uint8(0), uint16(0x3F80));
  vpu.set_rsqrt_lut(uint8(255), uint16(0x0001));

  assert(vpu.lookup_rsqrt(uint8(0)) == 0x3F80);
  assert(vpu.lookup_rsqrt(uint8(255)) == 0x0001);

  std::puts("  rsqrt_lut: PASS");
}

static void test_rope_tables() {
  small_vpu vpu;

  // 2048 entries = 32 positions x 64 freqs
  // Write a few entries and read back
  vpu.rope_set_cos(uint12(0), uint6(0), uint16(0x3C00));
  vpu.rope_set_sin(uint12(0), uint6(0), uint16(0x0000));

  vpu.rope_set_cos(uint12(31), uint6(63), uint16(0x1111));
  vpu.rope_set_sin(uint12(31), uint6(63), uint16(0x2222));

  assert(vpu.rope_get_cos(uint12(0), uint6(0)) == 0x3C00);
  assert(vpu.rope_get_sin(uint12(0), uint6(0)) == 0x0000);
  assert(vpu.rope_get_cos(uint12(31), uint6(63)) == 0x1111);
  assert(vpu.rope_get_sin(uint12(31), uint6(63)) == 0x2222);

  // Overwrite
  vpu.rope_set_cos(uint12(0), uint6(0), uint16(0xFFFF));
  assert(vpu.rope_get_cos(uint12(0), uint6(0)) == 0xFFFF);

  std::puts("  rope_tables: PASS");
}

static void test_sigmoid_lut_and_swiglu() {
  small_vpu vpu;

  // Fill a few sigmoid LUT entries
  vpu.set_sigmoid_lut(uint8(0), uint16(0x0000));
  vpu.set_sigmoid_lut(uint8(128), uint16(0x3F00));
  vpu.set_sigmoid_lut(uint8(255), uint16(0x3F80));

  // swiglu_compute returns gate_bf16 (per Kanagawa source)
  uint16 result = vpu.swiglu_compute(uint16(0x4000), uint16(0x4100));
  assert(result == 0x4000);

  // Different gate value
  result = vpu.swiglu_compute(uint16(0xBEEF), uint16(0x0000));
  assert(result == 0xBEEF);

  std::puts("  swiglu: PASS");
}

static void test_dequantize() {
  small_vpu vpu;

  // Known FP8 E4M3 bit pattern: bank_scale = 0x3C = 0_0111_100
  //   fp8_sign=0, fp8_exp=7, fp8_mant=4
  //   fp32_exp = 7+120 = 127 = 0x7F
  //   fp32_scale = (0<<31)|(127<<23)|(4<<20) = 0x3FC00000
  //   With accum sign=0: combined = 0x3FC00000
  //   result = combined >> 16 = 0x3FC0
  uint16 r = vpu.dequantize(uint32(0x00000001), uint8(0x3C), uint32(0));
  assert(r == 0x3FC0);

  // Negative accum (sign bit set)
  //   accum sign=1: combined = (1<<31) | (0x3FC00000 & 0x7FFFFFFF) = 0xBFC00000
  //   result = 0xBFC0
  r = vpu.dequantize(uint32(0x80000000), uint8(0x3C), uint32(0));
  assert(r == 0xBFC0);

  std::puts("  dequantize: PASS");
}

static void test_residual_add() {
  small_vpu vpu;

  uint16 a(0x4000);
  uint16 b(0x4100);
  assert(vpu.residual_add(a, b) == a);

  // Verify it always returns first argument
  assert(vpu.residual_add(uint16(0), uint16(0xFFFF)) == 0);

  std::puts("  residual_add: PASS");
}

int main() {
  std::puts("test_vector_unit");

  test_rmsnorm();
  test_gamma_pre_attn();
  test_gamma_pre_mlp();
  test_rsqrt_lut();
  test_rope_tables();
  test_sigmoid_lut_and_swiglu();
  test_dequantize();
  test_residual_add();

  std::puts("All vector_unit tests passed.");
  return 0;
}
