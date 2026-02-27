// test_vl_layer_e2e.cpp — End-to-end transformer layer verification
//
// Runs Verilator RTL and SystemC reference models in lockstep.
// Compares INT24 accumulators exactly, BF16/FP32 within tolerance.
//
// Tasks 2-4: Scaffold with harness, RTL helpers, and GEMV engine.
// Tasks 5-7 will add the actual forward-pass test functions.

#include "Vtransformer_layer_wrapper.h"
#include "weight_generator.h"

// SystemC reference model headers
#include <mac_array.h>
#include <mac_pe.h>
#include <rom_bank.h>
#include <codebook_decoder.h>
#include <dequant.h>
#include <vector_unit.h>
#include <kv_cache.h>
#include <attention_unit.h>
#include <layer_tile.h>
#include <bf16_math.h>
#include <opentaalas/types.h>

#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <functional>
#include <memory>
#include <vector>
#include <verilated.h>

using namespace opentaalas;

static constexpr int TIMEOUT = 20000;

// ---------------------------------------------------------------------------
// Global pass/fail counters
// ---------------------------------------------------------------------------
static int g_pass = 0;
static int g_fail = 0;

// ---------------------------------------------------------------------------
// BF16 helper functions (plain C++ — no ac_int)
// ---------------------------------------------------------------------------
static float bf16f(uint16_t bf) {
  uint32_t bits = (uint32_t)bf << 16;
  float f; std::memcpy(&f, &bits, 4); return f;
}

static uint16_t tobf16(float f) {
  uint32_t bits;
  std::memcpy(&bits, &f, 4);
  return (uint16_t)(bits >> 16);
}

static float bits_to_float(uint32_t bits) {
  float f; std::memcpy(&f, &bits, sizeof(f)); return f;
}

static uint32_t float_to_bits(float f) {
  uint32_t b; std::memcpy(&b, &f, sizeof(b)); return b;
}

static int32_t sext24(uint32_t val) {
  if (val & 0x800000) return (int32_t)(val | 0xFF000000u);
  return (int32_t)val;
}

// ---------------------------------------------------------------------------
// Comparison utilities
// ---------------------------------------------------------------------------
static void stage_result(const char* stage, bool ok) {
  if (ok) {
    ++g_pass;
    std::printf("  [PASS] %s\n", stage);
  } else {
    ++g_fail;
    std::printf("  [FAIL] %s\n", stage);
  }
}

static bool check_exact(const char* label, int32_t rtl, int32_t ref) {
  bool ok = (rtl == ref);
  if (!ok)
    std::printf("    MISMATCH %s: rtl=%d ref=%d\n", label, rtl, ref);
  return ok;
}

static bool check_bf16(const char* label, uint16_t rtl, uint16_t ref,
                        float tol = 0.05f) {
  float rf = bf16f(rtl);
  float rr = bf16f(ref);
  float diff = std::fabs(rf - rr);
  float thresh = std::fabs(rr) * tol + 0.01f;
  bool ok = (diff <= thresh);
  if (!ok)
    std::printf("    MISMATCH %s: rtl=0x%04X(%.4f) ref=0x%04X(%.4f) diff=%.6f\n",
                label, rtl, rf, ref, rr, diff);
  return ok;
}

static bool check_fp32(const char* label, float rtl, float ref,
                        float tol = 0.05f) {
  float diff = std::fabs(rtl - ref);
  float thresh = std::fabs(ref) * tol + 1e-6f;
  bool ok = (diff <= thresh);
  if (!ok)
    std::printf("    MISMATCH %s: rtl=%.6f ref=%.6f diff=%.6f\n",
                label, rtl, ref, diff);
  return ok;
}

// ---------------------------------------------------------------------------
// Minimal inline harness (copied from test_vl_transformer_layer.cpp)
// ---------------------------------------------------------------------------
struct LayerHarness {
  std::unique_ptr<VerilatedContext> ctx;
  std::unique_ptr<Vtransformer_layer_wrapper> dut;
  uint64_t cycle = 0;

  LayerHarness() {
    ctx = std::make_unique<VerilatedContext>();
    ctx->traceEverOn(false);
    dut = std::make_unique<Vtransformer_layer_wrapper>(ctx.get());
    dut->clk = 0;
    dut->rst = 1;
    dut->stall_rate_in = 0;
    dut->stall_rate_valid_in = 0;
    dut->eval();
  }
  ~LayerHarness() { dut->final(); }

  void tick() {
    dut->clk = 1; dut->eval();
    dut->clk = 0; dut->eval();
    ++cycle;
  }
  void tick_n(int n) { for (int i = 0; i < n; ++i) tick(); }

  void reset() {
    dut->rst = 1;
    for (int i = 0; i < 60; ++i) tick();
    dut->rst = 0;
    int waited = 0;
    while (!all_startup_done()) {
      tick();
      if (++waited > TIMEOUT) {
        std::fprintf(stderr, "TIMEOUT: not all sub-modules started\n");
        std::abort();
      }
    }
  }

