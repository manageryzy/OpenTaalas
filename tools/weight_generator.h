#pragma once
// tools/weight_generator.h — Deterministic weight generator for CI testing
//
// Produces all weight data needed for one transformer layer at small CI
// dimensions using seeded PRNG (std::mt19937).  Same seed → identical output.
//
// Weight format matches IQ3_S quantization used by Kanagawa-generated RTL.

#include <cmath>
#include <cstdint>
#include <cstring>
#include <random>
#include <vector>

namespace opentaalas {

// ---------------------------------------------------------------------------
// CI-sized dimensions (small enough for fast simulation)
// ---------------------------------------------------------------------------
static constexpr int DIM        = 64;   // hidden dimension
static constexpr int HEADS      = 4;    // attention heads
static constexpr int HEAD_DIM   = 16;   // DIM / HEADS
static constexpr int FFN_DIM    = 172;  // ~2.7x DIM, multiple of 4
static constexpr int SEQ_LEN    = 8;    // context length
static constexpr int BLOCK_SIZE = 256;  // IQ3_S weights per block
static constexpr int BLOCK_BYTES = 110; // IQ3_S block size in bytes

// ---------------------------------------------------------------------------
// BF16 helpers
// ---------------------------------------------------------------------------
inline uint16_t float_to_bf16(float f) {
    uint32_t bits;
    std::memcpy(&bits, &f, 4);
    return static_cast<uint16_t>(bits >> 16);
}

inline float bf16_to_float(uint16_t bf) {
    uint32_t bits = static_cast<uint32_t>(bf) << 16;
    float f;
    std::memcpy(&f, &bits, 4);
    return f;
}

// ---------------------------------------------------------------------------
// LayerWeights — all data for one transformer layer
// ---------------------------------------------------------------------------
struct LayerWeights {
    // 7 projection weight ROMs (flat byte arrays, num_blocks * 110 bytes)
    // Block layout (IQ3_S): [d_bf16:2][qs:64][qh:8][signs:32][scales:4]
    std::vector<uint8_t> q_rom, k_rom, v_rom, o_rom;
    std::vector<uint8_t> gate_rom, up_rom, down_rom;

    // 7 codebook tables (512 entries x 4 bytes each)
    // Each entry packs 4 uint8 magnitudes (0-7) as (m3<<24)|(m2<<16)|(m1<<8)|m0
    std::vector<uint32_t> q_grid, k_grid, v_grid, o_grid;
    std::vector<uint32_t> gate_grid, up_grid, down_grid;

    // RMSNorm gamma (DIM entries, BF16 as uint16)
    std::vector<uint16_t> gamma_pre_attn, gamma_pre_mlp;

    // rsqrt LUT (256 entries, BF16 as uint16)
    std::vector<uint16_t> rsqrt_lut;

    // RoPE tables (SEQ_LEN * HEAD_DIM/2 entries each, BF16 as uint16)
    std::vector<uint16_t> cos_table, sin_table;

