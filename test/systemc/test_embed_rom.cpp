// test_embed_rom.cpp — EmbedRom reference model tests (chunk-based API)
#include "embed_rom.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

// Pack 64 3-bit weights into 24 bytes
static std::array<uint8_t, 24> pack_weights(const uint8_t* weights, int count) {
  std::array<uint8_t, 24> bytes{};
  for (int i = 0; i < count && i < 64; i++) {
    int bit_offset = i * 3;
    int byte_idx = bit_offset / 8;
    int bit_idx = bit_offset % 8;
    bytes[byte_idx] |= (weights[i] & 0x7) << bit_idx;
    if (bit_idx > 5 && byte_idx + 1 < 24)
      bytes[byte_idx + 1] |= (weights[i] & 0x7) >> (8 - bit_idx);
  }
  return bytes;
}

static void test_chunk_roundtrip() {
  EmbedRom<64, 64> rom;  // 64 tokens, 64 dims (1 chunk per token)

  uint8_t weights[64];
  for (int i = 0; i < 64; i++) weights[i] = i % 8;
  auto chunk = pack_weights(weights, 64);

  // token 3, chunk 0 → addr = 3
  rom.write_chunk_bytes(3, chunk);
  auto readback = rom.read_chunk_bytes(3);
  for (int i = 0; i < 64; i++) {
    uint8_t got = EmbedRom<64, 64>::extract_weight(readback, i);
    assert(got == (uint8_t)(i % 8));
  }
  std::printf("  PASS chunk_roundtrip\n");
}

static void test_per_element_read() {
  EmbedRom<64, 64> rom;

  uint8_t weights[64];
  for (int i = 0; i < 64; i++) weights[i] = (i + 3) % 8;
  auto chunk = pack_weights(weights, 64);
  rom.write_chunk_bytes(5, chunk);  // token 5

  for (int i = 0; i < 64; i++) {
    assert(rom.read_weight(5, i) == (uint8_t)((i + 3) % 8));
  }
  std::printf("  PASS per_element_read\n");
}

static void test_different_tokens() {
  EmbedRom<64, 64> rom;

  for (int tok = 0; tok < 4; tok++) {
    uint8_t weights[64];
    for (int i = 0; i < 64; i++) weights[i] = (tok + i) % 8;
    auto chunk = pack_weights(weights, 64);
    rom.write_chunk_bytes(tok, chunk);
  }

  for (int tok = 0; tok < 4; tok++) {
    for (int i = 0; i < 64; i++) {
      assert(rom.read_weight(tok, i) == (uint8_t)((tok + i) % 8));
    }
  }
  std::printf("  PASS different_tokens\n");
}

int main() {
  std::printf("test_embed_rom\n");
  test_chunk_roundtrip();
  test_per_element_read();
  test_different_tokens();
  std::printf("All embed_rom tests passed.\n");
  return 0;
}
