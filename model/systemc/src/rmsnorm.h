#pragma once
#include <opentaalas/types.h>
#include <bf16_math.h>
#include <array>

namespace opentaalas {

class RmsnormUnit {
  uint32 _sum_sq = 0;
  uint16 _count = 0;
  std::array<uint16, 4096> _gamma{};
  std::array<uint16, 256> _rsqrt_lut{};

public:
  void accumulate_sq(uint16 x) {
    uint16 x_sq = bf16_mul(x, x);
    _sum_sq = _sum_sq + uint32(x_sq);
    _count = _count + 1;
  }

  uint32 get_sum_sq() const { return _sum_sq; }

  void reset_accum() {
    _sum_sq = 0;
    _count = 0;
  }

  void set_gamma(uint16 index, uint16 value) { _gamma[static_cast<int>(index)] = value; }
  uint16 get_gamma(uint16 index) const { return _gamma[static_cast<int>(index)]; }

  void set_rsqrt_lut(uint8 index, uint16 value) { _rsqrt_lut[static_cast<int>(index)] = value; }
  uint16 lookup_rsqrt(uint8 index) const { return _rsqrt_lut[static_cast<int>(index)]; }
};

} // namespace opentaalas
