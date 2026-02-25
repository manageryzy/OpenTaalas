// OpenTaalas - 8-bit saturating accumulator
// Minimal synthesizable Kanagawa design for smoke testing RTL generation.

module opentaalas.smoke_accumulator
    { accumulator
    }

class accumulator
{
private:
    uint8 _value = 0;

public:
    // Add to accumulator, saturating at 255
    uint8 add(uint8 amount)
    {
        uint8 result;

        atomic
        {
            uint9 sum = _value + amount;
            if (sum > 255)
            {
                _value = 255;
            }
            else
            {
                _value = cast<uint8>(sum);
            }
            result = _value;
        }

        return result;
    }

    // Read current value
    uint8 get()
    {
        return _value;
    }
}

export accumulator;
