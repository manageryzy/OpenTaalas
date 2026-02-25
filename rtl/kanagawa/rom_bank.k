// OpenTaalas - 3-bit aligned NOR ROM bank for LLaMA 3.1 weight storage
// Models a 4096-row x 8192-column ROM where each column stores a 3-bit weight.
// Total capacity: 4096 * 8192 * 3 bits = ~12.6 MB
//
// The full weight matrix is addressed by (row_addr, col_addr) which maps
// to a flat 25-bit index: concat(row_addr[11:0], col_addr[12:0]).

module opentaalas.rom_bank
    { rom_bank
    }

class rom_bank
{
private:
    // Flat storage: 4096 rows * 8192 cols = 33,554,432 x 3-bit entries
    [[memory]] uint3[33554432] _data;

public:
    // Read a single 3-bit weight at the given row and column
    uint3 read_weight(uint12 row_addr, uint13 col_addr)
    {
        uint3 result;
        atomic
        {
            result = _data[concat(row_addr, col_addr)];
        }
        return result;
    }

    // Write a weight (for initialization / programming)
    void write_weight(uint12 row_addr, uint13 col_addr, uint3 value)
    {
        atomic
        {
            _data[concat(row_addr, col_addr)] = value;
        }
    }
}

export rom_bank;
