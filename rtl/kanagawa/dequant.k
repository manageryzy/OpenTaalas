// OpenTaalas - IQ3_S Dequantization Unit
// Converts INT24 accumulator to FP32 using BF16 super-scale and 4-bit sub-scale.
// Formula: result = accum * (1 + 2*sub_scale) * bf16_to_fp32(super_scale)
// Returns FP32 bit pattern as uint32.
// All multiplies use shift-and-add to avoid DSP intrinsics.

module opentaalas.dequant
    { dequant_unit
    }

class dequant_unit
{
public:
    uint32 dequantize(int<24> accum, uint16 super_scale_bf16, uint4 sub_scale)
    {
        // Step 1: Multiply accumulator by integer sub-scale (1 + 2*sub_scale)
        // sub_scale is 4-bit (0..15), so int_scale is 1..31 (5-bit)
        // Use shift-and-add to avoid DSP multiply
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
            // Find position of highest set bit
            uint32 pos = 0;
            uint32 tmp = mag;
            if ((tmp & 0xFFFF0000) != 0) { tmp = tmp >> 16; pos = pos + 16; }
            if ((tmp & 0xFF00) != 0)     { tmp = tmp >> 8;  pos = pos + 8; }
            if ((tmp & 0xF0) != 0)       { tmp = tmp >> 4;  pos = pos + 4; }
            if ((tmp & 0xC) != 0)        { tmp = tmp >> 2;  pos = pos + 2; }
            if ((tmp & 0x2) != 0)        { pos = pos + 1; }

            uint32 exp_val = 127 + pos;

            // Align mantissa: shift mag so bit[pos] lands at bit[23]
            uint32 shifted = mag;
            if (pos > 23)
            {
                shifted = mag >> (pos - 23);
            }
            else if (pos < 23)
            {
                // Use multiply-by-power-of-2 to avoid dynamic left-shift width issue
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

        // Step 3: Expand BF16 super-scale to FP32 (shift left 16)
        uint32 fp32_scale = cast<uint32>(super_scale_bf16) << 16;

        // Step 4: FP32 multiply (bit-level, shift-and-add mantissa)
        uint32 a_exp = (fp_accum >> 23) & 0xFF;
        uint32 b_exp = (fp32_scale >> 23) & 0xFF;

        uint32 result = 0;
        if (a_exp != 0 && b_exp != 0)
        {
            uint32 r_sign = ((fp_accum >> 31) ^ (fp32_scale >> 31)) & 1;
            uint32 r_exp = a_exp + b_exp - 127;

            // Mantissa multiply: (1.mant_a) * (1.mant_b)
            // Take upper 12 bits of each 24-bit significand
            uint<12> ma = cast<uint<12>>(((fp_accum & 0x7FFFFF) | 0x800000) >> 12);
            uint<12> mb = cast<uint<12>>(((fp32_scale & 0x7FFFFF) | 0x800000) >> 12);

            // 12-bit x 12-bit multiply via shift-and-add (result fits 24 bits)
            uint32 prod = 0;
            uint32 ma32 = cast<uint32>(ma);
            if ((mb & 1) != 0)    { prod = prod + ma32; }
            if ((mb & 2) != 0)    { prod = prod + (ma32 << 1); }
            if ((mb & 4) != 0)    { prod = prod + (ma32 << 2); }
            if ((mb & 8) != 0)    { prod = prod + (ma32 << 3); }
            if ((mb & 16) != 0)   { prod = prod + (ma32 << 4); }
            if ((mb & 32) != 0)   { prod = prod + (ma32 << 5); }
            if ((mb & 64) != 0)   { prod = prod + (ma32 << 6); }
            if ((mb & 128) != 0)  { prod = prod + (ma32 << 7); }
            if ((mb & 256) != 0)  { prod = prod + (ma32 << 8); }
            if ((mb & 512) != 0)  { prod = prod + (ma32 << 9); }
            if ((mb & 1024) != 0) { prod = prod + (ma32 << 10); }
            if ((mb & 2048) != 0) { prod = prod + (ma32 << 11); }

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
                result = (r_sign << 31) | (r_exp << 23) | r_mant;
            }
        }

        return result;
    }
}

export dequant_unit;
