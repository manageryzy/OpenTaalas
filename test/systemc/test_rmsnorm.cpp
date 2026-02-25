// test_rmsnorm — accumulate_sq, gamma, rsqrt_lut, reset
#include <rmsnorm.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
  RmsnormUnit rn;

  // --- accumulate_sq with known values ---
  rn.accumulate_sq(uint16(10));
  assert(rn.get_sum_sq() == 10);
  rn.accumulate_sq(uint16(20));
  assert(rn.get_sum_sq() == 30);
  rn.accumulate_sq(uint16(100));
  assert(rn.get_sum_sq() == 130);

  // --- reset_accum clears sum and count ---
  rn.reset_accum();
  assert(rn.get_sum_sq() == 0);

  // Accumulate after reset
  rn.accumulate_sq(uint16(50));
  assert(rn.get_sum_sq() == 50);

  // --- gamma write/read round-trip ---
  rn.set_gamma(uint16(0), uint16(0xBEEF));
  rn.set_gamma(uint16(4095), uint16(0xCAFE));
  assert(rn.get_gamma(uint16(0)) == 0xBEEF);
  assert(rn.get_gamma(uint16(4095)) == 0xCAFE);

  // --- rsqrt_lut write/read round-trip ---
  rn.set_rsqrt_lut(uint8(0), uint16(0x1234));
  rn.set_rsqrt_lut(uint8(255), uint16(0x5678));
  assert(rn.lookup_rsqrt(uint8(0)) == 0x1234);
  assert(rn.lookup_rsqrt(uint8(255)) == 0x5678);

  std::printf("PASS: test_rmsnorm\n");
  return 0;
}
