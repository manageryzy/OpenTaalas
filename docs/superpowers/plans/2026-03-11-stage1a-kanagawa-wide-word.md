# Stage 1A: Kanagawa Wide-Word ROM Restructuring

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Restructure 5 Kanagawa ROM modules from narrow byte-addressed arrays to wide-word arrays, eliminating RAM duplication (25 → 9 instances) and enabling physical ROM macro integration.

**Architecture:** Each ROM module gets a single wide-word `[[memory]]` declaration matching its natural data structure. Accessor methods become one `read_*` method returning the full row, with field extraction in combinational logic. SystemC models and co-sim tests updated to match.

**Tech Stack:** Kanagawa HLS (.k), SystemC (C++17), Verilator, CMake/CTest

**Spec:** `docs/superpowers/specs/2026-03-11-sram-rom-macro-integration-design.md`

---

## File Structure

### Kanagawa Source (modify)
- `rtl/kanagawa/rom_bank.k` — `uint8[112640]` → `uint<880>[1024]`, 6 accessors → 2 methods
- `rtl/kanagawa/mac_array.k` — same ROM change + consolidate `decode_m0-3` → `read_grid`
- `rtl/kanagawa/rope.k` — `uint16[262144]` → `uint<1024>[4096]` per table
- `rtl/kanagawa/vector_unit.k` — same rope table change, `rope_get_cos/sin` → `rope_read_cos_row/sin_row`
- `rtl/kanagawa/embed_rom.k` — `uint3[4194304]` → `uint<192>[65536]`

### SystemC Models (modify)
- `model/systemc/src/rom_bank.h` — add `read_block_raw() → uint880_t`, keep IQ3SBlock for internal use
- `model/systemc/src/mac_array.h` — match rom_bank interface change
- `model/systemc/src/rope.h` — add `read_cos_row(pos) → array<uint16,64>`
- `model/systemc/src/vector_unit.h` — match rope interface change
- `model/systemc/src/embed_rom.h` — add `read_chunk(addr) → array<uint3,64>`

### Verilator Tests (modify)
- `test/verilator/test_vl_rom_bank.cpp` — new port names, test wide-word read + field extraction
- `test/verilator/test_vl_mac_array.cpp` — new ROM port names
- `test/verilator/test_vl_rope.cpp` — new wide-word port names
- `test/verilator/test_vl_vector_unit.cpp` — new rope port names
- `test/verilator/test_vl_embed_rom.cpp` — new chunk-based port names
- `test/verilator/test_vl_layer_e2e.cpp` — update DEFINE_MAC_HELPERS macro, VPU rope helpers
- `test/verilator/test_vl_transformer_layer.cpp` — same updates as E2E

---

## Chunk 1: rom_bank + mac_array

### Task 1: Rewrite rom_bank.k to wide-word

**Files:**
- Modify: `rtl/kanagawa/rom_bank.k`

The key change: replace `[[memory]] uint8[112640] _data` with `[[memory]] uint<880>[1024] _blocks`. Replace 6 accessor methods with 2 methods: `read_block` and `write_block`.

- [ ] **Step 1: Rewrite rom_bank.k**

```kanagawa
// OpenTaalas - IQ3_S Block-Packed ROM Bank (Wide-Word)
// 1024 blocks stored as 880-bit wide words.
// Each 880-bit word = one Q3_K block (110 bytes):
//   bits [15:0]     d_bf16 (super-scale, little-endian)
//   bits [527:16]   qs[64] (codebook indices, low 8 bits)
//   bits [591:528]  qh[8] (codebook indices, high bits)
//   bits [847:592]  signs[32] (256 sign bits)
//   bits [879:848]  scales[4] (8 x 4-bit sub-scales, packed)

module opentaalas.rom_bank
    { rom_bank
    }

class rom_bank
{
private:
    [[memory]] uint<880>[1024] _blocks;

public:
    // Read full 880-bit block
    uint<880> read_block(uint<16> block_addr)
    {
        uint<880> result;
        atomic
        {
            result = _blocks[block_addr];
        }
        return result;
    }

    // Write full 880-bit block (initialization only)
    void write_block(uint<16> block_addr, uint<880> value)
    {
        atomic
        {
            _blocks[block_addr] = value;
        }
    }
}

export rom_bank;
```

- [ ] **Step 2: Regenerate RTL for rom_bank**

