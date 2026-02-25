// OpenTaalas - LM Head for LLaMA 3.1 inference
// Final projection: hidden state (4096) -> logits (128256) + argmax
// Includes final RMSNorm (model.norm) gamma and rsqrt LUT.

module opentaalas.lm_head
    { lm_head
    }

class lm_head
{
private:
    // Weight storage: 128256 x 4096 of 3-bit weights
    [[memory]] uint3[525336576] _weights;

    // Final RMSNorm gamma (BF16 as uint16)
    uint16[4096] _gamma;

    // RMSNorm rsqrt LUT
    uint16[256] _rsqrt_lut;

    // Dequantization scales
    uint8 _bank_scale;
    uint32 _tensor_scale;

    // Argmax tracking
    int32 _best_score = 0;
    uint17 _best_token = 0;

public:
    // Read a 3-bit weight from storage
    uint3 read_weight(uint17 output_idx, uint12 dim_idx)
    {
        uint3 result;
        atomic
        {
            uint30 addr = (cast<uint30>(output_idx) << 12) | cast<uint30>(dim_idx);
            result = _weights[addr];
        }
        return result;
    }

    // Write a weight (for initialization / programming)
    void write_weight(uint17 output_idx, uint12 dim_idx, uint3 value)
    {
        atomic
        {
            uint30 addr = (cast<uint30>(output_idx) << 12) | cast<uint30>(dim_idx);
            _weights[addr] = value;
        }
    }

    // Set learned RMSNorm scale parameter (BF16 as uint16)
    void set_gamma(uint16 index, uint16 value)
    {
        atomic
        {
            _gamma[index] = value;
        }
    }

    // Read learned RMSNorm scale parameter
    uint16 get_gamma(uint16 index)
    {
        uint16 result;
        atomic
        {
            result = _gamma[index];
        }
        return result;
    }

    // Set rsqrt LUT entry
    void set_rsqrt_lut(uint8 index, uint16 value)
    {
        atomic
        {
            _rsqrt_lut[index] = value;
        }
    }

    // Set FP8 E4M3 bank scale
    void set_bank_scale(uint8 value)
    {
        atomic
        {
            _bank_scale = value;
        }
    }

    // Set FP32 tensor scale
    void set_tensor_scale(uint32 value)
    {
        atomic
        {
            _tensor_scale = value;
        }
    }

    // Update argmax: track token with highest score
    void update_argmax(uint17 token_idx, int32 score)
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
    uint17 get_best_token()
    {
        uint17 result;
        atomic
        {
            result = _best_token;
        }
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

export lm_head;
