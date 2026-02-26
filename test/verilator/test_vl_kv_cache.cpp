// test_vl_kv_cache.cpp — Verilator co-simulation tests for kv_cache
// Mirrors test/systemc/test_kv_cache.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vkv_cache.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vkv_cache>;

// --- append_k: void (drive inputs, drain FIFO) ---
static void call_append_k(Harness& h, uint16_t pos, uint8_t head,
                           uint8_t dim, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->append_k_rdy_out);
  d->append_k_valid_in = 1;
  d->append_k_token_pos_in = pos & 0xFFF;
  d->append_k_head_id_in = head & 0xF;
  d->append_k_dim_idx_in = dim & 0x7F;
  d->append_k_value_in = value;
  h.tick();
  d->append_k_valid_in = 0;
  h.drain_fifo(d->append_k_rden_in, d->append_k_empty_out);
}

// --- append_v: void ---
static void call_append_v(Harness& h, uint16_t pos, uint8_t head,
                           uint8_t dim, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->append_v_rdy_out);
  d->append_v_valid_in = 1;
  d->append_v_token_pos_in = pos & 0xFFF;
  d->append_v_head_id_in = head & 0xF;
  d->append_v_dim_idx_in = dim & 0x7F;
  d->append_v_value_in = value;
  h.tick();
  d->append_v_valid_in = 0;
  h.drain_fifo(d->append_v_rden_in, d->append_v_empty_out);
}

// --- read_k: returns uint8_t ---
static uint8_t call_read_k(Harness& h, uint16_t pos, uint8_t head,
                            uint8_t dim) {
  auto* d = h.dut();
  h.wait_ready(d->read_k_rdy_out);
  d->read_k_valid_in = 1;
  d->read_k_token_pos_in = pos & 0xFFF;
  d->read_k_head_id_in = head & 0xF;
  d->read_k_dim_idx_in = dim & 0x7F;
  h.tick();
  d->read_k_valid_in = 0;
  return h.read_fifo(d->read_k_rden_in, d->read_k_empty_out,
                     d->read_k_result_out);
}

// --- read_v: returns uint8_t ---
static uint8_t call_read_v(Harness& h, uint16_t pos, uint8_t head,
                            uint8_t dim) {
  auto* d = h.dut();
  h.wait_ready(d->read_v_rdy_out);
  d->read_v_valid_in = 1;
  d->read_v_token_pos_in = pos & 0xFFF;
  d->read_v_head_id_in = head & 0xF;
  d->read_v_dim_idx_in = dim & 0x7F;
  h.tick();
  d->read_v_valid_in = 0;
  return h.read_fifo(d->read_v_rden_in, d->read_v_empty_out,
                     d->read_v_result_out);
}

// --- advance_write_ptr: void ---
static void call_advance_write_ptr(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->advance_write_ptr_rdy_out);
  d->advance_write_ptr_valid_in = 1;
  h.tick();
  d->advance_write_ptr_valid_in = 0;
  h.drain_fifo(d->advance_write_ptr_rden_in, d->advance_write_ptr_empty_out);
}

// --- get_seq_len: returns uint16_t (12-bit) ---
static uint16_t call_get_seq_len(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_seq_len_rdy_out);
  d->get_seq_len_valid_in = 1;
  h.tick();
  d->get_seq_len_valid_in = 0;
  return h.read_fifo(d->get_seq_len_rden_in, d->get_seq_len_empty_out,
                     d->get_seq_len_result_out);
}

// --- reset (method): void ---
static void call_reset(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->reset_rdy_out);
  d->reset_valid_in = 1;
  h.tick();
  d->reset_valid_in = 0;
  h.drain_fifo(d->reset_rden_in, d->reset_empty_out);
}

// ---- Tests ----

static void test_write_read_kv_basic() {
  Harness h;
  h.reset();

  // Write K=42 and V=0xEF (-17 as int8) at (pos=0, head=0, dim=0)
  call_append_k(h, 0, 0, 0, 42);
  call_append_v(h, 0, 0, 0, static_cast<uint8_t>(static_cast<int8_t>(-17)));

  uint8_t k_raw = call_read_k(h, 0, 0, 0);
  uint8_t v_raw = call_read_v(h, 0, 0, 0);

  assert(k_raw == 42);
  assert(static_cast<int8_t>(v_raw) == -17);
  std::puts("[PASS] write/read K/V basic (42, -17)");
}

static void test_non_interference() {
  Harness h;
  h.reset();

  // Write at (pos=0, head=0, dim=0)
  call_append_k(h, 0, 0, 0, 42);
  call_append_v(h, 0, 0, 0, static_cast<uint8_t>(static_cast<int8_t>(-17)));

  // Write at (pos=1, head=3, dim=7)
  call_append_k(h, 1, 3, 7, 99);
  call_append_v(h, 1, 3, 7, 200);

  // Verify first location unchanged
  assert(call_read_k(h, 0, 0, 0) == 42);
  assert(static_cast<int8_t>(call_read_v(h, 0, 0, 0)) == -17);

  // Verify second location
  assert(call_read_k(h, 1, 3, 7) == 99);
  assert(call_read_v(h, 1, 3, 7) == 200);
  std::puts("[PASS] non-interference between different (pos,head,dim)");
}

static void test_advance_write_ptr_seq_len() {
  Harness h;
  h.reset();

  assert(call_get_seq_len(h) == 0);

  call_advance_write_ptr(h);
  assert(call_get_seq_len(h) == 1);

  call_advance_write_ptr(h);
  call_advance_write_ptr(h);
  assert(call_get_seq_len(h) == 3);
  std::puts("[PASS] advance_write_ptr: seq_len 0 -> 1 -> 3");
}

static void test_reset_seq_len() {
  Harness h;
  h.reset();

  call_advance_write_ptr(h);
  call_advance_write_ptr(h);
  assert(call_get_seq_len(h) == 2);

  call_reset(h);
  assert(call_get_seq_len(h) == 0);
  std::puts("[PASS] reset: seq_len back to 0");
}

static void test_circular_wrap() {
  Harness h;
  h.reset();

  // Advance 32 times
  for (int i = 0; i < 32; ++i)
    call_advance_write_ptr(h);
  assert(call_get_seq_len(h) == 32);

  // One more — should saturate or wrap at 32
  call_advance_write_ptr(h);
  assert(call_get_seq_len(h) == 32);
  std::puts("[PASS] circular wrap: 32 advances -> 32, one more -> still 32");
}

int main() {
  test_write_read_kv_basic();
  test_non_interference();
  test_advance_write_ptr_seq_len();
  test_reset_seq_len();
  test_circular_wrap();
  std::puts("\nAll kv_cache Verilator co-sim tests passed.");
  return 0;
}