```bash
.build/kanagawa/dist/bin/kanagawa \
  --backend=sv \
  --import-dir=third-party/kanagawa/library \
  --base-library=third-party/kanagawa/library/mini-base.k \
  --output=rtl/generated/kanagawa/rom_bank \
  rtl/kanagawa/rom_bank.k
```

Expected: Generates `rom_bankrom_bank.sv` and `rom_bankrom_bank_types.sv`. Verify only **1** `KanagawaSyncRam` instance (was 7):

```bash
grep -c 'KanagawaSyncRam' rtl/generated/kanagawa/rom_bankrom_bank.sv
# Expected: 1
```

- [ ] **Step 3: Commit**

```bash
git add rtl/kanagawa/rom_bank.k rtl/generated/kanagawa/rom_bankrom_bank*.sv
git commit -m "rtl: rom_bank wide-word rewrite (uint8[112640] → uint<880>[1024])"
```

### Task 2: Update rom_bank SystemC model

**Files:**
- Modify: `model/systemc/src/rom_bank.h`

The SystemC model already stores structured `IQ3SBlock` objects. Add a method that packs a block into an 880-bit word (matching the RTL bit layout) and one that reads back the raw 880-bit word. Keep existing `IQ3SBlock`-based methods for internal use by other SystemC models.

- [ ] **Step 1: Add wide-word pack/unpack to rom_bank.h**

Add after the existing class definition's private members:

```cpp
// Pack IQ3SBlock into 880-bit word matching RTL bit layout
// bits [15:0]     d_bf16
// bits [527:16]   qs[64]
// bits [591:528]  qh[8]
// bits [847:592]  signs[32]
// bits [879:848]  scales[4]
static std::array<uint8_t, 110> pack_block_bytes(const IQ3SBlock& blk) {
    std::array<uint8_t, 110> bytes{};
    bytes[0] = blk.d & 0xFF;
    bytes[1] = (blk.d >> 8) & 0xFF;
    std::memcpy(&bytes[2], blk.qs.data(), 64);
    std::memcpy(&bytes[66], blk.qh.data(), 8);
    std::memcpy(&bytes[74], blk.signs.data(), 32);
    std::memcpy(&bytes[106], blk.scales.data(), 4);
    return bytes;
}
```

