// test_llama_chip.cpp — LlamaChip reference model tests
#include "llama_chip.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_initial_state() {
  LlamaChip chip;
  assert(chip.decode_get_state() == 0);
  assert(chip.is_idle());
  assert(!chip.is_output_ready());
  assert(chip.get_token_count() == 0);
  assert(chip.decode_get_layer() == 0);
  std::printf("  PASS initial_state\n");
}

static void test_decode_start() {
  LlamaChip chip;
  chip.decode_start(uint17(42));
  assert(chip.decode_get_state() == 1);
  assert(!chip.is_idle());
  assert(!chip.is_output_ready());
  std::printf("  PASS decode_start\n");
}

static void test_decode_advance_full_cycle() {
  LlamaChip chip;
  chip.decode_start(uint17(100));
  assert(chip.decode_get_state() == 1);  // EMBED

  // Advance through states 2..35
  for (int s = 2; s <= 35; ++s) {
    chip.decode_advance();
    assert(chip.decode_get_state() == s);
  }

  assert(chip.is_output_ready());
  std::printf("  PASS decode_advance_full_cycle\n");
}

static void test_decode_advance_wraps() {
  LlamaChip chip;
  chip.decode_start(uint17(1));
  for (int i = 0; i < 34; ++i) chip.decode_advance();
  assert(chip.decode_get_state() == 35);

  // Advance from 35 wraps to idle
  chip.decode_advance();
  assert(chip.decode_get_state() == 0);
  assert(chip.is_idle());
  assert(chip.get_token_count() == 1);
  std::printf("  PASS decode_advance_wraps\n");
}

static void test_layer_tracking() {
  LlamaChip chip;
  chip.decode_start(uint17(0));

  // State 1 (EMBED): layer should still be 0 from decode_start
  assert(chip.decode_get_state() == 1);
  assert(chip.decode_get_layer() == 0);

  // Advance to state 2 (LAYER_0): layer = state-1 = 0 (set before increment)
  // Per Kanagawa: when _state >= 1 && _state <= 32, _current_layer = _state - 1
  // At state=1, advance sets _current_layer = 1-1 = 0, then state becomes 2
  chip.decode_advance();
  assert(chip.decode_get_state() == 2);
  assert(chip.decode_get_layer() == 0);

  // Advance to state 3 (LAYER_1): _state was 2, layer = 2-1 = 1
  chip.decode_advance();
  assert(chip.decode_get_state() == 3);
  assert(chip.decode_get_layer() == 1);

  // Walk through remaining layers
  for (int s = 4; s <= 33; ++s) {
    chip.decode_advance();
    assert(chip.decode_get_state() == s);
    assert(chip.decode_get_layer() == s - 2);
  }

  // At state 33, layer should be 31
  assert(chip.decode_get_layer() == 31);

  // Advance to state 34 (LM_HEAD): _state was 33, 33 > 32 so layer not updated
  chip.decode_advance();
  assert(chip.decode_get_state() == 34);
  assert(chip.decode_get_layer() == 31);  // unchanged

  std::printf("  PASS layer_tracking\n");
}

static void test_is_idle_only_at_zero() {
  LlamaChip chip;
  assert(chip.is_idle());
  chip.decode_start(uint17(0));
  for (int s = 1; s <= 35; ++s) {
    assert(!chip.is_idle());
    chip.decode_advance();
  }
  assert(chip.is_idle());
  std::printf("  PASS is_idle_only_at_zero\n");
}

static void test_is_output_ready_only_at_35() {
  LlamaChip chip;
  chip.decode_start(uint17(0));
  for (int s = 1; s < 35; ++s) {
    assert(!chip.is_output_ready());
    chip.decode_advance();
  }
  assert(chip.decode_get_state() == 35);
  assert(chip.is_output_ready());
  std::printf("  PASS is_output_ready_only_at_35\n");
}

static void test_output() {
  LlamaChip chip;
  chip.set_output(uint17(54321));
  assert(chip.get_output() == 54321);
  std::printf("  PASS output\n");
}

static void test_token_count() {
  LlamaChip chip;
  for (int cycle = 0; cycle < 3; ++cycle) {
    chip.decode_start(uint17(cycle));
    for (int i = 0; i < 34; ++i) chip.decode_advance();
    assert(chip.decode_get_state() == 35);
    chip.decode_advance();  // wrap
  }
  assert(chip.get_token_count() == 3);
  std::printf("  PASS token_count\n");
}

static void test_reset() {
  LlamaChip chip;
  chip.decode_start(uint17(999));
  for (int i = 0; i < 10; ++i) chip.decode_advance();
  chip.set_output(uint17(555));

  chip.reset();
  assert(chip.decode_get_state() == 0);
  assert(chip.get_token_count() == 0);
  assert(chip.decode_get_layer() == 0);
  assert(chip.get_output() == 0);
  assert(chip.is_idle());
  std::printf("  PASS reset\n");
}

int main() {
  std::printf("test_llama_chip\n");
  test_initial_state();
  test_decode_start();
  test_decode_advance_full_cycle();
  test_decode_advance_wraps();
  test_layer_tracking();
  test_is_idle_only_at_zero();
  test_is_output_ready_only_at_35();
  test_output();
  test_token_count();
  test_reset();
  std::printf("All llama_chip tests passed.\n");
  return 0;
}
