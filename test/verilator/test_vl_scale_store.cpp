// test_vl_scale_store.cpp — Verilator co-simulation tests for scale_store
// Mirrors test/systemc/test_scale_store.cpp against the Kanagawa-generated RTL.

#include "kanagawa_harness.h"
#include "Vscale_store.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vscale_store>;

static void call_set_bank_scale(Harness& h, uint8_t bank_id, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_bank_scale_rdy_out);
  d->set_bank_scale_valid_in = 1;
  d->set_bank_scale_bank_id_in = bank_id & 0x1F;
  d->set_bank_scale_value_in = value;
  h.tick();
  d->set_bank_scale_valid_in = 0;
  h.drain_fifo(d->set_bank_scale_rden_in, d->set_bank_scale_empty_out);
}

static uint8_t call_get_bank_scale(Harness& h, uint8_t bank_id) {
  auto* d = h.dut();
  h.wait_ready(d->get_bank_scale_rdy_out);
  d->get_bank_scale_valid_in = 1;
  d->get_bank_scale_bank_id_in = bank_id & 0x1F;
  h.tick();
  d->get_bank_scale_valid_in = 0;
  return h.read_fifo(d->get_bank_scale_rden_in, d->get_bank_scale_empty_out,
                     d->get_bank_scale_result_out);
}

static void call_set_tensor_scale(Harness& h, uint8_t matrix_id, uint32_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_tensor_scale_rdy_out);
  d->set_tensor_scale_valid_in = 1;
  d->set_tensor_scale_matrix_id_in = matrix_id & 0x7;
  d->set_tensor_scale_value_in = value;
  h.tick();
  d->set_tensor_scale_valid_in = 0;
  h.drain_fifo(d->set_tensor_scale_rden_in, d->set_tensor_scale_empty_out);
}

static uint32_t call_get_tensor_scale(Harness& h, uint8_t matrix_id) {
  auto* d = h.dut();
  h.wait_ready(d->get_tensor_scale_rdy_out);
  d->get_tensor_scale_valid_in = 1;
  d->get_tensor_scale_matrix_id_in = matrix_id & 0x7;
  h.tick();
  d->get_tensor_scale_valid_in = 0;
  return h.read_fifo(d->get_tensor_scale_rden_in, d->get_tensor_scale_empty_out,
                     d->get_tensor_scale_result_out);
}

static void test_all_32_bank_scales() {
  Harness h;
  h.reset();
  for (int i = 0; i < 32; ++i)
    call_set_bank_scale(h, i, (i * 7 + 3) & 0xFF);
  for (int i = 0; i < 32; ++i)
    assert(call_get_bank_scale(h, i) == ((i * 7 + 3) & 0xFF));
  std::puts("[PASS] all 32 bank scales");
}

static void test_all_8_tensor_scales() {
  Harness h;
  h.reset();
  for (int i = 0; i < 8; ++i)
    call_set_tensor_scale(h, i, 0xDEAD0000u + i);
  for (int i = 0; i < 8; ++i)
    assert(call_get_tensor_scale(h, i) == 0xDEAD0000u + i);
  std::puts("[PASS] all 8 tensor scales");
}

static void test_bank_scale_boundaries() {
  Harness h;
  h.reset();
  call_set_bank_scale(h, 0, 0xAA);
  assert(call_get_bank_scale(h, 0) == 0xAA);
  call_set_bank_scale(h, 31, 0xBB);
  assert(call_get_bank_scale(h, 31) == 0xBB);
  std::puts("[PASS] bank scale boundaries");
}

static void test_tensor_scale_boundaries() {
  Harness h;
  h.reset();
  call_set_tensor_scale(h, 0, 0x11111111);
  assert(call_get_tensor_scale(h, 0) == 0x11111111);
  call_set_tensor_scale(h, 7, 0x77777777);
  assert(call_get_tensor_scale(h, 7) == 0x77777777);
  std::puts("[PASS] tensor scale boundaries");
}

static void test_bank_scale_overwrite() {
  Harness h;
  h.reset();
  call_set_bank_scale(h, 10, 0x01);
  assert(call_get_bank_scale(h, 10) == 0x01);
  call_set_bank_scale(h, 10, 0xFE);
  assert(call_get_bank_scale(h, 10) == 0xFE);
  std::puts("[PASS] bank scale overwrite");
}

int main() {
  test_all_32_bank_scales();
  test_all_8_tensor_scales();
  test_bank_scale_boundaries();
  test_tensor_scale_boundaries();
  test_bank_scale_overwrite();
  std::puts("\nAll scale_store Verilator co-sim tests passed.");
  return 0;
}
