// test_lm_head.cpp — LmHead reference model tests
#include "lm_head.h"
#include <cassert>
#include <cstdio>

using namespace opentaalas;

static void test_weight_write_read() {
  LmHead<64, 32> lm;
  lm.write_weight(uint17(10), uint12(5), uint3(7));
  assert(lm.read_weight(uint17(10), uint12(5)) == 7);
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

static void test_scales() {
  LmHead<64, 32> lm;
  lm.set_bank_scale(uint8(42));
  assert(lm.get_bank_scale() == 42);
  lm.set_tensor_scale(uint32(0x12345678));
  assert(lm.get_tensor_scale() == 0x12345678);
  std::printf("  PASS scales\n");
}

static void test_argmax_increasing() {
  LmHead<64, 32> lm;
  // Feed increasing scores — best_token should track the latest
  lm.update_argmax(uint17(10), int32(100));
  assert(lm.get_best_token() == 10);
  lm.update_argmax(uint17(20), int32(200));
  assert(lm.get_best_token() == 20);
  lm.update_argmax(uint17(30), int32(300));
  assert(lm.get_best_token() == 30);
  std::printf("  PASS argmax_increasing\n");
}

static void test_argmax_decreasing() {
  LmHead<64, 32> lm;
  // Feed decreasing scores — first (highest) should stay
  lm.update_argmax(uint17(5), int32(500));
  assert(lm.get_best_token() == 5);
  lm.update_argmax(uint17(6), int32(400));
  assert(lm.get_best_token() == 5);
  lm.update_argmax(uint17(7), int32(300));
  assert(lm.get_best_token() == 5);
  std::printf("  PASS argmax_decreasing\n");
}

static void test_argmax_reset() {
  LmHead<64, 32> lm;
  lm.update_argmax(uint17(42), int32(999));
  assert(lm.get_best_token() == 42);
  lm.reset_argmax();
  assert(lm.get_best_token() == 0);
  // After reset, any positive score should win
  lm.update_argmax(uint17(1), int32(1));
  assert(lm.get_best_token() == 1);
  std::printf("  PASS argmax_reset\n");
}

int main() {
  std::printf("test_lm_head\n");
  test_weight_write_read();
  test_gamma_write_read();
  test_scales();
  test_argmax_increasing();
  test_argmax_decreasing();
  test_argmax_reset();
  std::printf("All lm_head tests passed.\n");
  return 0;
}
