// test_embed_rom.cpp — EmbedRom reference model tests
#include "embed_rom.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_write_read_roundtrip() {
  EmbedRom<64, 32> rom;
  // Write a known value and read it back
  rom.write_weight(uint17(3), uint12(7), uint3(5));
  assert(rom.read_weight(uint17(3), uint12(7)) == 5);
  // Unwritten location should be zero
  assert(rom.read_weight(uint17(3), uint12(8)) == 0);
  std::printf("  PASS write_read_roundtrip\n");
}

static void test_all_weight_values() {
  EmbedRom<64, 32> rom;
  // uint3 holds 0..7
  for (int v = 0; v < 8; ++v) {
    rom.write_weight(uint17(0), uint12(v), uint3(v));
  }
  for (int v = 0; v < 8; ++v) {
    assert(rom.read_weight(uint17(0), uint12(v)) == v);
  }
  std::printf("  PASS all_weight_values\n");
}

static void test_different_tokens() {
  EmbedRom<64, 32> rom;
  // Write to different token rows, same dim
  rom.write_weight(uint17(0), uint12(0), uint3(1));
  rom.write_weight(uint17(1), uint12(0), uint3(2));
  rom.write_weight(uint17(63), uint12(0), uint3(7));
  assert(rom.read_weight(uint17(0), uint12(0)) == 1);
  assert(rom.read_weight(uint17(1), uint12(0)) == 2);
  assert(rom.read_weight(uint17(63), uint12(0)) == 7);
  std::printf("  PASS different_tokens\n");
}

static void test_bank_scale() {
  EmbedRom<64, 32> rom;
  assert(rom.get_bank_scale() == 0);
  rom.set_bank_scale(uint8(0xAB));
  assert(rom.get_bank_scale() == 0xAB);
  rom.set_bank_scale(uint8(0xFF));
  assert(rom.get_bank_scale() == 0xFF);
  std::printf("  PASS bank_scale\n");
}

static void test_tensor_scale() {
  EmbedRom<64, 32> rom;
  assert(rom.get_tensor_scale() == 0);
  rom.set_tensor_scale(uint32(0xDEADBEEF));
  assert(rom.get_tensor_scale() == 0xDEADBEEF);
  std::printf("  PASS tensor_scale\n");
}

int main() {
  std::printf("test_embed_rom\n");
  test_write_read_roundtrip();
  test_all_weight_values();
  test_different_tokens();
  test_bank_scale();
  test_tensor_scale();
  std::printf("All embed_rom tests passed.\n");
  return 0;
}
