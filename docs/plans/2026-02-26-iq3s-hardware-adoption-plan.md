# IQ3_S Hardware Adoption Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Upgrade the quantized compute pipeline from Q3_K (INT3 + FP8 E4M3) to IQ3_S (512-entry codebook + BF16/FP32 scales) and validate cosine>0.99 against llama.cpp reference.

**Architecture:** Bottom-up: add new types → rewrite leaf modules (MacPE, DequantUnit, CodebookDecoder, RomBank) → rewrite composite modules (MacArray) → update downstream modules → build IQ3_S forward pass tool → download IQ3_S GGUF → validate.

**Tech Stack:** C++17, ac_int (ac_types), SystemC, ggml/gguf (llama.cpp), CMake/CTest

---

### Task 1: Add INT24 and FP32 helper types

**Files:**
- Modify: `model/systemc/include/opentaalas/types.h`
- Test: `test/systemc/test_bf16_math.cpp` (add FP16→BF16 conversion test)
- Modify: `model/systemc/src/bf16_math.h` (add fp16_to_bf16, fp32 FTZ helpers)

**Step 1: Add int24, uint9, uint1 types to types.h**

Add after the existing `int32` line:

```cpp
using uint1  = ac_int<1, false>;
using uint9  = ac_int<9, false>;
using int24  = ac_int<24, true>;
using uint24 = ac_int<24, false>;
```

**Step 2: Add FP16→BF16 conversion and FP32 FTZ helpers to bf16_math.h**

Add these functions:

```cpp
// FP16 → BF16 conversion (no subnormals — FTZ)
// FP16: 1 sign + 5 exp (bias 15) + 10 mantissa
// BF16: 1 sign + 8 exp (bias 127) + 7 mantissa
inline uint16 fp16_to_bf16(uint16_t fp16_bits) {
  uint16_t sign = (fp16_bits >> 15) & 1;
  uint16_t exp  = (fp16_bits >> 10) & 0x1F;
  uint16_t mant = fp16_bits & 0x3FF;
  if (exp == 0) return uint16(sign << 15);  // FTZ: subnormal → ±0
  uint16_t bf16_exp = exp + 112;  // bias adjust: 127 - 15 = 112
  uint16_t bf16_mant = mant >> 3; // 10-bit → 7-bit (truncate)
  return uint16((sign << 15) | (bf16_exp << 7) | bf16_mant);
}

// FP32 flush-to-zero: if exponent is 0, return ±0
inline float fp32_ftz(float f) {
  uint32_t bits;
  std::memcpy(&bits, &f, 4);
  if (((bits >> 23) & 0xFF) == 0) {
    bits &= 0x80000000u;  // preserve sign, zero rest
    std::memcpy(&f, &bits, 4);
  }
  return f;
}

// INT24 → FP32 conversion (FTZ)
inline float int24_to_fp32_ftz(int32_t val) {
  return fp32_ftz(static_cast<float>(val));
}
```

**Step 3: Add test for fp16_to_bf16 in test_bf16_math.cpp**

Add a test function before `main()`:

```cpp
static void test_fp16_to_bf16() {
  // FP16 1.0 = 0x3C00: sign=0, exp=15, mant=0
  // BF16 1.0 = 0x3F80: sign=0, exp=127, mant=0
  assert(opentaalas::fp16_to_bf16(0x3C00).to_int() == 0x3F80);

  // FP16 -1.0 = 0xBC00 → BF16 -1.0 = 0xBF80
  assert(opentaalas::fp16_to_bf16(0xBC00).to_int() == 0xBF80);

  // FP16 0.5 = 0x3800: sign=0, exp=14, mant=0
  // BF16: exp=14+112=126, mant=0 → 0x3F00
  assert(opentaalas::fp16_to_bf16(0x3800).to_int() == 0x3F00);

  // FP16 subnormal → FTZ to 0
  assert(opentaalas::fp16_to_bf16(0x0001).to_int() == 0x0000);

  // FP16 negative subnormal → FTZ to -0
  assert(opentaalas::fp16_to_bf16(0x8001).to_int() == 0x8000);

  std::puts("[PASS] fp16_to_bf16 conversion");
}
```

Add `test_fp16_to_bf16();` call in `main()`.

**Step 4: Build and run tests**

Run: `cmake --build build && ctest --test-dir build -R systemc_bf16_math -V`
Expected: PASS

**Step 5: Commit**

```bash
git add model/systemc/include/opentaalas/types.h model/systemc/src/bf16_math.h test/systemc/test_bf16_math.cpp
git commit -m "feat: add INT24/uint9/uint1 types and FP16→BF16 conversion for IQ3_S"
```

---

### Task 2: CodebookDecoder — new SystemC module + test

**Files:**
- Create: `model/systemc/src/codebook_decoder.h`
- Create: `test/systemc/test_codebook_decoder.cpp`
- Modify: `test/systemc/CMakeLists.txt` (add codebook_decoder to module list)

**Step 1: Write the test**

```cpp
// test_codebook_decoder.cpp — Tests for IQ3_S 512-entry codebook decoder
#include <codebook_decoder.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_first_entry() {
  // iq3s_grid[0] = 0x01010101 → magnitudes (1, 1, 1, 1)
  CodebookDecoder dec;
  uint4 m0, m1, m2, m3;
  dec.decode(uint9(0), m0, m1, m2, m3);
  assert(m0.to_int() == 1);
  assert(m1.to_int() == 1);
  assert(m2.to_int() == 1);
  assert(m3.to_int() == 1);
  std::puts("[PASS] first codebook entry (0x01010101)");
}

static void test_second_entry() {
  // iq3s_grid[1] = 0x01010103 → magnitudes (3, 1, 1, 1)
  CodebookDecoder dec;
  uint4 m0, m1, m2, m3;
  dec.decode(uint9(1), m0, m1, m2, m3);
  assert(m0.to_int() == 3);
  assert(m1.to_int() == 1);
  assert(m2.to_int() == 1);
  assert(m3.to_int() == 1);
  std::puts("[PASS] second codebook entry (0x01010103)");
}

static void test_all_entries_valid_magnitudes() {
  // All magnitudes must be odd and in {1,3,5,7,9,11,13,15}
  CodebookDecoder dec;
  for (int i = 0; i < 512; ++i) {
    uint4 m0, m1, m2, m3;
    dec.decode(uint9(i), m0, m1, m2, m3);
    for (int m : {m0.to_int(), m1.to_int(), m2.to_int(), m3.to_int()}) {
      assert(m >= 0 && m <= 15);
      assert(m % 2 == 1);  // all codebook values are odd
    }
  }
  std::puts("[PASS] all 512 entries have valid odd magnitudes");
}

static void test_known_entry_511() {
  // Last entry: iq3s_grid[511] — verify it decodes without crash
  CodebookDecoder dec;
  uint4 m0, m1, m2, m3;
  dec.decode(uint9(511), m0, m1, m2, m3);
  // Just verify all are odd and in range
  for (int m : {m0.to_int(), m1.to_int(), m2.to_int(), m3.to_int()}) {
    assert(m % 2 == 1 && m >= 1 && m <= 15);
  }
  std::puts("[PASS] last codebook entry (index 511)");
}

int main() {
  test_first_entry();
  test_second_entry();
  test_all_entries_valid_magnitudes();
  test_known_entry_511();
  std::puts("\nAll codebook_decoder tests passed.");
  return 0;
}
```

