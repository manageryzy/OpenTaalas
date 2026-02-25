#pragma once
#include <opentaalas/types.h>
#include <bf16_math.h>
#include <vector>

namespace opentaalas {

template <int POSITIONS = 4096, int FREQ_PAIRS = 64>
class RopeUnit {
  std::vector<uint16> _cos_table;
  std::vector<uint16> _sin_table;

  int addr(uint12 position, uint6 freq_idx) const {
    return static_cast<int>(position) * FREQ_PAIRS + static_cast<int>(freq_idx);
  }

public:
  RopeUnit() : _cos_table(POSITIONS * FREQ_PAIRS, uint16(0)),
               _sin_table(POSITIONS * FREQ_PAIRS, uint16(0)) {}

  void set_cos(uint12 position, uint6 freq_idx, uint16 value) {
    _cos_table[addr(position, freq_idx)] = value;
  }
  void set_sin(uint12 position, uint6 freq_idx, uint16 value) {
    _sin_table[addr(position, freq_idx)] = value;
  }
  uint16 get_cos(uint12 position, uint6 freq_idx) const {
    return _cos_table[addr(position, freq_idx)];
  }
  uint16 get_sin(uint12 position, uint6 freq_idx) const {
    return _sin_table[addr(position, freq_idx)];
  }

  uint16 rotate_pair(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) {
    return bf16_add(bf16_mul(x_even, cos_val), bf16_neg(bf16_mul(x_odd, sin_val)));
  }

  uint16 rotate_pair_odd(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) const {
    return bf16_add(bf16_mul(x_even, sin_val), bf16_mul(x_odd, cos_val));
  }
};

} // namespace opentaalas
