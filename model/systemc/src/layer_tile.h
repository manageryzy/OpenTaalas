#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class layer_tile {
 private:
  uint6 _state = 0;
  uint16 _layer_id = 0;
  uint12 _position = 0;

 public:
  void set_layer_id(uint16 id) { _layer_id = id; }
  uint16 get_layer_id() { return _layer_id; }

  uint6 get_state() { return _state; }

  void advance_state() {
    if (_state < 16) _state = _state + 1;
  }

  void reset_state() { _state = 0; }

  bool is_done() { return _state == 16; }

  uint12 get_position() { return _position; }

  void advance_position() {
    if (_position == 4095)
      _position = 0;
    else
      _position = _position + 1;
  }

  void reset() {
    _state = 0;
    _position = 0;
  }
};

}  // namespace opentaalas
