// OpenTaalas - Vector Processing Unit (VPU) wrapper
// Unified module combining RMSNorm, SwiGLU, RoPE, and dequantization.
// Self-contained: all functionality inlined (no cross-module imports).

module opentaalas.vector_unit
    { vector_unit
    }

class vector_unit
{
private:
    // RMSNorm state
    uint32 _sum_sq = 0;
    uint16 _count = 0;
    uint16[4096] _gamma_pre_attn;
    uint16[4096] _gamma_pre_mlp;
    uint16[256] _rsqrt_lut;

    // SwiGLU state
    uint16[256] _sigmoid_lut;

    // RoPE state — 4096 positions x 64 freq pairs = 262144 entries
    [[memory]] uint16[262144] _cos_table;
    [[memory]] uint16[262144] _sin_table;

public:
    // --- RMSNorm ---

    void rmsnorm_accumulate(uint16 x_bf16)
    {
        atomic
        {
            uint32 x32 = cast<uint32>(x_bf16);
            _sum_sq = _sum_sq + x32;
            _count = _count + 1;
        }
    }

    uint32 rmsnorm_get_sum()
    {
        uint32 result;
        atomic
        {
            result = _sum_sq;
        }
        return result;
    }

    void rmsnorm_reset()
    {
        atomic
        {
            _sum_sq = 0;
            _count = 0;
        }
    }

    void set_gamma_pre_attn(uint16 index, uint16 value)
    {
        atomic
        {
            _gamma_pre_attn[index] = value;
        }
    }

    uint16 get_gamma_pre_attn(uint16 index)
    {
        uint16 result;
        atomic
        {
            result = _gamma_pre_attn[index];
        }
        return result;
    }

    void set_gamma_pre_mlp(uint16 index, uint16 value)
    {
        atomic
        {
            _gamma_pre_mlp[index] = value;
        }
    }

    uint16 get_gamma_pre_mlp(uint16 index)
    {
        uint16 result;
        atomic
        {
            result = _gamma_pre_mlp[index];
        }
        return result;
    }

    void set_rsqrt_lut(uint8 index, uint16 value)
    {
        atomic
        {
            _rsqrt_lut[index] = value;
        }
    }

    uint16 lookup_rsqrt(uint8 index)
    {
        uint16 result;
        atomic
        {
            result = _rsqrt_lut[index];
        }
        return result;
    }

    // --- RoPE ---

    uint16 rope_get_cos(uint12 position, uint<6> freq_idx)
    {
        uint16 result;
        atomic
        {
            result = _cos_table[(cast<uint18>(position) << 6) | cast<uint18>(freq_idx)];
        }
        return result;
    }

    uint16 rope_get_sin(uint12 position, uint<6> freq_idx)
    {
        uint16 result;
        atomic
        {
            result = _sin_table[(cast<uint18>(position) << 6) | cast<uint18>(freq_idx)];
        }
        return result;
    }

    void rope_set_cos(uint12 position, uint<6> freq_idx, uint16 value)
    {
        atomic
        {
            _cos_table[(cast<uint18>(position) << 6) | cast<uint18>(freq_idx)] = value;
        }
    }

    void rope_set_sin(uint12 position, uint<6> freq_idx, uint16 value)
    {
        atomic
        {
            _sin_table[(cast<uint18>(position) << 6) | cast<uint18>(freq_idx)] = value;
        }
    }

    // --- SwiGLU ---

    void set_sigmoid_lut(uint8 index, uint16 value)
    {
        atomic
        {
            _sigmoid_lut[index] = value;
        }
    }

    uint16 swiglu_compute(uint16 gate_bf16, uint16 up_bf16)
    {
        uint16 result;
        atomic
        {
            uint8 index = cast<uint8>(gate_bf16 >> 8);
            uint16 sig = _sigmoid_lut[index];
            result = gate_bf16;
        }
        return result;
    }

    // --- Dequantization ---

    uint16 dequantize(uint32 accum, uint8 bank_scale, uint32 tensor_scale)
    {
        uint32 sign = (accum >> 31) & 1;
        uint32 fp8 = cast<uint32>(bank_scale);
        uint32 fp8_sign = (fp8 >> 7) & 1;
        uint32 fp8_exp = (fp8 >> 3) & 0xF;
        uint32 fp8_mant = fp8 & 0x7;
        uint32 fp32_exp = fp8_exp + 120;
        uint32 fp32_scale = (fp8_sign << 31) | (fp32_exp << 23) | (fp8_mant << 20);
        uint32 combined = (sign << 31) | (fp32_scale & 0x7FFFFFFF);
        uint16 result = cast<uint16>(combined >> 16);
        return result;
    }

    // --- Residual add (stub) ---

    uint16 residual_add(uint16 a_bf16, uint16 b_bf16)
    {
        return a_bf16;
    }
}

export vector_unit;
