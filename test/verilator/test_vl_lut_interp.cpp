// test_vl_lut_interp.cpp — Verilator co-simulation tests for lut_unit
// Mirrors test/systemc/test_lut_interp.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vlut_unit.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vlut_unit>;

static void call_set_entry(Harness& h, uint8_t index, uint16_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_entry_rdy_out);
  d->set_entry_valid_in = 1;
  d->set_entry_index_in = index;
  d->set_entry_value_in = value;
  h.tick();
  d->set_entry_valid_in = 0;
  h.drain_fifo(d->set_entry_rden_in, d->set_entry_empty_out);
}

static uint16_t call_get_entry(Harness& h, uint8_t index) {
  auto* d = h.dut();
  h.wait_ready(d->get_entry_rdy_out);
  d->get_entry_valid_in = 1;
  d->get_entry_index_in = index;
  h.tick();
  d->get_entry_valid_in = 0;
  return h.read_fifo(d->get_entry_rden_in, d->get_entry_empty_out,
                     d->get_entry_result_out);
}

static uint16_t call_lookup(Harness& h, uint16_t input) {
  auto* d = h.dut();
  h.wait_ready(d->lookup_rdy_out);
  d->lookup_valid_in = 1;
  d->lookup_input_in = input;
  h.tick();
  d->lookup_valid_in = 0;
  return h.read_fifo(d->lookup_rden_in, d->lookup_empty_out,
                     d->lookup_result_out);
}

static void test_set_get_round_trip() {
  Harness h;
  h.reset();
  for (int i = 0; i < 256; ++i)
    call_set_entry(h, i, (i * 100) & 0xFFFF);
  for (int i = 0; i < 256; ++i)
    assert(call_get_entry(h, i) == ((i * 100) & 0xFFFF));
  std::puts("[PASS] set_get_round_trip");
}

static void test_lookup_frac_below_128() {
  Harness h;
  h.reset();
  for (int i = 0; i < 256; ++i)
    call_set_entry(h, i, (i * 100) & 0xFFFF);

  // index=5, frac=0
  assert(call_lookup(h, (5 << 8) | 0) == 500);
  // index=5, frac=127
  assert(call_lookup(h, (5 << 8) | 127) == 500);
  std::puts("[PASS] lookup frac < 128 returns table[index]");
}

static void test_lookup_frac_ge_128() {
  Harness h;
  h.reset();
  for (int i = 0; i < 256; ++i)
    call_set_entry(h, i, (i * 100) & 0xFFFF);

  // index=5, frac=128 -> table[6] = 600
  assert(call_lookup(h, (5 << 8) | 128) == 600);
  // index=5, frac=255 -> table[6] = 600
  assert(call_lookup(h, (5 << 8) | 255) == 600);
  std::puts("[PASS] lookup frac >= 128 returns table[index+1]");
}

static void test_lookup_index255_clamp() {
  Harness h;
  h.reset();
  for (int i = 0; i < 256; ++i)
    call_set_entry(h, i, (i * 100) & 0xFFFF);

  uint16_t expected = (255 * 100) & 0xFFFF;
  // index=255, frac=200 -> clamps to table[255]
  assert(call_lookup(h, (255 << 8) | 200) == expected);
  // index=255, frac=128 -> clamps to table[255]
  assert(call_lookup(h, (255 << 8) | 128) == expected);
  std::puts("[PASS] lookup index=255 clamp");
}

static void test_lookup_zero() {
  Harness h;
  h.reset();
  for (int i = 0; i < 256; ++i)
    call_set_entry(h, i, (i * 100) & 0xFFFF);

  // index=0, frac=0 -> table[0] = 0
  assert(call_lookup(h, 0) == 0);
  std::puts("[PASS] lookup zero");
}

static void test_lookup_index254_frac255() {
  Harness h;
  h.reset();
  for (int i = 0; i < 256; ++i)
    call_set_entry(h, i, (i * 100) & 0xFFFF);

  uint16_t expected = (255 * 100) & 0xFFFF;
  // index=254, frac=255 -> table[255]
  assert(call_lookup(h, (254 << 8) | 255) == expected);
  std::puts("[PASS] lookup index=254 frac=255");
}

int main() {
  test_set_get_round_trip();
  test_lookup_frac_below_128();
  test_lookup_frac_ge_128();
  test_lookup_index255_clamp();
  test_lookup_zero();
  test_lookup_index254_frac255();
  std::puts("\nAll lut_interp Verilator co-sim tests passed.");
  return 0;
}
