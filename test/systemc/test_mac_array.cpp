// test_mac_array.cpp — Tests for IQ3_S MAC Array GEMV engine
#include <mac_array.h>
#include <bf16_math.h>
#include <cassert>
#include <cmath>
#include <cstdio>

using namespace opentaalas;

static void test_block_write_read() {
  MacArray arr;
  IQ3SBlock blk = {};
  blk.d_bf16 = 0x3F80;
  blk.qs[0] = 0x00;  // codebook index 0 -> magnitudes (1,1,1,1)
  arr.write_block(0, blk);
  IQ3SBlock got = arr.read_block(0);
  assert(got.d_bf16 == 0x3F80);
  assert(got.qs[0] == 0x00);
  std::puts("[PASS] block write/read");
}

static void test_single_mac() {
  MacArray arr;
  // mag=3, sign=0, act=10 -> product = 30
  arr.mac_step(0, uint4(3), uint1(0), int8(10));
  assert(arr.read_accum(0).to_int64() == 30);
  std::puts("[PASS] single MAC step");
}

static void test_independent_pes() {
  MacArray arr;
  arr.mac_step(0, uint4(1), uint1(0), int8(10));   // PE0: +10
  arr.mac_step(1, uint4(5), uint1(0), int8(3));    // PE1: +15
  arr.mac_step(2, uint4(7), uint1(1), int8(2));    // PE2: -14
  arr.mac_step(3, uint4(15), uint1(0), int8(1));   // PE3: +15
  assert(arr.read_accum(0).to_int64() == 10);
  assert(arr.read_accum(1).to_int64() == 15);
  assert(arr.read_accum(2).to_int64() == -14);
  assert(arr.read_accum(3).to_int64() == 15);
  std::puts("[PASS] independent PE accumulation");
}

static void test_dequant_output() {
  MacArray arr;
  // Accumulate: 4 x (mag=1, sign=0, act=10) = 40
  for (int i = 0; i < 4; ++i)
    arr.mac_step(0, uint4(1), uint1(0), int8(10));
  assert(arr.read_accum(0).to_int64() == 40);

  // Dequant: 40 x BF16(1.0) x (1+2x0) = 40.0
  float result = arr.read_dequant(0, uint16(0x3F80), uint4(0));
  assert(std::fabs(result - 40.0f) < 0.01f);
  std::puts("[PASS] dequant output");
}

static void test_dequant_with_sub_scale() {
  MacArray arr;
  arr.mac_step(0, uint4(1), uint1(0), int8(10));  // accum=10
  // Dequant: 10 x BF16(0.5)=0x3F00 x (1+2x3)=7 -> 10 x 0.5 x 7 = 35.0
  float result = arr.read_dequant(0, uint16(0x3F00), uint4(3));
  assert(std::fabs(result - 35.0f) < 0.01f);
  std::puts("[PASS] dequant with sub_scale=3");
}

static void test_fp32_accumulator() {
  MacArray arr;
  // Simulate two sub-blocks on PE0
  arr.mac_step(0, uint4(3), uint1(0), int8(10));  // accum=30
  float partial1 = arr.read_dequant(0, uint16(0x3F80), uint4(0));  // 30.0
  arr.accumulate_fp32(0, partial1);

  arr.clear_pe(0);
  arr.mac_step(0, uint4(5), uint1(0), int8(5));   // accum=25
  float partial2 = arr.read_dequant(0, uint16(0x3F80), uint4(1));  // 25x3=75.0
  arr.accumulate_fp32(0, partial2);

  float row_result = arr.read_fp32_accum(0);
  assert(std::fabs(row_result - 105.0f) < 0.01f);  // 30 + 75
  std::puts("[PASS] FP32 accumulator across sub-blocks");
}

static void test_clear_all() {
  MacArray arr;
  for (int i = 0; i < 4; ++i)
    arr.mac_step(i, uint4(3), uint1(0), int8(10));
  arr.clear_all();
  for (int i = 0; i < 4; ++i) {
    assert(arr.read_accum(i).to_int64() == 0);
    assert(arr.read_fp32_accum(i) == 0.0f);
  }
  std::puts("[PASS] clear_all resets INT24 and FP32 accumulators");
}

int main() {
  test_block_write_read();
  test_single_mac();
  test_independent_pes();
  test_dequant_output();
  test_dequant_with_sub_scale();
  test_fp32_accumulator();
  test_clear_all();
  std::puts("\nAll mac_array tests passed.");
  return 0;
}
