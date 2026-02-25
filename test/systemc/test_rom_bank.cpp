#include <rom_bank.h>
#include <cassert>
#include <cstdio>

static constexpr int R = 16;
static constexpr int C = 16;

int main() {
  opentaalas::RomBank<R, C> rom;

  // --- All 8 weight values round-trip ---
  for (int v = 0; v < 8; ++v) {
    rom.write_weight(0, v, opentaalas::uint3(v));
  }
  for (int v = 0; v < 8; ++v) {
    assert(rom.read_weight(0, v) == v);
  }
  std::printf("PASS: all_8_weight_values\n");

  // --- Boundary addresses ---
  rom.write_weight(0, 0, 3);
  assert(rom.read_weight(0, 0) == 3);
  std::printf("PASS: boundary_origin\n");

  rom.write_weight(R - 1, C - 1, 7);
  assert(rom.read_weight(R - 1, C - 1) == 7);
  std::printf("PASS: boundary_max\n");

  // --- Multiple writes then reads (no corruption) ---
  for (int r = 0; r < R; ++r) {
    for (int c = 0; c < C; ++c) {
      rom.write_weight(r, c, opentaalas::uint3((r + c) % 8));
    }
  }
  for (int r = 0; r < R; ++r) {
    for (int c = 0; c < C; ++c) {
      assert(rom.read_weight(r, c) == (r + c) % 8);
    }
  }
  std::printf("PASS: bulk_write_read_no_corruption\n");

  // --- Overwrite and verify ---
  rom.write_weight(5, 5, 2);
  assert(rom.read_weight(5, 5) == 2);
  rom.write_weight(5, 5, 6);
  assert(rom.read_weight(5, 5) == 6);
  std::printf("PASS: overwrite\n");

  std::printf("All rom_bank tests passed.\n");
  return 0;
}