**Step 2: Run test to verify it fails**

Run: `cmake --build build 2>&1 | head -20`
Expected: FAIL — `codebook_decoder.h` not found

**Step 3: Write the CodebookDecoder implementation**

Create `model/systemc/src/codebook_decoder.h`:

```cpp
#pragma once
#include <opentaalas/types.h>
#include <cstdint>

namespace opentaalas {

// IQ3_S codebook: 512 entries, each encoding 4 unsigned 4-bit magnitudes.
// Values from iq3s_grid[] in llama.cpp ggml-common.h.
// Each uint32 packs 4 bytes: grid[i] = (m3 << 24) | (m2 << 16) | (m1 << 8) | m0
// All magnitudes are odd: {1, 3, 5, 7, 9, 11, 13, 15}
class CodebookDecoder {
 public:
  void decode(uint9 index, uint4& m0, uint4& m1, uint4& m2, uint4& m3) const {
    uint32_t entry = _grid[index.to_int()];
    m0 = uint4(entry & 0xFF);
    m1 = uint4((entry >> 8) & 0xFF);
    m2 = uint4((entry >> 16) & 0xFF);
    m3 = uint4((entry >> 24) & 0xFF);
  }

 private:
  // Copied from ggml-common.h iq3s_grid[512]
  static constexpr uint32_t _grid[512] = {
    0x01010101, 0x01010103, 0x01010105, 0x0101010b, 0x0101010f, 0x01010301, 0x01010303, 0x01010305,
    0x01010309, 0x0101030d, 0x01010501, 0x01010503, 0x0101050b, 0x01010707, 0x01010901, 0x01010905,
    0x0101090b, 0x0101090f, 0x01010b03, 0x01010b07, 0x01010d01, 0x01010d05, 0x01010f03, 0x01010f09,
    0x01010f0f, 0x01030101, 0x01030103, 0x01030105, 0x01030109, 0x01030301, 0x01030303, 0x0103030b,
    0x01030501, 0x01030507, 0x0103050f, 0x01030703, 0x0103070b, 0x01030909, 0x01030d03, 0x01030d0b,
    0x01030f05, 0x01050101, 0x01050103, 0x0105010b, 0x0105010f, 0x01050301, 0x01050307, 0x0105030d,
    0x01050503, 0x01050505, 0x0105050b, 0x01050701, 0x01050709, 0x01050905, 0x0105090b, 0x01050b01,
    0x01050b05, 0x01050d0f, 0x01050f07, 0x01070103, 0x01070105, 0x01070301, 0x01070309, 0x01070503,
    0x01070507, 0x0107050f, 0x01070701, 0x01070705, 0x0107070b, 0x01070903, 0x01070907, 0x01070b01,
    0x01070d09, 0x01070f05, 0x01070f0b, 0x01090101, 0x01090105, 0x01090109, 0x01090303, 0x01090307,
    0x01090501, 0x01090509, 0x0109050f, 0x01090703, 0x0109070b, 0x01090905, 0x01090b01, 0x01090f01,
    0x010b0103, 0x010b0105, 0x010b0109, 0x010b0301, 0x010b0307, 0x010b0503, 0x010b050b, 0x010b0701,
    0x010b0709, 0x010b0905, 0x010b0b03, 0x010b0d01, 0x010b0f07, 0x010d0101, 0x010d0105, 0x010d0301,
    0x010d0309, 0x010d050b, 0x010d0701, 0x010d0907, 0x010d0b05, 0x010d0f03, 0x010f0103, 0x010f0107,
    0x010f0301, 0x010f0305, 0x010f050b, 0x010f0701, 0x010f0907, 0x010f0b03, 0x010f0d05, 0x010f0f01,
    0x03010101, 0x03010103, 0x03010105, 0x03010109, 0x03010301, 0x03010303, 0x03010309, 0x0301030d,
    0x03010501, 0x03010503, 0x0301050b, 0x03010703, 0x03010709, 0x03010b05, 0x03010b0b, 0x03010d01,
    0x03010d09, 0x03010f07, 0x03030101, 0x03030103, 0x03030107, 0x0303010d, 0x03030301, 0x03030309,
    0x03030503, 0x03030505, 0x03030701, 0x03030903, 0x03030b01, 0x03030b09, 0x03030d03, 0x03030f05,
    0x03050101, 0x03050103, 0x03050107, 0x03050301, 0x03050305, 0x0305030b, 0x0305030f, 0x03050501,
    0x03050509, 0x03050703, 0x03050707, 0x0305070d, 0x03050901, 0x03050907, 0x03050b03, 0x03050d01,
    0x03050f05, 0x03070101, 0x03070105, 0x0307010b, 0x03070301, 0x03070305, 0x03070503, 0x03070509,
    0x0307050f, 0x03070701, 0x03070709, 0x03070903, 0x03070d05, 0x03070f01, 0x03090103, 0x03090109,
    0x03090301, 0x03090305, 0x03090503, 0x03090507, 0x03090705, 0x0309070b, 0x03090903, 0x03090b01,
    0x03090b09, 0x030b0101, 0x030b0105, 0x030b0301, 0x030b0305, 0x030b0503, 0x030b0509, 0x030b0701,
    0x030b0705, 0x030b0b03, 0x030d0103, 0x030d0109, 0x030d0301, 0x030d0307, 0x030d0503, 0x030d050b,
    0x030d0703, 0x030d0b01, 0x030d0f05, 0x030f0101, 0x030f0105, 0x030f0109, 0x030f0301, 0x030f0505,
    0x030f0703, 0x030f0b03, 0x030f0d07, 0x05010101, 0x05010103, 0x05010107, 0x0501010b, 0x05010301,
    0x05010305, 0x0501030b, 0x05010503, 0x05010507, 0x0501050f, 0x05010701, 0x05010705, 0x05010903,
    0x05010907, 0x0501090f, 0x05010b01, 0x05010b09, 0x05010d03, 0x05010d07, 0x05010f05, 0x05030101,
    0x05030105, 0x05030301, 0x05030307, 0x0503030f, 0x05030505, 0x0503050b, 0x05030703, 0x05030709,
    0x05030b05, 0x05030b0b, 0x05030d01, 0x05030d09, 0x05030f07, 0x05050103, 0x05050107, 0x0505010b,
    0x05050301, 0x05050305, 0x05050501, 0x05050507, 0x0505050f, 0x05050703, 0x05050901, 0x05050b05,
    0x05050d03, 0x05050f01, 0x05050f09, 0x05070101, 0x05070105, 0x0507010b, 0x05070303, 0x05070505,
    0x05070509, 0x05070703, 0x05070707, 0x05070905, 0x05070b01, 0x05070d0b, 0x05090103, 0x05090301,
    0x05090501, 0x05090507, 0x05090703, 0x0509070b, 0x05090903, 0x05090f05, 0x050b0101, 0x050b0105,
    0x050b0303, 0x050b0505, 0x050b070b, 0x050b0901, 0x050b0d03, 0x050d0103, 0x050d0107, 0x050d0301,
    0x050d0509, 0x050d0703, 0x050d0b05, 0x050f0101, 0x050f0105, 0x050f0301, 0x050f0505, 0x050f0903,
    0x07010101, 0x07010103, 0x07010105, 0x07010301, 0x07010303, 0x07010307, 0x0701030b, 0x07010501,
    0x07010505, 0x07010703, 0x07010707, 0x0701070d, 0x07010901, 0x07010b03, 0x07010b07, 0x07010d01,
    0x07010f03, 0x07030103, 0x07030107, 0x07030301, 0x07030305, 0x07030503, 0x07030507, 0x07030701,
    0x0703070b, 0x07030903, 0x07030f01, 0x07050101, 0x07050105, 0x07050301, 0x07050305, 0x07050501,
    0x07050507, 0x07050703, 0x07050709, 0x07050905, 0x07050b01, 0x07050f07, 0x07070103, 0x07070301,
    0x07070309, 0x07070503, 0x07070507, 0x07070701, 0x07070903, 0x07070b09, 0x07090101, 0x07090105,
    0x07090303, 0x07090501, 0x07090703, 0x07090b05, 0x070b0103, 0x070b0301, 0x070b0305, 0x070b0503,
    0x070b0701, 0x070b0705, 0x070d0101, 0x070d0105, 0x070d0301, 0x070d0503, 0x070d0705, 0x070d0b03,
    0x070f0103, 0x070f0107, 0x070f0501, 0x070f0505, 0x070f0703, 0x09010101, 0x09010103, 0x09010105,
    0x09010301, 0x09010303, 0x09010501, 0x09010505, 0x0901050b, 0x09010703, 0x09010b01, 0x09010b05,
    0x09010d09, 0x09030103, 0x0903010b, 0x09030301, 0x09030305, 0x09030503, 0x09030707, 0x09030901,
    0x09030b03, 0x09050101, 0x09050105, 0x09050303, 0x09050501, 0x09050703, 0x09050b07, 0x09070103,
    0x09070301, 0x09070307, 0x09070501, 0x09070505, 0x09070703, 0x090b0101, 0x090b0301, 0x090b0503,
    0x090b0705, 0x090d0103, 0x090d0301, 0x090d0501, 0x090f0103, 0x090f0301, 0x0b010101, 0x0b010103,
    0x0b010301, 0x0b010303, 0x0b010501, 0x0b010505, 0x0b010703, 0x0b010707, 0x0b010901, 0x0b010b05,
    0x0b010d03, 0x0b030103, 0x0b030105, 0x0b030301, 0x0b030305, 0x0b030503, 0x0b030705, 0x0b030b01,
    0x0b050101, 0x0b050105, 0x0b050303, 0x0b050501, 0x0b050509, 0x0b050703, 0x0b050b05, 0x0b070101,
    0x0b070301, 0x0b070505, 0x0b070703, 0x0b090103, 0x0b090301, 0x0b090501, 0x0b0b0103, 0x0b0b0301,
    0x0b0b0703, 0x0b0d0101, 0x0b0d0501, 0x0b0f0105, 0x0b0f0301, 0x0d010103, 0x0d010301, 0x0d010303,
    0x0d010505, 0x0d010703, 0x0d010b01, 0x0d030101, 0x0d030105, 0x0d030301, 0x0d030503, 0x0d030701,
    0x0d050103, 0x0d050301, 0x0d050501, 0x0d050703, 0x0d070101, 0x0d070303, 0x0d070501, 0x0d090103,
    0x0d090301, 0x0d0b0101, 0x0d0b0105, 0x0d0b0301, 0x0d0d0101, 0x0d0f0103, 0x0f010101, 0x0f010103,
    0x0f010301, 0x0f010305, 0x0f010503, 0x0f010701, 0x0f030101, 0x0f030105, 0x0f030303, 0x0f030501,
    0x0f030703, 0x0f050103, 0x0f050301, 0x0f050501, 0x0f070101, 0x0f070103, 0x0f070301, 0x0f070503,
    0x0f090101, 0x0f090301, 0x0f0b0103, 0x0f0b0301, 0x0f0d0101, 0x0f0f0101,
  };
};

}  // namespace opentaalas
```

