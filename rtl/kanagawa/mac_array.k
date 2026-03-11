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