  bool all_startup_done() {
    return dut->mac_q_rst_and_startup_done_out
        && dut->mac_k_rst_and_startup_done_out
        && dut->mac_v_rst_and_startup_done_out
        && dut->mac_o_rst_and_startup_done_out
        && dut->mac_gate_rst_and_startup_done_out
        && dut->mac_up_rst_and_startup_done_out
        && dut->mac_down_rst_and_startup_done_out
        && dut->vpu_rst_and_startup_done_out
        && dut->kvc_rst_and_startup_done_out
        && dut->attn_rst_and_startup_done_out
        && dut->fsm_rst_and_startup_done_out;
  }

  void wait_ready(const uint8_t& rdy) {
    int w = 0;
    while (!rdy) {
      tick();
      if (++w > TIMEOUT) { std::fputs("TIMEOUT: rdy\n", stderr); std::abort(); }
    }
  }

  template <typename T>
  T read_fifo(uint8_t& rden, const uint8_t& empty, const T& result) {
    int w = 0;
    while (empty) {
      tick();
      if (++w > TIMEOUT) { std::fputs("TIMEOUT: fifo\n", stderr); std::abort(); }
    }
    T val = result;
    rden = 1; tick(); rden = 0;
    return val;
  }

  void drain_fifo(uint8_t& rden, const uint8_t& empty) {
    int w = 0;
    while (empty) {
      tick();
      if (++w > TIMEOUT) { std::fputs("TIMEOUT: drain\n", stderr); std::abort(); }
    }
    rden = 1; tick(); rden = 0;
  }
};

// ===================================================================
// Section 2: RTL helper macros (Task 3)
// ===================================================================

// ---------------------------------------------------------------------------
// DEFINE_MAC_HELPERS — generates per-instance RTL accessor functions
// ---------------------------------------------------------------------------
#define DEFINE_MAC_HELPERS(PREFIX)                                              \
static void PREFIX##_clear_pe(LayerHarness& h, uint8_t pe) {                   \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_clear_pe_rdy_out);                                  \
  d->PREFIX##_clear_pe_pe_id_in = pe;                                          \
  d->PREFIX##_clear_pe_valid_in = 1; h.tick();                                 \
  d->PREFIX##_clear_pe_valid_in = 0;                                           \
  h.drain_fifo(d->PREFIX##_clear_pe_rden_in,                                   \
               d->PREFIX##_clear_pe_empty_out);                                \
}                                                                              \
                                                                               \
static void PREFIX##_clear_all(LayerHarness& h) {                              \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_clear_all_rdy_out);                                 \
  d->PREFIX##_clear_all_valid_in = 1; h.tick();                                \
  d->PREFIX##_clear_all_valid_in = 0;                                          \
  h.drain_fifo(d->PREFIX##_clear_all_rden_in,                                  \
               d->PREFIX##_clear_all_empty_out);                               \
}                                                                              \
                                                                               \
