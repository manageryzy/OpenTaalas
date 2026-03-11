// OpenTaalas - Token embedding ROM (Wide-Word, Chunked)
// 1024 tokens x 4096 dims x 3-bit weights
// Stored as 192-bit chunks: 64 dims per chunk, 64 chunks per token
// Address: (token_id << 6) | chunk_idx

module opentaalas.embed_rom
    { embed_rom
    }

class embed_rom
{
private:
    [[memory]] uint<192>[65536] _embeddings;
    uint8 _bank_scale = 0;
    uint32 _tensor_scale = 0;

public:
    // Read 192-bit chunk (64 x 3-bit weights)
    uint<192> read_chunk(uint<16> addr)
    {
        uint<192> result;
        atomic { result = _embeddings[addr]; }
        return result;
    }

    // Write 192-bit chunk
    void write_chunk(uint<16> addr, uint<192> value)
    {
        atomic { _embeddings[addr] = value; }
    }

    void set_bank_scale(uint8 value)
    {
        atomic { _bank_scale = value; }
    }

    void set_tensor_scale(uint32 value)
    {
        atomic { _tensor_scale = value; }
    }

    uint8 get_bank_scale()
    {
        return _bank_scale;
    }

    uint32 get_tensor_scale()
    {
        return _tensor_scale;
    }
}

export embed_rom;
