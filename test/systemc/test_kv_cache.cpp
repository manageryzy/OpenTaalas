// test_kv_cache — KvCache<32,4,8> write/read, circular wrap, seq_len, reset
#include <kv_cache.h>
#include <cassert>
#include <cstdio>

using namespace opentaalas;

int main() {
  KvCache<32, 4, 8> kv;

  // --- Write K and V entries, read back ---
  kv.append_k(uint12(0), uint4(0), uint7(0), int8(42));
  kv.append_v(uint12(0), uint4(0), uint7(0), int8(-17));
  assert(kv.read_k(uint12(0), uint4(0), uint7(0)) == 42);
  assert(kv.read_v(uint12(0), uint4(0), uint7(0)) == -17);

  // Different head and dim
  kv.append_k(uint12(1), uint4(3), uint7(7), int8(100));
  kv.append_v(uint12(1), uint4(3), uint7(7), int8(-100));
  assert(kv.read_k(uint12(1), uint4(3), uint7(7)) == 100);
  assert(kv.read_v(uint12(1), uint4(3), uint7(7)) == -100);

  // Verify non-interference: original entry unchanged
  assert(kv.read_k(uint12(0), uint4(0), uint7(0)) == 42);

  // --- advance_write_ptr: seq_len tracking ---
  assert(kv.get_seq_len() == 0);
  kv.advance_write_ptr();
  assert(kv.get_seq_len() == 1);
  kv.advance_write_ptr();
  kv.advance_write_ptr();
  assert(kv.get_seq_len() == 3);

  // --- Circular wrap at TOKENS-1 (31) ---
  kv.reset();
  assert(kv.get_seq_len() == 0);
  for (int i = 0; i < 32; i++)
    kv.advance_write_ptr();
  assert(kv.get_seq_len() == 32); // capped at TOKENS

  // One more should not exceed TOKENS
  kv.advance_write_ptr();
  assert(kv.get_seq_len() == 32);

  // --- Reset clears pointers ---
  kv.reset();
  assert(kv.get_seq_len() == 0);

  std::printf("PASS: test_kv_cache\n");
  return 0;
}
