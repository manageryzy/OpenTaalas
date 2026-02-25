// test_mac_pe.cpp — Tests for INT3xINT8 MAC Processing Element
#include <mac_pe.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_all_weights_act1() {
  // weight 0-7 with activation=1 should produce 0,1,2,3,-4,-3,-2,-1
  const int expected[] = {0, 1, 2, 3, -4, -3, -2, -1};
  for (int w = 0; w < 8; ++w) {
    MacPE pe;
    int32 result = pe.mac(uint3(w), int8(1));
    assert(result.to_int64() == expected[w]);
  }
  std::puts("[PASS] all weights with activation=1");
}

static void test_all_weights_act10() {
  // activation=10: products should be 0,10,20,30,-40,-30,-20,-10
  const int expected[] = {0, 10, 20, 30, -40, -30, -20, -10};
  for (int w = 0; w < 8; ++w) {
    MacPE pe;
    int32 result = pe.mac(uint3(w), int8(10));
    assert(result.to_int64() == expected[w]);
  }
  std::puts("[PASS] all weights with activation=10");
}

static void test_negative_activation() {
  // activation=-5: products should be 0,-5,-10,-15,20,15,10,5
  const int expected[] = {0, -5, -10, -15, 20, 15, 10, 5};
  for (int w = 0; w < 8; ++w) {
    MacPE pe;
    int32 result = pe.mac(uint3(w), int8(-5));
    assert(result.to_int64() == expected[w]);
  }
  std::puts("[PASS] negative activation (-5)");
}

static void test_accumulation() {
  MacPE pe;
  // MAC weight=1, act=10 three times -> 10, 20, 30
  pe.mac(uint3(1), int8(10));
  pe.mac(uint3(1), int8(10));
  int32 result = pe.mac(uint3(1), int8(10));
  assert(result.to_int64() == 30);

  // MAC weight=7 (=-1), act=10 -> 30 + (-10) = 20
  result = pe.mac(uint3(7), int8(10));
  assert(result.to_int64() == 20);

  // MAC weight=4 (=-4), act=3 -> 20 + (-12) = 8
  result = pe.mac(uint3(4), int8(3));
  assert(result.to_int64() == 8);

  std::puts("[PASS] accumulation across multiple MACs");
}

static void test_clear() {
  MacPE pe;
  pe.mac(uint3(3), int8(100));
  assert(pe.read_accum().to_int64() == 300);

  pe.clear();
  assert(pe.read_accum().to_int64() == 0);

  // Verify MAC works after clear
  int32 result = pe.mac(uint3(2), int8(7));
  assert(result.to_int64() == 14);

  std::puts("[PASS] clear resets accumulator");
}

static void test_weight_zero_no_effect() {
  MacPE pe;
  pe.mac(uint3(3), int8(42));
  int32 before = pe.read_accum();
  pe.mac(uint3(0), int8(127));
  assert(pe.read_accum().to_int64() == before.to_int64());
  std::puts("[PASS] weight=0 does not change accumulator");
}

int main() {
  test_all_weights_act1();
  test_all_weights_act10();
  test_negative_activation();
  test_accumulation();
  test_clear();
  test_weight_zero_no_effect();
  std::puts("\nAll mac_pe tests passed.");
  return 0;
}
