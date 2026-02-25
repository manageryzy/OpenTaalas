#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class LutUnit {
 public:
  LutUnit() {
    for (int i = 0; i < 256; ++i) _table[i] = 0;
  }

  void set_entry(uint8 index, uint16 value) {
    _table[index.to_int()] = value;
  }

  uint16 get_entry(uint8 index) const { return _table[index.to_int()]; }

  uint16 lookup(uint16 input) const {
    int index = (input.to_int() >> 8) & 0xFF;
    int frac = input.to_int() & 0xFF;
    if (frac < 128) {
      return _table[index];
    }
    int next = (index < 255) ? index + 1 : 255;
    return _table[next];
  }

 private:
  uint16 _table[256];
};

}  // namespace opentaalas
