// bf16_math.h — BF16 (bfloat16) arithmetic using ac_int<16,false> storage
#pragma once
#include <opentaalas/types.h>
#include <cmath>
#include <cstring>

namespace opentaalas {

inline uint16 bf16_from_float(float f) {
  uint32_t bits;
  std::memcpy(&bits, &f, 4);
  bits += 0x7FFF + ((bits >> 16) & 1);
  return uint16(static_cast<uint16_t>(bits >> 16));
}

inline float bf16_to_float(uint16 bf16) {
  uint32_t bits = static_cast<uint32_t>(bf16.to_uint64()) << 16;
  float f;
  std::memcpy(&f, &bits, 4);
  return f;
}

inline uint16 bf16_add(uint16 a, uint16 b) {
  return bf16_from_float(bf16_to_float(a) + bf16_to_float(b));
}

inline uint16 bf16_sub(uint16 a, uint16 b) {
  return bf16_from_float(bf16_to_float(a) - bf16_to_float(b));
}

inline uint16 bf16_mul(uint16 a, uint16 b) {
  return bf16_from_float(bf16_to_float(a) * bf16_to_float(b));
}

inline uint16 bf16_neg(uint16 a) {
  return uint16(a.to_uint64() ^ 0x8000);
}

inline uint16 bf16_abs(uint16 a) {
  return uint16(a.to_uint64() & 0x7FFF);
}

inline uint16 bf16_rsqrt(uint16 a) {
  return bf16_from_float(1.0f / std::sqrt(bf16_to_float(a)));
}

inline uint16 bf16_div(uint16 a, uint16 b) {
  return bf16_from_float(bf16_to_float(a) / bf16_to_float(b));
}

inline bool bf16_gt(uint16 a, uint16 b) {
  return bf16_to_float(a) > bf16_to_float(b);
}

inline uint16 bf16_zero() { return bf16_from_float(0.0f); }
inline uint16 bf16_one()  { return bf16_from_float(1.0f); }

}  // namespace opentaalas
