// OpenTaalas - Per-layer KV cache in SRAM for LLaMA 3.1 inference
// 4096 tokens x 8 heads x 128 dim = 4,194,304 INT8 entries per K/V store
// Circular buffer with write pointer for streaming token append.

module opentaalas.kv_cache
    { kv_cache
    }

class kv_cache
{
private:
    [[memory]] int8[4194304] _k_store;
    [[memory]] int8[4194304] _v_store;

    uint12 _write_ptr = 0;
    uint12 _seq_len = 0;

public:
    void append_k(uint12 token_pos, uint4 head_id, uint7 dim_idx, int8 value)
    {
        atomic
        {
            _k_store[(cast<uint22>(token_pos) << 10) | (cast<uint22>(head_id) << 7) | cast<uint22>(dim_idx)] = value;
        }
    }

    void append_v(uint12 token_pos, uint4 head_id, uint7 dim_idx, int8 value)
    {
        atomic
        {
            _v_store[(cast<uint22>(token_pos) << 10) | (cast<uint22>(head_id) << 7) | cast<uint22>(dim_idx)] = value;
        }
    }

    int8 read_k(uint12 token_pos, uint4 head_id, uint7 dim_idx)
    {
        int8 result;
        atomic
        {
            result = _k_store[(cast<uint22>(token_pos) << 10) | (cast<uint22>(head_id) << 7) | cast<uint22>(dim_idx)];
        }
        return result;
    }

    int8 read_v(uint12 token_pos, uint4 head_id, uint7 dim_idx)
    {
        int8 result;
        atomic
        {
            result = _v_store[(cast<uint22>(token_pos) << 10) | (cast<uint22>(head_id) << 7) | cast<uint22>(dim_idx)];
        }
        return result;
    }

    void advance_write_ptr()
    {
        atomic
        {
            if (_write_ptr == 4095)
            {
                _write_ptr = 0;
            }
            else
            {
                _write_ptr = _write_ptr + 1;
            }

            if (_seq_len < 4095)
            {
                _seq_len = _seq_len + 1;
            }
        }
    }

    uint12 get_seq_len()
    {
        return _seq_len;
    }

    void reset()
    {
        atomic
        {
            _write_ptr = 0;
            _seq_len = 0;
        }
    }
}

export kv_cache;
