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
    // v11.3: revert to v9-style 1024-bit single output. The phased 256-bit
    // slicing has been moved to the chip-level wrapper (see
    // multi_layer_chip_wrapper.sv). This keeps rope_gen routable (v9 PnR
    // achieved 147 MHz / 350 DRC at 3000×3300 die). The chip-level slicer mux
    // is small stdcell logic (~1000 cells = 1024×4:1 mux pair) and sits in
    // the empty chip glue area near rope_gen — far easier to route there than
    // inside the macro, which was also fighting nor_rom_4096x1024 macro
    // placement (unsolvable congestion → 23K residual DRC in 12 PnR rounds).
    uint<1024> read_cos_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _cos_table[position]; }
        return result;
    }

    uint<1024> read_sin_row(uint12 position)
    {
        uint<1024> result;
        atomic { result = _sin_table[position]; }
        return result;
    }

    // Write full cos row (programming interface, full 1024-bit unchanged)
    void write_cos_row(uint12 position, uint<1024> value)
    {
        atomic { _cos_table[position] = value; }
    }

    // Write full sin row (programming interface, full 1024-bit unchanged)
    void write_sin_row(uint12 position, uint<1024> value)
    {
        atomic { _sin_table[position] = value; }
    }
}

export rope_gen;
