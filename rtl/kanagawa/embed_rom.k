// OpenTaalas - Token embedding ROM for LLaMA 3.1
// 128256 vocabulary x 4096 dimensions x 3-bit weights
// Full size: 525,336,576 entries (using 4,194,304 test size below)
// Address: token_id * 4096 + dim_idx = (token_id << 12) | dim_idx

module opentaalas.embed_rom
    { embed_rom
    }

class embed_rom
{
private:
    // Full size would be uint3[525336576] (128256 * 4096)
    // Using reduced test size: 1024 * 4096 = 4,194,304
    [[memory]] uint3[4194304] _embeddings;

    uint8 _bank_scale = 0;
    uint32 _tensor_scale = 0;

public:
    uint3 read_weight(uint17 token_id, uint12 dim_idx)
    {
        uint3 result;
        atomic
        {
            result = _embeddings[(cast<uint30>(token_id) << 12) | cast<uint30>(dim_idx)];
        }
        return result;
    }

    void write_weight(uint17 token_id, uint12 dim_idx, uint3 value)
    {
        atomic
        {
            _embeddings[(cast<uint30>(token_id) << 12) | cast<uint30>(dim_idx)] = value;
        }
    }

    void set_bank_scale(uint8 value)
    {
        atomic
        {
            _bank_scale = value;
        }
    }

    void set_tensor_scale(uint32 value)
    {
        atomic
        {
            _tensor_scale = value;
        }
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