**Step 4: Add codebook_decoder to test CMakeLists.txt**

In `test/systemc/CMakeLists.txt`, add `codebook_decoder` to the `_systemc_modules` list after `mac_array`:

```
set(_systemc_modules
  bf16_math
  rom_bank scale_store lut_interp
  mac_pe dequant mac_array
  codebook_decoder
  kv_cache attention_unit rmsnorm swiglu rope
  vector_unit layer_tile
  embed_rom lm_head global_controller llama_chip
)
```

**Step 5: Build and run test**

Run: `cmake --build build && ctest --test-dir build -R systemc_codebook_decoder -V`
Expected: PASS — all 4 tests pass

**Step 6: Commit**

```bash
git add model/systemc/src/codebook_decoder.h test/systemc/test_codebook_decoder.cpp test/systemc/CMakeLists.txt
git commit -m "feat: add IQ3_S CodebookDecoder (512-entry LUT)"
```

---

### Task 3: Rewrite MacPE for IQ3_S codebook magnitudes

**Files:**
- Modify: `model/systemc/src/mac_pe.h`
- Modify: `test/systemc/test_mac_pe.cpp`

**Step 1: Rewrite test_mac_pe.cpp for new interface**

Replace the entire file:

```cpp
// test_mac_pe.cpp — Tests for IQ3_S codebook MAC Processing Element
// New interface: mac(uint4 magnitude, uint1 sign, int8 activation) → int24
// Magnitudes are from codebook: {1,3,5,7,9,11,13,15} = (2k+1) where k=0..7
#include <mac_pe.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_all_magnitudes_positive() {
  // magnitude × activation with sign=0 (positive)
  // mag=1: 1×10=10, mag=3: 3×10=30, ..., mag=15: 15×10=150
  const int mags[] = {1, 3, 5, 7, 9, 11, 13, 15};
  for (int m : mags) {
    MacPE pe;
    int24 result = pe.mac(uint4(m), uint1(0), int8(10));
    assert(result.to_int64() == m * 10);
  }
  std::puts("[PASS] all magnitudes with positive sign, act=10");
}

static void test_all_magnitudes_negative() {
  // sign=1 negates the product
  const int mags[] = {1, 3, 5, 7, 9, 11, 13, 15};
  for (int m : mags) {
    MacPE pe;
    int24 result = pe.mac(uint4(m), uint1(1), int8(10));
    assert(result.to_int64() == -(m * 10));
  }
  std::puts("[PASS] all magnitudes with negative sign, act=10");
}

static void test_negative_activation() {
  // mag=5, sign=0, act=-7: product = 5 × (-7) = -35
  MacPE pe;
  int24 result = pe.mac(uint4(5), uint1(0), int8(-7));
  assert(result.to_int64() == -35);

  // mag=5, sign=1, act=-7: product = -(5 × (-7)) = 35
  MacPE pe2;
  int24 result2 = pe2.mac(uint4(5), uint1(1), int8(-7));
  assert(result2.to_int64() == 35);
  std::puts("[PASS] negative activation");
}

static void test_accumulation_32_weights() {
  // Simulate a 32-weight sub-block: all mag=1, sign=0, act=1
  // Expected: 32 × 1 × 1 = 32
  MacPE pe;
  for (int i = 0; i < 32; ++i)
    pe.mac(uint4(1), uint1(0), int8(1));
  assert(pe.read_accum().to_int64() == 32);
  std::puts("[PASS] accumulation over 32 weights");
}

static void test_worst_case_accumulation() {
  // Worst case: 32 × mag=15 × act=127 = 60960
  MacPE pe;
  for (int i = 0; i < 32; ++i)
    pe.mac(uint4(15), uint1(0), int8(127));
  assert(pe.read_accum().to_int64() == 60960);
  // Fits in INT24 (max 8388607)
  std::puts("[PASS] worst case accumulation (60960 fits INT24)");
}

static void test_clear() {
  MacPE pe;
  pe.mac(uint4(15), uint1(0), int8(100));
  assert(pe.read_accum().to_int64() == 1500);
  pe.clear();
  assert(pe.read_accum().to_int64() == 0);
  pe.mac(uint4(3), uint1(0), int8(7));
  assert(pe.read_accum().to_int64() == 21);
  std::puts("[PASS] clear resets accumulator");
}

static void test_shift_and_add_correctness() {
  // Verify (2k+1)×a = (k<<1)×a + a for all k=0..7
  MacPE pe;
  for (int k = 0; k < 8; ++k) {
    int mag = 2 * k + 1;
    for (int a : {1, -1, 42, -128, 127}) {
      pe.clear();
      int24 result = pe.mac(uint4(mag), uint1(0), int8(a));
      assert(result.to_int64() == mag * a);
    }
  }
  std::puts("[PASS] shift-and-add matches mag×act for all k");
}

int main() {
  test_all_magnitudes_positive();
  test_all_magnitudes_negative();
  test_negative_activation();
  test_accumulation_32_weights();
  test_worst_case_accumulation();
  test_clear();
  test_shift_and_add_correctness();
  std::puts("\nAll mac_pe tests passed.");
  return 0;
}
```

