// test_rope — RopeUnit<32,8> cos/sin tables, address calc, rotate_pair stub
#include <rope.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
  RopeUnit<32, 8> rope;

  // --- cos/sin table write/read round-trip ---
  rope.set_cos(uint12(0), uint6(0), uint16(0x3F80));
  rope.set_sin(uint12(0), uint6(0), uint16(0x0000));
  assert(rope.get_cos(uint12(0), uint6(0)) == 0x3F80);
  assert(rope.get_sin(uint12(0), uint6(0)) == 0x0000);

  // Different position and freq
  rope.set_cos(uint12(31), uint6(7), uint16(0xBEEF));
  rope.set_sin(uint12(31), uint6(7), uint16(0xCAFE));
  assert(rope.get_cos(uint12(31), uint6(7)) == 0xBEEF);
  assert(rope.get_sin(uint12(31), uint6(7)) == 0xCAFE);

  // --- Address calculation: non-interference ---
  rope.set_cos(uint12(1), uint6(0), uint16(0x1111));
  rope.set_cos(uint12(0), uint6(1), uint16(0x2222));
  assert(rope.get_cos(uint12(1), uint6(0)) == 0x1111);
  assert(rope.get_cos(uint12(0), uint6(1)) == 0x2222);
  // Original entry still intact
  assert(rope.get_cos(uint12(0), uint6(0)) == 0x3F80);

  // --- rotate_pair returns x_even (stub) ---
  uint16 result = rope.rotate_pair(
      uint16(0xAAAA), uint16(0xBBBB), uint16(0xCCCC), uint16(0xDDDD));
  assert(result == 0xAAAA);

  std::printf("PASS: test_rope\n");
  return 0;
}
