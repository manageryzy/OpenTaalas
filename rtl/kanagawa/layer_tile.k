// OpenTaalas - Transformer Layer Tile for LLaMA 3.1
// Core reusable layer controller: one instance per transformer layer (32 total).
// Manages the forward-pass FSM that sequences sub-operations through shared
// compute units (MAC array, attention unit, vector unit, KV cache).
// Self-contained: no cross-module imports.

module opentaalas.layer_tile
    { layer_tile
    }

class layer_tile
{
private:
    // FSM states for the transformer forward pass:
    //  0: IDLE
    //  1: RMSNORM_PRE_ATTN
    //  2: ATTN_Q_PROJ
    //  3: ATTN_K_PROJ
    //  4: ATTN_V_PROJ
    //  5: ROPE_APPLY
    //  6: KV_CACHE_APPEND
    //  7: ATTN_COMPUTE  (QK dot, softmax, V multiply)
    //  8: ATTN_O_PROJ
    //  9: RESIDUAL_ADD_1
    // 10: RMSNORM_PRE_MLP
    // 11: MLP_GATE_PROJ
    // 12: MLP_UP_PROJ
    // 13: SWIGLU
    // 14: MLP_DOWN_PROJ
    // 15: RESIDUAL_ADD_2
    // 16: DONE
    uint<6> _state = 0;

    // Which layer this tile represents (0..31)
    uint16 _layer_id = 0;

    // Current token position for RoPE embedding
    uint12 _position = 0;

public:
    // --- Layer identity ---

    void set_layer_id(uint16 id)
    {
        atomic
        {
            _layer_id = id;
        }
    }

    uint16 get_layer_id()
    {
        return _layer_id;
    }

    // --- FSM state ---

    uint<6> get_state()
    {
        return _state;
    }

    // Advance to the next state in the forward pass sequence.
    // Saturates at DONE (16) — caller must reset to start a new pass.
    void advance_state()
    {
        atomic
        {
            if (_state < 16)
            {
                _state = _state + 1;
            }
        }
    }

    void reset_state()
    {
        atomic
        {
            _state = 0;
        }
    }

    bool is_done()
    {
        bool result;
        atomic
        {
            if (_state == 16)
            {
                result = true;
            }
            else
            {
                result = false;
            }
        }
        return result;
    }

    // --- Token position (RoPE) ---

    uint12 get_position()
    {
        return _position;
    }

    // Advance position counter (wraps at 4095 for context window)
    void advance_position()
    {
        atomic
        {
            if (_position == 4095)
            {
                _position = 0;
            }
            else
            {
                _position = _position + 1;
            }
        }
    }

    // --- Full reset (new conversation) ---

    void reset()
    {
        atomic
        {
            _state = 0;
            _position = 0;
        }
    }
}

export layer_tile;
