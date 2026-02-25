#pragma once
#include <opentaalas/types.h>
#include <vector>

namespace opentaalas {

template <int ROWS = 4096, int COLS = 8192>
class RomBank {
 public:
  RomBank() : _data(static_cast<size_t>(ROWS) * COLS, uint3(0)) {}

  uint3 read_weight(uint12 row_addr, uint13 col_addr) const {
    return _data[static_cast<size_t>(row_addr.to_int()) * COLS +
                 col_addr.to_int()];
  }

  void write_weight(uint12 row_addr, uint13 col_addr, uint3 value) {
    _data[static_cast<size_t>(row_addr.to_int()) * COLS +
          col_addr.to_int()] = value;
  }

 private:
  std::vector<uint3> _data;
};

}  // namespace opentaalas
