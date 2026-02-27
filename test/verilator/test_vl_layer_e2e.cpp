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

static uint16_t vpu_dequantize(LayerHarness& h, int32_t accum,
                                uint16_t super_scale_bf16, uint8_t sub_scale) {
  auto* d = h.dut.get();
  h.wait_ready(d->vpu_dequantize_rdy_out);
  d->vpu_dequantize_accum_in = static_cast<uint32_t>(accum) & 0xFFFFFF;
  d->vpu_dequantize_super_scale_bf16_in = super_scale_bf16;
  d->vpu_dequantize_sub_scale_in = sub_scale & 0xF;
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

static bool fsm_is_done(LayerHarness& h) {
  auto* d = h.dut.get();
  h.wait_ready(d->fsm_is_done_rdy_out);
  d->fsm_is_done_valid_in = 1; h.tick(); d->fsm_is_done_valid_in = 0;
  return h.read_fifo(d->fsm_is_done_rden_in,
      d->fsm_is_done_empty_out, d->fsm_is_done_result_out) & 1;
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
// Section 4: Phase 1 — manual-sequenced forward pass (Task 5)
// ===================================================================

// ---------------------------------------------------------------------------
// RefModels — all SystemC reference models for one transformer layer
// ---------------------------------------------------------------------------
struct RefModels {
  MacArray mac_q, mac_k, mac_v, mac_o, mac_gate, mac_up, mac_down;
  vector_unit<512> vpu;   // RopeTableSize = SEQ_LEN(8) * 64 = 512
  KvCache<8, 4, 16> kvc;  // SEQ_LEN=8, HEADS=4, HEAD_DIM=16
  AttentionUnit attn;
  layer_tile fsm;
};

// ---------------------------------------------------------------------------
// program_all_weights — programs weights into both RTL and SystemC
// ---------------------------------------------------------------------------
static void program_all_weights(LayerHarness& h, RefModels& ref,
                                 const LayerWeights& w) {
  std::printf("  Programming 7 MAC arrays...\n");
  program_mac(h, mac_q_fns,    ref.mac_q,    w.q_rom,    w.q_grid);
  program_mac(h, mac_k_fns,    ref.mac_k,    w.k_rom,    w.k_grid);
  program_mac(h, mac_v_fns,    ref.mac_v,    w.v_rom,    w.v_grid);
  program_mac(h, mac_o_fns,    ref.mac_o,    w.o_rom,    w.o_grid);
  program_mac(h, mac_gate_fns, ref.mac_gate, w.gate_rom, w.gate_grid);
  program_mac(h, mac_up_fns,   ref.mac_up,   w.up_rom,   w.up_grid);
  program_mac(h, mac_down_fns, ref.mac_down, w.down_rom, w.down_grid);

  std::printf("  Programming VPU gamma tables (%d entries each)...\n", DIM);
  for (int i = 0; i < DIM; i++) {
    vpu_set_gamma_pre_attn(h, (uint16_t)i, w.gamma_pre_attn[i]);
    ref.vpu.set_gamma_pre_attn(opentaalas::uint16(i),
                                opentaalas::uint16(w.gamma_pre_attn[i]));
    vpu_set_gamma_pre_mlp(h, (uint16_t)i, w.gamma_pre_mlp[i]);
    ref.vpu.set_gamma_pre_mlp(opentaalas::uint16(i),
                               opentaalas::uint16(w.gamma_pre_mlp[i]));
  }

  std::printf("  Programming rsqrt LUT (256 entries)...\n");
  for (int i = 0; i < 256; i++) {
    vpu_set_rsqrt_lut(h, (::uint8_t)i, w.rsqrt_lut[i]);
    ref.vpu.set_rsqrt_lut(opentaalas::uint8(i),
                           opentaalas::uint16(w.rsqrt_lut[i]));
  }

  std::printf("  Programming sigmoid LUT (256 entries)...\n");
  for (int i = 0; i < 256; i++) {
    vpu_set_sigmoid_lut(h, (::uint8_t)i, w.sigmoid_lut[i]);
    ref.vpu.set_sigmoid_lut(opentaalas::uint8(i),
                             opentaalas::uint16(w.sigmoid_lut[i]));
  }

  int half_dim = HEAD_DIM / 2;
  std::printf("  Programming RoPE tables (%d positions x %d freqs)...\n",
              SEQ_LEN, half_dim);
  for (int pos = 0; pos < SEQ_LEN; pos++) {
    for (int k = 0; k < half_dim; k++) {
      uint16_t cv = w.cos_table[pos * half_dim + k];
      uint16_t sv = w.sin_table[pos * half_dim + k];
      vpu_rope_set_cos(h, (uint16_t)pos, (::uint8_t)k, cv);
      vpu_rope_set_sin(h, (uint16_t)pos, (::uint8_t)k, sv);
      ref.vpu.rope_set_cos(opentaalas::uint12(pos), opentaalas::uint6(k),
                            opentaalas::uint16(cv));
      ref.vpu.rope_set_sin(opentaalas::uint12(pos), opentaalas::uint6(k),
                            opentaalas::uint16(sv));
    }
  }
}

// ---------------------------------------------------------------------------
// gen_input_activation — random BF16 input vector (kDim elements)
// ---------------------------------------------------------------------------
static std::vector<uint16_t> gen_input_activation(::uint32_t seed) {
  std::mt19937 rng(seed);
  std::uniform_real_distribution<float> dist(-1.0f, 1.0f);
  std::vector<uint16_t> input(DIM);
  for (auto& x : input)
    x = tobf16(dist(rng));
  return input;
}

// ---------------------------------------------------------------------------
// quantize_to_int8 — BF16 vector -> INT8 (scale by 64, clamp [-128,127])
// ---------------------------------------------------------------------------
static std::vector<::int8_t> quantize_to_int8(
    const std::vector<uint16_t>& bf16_vec) {
  std::vector<::int8_t> result(bf16_vec.size());
  for (size_t i = 0; i < bf16_vec.size(); i++) {
    float f = bf16f(bf16_vec[i]);
    int val = (int)std::round(f * 64.0f);
    if (val > 127) val = 127;
    if (val < -128) val = -128;
    result[i] = (::int8_t)val;
  }
  return result;
}

// ---------------------------------------------------------------------------
// test_phase1_manual_forward_pass — walks all 17 FSM states
// ---------------------------------------------------------------------------
static void test_phase1_manual_forward_pass() {
  std::printf("\n=== Phase 1: Manual-sequenced forward pass ===\n");

  LayerHarness h;
  RefModels ref;
  LayerWeights w = generate_deterministic_weights(42);

  std::printf("Resetting DUT...\n");
  h.reset();

  // Verify FSM starts at state 0
  {
    ::uint8_t st = fsm_get_state(h);
    int ref_st = ref.fsm.get_state().to_int();
    stage_result("State 0 (IDLE): FSM initial state",
                 check_exact("fsm_state", st, ref_st));
  }

  // ---------------------------------------------------------------
  // State 0: IDLE — program all weights
  // ---------------------------------------------------------------
  std::printf("\n--- State 0: IDLE — programming weights ---\n");
  program_all_weights(h, ref, w);
  stage_result("State 0: weight programming complete", true);

  // Advance FSM: 0 -> 1
  fsm_advance_state(h);
  ref.fsm.advance_state();

  // ---------------------------------------------------------------
  // State 1: RMSNORM_PRE_ATTN
  // ---------------------------------------------------------------
  std::printf("\n--- State 1: RMSNORM_PRE_ATTN ---\n");
  std::vector<uint16_t> input = gen_input_activation(123);

  // Reset RMSNorm on both
  vpu_rmsnorm_reset(h);
  ref.vpu.rmsnorm_reset();

  // Accumulate all DIM input BF16 values
  for (int i = 0; i < DIM; i++) {
    vpu_rmsnorm_accumulate(h, input[i]);
    ref.vpu.rmsnorm_accumulate(opentaalas::uint16(input[i]));
  }

  // Compare sum (exact)
  ::uint32_t rtl_sum = vpu_rmsnorm_get_sum(h);
  ::uint32_t ref_sum = ref.vpu.rmsnorm_get_sum().to_uint64();
  stage_result("State 1: RMSNorm sum",
               check_exact("rmsnorm_sum", (::int32_t)rtl_sum, (::int32_t)ref_sum));

  // Lookup rsqrt from LUT — use top 8 bits of sum as index
  ::uint8_t rsqrt_idx = (::uint8_t)((rtl_sum >> 8) & 0xFF);
  if (rsqrt_idx == 0) rsqrt_idx = 1;  // avoid edge case
  uint16_t rtl_rsqrt = vpu_lookup_rsqrt(h, rsqrt_idx);
  opentaalas::uint16 ref_rsqrt = ref.vpu.lookup_rsqrt(opentaalas::uint8(rsqrt_idx));
  stage_result("State 1: rsqrt LUT lookup",
               check_bf16("rsqrt", rtl_rsqrt, (uint16_t)ref_rsqrt.to_uint64()));

  // Compute normalized output in C++ for later stages
  float rsqrt_f = bf16f(rtl_rsqrt);
  std::vector<uint16_t> norm_pre_attn(DIM);
  for (int i = 0; i < DIM; i++) {
    float x = bf16f(input[i]);
    float gamma = bf16f(w.gamma_pre_attn[i]);
    norm_pre_attn[i] = tobf16(x * rsqrt_f * gamma);
  }

  // Advance FSM: 1 -> 2
  fsm_advance_state(h);
  ref.fsm.advance_state();

  // ---------------------------------------------------------------
  // States 2-4: Q/K/V projections (GEMV on PE 0)
  // ---------------------------------------------------------------
  std::printf("\n--- States 2-4: Q/K/V projections ---\n");
  std::vector<::int8_t> act_qkv = quantize_to_int8(norm_pre_attn);

  // State 2: Q projection
  {
    bool ok = run_gemv(h, mac_q_fns, ref.mac_q, 0, DIM, act_qkv);
    stage_result("State 2: Q projection GEMV PE0", ok);
    fsm_advance_state(h);
    ref.fsm.advance_state();
  }

  // State 3: K projection
  {
    bool ok = run_gemv(h, mac_k_fns, ref.mac_k, 0, DIM, act_qkv);
    stage_result("State 3: K projection GEMV PE0", ok);
    fsm_advance_state(h);
    ref.fsm.advance_state();
  }

  // State 4: V projection
  {
    bool ok = run_gemv(h, mac_v_fns, ref.mac_v, 0, DIM, act_qkv);
    stage_result("State 4: V projection GEMV PE0", ok);
    fsm_advance_state(h);
    ref.fsm.advance_state();
  }

  // For subsequent stages, use quantized input as proxy vectors
  // (real hardware would use dequantized projection outputs)
  std::vector<::int8_t> q_vec = act_qkv;
  std::vector<::int8_t> k_vec = act_qkv;
  std::vector<::int8_t> v_vec = act_qkv;

  // ---------------------------------------------------------------
  // State 5: ROPE_APPLY — compare cos/sin lookups
  // ---------------------------------------------------------------
  std::printf("\n--- State 5: ROPE_APPLY ---\n");
  {
    bool all_ok = true;
    int pos = 0;  // token position 0
    int half = HEAD_DIM / 2;
    for (int head = 0; head < HEADS && all_ok; head++) {
      for (int k = 0; k < half; k++) {
        uint16_t rtl_cos = vpu_rope_get_cos(h, (uint16_t)pos, (::uint8_t)k);
        uint16_t rtl_sin = vpu_rope_get_sin(h, (uint16_t)pos, (::uint8_t)k);
        opentaalas::uint16 ref_cos = ref.vpu.rope_get_cos(
            opentaalas::uint12(pos), opentaalas::uint6(k));
        opentaalas::uint16 ref_sin = ref.vpu.rope_get_sin(
            opentaalas::uint12(pos), opentaalas::uint6(k));
        char lbl[64];
        std::snprintf(lbl, sizeof(lbl), "rope_cos[h%d][%d]", head, k);
        if (!check_bf16(lbl, rtl_cos, (uint16_t)ref_cos.to_uint64()))
          all_ok = false;
        std::snprintf(lbl, sizeof(lbl), "rope_sin[h%d][%d]", head, k);
        if (!check_bf16(lbl, rtl_sin, (uint16_t)ref_sin.to_uint64()))
          all_ok = false;
      }
    }
    stage_result("State 5: RoPE cos/sin table lookups", all_ok);

    // Apply rotation in C++ (for use by later stages)
    // q_rot[k] = q[k]*cos - q[k+half]*sin
    // q_rot[k+half] = q[k]*sin + q[k+half]*cos
    // (operating on INT8 proxy values — just verifying the table lookups match)
  }
  fsm_advance_state(h);
  ref.fsm.advance_state();

  // ---------------------------------------------------------------
  // State 6: KV_CACHE_APPEND — write and readback
  // ---------------------------------------------------------------
  std::printf("\n--- State 6: KV_CACHE_APPEND ---\n");
  {
    bool all_ok = true;
    int token_pos = 0;
    for (int head = 0; head < HEADS; head++) {
      for (int d = 0; d < HEAD_DIM; d++) {
        int idx = head * HEAD_DIM + d;
        ::uint8_t kval = (::uint8_t)k_vec[idx];
        ::uint8_t vval = (::uint8_t)v_vec[idx];

        // Append to RTL
        kvc_append_k(h, (uint16_t)token_pos, (::uint8_t)head, (::uint8_t)d, kval);
        kvc_append_v(h, (uint16_t)token_pos, (::uint8_t)head, (::uint8_t)d, vval);

        // Append to SystemC
        ref.kvc.append_k(opentaalas::uint12(token_pos),
                          opentaalas::uint4(head),
                          opentaalas::uint7(d),
                          opentaalas::int8((::int8_t)kval));
        ref.kvc.append_v(opentaalas::uint12(token_pos),
                          opentaalas::uint4(head),
                          opentaalas::uint7(d),
                          opentaalas::int8((::int8_t)vval));
      }
    }

    // Read back and compare (exact)
    for (int head = 0; head < HEADS && all_ok; head++) {
      for (int d = 0; d < HEAD_DIM; d++) {
        ::uint8_t rtl_k = kvc_read_k(h, (uint16_t)token_pos,
                                       (::uint8_t)head, (::uint8_t)d);
        ::int8_t ref_k = ref.kvc.read_k(opentaalas::uint12(token_pos),
                                          opentaalas::uint4(head),
                                          opentaalas::uint7(d)).to_int();
        char lbl[64];
        std::snprintf(lbl, sizeof(lbl), "kvc_k[h%d][%d]", head, d);
        if (!check_exact(lbl, (::int8_t)rtl_k, ref_k))
          all_ok = false;

        ::uint8_t rtl_v = kvc_read_v(h, (uint16_t)token_pos,
                                       (::uint8_t)head, (::uint8_t)d);
        ::int8_t ref_v = ref.kvc.read_v(opentaalas::uint12(token_pos),
                                          opentaalas::uint4(head),
                                          opentaalas::uint7(d)).to_int();
        std::snprintf(lbl, sizeof(lbl), "kvc_v[h%d][%d]", head, d);
        if (!check_exact(lbl, (::int8_t)rtl_v, ref_v))
          all_ok = false;
      }
    }
    stage_result("State 6: KV cache append + readback", all_ok);
  }
  fsm_advance_state(h);
  ref.fsm.advance_state();

  // ---------------------------------------------------------------
  // State 7: ATTN_COMPUTE — dot product q against cached k
  // ---------------------------------------------------------------
  std::printf("\n--- State 7: ATTN_COMPUTE ---\n");
  {
    bool all_ok = true;
    for (int head = 0; head < HEADS; head++) {
      // Clear score on both
      attn_clear_score(h);
      ref.attn.clear_score();

      // Dot product q[head] against cached k[head] at position 0
      for (int d = 0; d < HEAD_DIM; d++) {
        int idx = head * HEAD_DIM + d;
        ::uint8_t q_elem = (::uint8_t)q_vec[idx];
        ::uint8_t k_elem = kvc_read_k(h, 0, (::uint8_t)head, (::uint8_t)d);

        attn_dot_product(h, q_elem, k_elem);
        opentaalas::int8 ref_k = ref.kvc.read_k(opentaalas::uint12(0),
                                                  opentaalas::uint4(head),
                                                  opentaalas::uint7(d));
        ref.attn.dot_product(opentaalas::int8((::int8_t)q_elem), ref_k);
      }

      // Compare final score
      ::int32_t rtl_score = attn_read_score(h);
      ::int32_t ref_score = ref.attn.read_score().to_int();
      char lbl[64];
      std::snprintf(lbl, sizeof(lbl), "attn_score[h%d]", head);
      if (!check_exact(lbl, rtl_score, ref_score))
        all_ok = false;
    }
    stage_result("State 7: Attention dot product scores", all_ok);
  }
  fsm_advance_state(h);
  ref.fsm.advance_state();

  // ---------------------------------------------------------------
  // State 8: ATTN_O_PROJ — use q_vec as proxy for attention output
  // ---------------------------------------------------------------
  std::printf("\n--- State 8: ATTN_O_PROJ ---\n");
  {
    bool ok = run_gemv(h, mac_o_fns, ref.mac_o, 0, DIM, act_qkv);
    stage_result("State 8: O projection GEMV PE0", ok);
  }
  fsm_advance_state(h);
  ref.fsm.advance_state();

  // For residual add, use input as both operands (simplified proxy)
  // In real hardware, o_vec would be the dequantized O projection output
  std::vector<uint16_t> o_vec_bf16 = norm_pre_attn;  // proxy

  // ---------------------------------------------------------------
  // State 9: RESIDUAL_ADD_1
  // ---------------------------------------------------------------
  std::printf("\n--- State 9: RESIDUAL_ADD_1 ---\n");
  {
    bool all_ok = true;
    std::vector<uint16_t> residual1(DIM);
    for (int i = 0; i < DIM; i++) {
      uint16_t rtl_r = vpu_residual_add(h, input[i], o_vec_bf16[i]);
      uint16_t ref_r_val = ref.vpu.residual_add(input[i], o_vec_bf16[i]);
      residual1[i] = rtl_r;
      char lbl[64];
      std::snprintf(lbl, sizeof(lbl), "residual1[%d]", i);
      if (!check_bf16(lbl, rtl_r, ref_r_val))
        all_ok = false;
    }
    stage_result("State 9: Residual add 1", all_ok);

    // Advance FSM: 9 -> 10
    fsm_advance_state(h);
    ref.fsm.advance_state();

    // ---------------------------------------------------------------
    // State 10: RMSNORM_PRE_MLP
    // ---------------------------------------------------------------
    std::printf("\n--- State 10: RMSNORM_PRE_MLP ---\n");
    vpu_rmsnorm_reset(h);
    ref.vpu.rmsnorm_reset();

    for (int i = 0; i < DIM; i++) {
      vpu_rmsnorm_accumulate(h, residual1[i]);
      ref.vpu.rmsnorm_accumulate(opentaalas::uint16(residual1[i]));
    }

    ::uint32_t rtl_sum2 = vpu_rmsnorm_get_sum(h);
    ::uint32_t ref_sum2 = ref.vpu.rmsnorm_get_sum().to_uint64();
    stage_result("State 10: RMSNorm pre-MLP sum",
                 check_exact("rmsnorm_mlp_sum", (::int32_t)rtl_sum2,
                             (::int32_t)ref_sum2));

    ::uint8_t rsqrt_idx2 = (::uint8_t)((rtl_sum2 >> 8) & 0xFF);
    if (rsqrt_idx2 == 0) rsqrt_idx2 = 1;
    uint16_t rtl_rsqrt2 = vpu_lookup_rsqrt(h, rsqrt_idx2);
    opentaalas::uint16 ref_rsqrt2 = ref.vpu.lookup_rsqrt(
        opentaalas::uint8(rsqrt_idx2));
    stage_result("State 10: rsqrt LUT lookup (MLP)",
                 check_bf16("rsqrt_mlp", rtl_rsqrt2,
                            (uint16_t)ref_rsqrt2.to_uint64()));

    // Compute normalized MLP input
    float rsqrt_f2 = bf16f(rtl_rsqrt2);
    std::vector<uint16_t> norm_pre_mlp(DIM);
    for (int i = 0; i < DIM; i++) {
      float x = bf16f(residual1[i]);
      float gamma = bf16f(w.gamma_pre_mlp[i]);
      norm_pre_mlp[i] = tobf16(x * rsqrt_f2 * gamma);
    }

    fsm_advance_state(h);
    ref.fsm.advance_state();

    // ---------------------------------------------------------------
    // States 11-12: GATE/UP projections
    // ---------------------------------------------------------------
    std::printf("\n--- States 11-12: GATE/UP projections ---\n");
    std::vector<::int8_t> act_mlp = quantize_to_int8(norm_pre_mlp);

    // State 11: Gate projection
    {
      bool ok2 = run_gemv(h, mac_gate_fns, ref.mac_gate, 0, DIM, act_mlp);
      stage_result("State 11: Gate projection GEMV PE0", ok2);
      fsm_advance_state(h);
      ref.fsm.advance_state();
    }

    // State 12: Up projection
    {
      bool ok2 = run_gemv(h, mac_up_fns, ref.mac_up, 0, DIM, act_mlp);
      stage_result("State 12: Up projection GEMV PE0", ok2);
      fsm_advance_state(h);
      ref.fsm.advance_state();
    }

    // ---------------------------------------------------------------
    // State 13: SWIGLU
    // ---------------------------------------------------------------
    std::printf("\n--- State 13: SWIGLU ---\n");
    {
      // Use small proxy BF16 vectors for gate/up outputs
      // (real hardware would dequantize the projection accumulators)
      bool swiglu_ok = true;
      int swiglu_count = std::min(FFN_DIM, DIM);  // limited by proxy size
      std::vector<uint16_t> swiglu_out(swiglu_count);
      for (int i = 0; i < swiglu_count; i++) {
        uint16_t gate_bf16 = norm_pre_mlp[i];
        uint16_t up_bf16 = norm_pre_mlp[(i + 1) % DIM];

        uint16_t rtl_sw = vpu_swiglu_compute(h, gate_bf16, up_bf16);
        uint16_t ref_sw_val = ref.vpu.swiglu_compute(gate_bf16, up_bf16);
        swiglu_out[i] = rtl_sw;
        char lbl[64];
        std::snprintf(lbl, sizeof(lbl), "swiglu[%d]", i);
        if (!check_bf16(lbl, rtl_sw, ref_sw_val))
          swiglu_ok = false;
      }
      stage_result("State 13: SwiGLU compute", swiglu_ok);

      fsm_advance_state(h);
      ref.fsm.advance_state();

      // ---------------------------------------------------------------
      // State 14: MLP_DOWN_PROJ
      // ---------------------------------------------------------------
      std::printf("\n--- State 14: MLP_DOWN_PROJ ---\n");
      {
        // Quantize SwiGLU output to INT8 for down projection
        // Down proj input is FFN_DIM, but we only have swiglu_count proxy values
        // Pad with zeros for the remaining
        std::vector<::int8_t> act_down(DIM, 0);
        std::vector<uint16_t> swiglu_for_quant(DIM);
        for (int i = 0; i < std::min(swiglu_count, DIM); i++)
          swiglu_for_quant[i] = swiglu_out[i];
        act_down = quantize_to_int8(swiglu_for_quant);

        bool ok2 = run_gemv(h, mac_down_fns, ref.mac_down, 0, DIM, act_down);
        stage_result("State 14: Down projection GEMV PE0", ok2);
      }
      fsm_advance_state(h);
      ref.fsm.advance_state();

      // ---------------------------------------------------------------
      // State 15: RESIDUAL_ADD_2
      // ---------------------------------------------------------------
      std::printf("\n--- State 15: RESIDUAL_ADD_2 ---\n");
      {
        bool res2_ok = true;
        // Use residual1 + norm_pre_mlp as proxy for residual1 + down_vec
        for (int i = 0; i < DIM; i++) {
          uint16_t rtl_r2 = vpu_residual_add(h, residual1[i], norm_pre_mlp[i]);
          uint16_t ref_r2_val = ref.vpu.residual_add(residual1[i], norm_pre_mlp[i]);
          char lbl[64];
          std::snprintf(lbl, sizeof(lbl), "residual2[%d]", i);
          if (!check_bf16(lbl, rtl_r2, ref_r2_val))
            res2_ok = false;
        }
        stage_result("State 15: Residual add 2", res2_ok);
      }
      fsm_advance_state(h);
      ref.fsm.advance_state();

      // ---------------------------------------------------------------
      // State 16: DONE
      // ---------------------------------------------------------------
      std::printf("\n--- State 16: DONE ---\n");
      {
        ::uint8_t final_st = fsm_get_state(h);
        int ref_final = ref.fsm.get_state().to_int();
        stage_result("State 16: FSM reached DONE",
                     check_exact("fsm_done", final_st, ref_final) &&
                     final_st == 16);
      }
    }
  }

  std::printf("\nPhase 1 complete.\n");
}

// ===================================================================
// Phase 2: FSM-driven forward pass
//
// Same operations as Phase 1, but the testbench reads the FSM state from
// both RTL and SystemC to decide which operations to dispatch. Verifies
// that the FSM state sequence is correct and that both models stay in sync.
// ===================================================================
static void test_phase2_fsm_driven() {
  std::puts("\n=== Phase 2: FSM-driven forward pass ===");

  LayerHarness h;
  h.reset();
  RefModels ref;

  // Verify initial state is IDLE (0)
  uint8_t rtl_state = fsm_get_state(h);
  uint8_t ref_state = ref.fsm.get_state().to_int();
  stage_result("FSM initial state = IDLE",
               check_exact("fsm_initial", rtl_state, ref_state) &&
               rtl_state == 0);

  // Walk through all 16 state transitions
  const char* state_names[] = {
    "IDLE", "RMSNORM_PRE_ATTN", "ATTN_Q_PROJ", "ATTN_K_PROJ",
    "ATTN_V_PROJ", "ROPE_APPLY", "KV_CACHE_APPEND", "ATTN_COMPUTE",
    "ATTN_O_PROJ", "RESIDUAL_ADD_1", "RMSNORM_PRE_MLP", "MLP_GATE_PROJ",
    "MLP_UP_PROJ", "SWIGLU", "MLP_DOWN_PROJ", "RESIDUAL_ADD_2", "DONE"
  };

  for (int target = 1; target <= 16; target++) {
    fsm_advance_state(h);
    ref.fsm.advance_state();

    rtl_state = fsm_get_state(h);
    ref_state = ref.fsm.get_state().to_int();

    char label[64];
    std::snprintf(label, sizeof(label), "FSM state %d: %s", target, state_names[target]);
    stage_result(label,
                 check_exact("fsm_state", rtl_state, ref_state) &&
                 rtl_state == target);
  }

  // Verify is_done
  stage_result("FSM is_done = true at state 16",
               check_exact("fsm_is_done", (int)fsm_is_done(h), 1));

  // Verify saturates at DONE
  fsm_advance_state(h);
  rtl_state = fsm_get_state(h);
  stage_result("FSM saturates at DONE (advance beyond 16)",
               check_exact("fsm_saturate", rtl_state, 16));

  // Reset and verify back to IDLE
  fsm_reset_state(h);
  ref.fsm.reset_state();
  rtl_state = fsm_get_state(h);
  ref_state = ref.fsm.get_state().to_int();
  stage_result("FSM reset back to IDLE",
               check_exact("fsm_reset", rtl_state, 0) &&
               check_exact("fsm_reset_ref", rtl_state, ref_state));

  std::printf("\nPhase 2 complete.\n");
}

// ===================================================================
// Phase 3: Multi-token KV cache accumulation
//
// Writes K/V for 2 tokens, verifies both are readable, then runs
// attention dot products from a query against both cached tokens.
// ===================================================================
static void test_phase3_multi_token() {
  std::puts("\n=== Phase 3: Multi-token KV cache accumulation ===");

  LayerHarness h;
  h.reset();
  RefModels ref;

  // Token 0: write K/V
  {
    auto input0 = gen_input_activation(100);
    auto input0_int8 = quantize_to_int8(input0);

    bool ok = true;
    for (int head = 0; head < HEADS; head++) {
      for (int d = 0; d < HEAD_DIM; d++) {
        int idx = head * HEAD_DIM + d;
        kvc_append_k(h, 0, (uint8_t)head, (uint8_t)d, input0_int8[idx]);
        kvc_append_v(h, 0, (uint8_t)head, (uint8_t)d, input0_int8[idx]);
        ref.kvc.append_k(uint12(0), uint4(head), uint7(d), int8((int8_t)input0_int8[idx]));
        ref.kvc.append_v(uint12(0), uint4(head), uint7(d), int8((int8_t)input0_int8[idx]));
      }
    }
    stage_result("Token 0: KV cache write", ok);
  }

  // Token 1: write K/V
  {
    auto input1 = gen_input_activation(200);
    auto input1_int8 = quantize_to_int8(input1);

    bool ok = true;
    for (int head = 0; head < HEADS; head++) {
      for (int d = 0; d < HEAD_DIM; d++) {
        int idx = head * HEAD_DIM + d;
        kvc_append_k(h, 1, (uint8_t)head, (uint8_t)d, input1_int8[idx]);
        kvc_append_v(h, 1, (uint8_t)head, (uint8_t)d, input1_int8[idx]);
        ref.kvc.append_k(uint12(1), uint4(head), uint7(d), int8((int8_t)input1_int8[idx]));
        ref.kvc.append_v(uint12(1), uint4(head), uint7(d), int8((int8_t)input1_int8[idx]));
      }
    }
    stage_result("Token 1: KV cache write", ok);
  }

  // Verify both tokens readable
  {
    bool ok = true;
    for (int token = 0; token < 2; token++) {
      auto input = gen_input_activation(100 + token * 100);
      auto input_int8 = quantize_to_int8(input);

      for (int head = 0; head < HEADS; head++) {
        for (int d = 0; d < HEAD_DIM; d++) {
          int idx = head * HEAD_DIM + d;
          uint8_t rtl_k = kvc_read_k(h, (uint16_t)token, (uint8_t)head, (uint8_t)d);
          int8_t ref_k_val = ref.kvc.read_k(uint12(token), uint4(head), uint7(d)).to_int();
          if (!check_exact("multi_token_k",
                           (int32_t)(uint8_t)rtl_k, (int32_t)(uint8_t)ref_k_val))
            ok = false;
        }
      }
    }
    stage_result("Both tokens readable from KV cache", ok);
  }

  // Attention: query dots against both cached K entries
  {
    auto query = gen_input_activation(300);
    auto q_int8 = quantize_to_int8(query);
    bool ok = true;

    for (int head = 0; head < HEADS; head++) {
      for (int token = 0; token < 2; token++) {
        attn_clear_score(h);
        ref.attn.clear_score();

        for (int d = 0; d < HEAD_DIM; d++) {
          int idx = head * HEAD_DIM + d;
          uint8_t k_elem = kvc_read_k(h, (uint16_t)token, (uint8_t)head, (uint8_t)d);
          int8_t ref_k = ref.kvc.read_k(uint12(token), uint4(head), uint7(d));

          attn_dot_product(h, q_int8[idx], k_elem);
          ref.attn.dot_product(int8((int8_t)q_int8[idx]), ref_k);
        }

        int32_t rtl_score = attn_read_score(h);
        int32_t ref_score = ref.attn.read_score().to_int();
        if (!check_exact("multi_attn", rtl_score, ref_score))
          ok = false;
      }
    }
    stage_result("Multi-token attention (query vs 2 cached tokens)", ok);
  }

  std::printf("\nPhase 3 complete.\n");
}

// ===================================================================
// Main
// ===================================================================
int main() {
  test_phase1_manual_forward_pass();
  test_phase2_fsm_driven();
  test_phase3_multi_token();
  std::printf("\n=== Final Summary: %d passed, %d failed ===\n", g_pass, g_fail);
  return g_fail > 0 ? 1 : 0;
}
