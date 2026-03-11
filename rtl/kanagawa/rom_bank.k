// OpenTaalas - IQ3_S Block-Packed ROM Bank (Wide-Word)
// 1024 blocks stored as 880-bit wide words.
// Each 880-bit word = one Q3_K block (110 bytes):
//   bits [15:0]     d_bf16 (super-scale, little-endian)
//   bits [527:16]   qs[64] (codebook indices, low 8 bits)
//   bits [591:528]  qh[8] (codebook indices, high bits)
//   bits [847:592]  signs[32] (256 sign bits)
//   bits [879:848]  scales[4] (8 x 4-bit sub-scales, packed)

module opentaalas.rom_bank
    { rom_bank
    }

class rom_bank
{
private:
    [[memory]] uint<880>[1024] _blocks;

public:
    // Read full 880-bit block
    uint<880> read_block(uint<16> block_addr)
    {
        uint<880> result;
        atomic
        {
            result = _blocks[block_addr];
        }
        return result;
    }

    // Write full 880-bit block (initialization only)
    void write_block(uint<16> block_addr, uint<880> value)
    {
        atomic
        {
            _blocks[block_addr] = value;
        }
    }
}

export rom_bank;