static int32_t PREFIX##_mac_step(LayerHarness& h, uint8_t pe,                  \
    uint8_t mag, uint8_t sign, uint8_t act) {                                  \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_mac_step_rdy_out);                                  \
  d->PREFIX##_mac_step_pe_id_in = pe;                                          \
  d->PREFIX##_mac_step_magnitude_in = mag;                                     \
  d->PREFIX##_mac_step_sign_bit_in = sign;                                     \
  d->PREFIX##_mac_step_activation_in = act;                                    \
  d->PREFIX##_mac_step_valid_in = 1; h.tick();                                 \
  d->PREFIX##_mac_step_valid_in = 0;                                           \
  return sext24(h.read_fifo(d->PREFIX##_mac_step_rden_in,                      \
      d->PREFIX##_mac_step_empty_out, d->PREFIX##_mac_step_result_out));        \
}                                                                              \
                                                                               \
static int32_t PREFIX##_read_accum(LayerHarness& h, uint8_t pe) {              \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_read_accum_rdy_out);                                \
  d->PREFIX##_read_accum_pe_id_in = pe;                                        \
  d->PREFIX##_read_accum_valid_in = 1; h.tick();                               \
  d->PREFIX##_read_accum_valid_in = 0;                                         \
  return sext24(h.read_fifo(d->PREFIX##_read_accum_rden_in,                    \
      d->PREFIX##_read_accum_empty_out, d->PREFIX##_read_accum_result_out));    \
}                                                                              \
                                                                               \
static void PREFIX##_set_fp32(LayerHarness& h, uint8_t pe, float val) {        \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_set_fp32_accum_rdy_out);                            \
  d->PREFIX##_set_fp32_accum_pe_id_in = pe;                                    \
  d->PREFIX##_set_fp32_accum_value_in = float_to_bits(val);                    \
  d->PREFIX##_set_fp32_accum_valid_in = 1; h.tick();                           \
  d->PREFIX##_set_fp32_accum_valid_in = 0;                                     \
  h.drain_fifo(d->PREFIX##_set_fp32_accum_rden_in,                             \
               d->PREFIX##_set_fp32_accum_empty_out);                          \
}                                                                              \
                                                                               \
static float PREFIX##_read_fp32(LayerHarness& h, uint8_t pe) {                 \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_read_fp32_accum_rdy_out);                           \
  d->PREFIX##_read_fp32_accum_pe_id_in = pe;                                   \
  d->PREFIX##_read_fp32_accum_valid_in = 1; h.tick();                          \
  d->PREFIX##_read_fp32_accum_valid_in = 0;                                    \
  return bits_to_float(h.read_fifo(d->PREFIX##_read_fp32_accum_rden_in,        \
      d->PREFIX##_read_fp32_accum_empty_out,                                   \
      d->PREFIX##_read_fp32_accum_result_out));                                \
}                                                                              \
                                                                               \
static void PREFIX##_write_grid_entry(LayerHarness& h, uint16_t index,         \
                                       uint32_t value) {                       \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_write_grid_entry_rdy_out);                          \
  d->PREFIX##_write_grid_entry_index_in = index;                               \
  d->PREFIX##_write_grid_entry_value_in = value;                               \
  d->PREFIX##_write_grid_entry_valid_in = 1; h.tick();                         \
  d->PREFIX##_write_grid_entry_valid_in = 0;                                   \
  h.drain_fifo(d->PREFIX##_write_grid_entry_rden_in,                           \
               d->PREFIX##_write_grid_entry_empty_out);                        \
}                                                                              \
                                                                               \
static void PREFIX##_write_rom_byte(LayerHarness& h, uint16_t block_addr,      \
                                     uint8_t byte_off, uint8_t value) {        \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_write_rom_byte_rdy_out);                            \
  d->PREFIX##_write_rom_byte_block_addr_in = block_addr;                       \
  d->PREFIX##_write_rom_byte_byte_offset_in = byte_off;                        \
  d->PREFIX##_write_rom_byte_value_in = value;                                 \
  d->PREFIX##_write_rom_byte_valid_in = 1; h.tick();                           \
  d->PREFIX##_write_rom_byte_valid_in = 0;                                     \
  h.drain_fifo(d->PREFIX##_write_rom_byte_rden_in,                             \
               d->PREFIX##_write_rom_byte_empty_out);                          \
}                                                                              \
                                                                               \
static uint16_t PREFIX##_read_scale(LayerHarness& h, uint16_t ba) {            \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_get_super_scale_rdy_out);                           \
  d->PREFIX##_get_super_scale_block_addr_in = ba;                              \
  d->PREFIX##_get_super_scale_valid_in = 1; h.tick();                          \
  d->PREFIX##_get_super_scale_valid_in = 0;                                    \
  return h.read_fifo(d->PREFIX##_get_super_scale_rden_in,                      \
      d->PREFIX##_get_super_scale_empty_out,                                   \
      d->PREFIX##_get_super_scale_result_out);                                 \
}                                                                              \
                                                                               \
static uint16_t PREFIX##_get_codebook_index(LayerHarness& h,                   \
    uint16_t ba, uint8_t gib) {                                                \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_get_codebook_index_rdy_out);                        \
  d->PREFIX##_get_codebook_index_block_addr_in = ba;                           \
  d->PREFIX##_get_codebook_index_group_in_block_in = gib;                      \
  d->PREFIX##_get_codebook_index_valid_in = 1; h.tick();                       \
  d->PREFIX##_get_codebook_index_valid_in = 0;                                 \
  return h.read_fifo(d->PREFIX##_get_codebook_index_rden_in,                   \
      d->PREFIX##_get_codebook_index_empty_out,                                \
      d->PREFIX##_get_codebook_index_result_out);                              \
}                                                                              \
                                                                               \
static uint8_t PREFIX##_get_sign(LayerHarness& h,                              \
    uint16_t ba, uint8_t wib) {                                                \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_get_sign_rdy_out);                                  \
  d->PREFIX##_get_sign_block_addr_in = ba;                                     \
  d->PREFIX##_get_sign_weight_in_block_in = wib;                               \
  d->PREFIX##_get_sign_valid_in = 1; h.tick();                                 \
  d->PREFIX##_get_sign_valid_in = 0;                                           \
  return h.read_fifo(d->PREFIX##_get_sign_rden_in,                             \
      d->PREFIX##_get_sign_empty_out, d->PREFIX##_get_sign_result_out);        \
}                                                                              \
                                                                               \
