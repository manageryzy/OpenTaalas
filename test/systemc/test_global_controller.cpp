// test_global_controller.cpp — GlobalController reference model tests
#include "global_controller.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_initial_state() {
  GlobalController gc;
  assert(gc.get_state() == 0);
  assert(gc.is_idle());
  assert(!gc.is_output_ready());
  assert(gc.get_token_count() == 0);
  std::printf("  PASS initial_state\n");
}

static void test_start() {
  GlobalController gc;
  gc.start(uint17(42));
  assert(gc.get_state() == 1);
  assert(gc.get_current_token() == 42);
  assert(!gc.is_idle());
  std::printf("  PASS start\n");
}

static void test_advance_full_cycle() {
  GlobalController gc;
  gc.start(uint17(100));
  assert(gc.get_state() == 1);  // EMBED

  // Advance through states 2..35
  for (int s = 2; s <= 35; ++s) {
    gc.advance();
    assert(gc.get_state() == s);
  }

  // At state 35 = OUTPUT
  assert(gc.is_output_ready());
  assert(!gc.is_idle());
  std::printf("  PASS advance_full_cycle\n");
}

static void test_advance_wraps_to_idle() {
  GlobalController gc;
  gc.start(uint17(1));
  // Walk to state 35
  for (int i = 0; i < 34; ++i) gc.advance();
  assert(gc.get_state() == 35);

  // Advance from 35 wraps to 0 and increments token_count
  gc.advance();
  assert(gc.get_state() == 0);
  assert(gc.is_idle());
  assert(gc.get_token_count() == 1);
  std::printf("  PASS advance_wraps_to_idle\n");
}

static void test_is_idle_only_at_zero() {
  GlobalController gc;
  assert(gc.is_idle());
  gc.start(uint17(0));
  for (int s = 1; s <= 35; ++s) {
    assert(!gc.is_idle());
    gc.advance();
  }
  // After wrapping from 35
  assert(gc.is_idle());
  std::printf("  PASS is_idle_only_at_zero\n");
}

static void test_is_output_ready_only_at_35() {
  GlobalController gc;
  gc.start(uint17(0));
  for (int s = 1; s < 35; ++s) {
    assert(!gc.is_output_ready());
    gc.advance();
  }
  assert(gc.get_state() == 35);
  assert(gc.is_output_ready());
  std::printf("  PASS is_output_ready_only_at_35\n");
}

static void test_output_token() {
  GlobalController gc;
  gc.set_output_token(uint17(12345));
  assert(gc.get_output_token() == 12345);
  std::printf("  PASS output_token\n");
}

static void test_token_count_increments() {
  GlobalController gc;
  assert(gc.get_token_count() == 0);

  // Complete 3 full cycles
  for (int cycle = 0; cycle < 3; ++cycle) {
    gc.start(uint17(cycle));
    for (int i = 0; i < 34; ++i) gc.advance();
    assert(gc.get_state() == 35);
    gc.advance();  // wrap to idle, increment count
  }
  assert(gc.get_token_count() == 3);
  std::printf("  PASS token_count_increments\n");
}

static void test_reset() {
  GlobalController gc;
  gc.start(uint17(999));
  for (int i = 0; i < 10; ++i) gc.advance();
  gc.set_output_token(uint17(555));

  gc.reset();
  assert(gc.get_state() == 0);
  assert(gc.get_token_count() == 0);
  assert(gc.get_current_token() == 0);
  assert(gc.get_output_token() == 0);
  assert(gc.is_idle());
  std::printf("  PASS reset\n");
}

int main() {
  std::printf("test_global_controller\n");
  test_initial_state();
  test_start();
  test_advance_full_cycle();
  test_advance_wraps_to_idle();
  test_is_idle_only_at_zero();
  test_is_output_ready_only_at_35();
  test_output_token();
  test_token_count_increments();
  test_reset();
  std::printf("All global_controller tests passed.\n");
  return 0;
}
