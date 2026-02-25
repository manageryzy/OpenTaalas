// OpenTaalas - Top-Level LlamaChip Controller
// Manages the decode pipeline: embed -> 32 layers -> LM head -> output.
// Orchestrates pipeline via state machine; actual compute modules
// (embed_rom, layer_tile, lm_head) are composed at the SystemVerilog level.
// Self-contained: no cross-module imports.

module opentaalas.llama_chip
    { llama_chip
    }

class llama_chip
{
private:
    // Global FSM states:
    //  0: IDLE
    //  1: EMBED
    //  2-33: LAYER_0..LAYER_31
    //  34: LM_HEAD
    //  35: OUTPUT
    uint<6> _state = 0;
    uint12  _token_count = 0;
    uint17  _current_token = 0;
    uint17  _output_token = 0;
    uint<5> _current_layer = 0;
    bool    _pipeline_active = false;

public:
    // Begin decoding a token: latch token_id and enter EMBED state.
    void decode_start(uint17 token_id)
    {
        atomic
        {
            _current_token = token_id;
            _state = 1;
            _current_layer = 0;
            _pipeline_active = true;
        }
    }

    // Advance pipeline one step through the FSM.
    void decode_advance()
    {
        atomic
        {
            if (_state == 35)
            {
                _token_count = _token_count + 1;
                _state = 0;
                _pipeline_active = false;
                _current_layer = 0;
            }
            else
            {
                // Track active layer when entering layer states (2-33).
                // After increment, new state = _state + 1.
                // Layer index = new_state - 2 = _state - 1.
                if (_state >= 1)
                {
                    if (_state <= 32)
                    {
                        _current_layer = cast<uint<5>>(_state - 1);
                    }
                }
                _state = _state + 1;
            }
        }
    }

    // Return current global FSM state.
    uint<6> decode_get_state()
    {
        return _state;
    }

    // Return current active layer (0..31).
    uint<5> decode_get_layer()
    {
        return _current_layer;
    }

    // Store the predicted next-token ID from LM head.
    void set_output(uint17 token_id)
    {
        atomic
        {
            _output_token = token_id;
        }
    }

    // Read the predicted next-token ID.
    uint17 get_output()
    {
        return _output_token;
    }

    // True when FSM is idle (state 0).
    bool is_idle()
    {
        return _state == 0;
    }

    // True when output is ready (state 35).
    bool is_output_ready()
    {
        return _state == 35;
    }

    // Return number of tokens generated so far.
    uint12 get_token_count()
    {
        return _token_count;
    }

    // Full reset for new conversation.
    void reset()
    {
        atomic
        {
            _state = 0;
            _token_count = 0;
            _current_token = 0;
            _output_token = 0;
            _current_layer = 0;
            _pipeline_active = false;
        }
    }
}

export llama_chip;
