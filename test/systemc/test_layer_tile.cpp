// test_layer_tile.cpp — Tests for the layer tile FSM reference model
#include <layer_tile.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_fsm_walk() {
  layer_tile lt;

  // Initial state is 0 (IDLE)
  assert(lt.get_state() == 0);
  assert(!lt.is_done());

  // Walk through all 17 states: 0 -> 1 -> ... -> 16
  for (int i = 0; i < 16; ++i) {
    assert(lt.get_state() == i);
    assert(!lt.is_done());
    lt.advance_state();
  }

  // Now at state 16 (DONE)
  assert(lt.get_state() == 16);
  assert(lt.is_done());

  std::puts("  fsm_walk: PASS");
}

static void test_fsm_saturate() {
  layer_tile lt;

  // Advance to DONE
  for (int i = 0; i < 16; ++i) lt.advance_state();
  assert(lt.get_state() == 16);

  // Advancing at DONE stays at 16
  lt.advance_state();
  assert(lt.get_state() == 16);
  lt.advance_state();
  assert(lt.get_state() == 16);
  assert(lt.is_done());

  std::puts("  fsm_saturate: PASS");
}

static void test_reset_state() {
  layer_tile lt;

  // Advance partway
  lt.advance_state();
  lt.advance_state();
  lt.advance_state();
  assert(lt.get_state() == 3);

  // Reset goes back to 0
  lt.reset_state();
  assert(lt.get_state() == 0);
  assert(!lt.is_done());

  // Reset from DONE
  for (int i = 0; i < 16; ++i) lt.advance_state();
  assert(lt.is_done());
  lt.reset_state();
  assert(lt.get_state() == 0);
  assert(!lt.is_done());

  std::puts("  reset_state: PASS");
}

static void test_layer_id() {
  layer_tile lt;

  // Default is 0
  assert(lt.get_layer_id() == 0);

  lt.set_layer_id(uint16(7));
  assert(lt.get_layer_id() == 7);

  lt.set_layer_id(uint16(31));
  assert(lt.get_layer_id() == 31);

  // Overwrite
  lt.set_layer_id(uint16(0));
  assert(lt.get_layer_id() == 0);

  std::puts("  layer_id: PASS");
}

static void test_advance_position() {
  layer_tile lt;

  // Initial position is 0
  assert(lt.get_position() == 0);

  // Increment
  lt.advance_position();
  assert(lt.get_position() == 1);

  lt.advance_position();
  assert(lt.get_position() == 2);

  std::puts("  advance_position: PASS");
}

static void test_position_wrap() {
  layer_tile lt;

  // Advance to 4095
  for (int i = 0; i < 4095; ++i) lt.advance_position();
  assert(lt.get_position() == 4095);

  // Next advance wraps to 0
  lt.advance_position();
  assert(lt.get_position() == 0);

  // One more goes to 1
  lt.advance_position();
  assert(lt.get_position() == 1);

  std::puts("  position_wrap: PASS");
}

static void test_full_reset() {
  layer_tile lt;

  // Set some state
  lt.set_layer_id(uint16(15));
  for (int i = 0; i < 10; ++i) lt.advance_state();
  for (int i = 0; i < 100; ++i) lt.advance_position();

  assert(lt.get_state() == 10);
  assert(lt.get_position() == 100);
  assert(lt.get_layer_id() == 15);

  // reset() clears state and position but NOT layer_id (per Kanagawa source)
  lt.reset();
  assert(lt.get_state() == 0);
  assert(lt.get_position() == 0);
  assert(lt.get_layer_id() == 15);  // layer_id preserved

  std::puts("  full_reset: PASS");
}

int main() {
  std::puts("test_layer_tile");

  test_fsm_walk();
  test_fsm_saturate();
  test_reset_state();
  test_layer_id();
  test_advance_position();
  test_position_wrap();
  test_full_reset();

  std::puts("All layer_tile tests passed.");
  return 0;
}