**Step 2: Run test to verify it fails**

Run: `cmake --build build 2>&1 | grep -i error | head -5`
Expected: FAIL — old MacPE interface doesn't match new test

**Step 3: Rewrite mac_pe.h**

Replace `model/systemc/src/mac_pe.h`:

```cpp
#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

// IQ3_S MAC Processing Element
// Multiplies codebook magnitude (uint4, odd values 1-15) by INT8 activation
// with separate sign bit, accumulates into INT24 register.
// Uses shift-and-add: mag = 2k+1, so mag×a = (k×a)<<1 + a
class MacPE {
 public:
  MacPE() : _accum(0) {}

  int24 mac(uint4 magnitude, uint1 sign, int8 activation) {
    int24 a(activation.to_int());
    // magnitude = 2k+1, k = magnitude >> 1
    int k = magnitude.to_int() >> 1;
    // k×a via shift-and-add (k is 3-bit: 0..7)
    int24 ka(0);
    if (k & 1) ka = ka + a;
    if (k & 2) ka = ka + (a << 1);
    if (k & 4) ka = ka + (a << 2);
    // product = (k×a)<<1 + a = (2k+1)×a
    int24 product = (ka << 1) + a;
    // Apply sign
    if (sign.to_int()) product = int24(0) - product;
    _accum = _accum + product;
    return _accum;
  }

  int24 read_accum() const { return _accum; }

  void clear() { _accum = int24(0); }

 private:
  int24 _accum;
};

}  // namespace opentaalas
```

**Step 4: Build and run test**

Run: `cmake --build build && ctest --test-dir build -R systemc_mac_pe -V`
Expected: PASS

**Step 5: Commit**

```bash
git add model/systemc/src/mac_pe.h test/systemc/test_mac_pe.cpp
git commit -m "feat: rewrite MacPE for IQ3_S codebook magnitudes (INT24 accum)"
```

---

### Task 4: Rewrite DequantUnit for BF16 super-scale + 4-bit sub-scale

**Files:**
- Modify: `model/systemc/src/dequant.h`
- Modify: `test/systemc/test_dequant.cpp`

**Step 1: Rewrite test_dequant.cpp**

Replace the entire file:

```cpp
// test_dequant.cpp — Tests for IQ3_S dequantization
// New: INT24 × BF16_d × (1+2×sub_scale_4bit) → FP32
#include <dequant.h>
#include <bf16_math.h>
#include <cassert>
#include <cmath>
#include <cstdio>

using namespace opentaalas;

static void test_unit_scale() {
  // accum=100, super_scale=BF16(1.0)=0x3F80, sub_scale=0
  // result = 100 × 1.0 × (1+2×0) = 100.0
  DequantUnit dq;
  float result = dq.dequantize(int24(100), uint16(0x3F80), uint4(0));
  assert(std::fabs(result - 100.0f) < 0.01f);
  std::puts("[PASS] unit scale: accum=100, d=1.0, sub=0 → 100.0");
}

static void test_sub_scale_multiplier() {
  // accum=10, d=BF16(1.0)=0x3F80, sub_scale=3
  // result = 10 × 1.0 × (1+2×3) = 10 × 7 = 70.0
  DequantUnit dq;
  float result = dq.dequantize(int24(10), uint16(0x3F80), uint4(3));
  assert(std::fabs(result - 70.0f) < 0.01f);
  std::puts("[PASS] sub_scale=3: 10 × 1.0 × 7 = 70.0");
}

static void test_max_sub_scale() {
  // sub_scale=15: multiplier = 1+2×15 = 31
  // accum=1, d=BF16(1.0)
  // result = 1 × 1.0 × 31 = 31.0
  DequantUnit dq;
  float result = dq.dequantize(int24(1), uint16(0x3F80), uint4(15));
  assert(std::fabs(result - 31.0f) < 0.01f);
  std::puts("[PASS] max sub_scale=15: 1 × 1.0 × 31 = 31.0");
}

static void test_negative_accum() {
  // accum=-50, d=BF16(2.0)=0x4000, sub_scale=0
  // result = -50 × 2.0 × 1 = -100.0
  DequantUnit dq;
  float result = dq.dequantize(int24(-50), uint16(0x4000), uint4(0));
  assert(std::fabs(result - (-100.0f)) < 0.01f);
  std::puts("[PASS] negative accum: -50 × 2.0 × 1 = -100.0");
}

static void test_bf16_scale_precision() {
  // d=BF16(0.125)=0x3E00, accum=80, sub_scale=1
  // result = 80 × 0.125 × (1+2) = 80 × 0.125 × 3 = 30.0
  DequantUnit dq;
  float result = dq.dequantize(int24(80), uint16(0x3E00), uint4(1));
  assert(std::fabs(result - 30.0f) < 0.01f);
  std::puts("[PASS] BF16 scale 0.125: 80 × 0.125 × 3 = 30.0");
}

static void test_ftz_zero_accum() {
  // accum=0 should always produce 0 regardless of scales
  DequantUnit dq;
  float result = dq.dequantize(int24(0), uint16(0x4000), uint4(15));
  assert(result == 0.0f);
  std::puts("[PASS] zero accum → 0.0");
}

static void test_realistic_values() {
  // Simulate a realistic sub-block: accum=1234, d=BF16(0.00390625)=0x3B80, sub=5
  // result = 1234 × 0.00390625 × (1+10) = 1234 × 0.00390625 × 11 = 53.015625
  DequantUnit dq;
  float d_val = 0.00390625f;  // 2^-8
  uint16 d_bf16 = bf16_from_float(d_val);
  float result = dq.dequantize(int24(1234), d_bf16, uint4(5));
  float expected = 1234.0f * d_val * 11.0f;
  assert(std::fabs(result - expected) < 0.1f);
  std::puts("[PASS] realistic values");
}

int main() {
  test_unit_scale();
  test_sub_scale_multiplier();
  test_max_sub_scale();
  test_negative_accum();
  test_bf16_scale_precision();
  test_ftz_zero_accum();
  test_realistic_values();
  std::puts("\nAll dequant tests passed.");
  return 0;
}
```

