// OpenTaalas - RoPE table generator (chip-level, single instance)
// Owns the cos/sin tables. One generator broadcasts cos/sin rows
// to all transformer layers' rope_apply units.
//
// Tables: 4096 positions × 64 freq pairs (1024 bits per row).
// Backed by 2× nor_rom_4096x1024 fold=2 macros via [[memory]] annotation.
//
// Splits the rope tile from the rotation datapath, eliminating macro-edge
// congestion that fights with the 1024-bit rotate logic in the same tile.
// See docs/backend-metrics.md for vpu_rope split rationale.

module opentaalas.rope_gen
    { rope_gen
    }

class rope_gen
{
private:
    [[memory]] uint<1024>[4096] _cos_table;
    [[memory]] uint<1024>[4096] _sin_table;

public:
    // Read full cos row for a position (all 64 freq pairs, 1024 bits)
    uint<1024> read_cos_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _cos_table[position]; }
        return result;
    }

    // Read full sin row for a position (all 64 freq pairs, 1024 bits)
    uint<1024> read_sin_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _sin_table[position]; }
        return result;
    }

    // Write full cos row (programming interface)
    void write_cos_row(uint12 position, uint<1024> value)
    {
        atomic { _cos_table[position] = value; }
    }

    // Write full sin row (programming interface)
    void write_sin_row(uint12 position, uint<1024> value)
    {
        atomic { _sin_table[position] = value; }
    }
}

export rope_gen;
