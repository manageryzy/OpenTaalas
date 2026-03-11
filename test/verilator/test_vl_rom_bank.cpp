// test_vl_rom_bank.cpp — Verilator co-simulation tests for rom_bank
// Tests wide-word ROM interface: write_block/read_block with 880-bit words.
//
// IQ3SBlock layout in 880-bit word (110 bytes, little-endian):
//   bits [15:0]     d_bf16       (super-scale)
//   bits [527:16]   qs[64]       (codebook indices, low 8 bits)
//   bits [591:528]  qh[8]        (codebook index high bits)
//   bits [847:592]  signs[32]    (256 sign bits)
//   bits [879:848]  scales[4]    (sub-scales, packed nibbles)

#include "kanagawa_harness.h"
#include "Vrom_bank.h"

#include <array>
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vrom_bank>;

// ---------- 880-bit packing helpers ----------
// VlWide<28> = 28 × 32-bit words = 896 bits (upper 16 bits unused)

static void pack_block(VlWide<28>& out, const std::array<uint8_t, 110>& bytes) {
    memset(&out, 0, sizeof(out));
    for (int i = 0; i < 110; i++) {
        int bit_offset = i * 8;
        int word = bit_offset / 32;
        int shift = bit_offset % 32;
        out[word] |= ((uint32_t)bytes[i]) << shift;
        if (shift > 24) {
            out[word + 1] |= ((uint32_t)bytes[i]) >> (32 - shift);
        }
    }
}

static uint16_t extract_super_scale(const VlWide<28>& block) {
    return block[0] & 0xFFFF;  // bits [15:0]
}

static uint8_t extract_qs(const VlWide<28>& block, int idx) {
    // bits [527:16], byte idx in range 0..63
    int bit_offset = 16 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    uint8_t val = (block[word] >> shift) & 0xFF;
    if (shift > 24) {
        val |= (block[word + 1] << (32 - shift)) & 0xFF;
    }
    return val;
}

static uint8_t extract_qh(const VlWide<28>& block, int idx) {
    // bits [591:528], byte idx in range 0..7
    int bit_offset = 528 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    uint8_t val = (block[word] >> shift) & 0xFF;
    if (shift > 24) {
        val |= (block[word + 1] << (32 - shift)) & 0xFF;
    }
    return val;
}

static uint8_t extract_sign_byte(const VlWide<28>& block, int idx) {
    // bits [847:592], byte idx in range 0..31
    int bit_offset = 592 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    uint8_t val = (block[word] >> shift) & 0xFF;
    if (shift > 24) {
        val |= (block[word + 1] << (32 - shift)) & 0xFF;
    }
    return val;
}

static uint8_t extract_scale_byte(const VlWide<28>& block, int idx) {
    // bits [879:848], byte idx in range 0..3
    int bit_offset = 848 + idx * 8;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    uint8_t val = (block[word] >> shift) & 0xFF;
    if (shift > 24) {
        val |= (block[word + 1] << (32 - shift)) & 0xFF;
    }
    return val;
}

// ---------- RTL method wrappers ----------

static void call_write_block(Harness& h, uint16_t block_addr,
                              const VlWide<28>& value) {
    auto* d = h.dut();
    h.wait_ready(d->write_block_rdy_out);
    d->write_block_valid_in = 1;
    d->write_block_block_addr_in = block_addr;
    memcpy(&d->write_block_value_in, &value, sizeof(VlWide<28>));
    h.tick();
    d->write_block_valid_in = 0;
    h.drain_fifo(d->write_block_rden_in, d->write_block_empty_out);
}

static void call_read_block(Harness& h, uint16_t block_addr,
                             VlWide<28>& result) {
    auto* d = h.dut();
    h.wait_ready(d->read_block_rdy_out);
    d->read_block_valid_in = 1;
    d->read_block_block_addr_in = block_addr;
    h.tick();
    d->read_block_valid_in = 0;
    h.wait_fifo(d->read_block_rden_in, d->read_block_empty_out);
    memcpy(&result, &d->read_block_result_out, sizeof(VlWide<28>));
    d->read_block_rden_in = 0;
    h.tick();
}

// ---------- Test helpers ----------

struct IQ3SBlock {
    uint16_t d_bf16 = 0;
    uint8_t  qs[64] = {};
    uint8_t  qh[8]  = {};
    uint8_t  signs[32] = {};
    uint8_t  scales[4] = {};
};

