// test_codebook_decoder.cpp — Tests for IQ3_S 512-entry codebook decoder
#include <codebook_decoder.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_first_entry() {
  // iq3s_grid[0] = 0x01010101 → magnitudes (1, 1, 1, 1)
  CodebookDecoder dec;
  uint4 m0, m1, m2, m3;
  dec.decode(uint9(0), m0, m1, m2, m3);
  assert(m0.to_int() == 1);
  assert(m1.to_int() == 1);
  assert(m2.to_int() == 1);
  assert(m3.to_int() == 1);
  std::puts("[PASS] first codebook entry (0x01010101)");
}

static void test_second_entry() {
  // iq3s_grid[1] = 0x01010103 → magnitudes (3, 1, 1, 1)
  CodebookDecoder dec;
  uint4 m0, m1, m2, m3;
  dec.decode(uint9(1), m0, m1, m2, m3);
  assert(m0.to_int() == 3);
  assert(m1.to_int() == 1);
  assert(m2.to_int() == 1);
  assert(m3.to_int() == 1);
  std::puts("[PASS] second codebook entry (0x01010103)");
}

static void test_all_entries_valid_magnitudes() {
  // All magnitudes must be odd and in {1,3,5,7,9,11,13,15}
  CodebookDecoder dec;
  for (int i = 0; i < 512; ++i) {
    uint4 m0, m1, m2, m3;
    dec.decode(uint9(i), m0, m1, m2, m3);
    for (int m : {m0.to_int(), m1.to_int(), m2.to_int(), m3.to_int()}) {
      assert(m >= 0 && m <= 15);
      assert(m % 2 == 1);  // all codebook values are odd
    }
  }
  std::puts("[PASS] all 512 entries have valid odd magnitudes");
}

static void test_known_entry_511() {
  // Last entry: iq3s_grid[511] — verify it decodes without crash
  CodebookDecoder dec;
  uint4 m0, m1, m2, m3;
  dec.decode(uint9(511), m0, m1, m2, m3);
  // Just verify all are odd and in range
  for (int m : {m0.to_int(), m1.to_int(), m2.to_int(), m3.to_int()}) {
    assert(m % 2 == 1 && m >= 1 && m <= 15);
  }
  std::puts("[PASS] last codebook entry (index 511)");
}

int main() {
  test_first_entry();
  test_second_entry();
  test_all_entries_valid_magnitudes();
  test_known_entry_511();
  std::puts("\nAll codebook_decoder tests passed.");
  return 0;
}
