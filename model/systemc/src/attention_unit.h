#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class AttentionUnit {
  int32 _score_accum = 0;
  int32 _max_score = 0;

public:
  int32 dot_product(int8 q_elem, int8 k_elem) {
    int32 product = int32(q_elem) * int32(k_elem);
    _score_accum = _score_accum + product;
    return _score_accum;
  }

  int32 read_score() const { return _score_accum; }
  void clear_score() { _score_accum = 0; }
  void set_max_score(int32 score) { _max_score = score; }
  int32 get_max_score() const { return _max_score; }
};

} // namespace opentaalas