**Step 2: Run test to verify it fails**

Run: `cmake --build build 2>&1 | grep -i error | head -5`
Expected: FAIL — old DequantUnit interface doesn't match

**Step 3: Rewrite dequant.h**

Replace `model/systemc/src/dequant.h`:

```cpp
#pragma once
#include <opentaalas/types.h>
#include <bf16_math.h>
#include <cstdint>
#include <cstring>

namespace opentaalas {

// IQ3_S Dequantization Unit
// Converts INT24 accumulator to FP32 using BF16 super-scale and 4-bit sub-scale.
// Formula: result = accum × (1 + 2×sub_scale) × bf16_to_fp32(super_scale)
// No subnormal support (FTZ).
class DequantUnit {
 public:
  float dequantize(int24 accum, uint16 super_scale_bf16, uint4 sub_scale) const {
    // Step 1: Integer sub-scale multiplier: 1, 3, 5, ..., 31
    int32_t int_scale = 1 + 2 * sub_scale.to_int();

    // Step 2: Scale the accumulator (INT24 × 5-bit → fits INT32)
    int32_t scaled = static_cast<int32_t>(accum.to_int64()) * int_scale;

    // Step 3: Convert to FP32 (FTZ)
    float fp_accum = static_cast<float>(scaled);

    // Step 4: Expand BF16 super-scale to FP32
    float d = bf16_to_float(super_scale_bf16);

    // Step 5: FP32 multiply (no subnormals)
    float result = fp_accum * d;

    // FTZ: flush subnormal result to zero
    uint32_t bits;
    std::memcpy(&bits, &result, 4);
    if (((bits >> 23) & 0xFF) == 0) result = 0.0f;

    return result;
  }
};

}  // namespace opentaalas
```

**Step 4: Build and run test**

Run: `cmake --build build && ctest --test-dir build -R systemc_dequant -V`
Expected: PASS

**Step 5: Commit**

```bash
git add model/systemc/src/dequant.h test/systemc/test_dequant.cpp
git commit -m "feat: rewrite DequantUnit for IQ3_S (BF16 super + 4-bit sub-scale)"
```

---

### Task 5: Rewrite RomBank for block-packed IQ3_S format

**Files:**
- Modify: `model/systemc/src/rom_bank.h`
- Modify: `test/systemc/test_rom_bank.cpp`

**Step 1: Rewrite test_rom_bank.cpp**

Replace the entire file:

```cpp
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
```

**Step 2: Run test to verify it fails**

Run: `cmake --build build 2>&1 | grep -i error | head -5`
Expected: FAIL — old RomBank interface doesn't match

**Step 3: Rewrite rom_bank.h**

Replace `model/systemc/src/rom_bank.h`:

```cpp
#pragma once
#include <opentaalas/types.h>
#include <cstdint>
#include <cstring>
#include <vector>

namespace opentaalas {

// IQ3_S block: 110 bytes for 256 weights (3.4375 bpw)
struct IQ3SBlock {
  uint16_t d_bf16;       // BF16 super-scale
  uint8_t qs[64];        // codebook indices, low 8 bits (64 groups of 4 weights)
  uint8_t qh[8];         // codebook indices, high 1 bit
  uint8_t signs[32];     // 1 sign bit per weight (256 bits)
  uint8_t scales[4];     // 4-bit sub-scales, packed pairs (8 sub-blocks of 32)
};
static_assert(sizeof(IQ3SBlock) == 110, "IQ3SBlock must be 110 bytes");

// Block-packed IQ3_S ROM bank
// Stores weight blocks in IQ3_S format. Addressed by block index.
class RomBank {
 public:
  RomBank() : _blocks(1024) {}  // default 1024 blocks (256K weights)
  explicit RomBank(int num_blocks) : _blocks(num_blocks) {}

  void write_block(int block_addr, const IQ3SBlock& blk) {
    _blocks[block_addr] = blk;
  }

  IQ3SBlock read_block(int block_addr) const {
    return _blocks[block_addr];
  }

  // Get 9-bit codebook index for weight group within a block
  // group_in_block: 0..63 (each group = 4 weights)
  // IQ3_S indexing follows llama.cpp dequantize_row_iq3_s:
  //   For sub-block pair ib32 (0..3 within half-block):
  //     l = group within sub-block pair (0..3)
  //     index = qs[2*l+0] | ((qh[half] << (8-2*l)) & 256)
  uint9 get_codebook_index(int block_addr, int group_in_block) const {
    const auto& blk = _blocks[block_addr];
    // Each half-block (128 weights) has 4 sub-block pairs, each with 4 groups
    int half = group_in_block / 32;          // 0 or 1
    int within_half = group_in_block % 32;
    int ib32_pair = within_half / 8;         // 0..3 (sub-block pair within half)
    int l = (within_half % 8) / 2;           // 0..3 (group pair within sub-block)
    int lr = within_half % 2;                // 0 or 1 (which of the pair)

    int qs_offset = half * 32 + ib32_pair * 8 + l * 2 + lr;
    int qh_idx = half * 4 + ib32_pair;
    int qh_shift = lr == 0 ? (8 - 2 * l) : (7 - 2 * l);

    uint16_t idx = blk.qs[qs_offset];
    idx |= ((blk.qh[qh_idx] << qh_shift) & 256);
    return uint9(idx);
  }

  // Get sign bit for a specific weight within a block (0..255)
  uint1 get_sign(int block_addr, int weight_in_block) const {
    const auto& blk = _blocks[block_addr];
    int byte_idx = weight_in_block / 8;
    int bit_idx = weight_in_block % 8;
    return uint1((blk.signs[byte_idx] >> bit_idx) & 1);
  }

  // Get 4-bit sub-scale for a sub-block (0..7, each = 32 weights)
  uint4 get_sub_scale(int block_addr, int sub_block_idx) const {
    const auto& blk = _blocks[block_addr];
    int byte_idx = sub_block_idx / 2;
    if (sub_block_idx % 2 == 0)
      return uint4(blk.scales[byte_idx] & 0xF);
    else
      return uint4(blk.scales[byte_idx] >> 4);
  }

  // Get BF16 super-scale for a block
  uint16 get_super_scale(int block_addr) const {
    return uint16(_blocks[block_addr].d_bf16);
  }

 private:
  std::vector<IQ3SBlock> _blocks;
};

}  // namespace opentaalas
```

