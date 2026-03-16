// OpenTaalas - Reduced-scale LM Head for sky130 academic demo
// 1024 vocab x 4096 dim x 3-bit weights, stored as 192-bit chunks
// (64 weights per chunk, 64 chunks per vocab entry = 65536 rows)
// Maps to 1x nor_rom_65536x192 — same macro as embed_rom.
// Full-scale (128256 vocab) requires off-chip DRAM — same as every production AI chip.
// RMSNorm is handled by vector_unit in the real architecture — not included here.

module opentaalas.lm_head_demo
    { lm_head_demo
    }

class lm_head_demo
{
private:
    // Weight storage: 1024 vocab x 64 chunks = 65536 rows of 192 bits
    [[memory]] uint<192>[65536] _weights;

    // Dequantization scales
    uint8 _bank_scale;
    uint32 _tensor_scale;

    // Argmax tracking
    int32 _best_score = 0;
    uint10 _best_token = 0;

public:
    // Read 192-bit weight chunk (64 x 3-bit weights)
    // addr = (vocab_idx[9:0] << 6) | chunk_idx[5:0]
    uint<192> read_weight_chunk(uint<16> addr)
    {
        uint<192> result;
        atomic { result = _weights[addr]; }
        return result;
    }

    // Write 192-bit weight chunk (for initialization)
    void write_weight_chunk(uint<16> addr, uint<192> value)
    {
        atomic { _weights[addr] = value; }
    }

    // Set FP8 E4M3 bank scale
    void set_bank_scale(uint8 value)
    {
        atomic { _bank_scale = value; }
    }

    // Set FP32 tensor scale
    void set_tensor_scale(uint32 value)
    {
        atomic { _tensor_scale = value; }
    }

    // Update argmax: track token with highest score
    void update_argmax(uint10 token_idx, int32 score)
    {
        atomic
        {
            if (score > _best_score)
            {
                _best_score = score;
                _best_token = token_idx;
            }
        }
    }

    // Return token index with highest score
    uint10 get_best_token()
    {
        uint10 result;
        atomic { result = _best_token; }
        return result;
    }

    // Clear argmax state for next prediction
    void reset_argmax()
    {
        atomic
        {
            _best_score = 0;
            _best_token = 0;
        }
    }
}

export lm_head_demo;
