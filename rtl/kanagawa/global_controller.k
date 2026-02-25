// OpenTaalas - Global Controller FSM
// Top-level FSM that sequences token processing through the full
// LLaMA 3.1 pipeline: IDLE → EMBED → LAYER_0..31 → LM_HEAD → OUTPUT.

module opentaalas.global_controller
    { global_controller
    }

class global_controller
{
private:
    uint<6> _state = 0;
    uint12  _token_count = 0;
    uint17  _current_token = 0;
    uint17  _output_token = 0;

public:
    // Begin processing a token: latch token_id and move to EMBED state.
    void start(uint17 token_id)
    {
        atomic
        {
            _current_token = token_id;
            _state = 1;
        }
    }

    // Advance FSM to the next state.
    void advance()
    {
        atomic
        {
            if (_state == 35)
            {
                _token_count = _token_count + 1;
                _state = 0;
            }
            else
            {
                _state = _state + 1;
            }
        }
    }

    // Return current FSM state.
    uint<6> get_state()
    {
        return _state;
    }

    // Return the token currently being processed.
    uint17 get_current_token()
    {
        return _current_token;
    }

    // Store the predicted next-token ID from LM head.
    void set_output_token(uint17 token_id)
    {
        atomic
        {
            _output_token = token_id;
        }
    }

    // Return the predicted next-token ID.
    uint17 get_output_token()
    {
        return _output_token;
    }

    // Return number of tokens generated so far.
    uint12 get_token_count()
    {
        return _token_count;
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

    // Reset all state for a new conversation.
    void reset()
    {
        atomic
        {
            _state = 0;
            _token_count = 0;
            _current_token = 0;
            _output_token = 0;
        }
    }
}

export global_controller;
