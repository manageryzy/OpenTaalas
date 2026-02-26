#pragma once
#include <opentaalas/types.h>
#include <bf16_math.h>
#include <cstdint>
#include <cstring>

namespace opentaalas {

// IQ3_S Dequantization Unit
// Converts INT24 accumulator to FP32 using BF16 super-scale and 4-bit sub-scale.
// Formula: result = accum × (1 + 2×sub_scale) × bf16_to_fp32(super_scale)
// No subnormal support (FTZ).
class DequantUnit {
 public:
  float dequantize(int24 accum, uint16 super_scale_bf16, uint4 sub_scale) const {
    // Step 1: Integer sub-scale multiplier: 1, 3, 5, ..., 31
    int32_t int_scale = 1 + 2 * sub_scale.to_int();

    // Step 2: Scale the accumulator (INT24 × 5-bit → fits INT32)
    int32_t scaled = static_cast<int32_t>(accum.to_int64()) * int_scale;

    // Step 3: Convert to FP32 (FTZ)
    float fp_accum = static_cast<float>(scaled);

    // Step 4: Expand BF16 super-scale to FP32
    float d = bf16_to_float(super_scale_bf16);

    // Step 5: FP32 multiply (no subnormals)
    float result = fp_accum * d;

    // FTZ: flush subnormal result to zero
    uint32_t bits;
    std::memcpy(&bits, &result, 4);
    if (((bits >> 23) & 0xFF) == 0) result = 0.0f;

    return result;
  }
};

}  // namespace opentaalas
