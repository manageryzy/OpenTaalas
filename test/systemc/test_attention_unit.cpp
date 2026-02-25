// test_attention_unit — dot_product, accumulation, clear, max_score
#include <attention_unit.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
  AttentionUnit au;

  // --- dot_product with known values ---
  int32 r = au.dot_product(int8(3), int8(4));
  assert(r == 12); // 3*4 = 12

  // --- Multiple accumulations ---
  r = au.dot_product(int8(5), int8(6));
  assert(r == 42); // 12 + 30 = 42
  assert(au.read_score() == 42);

  // Negative values
  r = au.dot_product(int8(-2), int8(10));
  assert(r == 22); // 42 + (-20) = 22

  // --- clear_score resets to 0 ---
  au.clear_score();
  assert(au.read_score() == 0);

  // Accumulate after clear
  r = au.dot_product(int8(7), int8(7));
  assert(r == 49);

  // --- max_score tracking ---
  au.set_max_score(int32(100));
  assert(au.get_max_score() == 100);
  au.set_max_score(int32(-50));
  assert(au.get_max_score() == -50);

  std::printf("PASS: test_attention_unit\n");
  return 0;
}
