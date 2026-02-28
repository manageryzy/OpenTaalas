// test_rmsnorm — accumulate_sq, gamma, rsqrt_lut, reset
#include <rmsnorm.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
  RmsnormUnit rn;

  // --- accumulate_sq with BF16 values (squares before accumulating) ---
  // BF16(1.0)=0x3F80, squared=BF16(1.0)=0x3F80
  rn.accumulate_sq(uint16(0x3F80));
  assert(rn.get_sum_sq() == 0x3F80);
  // BF16(2.0)=0x4000, squared=BF16(4.0)=0x4080
  rn.accumulate_sq(uint16(0x4000));
  assert(rn.get_sum_sq() == 0x3F80 + 0x4080);
  // BF16(0.5)=0x3F00, squared=BF16(0.25)=0x3E80
  rn.accumulate_sq(uint16(0x3F00));
  assert(rn.get_sum_sq() == 0x3F80 + 0x4080 + 0x3E80);

  // --- reset_accum clears sum and count ---
  rn.reset_accum();
  assert(rn.get_sum_sq() == 0);

  // Accumulate after reset: BF16(3.0)=0x4040, squared=BF16(9.0)=0x4110
  rn.accumulate_sq(uint16(0x4040));
  assert(rn.get_sum_sq() == 0x4110);

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
