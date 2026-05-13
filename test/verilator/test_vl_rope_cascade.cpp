// test_vl_rope_cascade.cpp — Verilator co-simulation test for v11 phased cascade.
//
// rope_apply v11 splits the 1024-bit cos/sin row into four 256-bit segments
// delivered over 4 cycles. This test verifies bit-exact reassembly by:
//   1. Driving forward_cos with phase 0..3 and known 256-bit chunks
//   2. Reading back via read_cos_forwarded with phase 0..3
//   3. Asserting each segment matches what was written
// Same for sin.

#include "kanagawa_harness.h"
#include "Vrope_apply.h"

#include <array>
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vrope_apply>;

// VlWide<8> = 8 × 32-bit words = 256 bits

static void pack_seg(VlWide<8>& out, uint32_t seed) {
    // Deterministic non-trivial pattern per segment so each phase has unique data.
    for (int i = 0; i < 8; ++i) {
        out[i] = (seed * 0x9E3779B9u) ^ (uint32_t)i ^ (seed << 16);
        seed = seed * 1103515245u + 12345u;
    }
}

static bool eq_seg(const VlWide<8>& a, const VlWide<8>& b) {
    for (int i = 0; i < 8; ++i) if (a[i] != b[i]) return false;
    return true;
}

static void call_forward_cos(Harness& h, uint8_t phase, const VlWide<8>& v) {
    auto* d = h.dut();
    h.wait_ready(d->forward_cos_rdy_out);
    d->forward_cos_valid_in = 1;
    d->forward_cos_phase_in = phase & 0x3;
    memcpy(&d->forward_cos_v_in, &v, sizeof(VlWide<8>));
    h.tick();
    d->forward_cos_valid_in = 0;
    h.drain_fifo(d->forward_cos_rden_in, d->forward_cos_empty_out);
}

static void call_forward_sin(Harness& h, uint8_t phase, const VlWide<8>& v) {
    auto* d = h.dut();
    h.wait_ready(d->forward_sin_rdy_out);
    d->forward_sin_valid_in = 1;
    d->forward_sin_phase_in = phase & 0x3;
    memcpy(&d->forward_sin_v_in, &v, sizeof(VlWide<8>));
    h.tick();
    d->forward_sin_valid_in = 0;
    h.drain_fifo(d->forward_sin_rden_in, d->forward_sin_empty_out);
}

static void read_cos_forwarded(Harness& h, uint8_t phase, VlWide<8>& out) {
    auto* d = h.dut();
    h.wait_ready(d->read_cos_forwarded_rdy_out);
    d->read_cos_forwarded_valid_in = 1;
    d->read_cos_forwarded_phase_in = phase & 0x3;
    h.tick();
    d->read_cos_forwarded_valid_in = 0;
    // Pulse rden for one cycle and capture result_out.
    int waited = 0;
    while (d->read_cos_forwarded_empty_out) {
        h.tick();
        if (++waited > 1000) { std::fprintf(stderr, "TIMEOUT read_cos_forwarded\n"); std::abort(); }
    }
    memcpy(&out, &d->read_cos_forwarded_result_out, sizeof(VlWide<8>));
    d->read_cos_forwarded_rden_in = 1;
    h.tick();
    d->read_cos_forwarded_rden_in = 0;
}

static void read_sin_forwarded(Harness& h, uint8_t phase, VlWide<8>& out) {
    auto* d = h.dut();
    h.wait_ready(d->read_sin_forwarded_rdy_out);
    d->read_sin_forwarded_valid_in = 1;
    d->read_sin_forwarded_phase_in = phase & 0x3;
    h.tick();
    d->read_sin_forwarded_valid_in = 0;
    int waited = 0;
    while (d->read_sin_forwarded_empty_out) {
        h.tick();
        if (++waited > 1000) { std::fprintf(stderr, "TIMEOUT read_sin_forwarded\n"); std::abort(); }
    }
    memcpy(&out, &d->read_sin_forwarded_result_out, sizeof(VlWide<8>));
    d->read_sin_forwarded_rden_in = 1;
    h.tick();
    d->read_sin_forwarded_rden_in = 0;
}

int main(int argc, char** argv) {
    Harness h;
    h.reset();

    // 1. Write 4 segments of cos and 4 segments of sin with distinct seeds.
    std::array<VlWide<8>, 4> cos_in;
    std::array<VlWide<8>, 4> sin_in;
    for (int p = 0; p < 4; ++p) {
        pack_seg(cos_in[p], 0xC05A0000u + p);
        pack_seg(sin_in[p], 0x51A0000Bu + p);
    }

    // Drive forward_cos/sin with all 4 phases.
    for (int p = 0; p < 4; ++p) {
        call_forward_cos(h, (uint8_t)p, cos_in[p]);
        call_forward_sin(h, (uint8_t)p, sin_in[p]);
    }

    // 2. Read each segment back and verify bit-exact reassembly.
    int errors = 0;
    for (int p = 0; p < 4; ++p) {
        VlWide<8> cos_out, sin_out;
        read_cos_forwarded(h, (uint8_t)p, cos_out);
        read_sin_forwarded(h, (uint8_t)p, sin_out);
        if (!eq_seg(cos_out, cos_in[p])) {
            std::fprintf(stderr, "FAIL phase %d cos mismatch\n", p);
            for (int i = 0; i < 8; ++i)
                std::fprintf(stderr, "  word %d: got %08x exp %08x\n", i, cos_out[i], cos_in[p][i]);
            errors++;
        }
        if (!eq_seg(sin_out, sin_in[p])) {
            std::fprintf(stderr, "FAIL phase %d sin mismatch\n", p);
            errors++;
        }
    }

    // 3. Overwrite phase 2 only; verify other phases unchanged.
    VlWide<8> new_cos_2;
    pack_seg(new_cos_2, 0xDEADBEEFu);
    call_forward_cos(h, 2, new_cos_2);

    for (int p = 0; p < 4; ++p) {
        VlWide<8> cos_out;
        read_cos_forwarded(h, (uint8_t)p, cos_out);
        const VlWide<8>& exp = (p == 2) ? new_cos_2 : cos_in[p];
        if (!eq_seg(cos_out, exp)) {
            std::fprintf(stderr, "FAIL after overwrite phase %d cos mismatch\n", p);
            errors++;
        }
    }

    if (errors) {
        std::fprintf(stderr, "rope_cascade: %d errors\n", errors);
        return 1;
    }
    std::printf("rope_cascade: PASS (8 segment writes/reads + selective overwrite)\n");
    return 0;
}
