// test_swiglu — sigmoid_lut, compute_silu, compute_swiglu
#include <swiglu.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
  SwigluUnit sw;

  // --- sigmoid_lut write/read round-trip ---
  sw.set_sigmoid_lut(uint8(0), uint16(0x3F00));   // ~0.5 in BF16
  sw.set_sigmoid_lut(uint8(127), uint16(0x3F80));  // ~1.0 in BF16
  sw.set_sigmoid_lut(uint8(255), uint16(0x0000));
  assert(sw.lookup_sigmoid(uint8(0)) == 0x3F00);
  assert(sw.lookup_sigmoid(uint8(127)) == 0x3F80);
  assert(sw.lookup_sigmoid(uint8(255)) == 0x0000);

  // --- compute_silu returns gate (simplified) ---
  uint16 gate = uint16(0xAB00);
  uint16 result = sw.compute_silu(gate);
  assert(result == gate);

  gate = uint16(0x1234);
  result = sw.compute_silu(gate);
  assert(result == gate);

  // --- compute_swiglu returns gate (simplified) ---
  gate = uint16(0xFF00);
  uint16 up = uint16(0x4200);
  result = sw.compute_swiglu(gate, up);
  assert(result == gate);

  std::printf("PASS: test_swiglu\n");
  return 0;
}
