// test_vl_llama_chip.cpp — Verilator co-simulation tests for llama_chip
// Mirrors test/systemc/test_llama_chip.cpp against the Kanagawa-generated RTL.
//
// llama_chip is the top-level 36-state FSM (0-35). State 35 is OUTPUT/DONE.
// Method names use decode_ prefix and set_output/get_output (not set_output_token).

#include "kanagawa_harness.h"
#include "Vllama_chip.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vllama_chip>;

// ---------------------------------------------------------------------------
// Method wrappers
// ---------------------------------------------------------------------------

// --- decode_start: token_id_in[16:0] → void
static void call_decode_start(Harness& h, uint32_t token_id) {
  auto* d = h.dut();
  h.wait_ready(d->decode_start_rdy_out);
  d->decode_start_valid_in = 1;
  d->decode_start_token_id_in = token_id;
  h.tick();
  d->decode_start_valid_in = 0;
  h.drain_fifo(d->decode_start_rden_in, d->decode_start_empty_out);
}

// --- decode_advance: → void
static void call_decode_advance(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->decode_advance_rdy_out);
  d->decode_advance_valid_in = 1;
  h.tick();
  d->decode_advance_valid_in = 0;
  h.drain_fifo(d->decode_advance_rden_in, d->decode_advance_empty_out);
}

// --- decode_get_state: → result_out[5:0]
static uint8_t call_decode_get_state(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->decode_get_state_rdy_out);
  d->decode_get_state_valid_in = 1;
  h.tick();
  d->decode_get_state_valid_in = 0;
  return h.read_fifo(d->decode_get_state_rden_in,
                     d->decode_get_state_empty_out,
                     d->decode_get_state_result_out);
}

// --- decode_get_layer: → result_out[4:0]
static uint8_t call_decode_get_layer(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->decode_get_layer_rdy_out);
  d->decode_get_layer_valid_in = 1;
  h.tick();
  d->decode_get_layer_valid_in = 0;
  return h.read_fifo(d->decode_get_layer_rden_in,
                     d->decode_get_layer_empty_out,
                     d->decode_get_layer_result_out);
}

// --- set_output: token_id_in[16:0] → void
static void call_set_output(Harness& h, uint32_t token_id) {
  auto* d = h.dut();
  h.wait_ready(d->set_output_rdy_out);
  d->set_output_valid_in = 1;
  d->set_output_token_id_in = token_id;
  h.tick();
  d->set_output_valid_in = 0;
  h.drain_fifo(d->set_output_rden_in, d->set_output_empty_out);
}

// --- get_output: → result_out[16:0]
static uint32_t call_get_output(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_output_rdy_out);
  d->get_output_valid_in = 1;
  h.tick();
  d->get_output_valid_in = 0;
  return h.read_fifo(d->get_output_rden_in, d->get_output_empty_out,
                     d->get_output_result_out);
}

// --- is_idle: → result_out[0:0]
static bool call_is_idle(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->is_idle_rdy_out);
  d->is_idle_valid_in = 1;
  h.tick();
  d->is_idle_valid_in = 0;
  return h.read_fifo(d->is_idle_rden_in, d->is_idle_empty_out,
                     d->is_idle_result_out) & 1;
}

// --- is_output_ready: → result_out[0:0]
static bool call_is_output_ready(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->is_output_ready_rdy_out);
  d->is_output_ready_valid_in = 1;
  h.tick();
  d->is_output_ready_valid_in = 0;
  return h.read_fifo(d->is_output_ready_rden_in,
                     d->is_output_ready_empty_out,
                     d->is_output_ready_result_out) & 1;
}

// --- get_token_count: → result_out[11:0]
static uint16_t call_get_token_count(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_token_count_rdy_out);
  d->get_token_count_valid_in = 1;
  h.tick();
  d->get_token_count_valid_in = 0;
  return h.read_fifo(d->get_token_count_rden_in,
                     d->get_token_count_empty_out,
                     d->get_token_count_result_out);
}

