// OpenTaalas - LUT + Interpolation Unit for nonlinear functions
// 256-entry lookup table with nearest-neighbor selection for sigmoid, exp, rsqrt.
// Full linear interpolation deferred to VPU integration.

module opentaalas.lut_interp
    { lut_unit
    }

class lut_unit
{
private:
    [[memory]] uint16[256] _table;

public:
    // Write a single entry into the LUT
    void set_entry(uint8 index, uint16 value)
    {
        atomic
        {
            _table[index] = value;
        }
    }

    // Read a single entry from the LUT
    uint16 get_entry(uint8 index)
    {
        uint16 result;
        atomic
        {
            result = _table[index];
        }
        return result;
    }

    // Lookup with nearest-neighbor selection
    // Upper 8 bits of input = table index
    // Lower 8 bits = fractional part
    // Returns y0 if frac < 128, y1 (next entry) otherwise
    uint16 lookup(uint16 input)
    {
        uint16 result;

        atomic
        {
            uint8 index = cast<uint8>(input >> 8);
            uint8 frac = cast<uint8>(input);

            uint16 y0 = _table[index];

            if (frac < 128)
            {
                result = y0;
            }
            else
            {
                // Clamp next index to 255 to avoid overflow
                uint9 next = cast<uint9>(index) + 1;
                uint8 next_index;
                if (next > 255)
                {
                    next_index = 255;
                }
                else
                {
                    next_index = cast<uint8>(next);
                }
                result = _table[next_index];
            }
        }

        return result;
    }
}

export lut_unit;
