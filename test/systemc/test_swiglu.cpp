// test_swiglu — sigmoid_lut, compute_silu, compute_swiglu with real BF16 math
#include <swiglu.h>
#include <bf16_math.h>
#include <cassert>
#include <cstdio>
#include <cmath>

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

  // --- compute_silu with known sigmoid LUT ---
  // Fill all LUT entries with bf16(0.5) so sigmoid lookup always returns 0.5
  uint16 half = bf16_from_float(0.5f);
  for (int i = 0; i < 256; ++i)
    sw.set_sigmoid_lut(uint8(i), half);

  // SiLU(gate) = gate * sigmoid(gate)
  // gate=2.0, sigmoid=0.5 => silu = 2.0 * 0.5 = 1.0
  uint16 gate = bf16_from_float(2.0f);
  uint16 result = sw.compute_silu(gate);
  float result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 1.0f) < 0.05f);

  // gate=4.0, sigmoid=0.5 => silu = 4.0 * 0.5 = 2.0
  gate = bf16_from_float(4.0f);
  result = sw.compute_silu(gate);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 2.0f) < 0.05f);

  // --- compute_swiglu ---
  // swiglu(gate, up) = silu(gate) * up
  // gate=2.0, sigmoid=0.5 => silu=1.0, up=3.0 => swiglu = 1.0 * 3.0 = 3.0
  gate = bf16_from_float(2.0f);
  uint16 up = bf16_from_float(3.0f);
  result = sw.compute_swiglu(gate, up);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 3.0f) < 0.1f);

  // gate=4.0, up=0.5 => silu=2.0, swiglu = 2.0 * 0.5 = 1.0
  gate = bf16_from_float(4.0f);
  up = bf16_from_float(0.5f);
  result = sw.compute_swiglu(gate, up);
  result_f = bf16_to_float(result);
  assert(std::fabs(result_f - 1.0f) < 0.05f);

  std::printf("PASS: test_swiglu\n");
  return 0;
}
