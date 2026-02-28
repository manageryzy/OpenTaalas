// test_vl_swiglu.cpp — Verilator co-simulation tests for swiglu_unit
// Mirrors test/systemc/test_swiglu.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vswiglu_unit.h"

#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Harness = KanagawaHarness<Vswiglu_unit>;

// BF16 <-> float conversion helpers.
static float bf16_to_float(uint16_t bf16) {
  uint32_t bits = static_cast<uint32_t>(bf16) << 16;
  float f;
  std::memcpy(&f, &bits, sizeof(f));
  return f;
}

// --- set_sigmoid_lut: void ---
static void call_set_sigmoid_lut(Harness& h, uint8_t index, uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_sigmoid_lut_rdy_out);
  d->set_sigmoid_lut_valid_in = 1;
  d->set_sigmoid_lut_index_in = index;
  d->set_sigmoid_lut_value_in = value;
  h.tick();
  d->set_sigmoid_lut_valid_in = 0;
  h.drain_fifo(d->set_sigmoid_lut_rden_in, d->set_sigmoid_lut_empty_out);
}

// --- lookup_sigmoid: returns uint16 ---
static uint16_t call_lookup_sigmoid(Harness& h, uint8_t index) {
  auto* d = h.dut();
  h.wait_ready(d->lookup_sigmoid_rdy_out);
  d->lookup_sigmoid_valid_in = 1;
  d->lookup_sigmoid_index_in = index;
  h.tick();
  d->lookup_sigmoid_valid_in = 0;
  return h.read_fifo(d->lookup_sigmoid_rden_in, d->lookup_sigmoid_empty_out,
                     d->lookup_sigmoid_result_out);
}

// --- compute_silu: returns uint16 (bf16) ---
static uint16_t call_compute_silu(Harness& h, uint16_t gate_bf16) {
  auto* d = h.dut();
  h.wait_ready(d->compute_silu_rdy_out);
  d->compute_silu_valid_in = 1;
  d->compute_silu_gate_bf16_in = gate_bf16;
  h.tick();
  d->compute_silu_valid_in = 0;
  return h.read_fifo(d->compute_silu_rden_in, d->compute_silu_empty_out,
                     d->compute_silu_result_out);
}

// --- compute_swiglu: returns uint16 (bf16) ---
static uint16_t call_compute_swiglu(Harness& h, uint16_t gate_bf16,
                                     uint16_t up_bf16) {
  auto* d = h.dut();
  h.wait_ready(d->compute_swiglu_rdy_out);
  d->compute_swiglu_valid_in = 1;
  d->compute_swiglu_gate_bf16_in = gate_bf16;
  d->compute_swiglu_up_bf16_in = up_bf16;
  h.tick();
  d->compute_swiglu_valid_in = 0;
  return h.read_fifo(d->compute_swiglu_rden_in, d->compute_swiglu_empty_out,
                     d->compute_swiglu_result_out);
}

// Assert BF16 result is close to expected float value.
static void assert_bf16_near(uint16_t result_bf16, float expected,
                              float tolerance, const char* label) {
  float actual = bf16_to_float(result_bf16);
  if (std::fabs(actual - expected) > tolerance) {
    std::fprintf(stderr, "FAIL %s: expected %.4f, got %.4f (bf16=0x%04X)\n",
                 label, expected, actual, result_bf16);
    std::abort();
  }
}

// ---- Tests ----

static void test_sigmoid_lut_round_trip() {
  Harness h;
  h.reset();

  call_set_sigmoid_lut(h, 0, 0x3F00);
  call_set_sigmoid_lut(h, 127, 0x3F80);
  call_set_sigmoid_lut(h, 255, 0x0000);

  assert(call_lookup_sigmoid(h, 0) == 0x3F00);
  assert(call_lookup_sigmoid(h, 127) == 0x3F80);
  assert(call_lookup_sigmoid(h, 255) == 0x0000);
  std::puts("[PASS] sigmoid LUT round-trip: indices 0, 127, 255");
}

static void test_compute_silu() {
  // compute_silu(gate) = gate * sigmoid_lut[gate >> 8]
  // Program all LUT entries to BF16(0.5) = 0x3F00
  Harness h;
  h.reset();

  for (int i = 0; i < 256; ++i)
    call_set_sigmoid_lut(h, i, 0x3F00);  // sigmoid = 0.5

  // gate=2.0(0x4000): silu = 2.0 * 0.5 = 1.0 = 0x3F80
  uint16_t r1 = call_compute_silu(h, 0x4000);
  assert_bf16_near(r1, 1.0f, 0.01f, "silu(2.0) with sig=0.5");

  // gate=4.0(0x4080): silu = 4.0 * 0.5 = 2.0 = 0x4000
  uint16_t r2 = call_compute_silu(h, 0x4080);
  assert_bf16_near(r2, 2.0f, 0.01f, "silu(4.0) with sig=0.5");

  std::puts("[PASS] compute_silu (gate * sigmoid LUT)");
}

static void test_compute_swiglu() {
  // compute_swiglu(gate, up) = gate * sigmoid_lut[gate >> 8] * up
  // Program all LUT entries to BF16(0.5) = 0x3F00
  Harness h;
  h.reset();

  for (int i = 0; i < 256; ++i)
    call_set_sigmoid_lut(h, i, 0x3F00);  // sigmoid = 0.5

  // gate=2.0(0x4000), up=3.0(0x4040): 2.0*0.5*3.0 = 3.0 = 0x4040
  uint16_t r1 = call_compute_swiglu(h, 0x4000, 0x4040);
  assert_bf16_near(r1, 3.0f, 0.05f, "swiglu(2.0, 3.0) with sig=0.5");

  // gate=4.0(0x4080), up=0.5(0x3F00): 4.0*0.5*0.5 = 1.0 = 0x3F80
  uint16_t r2 = call_compute_swiglu(h, 0x4080, 0x3F00);
  assert_bf16_near(r2, 1.0f, 0.05f, "swiglu(4.0, 0.5) with sig=0.5");

  std::puts("[PASS] compute_swiglu (gate * sigmoid * up)");
}

int main() {
  test_sigmoid_lut_round_trip();
  test_compute_silu();
  test_compute_swiglu();
  std::puts("\nAll swiglu Verilator co-sim tests passed.");
  return 0;
}
