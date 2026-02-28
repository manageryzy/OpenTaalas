#pragma once
#include <opentaalas/types.h>
#include <bf16_math.h>
#include <array>
#include <cstring>

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
    uint16 x_sq = bf16_mul(x_bf16, x_bf16);
    _sum_sq = _sum_sq + uint32(x_sq);
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

  uint16 swiglu_compute(uint16 gate_bf16, uint16 up_bf16) {
    uint8 index = gate_bf16 >> 8;
    uint16 sigmoid = _sigmoid_lut[index.to_uint64()];
    uint16 silu = bf16_mul(gate_bf16, sigmoid);
    return bf16_mul(silu, up_bf16);
  }

  // --- Dequantization (IQ3_S: INT24 × BF16_d × (1+2×sub_scale) → FP32) ---

  inline float dequantize(int24 accum, uint16 super_scale_bf16, uint4 sub_scale) {
    int32_t int_scale = 1 + 2 * sub_scale.to_int();
    int32_t scaled = accum.to_int() * int_scale;
    float fp_accum = static_cast<float>(scaled);
    float d = bf16_to_float(super_scale_bf16);
    float result = fp_accum * d;
    // FTZ
    uint32_t bits;
    std::memcpy(&bits, &result, 4);
    if (((bits >> 23) & 0xFF) == 0) {
      bits &= 0x80000000u;
      std::memcpy(&result, &bits, 4);
    }
    return result;
  }

  // --- Residual add ---

  uint16 residual_add(uint16 a_bf16, uint16 b_bf16) { return bf16_add(a_bf16, b_bf16); }
};

}  // namespace opentaalas