**Step 4: Build and run test**

Run: `cmake --build build && ctest --test-dir build -R systemc_rom_bank -V`
Expected: PASS

**Step 5: Commit**

```bash
git add model/systemc/src/rom_bank.h test/systemc/test_rom_bank.cpp
git commit -m "feat: rewrite RomBank for IQ3_S block-packed format (110 bytes/256 weights)"
```

---
### Task 6: Rewrite MacArray to compose IQ3_S modules

**Files:**
- Modify: `model/systemc/src/mac_array.h`
- Modify: `test/systemc/test_mac_array.cpp`

**Step 1: Rewrite test_mac_array.cpp**

Replace the entire file:

```cpp
// test_mac_array.cpp — Tests for IQ3_S MAC Array GEMV engine
#include <mac_array.h>
#include <bf16_math.h>
#include <cassert>
#include <cmath>
#include <cstdio>

using namespace opentaalas;

static void test_block_write_read() {
  MacArray arr;
  IQ3SBlock blk = {};
  blk.d_bf16 = 0x3F80;
  blk.qs[0] = 0x00;  // codebook index 0 → magnitudes (1,1,1,1)
  arr.write_block(0, blk);
  IQ3SBlock got = arr.read_block(0);
  assert(got.d_bf16 == 0x3F80);
  assert(got.qs[0] == 0x00);
  std::puts("[PASS] block write/read");
}

static void test_single_mac() {
  MacArray arr;
  // mag=3, sign=0, act=10 → product = 30
  arr.mac_step(0, uint4(3), uint1(0), int8(10));
  assert(arr.read_accum(0).to_int64() == 30);
  std::puts("[PASS] single MAC step");
}

static void test_independent_pes() {
  MacArray arr;
  arr.mac_step(0, uint4(1), uint1(0), int8(10));   // PE0: +10
  arr.mac_step(1, uint4(5), uint1(0), int8(3));    // PE1: +15
  arr.mac_step(2, uint4(7), uint1(1), int8(2));    // PE2: -14
  arr.mac_step(3, uint4(15), uint1(0), int8(1));   // PE3: +15
  assert(arr.read_accum(0).to_int64() == 10);
  assert(arr.read_accum(1).to_int64() == 15);
  assert(arr.read_accum(2).to_int64() == -14);
  assert(arr.read_accum(3).to_int64() == 15);
  std::puts("[PASS] independent PE accumulation");
}

static void test_dequant_output() {
  MacArray arr;
  // Accumulate: 4 × (mag=1, sign=0, act=10) = 40
  for (int i = 0; i < 4; ++i)
    arr.mac_step(0, uint4(1), uint1(0), int8(10));
  assert(arr.read_accum(0).to_int64() == 40);

  // Dequant: 40 × BF16(1.0) × (1+2×0) = 40.0
  float result = arr.read_dequant(0, uint16(0x3F80), uint4(0));
  assert(std::fabs(result - 40.0f) < 0.01f);
  std::puts("[PASS] dequant output");
}

static void test_dequant_with_sub_scale() {
  MacArray arr;
  arr.mac_step(0, uint4(1), uint1(0), int8(10));  // accum=10
  // Dequant: 10 × BF16(0.5)=0x3F00 × (1+2×3)=7 → 10 × 0.5 × 7 = 35.0
  float result = arr.read_dequant(0, uint16(0x3F00), uint4(3));
  assert(std::fabs(result - 35.0f) < 0.01f);
  std::puts("[PASS] dequant with sub_scale=3");
}

static void test_fp32_accumulator() {
  MacArray arr;
  // Simulate two sub-blocks on PE0
  arr.mac_step(0, uint4(3), uint1(0), int8(10));  // accum=30
  float partial1 = arr.read_dequant(0, uint16(0x3F80), uint4(0));  // 30.0
  arr.accumulate_fp32(0, partial1);

  arr.clear_pe(0);
  arr.mac_step(0, uint4(5), uint1(0), int8(5));   // accum=25
  float partial2 = arr.read_dequant(0, uint16(0x3F80), uint4(1));  // 25×3=75.0
  arr.accumulate_fp32(0, partial2);

  float row_result = arr.read_fp32_accum(0);
  assert(std::fabs(row_result - 105.0f) < 0.01f);  // 30 + 75
  std::puts("[PASS] FP32 accumulator across sub-blocks");
}

static void test_clear_all() {
  MacArray arr;
  for (int i = 0; i < 4; ++i)
    arr.mac_step(i, uint4(3), uint1(0), int8(10));
  arr.clear_all();
  for (int i = 0; i < 4; ++i) {
    assert(arr.read_accum(i).to_int64() == 0);
    assert(arr.read_fp32_accum(i) == 0.0f);
  }
  std::puts("[PASS] clear_all resets INT24 and FP32 accumulators");
}

int main() {
  test_block_write_read();
  test_single_mac();
  test_independent_pes();
  test_dequant_output();
  test_dequant_with_sub_scale();
  test_fp32_accumulator();
  test_clear_all();
  std::puts("\nAll mac_array tests passed.");
  return 0;
}
```

**Step 2: Run test to verify it fails**

Run: `cmake --build build 2>&1 | grep -i error | head -5`
Expected: FAIL — old MacArray interface doesn't match

**Step 3: Rewrite mac_array.h**

Replace `model/systemc/src/mac_array.h`:

```cpp
#pragma once
#include <opentaalas/types.h>
#include <mac_pe.h>
#include <dequant.h>
#include <rom_bank.h>
#include <codebook_decoder.h>

namespace opentaalas {

// IQ3_S MAC Array GEMV Engine
// Composes: 4× MacPE + RomBank + CodebookDecoder + DequantUnit + FP32 accumulators
class MacArray {
 public:
  MacArray() {
    for (int i = 0; i < 4; ++i) _fp32_accum[i] = 0.0f;
  }

  // --- Weight ROM access ---
  void write_block(int block_addr, const IQ3SBlock& blk) {
    _rom.write_block(block_addr, blk);
  }

  IQ3SBlock read_block(int block_addr) const {
    return _rom.read_block(block_addr);
  }

  // --- MAC operations ---
  int24 mac_step(int pe_id, uint4 magnitude, uint1 sign, int8 activation) {
    return _pe[pe_id].mac(magnitude, sign, activation);
  }

  int24 read_accum(int pe_id) const {
    return _pe[pe_id].read_accum();
  }

  // --- Dequantization ---
  float read_dequant(int pe_id, uint16 super_scale_bf16, uint4 sub_scale) const {
    return _dequant.dequantize(_pe[pe_id].read_accum(), super_scale_bf16, sub_scale);
  }

  // --- FP32 row accumulator ---
  void accumulate_fp32(int pe_id, float partial) {
    _fp32_accum[pe_id] += partial;
  }

  float read_fp32_accum(int pe_id) const {
    return _fp32_accum[pe_id];
  }

  // --- Codebook decode ---
  void decode_codebook(uint9 index, uint4& m0, uint4& m1, uint4& m2, uint4& m3) const {
    _codebook.decode(index, m0, m1, m2, m3);
  }

  // --- Control ---
  void clear_pe(int pe_id) {
    _pe[pe_id].clear();
  }

  void clear_fp32(int pe_id) {
    _fp32_accum[pe_id] = 0.0f;
  }

  void clear_all() {
    for (int i = 0; i < 4; ++i) {
      _pe[i].clear();
      _fp32_accum[i] = 0.0f;
    }
  }

 private:
  MacPE _pe[4];
  RomBank _rom;
  CodebookDecoder _codebook;
  DequantUnit _dequant;
  float _fp32_accum[4];
};

}  // namespace opentaalas
```

