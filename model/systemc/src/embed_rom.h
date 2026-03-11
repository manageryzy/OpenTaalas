#pragma once
#include <opentaalas/types.h>
#include <array>
#include <cstdint>
#include <vector>

namespace opentaalas {

// Embedding ROM — stores 3-bit weights per (token, dim).
// Chunked access: 64 dims per 192-bit chunk, 64 chunks per token.
template <int VOCAB = 1024, int DIM = 4096>
class EmbedRom {
  static constexpr int DIMS_PER_CHUNK = 64;
  static constexpr int CHUNKS_PER_TOKEN = DIM / DIMS_PER_CHUNK;
  static constexpr int TOTAL_CHUNKS = VOCAB * CHUNKS_PER_TOKEN;

 public:
  EmbedRom() : _chunks(TOTAL_CHUNKS) {}

  // Read a 192-bit chunk as 24 bytes (64 × 3-bit weights packed)
  std::array<uint8_t, 24> read_chunk_bytes(int addr) const {
    return _chunks[addr];
  }

  // Write a 192-bit chunk
  void write_chunk_bytes(int addr, const std::array<uint8_t, 24>& data) {
    _chunks[addr] = data;
  }

  // Extract a single 3-bit weight from a chunk
  static uint8_t extract_weight(const std::array<uint8_t, 24>& chunk, int dim_in_chunk) {
    int bit_offset = dim_in_chunk * 3;
    int byte_idx = bit_offset / 8;
    int bit_idx = bit_offset % 8;
    uint16_t two_bytes = chunk[byte_idx];
    if (byte_idx + 1 < 24) two_bytes |= ((uint16_t)chunk[byte_idx + 1]) << 8;
    return (two_bytes >> bit_idx) & 0x7;
  }

  // Per-element read for backward compatibility
  uint8_t read_weight(int token_id, int dim_idx) const {
    int chunk_addr = token_id * CHUNKS_PER_TOKEN + dim_idx / DIMS_PER_CHUNK;
    int dim_in_chunk = dim_idx % DIMS_PER_CHUNK;
    return extract_weight(_chunks[chunk_addr], dim_in_chunk);
  }

 private:
  std::vector<std::array<uint8_t, 24>> _chunks;
};

}  // namespace opentaalas
