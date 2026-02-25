// OpenTaalas - RMSNorm unit for LLaMA 3.1 inference
// output = x * gamma / sqrt(mean(x^2) + eps)
// Accumulates sum of squares, then normalizes via LUT-based rsqrt.

module opentaalas.rmsnorm
    { rmsnorm_unit
    }

class rmsnorm_unit
{
private:
    uint32 _sum_sq = 0;
    uint16 _count = 0;
    uint16[4096] _gamma;
    uint16[256] _rsqrt_lut;

public:
    // Accumulate x^2 into running sum (BF16 input as uint16)
    void accumulate_sq(uint16 x_bf16)
    {
        atomic
        {
            uint32 x32 = cast<uint32>(x_bf16);
            _sum_sq = _sum_sq + x32;
            _count = _count + 1;
        }
    }

    // Read accumulated sum of squares
    uint32 get_sum_sq()
    {
        uint32 result;
        atomic
        {
            result = _sum_sq;
        }
        return result;
    }

    // Clear accumulator state
    void reset_accum()
    {
        atomic
        {
            _sum_sq = 0;
            _count = 0;
        }
    }

    // Set learned scale parameter (BF16 as uint16)
    void set_gamma(uint16 index, uint16 value)
    {
        atomic
        {
            _gamma[index] = value;
        }
    }

    // Read learned scale parameter
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

    // Read rsqrt LUT entry
    uint16 lookup_rsqrt(uint8 index)
    {
        uint16 result;
        atomic
        {
            result = _rsqrt_lut[index];
        }
        return result;
    }
}

export rmsnorm_unit;
