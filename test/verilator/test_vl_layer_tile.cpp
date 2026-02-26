// test_vl_layer_tile.cpp — Verilator co-simulation tests for layer_tile
// Mirrors test/systemc/test_layer_tile.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vlayer_tile.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vlayer_tile>;

// ---------------------------------------------------------------------------
// Method wrappers — Kanagawa valid/rdy/rden/empty protocol
// ---------------------------------------------------------------------------

// --- set_layer_id: id_in[15:0] → void ---
static void call_set_layer_id(Harness& h, uint16_t id) {
  auto* d = h.dut();
  h.wait_ready(d->set_layer_id_rdy_out);
  d->set_layer_id_valid_in = 1;
  d->set_layer_id_id_in = id;
  h.tick();
  d->set_layer_id_valid_in = 0;
  h.drain_fifo(d->set_layer_id_rden_in, d->set_layer_id_empty_out);
}

// --- get_layer_id: → result_out[15:0] ---
static uint16_t call_get_layer_id(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_layer_id_rdy_out);
  d->get_layer_id_valid_in = 1;
  h.tick();
  d->get_layer_id_valid_in = 0;
  return h.read_fifo(d->get_layer_id_rden_in, d->get_layer_id_empty_out,
                     d->get_layer_id_result_out);
}

// --- get_state: → result_out[5:0] ---
static uint8_t call_get_state(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_state_rdy_out);
  d->get_state_valid_in = 1;
  h.tick();
  d->get_state_valid_in = 0;
  return h.read_fifo(d->get_state_rden_in, d->get_state_empty_out,
                     d->get_state_result_out);
}

// --- advance_state: → void ---
static void call_advance_state(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->advance_state_rdy_out);
  d->advance_state_valid_in = 1;
  h.tick();
  d->advance_state_valid_in = 0;
  h.drain_fifo(d->advance_state_rden_in, d->advance_state_empty_out);
}

// --- reset_state: → void ---
static void call_reset_state(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->reset_state_rdy_out);
  d->reset_state_valid_in = 1;
  h.tick();
  d->reset_state_valid_in = 0;
  h.drain_fifo(d->reset_state_rden_in, d->reset_state_empty_out);
}

// --- is_done: → result_out[0:0] ---
static bool call_is_done(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->is_done_rdy_out);
  d->is_done_valid_in = 1;
  h.tick();
  d->is_done_valid_in = 0;
  return h.read_fifo(d->is_done_rden_in, d->is_done_empty_out,
                     d->is_done_result_out) & 1;
}

// --- get_position: → result_out[11:0] ---
static uint16_t call_get_position(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_position_rdy_out);
  d->get_position_valid_in = 1;
  h.tick();
  d->get_position_valid_in = 0;
  return h.read_fifo(d->get_position_rden_in, d->get_position_empty_out,
                     d->get_position_result_out);
}

// --- advance_position: → void ---
static void call_advance_position(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->advance_position_rdy_out);
  d->advance_position_valid_in = 1;
  h.tick();
  d->advance_position_valid_in = 0;
  h.drain_fifo(d->advance_position_rden_in, d->advance_position_empty_out);
}

// --- reset: → void ---
static void call_reset(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->reset_rdy_out);
  d->reset_valid_in = 1;
  h.tick();
  d->reset_valid_in = 0;
  h.drain_fifo(d->reset_rden_in, d->reset_empty_out);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

static void test_fsm_walk() {
  Harness h;
  h.reset();

  assert(call_get_state(h) == 0);
  assert(!call_is_done(h));

  for (int i = 0; i < 16; ++i) {
    assert(call_get_state(h) == i);
    assert(!call_is_done(h));
    call_advance_state(h);
  }

  assert(call_get_state(h) == 16);
  assert(call_is_done(h));

  std::puts("[PASS] fsm_walk: 0 -> 16, is_done at 16");
}