static uint8_t PREFIX##_get_sub_scale(LayerHarness& h,                         \
    uint16_t ba, uint8_t sbi) {                                                \
  auto* d = h.dut.get();                                                       \
  h.wait_ready(d->PREFIX##_get_sub_scale_rdy_out);                             \
  d->PREFIX##_get_sub_scale_block_addr_in = ba;                                \
  d->PREFIX##_get_sub_scale_sub_block_idx_in = sbi;                            \
  d->PREFIX##_get_sub_scale_valid_in = 1; h.tick();                            \
  d->PREFIX##_get_sub_scale_valid_in = 0;                                      \
  return h.read_fifo(d->PREFIX##_get_sub_scale_rden_in,                        \
      d->PREFIX##_get_sub_scale_empty_out,                                     \
      d->PREFIX##_get_sub_scale_result_out);                                   \
}                                                                              \
                                                                               \
static uint8_t PREFIX##_decode(LayerHarness& h, uint16_t idx, int which) {     \
  auto* d = h.dut.get();                                                       \
  uint8_t result = 0;                                                          \
  if (which == 0) {                                                            \
    h.wait_ready(d->PREFIX##_decode_m0_rdy_out);                               \
    d->PREFIX##_decode_m0_index_in = idx;                                      \
    d->PREFIX##_decode_m0_valid_in = 1; h.tick();                              \
    d->PREFIX##_decode_m0_valid_in = 0;                                        \
    result = h.read_fifo(d->PREFIX##_decode_m0_rden_in,                        \
        d->PREFIX##_decode_m0_empty_out, d->PREFIX##_decode_m0_result_out);    \
  } else if (which == 1) {                                                     \
    h.wait_ready(d->PREFIX##_decode_m1_rdy_out);                               \
    d->PREFIX##_decode_m1_index_in = idx;                                      \
    d->PREFIX##_decode_m1_valid_in = 1; h.tick();                              \
    d->PREFIX##_decode_m1_valid_in = 0;                                        \
    result = h.read_fifo(d->PREFIX##_decode_m1_rden_in,                        \
        d->PREFIX##_decode_m1_empty_out, d->PREFIX##_decode_m1_result_out);    \
  } else if (which == 2) {                                                     \
    h.wait_ready(d->PREFIX##_decode_m2_rdy_out);                               \
    d->PREFIX##_decode_m2_index_in = idx;                                      \
    d->PREFIX##_decode_m2_valid_in = 1; h.tick();                              \
    d->PREFIX##_decode_m2_valid_in = 0;                                        \
    result = h.read_fifo(d->PREFIX##_decode_m2_rden_in,                        \
        d->PREFIX##_decode_m2_empty_out, d->PREFIX##_decode_m2_result_out);    \
  } else {                                                                     \
    h.wait_ready(d->PREFIX##_decode_m3_rdy_out);                               \
    d->PREFIX##_decode_m3_index_in = idx;                                      \
    d->PREFIX##_decode_m3_valid_in = 1; h.tick();                              \
    d->PREFIX##_decode_m3_valid_in = 0;                                        \
    result = h.read_fifo(d->PREFIX##_decode_m3_rden_in,                        \
        d->PREFIX##_decode_m3_empty_out, d->PREFIX##_decode_m3_result_out);    \
  }                                                                            \
  return result;                                                               \
}

// Instantiate MAC helpers for all 7 arrays
DEFINE_MAC_HELPERS(mac_q)
DEFINE_MAC_HELPERS(mac_k)
DEFINE_MAC_HELPERS(mac_v)
DEFINE_MAC_HELPERS(mac_o)
DEFINE_MAC_HELPERS(mac_gate)
DEFINE_MAC_HELPERS(mac_up)
DEFINE_MAC_HELPERS(mac_down)

// ---------------------------------------------------------------------------
// VPU helpers
// ---------------------------------------------------------------------------
static void vpu_rmsnorm_reset(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rmsnorm_reset_rdy_out);
  d->vpu_rmsnorm_reset_valid_in = 1; h.tick();
  d->vpu_rmsnorm_reset_valid_in = 0;
  h.drain_fifo(d->vpu_rmsnorm_reset_rden_in, d->vpu_rmsnorm_reset_empty_out);
}

static void vpu_rmsnorm_accumulate(LayerHarness& h, uint16_t x_bf16) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rmsnorm_accumulate_rdy_out);
  d->vpu_rmsnorm_accumulate_x_bf16_in = x_bf16;
  d->vpu_rmsnorm_accumulate_valid_in = 1; h.tick();
  d->vpu_rmsnorm_accumulate_valid_in = 0;
  h.drain_fifo(d->vpu_rmsnorm_accumulate_rden_in, d->vpu_rmsnorm_accumulate_empty_out);
}

static uint32_t vpu_rmsnorm_get_sum(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rmsnorm_get_sum_rdy_out);
  d->vpu_rmsnorm_get_sum_valid_in = 1; h.tick();
  d->vpu_rmsnorm_get_sum_valid_in = 0;
  return h.read_fifo(d->vpu_rmsnorm_get_sum_rden_in,
      d->vpu_rmsnorm_get_sum_empty_out, d->vpu_rmsnorm_get_sum_result_out);
}

static void vpu_set_gamma_pre_attn(LayerHarness& h, uint16_t idx, uint16_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_set_gamma_pre_attn_rdy_out);
  d->vpu_set_gamma_pre_attn_index_in = idx;
  d->vpu_set_gamma_pre_attn_value_in = val;
  d->vpu_set_gamma_pre_attn_valid_in = 1; h.tick();
  d->vpu_set_gamma_pre_attn_valid_in = 0;
  h.drain_fifo(d->vpu_set_gamma_pre_attn_rden_in, d->vpu_set_gamma_pre_attn_empty_out);
}

static uint16_t vpu_get_gamma_pre_attn(LayerHarness& h, uint16_t idx) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_get_gamma_pre_attn_rdy_out);
  d->vpu_get_gamma_pre_attn_index_in = idx;
  d->vpu_get_gamma_pre_attn_valid_in = 1; h.tick();
  d->vpu_get_gamma_pre_attn_valid_in = 0;
  return h.read_fifo(d->vpu_get_gamma_pre_attn_rden_in,
      d->vpu_get_gamma_pre_attn_empty_out, d->vpu_get_gamma_pre_attn_result_out);
}

static void vpu_set_gamma_pre_mlp(LayerHarness& h, uint16_t idx, uint16_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_set_gamma_pre_mlp_rdy_out);
  d->vpu_set_gamma_pre_mlp_index_in = idx;
  d->vpu_set_gamma_pre_mlp_value_in = val;
  d->vpu_set_gamma_pre_mlp_valid_in = 1; h.tick();
  d->vpu_set_gamma_pre_mlp_valid_in = 0;
  h.drain_fifo(d->vpu_set_gamma_pre_mlp_rden_in, d->vpu_set_gamma_pre_mlp_empty_out);
}

static void vpu_set_rsqrt_lut(LayerHarness& h, uint8_t idx, uint16_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_set_rsqrt_lut_rdy_out);
  d->vpu_set_rsqrt_lut_index_in = idx;
  d->vpu_set_rsqrt_lut_value_in = val;
  d->vpu_set_rsqrt_lut_valid_in = 1; h.tick();
  d->vpu_set_rsqrt_lut_valid_in = 0;
  h.drain_fifo(d->vpu_set_rsqrt_lut_rden_in, d->vpu_set_rsqrt_lut_empty_out);
}

