#include <scale_store.h>
#include <cassert>
#include <cstdio>

int main() {
  opentaalas::ScaleStore ss;

  // --- Write/read all 32 bank scales with distinct values ---
  for (int i = 0; i < 32; ++i) {
    ss.set_bank_scale(opentaalas::uint5(i), opentaalas::uint8(i * 7 + 3));
  }
  for (int i = 0; i < 32; ++i) {
    assert(ss.get_bank_scale(opentaalas::uint5(i)) == ((i * 7 + 3) & 0xFF));
  }
  std::printf("PASS: all_32_bank_scales\n");

  // --- Write/read all 8 tensor scales with distinct values ---
  for (int i = 0; i < 8; ++i) {
    ss.set_tensor_scale(opentaalas::uint3(i),
                        opentaalas::uint32(0xDEAD0000u + i));
  }
  for (int i = 0; i < 8; ++i) {
    opentaalas::uint32 expected(0xDEAD0000u + i);
    assert(ss.get_tensor_scale(opentaalas::uint3(i)) == expected);
  }
  std::printf("PASS: all_8_tensor_scales\n");

  // --- Boundary indices ---
  ss.set_bank_scale(0, 0xAA);
  assert(ss.get_bank_scale(0) == 0xAA);
  ss.set_bank_scale(31, 0xBB);
  assert(ss.get_bank_scale(31) == 0xBB);
  std::printf("PASS: bank_scale_boundaries\n");

  ss.set_tensor_scale(0, 0x11111111);
  assert(ss.get_tensor_scale(0) == 0x11111111);
  ss.set_tensor_scale(7, 0x77777777);
  assert(ss.get_tensor_scale(7) == 0x77777777);
  std::printf("PASS: tensor_scale_boundaries\n");

  // --- Overwrite ---
  ss.set_bank_scale(10, 0x01);
  assert(ss.get_bank_scale(10) == 0x01);
  ss.set_bank_scale(10, 0xFE);
  assert(ss.get_bank_scale(10) == 0xFE);
  std::printf("PASS: bank_scale_overwrite\n");

  std::printf("All scale_store tests passed.\n");
  return 0;
}
