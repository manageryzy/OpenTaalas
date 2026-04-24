// OpenTaalas - SwiGLU activation unit for LLaMA 3.1
// SwiGLU: output = SiLU(gate) * up, where SiLU(x) = x * sigmoid(x)
// Sigmoid looked up from 256-entry LUT indexed by upper 8 bits of BF16 gate.
// BF16 shift-and-add multiplier (no hardware multiplier needed).

module opentaalas.swiglu
    { swiglu_unit
    }

class swiglu_unit
{
private:
    uint16[256] _sigmoid_lut;

public:
    // Set a sigmoid LUT entry (BF16 value)
    void set_sigmoid_lut(uint8 index, uint16 value)
    {
        atomic
        {
            _sigmoid_lut[index] = value;
        }
    }

    // Read a sigmoid LUT entry
    uint16 lookup_sigmoid(uint8 index)
    {
        uint16 result;
        atomic
        {
            result = _sigmoid_lut[index];
        }
        return result;
    }

    // Compute SiLU(gate) = gate * sigmoid(gate)
    // Looks up sigmoid from LUT using upper 8 bits of gate BF16,
    // then performs BF16 shift-and-add multiply.
    // [[schedule(4)]] splits into 4 stages: lookup + 3-deep BF16 multiplier.
    // The 8-term shift-and-add is ~50 levels of logic — needs ~3 stages at sky130.
    uint16 compute_silu(uint16 gate_bf16)
    {
        uint16 result;
        [[schedule(4)]]
        {
            uint8 index = cast<uint8>(gate_bf16 >> 8);
            uint16 sig = _sigmoid_lut[index];

            // BF16 multiply: gate * sigmoid
            result = 0;
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
                        result = (r_sign << 15) | (r_exp << 7) | r_mant;
                    }
                }
            }
        }
        return result;
    }

    // Compute SwiGLU: SiLU(gate) * up
    // = gate * sigmoid(gate) * up
    // [[schedule(7)]] gives 7 pipeline stages: lookup + two 3-deep BF16 multipliers.
    // Without this, all logic is forced into 1 cycle (~17.5 ns crit path at sky130).
    // Tried [[schedule(9)]] — same WNS (-1.42 vs -1.41), more registers.
    // Residual WNS is routing/reg overhead, not logic depth.
    uint16 compute_swiglu(uint16 gate_bf16, uint16 up_bf16)
    {
        uint16 result;
        [[schedule(7)]]
        {
            // Step 1: sigmoid LUT lookup
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
}

export swiglu_unit;