static uint16_t vpu_lookup_rsqrt(LayerHarness& h, uint8_t idx) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_lookup_rsqrt_rdy_out);
  d->vpu_lookup_rsqrt_index_in = idx;
  d->vpu_lookup_rsqrt_valid_in = 1; h.tick();
  d->vpu_lookup_rsqrt_valid_in = 0;
  return h.read_fifo(d->vpu_lookup_rsqrt_rden_in,
      d->vpu_lookup_rsqrt_empty_out, d->vpu_lookup_rsqrt_result_out);
}

static void vpu_set_sigmoid_lut(LayerHarness& h, uint8_t idx, uint16_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_set_sigmoid_lut_rdy_out);
  d->vpu_set_sigmoid_lut_index_in = idx;
  d->vpu_set_sigmoid_lut_value_in = val;
  d->vpu_set_sigmoid_lut_valid_in = 1; h.tick();
  d->vpu_set_sigmoid_lut_valid_in = 0;
  h.drain_fifo(d->vpu_set_sigmoid_lut_rden_in, d->vpu_set_sigmoid_lut_empty_out);
}

static uint16_t vpu_swiglu_compute(LayerHarness& h, uint16_t gate, uint16_t up) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_swiglu_compute_rdy_out);
  d->vpu_swiglu_compute_gate_bf16_in = gate;
  d->vpu_swiglu_compute_up_bf16_in = up;
  d->vpu_swiglu_compute_valid_in = 1; h.tick();
  d->vpu_swiglu_compute_valid_in = 0;
  return h.read_fifo(d->vpu_swiglu_compute_rden_in,
      d->vpu_swiglu_compute_empty_out, d->vpu_swiglu_compute_result_out);
}

static void vpu_rope_set_cos(LayerHarness& h, uint16_t pos, uint8_t freq, uint16_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rope_set_cos_rdy_out);
  d->vpu_rope_set_cos_position_in = pos;
  d->vpu_rope_set_cos_freq_idx_in = freq;
  d->vpu_rope_set_cos_value_in = val;
  d->vpu_rope_set_cos_valid_in = 1; h.tick();
  d->vpu_rope_set_cos_valid_in = 0;
  h.drain_fifo(d->vpu_rope_set_cos_rden_in, d->vpu_rope_set_cos_empty_out);
}

static void vpu_rope_set_sin(LayerHarness& h, uint16_t pos, uint8_t freq, uint16_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rope_set_sin_rdy_out);
  d->vpu_rope_set_sin_position_in = pos;
  d->vpu_rope_set_sin_freq_idx_in = freq;
  d->vpu_rope_set_sin_value_in = val;
  d->vpu_rope_set_sin_valid_in = 1; h.tick();
  d->vpu_rope_set_sin_valid_in = 0;
  h.drain_fifo(d->vpu_rope_set_sin_rden_in, d->vpu_rope_set_sin_empty_out);
}

static uint16_t vpu_rope_get_cos(LayerHarness& h, uint16_t pos, uint8_t freq) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rope_get_cos_rdy_out);
  d->vpu_rope_get_cos_position_in = pos;
  d->vpu_rope_get_cos_freq_idx_in = freq;
  d->vpu_rope_get_cos_valid_in = 1; h.tick();
  d->vpu_rope_get_cos_valid_in = 0;
  return h.read_fifo(d->vpu_rope_get_cos_rden_in,
      d->vpu_rope_get_cos_empty_out, d->vpu_rope_get_cos_result_out);
}

static uint16_t vpu_rope_get_sin(LayerHarness& h, uint16_t pos, uint8_t freq) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_rope_get_sin_rdy_out);
  d->vpu_rope_get_sin_position_in = pos;
  d->vpu_rope_get_sin_freq_idx_in = freq;
  d->vpu_rope_get_sin_valid_in = 1; h.tick();
  d->vpu_rope_get_sin_valid_in = 0;
  return h.read_fifo(d->vpu_rope_get_sin_rden_in,
      d->vpu_rope_get_sin_empty_out, d->vpu_rope_get_sin_result_out);
}

