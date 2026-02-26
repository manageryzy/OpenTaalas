// test_rope — RopeUnit<32,8> cos/sin tables, address calc, rotate_pair with BF16 math
#include <rope.h>
#include <bf16_math.h>
#include <cassert>
#include <cstdio>
#include <cmath>

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

  // --- rotate_pair: x_even*cos - x_odd*sin ---
  // cos=1.0, sin=0.0 => result = x_even*1 - x_odd*0 = x_even
  uint16 x_even = bf16_from_float(2.0f);
  uint16 x_odd  = bf16_from_float(3.0f);
  uint16 cos_v  = bf16_from_float(1.0f);
  uint16 sin_v  = bf16_from_float(0.0f);
  uint16 result = rope.rotate_pair(x_even, x_odd, cos_v, sin_v);
  float result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 2.0f) < 0.05f);

  // cos=0.0, sin=1.0 => result = x_even*0 - x_odd*1 = -3.0
  cos_v = bf16_from_float(0.0f);
  sin_v = bf16_from_float(1.0f);
  result = rope.rotate_pair(x_even, x_odd, cos_v, sin_v);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - (-3.0f)) < 0.1f);

  // cos=0.5, sin=0.5 => result = 2*0.5 - 3*0.5 = 1.0 - 1.5 = -0.5
  cos_v = bf16_from_float(0.5f);
  sin_v = bf16_from_float(0.5f);
  result = rope.rotate_pair(x_even, x_odd, cos_v, sin_v);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - (-0.5f)) < 0.1f);

  // --- rotate_pair_odd: x_even*sin + x_odd*cos ---
  // cos=1.0, sin=0.0 => result = x_even*0 + x_odd*1 = 3.0
  cos_v = bf16_from_float(1.0f);
  sin_v = bf16_from_float(0.0f);
  result = rope.rotate_pair_odd(x_even, x_odd, cos_v, sin_v);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 3.0f) < 0.05f);

  // cos=0.0, sin=1.0 => result = x_even*1 + x_odd*0 = 2.0
  cos_v = bf16_from_float(0.0f);
  sin_v = bf16_from_float(1.0f);
  result = rope.rotate_pair_odd(x_even, x_odd, cos_v, sin_v);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 2.0f) < 0.05f);

  std::printf("PASS: test_rope\n");
  return 0;
}
