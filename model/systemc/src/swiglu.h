#pragma once
#include <opentaalas/types.h>
#include <bf16_math.h>
#include <array>

namespace opentaalas {

class SwigluUnit {
  std::array<uint16, 256> _sigmoid_lut{};

public:
  void set_sigmoid_lut(uint8 index, uint16 value) {
    _sigmoid_lut[static_cast<int>(index)] = value;
  }

  uint16 lookup_sigmoid(uint8 index) const {
    return _sigmoid_lut[static_cast<int>(index)];
  }

  uint16 compute_silu(uint16 gate_bf16) {
    uint8 index = uint8(gate_bf16 >> 8);
    uint16 sigmoid = _sigmoid_lut[static_cast<int>(index)];
    return bf16_mul(gate_bf16, sigmoid);
  }

  uint16 compute_swiglu(uint16 gate_bf16, uint16 up_bf16) {
    return bf16_mul(compute_silu(gate_bf16), up_bf16);
  }
};

} // namespace opentaalas
