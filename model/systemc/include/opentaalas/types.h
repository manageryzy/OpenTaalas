#pragma once
#include <ac_int.h>
#include <cstdint>

namespace opentaalas {
  using uint3  = ac_int<3, false>;
  using uint4  = ac_int<4, false>;
  using uint5  = ac_int<5, false>;
  using uint6  = ac_int<6, false>;
  using uint7  = ac_int<7, false>;
  using uint8  = ac_int<8, false>;
  using uint12 = ac_int<12, false>;
  using uint13 = ac_int<13, false>;
  using uint16 = ac_int<16, false>;
  using uint17 = ac_int<17, false>;
  using uint22 = ac_int<22, false>;
  using uint30 = ac_int<30, false>;
  using uint32 = ac_int<32, false>;
  using int8   = ac_int<8, true>;
  using int32  = ac_int<32, true>;
  using bf16_t = ac_int<16, false>;
  using fp32_t = ac_int<32, false>;
  using fp8_t  = ac_int<8, false>;
}
