// test_vl_attention_unit.cpp — Verilator co-simulation tests for attention_unit
// Mirrors test/systemc/test_attention_unit.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vattention_unit.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vattention_unit>;

// --- dot_product: returns int32 (accumulates internally) ---
static int32_t call_dot_product(Harness& h, int8_t q, int8_t k) {
  auto* d = h.dut();
  h.wait_ready(d->dot_product_rdy_out);
  d->dot_product_valid_in = 1;
  d->dot_product_q_elem_in = static_cast<uint8_t>(q);
  d->dot_product_k_elem_in = static_cast<uint8_t>(k);
  h.tick();
  d->dot_product_valid_in = 0;
  uint32_t raw = h.read_fifo(d->dot_product_rden_in, d->dot_product_empty_out,
                              d->dot_product_result_out);
  return static_cast<int32_t>(raw);
}

// --- read_score: returns int32 ---
static int32_t call_read_score(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->read_score_rdy_out);
  d->read_score_valid_in = 1;
  h.tick();
  d->read_score_valid_in = 0;
  uint32_t raw = h.read_fifo(d->read_score_rden_in, d->read_score_empty_out,
                              d->read_score_result_out);
  return static_cast<int32_t>(raw);
}

// --- clear_score: void ---
static void call_clear_score(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->clear_score_rdy_out);
  d->clear_score_valid_in = 1;
  h.tick();
  d->clear_score_valid_in = 0;
  h.drain_fifo(d->clear_score_rden_in, d->clear_score_empty_out);
}

// --- set_max_score: void ---
static void call_set_max_score(Harness& h, int32_t score) {
  auto* d = h.dut();
  h.wait_ready(d->set_max_score_rdy_out);
  d->set_max_score_valid_in = 1;
  d->set_max_score_score_in = static_cast<uint32_t>(score);
  h.tick();
  d->set_max_score_valid_in = 0;
  h.drain_fifo(d->set_max_score_rden_in, d->set_max_score_empty_out);
}

// --- get_max_score: returns int32 ---
static int32_t call_get_max_score(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_max_score_rdy_out);
  d->get_max_score_valid_in = 1;
  h.tick();
  d->get_max_score_valid_in = 0;
  uint32_t raw = h.read_fifo(d->get_max_score_rden_in,
                              d->get_max_score_empty_out,
                              d->get_max_score_result_out);
  return static_cast<int32_t>(raw);
}

// ---- Tests ----

static void test_dot_product_accumulation() {
  Harness h;
  h.reset();

  // dot_product(3, 4) -> 12
  int32_t r1 = call_dot_product(h, 3, 4);
  assert(r1 == 12);

  // dot_product(5, 6) -> 12 + 30 = 42
  int32_t r2 = call_dot_product(h, 5, 6);
  assert(r2 == 42);

  // read_score -> 42
  assert(call_read_score(h) == 42);
  std::puts("[PASS] dot_product accumulation: 3*4=12, +5*6=42");
}

static void test_dot_product_negative() {
  Harness h;
  h.reset();

  call_dot_product(h, 3, 4);   // 12
  call_dot_product(h, 5, 6);   // 42

  // dot_product(-2, 10) -> 42 + (-20) = 22
  int32_t r3 = call_dot_product(h, -2, 10);
  assert(r3 == 22);
  std::puts("[PASS] dot_product with negative: 42 + (-2)*10 = 22");
}

static void test_clear_score() {
  Harness h;
  h.reset();

  call_dot_product(h, 3, 4);
  call_dot_product(h, 5, 6);
  assert(call_read_score(h) == 42);

  call_clear_score(h);
  assert(call_read_score(h) == 0);
  std::puts("[PASS] clear_score resets accumulator to 0");
}

static void test_dot_product_after_clear() {
  Harness h;
  h.reset();

  call_dot_product(h, 3, 4);
  call_clear_score(h);

  // Fresh accumulation after clear
  int32_t r = call_dot_product(h, 7, 7);
  assert(r == 49);
  std::puts("[PASS] dot_product after clear: 7*7 = 49");
}

static void test_set_get_max_score() {
  Harness h;
  h.reset();

  call_set_max_score(h, 100);
  assert(call_get_max_score(h) == 100);

  call_set_max_score(h, -50);
  assert(call_get_max_score(h) == -50);
  std::puts("[PASS] set/get max_score: 100, then -50");
}

int main() {
  test_dot_product_accumulation();
  test_dot_product_negative();
  test_clear_score();
  test_dot_product_after_clear();
  test_set_get_max_score();
  std::puts("\nAll attention_unit Verilator co-sim tests passed.");
  return 0;
}
