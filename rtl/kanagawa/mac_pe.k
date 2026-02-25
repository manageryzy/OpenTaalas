// OpenTaalas - INT3xINT8 MAC Processing Element
// Multiplies a 3-bit weight by an 8-bit activation and accumulates into a 32-bit register.
// Weight is unsigned 3-bit interpreted as signed: 0-3 map to 0-3, 4-7 map to -4 to -1.
// Uses shift-and-add to avoid DSP multiply intrinsics.

module opentaalas.mac_pe
    { mac_pe
    }

class mac_pe
{
private:
    int32 _accum = 0;

public:
    int32 mac(uint3 weight, int8 activation)
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

            _accum = _accum + product;
            result = _accum;
        }

        return result;
    }

    int32 read_accum()
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
