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
            // BF16 square: x_sq = x_bf16 * x_bf16
            // Sign is always 0 for x^2.
            uint16 x_sq = 0;
            {
                uint16 x_exp = (x_bf16 >> 7) & 0xFF;
                if (x_exp != 0)
                {
                    uint16 ma = (x_bf16 & 0x7F) | 0x80;
                    uint32 prod = 0;
                    uint32 ma32 = cast<uint32>(ma);
                    // Shift-and-add: prod = ma * ma
                    if ((ma & 1) != 0)   { prod = prod + ma32; }
                    if ((ma & 2) != 0)   { prod = prod + (ma32 << 1); }
                    if ((ma & 4) != 0)   { prod = prod + (ma32 << 2); }
                    if ((ma & 8) != 0)   { prod = prod + (ma32 << 3); }
                    if ((ma & 16) != 0)  { prod = prod + (ma32 << 4); }
                    if ((ma & 32) != 0)  { prod = prod + (ma32 << 5); }
                    if ((ma & 64) != 0)  { prod = prod + (ma32 << 6); }
                    if ((ma & 128) != 0) { prod = prod + (ma32 << 7); }
                    uint16 r_mant = 0;
                    uint16 r_exp = 0;
                    if ((prod & 0x8000) != 0)
                    {
                        r_mant = cast<uint16>((prod >> 8) & 0x7F);
                        r_exp = x_exp + x_exp - 127 + 1;
                    }
                    else
                    {
                        r_mant = cast<uint16>((prod >> 7) & 0x7F);
                        r_exp = x_exp + x_exp - 127;
                    }
                    if (r_exp > 0 && r_exp < 255)
                    {
                        x_sq = (r_exp << 7) | r_mant;
                    }
                }
            }
            _sum_sq = _sum_sq + cast<uint32>(x_sq);
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
