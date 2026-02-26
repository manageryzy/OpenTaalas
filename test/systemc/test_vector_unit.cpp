// test_vector_unit.cpp — Tests for the VPU reference model
#include <vector_unit.h>
#include <bf16_math.h>
#include <cassert>
#include <cstdio>
#include <cmath>

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

  // Fill all sigmoid LUT entries with bf16(0.5)
  uint16 half = bf16_from_float(0.5f);
  for (int i = 0; i < 256; ++i)
    vpu.set_sigmoid_lut(uint8(i), half);

  // swiglu_compute(gate, up) = gate * sigmoid(gate) * up
  // gate=2.0, sigmoid=0.5 => silu=1.0, up=3.0 => 3.0
  uint16 gate = bf16_from_float(2.0f);
  uint16 up = bf16_from_float(3.0f);
  uint16 result = vpu.swiglu_compute(gate, up);
  float result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 3.0f) < 0.1f);

  // gate=4.0, up=0.5 => silu=2.0, swiglu = 2.0 * 0.5 = 1.0
  gate = bf16_from_float(4.0f);
  up = bf16_from_float(0.5f);
  result = vpu.swiglu_compute(gate, up);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 1.0f) < 0.05f);

  std::puts("  swiglu: PASS");
}

static void test_dequantize() {
  small_vpu vpu;

  // accum=100, super_scale=BF16(1.0)=0x3F80, sub_scale=0 → (1+0)*100*1.0 = 100.0
  float r = vpu.dequantize(int24(100), uint16(0x3F80), uint4(0));
  assert(std::fabs(r - 100.0f) < 0.01f);

  // sub_scale=1 → int_scale=3, 100*3*1.0 = 300.0
  r = vpu.dequantize(int24(100), uint16(0x3F80), uint4(1));
  assert(std::fabs(r - 300.0f) < 0.01f);

  // Negative accum: accum=-50, sub_scale=0, d=1.0 → -50.0
  r = vpu.dequantize(int24(-50), uint16(0x3F80), uint4(0));
  assert(std::fabs(r - (-50.0f)) < 0.01f);

  // super_scale=BF16(0.5)=0x3F00, accum=200, sub_scale=0 → 200*1*0.5 = 100.0
  r = vpu.dequantize(int24(200), uint16(0x3F00), uint4(0));
  assert(std::fabs(r - 100.0f) < 0.5f);

  std::puts("  dequantize: PASS");
}

static void test_residual_add() {
  small_vpu vpu;

  // residual_add(a, b) = bf16_add(a, b)
  // 1.0 + 2.0 = 3.0
  uint16 a = bf16_from_float(1.0f);
  uint16 b = bf16_from_float(2.0f);
  uint16 result = vpu.residual_add(a, b);
  float result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 3.0f) < 0.05f);

  // 0.0 + 5.0 = 5.0
  a = bf16_from_float(0.0f);
  b = bf16_from_float(5.0f);
  result = vpu.residual_add(a, b);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 5.0f) < 0.05f);

  // -1.0 + 1.0 = 0.0
  a = bf16_from_float(-1.0f);
  b = bf16_from_float(1.0f);
  result = vpu.residual_add(a, b);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 0.0f) < 0.05f);

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
