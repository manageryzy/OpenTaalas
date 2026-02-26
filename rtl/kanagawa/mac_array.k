// OpenTaalas - IQ3_S MAC Array GEMV Engine
// Composes 4 PE accumulators, block-packed weight ROM, codebook decoder,
// and dequantization into a self-contained GEMV engine.
// Each PE accumulates magnitude*sign*activation products into INT24;
// outputs are dequantized to FP32 via BF16 super-scale and 4-bit sub-scale.

module opentaalas.mac_array
    { mac_array
    }

class mac_array
{
private:
    // 4 PE accumulators (INT24)
    int<24>[4] _accum;

    // FP32 row accumulators (stored as uint32 bit patterns)
    uint32[4] _fp32_accum;

    // Weight storage: block-packed IQ3_S ROM
    // 1024 blocks x 110 bytes = 112640 bytes
    [[memory]] uint8[112640] _rom;

    // Codebook: 512 entries x 32 bits
    [[memory]] uint32[512] _grid;

public:
    // --- MAC operation on specified PE using shift-and-add ---
    int<24> mac_step(uint<2> pe_id, uint4 magnitude, uint<1> sign_bit, int8 activation)
    {
        int<24> result;
        atomic
        {
            int<24> a = cast<int<24>>(activation);
            int<24> k_val = cast<int<24>>(magnitude >> 1);

            // k*a via shift-and-add
            int<24> ka = 0;
            if ((k_val & 1) != 0) { ka = ka + a; }
            if ((k_val & 2) != 0) { ka = ka + (a << 1); }
            if ((k_val & 4) != 0) { ka = ka + (a << 2); }

            // product = (k*a)<<1 + a = (2k+1)*a
            int<24> product = (ka << 1) + a;

            // Apply sign
            if (sign_bit == 1)
            {
                product = 0 - product;
            }

            _accum[pe_id] = _accum[pe_id] + product;
            result = _accum[pe_id];
        }
        return result;
    }

    // Read raw INT24 accumulator value
    int<24> read_accum(uint<2> pe_id)
    {
        return _accum[pe_id];
    }

    // --- Codebook decode ---
    uint4 decode_m0(uint<9> index) { return cast<uint4>(_grid[index] & 0xFF); }
    uint4 decode_m1(uint<9> index) { return cast<uint4>((_grid[index] >> 8) & 0xFF); }
    uint4 decode_m2(uint<9> index) { return cast<uint4>((_grid[index] >> 16) & 0xFF); }
    uint4 decode_m3(uint<9> index) { return cast<uint4>((_grid[index] >> 24) & 0xFF); }

    void write_grid_entry(uint<9> index, uint32 value)
    {
        atomic { _grid[index] = value; }
    }

    // --- ROM access ---
    void write_rom_byte(uint<16> block_addr, uint8 byte_offset, uint8 value)
    {
        atomic
        {
            _rom[cast<uint<17>>(block_addr) * 110 + cast<uint<17>>(byte_offset)] = value;
        }
    }

    uint16 get_super_scale(uint<16> block_addr)
    {
        uint16 result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            uint16 lo = cast<uint16>(_rom[base]);
            uint16 hi = cast<uint16>(_rom[base + 1]);
            result = (hi << 8) | lo;
        }
        return result;
    }

    uint<9> get_codebook_index(uint<16> block_addr, uint8 group_in_block)
    {
        uint<9> result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            uint8 qs_val = _rom[base + 2 + cast<uint<17>>(group_in_block)];
            uint8 qh_byte = _rom[base + 66 + cast<uint<17>>(group_in_block >> 3)];
            uint8 bit_pos = group_in_block & 7;
            uint<1> high_bit = cast<uint<1>>((qh_byte >> bit_pos) & 1);
            result = concat(high_bit, qs_val);
        }
        return result;
    }

    uint<1> get_sign(uint<16> block_addr, uint8 weight_in_block)
    {
        uint<1> result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            uint8 sign_byte = _rom[base + 74 + cast<uint<17>>(weight_in_block >> 3)];
            uint8 bit_pos = weight_in_block & 7;
            result = cast<uint<1>>((sign_byte >> bit_pos) & 1);
        }
        return result;
    }

    uint4 get_sub_scale(uint<16> block_addr, uint8 sub_block_idx)
    {
        uint4 result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            uint8 scale_byte = _rom[base + 106 + cast<uint<17>>(sub_block_idx >> 1)];
            if ((sub_block_idx & 1) == 0)
            {
                result = cast<uint4>(scale_byte & 0xF);
            }
            else
            {
                result = cast<uint4>(scale_byte >> 4);
            }
        }
        return result;
    }

    // --- FP32 accumulator (stored as bit pattern) ---
    void set_fp32_accum(uint<2> pe_id, uint32 value)
    {
        atomic { _fp32_accum[pe_id] = value; }
    }

    uint32 read_fp32_accum(uint<2> pe_id)
    {
        return _fp32_accum[pe_id];
    }

    // --- Control ---
    void clear_pe(uint<2> pe_id)
    {
        atomic
        {
            _accum[pe_id] = 0;
        }
    }

    void clear_fp32(uint<2> pe_id)
    {
        atomic
        {
            _fp32_accum[pe_id] = 0;
        }
    }

    void clear_all()
    {
        atomic
        {
            _accum[0] = 0;
            _accum[1] = 0;
            _accum[2] = 0;
            _accum[3] = 0;
            _fp32_accum[0] = 0;
            _fp32_accum[1] = 0;
            _fp32_accum[2] = 0;
            _fp32_accum[3] = 0;
        }
    }
}

export mac_array;
