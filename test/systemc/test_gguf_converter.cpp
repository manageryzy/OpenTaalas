// Test FP16/FP8 conversion utilities (no GGUF file needed)
#include "gguf_converter.h"
#include <cassert>
#include <cstdio>
#include <cmath>

using namespace opentaalas;

static bool approx(float a, float b, float tol = 0.05f) {
  return std::fabs(a - b) <= tol;
}

int main() {
  // --- fp16_to_float ---
  assert(fp16_to_float(0x3C00) == 1.0f);   // FP16 1.0
  assert(fp16_to_float(0x4000) == 2.0f);   // FP16 2.0
  assert(fp16_to_float(0x0000) == 0.0f);   // FP16 0.0
  assert(fp16_to_float(0xBC00) == -1.0f);  // FP16 -1.0
  assert(approx(fp16_to_float(0x3800), 0.5f));  // FP16 0.5
  std::printf("PASS: fp16_to_float\n");

  // --- fp16_to_fp8_e4m3 ---
  // FP16 1.0 (0x3C00) → FP8 E4M3: sign=0, exp=7 (bias 7, so 2^0=1), mant=0 → 0x38
  uint8_t fp8_one = fp16_to_fp8_e4m3(0x3C00);
  assert(fp8_one == 0x38);
  std::printf("PASS: fp16_to_fp8_e4m3(1.0) = 0x%02X\n", fp8_one);

  // FP16 0.0 → FP8 0x00
  assert(fp16_to_fp8_e4m3(0x0000) == 0x00);
  std::printf("PASS: fp16_to_fp8_e4m3(0.0)\n");

  // FP16 2.0 (0x4000) → FP8 E4M3: exp=8, mant=0 → 0x40
  uint8_t fp8_two = fp16_to_fp8_e4m3(0x4000);
  assert(fp8_two == 0x40);
  std::printf("PASS: fp16_to_fp8_e4m3(2.0) = 0x%02X\n", fp8_two);

  // FP16 -1.0 (0xBC00) → FP8: sign=1, exp=7, mant=0 → 0xB8
  uint8_t fp8_neg1 = fp16_to_fp8_e4m3(0xBC00);
  assert(fp8_neg1 == 0xB8);
  std::printf("PASS: fp16_to_fp8_e4m3(-1.0) = 0x%02X\n", fp8_neg1);

  // --- fp8_e4m3_to_float round-trip ---
  assert(approx(fp8_e4m3_to_float(0x38), 1.0f));
  assert(approx(fp8_e4m3_to_float(0x40), 2.0f));
  assert(fp8_e4m3_to_float(0x00) == 0.0f);
  assert(approx(fp8_e4m3_to_float(0xB8), -1.0f));
  std::printf("PASS: fp8_e4m3_to_float round-trip\n");

  // --- Weight encoding: signed → our format ---
  // Our encoding: 0-3 → 0..+3, 4-7 → -4..-1
  // Verify the mapping
  for (int sw = -4; sw <= 3; sw++) {
    uint8_t our_w;
    if (sw >= 0) our_w = (uint8_t)sw;
    else         our_w = (uint8_t)(8 + sw);

    // Decode back
    int decoded;
    if (our_w <= 3) decoded = our_w;
    else            decoded = (int)our_w - 8;

    assert(decoded == sw);
  }
  std::printf("PASS: weight encoding round-trip (-4..+3)\n");

  // --- FP8 sweep: verify no crashes and reasonable values ---
  int valid = 0;
  for (int i = 0; i < 256; i++) {
    float v = fp8_e4m3_to_float((uint8_t)i);
    if (std::isfinite(v)) valid++;
  }
  assert(valid >= 200); // most values should be finite
  std::printf("PASS: fp8 sweep (%d/256 finite)\n", valid);

  std::printf("All gguf_converter tests passed.\n");
  return 0;
}
