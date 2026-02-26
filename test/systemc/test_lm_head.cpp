// test_lm_head.cpp — LmHead reference model tests
#include "lm_head.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_weight_write_read() {
  LmHead<64, 32> lm;
  lm.write_weight(uint17(10), uint12(5), uint16(0x3F80));
  assert(lm.read_weight(uint17(10), uint12(5)) == 0x3F80);
  assert(lm.read_weight(uint17(10), uint12(6)) == 0);
  std::printf("  PASS weight_write_read\n");
}

static void test_gamma_write_read() {
  LmHead<64, 32> lm;
  assert(lm.get_gamma(uint16(0)) == 0);
  lm.set_gamma(uint16(0), uint16(0x3F80));
  lm.set_gamma(uint16(31), uint16(0x4000));
  assert(lm.get_gamma(uint16(0)) == 0x3F80);
  assert(lm.get_gamma(uint16(31)) == 0x4000);
  std::printf("  PASS gamma_write_read\n");
}

static void test_argmax_increasing() {
  LmHead<64, 32> lm;
  lm.update_argmax(uint17(10), 1.0f);
  assert(lm.get_best_token() == 10);
  lm.update_argmax(uint17(20), 2.0f);
  assert(lm.get_best_token() == 20);
  lm.update_argmax(uint17(30), 3.0f);
  assert(lm.get_best_token() == 30);
  std::printf("  PASS argmax_increasing\n");
}

static void test_argmax_decreasing() {
  LmHead<64, 32> lm;
  lm.update_argmax(uint17(5), 5.0f);
  assert(lm.get_best_token() == 5);
  lm.update_argmax(uint17(6), 4.0f);
  assert(lm.get_best_token() == 5);
  lm.update_argmax(uint17(7), 3.0f);
  assert(lm.get_best_token() == 5);
  std::printf("  PASS argmax_decreasing\n");
}

static void test_argmax_reset() {
  LmHead<64, 32> lm;
  lm.update_argmax(uint17(42), 999.0f);
  assert(lm.get_best_token() == 42);
  lm.reset_argmax();
  assert(lm.get_best_token() == 0);
  // After reset, any score should win (reset to -inf)
  lm.update_argmax(uint17(1), -100.0f);
  assert(lm.get_best_token() == 1);
  std::printf("  PASS argmax_reset\n");
}

static void test_argmax_negative() {
  LmHead<64, 32> lm;
  lm.update_argmax(uint17(0), -10.0f);
  assert(lm.get_best_token() == 0);
  lm.update_argmax(uint17(1), -5.0f);
  assert(lm.get_best_token() == 1);
  lm.update_argmax(uint17(2), -20.0f);
  assert(lm.get_best_token() == 1);
  std::printf("  PASS argmax_negative\n");
}

int main() {
  std::printf("test_lm_head\n");
  test_weight_write_read();
  test_gamma_write_read();
  test_argmax_increasing();
  test_argmax_decreasing();
  test_argmax_reset();
  test_argmax_negative();
  std::printf("All lm_head tests passed.\n");
  return 0;
}