// --- reset: → void
static void call_reset(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->reset_rdy_out);
  d->reset_valid_in = 1;
  h.tick();
  d->reset_valid_in = 0;
  h.drain_fifo(d->reset_rden_in, d->reset_empty_out);
}

// ---------------------------------------------------------------------------
// Helper: run one full decode cycle (start + 35 advances → wraps to 0)
// ---------------------------------------------------------------------------

static void run_full_cycle(Harness& h, uint32_t token_id) {
  call_decode_start(h, token_id);
  for (int i = 0; i < 35; ++i) call_decode_advance(h);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

static void test_initial_state() {
  Harness h;
  h.reset();

  assert(call_decode_get_state(h) == 0);
  assert(call_is_idle(h));
  assert(!call_is_output_ready(h));
  assert(call_get_token_count(h) == 0);
  assert(call_decode_get_layer(h) == 0);

  std::puts("[PASS] initial_state: state=0, idle=1, output_ready=0, count=0, layer=0");
}

static void test_decode_start() {
  Harness h;
  h.reset();

  call_decode_start(h, 42);

  assert(call_decode_get_state(h) == 1);
  assert(!call_is_idle(h));

  std::puts("[PASS] decode_start: state=1, idle=0");
}

static void test_advance_full_cycle() {
  Harness h;
  h.reset();

  call_decode_start(h, 100);

  // Advance 34 times: state goes from 1 to 35
  for (int i = 0; i < 34; ++i) call_decode_advance(h);

  assert(call_decode_get_state(h) == 35);
  assert(call_is_output_ready(h));

  std::puts("[PASS] advance_full_cycle: 34 advances → state=35, output_ready=1");
}

static void test_advance_wraps() {
  Harness h;
  h.reset();

  call_decode_start(h, 100);
  for (int i = 0; i < 34; ++i) call_decode_advance(h);
  assert(call_decode_get_state(h) == 35);

  // One more advance wraps to 0
  call_decode_advance(h);
  assert(call_decode_get_state(h) == 0);
  assert(call_is_idle(h));
  assert(call_get_token_count(h) == 1);

  std::puts("[PASS] advance_wraps: state 35→0, idle=1, token_count=1");
}

static void test_layer_tracking() {
  Harness h;
  h.reset();

  call_decode_start(h, 200);

  // State 1 → advance to state 2, layer should be 0
  call_decode_advance(h);
  assert(call_decode_get_state(h) == 2);
  assert(call_decode_get_layer(h) == 0);

  // State 2 → advance to state 3, layer should be 1
  call_decode_advance(h);
  assert(call_decode_get_state(h) == 3);
  assert(call_decode_get_layer(h) == 1);

  // Advance to state 33, layer should be 31
  for (int i = 0; i < 30; ++i) call_decode_advance(h);
  assert(call_decode_get_state(h) == 33);
  assert(call_decode_get_layer(h) == 31);

  std::puts("[PASS] layer_tracking: state2→layer0, state3→layer1, state33→layer31");
}

static void test_output() {
  Harness h;
  h.reset();

  call_set_output(h, 54321);
  assert(call_get_output(h) == 54321);

  std::puts("[PASS] output: set 54321, get 54321");
}

static void test_reset() {
  Harness h;
  h.reset();

  // Build up some state
  run_full_cycle(h, 50);
  call_set_output(h, 9999);
  call_decode_start(h, 77);

  // Reset clears everything
  call_reset(h);

  assert(call_decode_get_state(h) == 0);
  assert(call_get_token_count(h) == 0);
  assert(call_get_output(h) == 0);
  assert(call_decode_get_layer(h) == 0);

  std::puts("[PASS] reset: all fields zeroed");
}

int main() {
  test_initial_state();
  test_decode_start();
  test_advance_full_cycle();
  test_advance_wraps();
  test_layer_tracking();
  test_output();
  test_reset();
  std::puts("\nAll llama_chip Verilator co-sim tests passed.");
  return 0;
}