**Step 4: Build and run test**

Run: `cmake --build build && ctest --test-dir build -R systemc_mac_array -V`
Expected: PASS

**Step 5: Commit**

```bash
git add model/systemc/src/mac_array.h test/systemc/test_mac_array.cpp
git commit -m "feat: rewrite MacArray for IQ3_S (codebook + BF16 scales + FP32 accum)"
```

---

### Task 7: Remove ScaleStore, update downstream modules

**Files:**
- Modify: `test/systemc/CMakeLists.txt` (remove scale_store from module list)
- Modify: `model/systemc/src/attention_unit.h` (update if it references old types)
- Modify: `model/systemc/src/vector_unit.h` (update if it references old dequant)
- Modify: `model/systemc/src/layer_tile.h` (update if it references MacArray)
- Modify: `model/systemc/src/embed_rom.h` (update if it references old scale types)
- Modify: `model/systemc/src/lm_head.h` (update if it references old scale types)
- Modify: `model/systemc/src/llama_chip.h` (update if it references old types)

**Step 1: Remove scale_store from test CMakeLists.txt**

In `test/systemc/CMakeLists.txt`, remove `scale_store` from `_systemc_modules`:

```
set(_systemc_modules
  bf16_math
  rom_bank lut_interp
  mac_pe dequant mac_array
  codebook_decoder
  kv_cache attention_unit rmsnorm swiglu rope
  vector_unit layer_tile
  embed_rom lm_head global_controller llama_chip
)
```

**Step 2: Update downstream modules**

For each downstream module that references old types (`uint3` weights, `uint8` FP8 scales, `int32` accumulators, old MacArray/DequantUnit interfaces), update to use the new IQ3_S types. The key changes:

- Replace `uint3` weight references with `uint4` magnitude + `uint1` sign
- Replace `uint8` FP8 bank scale with `uint16` BF16 super-scale + `uint4` sub-scale
- Replace `int32` accumulator with `int24`
- Replace `uint32` FP32 tensor scale with the new dequant interface
- Update any module that instantiates MacArray or DequantUnit

Read each downstream module, identify references to old types, and update. If a module only uses BF16 math (like rmsnorm, swiglu, rope), it likely needs no changes.

**Step 3: Build and run all tests**

Run: `cmake --build build && ctest --test-dir build -L systemc -V`
Expected: All tests PASS (some downstream tests may need minor updates to match new interfaces)

**Step 4: Commit**

```bash
git add -A
git commit -m "refactor: remove ScaleStore, update downstream modules for IQ3_S types"
```

---

### Task 8: Update Kanagawa HLS modules

**Files:**
- Modify: `rtl/kanagawa/mac_pe.k`
- Modify: `rtl/kanagawa/dequant.k`
- Modify: `rtl/kanagawa/rom_bank.k`
- Create: `rtl/kanagawa/codebook_decoder.k`
- Modify: `rtl/kanagawa/mac_array.k`
- Remove: `rtl/kanagawa/scale_store.k` (or keep as deprecated stub)

**Step 1: Rewrite mac_pe.k**

```kanagawa
// OpenTaalas - IQ3_S MAC Processing Element
// Multiplies codebook magnitude (uint4, odd 1-15) by INT8 activation
// with separate sign bit, accumulates into INT24 register.
// Uses shift-and-add: mag = 2k+1, so mag×a = (k×a)<<1 + a

module opentaalas.mac_pe
    { mac_pe
    }

class mac_pe
{
private:
    int<24> _accum = 0;

public:
    int<24> mac(uint4 magnitude, uint<1> sign_bit, int8 activation)
    {
        int<24> result;
        atomic
        {
            int<24> a = cast<int<24>>(activation);
            int<24> k_val = cast<int<24>>(magnitude >> 1);

            // k×a via shift-and-add
            int<24> ka = 0;
            if ((k_val & 1) != 0) { ka = ka + a; }
            if ((k_val & 2) != 0) { ka = ka + (a << 1); }
            if ((k_val & 4) != 0) { ka = ka + (a << 2); }

            // product = (k×a)<<1 + a = (2k+1)×a
            int<24> product = (ka << 1) + a;

            // Apply sign
            if (sign_bit == 1)
            {
                product = 0 - product;
            }

            _accum = _accum + product;
            result = _accum;
        }
        return result;
    }

    int<24> read_accum()
    {
        return _accum;
    }

    void clear()
    {
        atomic
        {
            _accum = 0;
        }
    }
}

export mac_pe;
```

**Step 2: Create codebook_decoder.k**

```kanagawa
// OpenTaalas - IQ3_S Codebook Decoder
// 512-entry LUT mapping 9-bit index to 4× 4-bit unsigned magnitudes.
// Values from iq3s_grid[] in llama.cpp.

module opentaalas.codebook_decoder
    { codebook_decoder
    }

class codebook_decoder
{
private:
    [[memory]] uint32[512] _grid;

public:
    // Decode 9-bit index into 4 magnitudes
    uint4 decode_m0(uint<9> index) { return cast<uint4>(_grid[index] & 0xFF); }
    uint4 decode_m1(uint<9> index) { return cast<uint4>((_grid[index] >> 8) & 0xFF); }
    uint4 decode_m2(uint<9> index) { return cast<uint4>((_grid[index] >> 16) & 0xFF); }
    uint4 decode_m3(uint<9> index) { return cast<uint4>((_grid[index] >> 24) & 0xFF); }

    // Write grid entry (for initialization)
    void write_entry(uint<9> index, uint32 value)
    {
        atomic { _grid[index] = value; }
    }

    uint32 read_entry(uint<9> index)
    {
        return _grid[index];
    }
}

export codebook_decoder;
```

**Step 3: Rewrite dequant.k, rom_bank.k, mac_array.k**

Follow the same pattern as the SystemC models — mirror the interfaces exactly. Key changes:
- `dequant.k`: `dequantize(int<24> accum, uint16 super_scale_bf16, uint4 sub_scale) → uint32` (FP32 bit pattern)
- `rom_bank.k`: Block-packed storage with `read_block`/`write_block` and accessor methods
- `mac_array.k`: Compose new MacPE + RomBank + CodebookDecoder + DequantUnit

**Step 4: Build Kanagawa modules**

Run: `cmake --build build -t kanagawa_compile 2>&1 | tail -20`
Expected: All modules compile to SystemVerilog

**Step 5: Commit**

```bash
git add rtl/kanagawa/
git commit -m "feat: rewrite Kanagawa HLS modules for IQ3_S architecture"
```

---

### Task 9: IQ3_S quantized forward pass tool

**Files:**
- Create: `tools/llama_iq3s_forward.cpp`
- Modify: `tools/CMakeLists.txt` (add llama_iq3s_forward target)

**Step 1: Create llama_iq3s_forward.cpp**

