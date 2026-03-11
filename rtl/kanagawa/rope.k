// OpenTaalas - Rotary Position Embedding (RoPE) unit (Wide-Word)
// Precomputed sin/cos tables: 4096 positions x 64 freq pairs.
// Each row = 1024 bits (64 x 16-bit BF16 values).

module opentaalas.rope
    { rope_unit
    }

class rope_unit
{
private:
    [[memory]] uint<1024>[4096] _cos_table;
    [[memory]] uint<1024>[4096] _sin_table;

public:
    // Read full cos row for a position (all 64 freq pairs)
    uint<1024> read_cos_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _cos_table[position]; }
        return result;
    }

    // Read full sin row for a position
    uint<1024> read_sin_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _sin_table[position]; }
        return result;
    }

    // Write full cos row
    void write_cos_row(uint12 position, uint<1024> value)
    {
        atomic { _cos_table[position] = value; }
    }

    // Write full sin row
    void write_sin_row(uint12 position, uint<1024> value)
    {
        atomic { _sin_table[position] = value; }
    }

    // Rotation stub (unchanged — full rotation done in VPU)
    uint16 rotate_pair(uint16 x_even, uint16 x_odd, uint16 cos_val, uint16 sin_val)
    {
        return x_even;
    }
}

export rope_unit;
