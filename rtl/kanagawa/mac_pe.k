// OpenTaalas - IQ3_S MAC Processing Element
// Multiplies codebook magnitude (uint4, odd 1-15) by INT8 activation
// with separate sign bit, accumulates into INT24 register.
// Uses shift-and-add: mag = 2k+1, so mag*a = (k*a)<<1 + a

module opentaalas.mac_pe
    { mac_pe
    }

class mac_pe
{
private:
    int<24> _accum = 0;

public:
    int<24> mac(uint4 magnitude, uint<1> sign_bit, int8 activation)
    {
        int<24> result;
        // [[schedule(2)]] pipelines the 3-term shift-and-add + sign-flip + accumulator.
        // atomic gave -3.23 ns; total path ~7 ns wants ~3.5 ns/stage.
        [[schedule(2)]]
        {
            int<24> a = cast<int<24>>(activation);
            int<24> k_val = cast<int<24>>(magnitude >> 1);

            // k*a via shift-and-add
            int<24> ka = 0;
            if ((k_val & 1) != 0) { ka = ka + a; }
            if ((k_val & 2) != 0) { ka = ka + (a << 1); }
            if ((k_val & 4) != 0) { ka = ka + (a << 2); }

            // product = (k*a)<<1 + a = (2k+1)*a
            int<24> product = (ka << 1) + a;

            // Apply sign
            if (sign_bit == 1)
            {
                product = 0 - product;
            }

            _accum = _accum + product;
            result = _accum;
        }
        return result;
    }

    int<24> read_accum()
    {
        return _accum;
    }

    void clear()
    {
        atomic
        {
            _accum = 0;
        }
    }
}

export mac_pe;