    // Sigmoid LUT (256 entries, BF16 as uint16)
    std::vector<uint16_t> sigmoid_lut;
};

// ---------------------------------------------------------------------------
// Internal helpers
// ---------------------------------------------------------------------------
namespace detail {

inline int ceil_div(int a, int b) { return (a + b - 1) / b; }

// Generate one IQ3_S ROM: num_blocks * 110 bytes
inline std::vector<uint8_t> gen_rom(int rows, int cols, std::mt19937& rng) {
    int num_weights = rows * cols;
    int num_blocks  = ceil_div(num_weights, BLOCK_SIZE);
    std::vector<uint8_t> rom(num_blocks * BLOCK_BYTES);

    // Small BF16 scale values to cycle through
    const uint16_t d_values[] = {0x3C00, 0x3E00, 0x3D00, 0x3B80};
    std::uniform_int_distribution<int> byte_dist(0, 255);

    for (int b = 0; b < num_blocks; b++) {
        uint8_t* block = rom.data() + b * BLOCK_BYTES;
        int off = 0;

        // d_bf16 (2 bytes) — deterministic small scale
        uint16_t d = d_values[b % 4];
        block[off++] = static_cast<uint8_t>(d & 0xFF);
        block[off++] = static_cast<uint8_t>(d >> 8);

        // qs (64 bytes) — random quantized values
        for (int i = 0; i < 64; i++)
            block[off++] = static_cast<uint8_t>(byte_dist(rng));

        // qh (8 bytes) — random high bits
        for (int i = 0; i < 8; i++)
            block[off++] = static_cast<uint8_t>(byte_dist(rng));

        // signs (32 bytes) — random sign bits
        for (int i = 0; i < 32; i++)
            block[off++] = static_cast<uint8_t>(byte_dist(rng));

        // scales (4 bytes) — random sub-block scales
        for (int i = 0; i < 4; i++)
            block[off++] = static_cast<uint8_t>(byte_dist(rng));
    }
    return rom;
}

// Generate one codebook: 512 entries, 4 magnitudes (0-7) packed per uint32
inline std::vector<uint32_t> gen_codebook(std::mt19937& rng) {
    std::vector<uint32_t> grid(512);
    std::uniform_int_distribution<int> mag_dist(0, 7);
    for (auto& entry : grid) {
        uint32_t m0 = static_cast<uint32_t>(mag_dist(rng));
        uint32_t m1 = static_cast<uint32_t>(mag_dist(rng));
        uint32_t m2 = static_cast<uint32_t>(mag_dist(rng));
        uint32_t m3 = static_cast<uint32_t>(mag_dist(rng));
        entry = (m3 << 24) | (m2 << 16) | (m1 << 8) | m0;
    }
    return grid;
}

// Generate gamma: DIM values near BF16 1.0 (0x3F80) with random mantissa jitter
inline std::vector<uint16_t> gen_gamma(int dim, std::mt19937& rng) {
    std::vector<uint16_t> gamma(dim);
    std::uniform_int_distribution<int> jitter(-4, 4);
    for (auto& g : gamma) {
        // 0x3F80 = BF16 1.0, jitter the low mantissa bits
        g = static_cast<uint16_t>(0x3F80 + jitter(rng));
    }
    return gamma;
}

// Generate rsqrt LUT: rsqrt approximation for 256 input bins
inline std::vector<uint16_t> gen_rsqrt_lut() {
    std::vector<uint16_t> lut(256);
    for (int i = 0; i < 256; i++) {
        // Map bin i to a positive input value, avoid division by zero
        float x = static_cast<float>(i + 1) / 256.0f;
        float val = 1.0f / std::sqrt(x);
        lut[i] = float_to_bf16(val);
    }
    return lut;
}

// Generate RoPE sin/cos tables for SEQ_LEN positions, HEAD_DIM/2 freq pairs
inline void gen_rope_tables(std::vector<uint16_t>& cos_tbl,
                            std::vector<uint16_t>& sin_tbl) {
    int half_dim = HEAD_DIM / 2;
    int n = SEQ_LEN * half_dim;
    cos_tbl.resize(n);
    sin_tbl.resize(n);

    for (int pos = 0; pos < SEQ_LEN; pos++) {
        for (int k = 0; k < half_dim; k++) {
            // theta_k = pos / 10000^(2k/HEAD_DIM)
            float theta = static_cast<float>(pos) /
                          std::pow(10000.0f, 2.0f * k / HEAD_DIM);
            cos_tbl[pos * half_dim + k] = float_to_bf16(std::cos(theta));
            sin_tbl[pos * half_dim + k] = float_to_bf16(std::sin(theta));
        }
    }
}

// Generate sigmoid LUT: sigmoid for 256 BF16 upper-byte bins.
// RTL indexes with gate_bf16 >> 8 (upper byte of BF16 bit pattern).
// Uses bin-average sigmoid to minimize RMSE across each bin, since each
// upper-byte bin covers 256 consecutive BF16 values with varying lower bytes.
inline std::vector<uint16_t> gen_sigmoid_lut() {
    std::vector<uint16_t> lut(256);
    for (int i = 0; i < 256; i++) {
        double sum_sig = 0;
        int valid = 0;
        for (int lower = 0; lower < 256; lower++) {
            uint16_t bf16_val = static_cast<uint16_t>((i << 8) | lower);
            float x = bf16_to_float(bf16_val);
            if (std::isnan(x) || std::isinf(x)) continue;
            sum_sig += 1.0 / (1.0 + std::exp(-(double)x));
            valid++;
        }
        if (valid > 0)
            lut[i] = float_to_bf16(static_cast<float>(sum_sig / valid));
        else
            lut[i] = float_to_bf16(i < 128 ? 1.0f : 0.0f);
    }
    return lut;
}

} // namespace detail

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------
inline LayerWeights generate_deterministic_weights(uint32_t seed = 42) {
    std::mt19937 rng(seed);
    LayerWeights w;

    // Projection ROMs (IQ3_S blocks)
    w.q_rom    = detail::gen_rom(DIM, DIM, rng);
    w.k_rom    = detail::gen_rom(DIM, DIM, rng);
    w.v_rom    = detail::gen_rom(DIM, DIM, rng);
    w.o_rom    = detail::gen_rom(DIM, DIM, rng);
    w.gate_rom = detail::gen_rom(DIM, FFN_DIM, rng);
    w.up_rom   = detail::gen_rom(DIM, FFN_DIM, rng);
    w.down_rom = detail::gen_rom(FFN_DIM, DIM, rng);

    // Codebook tables
    w.q_grid    = detail::gen_codebook(rng);
    w.k_grid    = detail::gen_codebook(rng);
    w.v_grid    = detail::gen_codebook(rng);
    w.o_grid    = detail::gen_codebook(rng);
    w.gate_grid = detail::gen_codebook(rng);
    w.up_grid   = detail::gen_codebook(rng);
    w.down_grid = detail::gen_codebook(rng);

    // RMSNorm gamma
    w.gamma_pre_attn = detail::gen_gamma(DIM, rng);
    w.gamma_pre_mlp  = detail::gen_gamma(DIM, rng);

    // LUTs (deterministic, no RNG needed)
    w.rsqrt_lut   = detail::gen_rsqrt_lut();
    w.sigmoid_lut = detail::gen_sigmoid_lut();

    // RoPE tables
    detail::gen_rope_tables(w.cos_table, w.sin_table);

    return w;
}

} // namespace opentaalas