static uint16_t vpu_dequantize(LayerHarness& h, uint32_t accum,
                                uint8_t bank_scale, uint32_t tensor_scale) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_dequantize_rdy_out);
  d->vpu_dequantize_accum_in = accum;
  d->vpu_dequantize_bank_scale_in = bank_scale;
  d->vpu_dequantize_tensor_scale_in = tensor_scale;
  d->vpu_dequantize_valid_in = 1; h.tick();
  d->vpu_dequantize_valid_in = 0;
  return h.read_fifo(d->vpu_dequantize_rden_in,
      d->vpu_dequantize_empty_out, d->vpu_dequantize_result_out);
}

static uint16_t vpu_residual_add(LayerHarness& h, uint16_t a, uint16_t b) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_residual_add_rdy_out);
  d->vpu_residual_add_a_bf16_in = a;
  d->vpu_residual_add_b_bf16_in = b;
  d->vpu_residual_add_valid_in = 1; h.tick();
  d->vpu_residual_add_valid_in = 0;
  return h.read_fifo(d->vpu_residual_add_rden_in,
      d->vpu_residual_add_empty_out, d->vpu_residual_add_result_out);
}

// ---------------------------------------------------------------------------
// KV cache helpers
// ---------------------------------------------------------------------------
static void kvc_append_k(LayerHarness& h, uint16_t pos, uint8_t head,
                          uint8_t dim, uint8_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->kvc_append_k_rdy_out);
  d->kvc_append_k_token_pos_in = pos; d->kvc_append_k_head_id_in = head;
  d->kvc_append_k_dim_idx_in = dim; d->kvc_append_k_value_in = val;
  d->kvc_append_k_valid_in = 1; h.tick(); d->kvc_append_k_valid_in = 0;
  h.drain_fifo(d->kvc_append_k_rden_in, d->kvc_append_k_empty_out);
}

static void kvc_append_v(LayerHarness& h, uint16_t pos, uint8_t head,
                          uint8_t dim, uint8_t val) {
  auto* d = h.dut.get();
  h.wait_ready(d->kvc_append_v_rdy_out);
  d->kvc_append_v_token_pos_in = pos; d->kvc_append_v_head_id_in = head;
  d->kvc_append_v_dim_idx_in = dim; d->kvc_append_v_value_in = val;
  d->kvc_append_v_valid_in = 1; h.tick(); d->kvc_append_v_valid_in = 0;
  h.drain_fifo(d->kvc_append_v_rden_in, d->kvc_append_v_empty_out);
}

static uint8_t kvc_read_k(LayerHarness& h, uint16_t pos, uint8_t head, uint8_t dim) {
  auto* d = h.dut.get();
  h.wait_ready(d->kvc_read_k_rdy_out);
  d->kvc_read_k_token_pos_in = pos; d->kvc_read_k_head_id_in = head;
  d->kvc_read_k_dim_idx_in = dim;
  d->kvc_read_k_valid_in = 1; h.tick(); d->kvc_read_k_valid_in = 0;
  return h.read_fifo(d->kvc_read_k_rden_in, d->kvc_read_k_empty_out,
                     d->kvc_read_k_result_out);
}

static uint8_t kvc_read_v(LayerHarness& h, uint16_t pos, uint8_t head, uint8_t dim) {
  auto* d = h.dut.get();
  h.wait_ready(d->kvc_read_v_rdy_out);
  d->kvc_read_v_token_pos_in = pos; d->kvc_read_v_head_id_in = head;
  d->kvc_read_v_dim_idx_in = dim;
  d->kvc_read_v_valid_in = 1; h.tick(); d->kvc_read_v_valid_in = 0;
  return h.read_fifo(d->kvc_read_v_rden_in, d->kvc_read_v_empty_out,
                     d->kvc_read_v_result_out);
}

// ---------------------------------------------------------------------------
// Attention helpers
// ---------------------------------------------------------------------------
static int32_t attn_dot_product(LayerHarness& h, uint8_t q, uint8_t k) {
  auto* d = h.dut.get();
  h.wait_ready(d->attn_dot_product_rdy_out);
  d->attn_dot_product_q_elem_in = q; d->attn_dot_product_k_elem_in = k;
  d->attn_dot_product_valid_in = 1; h.tick(); d->attn_dot_product_valid_in = 0;
  return (int32_t)h.read_fifo(d->attn_dot_product_rden_in,
      d->attn_dot_product_empty_out, d->attn_dot_product_result_out);
}

static int32_t attn_read_score(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->attn_read_score_rdy_out);
  d->attn_read_score_valid_in = 1; h.tick(); d->attn_read_score_valid_in = 0;
  return (int32_t)h.read_fifo(d->attn_read_score_rden_in,
      d->attn_read_score_empty_out, d->attn_read_score_result_out);
}

static void attn_clear_score(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->attn_clear_score_rdy_out);
  d->attn_clear_score_valid_in = 1; h.tick(); d->attn_clear_score_valid_in = 0;
  h.drain_fifo(d->attn_clear_score_rden_in, d->attn_clear_score_empty_out);
}

