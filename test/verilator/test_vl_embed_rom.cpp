// test_vl_embed_rom.cpp — Verilator co-simulation tests for embed_rom
// Tests chunked wide-word interface: write_chunk/read_chunk with 192-bit words.
// Each 192-bit chunk = 64 × 3-bit weights.

#include "kanagawa_harness.h"
#include "Vembed_rom.h"

#include <array>
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vembed_rom>;

// ---------- 192-bit packing helpers ----------
// VlWide<6> = 6 × 32-bit words = 192 bits

static void pack_chunk(VlWide<6>& out, const std::array<uint8_t, 24>& bytes) {
    memset(&out, 0, sizeof(out));
    for (int i = 0; i < 24; i++) {
        int word = i / 4;
        int shift = (i % 4) * 8;
        out[word] |= ((uint32_t)bytes[i]) << shift;
    }
}

static uint8_t extract_byte(const VlWide<6>& chunk, int byte_idx) {
    int word = byte_idx / 4;
    int shift = (byte_idx % 4) * 8;
    return (chunk[word] >> shift) & 0xFF;
}

// Extract a 3-bit weight from a 192-bit chunk
static uint8_t extract_weight(const VlWide<6>& chunk, int dim_in_chunk) {
    int bit_offset = dim_in_chunk * 3;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    uint8_t val = (chunk[word] >> shift) & 0x7;
    if (shift > 29 && word + 1 < 6) {
        val |= (chunk[word + 1] << (32 - shift)) & 0x7;
    }
    return val;
}

// Pack 64 3-bit weights into 24 bytes
static std::array<uint8_t, 24> pack_weights(const std::array<uint8_t, 64>& weights) {
    std::array<uint8_t, 24> bytes{};
    for (int i = 0; i < 64; i++) {
        int bit_offset = i * 3;
        int byte_idx = bit_offset / 8;
        int bit_idx = bit_offset % 8;
        bytes[byte_idx] |= (weights[i] & 0x7) << bit_idx;
        if (bit_idx > 5 && byte_idx + 1 < 24)
            bytes[byte_idx + 1] |= (weights[i] & 0x7) >> (8 - bit_idx);
    }
    return bytes;
}

// ---------- RTL method wrappers ----------

static void call_write_chunk(Harness& h, uint16_t addr,
                              const VlWide<6>& value) {
    auto* d = h.dut();
    h.wait_ready(d->write_chunk_rdy_out);
    d->write_chunk_valid_in = 1;
    d->write_chunk_addr_in = addr;
    memcpy(&d->write_chunk_value_in, &value, sizeof(VlWide<6>));
    h.tick();
    d->write_chunk_valid_in = 0;
    h.drain_fifo(d->write_chunk_rden_in, d->write_chunk_empty_out);
}

static void call_read_chunk(Harness& h, uint16_t addr, VlWide<6>& result) {
    auto* d = h.dut();
    h.wait_ready(d->read_chunk_rdy_out);
    d->read_chunk_valid_in = 1;
    d->read_chunk_addr_in = addr;
    h.tick();
    d->read_chunk_valid_in = 0;
    h.wait_fifo(d->read_chunk_rden_in, d->read_chunk_empty_out);
    memcpy(&result, &d->read_chunk_result_out, sizeof(VlWide<6>));
    d->read_chunk_rden_in = 0;
    h.tick();
}

static void call_set_bank_scale(Harness& h, uint8_t value) {
    auto* d = h.dut();
    h.wait_ready(d->set_bank_scale_rdy_out);
    d->set_bank_scale_valid_in = 1;
    d->set_bank_scale_value_in = value;
    h.tick();
    d->set_bank_scale_valid_in = 0;
    h.drain_fifo(d->set_bank_scale_rden_in, d->set_bank_scale_empty_out);
}

