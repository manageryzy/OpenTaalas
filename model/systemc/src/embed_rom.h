#pragma once
#include <opentaalas/types.h>
#include <vector>

namespace opentaalas {

template <int VOCAB = 1024, int DIM = 4096>
class EmbedRom {
 public:
  EmbedRom()
      : _embeddings(static_cast<size_t>(VOCAB) * DIM, uint3(0)),
        _bank_scale(0),
        _tensor_scale(0) {}

  uint3 read_weight(uint17 token_id, uint12 dim_idx) const {
    return _embeddings[static_cast<size_t>(token_id.to_int()) * DIM +
                       dim_idx.to_int()];
  }

  void write_weight(uint17 token_id, uint12 dim_idx, uint3 value) {
    _embeddings[static_cast<size_t>(token_id.to_int()) * DIM +
                dim_idx.to_int()] = value;
  }

  void set_bank_scale(uint8 value) { _bank_scale = value; }
  uint8 get_bank_scale() const { return _bank_scale; }

  void set_tensor_scale(uint32 value) { _tensor_scale = value; }
  uint32 get_tensor_scale() const { return _tensor_scale; }

 private:
  std::vector<uint3> _embeddings;
  uint8 _bank_scale;
  uint32 _tensor_scale;
};

}  // namespace opentaalas
