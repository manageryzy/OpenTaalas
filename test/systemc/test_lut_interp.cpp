#include <lut_interp.h>
#include <cassert>
#include <cstdio>

int main() {
  opentaalas::LutUnit lut;

  // --- set_entry / get_entry round-trip ---
  for (int i = 0; i < 256; ++i) {
    lut.set_entry(opentaalas::uint8(i), opentaalas::uint16(i * 100));
  }
  for (int i = 0; i < 256; ++i) {
    assert(lut.get_entry(opentaalas::uint8(i)) == (i * 100) % (1 << 16));
  }
  std::printf("PASS: set_get_round_trip\n");

  // --- Repopulate with simple values: table[i] = i * 100 (mod 65536) ---
  // Already done above.

  // --- lookup: frac < 128 returns table[index] ---
  {
    // input = (index << 8) | frac, index=5, frac=0
    opentaalas::uint16 input((5 << 8) | 0);
    assert(lut.lookup(input) == (5 * 100));
  }
  {
    // index=5, frac=127
    opentaalas::uint16 input((5 << 8) | 127);
    assert(lut.lookup(input) == (5 * 100));
  }
  std::printf("PASS: lookup_frac_below_128\n");

  // --- lookup: frac >= 128 returns table[index+1] ---
  {
    // index=5, frac=128
    opentaalas::uint16 input((5 << 8) | 128);
    assert(lut.lookup(input) == (6 * 100));
  }
  {
    // index=5, frac=255
    opentaalas::uint16 input((5 << 8) | 255);
    assert(lut.lookup(input) == (6 * 100));
  }
  std::printf("PASS: lookup_frac_ge_128\n");

  // --- Edge case: index=255, frac >= 128 clamps to table[255] ---
  {
    opentaalas::uint16 input((255 << 8) | 200);
    opentaalas::uint16 expected((255 * 100) % (1 << 16));
    assert(lut.lookup(input) == expected);
  }
  {
    opentaalas::uint16 input((255 << 8) | 128);
    opentaalas::uint16 expected((255 * 100) % (1 << 16));
    assert(lut.lookup(input) == expected);
  }
  std::printf("PASS: lookup_index255_clamp\n");

  // --- index=0, frac=0 ---
  {
    opentaalas::uint16 input(0);
    assert(lut.lookup(input) == 0);
  }
  std::printf("PASS: lookup_zero\n");

  // --- index=254, frac=255 returns table[255] ---
  {
    opentaalas::uint16 input((254 << 8) | 255);
    opentaalas::uint16 expected((255 * 100) % (1 << 16));
    assert(lut.lookup(input) == expected);
  }
  std::printf("PASS: lookup_index254_frac255\n");

  std::printf("All lut_interp tests passed.\n");
  return 0;
}