static void call_set_tensor_scale(Harness& h, uint32_t value) {
    auto* d = h.dut();
    h.wait_ready(d->set_tensor_scale_rdy_out);
    d->set_tensor_scale_valid_in = 1;
    d->set_tensor_scale_value_in = value;
    h.tick();
    d->set_tensor_scale_valid_in = 0;
    h.drain_fifo(d->set_tensor_scale_rden_in, d->set_tensor_scale_empty_out);
}

static uint8_t call_get_bank_scale(Harness& h) {
    auto* d = h.dut();
    h.wait_ready(d->get_bank_scale_rdy_out);
    d->get_bank_scale_valid_in = 1;
    h.tick();
    d->get_bank_scale_valid_in = 0;
    return h.read_fifo(d->get_bank_scale_rden_in, d->get_bank_scale_empty_out,
                       d->get_bank_scale_result_out);
}

static uint32_t call_get_tensor_scale(Harness& h) {
    auto* d = h.dut();
    h.wait_ready(d->get_tensor_scale_rdy_out);
    d->get_tensor_scale_valid_in = 1;
    h.tick();
    d->get_tensor_scale_valid_in = 0;
    return h.read_fifo(d->get_tensor_scale_rden_in,
                       d->get_tensor_scale_empty_out,
                       d->get_tensor_scale_result_out);
}

// ---- Tests ----

static void test_chunk_roundtrip() {
    Harness h;
    h.reset();

    // Create 64 3-bit weights
    std::array<uint8_t, 64> weights{};
    for (int i = 0; i < 64; i++)
        weights[i] = i % 8;  // values 0-7 cycling

    auto bytes = pack_weights(weights);
    VlWide<6> packed;
    pack_chunk(packed, bytes);

    // Write to token 3, chunk 7 → address = (3 << 6) | 7 = 199
    uint16_t addr = (3 << 6) | 7;
    call_write_chunk(h, addr, packed);

    VlWide<6> readback;
    call_read_chunk(h, addr, readback);

    // Verify each 3-bit weight
    for (int i = 0; i < 64; i++) {
        uint8_t expected = i % 8;
        uint8_t actual = extract_weight(readback, i);
        if (actual != expected) {
            std::fprintf(stderr, "FAIL: dim %d: expected %u, got %u\n", i, expected, actual);
            std::abort();
        }
    }
    std::puts("[PASS] chunk write/read roundtrip with 64 3-bit weights");
}

static void test_multiple_chunks() {
    Harness h;
    h.reset();

    for (int c = 0; c < 4; c++) {
        std::array<uint8_t, 64> weights{};
        for (int i = 0; i < 64; i++) weights[i] = (c + i) % 8;
        auto bytes = pack_weights(weights);
        VlWide<6> packed;
        pack_chunk(packed, bytes);
        call_write_chunk(h, c, packed);
    }

    for (int c = 0; c < 4; c++) {
        VlWide<6> readback;
        call_read_chunk(h, c, readback);
        for (int i = 0; i < 64; i++) {
            assert(extract_weight(readback, i) == (uint8_t)((c + i) % 8));
        }
    }
    std::puts("[PASS] multiple chunks non-interference");
}

static void test_bank_scale() {
    Harness h;
    h.reset();

    call_set_bank_scale(h, 0xAB);
    assert(call_get_bank_scale(h) == 0xAB);
    call_set_bank_scale(h, 0xFF);
    assert(call_get_bank_scale(h) == 0xFF);
    std::puts("[PASS] bank_scale set/get");
}

static void test_tensor_scale() {
    Harness h;
    h.reset();

    call_set_tensor_scale(h, 0xDEADBEEF);
    assert(call_get_tensor_scale(h) == 0xDEADBEEF);
    call_set_tensor_scale(h, 0xFFFFFFFF);
    assert(call_get_tensor_scale(h) == 0xFFFFFFFF);
    std::puts("[PASS] tensor_scale set/get");
}

int main() {
    test_chunk_roundtrip();
    test_multiple_chunks();
    test_bank_scale();
    test_tensor_scale();
    std::puts("\nAll embed_rom Verilator co-sim tests passed.");
    return 0;
}
