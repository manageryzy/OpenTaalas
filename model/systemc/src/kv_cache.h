#pragma once
#include <opentaalas/types.h>
#include <vector>

namespace opentaalas {

template <int TOKENS = 4096, int HEADS = 8, int DIM = 128>
class KvCache {
  std::vector<int8> _k_store;
  std::vector<int8> _v_store;
  uint12 _write_ptr = 0;
  uint12 _seq_len = 0;

  int addr(uint12 token_pos, uint4 head_id, uint7 dim_idx) const {
    return static_cast<int>(token_pos) * HEADS * DIM +
           static_cast<int>(head_id) * DIM +
           static_cast<int>(dim_idx);
  }

public:
  KvCache() : _k_store(TOKENS * HEADS * DIM, int8(0)),
              _v_store(TOKENS * HEADS * DIM, int8(0)) {}

  void append_k(uint12 token_pos, uint4 head_id, uint7 dim_idx, int8 value) {
    _k_store[addr(token_pos, head_id, dim_idx)] = value;
  }
  void append_v(uint12 token_pos, uint4 head_id, uint7 dim_idx, int8 value) {
    _v_store[addr(token_pos, head_id, dim_idx)] = value;
  }
  int8 read_k(uint12 token_pos, uint4 head_id, uint7 dim_idx) const {
    return _k_store[addr(token_pos, head_id, dim_idx)];
  }
  int8 read_v(uint12 token_pos, uint4 head_id, uint7 dim_idx) const {
    return _v_store[addr(token_pos, head_id, dim_idx)];
  }

  void advance_write_ptr() {
    if (_write_ptr == TOKENS - 1)
      _write_ptr = 0;
    else
      _write_ptr = _write_ptr + 1;
    if (static_cast<int>(_seq_len) < TOKENS)
      _seq_len = _seq_len + 1;
  }

  uint12 get_seq_len() const { return _seq_len; }

  void reset() {
    _write_ptr = 0;
    _seq_len = 0;
  }
};

} // namespace opentaalas
