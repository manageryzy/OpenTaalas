// OpenTaalas - RoPE rotation datapath (per-layer instance)
// Pure combinational/pipelined BF16 rotate. No tables — cos/sin
// values come from a single chip-level rope_gen broadcast bus.
//
// Two rotation outputs per pair of inputs:
//   new_even = x_even * cos - x_odd  * sin
//   new_odd  = x_even * sin + x_odd  * cos
//
// Splitting from rope_gen lets each layer instantiate this small
// macro-free tile (~25K cells, 800×800) instead of duplicating the
// 8.4 Mbit cos/sin ROM. See docs/backend-metrics.md for rationale.

module opentaalas.rope_apply
    { rope_apply
    }

class rope_apply
{
public:
    // Rotate even-indexed output of a (x_even, x_odd) pair.
    // Returns x_even * cos - x_odd * sin.
    // [[schedule(8)]] — two parallel BF16 mults + chained BF16 sub.
    // Mirrors swiglu_compute's s8 floor: each BF16 mult ~50 levels,
    // BF16 add ~40 levels, 12 levels/stage at sky130.
    uint16 rotate_even(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val)
    {
        uint16 result;
        [[schedule(8)]]
        {
            // p1 = x_even * cos_val (BF16 multiply)
            uint16 p1 = 0;
            {
                uint16 a_exp = (x_even >> 7) & 0xFF;
                uint16 b_exp = (cos_val >> 7) & 0xFF;
                if (a_exp != 0 && b_exp != 0)
                {
                    uint16 r_sign = ((x_even >> 15) ^ (cos_val >> 15)) & 1;
                    uint16 ma = (x_even & 0x7F) | 0x80;
                    uint16 mb = (cos_val & 0x7F) | 0x80;
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
                        p1 = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }

            // p2 = -(x_odd * sin_val) — sign flipped to perform subtract via add
            uint16 p2 = 0;
            {
                uint16 a_exp = (x_odd >> 7) & 0xFF;
                uint16 b_exp = (sin_val >> 7) & 0xFF;
                if (a_exp != 0 && b_exp != 0)
                {
                    uint16 r_sign = (((x_odd >> 15) ^ (sin_val >> 15)) ^ 1) & 1;
                    uint16 ma = (x_odd & 0x7F) | 0x80;
                    uint16 mb = (sin_val & 0x7F) | 0x80;
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
                        p2 = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }

            // result = bf16_add(p1, p2) — inlined since Kanagawa schedule blocks
            // can't call atomic methods. Same algorithm as vector_unit.residual_add.
            result = 0;
            {
                uint16 pa_exp = (p1 >> 7) & 0xFF;
                uint16 pb_exp = (p2 >> 7) & 0xFF;
                uint16 pa_sign = (p1 >> 15) & 1;
                uint16 pb_sign = (p2 >> 15) & 1;

                if (pa_exp == 0)
                {
                    result = p2;
                }
                else if (pb_exp == 0)
                {
                    result = p1;
                }
                else
                {
                    uint16 pa_mant = (p1 & 0x7F) | 0x80;
                    uint16 pb_mant = (p2 & 0x7F) | 0x80;
                    uint16 sr_exp = 0;
                    uint16 aligned_a = 0;
                    uint16 aligned_b = 0;
                    if (pa_exp >= pb_exp)
                    {
                        sr_exp = pa_exp;
                        aligned_a = pa_mant << 4;
                        uint16 shift = pa_exp - pb_exp;
                        if (shift > 12) { shift = 12; }
                        aligned_b = pb_mant << 4;
                        if ((shift & 8) != 0) { aligned_b = aligned_b >> 8; }
                        if ((shift & 4) != 0) { aligned_b = aligned_b >> 4; }
                        if ((shift & 2) != 0) { aligned_b = aligned_b >> 2; }
                        if ((shift & 1) != 0) { aligned_b = aligned_b >> 1; }
                    }
                    else
                    {
                        sr_exp = pb_exp;
                        aligned_b = pb_mant << 4;
                        uint16 shift = pb_exp - pa_exp;
                        if (shift > 12) { shift = 12; }
                        aligned_a = pa_mant << 4;
                        if ((shift & 8) != 0) { aligned_a = aligned_a >> 8; }
                        if ((shift & 4) != 0) { aligned_a = aligned_a >> 4; }
                        if ((shift & 2) != 0) { aligned_a = aligned_a >> 2; }
                        if ((shift & 1) != 0) { aligned_a = aligned_a >> 1; }
                    }

                    uint16 sr_sign = 0;
                    uint16 sum = 0;
                    if (pa_sign == pb_sign)
                    {
                        sr_sign = pa_sign;
                        sum = aligned_a + aligned_b;
                    }
                    else
                    {
                        if (aligned_a >= aligned_b)
                        {
                            sr_sign = pa_sign;
                            sum = aligned_a - aligned_b;
                        }
                        else
                        {
                            sr_sign = pb_sign;
                            sum = aligned_b - aligned_a;
                        }
                    }

                    if (sum != 0)
                    {
                        uint16 pos = 0;
                        uint16 tmp = sum;
                        if ((tmp & 0xFF00) != 0) { tmp = tmp >> 8; pos = pos + 8; }
                        if ((tmp & 0xF0) != 0)   { tmp = tmp >> 4; pos = pos + 4; }
                        if ((tmp & 0xC) != 0)    { tmp = tmp >> 2; pos = pos + 2; }
                        if ((tmp & 0x2) != 0)    { pos = pos + 1; }

                        uint16 norm_exp = 0;
                        uint16 r_mant = 0;
                        if (pos > 11)
                        {
                            norm_exp = sr_exp + (pos - 11);
                            r_mant = (sum >> (pos - 7)) & 0x7F;
                        }
                        else if (pos < 11)
                        {
                            uint16 diff = 11 - pos;
                            if (diff >= sr_exp)
                            {
                                norm_exp = 0;
                            }
                            else
                            {
                                norm_exp = sr_exp - diff;
                            }
                            uint16 shifted = sum;
                            if ((diff & 8) != 0) { shifted = shifted << 8; }
                            if ((diff & 4) != 0) { shifted = shifted << 4; }
                            if ((diff & 2) != 0) { shifted = shifted << 2; }
                            if ((diff & 1) != 0) { shifted = shifted << 1; }
                            r_mant = (shifted >> 4) & 0x7F;
                        }
                        else
                        {
                            norm_exp = sr_exp;
                            r_mant = (sum >> 4) & 0x7F;
                        }

                        if (norm_exp > 0 && norm_exp < 255)
                        {
                            result = (sr_sign << 15) | (norm_exp << 7) | r_mant;
                        }
                    }
                }
            }
        }
        return result;
    }

    // Rotate odd-indexed output of a (x_even, x_odd) pair.
    // Returns x_even * sin + x_odd * cos.
    uint16 rotate_odd(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val)
    {
        uint16 result;
        [[schedule(8)]]
        {
            // p1 = x_even * sin_val
            uint16 p1 = 0;
            {
                uint16 a_exp = (x_even >> 7) & 0xFF;
                uint16 b_exp = (sin_val >> 7) & 0xFF;
                if (a_exp != 0 && b_exp != 0)
                {
                    uint16 r_sign = ((x_even >> 15) ^ (sin_val >> 15)) & 1;
                    uint16 ma = (x_even & 0x7F) | 0x80;
                    uint16 mb = (sin_val & 0x7F) | 0x80;
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
                        p1 = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }

            // p2 = x_odd * cos_val
            uint16 p2 = 0;
            {
                uint16 a_exp = (x_odd >> 7) & 0xFF;
                uint16 b_exp = (cos_val >> 7) & 0xFF;
                if (a_exp != 0 && b_exp != 0)
                {
                    uint16 r_sign = ((x_odd >> 15) ^ (cos_val >> 15)) & 1;
                    uint16 ma = (x_odd & 0x7F) | 0x80;
                    uint16 mb = (cos_val & 0x7F) | 0x80;
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
                        p2 = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }

            // result = bf16_add(p1, p2) — inlined
            result = 0;
            {
                uint16 pa_exp = (p1 >> 7) & 0xFF;
                uint16 pb_exp = (p2 >> 7) & 0xFF;
                uint16 pa_sign = (p1 >> 15) & 1;
                uint16 pb_sign = (p2 >> 15) & 1;

                if (pa_exp == 0)
                {
                    result = p2;
                }
                else if (pb_exp == 0)
                {
                    result = p1;
                }
                else
                {
                    uint16 pa_mant = (p1 & 0x7F) | 0x80;
                    uint16 pb_mant = (p2 & 0x7F) | 0x80;
                    uint16 sr_exp = 0;
                    uint16 aligned_a = 0;
                    uint16 aligned_b = 0;
                    if (pa_exp >= pb_exp)
                    {
                        sr_exp = pa_exp;
                        aligned_a = pa_mant << 4;
                        uint16 shift = pa_exp - pb_exp;
                        if (shift > 12) { shift = 12; }
                        aligned_b = pb_mant << 4;
                        if ((shift & 8) != 0) { aligned_b = aligned_b >> 8; }
                        if ((shift & 4) != 0) { aligned_b = aligned_b >> 4; }
                        if ((shift & 2) != 0) { aligned_b = aligned_b >> 2; }
                        if ((shift & 1) != 0) { aligned_b = aligned_b >> 1; }
                    }
                    else
                    {
                        sr_exp = pb_exp;
                        aligned_b = pb_mant << 4;
                        uint16 shift = pb_exp - pa_exp;
                        if (shift > 12) { shift = 12; }
                        aligned_a = pa_mant << 4;
                        if ((shift & 8) != 0) { aligned_a = aligned_a >> 8; }
                        if ((shift & 4) != 0) { aligned_a = aligned_a >> 4; }
                        if ((shift & 2) != 0) { aligned_a = aligned_a >> 2; }
                        if ((shift & 1) != 0) { aligned_a = aligned_a >> 1; }
                    }

                    uint16 sr_sign = 0;
                    uint16 sum = 0;
                    if (pa_sign == pb_sign)
                    {
                        sr_sign = pa_sign;
                        sum = aligned_a + aligned_b;
                    }
                    else
                    {
                        if (aligned_a >= aligned_b)
                        {
                            sr_sign = pa_sign;
                            sum = aligned_a - aligned_b;
                        }
                        else
                        {
                            sr_sign = pb_sign;
                            sum = aligned_b - aligned_a;
                        }
                    }

                    if (sum != 0)
                    {
                        uint16 pos = 0;
                        uint16 tmp = sum;
                        if ((tmp & 0xFF00) != 0) { tmp = tmp >> 8; pos = pos + 8; }
                        if ((tmp & 0xF0) != 0)   { tmp = tmp >> 4; pos = pos + 4; }
                        if ((tmp & 0xC) != 0)    { tmp = tmp >> 2; pos = pos + 2; }
                        if ((tmp & 0x2) != 0)    { pos = pos + 1; }

                        uint16 norm_exp = 0;
                        uint16 r_mant = 0;
                        if (pos > 11)
                        {
                            norm_exp = sr_exp + (pos - 11);
                            r_mant = (sum >> (pos - 7)) & 0x7F;
                        }
                        else if (pos < 11)
                        {
                            uint16 diff = 11 - pos;
                            if (diff >= sr_exp)
                            {
                                norm_exp = 0;
                            }
                            else
                            {
                                norm_exp = sr_exp - diff;
                            }
                            uint16 shifted = sum;
                            if ((diff & 8) != 0) { shifted = shifted << 8; }
                            if ((diff & 4) != 0) { shifted = shifted << 4; }
                            if ((diff & 2) != 0) { shifted = shifted << 2; }
                            if ((diff & 1) != 0) { shifted = shifted << 1; }
                            r_mant = (shifted >> 4) & 0x7F;
                        }
                        else
                        {
                            norm_exp = sr_exp;
                            r_mant = (sum >> 4) & 0x7F;
                        }

                        if (norm_exp > 0 && norm_exp < 255)
                        {
                            result = (sr_sign << 15) | (norm_exp << 7) | r_mant;
                        }
                    }
                }
            }
        }
        return result;
    }
}

export rope_apply;
