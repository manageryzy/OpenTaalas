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

// FP16 → BF16 conversion (no subnormals — FTZ)
// FP16: 1 sign + 5 exp (bias 15) + 10 mantissa
// BF16: 1 sign + 8 exp (bias 127) + 7 mantissa
inline uint16 fp16_to_bf16(uint16_t fp16_bits) {
  uint16_t sign = (fp16_bits >> 15) & 1;
  uint16_t exp  = (fp16_bits >> 10) & 0x1F;
  uint16_t mant = fp16_bits & 0x3FF;
  if (exp == 0) return uint16(sign << 15);  // FTZ: subnormal → ±0
  uint16_t bf16_exp = exp + 112;  // bias adjust: 127 - 15 = 112
  uint16_t bf16_mant = mant >> 3; // 10-bit → 7-bit (truncate)
  return uint16((sign << 15) | (bf16_exp << 7) | bf16_mant);
}

// FP32 flush-to-zero: if exponent is 0, return ±0
inline float fp32_ftz(float f) {
  uint32_t bits;
  std::memcpy(&bits, &f, 4);
  if (((bits >> 23) & 0xFF) == 0) {
    bits &= 0x80000000u;  // preserve sign, zero rest
    std::memcpy(&f, &bits, 4);
  }
  return f;
}

// INT24 → FP32 conversion (FTZ)
inline float int24_to_fp32_ftz(int32_t val) {
  return fp32_ftz(static_cast<float>(val));
}

}  // namespace opentaalas
