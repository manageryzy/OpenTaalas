#pragma once
#include <opentaalas/types.h>
#include <vector>
#include <limits>

namespace opentaalas {

// LM Head — final projection + argmax.
// Weights stored as BF16 (output.weight is typically Q6_K or F16, not IQ3_S).
// Argmax uses FP32 scores (from dequantized MAC output).
template <int VOCAB = 1024, int DIM = 4096>
class LmHead {
 public:
  LmHead()
      : _weights(static_cast<size_t>(VOCAB) * DIM, uint16(0)),
        _best_score(-std::numeric_limits<float>::infinity()),
        _best_token(0) {
    for (int i = 0; i < DIM; ++i) _gamma[i] = 0;
    for (int i = 0; i < 256; ++i) _rsqrt_lut[i] = 0;
  }

  uint16 read_weight(uint17 output_idx, uint12 dim_idx) const {
    return _weights[static_cast<size_t>(output_idx.to_int()) * DIM +
                    dim_idx.to_int()];
  }

  void write_weight(uint17 output_idx, uint12 dim_idx, uint16 value) {
    _weights[static_cast<size_t>(output_idx.to_int()) * DIM +
             dim_idx.to_int()] = value;
  }

  void set_gamma(uint16 index, uint16 value) {
    _gamma[index.to_int()] = value;
  }
  uint16 get_gamma(uint16 index) const { return _gamma[index.to_int()]; }

  void set_rsqrt_lut(uint8 index, uint16 value) {
    _rsqrt_lut[index.to_int()] = value;
  }

  void update_argmax(uint17 token_idx, float score) {
    if (score > _best_score) {
      _best_score = score;
      _best_token = token_idx;
    }
  }

  uint17 get_best_token() const { return _best_token; }

  void reset_argmax() {
    _best_score = -std::numeric_limits<float>::infinity();
    _best_token = 0;
  }

 private:
  std::vector<uint16> _weights;
  uint16 _gamma[DIM];
  uint16 _rsqrt_lut[256];
  float _best_score;
  uint17 _best_token;
};

}  // namespace opentaalas
