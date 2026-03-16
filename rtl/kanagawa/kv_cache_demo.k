// OpenTaalas - Reduced-scale KV cache for sky130 academic demo
// 16 tokens x 8 heads x 128 dim = 16,384 INT8 entries per K/V store
// Proves circular buffer architecture with 8x sram_4096x8 tiles.
// Full-scale (4096 tokens) requires off-chip DRAM — same as every production AI chip.

module opentaalas.kv_cache_demo
    { kv_cache_demo
    }

class kv_cache_demo
{
private:
    [[memory]] int8[16384] _k_store;
    [[memory]] int8[16384] _v_store;

    uint4 _write_ptr = 0;
    uint5 _seq_len = 0;

public:
    void append_k(uint4 token_pos, uint4 head_id, uint7 dim_idx, int8 value)
    {
        atomic
        {
            _k_store[(cast<uint14>(token_pos) << 10) | (cast<uint14>(head_id) << 7) | cast<uint14>(dim_idx)] = value;
        }
    }

    void append_v(uint4 token_pos, uint4 head_id, uint7 dim_idx, int8 value)
    {
        atomic
        {
            _v_store[(cast<uint14>(token_pos) << 10) | (cast<uint14>(head_id) << 7) | cast<uint14>(dim_idx)] = value;
        }
    }

    int8 read_k(uint4 token_pos, uint4 head_id, uint7 dim_idx)
    {
        int8 result;
        atomic
        {
            result = _k_store[(cast<uint14>(token_pos) << 10) | (cast<uint14>(head_id) << 7) | cast<uint14>(dim_idx)];
        }
        return result;
    }

    int8 read_v(uint4 token_pos, uint4 head_id, uint7 dim_idx)
    {
        int8 result;
        atomic
        {
            result = _v_store[(cast<uint14>(token_pos) << 10) | (cast<uint14>(head_id) << 7) | cast<uint14>(dim_idx)];
        }
        return result;
    }

    void advance_write_ptr()
    {
        atomic
        {
            if (_write_ptr == 15)
            {
                _write_ptr = 0;
            }
            else
            {
                _write_ptr = _write_ptr + 1;
            }

            if (_seq_len < 16)
            {
                _seq_len = _seq_len + 1;
            }
        }
    }

    uint5 get_seq_len()
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

export kv_cache_demo;
