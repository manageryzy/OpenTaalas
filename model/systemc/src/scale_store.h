#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class ScaleStore {
 public:
  ScaleStore() {
    for (int i = 0; i < 32; ++i) _bank_scales[i] = 0;
    for (int i = 0; i < 8; ++i) _tensor_scales[i] = 0;
  }

  uint8 get_bank_scale(uint5 bank_id) const {
    return _bank_scales[bank_id.to_int()];
  }

  void set_bank_scale(uint5 bank_id, uint8 value) {
    _bank_scales[bank_id.to_int()] = value;
  }

  uint32 get_tensor_scale(uint3 matrix_id) const {
    return _tensor_scales[matrix_id.to_int()];
  }

  void set_tensor_scale(uint3 matrix_id, uint32 value) {
    _tensor_scales[matrix_id.to_int()] = value;
  }

 private:
  uint8 _bank_scales[32];
  uint32 _tensor_scales[8];
};

}  // namespace opentaalas
