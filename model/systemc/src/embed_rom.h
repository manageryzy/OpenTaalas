#pragma once
#include <opentaalas/types.h>
#include <vector>

namespace opentaalas {

// Embedding ROM — stores BF16 embedding vectors per token.
// In IQ3_S, the token embedding table is typically F16/F32 (not quantized).
template <int VOCAB = 1024, int DIM = 4096>
class EmbedRom {
 public:
  EmbedRom()
      : _embeddings(static_cast<size_t>(VOCAB) * DIM, uint16(0)) {}

  uint16 read_weight(uint17 token_id, uint12 dim_idx) const {
    return _embeddings[static_cast<size_t>(token_id.to_int()) * DIM +
                       dim_idx.to_int()];
  }

  void write_weight(uint17 token_id, uint12 dim_idx, uint16 value) {
    _embeddings[static_cast<size_t>(token_id.to_int()) * DIM +
                dim_idx.to_int()] = value;
  }

 private:
  std::vector<uint16> _embeddings;
};

}  // namespace opentaalas
