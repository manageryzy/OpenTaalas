#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class LlamaChip {
 public:
  LlamaChip()
      : _state(0),
        _token_count(0),
        _current_token(0),
        _output_token(0),
        _current_layer(0),
        _pipeline_active(false) {}

  void decode_start(uint17 token_id) {
    _current_token = token_id;
    _state = 1;
    _current_layer = 0;
    _pipeline_active = true;
  }

  void decode_advance() {
    if (_state == 35) {
      _token_count = _token_count + 1;
      _state = 0;
      _pipeline_active = false;
      _current_layer = 0;
    } else {
      if (_state >= 1 && _state <= 32) {
        _current_layer = _state - 1;
      }
      _state = _state + 1;
    }
  }

  uint6 decode_get_state() const { return _state; }
  uint5 decode_get_layer() const { return _current_layer; }

  void set_output(uint17 token_id) { _output_token = token_id; }
  uint17 get_output() const { return _output_token; }

  bool is_idle() const { return _state == 0; }
  bool is_output_ready() const { return _state == 35; }
  uint12 get_token_count() const { return _token_count; }

  void reset() {
    _state = 0;
    _token_count = 0;
    _current_token = 0;
    _output_token = 0;
    _current_layer = 0;
    _pipeline_active = false;
  }

 private:
  uint6 _state;
  uint12 _token_count;
  uint17 _current_token;
  uint17 _output_token;
  uint5 _current_layer;
  bool _pipeline_active;
};

}  // namespace opentaalas
