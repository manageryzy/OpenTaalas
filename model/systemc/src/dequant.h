#pragma once
#include <opentaalas/types.h>
#include <cstdint>

namespace opentaalas {

class DequantUnit {
 public:
  uint16 dequantize(uint32 accum, uint8 bank_scale_fp8,
                    uint32 tensor_scale_fp32) const {
    auto acc = static_cast<std::uint32_t>(accum.to_int64());
    std::uint32_t sign = (acc >> 31) & 1u;

    auto fp8 = static_cast<std::uint32_t>(bank_scale_fp8.to_int());
    std::uint32_t fp8_sign = (fp8 >> 7) & 1u;
    std::uint32_t fp8_exp = (fp8 >> 3) & 0xFu;
    std::uint32_t fp8_mant = fp8 & 0x7u;
    std::uint32_t fp32_exp = fp8_exp + 120u;
    std::uint32_t fp32_scale =
        (fp8_sign << 31) | (fp32_exp << 23) | (fp8_mant << 20);

    std::uint32_t combined = (sign << 31) | (fp32_scale & 0x7FFFFFFFu);
    auto result = static_cast<std::uint16_t>(combined >> 16);

    return uint16(result);
  }
};

}  // namespace opentaalas
