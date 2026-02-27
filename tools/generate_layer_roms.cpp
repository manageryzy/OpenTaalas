// tools/generate_layer_roms.cpp — CLI tool to generate all blackbox ROM SV
// files for one transformer layer.
//
// Usage:
//   generate_layer_roms --output-dir=<dir> [--seed=<N>]
//
// Produces 20 SV files (14 MAC + 6 VPU) containing KanagawaHALDualPortRAM
// modules with pre-initialized memory for co-simulation.

#include "weight_generator.h"
#include "rom_sv_generator.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <sys/stat.h>

int main(int argc, char* argv[]) {
    std::string output_dir = ".";
    uint32_t seed = 42;

    for (int i = 1; i < argc; i++) {
        if (strncmp(argv[i], "--output-dir=", 13) == 0)
            output_dir = argv[i] + 13;
        else if (strncmp(argv[i], "--seed=", 7) == 0)
            seed = static_cast<uint32_t>(atoi(argv[i] + 7));
    }

    mkdir(output_dir.c_str(), 0755);

    auto w = opentaalas::generate_deterministic_weights(seed);

    // Conversion helpers: widen to uint64_t for rom_sv_generator API
    auto to_u64 = [](const std::vector<uint8_t>& v) {
        std::vector<uint64_t> r(v.size());
        for (size_t i = 0; i < v.size(); i++) r[i] = v[i];
        return r;
    };
    auto to_u64_16 = [](const std::vector<uint16_t>& v) {
        std::vector<uint64_t> r(v.size());
        for (size_t i = 0; i < v.size(); i++) r[i] = v[i];
        return r;
    };
    auto to_u64_32 = [](const std::vector<uint32_t>& v) {
        std::vector<uint64_t> r(v.size());
        for (size_t i = 0; i < v.size(); i++) r[i] = v[i];
        return r;
    };

    // --- MAC array ROMs (7 projections x 2 ROMs each = 14 files) ---
    struct MacDesc {
        const char* name;
        std::vector<uint8_t>* rom;
        std::vector<uint32_t>* grid;
    };
    MacDesc macs[] = {
        {"q",    &w.q_rom,    &w.q_grid},
        {"k",    &w.k_rom,    &w.k_grid},
        {"v",    &w.v_rom,    &w.v_grid},
        {"o",    &w.o_rom,    &w.o_grid},
        {"gate", &w.gate_rom, &w.gate_grid},
        {"up",   &w.up_rom,   &w.up_grid},
        {"down", &w.down_rom, &w.down_grid},
    };

    for (auto& m : macs) {
        // Weight ROM: uint8, depth = actual data size (num_blocks * 110)
        opentaalas::generate_rom_sv(
            output_dir + "/rom_mac_" + m.name + "_weights.sv",
            std::string("MAC ") + m.name + " weight ROM",
            8, static_cast<int>(m.rom->size()), to_u64(*m.rom));

        // Codebook: uint32[512]
        opentaalas::generate_rom_sv(
            output_dir + "/rom_mac_" + m.name + "_codebook.sv",
            std::string("MAC ") + m.name + " codebook",
            32, 512, to_u64_32(*m.grid));

        std::printf("Generated ROMs for mac_%s\n", m.name);
    }

    // --- VPU ROMs (6 files) ---
    // Depths match Kanagawa-generated RTL declarations; sparse optimization
    // handles the gap between actual data size and declared depth.

    opentaalas::generate_rom_sv(
        output_dir + "/rom_vpu_gamma_pre_attn.sv",
        "VPU gamma pre-attention", 16, 4096, to_u64_16(w.gamma_pre_attn));

    opentaalas::generate_rom_sv(
        output_dir + "/rom_vpu_gamma_pre_mlp.sv",
        "VPU gamma pre-MLP", 16, 4096, to_u64_16(w.gamma_pre_mlp));

    opentaalas::generate_rom_sv(
        output_dir + "/rom_vpu_rsqrt_lut.sv",
        "VPU rsqrt LUT", 16, 256, to_u64_16(w.rsqrt_lut));

    opentaalas::generate_rom_sv(
        output_dir + "/rom_vpu_sigmoid_lut.sv",
        "VPU sigmoid LUT", 16, 256, to_u64_16(w.sigmoid_lut));

    opentaalas::generate_rom_sv(
        output_dir + "/rom_vpu_cos_table.sv",
        "VPU RoPE cos table", 16, 262144, to_u64_16(w.cos_table));

    opentaalas::generate_rom_sv(
        output_dir + "/rom_vpu_sin_table.sv",
        "VPU RoPE sin table", 16, 262144, to_u64_16(w.sin_table));

    std::printf("Generated VPU ROMs\n");
    std::printf("All layer ROMs generated in %s/\n", output_dir.c_str());
    return 0;
}