Add a public method to read a block as the 880-bit wide word (as a `std::array<uint8_t, 110>` byte representation, since C++ doesn't have native 880-bit integers):

```cpp
std::array<uint8_t, 110> read_block_bytes(int block_addr) const {
    return pack_block_bytes(_blocks[block_addr]);
}
```

- [ ] **Step 2: Run SystemC tests**

```bash
cmake --build .build --target test_rom_bank
ctest --test-dir .build -R systemc_rom_bank -V
```

Expected: PASS (existing tests still work — we only added methods, didn't change existing ones).

- [ ] **Step 3: Commit**

```bash
git add model/systemc/src/rom_bank.h
git commit -m "model: add wide-word pack/read to rom_bank SystemC model"
```

### Task 3: Update rom_bank co-sim test

**Files:**
- Modify: `test/verilator/test_vl_rom_bank.cpp`

The RTL now has only 2 methods: `read_block` and `write_block`. Port names change:
- Old: `write_byte_*`, `read_byte_*`, `get_super_scale_*`, `get_codebook_index_*`, `get_sign_*`, `get_sub_scale_*`
- New: `write_block_block_addr_in[15:0]`, `write_block_value_in[879:0]`, `read_block_block_addr_in[15:0]`, `read_block_result_out[879:0]`

The test must:
1. Pack test data into 880-bit words
2. Write blocks via `write_block`
3. Read back via `read_block`
4. Extract fields from the 880-bit result and verify against expected values
5. Compare RTL read_block output against SystemC `read_block_bytes` output

- [ ] **Step 1: Rewrite test_vl_rom_bank.cpp**

Key changes needed:
- Replace all 6 method helpers with 2 helpers: `write_block_rtl(addr, data_880bit)` and `read_block_rtl(addr) → 880bit`
- Pack test `IQ3SBlock` into 880-bit value using the same byte layout
- After `read_block`, extract and verify: super_scale from bits[15:0], codebook index from bits[527:16] + bits[591:528], sign from bits[847:592], sub_scale from bits[879:848]
- Compare each extracted field against SystemC model's equivalent

The 880-bit value is accessed via Verilator's `VlWide<28>` type (28 × 32-bit words = 896 bits, with upper 16 bits unused). Access pattern:
```cpp
// Write: dut->write_block_value_in[0] = bits[31:0], ..., dut->write_block_value_in[27] = bits[879:864]
// Read: dut->read_block_result_out[0] = bits[31:0], ...
```

Field extraction helpers (pure C++, no RTL):
```cpp
uint16_t extract_super_scale(const VlWide<28>& block) {
    return block[0] & 0xFFFF;  // bits [15:0]
}

uint8_t extract_qs(const VlWide<28>& block, int idx) {
    // bits [527:16], byte idx in range 0..63
    int bit_offset = 16 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    return (block[word] >> shift) & 0xFF;
}

uint8_t extract_qh(const VlWide<28>& block, int idx) {
    // bits [591:528], byte idx in range 0..7
    int bit_offset = 528 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    return (block[word] >> shift) & 0xFF;
}

uint8_t extract_sign_byte(const VlWide<28>& block, int idx) {
    // bits [847:592], byte idx in range 0..31
    int bit_offset = 592 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    return (block[word] >> shift) & 0xFF;
}

uint8_t extract_scale_byte(const VlWide<28>& block, int idx) {
    // bits [879:848], byte idx in range 0..3
    int bit_offset = 848 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    return (block[word] >> shift) & 0xFF;
}
```

Write helper packs 110 bytes into `VlWide<28>`:
```cpp
void pack_block(VlWide<28>& out, const std::array<uint8_t, 110>& bytes) {
    memset(&out, 0, sizeof(out));
    for (int i = 0; i < 110; i++) {
        int bit_offset = i * 8;
        int word = bit_offset / 32;
        int shift = bit_offset % 32;
        out[word] |= ((uint32_t)bytes[i]) << shift;
        if (shift > 24) {  // crosses word boundary
            out[word + 1] |= ((uint32_t)bytes[i]) >> (32 - shift);
        }
    }
}
```

- [ ] **Step 2: Build and run rom_bank co-sim test**

```bash
cmake --build .build --target test_vl_rom_bank
ctest --test-dir .build -R verilator_rom_bank -V
```

Expected: PASS — RTL read_block returns correct 880-bit words, field extraction matches expected values.

- [ ] **Step 3: Commit**

```bash
git add test/verilator/test_vl_rom_bank.cpp
git commit -m "test: update rom_bank co-sim for wide-word interface"
```

### Task 4: Rewrite mac_array.k ROM to wide-word

**Files:**
- Modify: `rtl/kanagawa/mac_array.k`

Replace the duplicated rom_bank byte-level logic with wide-word ROM access. Also consolidate `decode_m0/m1/m2/m3` into `read_grid`.

Changes:
1. `[[memory]] uint8[112640] _rom` → `[[memory]] uint<880>[1024] _rom`
2. Remove: `write_rom_byte`, `get_super_scale`, `get_codebook_index`, `get_sign`, `get_sub_scale`
3. Add: `read_rom_block(uint<16> block_addr) → uint<880>`, `write_rom_block(uint<16> block_addr, uint<880> value)`
4. `[[memory]] uint32[512] _grid` stays (small enough for gates)
5. Replace `decode_m0/m1/m2/m3` with single `read_grid(uint<9> index) → uint32`
6. Remove `write_grid_entry`, replace with `write_grid(uint<9> index, uint32 value)` (same logic, cleaner name)

- [ ] **Step 1: Rewrite mac_array.k**

```kanagawa
// OpenTaalas - IQ3_S MAC Array GEMV Engine (Wide-Word ROM)
// 4 PE accumulators + wide-word weight ROM + codebook + dequant

module opentaalas.mac_array
    { mac_array
    }

class mac_array
{
private:
    int<24>[4] _accum;
    uint32[4] _fp32_accum;

    // Weight ROM: 1024 blocks x 880 bits (110 bytes per block)
    [[memory]] uint<880>[1024] _rom;

    // Codebook: 512 entries x 32 bits
    [[memory]] uint32[512] _grid;

public:
    // --- MAC operation (unchanged) ---
    int<24> mac_step(uint<2> pe_id, uint4 magnitude, uint<1> sign_bit, int8 activation)
    {
        int<24> result;
        atomic
        {
            int<24> a = cast<int<24>>(activation);
            int<24> k_val = cast<int<24>>(magnitude >> 1);
            int<24> ka = 0;
            if ((k_val & 1) != 0) { ka = ka + a; }
            if ((k_val & 2) != 0) { ka = ka + (a << 1); }
            if ((k_val & 4) != 0) { ka = ka + (a << 2); }
            int<24> product = (ka << 1) + a;
            if (sign_bit == 1) { product = 0 - product; }
            _accum[pe_id] = _accum[pe_id] + product;
            result = _accum[pe_id];
        }
        return result;
    }

    int<24> read_accum(uint<2> pe_id) { return _accum[pe_id]; }

    // --- Wide-word ROM access ---
    uint<880> read_rom_block(uint<16> block_addr)
    {
        uint<880> result;
        atomic { result = _rom[block_addr]; }
        return result;
    }

    void write_rom_block(uint<16> block_addr, uint<880> value)
    {
        atomic { _rom[block_addr] = value; }
    }

    // --- Codebook access (consolidated) ---
    uint32 read_grid(uint<9> index)
    {
        uint32 result;
        atomic { result = _grid[index]; }
        return result;
    }

    void write_grid(uint<9> index, uint32 value)
    {
        atomic { _grid[index] = value; }
    }

    // --- FP32 accumulator ---
    void set_fp32_accum(uint<2> pe_id, uint32 value)
    {
        atomic { _fp32_accum[pe_id] = value; }
    }

    uint32 read_fp32_accum(uint<2> pe_id) { return _fp32_accum[pe_id]; }

    // --- Control ---
    void clear_pe(uint<2> pe_id) { atomic { _accum[pe_id] = 0; } }
    void clear_fp32(uint<2> pe_id) { atomic { _fp32_accum[pe_id] = 0; } }
    void clear_all()
    {
        atomic
        {
            _accum[0] = 0; _accum[1] = 0; _accum[2] = 0; _accum[3] = 0;
            _fp32_accum[0] = 0; _fp32_accum[1] = 0; _fp32_accum[2] = 0; _fp32_accum[3] = 0;
        }
    }
}

export mac_array;
```

- [ ] **Step 2: Regenerate RTL and verify RAM count**

```bash
.build/kanagawa/dist/bin/kanagawa \
  --backend=sv \
  --import-dir=third-party/kanagawa/library \
  --base-library=third-party/kanagawa/library/mini-base.k \
  --output=rtl/generated/kanagawa/mac_array \
  rtl/kanagawa/mac_array.k

grep -c 'KanagawaSyncRam' rtl/generated/kanagawa/mac_arraymac_array.sv
# Expected: 2 (1 ROM + 1 grid, was 10)
```

- [ ] **Step 3: Commit**

```bash
git add rtl/kanagawa/mac_array.k rtl/generated/kanagawa/mac_arraymac_array*.sv
git commit -m "rtl: mac_array wide-word ROM + consolidated grid access"
```

### Task 5: Update mac_array SystemC model and co-sim test

**Files:**
- Modify: `model/systemc/src/mac_array.h`
- Modify: `test/verilator/test_vl_mac_array.cpp`

The SystemC `MacArray` already delegates to a `RomBank` internally, so the interface change is at the mac_array level only — replace per-field ROM methods with `read_rom_block → 880-bit` and `read_grid → uint32`.

- [ ] **Step 1: Update mac_array.h**

Add `read_rom_block_bytes` that delegates to `_rom.read_block_bytes()`. Replace `decode_codebook` (returns all 4 mags) with `read_grid(index) → uint32` returning the raw grid entry. Callers extract bytes themselves.

```cpp
std::array<uint8_t, 110> read_rom_block_bytes(int block_addr) const {
    return _rom.read_block_bytes(block_addr);
}

uint32_t read_grid(int index) const {
    return _grid_entries[index];
}
```

- [ ] **Step 2: Run SystemC test**

```bash
cmake --build .build --target test_mac_array
ctest --test-dir .build -R systemc_mac_array -V
```

Expected: PASS.

- [ ] **Step 3: Update test_vl_mac_array.cpp**

The standalone mac_array test only exercises `mac_step`, `read_accum`, `clear_*`, and FP32 accumulator methods — NOT the ROM or grid. These methods are unchanged, so the test needs only port name updates for `write_grid_entry` → `write_grid` and removal of `decode_m0-3` → `read_grid`. Since the test doesn't actually call those ROM/grid methods, changes are minimal.

Verify no compilation errors with the new RTL port names.

- [ ] **Step 4: Build and run mac_array co-sim**

```bash
cmake --build .build --target test_vl_mac_array
ctest --test-dir .build -R verilator_mac_array -V
```

Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add model/systemc/src/mac_array.h test/verilator/test_vl_mac_array.cpp
git commit -m "model+test: update mac_array for wide-word ROM interface"
```

### Task 6: Update E2E and layer tests for rom_bank/mac_array changes

**Files:**
- Modify: `test/verilator/test_vl_layer_e2e.cpp`
- Modify: `test/verilator/test_vl_transformer_layer.cpp`

Both tests use a `DEFINE_MAC_HELPERS(PREFIX)` macro that generates port-driving helper functions for all mac_array methods. This macro must be updated for the new port names:

Old ROM methods → removed:
- `PREFIX_write_rom_byte_*` → replaced by `PREFIX_write_rom_block_*`
- `PREFIX_get_super_scale_*` → removed (caller extracts from 880-bit word)
- `PREFIX_get_codebook_index_*` → removed
- `PREFIX_get_sign_*` → removed
- `PREFIX_get_sub_scale_*` → removed
- `PREFIX_decode_m0/m1/m2/m3_*` → replaced by `PREFIX_read_grid_*`
- `PREFIX_write_grid_entry_*` → replaced by `PREFIX_write_grid_*`

New ROM methods:
- `PREFIX_write_rom_block_block_addr_in[15:0]`, `PREFIX_write_rom_block_value_in[879:0]`
- `PREFIX_read_rom_block_block_addr_in[15:0]`, `PREFIX_read_rom_block_result_out[879:0]`
- `PREFIX_read_grid_index_in[8:0]`, `PREFIX_read_grid_result_out[31:0]`
- `PREFIX_write_grid_index_in[8:0]`, `PREFIX_write_grid_value_in[31:0]`

The weight-programming phase (State 0 in E2E) currently writes bytes one at a time via `write_rom_byte`. It must change to pack full 880-bit blocks and write via `write_rom_block`.

The GEMV phases (States 2-4, 8, 11-14) currently call `get_codebook_index`, `get_sign`, `get_sub_scale`, `get_super_scale` as separate RTL method calls. They must change to:
1. Call `read_rom_block(block_addr)` — one RTL call returning 880 bits
2. Extract fields in C++ (host-side) using the same bit-layout helpers from Task 3

- [ ] **Step 1: Update DEFINE_MAC_HELPERS in both test files**

Replace the macro to generate helpers for the new port names. The macro is defined identically in both files — update both.

- [ ] **Step 2: Update weight programming (State 0)**

Replace byte-by-byte `write_rom_byte` loops with block-at-a-time `write_rom_block` using the `pack_block` helper.

- [ ] **Step 3: Update GEMV phases**

Replace per-field ROM reads (`get_codebook_index`, `get_sign`, etc.) with single `read_rom_block` + host-side extraction.

- [ ] **Step 4: Update codebook decode calls**

Replace `decode_m0/m1/m2/m3` (4 separate RTL calls) with single `read_grid` + host-side byte extraction.

- [ ] **Step 5: Build and run E2E test**

```bash
cmake --build .build --target test_vl_layer_e2e
ctest --test-dir .build -R verilator_layer_e2e -V
```

Expected: All 44 checks PASS.

- [ ] **Step 6: Build and run transformer layer test**

```bash
cmake --build .build --target test_vl_transformer_layer
ctest --test-dir .build -R verilator_transformer_layer -V
```

Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add test/verilator/test_vl_layer_e2e.cpp test/verilator/test_vl_transformer_layer.cpp
git commit -m "test: update E2E and layer tests for mac_array wide-word ROM"
```

---

## Chunk 2: rope + vector_unit + embed_rom

### Task 7: Rewrite rope.k to wide-word

**Files:**
- Modify: `rtl/kanagawa/rope.k`

Replace `uint16[262144]` per table with `uint<1024>[4096]` (64 freq pairs × 16 bits = 1024 bits per row, 4096 positions).

- [ ] **Step 1: Rewrite rope.k**

```kanagawa
// OpenTaalas - Rotary Position Embedding (RoPE) unit (Wide-Word)
// Precomputed sin/cos tables: 4096 positions x 64 freq pairs.
// Each row = 1024 bits (64 x 16-bit BF16 values).

module opentaalas.rope
    { rope_unit
    }

class rope_unit
{
private:
    [[memory]] uint<1024>[4096] _cos_table;
    [[memory]] uint<1024>[4096] _sin_table;

public:
    // Read full cos row for a position (all 64 freq pairs)
    uint<1024> read_cos_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _cos_table[position]; }
        return result;
    }

    // Read full sin row for a position
    uint<1024> read_sin_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _sin_table[position]; }
        return result;
    }

    // Write full cos row
    void write_cos_row(uint12 position, uint<1024> value)
    {
        atomic { _cos_table[position] = value; }
    }

    // Write full sin row
    void write_sin_row(uint12 position, uint<1024> value)
    {
        atomic { _sin_table[position] = value; }
    }

    // Rotation stub (unchanged — full rotation done in VPU)
    uint16 rotate_pair(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val)
    {
        return x_even;
    }
}

export rope_unit;
```

- [ ] **Step 2: Regenerate RTL and verify**

```bash
.build/kanagawa/dist/bin/kanagawa \
  --backend=sv \
  --import-dir=third-party/kanagawa/library \
  --base-library=third-party/kanagawa/library/mini-base.k \
  --output=rtl/generated/kanagawa/rope \
  rtl/kanagawa/rope.k

grep -c 'KanagawaSyncRam' rtl/generated/kanagawa/roperope_unit.sv
# Expected: 2 (1 cos + 1 sin, unchanged count but now 1024-bit wide × 4K deep)
```

- [ ] **Step 3: Commit**

```bash
git add rtl/kanagawa/rope.k rtl/generated/kanagawa/roperope_unit*.sv
git commit -m "rtl: rope wide-word tables (uint16[262144] → uint<1024>[4096])"
```

### Task 8: Update rope SystemC model and co-sim test

**Files:**
- Modify: `model/systemc/src/rope.h`
- Modify: `test/verilator/test_vl_rope.cpp`

- [ ] **Step 1: Update rope.h**

Add `read_cos_row(position)` that returns all 64 freq values as a packed array, and `write_cos_row` that writes all 64 at once. Keep existing per-element `set_cos`/`get_cos` for internal use.

```cpp
std::array<uint16_t, 64> read_cos_row(int position) const {
    std::array<uint16_t, 64> row;
    for (int f = 0; f < 64; f++)
        row[f] = _cos_table[position * FREQ_PAIRS + f];
    return row;
}

void write_cos_row(int position, const std::array<uint16_t, 64>& row) {
    for (int f = 0; f < 64; f++)
        _cos_table[position * FREQ_PAIRS + f] = row[f];
}
// Same for sin
```

- [ ] **Step 2: Rewrite test_vl_rope.cpp**

Old ports: `set_cos_position_in[11:0]`, `set_cos_freq_idx_in[5:0]`, `set_cos_value_in[15:0]`
New ports: `write_cos_row_position_in[11:0]`, `write_cos_row_value_in[1023:0]`

Old ports: `get_cos_position_in[11:0]`, `get_cos_freq_idx_in[5:0]`, `get_cos_result_out[15:0]`
New ports: `read_cos_row_position_in[11:0]`, `read_cos_row_result_out[1023:0]`

The 1024-bit value is `VlWide<32>` in Verilator. Test packs 64 × 16-bit values into the wide word, writes a row, reads it back, and extracts each freq pair to verify.

- [ ] **Step 3: Build and run**

```bash
cmake --build .build --target test_vl_rope
ctest --test-dir .build -R verilator_rope -V
```

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add model/systemc/src/rope.h test/verilator/test_vl_rope.cpp
git commit -m "model+test: update rope for wide-word table interface"
```

### Task 9: Rewrite vector_unit.k rope tables to wide-word

**Files:**
- Modify: `rtl/kanagawa/vector_unit.k`

Only the rope-related storage and methods change. The other 15 methods (RMSNorm, gamma, rsqrt, sigmoid, swiglu, dequant, residual_add) are untouched.

Changes:
- `[[memory]] uint16[262144] _cos_table` → `[[memory]] uint<1024>[4096] _cos_table`
- `[[memory]] uint16[262144] _sin_table` → `[[memory]] uint<1024>[4096] _sin_table`
- `rope_set_cos(position, freq_idx, value)` → `rope_write_cos_row(position, value)` (uint<1024>)
- `rope_set_sin(position, freq_idx, value)` → `rope_write_sin_row(position, value)` (uint<1024>)
- `rope_get_cos(position, freq_idx) → uint16` → `rope_read_cos_row(position) → uint<1024>`
- `rope_get_sin(position, freq_idx) → uint16` → `rope_read_sin_row(position) → uint<1024>`

- [ ] **Step 1: Edit vector_unit.k — replace rope storage and methods**

Replace the two `[[memory]] uint16[262144]` declarations with `[[memory]] uint<1024>[4096]`. Replace the 4 rope accessor methods with row-level read/write methods. Leave all other methods unchanged (they are complex — ~400 lines for dequantize alone — and don't touch the rope tables).

- [ ] **Step 2: Regenerate RTL and verify**

```bash
.build/kanagawa/dist/bin/kanagawa \
  --backend=sv \
  --import-dir=third-party/kanagawa/library \
  --base-library=third-party/kanagawa/library/mini-base.k \
  --output=rtl/generated/kanagawa/vector_unit \
  rtl/kanagawa/vector_unit.k

grep -c 'KanagawaSyncRam' rtl/generated/kanagawa/vector_unitvector_unit.sv
# Expected: 2 (same count, now 1024-bit wide × 4K deep)
```

- [ ] **Step 3: Commit**

```bash
git add rtl/kanagawa/vector_unit.k rtl/generated/kanagawa/vector_unitvector_unit*.sv
git commit -m "rtl: vector_unit rope tables wide-word (uint16[262144] → uint<1024>[4096])"
```

### Task 10: Update vector_unit SystemC model and co-sim test

**Files:**
- Modify: `model/systemc/src/vector_unit.h`
- Modify: `test/verilator/test_vl_vector_unit.cpp`

- [ ] **Step 1: Update vector_unit.h**

Replace per-element rope accessors with row-level methods matching Task 8's rope.h changes. The internal storage can remain as a flat array — the row methods iterate over 64 elements.

- [ ] **Step 2: Update test_vl_vector_unit.cpp**

Replace `rope_set_cos/sin` (per-element) with `rope_write_cos_row/sin_row` (row-level). Replace `rope_get_cos/sin` with `rope_read_cos_row/sin_row`. Port names change from `vpu_rope_set_cos_*` to `vpu_rope_write_cos_row_*`.

- [ ] **Step 3: Build and run**

```bash
cmake --build .build --target test_vl_vector_unit
ctest --test-dir .build -R verilator_vector_unit -V
```

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add model/systemc/src/vector_unit.h test/verilator/test_vl_vector_unit.cpp
git commit -m "model+test: update vector_unit for wide-word rope tables"
```

### Task 11: Rewrite embed_rom.k to chunked wide-word

**Files:**
- Modify: `rtl/kanagawa/embed_rom.k`

Replace `uint3[4194304]` with `uint<192>[65536]` (64 dims × 3 bits = 192 bits per chunk, 1024 tokens × 64 chunks = 65536 rows).

- [ ] **Step 1: Rewrite embed_rom.k**

```kanagawa
// OpenTaalas - Token embedding ROM (Wide-Word, Chunked)
// 1024 tokens x 4096 dims x 3-bit weights
// Stored as 192-bit chunks: 64 dims per chunk, 64 chunks per token
// Address: (token_id << 6) | chunk_idx

module opentaalas.embed_rom
    { embed_rom
    }

class embed_rom
{
private:
    [[memory]] uint<192>[65536] _embeddings;
    uint8 _bank_scale = 0;
    uint32 _tensor_scale = 0;

public:
    // Read 192-bit chunk (64 x 3-bit weights)
    uint<192> read_chunk(uint<16> addr)
    {
        uint<192> result;
        atomic { result = _embeddings[addr]; }
        return result;
    }

    // Write 192-bit chunk
    void write_chunk(uint<16> addr, uint<192> value)
    {
        atomic { _embeddings[addr] = value; }
    }

    void set_bank_scale(uint8 value) { atomic { _bank_scale = value; } }
    void set_tensor_scale(uint32 value) { atomic { _tensor_scale = value; } }
    uint8 get_bank_scale() { return _bank_scale; }
    uint32 get_tensor_scale() { return _tensor_scale; }
}

export embed_rom;
```

- [ ] **Step 2: Regenerate RTL and verify**

```bash
.build/kanagawa/dist/bin/kanagawa \
  --backend=sv \
  --import-dir=third-party/kanagawa/library \
  --base-library=third-party/kanagawa/library/mini-base.k \
  --output=rtl/generated/kanagawa/embed_rom \
  rtl/kanagawa/embed_rom.k

grep -c 'KanagawaSyncRam' rtl/generated/kanagawa/embed_romembed_rom.sv
# Expected: 1 (unchanged count, now 192-bit wide × 65K deep)
```

- [ ] **Step 3: Commit**

```bash
git add rtl/kanagawa/embed_rom.k rtl/generated/kanagawa/embed_romembed_rom*.sv
git commit -m "rtl: embed_rom chunked wide-word (uint3[4M] → uint<192>[65536])"
```

### Task 12: Update embed_rom SystemC model and co-sim test

**Files:**
- Modify: `model/systemc/src/embed_rom.h`
- Modify: `test/verilator/test_vl_embed_rom.cpp`

- [ ] **Step 1: Update embed_rom.h**

Add `read_chunk` and `write_chunk` methods that pack/unpack 64 × 3-bit weights into/from a 192-bit (24-byte) representation.

- [ ] **Step 2: Rewrite test_vl_embed_rom.cpp**

Old ports: `write_weight_token_id_in[16:0]`, `write_weight_dim_idx_in[11:0]`, `write_weight_value_in[2:0]`
New ports: `write_chunk_addr_in[15:0]`, `write_chunk_value_in[191:0]`

Old ports: `read_weight_*` → New: `read_chunk_addr_in[15:0]`, `read_chunk_result_out[191:0]`

Test packs 64 × 3-bit values into 192-bit chunks, writes, reads back, extracts each 3-bit value to verify.

- [ ] **Step 3: Build and run**

```bash
cmake --build .build --target test_vl_embed_rom
ctest --test-dir .build -R verilator_embed_rom -V
```

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add model/systemc/src/embed_rom.h test/verilator/test_vl_embed_rom.cpp
git commit -m "model+test: update embed_rom for chunked wide-word interface"
```

---

## Chunk 3: E2E Integration + Full Verification

### Task 13: Update E2E/layer tests for rope and VPU changes

**Files:**
- Modify: `test/verilator/test_vl_layer_e2e.cpp`
- Modify: `test/verilator/test_vl_transformer_layer.cpp`

The VPU rope table programming (State 0) currently writes per-element via `vpu_rope_set_cos(position, freq_idx, value)`. Must change to row-level: `vpu_rope_write_cos_row(position, row_1024bit)`.

The RoPE application phase (State 5) currently reads per-element via `vpu_rope_get_cos(position, freq_idx)`. Must change to `vpu_rope_read_cos_row(position)` + host-side extraction.

- [ ] **Step 1: Update rope programming in State 0**

Replace per-element `rope_set_cos/sin` loops with row-level writes. Pack 64 values into 1024-bit wide words.

- [ ] **Step 2: Update rope readback in State 5**

Replace per-element `rope_get_cos/sin` calls with row-level reads + extraction.

- [ ] **Step 3: Build and run both tests**

```bash
cmake --build .build --target test_vl_layer_e2e test_vl_transformer_layer
ctest --test-dir .build -R "verilator_layer_e2e|verilator_transformer_layer" -V
```

Expected: All 44 E2E checks PASS. Transformer layer test PASS.

- [ ] **Step 4: Commit**

```bash
git add test/verilator/test_vl_layer_e2e.cpp test/verilator/test_vl_transformer_layer.cpp
git commit -m "test: update E2E/layer tests for wide-word rope tables"
```

### Task 14: Full Test Suite Verification

Run the complete test suite to confirm no regressions.

- [ ] **Step 1: Run all SystemC tests**

```bash
ctest --test-dir .build -L systemc -V
```

Expected: All 17 PASS.

- [ ] **Step 2: Run all Verilator co-sim tests**

```bash
ctest --test-dir .build -L verilator -V
```

Expected: All 19 PASS.

- [ ] **Step 3: Run E2E tests**

```bash
ctest --test-dir .build -L e2e -V
```

Expected: All 44 checks PASS.

- [ ] **Step 4: Verify RAM instance counts in regenerated RTL**

```bash
for mod in rom_bank mac_array rope vector_unit embed_rom; do
  sv_file=$(ls rtl/generated/kanagawa/${mod}*.sv | grep -v types | head -1)
  count=$(grep -c 'KanagawaSyncRam' "$sv_file")
  echo "$mod: $count KanagawaSyncRam instances"
done
```

Expected:
```
rom_bank: 1 (was 7)
mac_array: 2 (was 10)
rope: 2 (was 2, now wider)
vector_unit: 2 (was 2, now wider)
embed_rom: 1 (was 1, now wider)
```

Total: 8 instances (was 25). Net reduction: 17 eliminated.

- [ ] **Step 5: Commit verification results**

```bash
git add -A
git commit -m "verify: all tests pass after wide-word ROM restructuring"
```

Stage 1A complete. Proceed to Stage 1B (GGUF converter + real-data verification) as a separate plan.
