// test_vl_global_controller.cpp — Verilator co-simulation tests for global_controller
// Mirrors test/systemc/test_global_controller.cpp against the Kanagawa-generated RTL.
//
// global_controller is a 36-state FSM (0-35). State 35 is OUTPUT/DONE.
// It tracks token_count across full decode cycles.

#include "kanagawa_harness.h"
#include "Vglobal_controller.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vglobal_controller>;

// ---------------------------------------------------------------------------
// Method wrappers
// ---------------------------------------------------------------------------

// --- start: token_id_in[16:0] → void
static void call_start(Harness& h, uint32_t token_id) {
  auto* d = h.dut();
  h.wait_ready(d->start_rdy_out);
  d->start_valid_in = 1;
  d->start_token_id_in = token_id;
  h.tick();
  d->start_valid_in = 0;
  h.drain_fifo(d->start_rden_in, d->start_empty_out);
}

// --- advance: → void
static void call_advance(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->advance_rdy_out);
  d->advance_valid_in = 1;
  h.tick();
  d->advance_valid_in = 0;
  h.drain_fifo(d->advance_rden_in, d->advance_empty_out);
}

// --- get_state: → result_out[5:0]
static uint8_t call_get_state(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_state_rdy_out);
  d->get_state_valid_in = 1;
  h.tick();
  d->get_state_valid_in = 0;
  return h.read_fifo(d->get_state_rden_in, d->get_state_empty_out,
                     d->get_state_result_out);
}

// --- get_current_token: → result_out[16:0]
static uint32_t call_get_current_token(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_current_token_rdy_out);
  d->get_current_token_valid_in = 1;
  h.tick();
  d->get_current_token_valid_in = 0;
  return h.read_fifo(d->get_current_token_rden_in,
                     d->get_current_token_empty_out,
                     d->get_current_token_result_out);
}

// --- set_output_token: token_id_in[16:0] → void
static void call_set_output_token(Harness& h, uint32_t token_id) {
  auto* d = h.dut();
  h.wait_ready(d->set_output_token_rdy_out);
  d->set_output_token_valid_in = 1;
  d->set_output_token_token_id_in = token_id;
  h.tick();
  d->set_output_token_valid_in = 0;
  h.drain_fifo(d->set_output_token_rden_in, d->set_output_token_empty_out);
}

// --- get_output_token: → result_out[16:0]
static uint32_t call_get_output_token(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_output_token_rdy_out);
  d->get_output_token_valid_in = 1;
  h.tick();
  d->get_output_token_valid_in = 0;
  return h.read_fifo(d->get_output_token_rden_in,
                     d->get_output_token_empty_out,
                     d->get_output_token_result_out);
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
  call_start(h, token_id);
  for (int i = 0; i < 35; ++i) call_advance(h);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

static void test_initial_state() {
  Harness h;
  h.reset();

  assert(call_get_state(h) == 0);
  assert(call_is_idle(h));
  assert(!call_is_output_ready(h));
  assert(call_get_token_count(h) == 0);

  std::puts("[PASS] initial_state: state=0, idle=1, output_ready=0, count=0");
}

static void test_start() {
  Harness h;
  h.reset();

  call_start(h, 42);

  assert(call_get_state(h) == 1);
  assert(call_get_current_token(h) == 42);
  assert(!call_is_idle(h));

  std::puts("[PASS] start: state=1, current_token=42, idle=0");
}

static void test_advance_full_cycle() {
  Harness h;
  h.reset();

  call_start(h, 100);

  // Advance 34 times: state goes from 1 to 35
  for (int i = 0; i < 34; ++i) call_advance(h);

  assert(call_get_state(h) == 35);
  assert(call_is_output_ready(h));

  std::puts("[PASS] advance_full_cycle: 34 advances → state=35, output_ready=1");
}

static void test_advance_wraps() {
  Harness h;
  h.reset();

  call_start(h, 100);
  for (int i = 0; i < 34; ++i) call_advance(h);
  assert(call_get_state(h) == 35);

  // One more advance wraps to 0
  call_advance(h);
  assert(call_get_state(h) == 0);
  assert(call_is_idle(h));
  assert(call_get_token_count(h) == 1);

  std::puts("[PASS] advance_wraps: state 35→0, idle=1, token_count=1");
}

static void test_output_token() {
  Harness h;
  h.reset();

  call_set_output_token(h, 12345);
  assert(call_get_output_token(h) == 12345);

  std::puts("[PASS] output_token: set 12345, get 12345");
}

static void test_token_count() {
  Harness h;
  h.reset();

  // Run 3 full cycles
  run_full_cycle(h, 10);
  run_full_cycle(h, 20);
  run_full_cycle(h, 30);

  assert(call_get_token_count(h) == 3);

  std::puts("[PASS] token_count: 3 full cycles → count=3");
}

static void test_reset() {
  Harness h;
  h.reset();

  // Build up some state
  run_full_cycle(h, 50);
  call_set_output_token(h, 9999);
  call_start(h, 77);

  // Reset clears everything
  call_reset(h);

  assert(call_get_state(h) == 0);
  assert(call_get_token_count(h) == 0);
  assert(call_get_current_token(h) == 0);
  assert(call_get_output_token(h) == 0);

  std::puts("[PASS] reset: all fields zeroed");
}

int main() {
  test_initial_state();
  test_start();
  test_advance_full_cycle();
  test_advance_wraps();
  test_output_token();
  test_token_count();
  test_reset();
  std::puts("\nAll global_controller Verilator co-sim tests passed.");
  return 0;
}
