// OpenTaalas - IQ3_S Block-Packed ROM Bank
// Stores weight blocks in IQ3_S format (110 bytes per 256-weight block).
// Each block contains: BF16 super-scale, 64 codebook indices (qs+qh),
// 256 sign bits, and 4 packed sub-scale bytes (8 x 4-bit).
//
// Hardware representation: each block stored as a flat byte array in memory.
// Accessor methods extract fields matching the SystemC RomBank interface.

module opentaalas.rom_bank
    { rom_bank
    }

class rom_bank
{
private:
    // Block storage: 1024 blocks, each 110 bytes = 112640 bytes total
    // Laid out as flat byte array: block N starts at offset N*110
    // Byte layout per block:
    //   [0..1]    d_bf16       (BF16 super-scale, little-endian)
    //   [2..65]   qs[64]       (codebook indices, low 8 bits)
    //   [66..73]  qh[8]        (codebook indices, high 1 bit)
    //   [74..105] signs[32]    (1 sign bit per weight)
    //   [106..109] scales[4]   (4-bit sub-scales, packed pairs)
    [[memory]] uint8[112640] _data;

public:
    // Write a single byte into block storage
    void write_byte(uint<16> block_addr, uint8 byte_offset, uint8 value)
    {
        atomic
        {
            _data[cast<uint<17>>(block_addr) * 110 + cast<uint<17>>(byte_offset)] = value;
        }
    }

    // Read a single byte from block storage
    uint8 read_byte(uint<16> block_addr, uint8 byte_offset)
    {
        uint8 result;
        atomic
        {
            result = _data[cast<uint<17>>(block_addr) * 110 + cast<uint<17>>(byte_offset)];
        }
        return result;
    }

    // Get BF16 super-scale for a block (bytes 0-1, little-endian)
    uint16 get_super_scale(uint<16> block_addr)
    {
        uint16 result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            uint16 lo = cast<uint16>(_data[base]);
            uint16 hi = cast<uint16>(_data[base + 1]);
            result = (hi << 8) | lo;
        }
        return result;
    }

    // Get 9-bit codebook index for a weight group within a block
    // group_in_block: 0..63 (each group = 4 weights)
    uint<9> get_codebook_index(uint<16> block_addr, uint8 group_in_block)
    {
        uint<9> result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;

            // qs offset: byte 2 + group_in_block
            uint8 qs_val = _data[base + 2 + cast<uint<17>>(group_in_block)];

            // qh offset: byte 66 + (group_in_block / 8)
            uint8 qh_byte = _data[base + 66 + cast<uint<17>>(group_in_block >> 3)];

            // Extract high bit: bit position = group_in_block % 8
            uint8 bit_pos = group_in_block & 7;
            uint<1> high_bit = cast<uint<1>>((qh_byte >> bit_pos) & 1);

            result = concat(high_bit, qs_val);
        }
        return result;
    }

    // Get sign bit for a specific weight within a block (0..255)
    uint<1> get_sign(uint<16> block_addr, uint8 weight_in_block)
    {
        uint<1> result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            // signs offset: byte 74 + (weight_in_block / 8)
            uint8 sign_byte = _data[base + 74 + cast<uint<17>>(weight_in_block >> 3)];
            uint8 bit_pos = weight_in_block & 7;
            result = cast<uint<1>>((sign_byte >> bit_pos) & 1);
        }
        return result;
    }

    // Get 4-bit sub-scale for a sub-block (0..7, each = 32 weights)
    uint4 get_sub_scale(uint<16> block_addr, uint8 sub_block_idx)
    {
        uint4 result;
        atomic
        {
            uint<17> base = cast<uint<17>>(block_addr) * 110;
            // scales offset: byte 106 + (sub_block_idx / 2)
            uint8 scale_byte = _data[base + 106 + cast<uint<17>>(sub_block_idx >> 1)];
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
}

export rom_bank;
