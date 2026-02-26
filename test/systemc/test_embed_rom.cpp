// test_embed_rom.cpp — EmbedRom reference model tests
#include "embed_rom.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_write_read_roundtrip() {
  EmbedRom<64, 32> rom;
  rom.write_weight(uint17(3), uint12(7), uint16(0x3F80));
  assert(rom.read_weight(uint17(3), uint12(7)) == 0x3F80);
  assert(rom.read_weight(uint17(3), uint12(8)) == 0);
  std::printf("  PASS write_read_roundtrip\n");
}

static void test_bf16_values() {
  EmbedRom<64, 32> rom;
  // Store various BF16 values
  rom.write_weight(uint17(0), uint12(0), uint16(0x3F80));  // 1.0
  rom.write_weight(uint17(0), uint12(1), uint16(0x4000));  // 2.0
  rom.write_weight(uint17(0), uint12(2), uint16(0xBF80));  // -1.0
  rom.write_weight(uint17(0), uint12(3), uint16(0x0000));  // 0.0

  assert(rom.read_weight(uint17(0), uint12(0)) == 0x3F80);
  assert(rom.read_weight(uint17(0), uint12(1)) == 0x4000);
  assert(rom.read_weight(uint17(0), uint12(2)) == 0xBF80);
  assert(rom.read_weight(uint17(0), uint12(3)) == 0x0000);
  std::printf("  PASS bf16_values\n");
}

static void test_different_tokens() {
  EmbedRom<64, 32> rom;
  rom.write_weight(uint17(0), uint12(0), uint16(0x0001));
  rom.write_weight(uint17(1), uint12(0), uint16(0x0002));
  rom.write_weight(uint17(63), uint12(0), uint16(0xFFFF));
  assert(rom.read_weight(uint17(0), uint12(0)) == 0x0001);
  assert(rom.read_weight(uint17(1), uint12(0)) == 0x0002);
  assert(rom.read_weight(uint17(63), uint12(0)) == 0xFFFF);
  std::printf("  PASS different_tokens\n");
}

int main() {
  std::printf("test_embed_rom\n");
  test_write_read_roundtrip();
  test_bf16_values();
  test_different_tokens();
  std::printf("All embed_rom tests passed.\n");
  return 0;
}
