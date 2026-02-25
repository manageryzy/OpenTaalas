#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class GlobalController {
 public:
  GlobalController()
      : _state(0), _token_count(0), _current_token(0), _output_token(0) {}

  void start(uint17 token_id) {
    _current_token = token_id;
    _state = 1;
  }

  void advance() {
    if (_state == 35) {
      _token_count = _token_count + 1;
      _state = 0;
    } else {
      _state = _state + 1;
    }
  }

  uint6 get_state() const { return _state; }
  uint17 get_current_token() const { return _current_token; }

  void set_output_token(uint17 token_id) { _output_token = token_id; }
  uint17 get_output_token() const { return _output_token; }

  uint12 get_token_count() const { return _token_count; }
  bool is_idle() const { return _state == 0; }
  bool is_output_ready() const { return _state == 35; }

  void reset() {
    _state = 0;
    _token_count = 0;
    _current_token = 0;
    _output_token = 0;
  }

 private:
  uint6 _state;
  uint12 _token_count;
  uint17 _current_token;
  uint17 _output_token;
};

}  // namespace opentaalas
