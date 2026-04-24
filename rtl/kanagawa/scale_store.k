// OpenTaalas - Scale store for LLaMA 3.1 quantized inference
// Stores FP8 per-bank scales (uint8) and FP32 per-tensor scales (uint32).

module opentaalas.scale_store
    { scale_store
    }

class scale_store
{
private:
    [[memory]] uint8[32] _bank_scales;
    [[memory]] uint32[8] _tensor_scales;

public:
    uint8 get_bank_scale(uint<5> bank_id)
    {
        return _bank_scales[bank_id];
    }

    uint32 get_tensor_scale(uint<3> matrix_id)
    {
        return _tensor_scales[matrix_id];
    }

    void set_bank_scale(uint<5> bank_id, uint8 value)
    {
        atomic
        {
            _bank_scales[bank_id] = value;
        }
    }

    void set_tensor_scale(uint<3> matrix_id, uint32 value)
    {
        atomic
        {
            _tensor_scales[matrix_id] = value;
        }
    }
}

export scale_store;