// ---------------------------------------------------------------------------
// FSM helpers
// ---------------------------------------------------------------------------
static uint8_t fsm_get_state(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->fsm_get_state_rdy_out);
  d->fsm_get_state_valid_in = 1; h.tick(); d->fsm_get_state_valid_in = 0;
  return h.read_fifo(d->fsm_get_state_rden_in,
      d->fsm_get_state_empty_out, d->fsm_get_state_result_out);
}

static void fsm_advance_state(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->fsm_advance_state_rdy_out);
  d->fsm_advance_state_valid_in = 1; h.tick(); d->fsm_advance_state_valid_in = 0;
  h.drain_fifo(d->fsm_advance_state_rden_in, d->fsm_advance_state_empty_out);
}

static void fsm_reset_state(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->fsm_reset_state_rdy_out);
  d->fsm_reset_state_valid_in = 1; h.tick(); d->fsm_reset_state_valid_in = 0;
  h.drain_fifo(d->fsm_reset_state_rden_in, d->fsm_reset_state_empty_out);
}

// ===================================================================
// Section 3: GEMV engine (Task 4)
// ===================================================================

// ---------------------------------------------------------------------------
// MacFns — function-pointer table for generic MAC dispatch
// ---------------------------------------------------------------------------
struct MacFns {
  void (*clear_all)(LayerHarness&);
  int32_t (*mac_step)(LayerHarness&, uint8_t pe, uint8_t mag, uint8_t sign, uint8_t act);
  int32_t (*read_accum)(LayerHarness&, uint8_t pe);
  void (*set_fp32)(LayerHarness&, uint8_t pe, float val);
  float (*read_fp32)(LayerHarness&, uint8_t pe);
  void (*write_grid_entry)(LayerHarness&, uint16_t index, uint32_t value);
  void (*write_rom_byte)(LayerHarness&, uint16_t block_addr, uint8_t byte_off, uint8_t value);
  uint16_t (*read_scale)(LayerHarness&, uint16_t ba);
  uint16_t (*get_codebook_index)(LayerHarness&, uint16_t ba, uint8_t gib);
  uint8_t (*get_sign)(LayerHarness&, uint16_t ba, uint8_t wib);
  uint8_t (*get_sub_scale)(LayerHarness&, uint16_t ba, uint8_t sbi);
  uint8_t (*decode)(LayerHarness&, uint16_t idx, int which);
};

// Static MacFns instances for all 7 arrays
static const MacFns mac_q_fns = {
  mac_q_clear_all, mac_q_mac_step, mac_q_read_accum,
  mac_q_set_fp32, mac_q_read_fp32, mac_q_write_grid_entry,
  mac_q_write_rom_byte, mac_q_read_scale, mac_q_get_codebook_index,
  mac_q_get_sign, mac_q_get_sub_scale, mac_q_decode
};
static const MacFns mac_k_fns = {
  mac_k_clear_all, mac_k_mac_step, mac_k_read_accum,
  mac_k_set_fp32, mac_k_read_fp32, mac_k_write_grid_entry,
  mac_k_write_rom_byte, mac_k_read_scale, mac_k_get_codebook_index,
  mac_k_get_sign, mac_k_get_sub_scale, mac_k_decode
};
static const MacFns mac_v_fns = {
  mac_v_clear_all, mac_v_mac_step, mac_v_read_accum,
  mac_v_set_fp32, mac_v_read_fp32, mac_v_write_grid_entry,
  mac_v_write_rom_byte, mac_v_read_scale, mac_v_get_codebook_index,
  mac_v_get_sign, mac_v_get_sub_scale, mac_v_decode
};
static const MacFns mac_o_fns = {
  mac_o_clear_all, mac_o_mac_step, mac_o_read_accum,
  mac_o_set_fp32, mac_o_read_fp32, mac_o_write_grid_entry,
  mac_o_write_rom_byte, mac_o_read_scale, mac_o_get_codebook_index,
  mac_o_get_sign, mac_o_get_sub_scale, mac_o_decode
};
static const MacFns mac_gate_fns = {
  mac_gate_clear_all, mac_gate_mac_step, mac_gate_read_accum,
  mac_gate_set_fp32, mac_gate_read_fp32, mac_gate_write_grid_entry,
  mac_gate_write_rom_byte, mac_gate_read_scale, mac_gate_get_codebook_index,
  mac_gate_get_sign, mac_gate_get_sub_scale, mac_gate_decode
};
static const MacFns mac_up_fns = {
  mac_up_clear_all, mac_up_mac_step, mac_up_read_accum,
  mac_up_set_fp32, mac_up_read_fp32, mac_up_write_grid_entry,
  mac_up_write_rom_byte, mac_up_read_scale, mac_up_get_codebook_index,
  mac_up_get_sign, mac_up_get_sub_scale, mac_up_decode
};
static const MacFns mac_down_fns = {
  mac_down_clear_all, mac_down_mac_step, mac_down_read_accum,
  mac_down_set_fp32, mac_down_read_fp32, mac_down_write_grid_entry,
  mac_down_write_rom_byte, mac_down_read_scale, mac_down_get_codebook_index,
  mac_down_get_sign, mac_down_get_sub_scale, mac_down_decode
};

