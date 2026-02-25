#pragma once
#include <opentaalas/types.h>
#include "dequant.h"
#include <cstdint>
#include <vector>

namespace opentaalas {

template <int ROWS = 4096, int COLS = 8192>
class MacArray {
 public:
  MacArray()
      : _weights(static_cast<size_t>(ROWS) * COLS, uint3(0)),
        _bank_scale(0),
        _tensor_scale(0) {
    for (int i = 0; i < 4; ++i) _accum[i] = int32(0);
  }

  int32 mac_step(int pe_id, uint3 weight, int8 activation) {
    int32 a = activation;
    int32 product(0);
    int w = weight.to_int();

    if (w == 0)
      product = int32(0);
    else if (w == 1)
      product = a;
    else if (w == 2)
      product = a << 1;
    else if (w == 3)
      product = (a << 1) + a;
    else if (w == 4)
      product = int32(0) - (a << 2);
    else if (w == 5)
      product = int32(0) - ((a << 1) + a);
    else if (w == 6)
      product = int32(0) - (a << 1);
    else
      product = int32(0) - a;

    _accum[pe_id] = _accum[pe_id] + product;
    return _accum[pe_id];
  }

  uint3 read_weight(uint12 row, uint13 col) const {
    return _weights[static_cast<size_t>(row.to_int()) * COLS + col.to_int()];
  }

  void write_weight(uint12 row, uint13 col, uint3 value) {
    _weights[static_cast<size_t>(row.to_int()) * COLS + col.to_int()] = value;
  }

  uint16 read_output(int pe_id) const {
    auto acc_s = static_cast<std::int32_t>(_accum[pe_id].to_int64());
    uint32 accum_u(static_cast<std::uint32_t>(acc_s));
    return _dequant.dequantize(accum_u, _bank_scale, _tensor_scale);
  }

  int32 read_accum(int pe_id) const { return _accum[pe_id]; }

  void set_bank_scale(uint8 value) { _bank_scale = value; }
  void set_tensor_scale(uint32 value) { _tensor_scale = value; }

  void clear_pe(int pe_id) { _accum[pe_id] = int32(0); }

  void clear_all() {
    for (int i = 0; i < 4; ++i) _accum[i] = int32(0);
  }

 private:
  int32 _accum[4];
  std::vector<uint3> _weights;
  uint8 _bank_scale;
  uint32 _tensor_scale;
  DequantUnit _dequant;
};

}  // namespace opentaalas
