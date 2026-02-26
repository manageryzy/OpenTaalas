#pragma once
#include <cstdint>
#include <cstring>
#include <vector>
#include <string>

namespace opentaalas {

// --- FP16 / FP8 E4M3 conversion utilities ---

inline float fp16_to_float(uint16_t h) {
  uint32_t sign = (uint32_t)(h >> 15) << 31;
  uint32_t exp  = (h >> 10) & 0x1F;
  uint32_t mant = h & 0x3FF;
  uint32_t f;
  if (exp == 0) {
    if (mant == 0) { f = sign; }
    else { // subnormal
      exp = 1;
      while (!(mant & 0x400)) { mant <<= 1; exp--; }
      mant &= 0x3FF;
      f = sign | ((exp + 127 - 15) << 23) | (mant << 13);
    }
  } else if (exp == 31) {
    f = sign | 0x7F800000 | (mant << 13); // inf/nan
  } else {
    f = sign | ((exp + 127 - 15) << 23) | (mant << 13);
  }
  float result;
  std::memcpy(&result, &f, 4);
  return result;
}

// FP16 → FP8 E4M3 (lossy): 1 sign + 4 exp (bias 7) + 3 mantissa
// FP16: 1 sign + 5 exp (bias 15) + 10 mantissa
inline uint8_t fp16_to_fp8_e4m3(uint16_t h) {
  uint8_t sign = (h >> 15) & 1;
  int exp16 = (h >> 10) & 0x1F;
  uint16_t mant16 = h & 0x3FF;

  if (exp16 == 0 && mant16 == 0) return sign << 7; // zero
  if (exp16 == 31) return (sign << 7) | 0x7E;       // inf/nan → max

  // Rebias: FP16 bias=15, FP8 E4M3 bias=7, delta=-8
  int exp8 = exp16 - 15 + 7;
  // Round mantissa: 10 bits → 3 bits (drop 7, round)
  uint8_t mant8 = (mant16 + (1 << 6)) >> 7; // round to nearest
  if (mant8 > 7) { mant8 = 0; exp8++; }     // mantissa overflow

  if (exp8 <= 0) return sign << 7;           // underflow → zero
  if (exp8 >= 15) return (sign << 7) | 0x7E; // overflow → max (E4M3 max = 0x7E)

  return (sign << 7) | (exp8 << 3) | mant8;
}

inline float fp8_e4m3_to_float(uint8_t fp8) {
  uint32_t sign = (uint32_t)(fp8 >> 7) << 31;
  int exp = (fp8 >> 3) & 0xF;
  uint32_t mant = fp8 & 0x7;
  if (exp == 0 && mant == 0) { float z = 0.0f; return (fp8 & 0x80) ? -z : z; }
  // E4M3 bias=7, FP32 bias=127, delta=+120
  uint32_t f = sign | ((exp + 120) << 23) | (mant << 20);
  float result;
  std::memcpy(&result, &f, 4);
  return result;
}

// --- Converted tensor format ---

struct ConvertedTensor {
  std::string name;
  std::vector<uint8_t> weights;     // 3-bit values (0-7), one per byte
  std::vector<uint8_t> bank_scales; // FP8 E4M3, one per 16 weights (sub-block)
  float tensor_scale;               // super-block scale (FP32)
  int64_t rows;
  int64_t cols;
  bool is_quantized;                // true for Q3_K, false for F32/F16 norms
  std::vector<float> float_data;    // for non-quantized tensors (norms, etc.)
};

// Convert all tensors from a GGUF file
std::vector<ConvertedTensor> convert_gguf(const std::string& gguf_path);

// Save converted tensors to a directory (one file per tensor)
void save_converted(const std::vector<ConvertedTensor>& tensors, const std::string& output_dir);

// Load a single converted tensor
ConvertedTensor load_converted_tensor(const std::string& dir, const std::string& name);

} // namespace opentaalas
