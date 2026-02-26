#include "rom_sv_generator.h"
#include <cassert>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>

static std::string read_file(const std::string& path) {
    std::ifstream f(path);
    std::stringstream ss;
    ss << f.rdbuf();
    return ss.str();
}

int main() {
    // Test 1: 8-bit ROM
    {
        std::vector<uint64_t> data(16, 0);
        data[0] = 0xAB;
        data[5] = 0xCD;
        data[15] = 0xFF;

        opentaalas::generate_rom_sv("/tmp/test_rom_8bit.sv", "test 8-bit ROM", 8, 16, data);

        auto sv = read_file("/tmp/test_rom_8bit.sv");
        assert(sv.find("KanagawaHALDualPortRAM") != std::string::npos);
        assert(sv.find("DATA_WIDTH = 8") != std::string::npos);
        assert(sv.find("DEPTH = 16") != std::string::npos);
        assert(sv.find("mem[0]") != std::string::npos);   // non-zero
        assert(sv.find("mem[5]") != std::string::npos);   // non-zero
        assert(sv.find("mem[15]") != std::string::npos);  // non-zero
        assert(sv.find("mem[1]") == std::string::npos);   // zero, should be omitted
        std::printf("[PASS] 8-bit ROM generation\n");
    }

    // Test 2: 3-bit ROM (like embed_rom weights)
    {
        std::vector<uint64_t> data = {5, 0, 7, 3, 0, 0, 1, 0};
        opentaalas::generate_rom_sv("/tmp/test_rom_3bit.sv", "test 3-bit ROM", 3, 8, data);

        auto sv = read_file("/tmp/test_rom_3bit.sv");
        assert(sv.find("DATA_WIDTH = 3") != std::string::npos);
        assert(sv.find("DEPTH = 8") != std::string::npos);
        std::printf("[PASS] 3-bit ROM generation\n");
    }

    // Test 3: Empty data (all zeros)
    {
        std::vector<uint64_t> data(8, 0);
        opentaalas::generate_rom_sv("/tmp/test_rom_empty.sv", "test empty ROM", 8, 8, data);

        auto sv = read_file("/tmp/test_rom_empty.sv");
        assert(sv.find("KanagawaHALDualPortRAM") != std::string::npos);
        // Should still have the for loop zeroing, but no individual mem[] assignments
        std::printf("[PASS] empty ROM generation\n");
    }

    std::printf("\nAll rom_sv_generator tests passed.\n");
    return 0;
}
