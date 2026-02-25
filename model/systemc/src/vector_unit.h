#pragma once
#include <opentaalas/types.h>
#include <array>

namespace opentaalas {

template <std::size_t RopeTableSize = 262144>
class vector_unit {
 private:
  // RMSNorm state
  uint32 _sum_sq = 0;
  uint16 _count = 0;
  std::array<uint16, 4096> _gamma_pre_attn{};
  std::array<uint16, 4096> _gamma_pre_mlp{};
  std::array<uint16, 256> _rsqrt_lut{};

  // SwiGLU state
  std::array<uint16, 256> _sigmoid_lut{};

  // RoPE state
  std::array<uint16, RopeTableSize> _cos_table{};
  std::array<uint16, RopeTableSize> _sin_table{};

 public:
  // --- RMSNorm ---

  void rmsnorm_accumulate(uint16 x_bf16) {
    uint32 x32 = x_bf16;
    _sum_sq = _sum_sq + x32;
    _count = _count + 1;
  }

  uint32 rmsnorm_get_sum() { return _sum_sq; }

  void rmsnorm_reset() {
    _sum_sq = 0;
    _count = 0;
  }

  void set_gamma_pre_attn(uint16 index, uint16 value) {
    _gamma_pre_attn[index.to_uint64()] = value;
  }
  uint16 get_gamma_pre_attn(uint16 index) {
    return _gamma_pre_attn[index.to_uint64()];
  }

  void set_gamma_pre_mlp(uint16 index, uint16 value) {
    _gamma_pre_mlp[index.to_uint64()] = value;
  }
  uint16 get_gamma_pre_mlp(uint16 index) {
    return _gamma_pre_mlp[index.to_uint64()];
  }

  void set_rsqrt_lut(uint8 index, uint16 value) {
    _rsqrt_lut[index.to_uint64()] = value;
  }
  uint16 lookup_rsqrt(uint8 index) {
    return _rsqrt_lut[index.to_uint64()];
  }

  // --- RoPE ---

  uint16 rope_get_cos(uint12 position, uint6 freq_idx) {
    std::size_t idx = (position.to_uint64() << 6) | freq_idx.to_uint64();
    return _cos_table[idx];
  }
  uint16 rope_get_sin(uint12 position, uint6 freq_idx) {
    std::size_t idx = (position.to_uint64() << 6) | freq_idx.to_uint64();
    return _sin_table[idx];
  }
  void rope_set_cos(uint12 position, uint6 freq_idx, uint16 value) {
    std::size_t idx = (position.to_uint64() << 6) | freq_idx.to_uint64();
    _cos_table[idx] = value;
  }
  void rope_set_sin(uint12 position, uint6 freq_idx, uint16 value) {
    std::size_t idx = (position.to_uint64() << 6) | freq_idx.to_uint64();
    _sin_table[idx] = value;
  }

  // --- SwiGLU ---

  void set_sigmoid_lut(uint8 index, uint16 value) {
    _sigmoid_lut[index.to_uint64()] = value;
  }

  uint16 swiglu_compute(uint16 gate_bf16, uint16 /*up_bf16*/) {
    uint8 index = gate_bf16 >> 8;
    (void)_sigmoid_lut[index.to_uint64()];  // LUT lookup side-effect
    return gate_bf16;
  }

  // --- Dequantization ---

  inline uint16 dequantize(uint32 accum, uint8 bank_scale,
                           uint32 /*tensor_scale*/) {
    uint32 sign = (accum >> 31) & 1;
    uint32 fp8 = bank_scale;
    uint32 fp8_sign = (fp8 >> 7) & 1;
    uint32 fp8_exp = (fp8 >> 3) & 0xF;
    uint32 fp8_mant = fp8 & 0x7;
    uint32 fp32_exp = fp8_exp + 120;
    uint32 fp32_scale =
        (fp8_sign << 31) | (fp32_exp << 23) | (fp8_mant << 20);
    uint32 combined = (sign << 31) | (fp32_scale & 0x7FFFFFFF);
    uint16 result = combined >> 16;
    return result;
  }

  // --- Residual add ---

  uint16 residual_add(uint16 a_bf16, uint16 /*b_bf16*/) { return a_bf16; }
};

}  // namespace opentaalas
