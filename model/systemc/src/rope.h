#pragma once
#include <opentaalas/types.h>
#include <array>
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

  // Wide-word row access (matches RTL 1024-bit interface)
  std::array<uint16_t, 64> read_cos_row(int position) const {
    std::array<uint16_t, 64> row;
    for (int f = 0; f < FREQ_PAIRS; f++)
      row[f] = _cos_table[position * FREQ_PAIRS + f].to_uint64();
    return row;
  }
  std::array<uint16_t, 64> read_sin_row(int position) const {
    std::array<uint16_t, 64> row;
    for (int f = 0; f < FREQ_PAIRS; f++)
      row[f] = _sin_table[position * FREQ_PAIRS + f].to_uint64();
    return row;
  }
  void write_cos_row(int position, const std::array<uint16_t, 64>& row) {
    for (int f = 0; f < FREQ_PAIRS; f++)
      _cos_table[position * FREQ_PAIRS + f] = uint16(row[f]);
  }
  void write_sin_row(int position, const std::array<uint16_t, 64>& row) {
    for (int f = 0; f < FREQ_PAIRS; f++)
      _sin_table[position * FREQ_PAIRS + f] = uint16(row[f]);
  }

  uint16 rotate_pair(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) {
    return bf16_add(bf16_mul(x_even, cos_val), bf16_neg(bf16_mul(x_odd, sin_val)));
  }

  uint16 rotate_pair_odd(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val) const {
    return bf16_add(bf16_mul(x_even, sin_val), bf16_mul(x_odd, cos_val));
  }
};

} // namespace opentaalas
