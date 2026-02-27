// test/systemc/test_weight_generator.cpp — Unit tests for deterministic weight generator

#include "weight_generator.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
    auto w1 = generate_deterministic_weights(42);
    auto w2 = generate_deterministic_weights(42);

    // --- Determinism: same seed → identical output ---
    assert(w1.q_rom == w2.q_rom);
    assert(w1.k_rom == w2.k_rom);
    assert(w1.v_rom == w2.v_rom);
    assert(w1.o_rom == w2.o_rom);
    assert(w1.gate_rom == w2.gate_rom);
    assert(w1.up_rom == w2.up_rom);
    assert(w1.down_rom == w2.down_rom);
    assert(w1.q_grid == w2.q_grid);
    assert(w1.k_grid == w2.k_grid);
    assert(w1.v_grid == w2.v_grid);
    assert(w1.o_grid == w2.o_grid);
    assert(w1.gate_grid == w2.gate_grid);
    assert(w1.up_grid == w2.up_grid);
    assert(w1.down_grid == w2.down_grid);
    assert(w1.gamma_pre_attn == w2.gamma_pre_attn);
    assert(w1.gamma_pre_mlp == w2.gamma_pre_mlp);
    assert(w1.rsqrt_lut == w2.rsqrt_lut);
    assert(w1.cos_table == w2.cos_table);
    assert(w1.sin_table == w2.sin_table);
    assert(w1.sigmoid_lut == w2.sigmoid_lut);
    printf("[PASS] determinism\n");

    // --- Different seed → different output ---
    auto w3 = generate_deterministic_weights(99);
    assert(w3.q_rom != w1.q_rom);
    assert(w3.q_grid != w1.q_grid);
    printf("[PASS] different seeds diverge\n");

    // --- ROM sizes ---
    // Q/K/V/O: ceil(64*64/256) = 16 blocks
    assert(w1.q_rom.size() == 16 * BLOCK_BYTES);
    assert(w1.k_rom.size() == 16 * BLOCK_BYTES);
    assert(w1.v_rom.size() == 16 * BLOCK_BYTES);
    assert(w1.o_rom.size() == 16 * BLOCK_BYTES);
    // Gate/Up: ceil(64*172/256) = 43 blocks
    assert(w1.gate_rom.size() == 43 * BLOCK_BYTES);
    assert(w1.up_rom.size() == 43 * BLOCK_BYTES);
    // Down: ceil(172*64/256) = 43 blocks
    assert(w1.down_rom.size() == 43 * BLOCK_BYTES);
    printf("[PASS] ROM sizes\n");

    // --- Codebook sizes ---
    assert(w1.q_grid.size() == 512);
    assert(w1.k_grid.size() == 512);
    assert(w1.v_grid.size() == 512);
    assert(w1.o_grid.size() == 512);
    assert(w1.gate_grid.size() == 512);
    assert(w1.up_grid.size() == 512);
    assert(w1.down_grid.size() == 512);
    printf("[PASS] codebook sizes\n");

    // --- Codebook magnitudes in range 0-7 ---
    auto check_codebook = [](const std::vector<uint32_t>& grid, const char* name) {
        for (size_t i = 0; i < grid.size(); i++) {
            uint32_t e = grid[i];
            assert((e & 0xFF) <= 7);
            assert(((e >> 8) & 0xFF) <= 7);
            assert(((e >> 16) & 0xFF) <= 7);
            assert(((e >> 24) & 0xFF) <= 7);
        }
    };
    check_codebook(w1.q_grid, "q");
    check_codebook(w1.k_grid, "k");
    check_codebook(w1.v_grid, "v");
    check_codebook(w1.o_grid, "o");
    check_codebook(w1.gate_grid, "gate");
    check_codebook(w1.up_grid, "up");
    check_codebook(w1.down_grid, "down");
    printf("[PASS] codebook magnitudes in range\n");

    // --- Gamma: correct size, non-zero ---
    assert(w1.gamma_pre_attn.size() == static_cast<size_t>(DIM));
    assert(w1.gamma_pre_mlp.size() == static_cast<size_t>(DIM));
    for (auto g : w1.gamma_pre_attn) assert(g != 0);
    for (auto g : w1.gamma_pre_mlp) assert(g != 0);
    printf("[PASS] gamma non-zero\n");

    // --- LUT sizes ---
    assert(w1.rsqrt_lut.size() == 256);
    assert(w1.sigmoid_lut.size() == 256);
    printf("[PASS] LUT sizes\n");

    // --- RoPE table sizes: SEQ_LEN * HEAD_DIM/2 = 8 * 8 = 64 ---
    assert(w1.cos_table.size() == static_cast<size_t>(SEQ_LEN * HEAD_DIM / 2));
    assert(w1.sin_table.size() == static_cast<size_t>(SEQ_LEN * HEAD_DIM / 2));
    printf("[PASS] RoPE table sizes\n");

    // --- rsqrt LUT sanity: values should decrease (rsqrt is monotonically decreasing) ---
    float first = bf16_to_float(w1.rsqrt_lut[0]);
    float last  = bf16_to_float(w1.rsqrt_lut[255]);
    assert(first > last);
    printf("[PASS] rsqrt LUT monotonicity\n");

    // --- Sigmoid LUT sanity: values should increase (sigmoid is monotonically increasing) ---
    float sig_first = bf16_to_float(w1.sigmoid_lut[0]);
    float sig_last  = bf16_to_float(w1.sigmoid_lut[255]);
    assert(sig_first < sig_last);
    assert(sig_first < 0.01f);  // sigmoid(-8) ≈ 0.0003
    assert(sig_last > 0.99f);   // sigmoid(8) ≈ 0.9997
    printf("[PASS] sigmoid LUT range\n");

    // --- IQ3_S block structure: d_bf16 at offset 0 should be a known value ---
    uint16_t d0 = static_cast<uint16_t>(w1.q_rom[0]) |
                  (static_cast<uint16_t>(w1.q_rom[1]) << 8);
    // First block uses d_values[0] = 0x3C00
    assert(d0 == 0x3C00);
    printf("[PASS] IQ3_S block structure\n");

    printf("\nAll weight_generator tests passed.\n");
    return 0;
}
