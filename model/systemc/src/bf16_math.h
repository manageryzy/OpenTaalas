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

// RTL-matching BF16 add: bit-accurate with vector_unit.k residual_add
inline uint16 bf16_add(uint16 a_bf16, uint16 b_bf16) {
  uint16_t a = a_bf16.to_uint64(), b = b_bf16.to_uint64();
  uint16_t a_exp = (a >> 7) & 0xFF;
  uint16_t b_exp = (b >> 7) & 0xFF;
  uint16_t a_sign = (a >> 15) & 1;
  uint16_t b_sign = (b >> 15) & 1;

  if (a_exp == 0) return b_bf16;
  if (b_exp == 0) return a_bf16;

  uint16_t a_mant = (a & 0x7F) | 0x80;
  uint16_t b_mant = (b & 0x7F) | 0x80;

  uint16_t r_exp, aligned_a, aligned_b;
  if (a_exp >= b_exp) {
    r_exp = a_exp;
    aligned_a = a_mant << 4;
    uint16_t shift = a_exp - b_exp;
    if (shift > 12) shift = 12;
    aligned_b = b_mant << 4;
    if (shift & 8) aligned_b >>= 8;
    if (shift & 4) aligned_b >>= 4;
    if (shift & 2) aligned_b >>= 2;
    if (shift & 1) aligned_b >>= 1;
  } else {
    r_exp = b_exp;
    aligned_b = b_mant << 4;
    uint16_t shift = b_exp - a_exp;
    if (shift > 12) shift = 12;
    aligned_a = a_mant << 4;
    if (shift & 8) aligned_a >>= 8;
    if (shift & 4) aligned_a >>= 4;
    if (shift & 2) aligned_a >>= 2;
    if (shift & 1) aligned_a >>= 1;
  }

  uint16_t r_sign, sum;
  if (a_sign == b_sign) {
    r_sign = a_sign;
    sum = aligned_a + aligned_b;
  } else {
    if (aligned_a >= aligned_b) {
      r_sign = a_sign;
      sum = aligned_a - aligned_b;
    } else {
      r_sign = b_sign;
      sum = aligned_b - aligned_a;
    }
  }

  if (sum == 0) return uint16(0);

  // Find leading 1 position
  uint16_t pos = 0, tmp = sum;
  if (tmp & 0xFF00) { tmp >>= 8; pos += 8; }
  if (tmp & 0xF0)   { tmp >>= 4; pos += 4; }
  if (tmp & 0xC)    { tmp >>= 2; pos += 2; }
  if (tmp & 0x2)    { pos += 1; }

  uint16_t norm_exp, r_mant;
  if (pos > 11) {
    norm_exp = r_exp + (pos - 11);
    r_mant = (sum >> (pos - 7)) & 0x7F;
  } else if (pos < 11) {
    uint16_t diff = 11 - pos;
    norm_exp = (diff >= r_exp) ? 0 : r_exp - diff;
    uint16_t shifted = sum;
    if (diff & 8) shifted <<= 8;
    if (diff & 4) shifted <<= 4;
    if (diff & 2) shifted <<= 2;
    if (diff & 1) shifted <<= 1;
    r_mant = (shifted >> 4) & 0x7F;
  } else {
    norm_exp = r_exp;
    r_mant = (sum >> 4) & 0x7F;
  }

  if (norm_exp == 0 || norm_exp >= 255) return uint16(0);
  return uint16((r_sign << 15) | (norm_exp << 7) | r_mant);
}

inline uint16 bf16_sub(uint16 a, uint16 b) {
  return bf16_add(a, uint16(b.to_uint64() ^ 0x8000));
}

// RTL-matching BF16 multiply: bit-accurate with vector_unit.k swiglu_compute
// 8-bit mantissa shift-and-add, truncating (no rounding)
inline uint16 bf16_mul(uint16 a_bf16, uint16 b_bf16) {
  uint16_t a = a_bf16.to_uint64(), b = b_bf16.to_uint64();
  uint16_t a_exp = (a >> 7) & 0xFF;
  uint16_t b_exp = (b >> 7) & 0xFF;
  if (a_exp == 0 || b_exp == 0) return uint16(0);

  uint16_t r_sign = ((a >> 15) ^ (b >> 15)) & 1;
  uint16_t ma = (a & 0x7F) | 0x80;
  uint16_t mb = (b & 0x7F) | 0x80;

  uint32_t prod = 0;
  uint32_t ma32 = ma;
  if (mb & 1)   prod += ma32;
  if (mb & 2)   prod += ma32 << 1;
  if (mb & 4)   prod += ma32 << 2;
  if (mb & 8)   prod += ma32 << 3;
  if (mb & 16)  prod += ma32 << 4;
  if (mb & 32)  prod += ma32 << 5;
  if (mb & 64)  prod += ma32 << 6;
  if (mb & 128) prod += ma32 << 7;

  uint16_t r_mant, r_exp;
  if (prod & 0x8000) {
    r_mant = (prod >> 8) & 0x7F;
    r_exp = a_exp + b_exp - 127 + 1;
  } else {
    r_mant = (prod >> 7) & 0x7F;
    r_exp = a_exp + b_exp - 127;
  }

  if (r_exp == 0 || r_exp >= 255) return uint16(0);
  return uint16((r_sign << 15) | (r_exp << 7) | r_mant);
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