// ---------------------------------------------------------------------------
// parse_iq3s_block — extract IQ3SBlock from flat ROM byte array
// ---------------------------------------------------------------------------
static IQ3SBlock parse_iq3s_block(const std::vector<uint8_t>& rom, int block_addr) {
  IQ3SBlock blk;
  const uint8_t* p = rom.data() + block_addr * BLOCK_BYTES;
  // d_bf16 (2 bytes, little-endian)
  blk.d_bf16 = (uint16_t)p[0] | ((uint16_t)p[1] << 8);
  // qs (64 bytes)
  std::memcpy(blk.qs, p + 2, 64);
  // qh (8 bytes)
  std::memcpy(blk.qh, p + 66, 8);
  // signs (32 bytes)
  std::memcpy(blk.signs, p + 74, 32);
  // scales (4 bytes)
  std::memcpy(blk.scales, p + 106, 4);
  return blk;
}

// ---------------------------------------------------------------------------
// program_mac — programs codebook + ROM into RTL, IQ3SBlocks into SystemC
// ---------------------------------------------------------------------------
static void program_mac(LayerHarness& h, const MacFns& fns,
                         MacArray& ref,
                         const std::vector<uint8_t>& rom,
                         const std::vector<uint32_t>& grid) {
  // Program codebook into RTL (512 entries)
  for (int i = 0; i < (int)grid.size(); i++)
    fns.write_grid_entry(h, (uint16_t)i, grid[i]);

  // Program ROM bytes into RTL and parse IQ3SBlocks into SystemC
  int num_blocks = (int)rom.size() / BLOCK_BYTES;
  for (int b = 0; b < num_blocks; b++) {
    // RTL: byte-by-byte
    for (int off = 0; off < BLOCK_BYTES; off++)
      fns.write_rom_byte(h, (uint16_t)b, (uint8_t)off,
                         rom[b * BLOCK_BYTES + off]);
    // SystemC: parse and write block
    IQ3SBlock blk = parse_iq3s_block(rom, b);
    ref.write_block(b, blk);
  }
}

// ---------------------------------------------------------------------------
// run_gemv — drives RTL + SystemC in lockstep for one PE, compares accumulators
//
// Processes `num_weights` weights starting from block 0.
// activations[i] is the INT8 activation for weight i.
// Returns true if all INT24 accumulators match exactly.
// ---------------------------------------------------------------------------
static bool run_gemv(LayerHarness& h, const MacFns& fns,
                     MacArray& ref, int pe,
                     int num_weights,
                     const std::vector<int8_t>& activations) {
  // Clear the target PE on both RTL and SystemC
  fns.clear_all(h);
  ref.clear_all();

  int num_blocks = (num_weights + BLOCK_SIZE - 1) / BLOCK_SIZE;
  bool all_ok = true;

  for (int b = 0; b < num_blocks; b++) {
    int weights_in_block = std::min(BLOCK_SIZE, num_weights - b * BLOCK_SIZE);
    int groups_in_block = (weights_in_block + 3) / 4;

    for (int g = 0; g < groups_in_block; g++) {
      // Get 9-bit codebook index from SystemC RomBank (reference)
      uint9 sc_idx = ref.read_block(b).qs[0]; // placeholder — use RomBank directly
      // Actually, we need to use the RTL's get_codebook_index since the
      // SystemC MacArray doesn't expose RomBank::get_codebook_index directly.
      // Instead, decode magnitudes from RTL (which has the programmed codebook).
      uint16_t rtl_idx = fns.get_codebook_index(h, (uint16_t)b, (uint8_t)g);

      // Decode 4 magnitudes from RTL codebook
      uint8_t mags[4];
      for (int w = 0; w < 4; w++)
        mags[w] = fns.decode(h, rtl_idx, w);

      // Process each weight in the group
      int weights_in_group = std::min(4, weights_in_block - g * 4);
      for (int w = 0; w < weights_in_group; w++) {
        int weight_in_block = g * 4 + w;
        int global_weight = b * BLOCK_SIZE + weight_in_block;
        if (global_weight >= num_weights) break;

        // Get sign bit from RTL
        uint8_t sign = fns.get_sign(h, (uint16_t)b, (uint8_t)weight_in_block);

        // Activation for this weight
        uint8_t act = (uint8_t)(int8_t)activations[global_weight];

        // RTL mac_step
        fns.mac_step(h, (uint8_t)pe, mags[w], sign, act);

        // SystemC mac_step
        ref.mac_step(pe, uint4(mags[w]), uint1(sign),
                     int8((::int8_t)activations[global_weight]));
      }
    }

    // Compare INT24 accumulators after each block
    int32_t rtl_acc = fns.read_accum(h, (uint8_t)pe);
    int32_t ref_acc = ref.read_accum(pe).to_int();
    char label[64];
    std::snprintf(label, sizeof(label), "block[%d] PE%d accum", b, pe);
    if (!check_exact(label, rtl_acc, ref_acc))
      all_ok = false;
  }

  return all_ok;
}

// ===================================================================
// Placeholder main (Tasks 5-7 will add test functions)
// ===================================================================
int main() {
  std::puts("test_vl_layer_e2e: scaffold OK");
  return 0;
}