static void test_fsm_saturate() {
  Harness h;
  h.reset();

  for (int i = 0; i < 16; ++i) call_advance_state(h);
  assert(call_get_state(h) == 16);

  // Advancing past DONE stays at 16
  call_advance_state(h);
  assert(call_get_state(h) == 16);
  call_advance_state(h);
  assert(call_get_state(h) == 16);
  assert(call_is_done(h));

  std::puts("[PASS] fsm_saturate: stays at 16 after DONE");
}

static void test_reset_state() {
  Harness h;
  h.reset();

  // Advance to state 3, reset
  call_advance_state(h);
  call_advance_state(h);
  call_advance_state(h);
  assert(call_get_state(h) == 3);

  call_reset_state(h);
  assert(call_get_state(h) == 0);
  assert(!call_is_done(h));

  // Advance to DONE, reset
  for (int i = 0; i < 16; ++i) call_advance_state(h);
  assert(call_is_done(h));

  call_reset_state(h);
  assert(call_get_state(h) == 0);
  assert(!call_is_done(h));

  std::puts("[PASS] reset_state: 3->0, DONE->0");
}

static void test_layer_id() {
  Harness h;
  h.reset();

  assert(call_get_layer_id(h) == 0);

  call_set_layer_id(h, 7);
  assert(call_get_layer_id(h) == 7);

  call_set_layer_id(h, 31);
  assert(call_get_layer_id(h) == 31);

  call_set_layer_id(h, 0);
  assert(call_get_layer_id(h) == 0);

  std::puts("[PASS] layer_id: default=0, set 7/31/0");
}

static void test_advance_position() {
  Harness h;
  h.reset();

  assert(call_get_position(h) == 0);

  call_advance_position(h);
  assert(call_get_position(h) == 1);

  call_advance_position(h);
  assert(call_get_position(h) == 2);

  std::puts("[PASS] advance_position: 0 -> 1 -> 2");
}

static void test_position_wrap() {
  Harness h;
  h.reset();

  // Advance a few times to verify incrementing
  for (int i = 0; i < 10; ++i) call_advance_position(h);
  assert(call_get_position(h) == 10);

  // Use reset to go back to 0, then test wrap at 4095 boundary.
  // Advancing 4095 times in Verilator is slow, so we use the full reset
  // method to clear position, then advance to near the boundary via a loop.
  call_reset(h);
  assert(call_get_position(h) == 0);

  // Advance to 4093 (still fast enough at ~4k iterations)
  for (int i = 0; i < 4093; ++i) call_advance_position(h);
  assert(call_get_position(h) == 4093);

  call_advance_position(h);
  assert(call_get_position(h) == 4094);

  call_advance_position(h);
  assert(call_get_position(h) == 4095);

  // Wrap to 0
  call_advance_position(h);
  assert(call_get_position(h) == 0);

  // One more goes to 1
  call_advance_position(h);
  assert(call_get_position(h) == 1);

  std::puts("[PASS] position_wrap: 4095 -> 0 -> 1");
}

static void test_full_reset() {
  Harness h;
  h.reset();

  call_set_layer_id(h, 15);
  for (int i = 0; i < 10; ++i) call_advance_state(h);
  for (int i = 0; i < 100; ++i) call_advance_position(h);

  assert(call_get_state(h) == 10);
  assert(call_get_position(h) == 100);
  assert(call_get_layer_id(h) == 15);

  // reset() clears state and position but preserves layer_id
  call_reset(h);
  assert(call_get_state(h) == 0);
  assert(call_get_position(h) == 0);
  assert(call_get_layer_id(h) == 15);

  std::puts("[PASS] full_reset: state=0, position=0, layer_id=15 preserved");
}

int main() {
  test_fsm_walk();
  test_fsm_saturate();
  test_reset_state();
  test_layer_id();
  test_advance_position();
  test_position_wrap();
  test_full_reset();
  std::puts("\nAll layer_tile Verilator co-sim tests passed.");
  return 0;
}
