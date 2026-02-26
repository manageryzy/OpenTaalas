// test_rom_bank.cpp — Tests for IQ3_S block-packed ROM bank
#include <rom_bank.h>
#include <cassert>
#include <cstdio>
#include <cstring>

using namespace opentaalas;

static void test_write_read_block() {
  RomBank rom;
  IQ3SBlock blk = {};
  // Set super-scale to BF16(1.0) = 0x3F80
  blk.d_bf16 = 0x3F80;
  // Set first codebook index: qs[0]=0x42, qh bit=1 → index = 0x42 | (1<<8) = 0x142
  blk.qs[0] = 0x42;
  blk.qh[0] = 0x01;  // bit 0 set
  // Set first sign byte
  blk.signs[0] = 0xA5;
  // Set first sub-scale pair
  blk.scales[0] = 0x73;  // low nibble=3, high nibble=7

  rom.write_block(0, blk);
  IQ3SBlock got = rom.read_block(0);

  assert(got.d_bf16 == 0x3F80);
  assert(got.qs[0] == 0x42);
  assert(got.qh[0] == 0x01);
  assert(got.signs[0] == 0xA5);
  assert(got.scales[0] == 0x73);
  std::puts("[PASS] write/read block round-trip");
}

static void test_get_codebook_index() {
  RomBank rom;
  IQ3SBlock blk = {};
  // Group 0: qs[0]=0xAB, qh bit 0 of qh[0] → 9-bit index
  blk.qs[0] = 0xAB;
  blk.qs[1] = 0xCD;
  blk.qh[0] = 0x02;  // bit 1 set (for group 1)
  rom.write_block(0, blk);

  // Group 0: qs[0]=0xAB, qh bit from qh[0] bit (8-2*0)=bit8→ (qh[0]<<8)&256
  // Actually the IQ3_S indexing: index = qs[2*l+0] | ((qh[0] << (8-2*l)) & 256)
  // For l=0: index = qs[0] | ((qh[0] << 8) & 256) = 0xAB | ((0x02 << 8) & 256)
  //        = 0xAB | (0x200 & 0x100) = 0xAB | 0 = 0xAB = 171
  uint9 idx0 = rom.get_codebook_index(0, 0);
  assert(idx0.to_int() == 0xAB);

  // For l=1: index = qs[1] | ((qh[0] << 7) & 256) = 0xCD | ((0x02 << 7) & 256)
  //        = 0xCD | (0x100 & 0x100) = 0xCD | 0x100 = 0x1CD = 461
  uint9 idx1 = rom.get_codebook_index(0, 1);
  assert(idx1.to_int() == 461);
  std::puts("[PASS] get_codebook_index");
}

static void test_get_sign() {
  RomBank rom;
  IQ3SBlock blk = {};
  blk.signs[0] = 0xA5;  // 10100101
  rom.write_block(0, blk);

  assert(rom.get_sign(0, 0).to_int() == 1);  // bit 0
  assert(rom.get_sign(0, 1).to_int() == 0);  // bit 1
  assert(rom.get_sign(0, 2).to_int() == 1);  // bit 2
  assert(rom.get_sign(0, 5).to_int() == 1);  // bit 5
  assert(rom.get_sign(0, 7).to_int() == 1);  // bit 7
  std::puts("[PASS] get_sign");
}

static void test_get_sub_scale() {
  RomBank rom;
  IQ3SBlock blk = {};
  blk.scales[0] = 0x73;  // low=3, high=7
  blk.scales[1] = 0xBF;  // low=15, high=11
  rom.write_block(0, blk);

  assert(rom.get_sub_scale(0, 0).to_int() == 3);
  assert(rom.get_sub_scale(0, 1).to_int() == 7);
  assert(rom.get_sub_scale(0, 2).to_int() == 15);
  assert(rom.get_sub_scale(0, 3).to_int() == 11);
  std::puts("[PASS] get_sub_scale");
}

static void test_get_super_scale() {
  RomBank rom;
  IQ3SBlock blk = {};
  blk.d_bf16 = 0x4000;  // BF16(2.0)
  rom.write_block(0, blk);
  assert(rom.get_super_scale(0).to_int() == 0x4000);
  std::puts("[PASS] get_super_scale");
}

static void test_multiple_blocks() {
  RomBank rom;
  for (int i = 0; i < 4; ++i) {
    IQ3SBlock blk = {};
    blk.d_bf16 = 0x3F80 + i;
    blk.qs[0] = i * 10;
    rom.write_block(i, blk);
  }
  for (int i = 0; i < 4; ++i) {
    IQ3SBlock got = rom.read_block(i);
    assert(got.d_bf16 == 0x3F80 + i);
    assert(got.qs[0] == i * 10);
  }
  std::puts("[PASS] multiple blocks");
}

int main() {
  test_write_read_block();
  test_get_codebook_index();
  test_get_sign();
  test_get_sub_scale();
  test_get_super_scale();
  test_multiple_blocks();
  std::puts("\nAll rom_bank tests passed.");
  return 0;
}
