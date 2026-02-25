#pragma once
#include <opentaalas/types.h>

namespace opentaalas {

class MacPE {
 public:
  MacPE() : _accum(0) {}

  int32 mac(uint3 weight, int8 activation) {
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

    _accum = _accum + product;
    return _accum;
  }

  int32 read_accum() const { return _accum; }

  void clear() { _accum = int32(0); }

 private:
  int32 _accum;
};

}  // namespace opentaalas
