// test_mac_pe.cpp — Tests for IQ3_S codebook MAC Processing Element
// New interface: mac(uint4 magnitude, uint1 sign, int8 activation) → int24
// Magnitudes are from codebook: {1,3,5,7,9,11,13,15} = (2k+1) where k=0..7
#include <mac_pe.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_all_magnitudes_positive() {
  // magnitude × activation with sign=0 (positive)
  // mag=1: 1×10=10, mag=3: 3×10=30, ..., mag=15: 15×10=150
  const int mags[] = {1, 3, 5, 7, 9, 11, 13, 15};
  for (int m : mags) {
    MacPE pe;
    int24 result = pe.mac(uint4(m), uint1(0), int8(10));
    assert(result.to_int64() == m * 10);
  }
  std::puts("[PASS] all magnitudes with positive sign, act=10");
}

static void test_all_magnitudes_negative() {
  // sign=1 negates the product
  const int mags[] = {1, 3, 5, 7, 9, 11, 13, 15};
  for (int m : mags) {
    MacPE pe;
    int24 result = pe.mac(uint4(m), uint1(1), int8(10));
    assert(result.to_int64() == -(m * 10));
  }
  std::puts("[PASS] all magnitudes with negative sign, act=10");
}

static void test_negative_activation() {
  // mag=5, sign=0, act=-7: product = 5 × (-7) = -35
  MacPE pe;
  int24 result = pe.mac(uint4(5), uint1(0), int8(-7));
  assert(result.to_int64() == -35);

  // mag=5, sign=1, act=-7: product = -(5 × (-7)) = 35
  MacPE pe2;
  int24 result2 = pe2.mac(uint4(5), uint1(1), int8(-7));
  assert(result2.to_int64() == 35);
  std::puts("[PASS] negative activation");
}

static void test_accumulation_32_weights() {
  // Simulate a 32-weight sub-block: all mag=1, sign=0, act=1
  // Expected: 32 × 1 × 1 = 32
  MacPE pe;
  for (int i = 0; i < 32; ++i)
    pe.mac(uint4(1), uint1(0), int8(1));
  assert(pe.read_accum().to_int64() == 32);
  std::puts("[PASS] accumulation over 32 weights");
}

static void test_worst_case_accumulation() {
  // Worst case: 32 × mag=15 × act=127 = 60960
  MacPE pe;
  for (int i = 0; i < 32; ++i)
    pe.mac(uint4(15), uint1(0), int8(127));
  assert(pe.read_accum().to_int64() == 60960);
  // Fits in INT24 (max 8388607)
  std::puts("[PASS] worst case accumulation (60960 fits INT24)");
}

static void test_clear() {
  MacPE pe;
  pe.mac(uint4(15), uint1(0), int8(100));
  assert(pe.read_accum().to_int64() == 1500);
  pe.clear();
  assert(pe.read_accum().to_int64() == 0);
  pe.mac(uint4(3), uint1(0), int8(7));
  assert(pe.read_accum().to_int64() == 21);
  std::puts("[PASS] clear resets accumulator");
}

static void test_shift_and_add_correctness() {
  // Verify (2k+1)×a = (k<<1)×a + a for all k=0..7
  MacPE pe;
  for (int k = 0; k < 8; ++k) {
    int mag = 2 * k + 1;
    for (int a : {1, -1, 42, -128, 127}) {
      pe.clear();
      int24 result = pe.mac(uint4(mag), uint1(0), int8(a));
      assert(result.to_int64() == mag * a);
    }
  }
  std::puts("[PASS] shift-and-add matches mag×act for all k");
}

int main() {
  test_all_magnitudes_positive();
  test_all_magnitudes_negative();
  test_negative_activation();
  test_accumulation_32_weights();
  test_worst_case_accumulation();
  test_clear();
  test_shift_and_add_correctness();
  std::puts("\nAll mac_pe tests passed.");
  return 0;
}