This is the C model validation tool. It:
1. Loads an IQ3_S GGUF file directly
2. Parses `block_iq3_s` structures using ggml headers
3. Runs full LLaMA 3.1 8B forward pass using hardware compute primitives:
   - Codebook decode: 9-bit index → `iq3s_grid[]` → 4× magnitudes
   - Sign apply from `signs[]` array
   - MAC: `(2k+1) × INT8` shift-and-add → INT24 accumulator
   - Dequant: `INT24 × FP32(BF16_d) × (1+2×sub_scale)` → FP32
   - FP32 accumulation across sub-blocks
   - FP32 × activation_scale → output
4. Non-quantized ops: RMSNorm (float), RoPE (float), softmax (float), SiLU (float)
5. Dumps logits for comparison

Key implementation details:

```cpp
// IQ3_S quantized GEMV
static void iq3s_matvec(float* out, const block_iq3_s* blocks, int n_blocks_per_row,
                         const int8_t* x_q, float x_scale, int rows) {
  for (int r = 0; r < rows; r++) {
    float row_sum = 0.0f;
    const block_iq3_s* row_blocks = blocks + (int64_t)r * n_blocks_per_row;

    for (int b = 0; b < n_blocks_per_row; b++) {
      const block_iq3_s& blk = row_blocks[b];
      float d = fp16_to_float(blk.d);  // FP16 super-scale → FP32
      // Convert to BF16 then back (simulate hardware truncation)
      d = bf16_to_float_hw(fp16_to_bf16_hw(blk.d));

      const uint8_t* qs = blk.qs;
      const uint8_t* qh = blk.qh;
      const uint8_t* signs = blk.signs;
      const int8_t* act = x_q + b * 256;

      // Process 8 sub-blocks of 32 weights each
      for (int ib32 = 0; ib32 < 8; ib32 += 2) {
        uint4_t sub_scale_lo = blk.scales[ib32/2] & 0xF;
        uint4_t sub_scale_hi = blk.scales[ib32/2] >> 4;

        // Sub-block 0 (32 weights)
        int32_t accum = 0;
        for (int l = 0; l < 4; ++l) {
          uint16_t idx1 = qs[2*l+0] | ((qh[0] << (8-2*l)) & 256);
          uint16_t idx2 = qs[2*l+1] | ((qh[0] << (7-2*l)) & 256);
          const uint8_t* grid1 = (const uint8_t*)(iq3s_grid + idx1);
          const uint8_t* grid2 = (const uint8_t*)(iq3s_grid + idx2);
          uint8_t sign_byte = signs[l];
          for (int j = 0; j < 4; ++j) {
            int mag = grid1[j];
            int s = (sign_byte >> j) & 1;
            accum += mac_pe_iq3s(mag, s, act[l*8+j]);
          }
          for (int j = 0; j < 4; ++j) {
            int mag = grid2[j];
            int s = (sign_byte >> (j+4)) & 1;
            accum += mac_pe_iq3s(mag, s, act[l*8+4+j]);
          }
        }
        int int_scale = 1 + 2 * sub_scale_lo;
        row_sum += (float)(accum * int_scale) * d;

        // Sub-block 1 (next 32 weights) — similar with sub_scale_hi
        // ... (same pattern with qs+8, signs+4, qh+1)
        qs += 16; signs += 8; qh += 2; act += 64;
      }
    }
    out[r] = row_sum * x_scale;
  }
}
```

The MAC primitive:
```cpp
static inline int32_t mac_pe_iq3s(int magnitude, int sign, int8_t activation) {
  int k = magnitude >> 1;
  int32_t a = activation;
  int32_t ka = 0;
  if (k & 1) ka += a;
  if (k & 2) ka += (a << 1);
  if (k & 4) ka += (a << 2);
  int32_t product = (ka << 1) + a;
  return sign ? -product : product;
}
```

**Step 2: Add to tools/CMakeLists.txt**

After the `llama_quantized_forward` target, add:

```cmake
  # --- IQ3_S Forward Pass ---
  add_executable(llama_iq3s_forward llama_iq3s_forward.cpp)
  target_include_directories(llama_iq3s_forward PRIVATE
    "${_llama_src}/include"
    "${_llama_src}/ggml/include"
    "${_llama_src}/ggml/src"
    "${CMAKE_CURRENT_SOURCE_DIR}")
  target_link_libraries(llama_iq3s_forward PRIVATE ggml)
```

**Step 3: Build**

Run: `cmake --build build -t llama_iq3s_forward`
Expected: Compiles successfully

**Step 4: Commit**

```bash
git add tools/llama_iq3s_forward.cpp tools/CMakeLists.txt
git commit -m "feat: IQ3_S quantized forward pass tool (hardware compute path)"
```

---

### Task 10: Download IQ3_S GGUF and validate

**Step 1: Download the IQ3_S GGUF**

```bash
cd /home/mana/workspace/OpenTaalas
mkdir -p models
# Download from HuggingFace (bartowski's quantization)
wget -O models/Meta-Llama-3.1-8B-Instruct-IQ3_S.gguf \
  "https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF/resolve/main/Meta-Llama-3.1-8B-Instruct-IQ3_S.gguf"
```

**Step 2: Extract reference logits using tensor_extractor (llama.cpp)**

```bash
./build/tools/tensor_extractor \
  --model models/Meta-Llama-3.1-8B-Instruct-IQ3_S.gguf \
  --prompt "The capital of France is" \
  --output results/iq3s_reference/
```

Note the token IDs printed to stderr — you'll need them for the forward pass.

**Step 3: Run IQ3_S forward pass**

```bash
./build/tools/llama_iq3s_forward \
  models/Meta-Llama-3.1-8B-Instruct-IQ3_S.gguf \
  <token_ids_comma_separated> \
  results/iq3s_hw/
```

**Step 4: Compare results**

```bash
./build/tools/compare_tensors results/iq3s_reference/ results/iq3s_hw/
```

Expected output:
```
cosine_similarity: > 0.99
max_abs_error: < 1.0
argmax_match: YES (same predicted token)
```

**Step 5: Commit results**

```bash
git add tools/ docs/
git commit -m "feat: IQ3_S validation — cosine>0.99 vs llama.cpp reference"
```

---

## Summary

| Task | Module | What Changes |
|------|--------|-------------|
| 1 | types.h, bf16_math.h | Add INT24, uint9, uint1, FP16→BF16, FP32 FTZ |
| 2 | codebook_decoder.h | New: 512-entry LUT from iq3s_grid[] |
| 3 | mac_pe.h | Rewrite: (2k+1)×INT8 + sign → INT24 |
| 4 | dequant.h | Rewrite: INT24 × BF16_d × (1+2×sub4) → FP32 |
| 5 | rom_bank.h | Rewrite: block-packed IQ3_S (110 bytes/256 weights) |
| 6 | mac_array.h | Rewrite: compose new modules + FP32 accum |
| 7 | downstream | Remove ScaleStore, update dependent modules |
| 8 | Kanagawa HLS | Mirror SystemC changes in .k files |
| 9 | llama_iq3s_forward.cpp | New: IQ3_S forward pass validation tool |
| 10 | validation | Download GGUF, run, compare cosine>0.99 |
