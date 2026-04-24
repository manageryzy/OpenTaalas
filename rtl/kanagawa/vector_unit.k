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
    [[memory]] uint16[4096] _gamma_pre_attn;
    [[memory]] uint16[4096] _gamma_pre_mlp;
    [[memory]] uint16[256] _rsqrt_lut;

    // SwiGLU state
    [[memory]] uint16[256] _sigmoid_lut;

    // RoPE state — 4096 positions, each row = 64 freq pairs × 16 bits = 1024 bits
    [[memory]] uint<1024>[4096] _cos_table;
    [[memory]] uint<1024>[4096] _sin_table;

public:
    // --- RMSNorm ---

    // [[schedule(4)]] pipelines the 8-term BF16 square (~50 levels of logic).
    // Mirrors standalone rmsnorm.k where s4 was the proven floor (s5 regressed).
    void rmsnorm_accumulate(uint16 x_bf16)
    {
        [[schedule(4)]]
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

    // --- RoPE (wide-word row access) ---

    uint<1024> rope_read_cos_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _cos_table[position]; }
        return result;
    }

    uint<1024> rope_read_sin_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _sin_table[position]; }
        return result;
    }

    void rope_write_cos_row(uint12 position, uint<1024> value)
    {
        atomic { _cos_table[position] = value; }
    }

    void rope_write_sin_row(uint12 position, uint<1024> value)
    {
        atomic { _sin_table[position] = value; }
    }

    // --- SwiGLU ---

    void set_sigmoid_lut(uint8 index, uint16 value)
    {
        atomic
        {
            _sigmoid_lut[index] = value;
        }
    }

    // [[schedule(8)]] pipelines two chained BF16 multipliers + sigmoid LUT lookup.
    // Standalone swiglu.k peaked at s7 pre-SyncRam; vector_unit's [[memory]] arrays
    // add 1 cycle of read latency, so s8 is the new sweet spot (one extra stage).
    uint16 swiglu_compute(uint16 gate_bf16, uint16 up_bf16)
    {
        uint16 result;
        [[schedule(8)]]
        {
            // Step 1: Lookup sigmoid(gate) from LUT using upper 8 bits
            uint8 index = cast<uint8>(gate_bf16 >> 8);
            uint16 sig = _sigmoid_lut[index];

            // Step 2: BF16 multiply — silu = gate * sigmoid
            uint16 silu = 0;
            {
                uint16 a_exp = (gate_bf16 >> 7) & 0xFF;
                uint16 b_exp = (sig >> 7) & 0xFF;
                if (a_exp != 0 && b_exp != 0)
                {
                    uint16 r_sign = ((gate_bf16 >> 15) ^ (sig >> 15)) & 1;
                    uint16 ma = (gate_bf16 & 0x7F) | 0x80;
                    uint16 mb = (sig & 0x7F) | 0x80;
                    uint32 prod = 0;
                    uint32 ma32 = cast<uint32>(ma);
                    if ((mb & 1) != 0)   { prod = prod + ma32; }
                    if ((mb & 2) != 0)   { prod = prod + (ma32 << 1); }
                    if ((mb & 4) != 0)   { prod = prod + (ma32 << 2); }
                    if ((mb & 8) != 0)   { prod = prod + (ma32 << 3); }
                    if ((mb & 16) != 0)  { prod = prod + (ma32 << 4); }
                    if ((mb & 32) != 0)  { prod = prod + (ma32 << 5); }
                    if ((mb & 64) != 0)  { prod = prod + (ma32 << 6); }
                    if ((mb & 128) != 0) { prod = prod + (ma32 << 7); }
                    uint16 r_mant = 0;
                    uint16 r_exp = 0;
                    if ((prod & 0x8000) != 0)
                    {
                        r_mant = cast<uint16>((prod >> 8) & 0x7F);
                        r_exp = a_exp + b_exp - 127 + 1;
                    }
                    else
                    {
                        r_mant = cast<uint16>((prod >> 7) & 0x7F);
                        r_exp = a_exp + b_exp - 127;
                    }
                    if (r_exp > 0 && r_exp < 255)
                    {
                        silu = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }

            // Step 3: BF16 multiply — result = silu * up
            result = 0;
            {
                uint16 a_exp = (silu >> 7) & 0xFF;
                uint16 b_exp = (up_bf16 >> 7) & 0xFF;
                if (a_exp != 0 && b_exp != 0)
                {
                    uint16 r_sign = ((silu >> 15) ^ (up_bf16 >> 15)) & 1;
                    uint16 ma = (silu & 0x7F) | 0x80;
                    uint16 mb = (up_bf16 & 0x7F) | 0x80;
                    uint32 prod = 0;
                    uint32 ma32 = cast<uint32>(ma);
                    if ((mb & 1) != 0)   { prod = prod + ma32; }
                    if ((mb & 2) != 0)   { prod = prod + (ma32 << 1); }
                    if ((mb & 4) != 0)   { prod = prod + (ma32 << 2); }
                    if ((mb & 8) != 0)   { prod = prod + (ma32 << 3); }
                    if ((mb & 16) != 0)  { prod = prod + (ma32 << 4); }
                    if ((mb & 32) != 0)  { prod = prod + (ma32 << 5); }
                    if ((mb & 64) != 0)  { prod = prod + (ma32 << 6); }
                    if ((mb & 128) != 0) { prod = prod + (ma32 << 7); }
                    uint16 r_mant = 0;
                    uint16 r_exp = 0;
                    if ((prod & 0x8000) != 0)
                    {
                        r_mant = cast<uint16>((prod >> 8) & 0x7F);
                        r_exp = a_exp + b_exp - 127 + 1;
                    }
                    else
                    {
                        r_mant = cast<uint16>((prod >> 7) & 0x7F);
                        r_exp = a_exp + b_exp - 127;
                    }
                    if (r_exp > 0 && r_exp < 255)
                    {
                        result = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }
        }
        return result;
    }

    // --- Dequantization (IQ3_S: INT24 × (1+2×sub_scale) × BF16_super → BF16) ---
    // Adapted from dequant.k, returns BF16 (upper 16 bits of FP32 result).

    // [[schedule(6)]] pipelines INT5 sub-scale mul + int24→int32 sign extend +
    // FP32 convert + BF16 normalize. ~80 ops, ~60 logic levels. Matches dequant.k atomic
    // baseline performance after retiming (was -0.67 ns standalone with no retiming).
    uint16 dequantize(int<24> accum, uint16 super_scale_bf16, uint4 sub_scale)
    {
        uint16 result;
        [[schedule(6)]]
        {
            // Step 1: Integer multiply by sub-scale factor (1 + 2*sub_scale)
            uint<5> scale5 = cast<uint<5>>(sub_scale) * 2 + 1;
            int<24> a = accum;
            int32 scaled = 0;
            if ((scale5 & 1) != 0)  { scaled = scaled + cast<int32>(a); }
            if ((scale5 & 2) != 0)  { scaled = scaled + (cast<int32>(a) << 1); }
            if ((scale5 & 4) != 0)  { scaled = scaled + (cast<int32>(a) << 2); }
            if ((scale5 & 8) != 0)  { scaled = scaled + (cast<int32>(a) << 3); }
            if ((scale5 & 16) != 0) { scaled = scaled + (cast<int32>(a) << 4); }

            // Step 2: Convert signed integer to FP32 bit pattern
            uint32 is_neg = 0;
            uint32 mag = 0;
            if (scaled < 0)
            {
                is_neg = 1;
                mag = cast<uint32>(0 - scaled);
            }
            else
            {
                mag = cast<uint32>(scaled);
            }

            uint32 fp_accum = 0;
            if (mag != 0)
            {
                // Find highest set bit position
                uint32 pos = 0;
                uint32 tmp = mag;
                if ((tmp & 0xFFFF0000) != 0) { tmp = tmp >> 16; pos = pos + 16; }
                if ((tmp & 0xFF00) != 0)     { tmp = tmp >> 8;  pos = pos + 8; }
                if ((tmp & 0xF0) != 0)       { tmp = tmp >> 4;  pos = pos + 4; }
                if ((tmp & 0xC) != 0)        { tmp = tmp >> 2;  pos = pos + 2; }
                if ((tmp & 0x2) != 0)        { pos = pos + 1; }

                uint32 exp_val = 127 + pos;

                // Align mantissa so bit[pos] lands at bit[23]
                uint32 shifted = mag;
                if (pos > 23)
                {
                    shifted = mag >> (pos - 23);
                }
                else if (pos < 23)
                {
                    uint32 shift_amt = 23 - pos;
                    if ((shift_amt & 16) != 0) { shifted = shifted * 65536; }
                    if ((shift_amt & 8) != 0)  { shifted = shifted * 256; }
                    if ((shift_amt & 4) != 0)  { shifted = shifted * 16; }
                    if ((shift_amt & 2) != 0)  { shifted = shifted * 4; }
                    if ((shift_amt & 1) != 0)  { shifted = shifted * 2; }
                }
                uint32 mant = shifted & 0x7FFFFF;
                fp_accum = (is_neg << 31) | (exp_val << 23) | mant;
            }

            // Step 3: Expand BF16 super-scale to FP32
            uint32 fp32_scale = cast<uint32>(super_scale_bf16) << 16;

            // Step 4: FP32 multiply (12-bit mantissa chunks, shift-and-add)
            uint32 a_exp = (fp_accum >> 23) & 0xFF;
            uint32 b_exp = (fp32_scale >> 23) & 0xFF;

            uint32 fp32_result = 0;
            if (a_exp != 0 && b_exp != 0)
            {
                uint32 r_sign = ((fp_accum >> 31) ^ (fp32_scale >> 31)) & 1;
                uint32 r_exp = a_exp + b_exp - 127;

                uint<12> ma12 = cast<uint<12>>(((fp_accum & 0x7FFFFF) | 0x800000) >> 12);
                uint<12> mb12 = cast<uint<12>>(((fp32_scale & 0x7FFFFF) | 0x800000) >> 12);

                uint32 prod = 0;
                uint32 ma32 = cast<uint32>(ma12);
                if ((mb12 & 1) != 0)    { prod = prod + ma32; }
                if ((mb12 & 2) != 0)    { prod = prod + (ma32 << 1); }
                if ((mb12 & 4) != 0)    { prod = prod + (ma32 << 2); }
                if ((mb12 & 8) != 0)    { prod = prod + (ma32 << 3); }
                if ((mb12 & 16) != 0)   { prod = prod + (ma32 << 4); }
                if ((mb12 & 32) != 0)   { prod = prod + (ma32 << 5); }
                if ((mb12 & 64) != 0)   { prod = prod + (ma32 << 6); }
                if ((mb12 & 128) != 0)  { prod = prod + (ma32 << 7); }
                if ((mb12 & 256) != 0)  { prod = prod + (ma32 << 8); }
                if ((mb12 & 512) != 0)  { prod = prod + (ma32 << 9); }
                if ((mb12 & 1024) != 0) { prod = prod + (ma32 << 10); }
                if ((mb12 & 2048) != 0) { prod = prod + (ma32 << 11); }

                uint32 r_mant = 0;
                if ((prod & 0x1000000) != 0)
                {
                    r_mant = (prod >> 1) & 0x7FFFFF;
                    r_exp = r_exp + 1;
                }
                else
                {
                    r_mant = prod & 0x7FFFFF;
                }

                if (r_exp != 0 && r_exp < 255)
                {
                    fp32_result = (r_sign << 31) | (r_exp << 23) | r_mant;
                }
            }

            // Step 5: Convert FP32 to BF16 (truncate lower 16 bits)
            result = cast<uint16>(fp32_result >> 16);
        }
        return result;
    }

    // --- Residual add (BF16) ---

    // [[schedule(4)]] pipelines BF16 exponent alignment + signed shift + accumulate.
    // ~40 ops; mirrors rmsnorm s4 which handles a similar 8-term shift-and-add.
    uint16 residual_add(uint16 a_bf16, uint16 b_bf16)
    {
        uint16 result;
        [[schedule(4)]]
        {
            uint16 a_exp = (a_bf16 >> 7) & 0xFF;
            uint16 b_exp = (b_bf16 >> 7) & 0xFF;
            uint16 a_sign = (a_bf16 >> 15) & 1;
            uint16 b_sign = (b_bf16 >> 15) & 1;

            // Handle zeros
            if (a_exp == 0)
            {
                result = b_bf16;
            }
            else if (b_exp == 0)
            {
                result = a_bf16;
            }
            else
            {
                // 8-bit mantissa with implicit 1
                uint16 a_mant = (a_bf16 & 0x7F) | 0x80;
                uint16 b_mant = (b_bf16 & 0x7F) | 0x80;

                // Align to larger exponent
                uint16 r_exp = 0;
                uint16 aligned_a = 0;
                uint16 aligned_b = 0;
                if (a_exp >= b_exp)
                {
                    r_exp = a_exp;
                    aligned_a = a_mant << 4;  // 4 guard bits
                    uint16 shift = a_exp - b_exp;
                    if (shift > 12) { shift = 12; }
                    aligned_b = b_mant << 4;
                    if ((shift & 8) != 0) { aligned_b = aligned_b >> 8; }
                    if ((shift & 4) != 0) { aligned_b = aligned_b >> 4; }
                    if ((shift & 2) != 0) { aligned_b = aligned_b >> 2; }
                    if ((shift & 1) != 0) { aligned_b = aligned_b >> 1; }
                }
                else
                {
                    r_exp = b_exp;
                    aligned_b = b_mant << 4;
                    uint16 shift = b_exp - a_exp;
                    if (shift > 12) { shift = 12; }
                    aligned_a = a_mant << 4;
                    if ((shift & 8) != 0) { aligned_a = aligned_a >> 8; }
                    if ((shift & 4) != 0) { aligned_a = aligned_a >> 4; }
                    if ((shift & 2) != 0) { aligned_a = aligned_a >> 2; }
                    if ((shift & 1) != 0) { aligned_a = aligned_a >> 1; }
                }

                // Add or subtract based on signs
                uint16 r_sign = 0;
                uint16 sum = 0;
                if (a_sign == b_sign)
                {
                    r_sign = a_sign;
                    sum = aligned_a + aligned_b;
                }
                else
                {
                    if (aligned_a >= aligned_b)
                    {
                        r_sign = a_sign;
                        sum = aligned_a - aligned_b;
                    }
                    else
                    {
                        r_sign = b_sign;
                        sum = aligned_b - aligned_a;
                    }
                }

                if (sum == 0)
                {
                    result = 0;
                }
                else
                {
                    // Normalize: find leading 1 position
                    // sum is at most 13 bits (8-bit mant + 4 guard + 1 carry)
                    uint16 pos = 0;
                    uint16 tmp = sum;
                    if ((tmp & 0xFF00) != 0) { tmp = tmp >> 8; pos = pos + 8; }
                    if ((tmp & 0xF0) != 0)   { tmp = tmp >> 4; pos = pos + 4; }
                    if ((tmp & 0xC) != 0)    { tmp = tmp >> 2; pos = pos + 2; }
                    if ((tmp & 0x2) != 0)    { pos = pos + 1; }

                    // Mantissa bit 11 is the "1.xxx" position (8-bit mant << 4 guard - 1)
                    // Adjust exponent relative to expected position 11
                    uint16 norm_exp = 0;
                    uint16 r_mant = 0;
                    if (pos > 11)
                    {
                        norm_exp = r_exp + (pos - 11);
                        r_mant = (sum >> (pos - 7)) & 0x7F;
                    }
                    else if (pos < 11)
                    {
                        uint16 diff = 11 - pos;
                        if (diff >= r_exp)
                        {
                            norm_exp = 0;
                        }
                        else
                        {
                            norm_exp = r_exp - diff;
                        }
                        // Shift sum left to align
                        uint16 shifted = sum;
                        if ((diff & 8) != 0) { shifted = shifted << 8; }
                        if ((diff & 4) != 0) { shifted = shifted << 4; }
                        if ((diff & 2) != 0) { shifted = shifted << 2; }
                        if ((diff & 1) != 0) { shifted = shifted << 1; }
                        r_mant = (shifted >> 4) & 0x7F;
                    }
                    else
                    {
                        norm_exp = r_exp;
                        r_mant = (sum >> 4) & 0x7F;
                    }

                    if (norm_exp == 0 || norm_exp >= 255)
                    {
                        result = 0;
                    }
                    else
                    {
                        result = (r_sign << 15) | (norm_exp << 7) | r_mant;
                    }
                }
            }
        }
        return result;
    }
}

export vector_unit;
