// OpenTaalas - MAC Array GEMV Engine
// Composes 4 PE accumulators, weight ROM, scale storage, and dequantization
// into a self-contained GEMV (General Matrix-Vector multiply) engine.
// Each PE accumulates INT3xINT8 dot products; outputs are dequantized to BF16.

module opentaalas.mac_array
    { mac_array
    }

class mac_array
{
private:
    // 4 PE accumulators (INT32)
    int32[4] _accum;

    // Weight storage: 4096 rows x 8192 cols of 3-bit weights
    [[memory]] uint3[33554432] _weights;

    // Dequantization scales
    uint8 _bank_scale;
    uint32 _tensor_scale;

public:
    // Perform one MAC on specified PE using shift-and-add multiply
    int32 mac_step(uint<2> pe_id, uint3 weight, int8 activation)
    {
        int32 result;

        atomic
        {
            int32 a = cast<int32>(activation);
            int32 product = 0;

            if (weight == 0)
            {
                product = 0;
            }
            else if (weight == 1)
            {
                product = a;
            }
            else if (weight == 2)
            {
                product = a << 1;
            }
            else if (weight == 3)
            {
                product = (a << 1) + a;
            }
            else if (weight == 4)
            {
                // -4
                product = 0 - (a << 2);
            }
            else if (weight == 5)
            {
                // -3
                product = 0 - ((a << 1) + a);
            }
            else if (weight == 6)
            {
                // -2
                product = 0 - (a << 1);
            }
            else
            {
                // -1
                product = 0 - a;
            }

            _accum[pe_id] = _accum[pe_id] + product;
            result = _accum[pe_id];
        }

        return result;
    }

    // Read a 3-bit weight from embedded ROM
    uint3 read_weight(uint12 row, uint13 col)
    {
        uint3 result;
        atomic
        {
            result = _weights[concat(row, col)];
        }
        return result;
    }

    // Write a weight (for initialization / programming)
    void write_weight(uint12 row, uint13 col, uint3 value)
    {
        atomic
        {
            _weights[concat(row, col)] = value;
        }
    }

    // Read dequantized BF16 output from a PE (inline dequant logic)
    uint16 read_output(uint<2> pe_id)
    {
        uint32 accum = cast<uint32>(_accum[pe_id]);

        // Extract sign and magnitude from INT32
        uint32 sign = (accum >> 31) & 1;

        // Expand FP8 E4M3 bank scale to FP32 bit pattern
        // FP8 E4M3: [sign(1)][exp(4)][mantissa(3)], bias=7
        // FP32:     [sign(1)][exp(8)][mantissa(23)], bias=127
        uint32 fp8 = cast<uint32>(_bank_scale);
        uint32 fp8_sign = (fp8 >> 7) & 1;
        uint32 fp8_exp = (fp8 >> 3) & 0xF;
        uint32 fp8_mant = fp8 & 0x7;
        uint32 fp32_exp = fp8_exp + 120;
        uint32 fp32_scale = (fp8_sign << 31) | (fp32_exp << 23) | (fp8_mant << 20);

        // Simplified BF16: combine sign with scale, truncate to upper 16 bits
        // Full IEEE-754 multiply with magnitude will be refined in VPU integration
        uint32 combined = (sign << 31) | (fp32_scale & 0x7FFFFFFF);
        uint16 result = cast<uint16>(combined >> 16);

        return result;
    }

    // Read raw INT32 accumulator value
    int32 read_accum(uint<2> pe_id)
    {
        return _accum[pe_id];
    }

    // Set FP8 E4M3 bank scale for dequantization
    void set_bank_scale(uint8 value)
    {
        atomic
        {
            _bank_scale = value;
        }
    }

    // Set FP32 tensor scale for dequantization
    void set_tensor_scale(uint32 value)
    {
        atomic
        {
            _tensor_scale = value;
        }
    }

    // Clear one PE accumulator
    void clear_pe(uint<2> pe_id)
    {
        atomic
        {
            _accum[pe_id] = 0;
        }
    }

    // Clear all PE accumulators
    void clear_all()
    {
        atomic
        {
            _accum[0] = 0;
            _accum[1] = 0;
            _accum[2] = 0;
            _accum[3] = 0;
        }
    }
}

export mac_array;