static std::array<uint8_t, 110> block_to_bytes(const IQ3SBlock& blk) {
    std::array<uint8_t, 110> bytes{};
    bytes[0] = blk.d_bf16 & 0xFF;
    bytes[1] = (blk.d_bf16 >> 8) & 0xFF;
    memcpy(&bytes[2], blk.qs, 64);
    memcpy(&bytes[66], blk.qh, 8);
    memcpy(&bytes[74], blk.signs, 32);
    memcpy(&bytes[106], blk.scales, 4);
    return bytes;
}

// ---- Tests ----

static void test_write_read_round_trip() {
    Harness h;
    h.reset();

    IQ3SBlock blk;
    blk.d_bf16 = 0x3F80;
    blk.qs[0] = 0x42;
    blk.qs[63] = 0xEE;
    blk.qh[0] = 0x01;
    blk.qh[7] = 0xAA;
    blk.signs[0] = 0xA5;
    blk.signs[31] = 0x5A;
    blk.scales[0] = 0x73;
    blk.scales[3] = 0xBF;

    auto bytes = block_to_bytes(blk);
    VlWide<28> packed;
    pack_block(packed, bytes);
    call_write_block(h, 0, packed);

    VlWide<28> readback;
    call_read_block(h, 0, readback);

    assert(extract_super_scale(readback) == 0x3F80);
    assert(extract_qs(readback, 0) == 0x42);
    assert(extract_qs(readback, 63) == 0xEE);
    assert(extract_qh(readback, 0) == 0x01);
    assert(extract_qh(readback, 7) == 0xAA);
    assert(extract_sign_byte(readback, 0) == 0xA5);
    assert(extract_sign_byte(readback, 31) == 0x5A);
    assert(extract_scale_byte(readback, 0) == 0x73);
    assert(extract_scale_byte(readback, 3) == 0xBF);
    std::puts("[PASS] write/read 880-bit block round-trip");
}

static void test_multiple_blocks() {
    Harness h;
    h.reset();

    for (int i = 0; i < 4; ++i) {
        IQ3SBlock blk;
        blk.d_bf16 = 0x3F80 + i;
        blk.qs[0] = i * 10;
        blk.signs[0] = i * 30;
        auto bytes = block_to_bytes(blk);
        VlWide<28> packed;
        pack_block(packed, bytes);
        call_write_block(h, i, packed);
    }

    for (int i = 0; i < 4; ++i) {
        VlWide<28> readback;
        call_read_block(h, i, readback);
        assert(extract_super_scale(readback) == (uint16_t)(0x3F80 + i));
        assert(extract_qs(readback, 0) == (uint8_t)(i * 10));
        assert(extract_sign_byte(readback, 0) == (uint8_t)(i * 30));
    }
    std::puts("[PASS] multiple blocks");
}

static void test_full_byte_coverage() {
    // Write all 110 bytes of a block and verify each one reads back correctly
    Harness h;
    h.reset();

    std::array<uint8_t, 110> bytes;
    for (int i = 0; i < 110; i++)
        bytes[i] = (uint8_t)((i * 7 + 13) & 0xFF);

    VlWide<28> packed;
    pack_block(packed, bytes);
    call_write_block(h, 5, packed);

    VlWide<28> readback;
    call_read_block(h, 5, readback);

    // Verify d_bf16
    uint16_t d = bytes[0] | ((uint16_t)bytes[1] << 8);
    assert(extract_super_scale(readback) == d);

    // Verify all qs[64]
    for (int i = 0; i < 64; i++)
        assert(extract_qs(readback, i) == bytes[2 + i]);

    // Verify all qh[8]
    for (int i = 0; i < 8; i++)
        assert(extract_qh(readback, i) == bytes[66 + i]);

    // Verify all signs[32]
    for (int i = 0; i < 32; i++)
        assert(extract_sign_byte(readback, i) == bytes[74 + i]);

    // Verify all scales[4]
    for (int i = 0; i < 4; i++)
        assert(extract_scale_byte(readback, i) == bytes[106 + i]);

    std::puts("[PASS] full 110-byte coverage");
}

int main() {
    test_write_read_round_trip();
    test_multiple_blocks();
    test_full_byte_coverage();
    std::puts("\nAll rom_bank Verilator co-sim tests passed.");
    return 0;
}
