// test_mac_array.cpp — Tests for MAC Array GEMV engine
#include <mac_array.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_weight_readback() {
  MacArray<16, 16> arr;
  // Write and read back weights
  arr.write_weight(uint12(0), uint13(0), uint3(5));
  arr.write_weight(uint12(3), uint13(7), uint3(2));
  arr.write_weight(uint12(15), uint13(15), uint3(7));

  assert(arr.read_weight(uint12(0), uint13(0)).to_int() == 5);
  assert(arr.read_weight(uint12(3), uint13(7)).to_int() == 2);
  assert(arr.read_weight(uint12(15), uint13(15)).to_int() == 7);
  // Unwritten location should be 0
  assert(arr.read_weight(uint12(1), uint13(1)).to_int() == 0);
  std::puts("[PASS] weight write/read");
}

static void test_independent_pe_accumulation() {
  MacArray<16, 16> arr;
  // PE 0: weight=1, act=10 -> accum=10
  arr.mac_step(0, uint3(1), int8(10));
  // PE 1: weight=3, act=5 -> accum=15
  arr.mac_step(1, uint3(3), int8(5));
  // PE 2: weight=4, act=2 -> accum=-8
  arr.mac_step(2, uint3(4), int8(2));
  // PE 3: weight=7, act=3 -> accum=-3
  arr.mac_step(3, uint3(7), int8(3));

  assert(arr.read_accum(0).to_int64() == 10);
  assert(arr.read_accum(1).to_int64() == 15);
  assert(arr.read_accum(2).to_int64() == -8);
  assert(arr.read_accum(3).to_int64() == -3);
  std::puts("[PASS] independent PE accumulation");
}

static void test_mac_step_accumulates() {
  MacArray<16, 16> arr;
  // Multiple MACs on PE 0
  arr.mac_step(0, uint3(2), int8(10));  // +20
  arr.mac_step(0, uint3(3), int8(5));   // +15
  arr.mac_step(0, uint3(5), int8(4));   // -12
  // Expected: 20 + 15 - 12 = 23
  assert(arr.read_accum(0).to_int64() == 23);
  std::puts("[PASS] mac_step accumulates correctly");
}

static void test_clear_pe() {
  MacArray<16, 16> arr;
  arr.mac_step(0, uint3(1), int8(100));
  arr.mac_step(1, uint3(1), int8(50));

  arr.clear_pe(0);
  assert(arr.read_accum(0).to_int64() == 0);
  // PE 1 should be unaffected
  assert(arr.read_accum(1).to_int64() == 50);
  std::puts("[PASS] clear_pe clears only target PE");
}

static void test_clear_all() {
  MacArray<16, 16> arr;
  for (int i = 0; i < 4; ++i)
    arr.mac_step(i, uint3(3), int8(10));

  arr.clear_all();
  for (int i = 0; i < 4; ++i)
    assert(arr.read_accum(i).to_int64() == 0);
  std::puts("[PASS] clear_all resets all PEs");
}

static void test_read_output_dequant() {
  MacArray<16, 16> arr;
  // Set bank scale to 1.0 in FP8 E4M3 = 0x38
  arr.set_bank_scale(uint8(0x38));
  arr.set_tensor_scale(uint32(0));

  // PE 0: accumulate a positive value
  arr.mac_step(0, uint3(1), int8(1));  // accum = 1
  uint16 bf16 = arr.read_output(0);

  // accum=1 -> uint32=1, sign=0
  // fp8=0x38: exp=7, mant=0 -> fp32_exp=127, fp32_scale=0x3F800000
  // combined = (0<<31) | 0x3F800000 = 0x3F800000
  // BF16 = 0x3F80
  assert(bf16.to_int() == 0x3F80);
  std::puts("[PASS] read_output dequantizes to BF16");
}

static void test_read_output_negative_accum() {
  MacArray<16, 16> arr;
  arr.set_bank_scale(uint8(0x38));
  arr.set_tensor_scale(uint32(0));

  // PE 0: accumulate a negative value
  arr.mac_step(0, uint3(7), int8(1));  // accum = -1
  uint16 bf16 = arr.read_output(0);

  // accum=-1 as int32 -> uint32 = 0xFFFFFFFF, sign=1
  // combined = (1<<31) | 0x3F800000 = 0xBF800000
  // BF16 = 0xBF80
  assert(bf16.to_int() == 0xBF80);
  std::puts("[PASS] read_output with negative accumulator");
}

static void test_scales_update() {
  MacArray<16, 16> arr;
  arr.mac_step(0, uint3(1), int8(1));  // accum = 1

  // FP8 = 0x40: sign=0, exp=8, mant=0 -> fp32_exp=128
  // fp32_scale = (128<<23) = 0x40000000
  // BF16 = 0x4000
  arr.set_bank_scale(uint8(0x40));
  arr.set_tensor_scale(uint32(0));
  uint16 bf16 = arr.read_output(0);
  assert(bf16.to_int() == 0x4000);

  // Change scale and verify output changes
  arr.set_bank_scale(uint8(0x38));
  bf16 = arr.read_output(0);
  assert(bf16.to_int() == 0x3F80);
  std::puts("[PASS] scale updates affect read_output");
}

int main() {
  test_weight_readback();
  test_independent_pe_accumulation();
  test_mac_step_accumulates();
  test_clear_pe();
  test_clear_all();
  test_read_output_dequant();
  test_read_output_negative_accum();
  test_scales_update();
  std::puts("\nAll mac_array tests passed.");
  return 0;
}
