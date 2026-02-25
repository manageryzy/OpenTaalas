// OpenTaalas - Attention Computation Unit
// INT8xINT8 dot product for QK scores, score tracking for softmax stability.
// Shift-and-add multiply avoids DSP intrinsics.

module opentaalas.attention_unit
    { attention_unit
    }

class attention_unit
{
private:
    int32 _score_accum = 0;
    int32 _max_score = 0;

public:
    // Accumulate one element of Q.K dot product (int8 x int8 → int32)
    // Uses shift-and-add decomposition for the 8-bit multiply.
    int32 dot_product(int8 q_elem, int8 k_elem)
    {
        int32 result;

        atomic
        {
            int32 q = cast<int32>(q_elem);
            uint8 k_bits = cast<uint8>(k_elem);
            int32 product = 0;

            // Bits 0-6: positive contributions (weights 1,2,4,8,16,32,64)
            if ((k_bits & 1) != 0)
            {
                product = product + q;
            }
            if ((k_bits & 2) != 0)
            {
                product = product + (q << 1);
            }
            if ((k_bits & 4) != 0)
            {
                product = product + (q << 2);
            }
            if ((k_bits & 8) != 0)
            {
                product = product + (q << 3);
            }
            if ((k_bits & 16) != 0)
            {
                product = product + (q << 4);
            }
            if ((k_bits & 32) != 0)
            {
                product = product + (q << 5);
            }
            if ((k_bits & 64) != 0)
            {
                product = product + (q << 6);
            }
            // Bit 7: sign bit (weight -128)
            if ((k_bits & 128) != 0)
            {
                product = product - (q << 7);
            }

            _score_accum = _score_accum + product;
            result = _score_accum;
        }

        return result;
    }

    // Read current dot product accumulator
    int32 read_score()
    {
        return _score_accum;
    }

    // Reset dot product accumulator
    void clear_score()
    {
        atomic
        {
            _score_accum = 0;
        }
    }

    // Track max score for stable softmax
    void set_max_score(int32 score)
    {
        atomic
        {
            _max_score = score;
        }
    }

    // Read current max score
    int32 get_max_score()
    {
        return _max_score;
    }
}

export attention_unit;
