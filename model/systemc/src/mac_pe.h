#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

// IQ3_S MAC Processing Element
// Multiplies codebook magnitude (uint4, odd values 1-15) by INT8 activation
// with separate sign bit, accumulates into INT24 register.
// Uses shift-and-add: mag = 2k+1, so mag×a = (k×a)<<1 + a
class MacPE {
 public:
  MacPE() : _accum(0) {}

  int24 mac(uint4 magnitude, uint1 sign, int8 activation) {
    int24 a(activation.to_int());
    // magnitude = 2k+1, k = magnitude >> 1
    int k = magnitude.to_int() >> 1;
    // k×a via shift-and-add (k is 3-bit: 0..7)
    int24 ka(0);
    if (k & 1) ka = ka + a;
    if (k & 2) ka = ka + (a << 1);
    if (k & 4) ka = ka + (a << 2);
    // product = (k×a)<<1 + a = (2k+1)×a
    int24 product = (ka << 1) + a;
    // Apply sign
    if (sign.to_int()) product = int24(0) - product;
    _accum = _accum + product;
    return _accum;
  }

  int24 read_accum() const { return _accum; }

  void clear() { _accum = int24(0); }

 private:
  int24 _accum;
};

}  // namespace opentaalas
