// OpenTaalas - IQ3_S Codebook Decoder
// 512-entry LUT mapping 9-bit index to 4x 4-bit unsigned magnitudes.
// Values from iq3s_grid[] in llama.cpp.

module opentaalas.codebook_decoder
    { codebook_decoder
    }

class codebook_decoder
{
private:
    [[memory]] uint32[512] _grid;

public:
    // Decode 9-bit index into 4 magnitudes
    uint4 decode_m0(uint<9> index) { return cast<uint4>(_grid[index] & 0xFF); }
    uint4 decode_m1(uint<9> index) { return cast<uint4>((_grid[index] >> 8) & 0xFF); }
    uint4 decode_m2(uint<9> index) { return cast<uint4>((_grid[index] >> 16) & 0xFF); }
    uint4 decode_m3(uint<9> index) { return cast<uint4>((_grid[index] >> 24) & 0xFF); }

    // Write grid entry (for initialization)
    void write_entry(uint<9> index, uint32 value)
    {
        atomic { _grid[index] = value; }
    }

    uint32 read_entry(uint<9> index)
    {
        return _grid[index];
    }
}

export codebook_decoder;
