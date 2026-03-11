// test_vl_rope.cpp — Verilator co-simulation tests for rope_unit
// Tests wide-word RoPE interface: write/read cos/sin rows as 1024-bit words.

#include "kanagawa_harness.h"
#include "Vrope_unit.h"

#include <array>
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vrope_unit>;

// ---------- 1024-bit packing helpers ----------
// VlWide<32> = 32 × 32-bit words = 1024 bits

static void pack_row(VlWide<32>& out, const std::array<uint16_t, 64>& values) {
    memset(&out, 0, sizeof(out));
    for (int i = 0; i < 64; i++) {
        int bit_offset = i * 16;
        int word = bit_offset / 32;
        int shift = bit_offset % 32;
        out[word] |= ((uint32_t)values[i]) << shift;
    }
}

static uint16_t extract_freq(const VlWide<32>& row, int freq_idx) {
    int bit_offset = freq_idx * 16;
    int word = bit_offset / 32;
    int shift = bit_offset % 32;
    return (row[word] >> shift) & 0xFFFF;
}

// ---------- RTL method wrappers ----------

static void call_write_cos_row(Harness& h, uint16_t pos,
                                const VlWide<32>& value) {
    auto* d = h.dut();
    h.wait_ready(d->write_cos_row_rdy_out);
    d->write_cos_row_valid_in = 1;
    d->write_cos_row_position_in = pos & 0xFFF;
    memcpy(&d->write_cos_row_value_in, &value, sizeof(VlWide<32>));
    h.tick();
    d->write_cos_row_valid_in = 0;
    h.drain_fifo(d->write_cos_row_rden_in, d->write_cos_row_empty_out);
}

static void call_write_sin_row(Harness& h, uint16_t pos,
                                const VlWide<32>& value) {
    auto* d = h.dut();
    h.wait_ready(d->write_sin_row_rdy_out);
    d->write_sin_row_valid_in = 1;
    d->write_sin_row_position_in = pos & 0xFFF;
    memcpy(&d->write_sin_row_value_in, &value, sizeof(VlWide<32>));
    h.tick();
    d->write_sin_row_valid_in = 0;
    h.drain_fifo(d->write_sin_row_rden_in, d->write_sin_row_empty_out);
}

static void call_read_cos_row(Harness& h, uint16_t pos, VlWide<32>& result) {
    auto* d = h.dut();
    h.wait_ready(d->read_cos_row_rdy_out);
    d->read_cos_row_valid_in = 1;
    d->read_cos_row_position_in = pos & 0xFFF;
    h.tick();
    d->read_cos_row_valid_in = 0;
    h.wait_fifo(d->read_cos_row_rden_in, d->read_cos_row_empty_out);
    memcpy(&result, &d->read_cos_row_result_out, sizeof(VlWide<32>));
    d->read_cos_row_rden_in = 0;
    h.tick();
}

static void call_read_sin_row(Harness& h, uint16_t pos, VlWide<32>& result) {
    auto* d = h.dut();
    h.wait_ready(d->read_sin_row_rdy_out);
    d->read_sin_row_valid_in = 1;
    d->read_sin_row_position_in = pos & 0xFFF;
    h.tick();
    d->read_sin_row_valid_in = 0;
    h.wait_fifo(d->read_sin_row_rden_in, d->read_sin_row_empty_out);
    memcpy(&result, &d->read_sin_row_result_out, sizeof(VlWide<32>));
    d->read_sin_row_rden_in = 0;
    h.tick();
}

// --- rotate_pair: returns uint16 (stub) ---
static uint16_t call_rotate_pair(Harness& h, uint16_t x_even, uint16_t x_odd,
                                  uint16_t cos_val, uint16_t sin_val) {
    auto* d = h.dut();
    h.wait_ready(d->rotate_pair_rdy_out);
    d->rotate_pair_valid_in = 1;
    d->rotate_pair_x_even_in = x_even;
    d->rotate_pair_x_odd_in = x_odd;
    d->rotate_pair_cos_val_in = cos_val;
    d->rotate_pair_sin_val_in = sin_val;
    h.tick();
    d->rotate_pair_valid_in = 0;
    return h.read_fifo(d->rotate_pair_rden_in, d->rotate_pair_empty_out,
                       d->rotate_pair_result_out);
}

// ---- Tests ----

static void test_cos_sin_round_trip() {
    Harness h;
    h.reset();

    std::array<uint16_t, 64> cos_vals{};
    std::array<uint16_t, 64> sin_vals{};
    cos_vals[0] = 0x3F80;  // bf16(1.0)
    sin_vals[0] = 0x0000;  // bf16(0.0)
    cos_vals[63] = 0xBEEF;
    sin_vals[63] = 0xCAFE;

    VlWide<32> cos_packed, sin_packed;
    pack_row(cos_packed, cos_vals);
    pack_row(sin_packed, sin_vals);

    call_write_cos_row(h, 0, cos_packed);
    call_write_sin_row(h, 0, sin_packed);

    VlWide<32> cos_read, sin_read;
    call_read_cos_row(h, 0, cos_read);
    call_read_sin_row(h, 0, sin_read);

    assert(extract_freq(cos_read, 0) == 0x3F80);
    assert(extract_freq(sin_read, 0) == 0x0000);
    assert(extract_freq(cos_read, 63) == 0xBEEF);
    assert(extract_freq(sin_read, 63) == 0xCAFE);
    std::puts("[PASS] cos/sin row round-trip at pos=0");
}

static void test_arbitrary_position() {
    Harness h;
    h.reset();

    std::array<uint16_t, 64> vals{};
    for (int i = 0; i < 64; i++)
        vals[i] = 0x1000 + i;

    VlWide<32> packed;
    pack_row(packed, vals);
    call_write_cos_row(h, 31, packed);

    VlWide<32> readback;
    call_read_cos_row(h, 31, readback);

    for (int i = 0; i < 64; i++)
        assert(extract_freq(readback, i) == (uint16_t)(0x1000 + i));

    std::puts("[PASS] cos row at pos=31, all 64 freqs verified");
}

static void test_non_interference() {
    Harness h;
    h.reset();

    std::array<uint16_t, 64> vals0{}, vals1{};
    vals0[0] = 0x3F80;
    vals1[0] = 0x1111;

    VlWide<32> p0, p1;
    pack_row(p0, vals0);
    pack_row(p1, vals1);

    call_write_cos_row(h, 0, p0);
    call_write_cos_row(h, 1, p1);

    VlWide<32> r0, r1;
    call_read_cos_row(h, 0, r0);
    call_read_cos_row(h, 1, r1);

    assert(extract_freq(r0, 0) == 0x3F80);
    assert(extract_freq(r1, 0) == 0x1111);
    std::puts("[PASS] cos table non-interference across positions");
}

static void test_rotate_pair_stub() {
    Harness h;
    h.reset();

    uint16_t r = call_rotate_pair(h, 0x4000, 0x4040, 0x3F80, 0x0000);
    assert(r == 0x4000);  // stub returns x_even
    std::puts("[PASS] rotate_pair (stub: returns x_even)");
}

int main() {
    test_cos_sin_round_trip();
    test_arbitrary_position();
    test_non_interference();
    test_rotate_pair_stub();
    std::puts("\nAll rope Verilator co-sim tests passed.");
    return 0;
}
