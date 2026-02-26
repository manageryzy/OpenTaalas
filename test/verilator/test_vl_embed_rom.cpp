// test_vl_embed_rom.cpp — Verilator co-simulation tests for embed_rom
// Mirrors test/systemc/test_embed_rom.cpp against the Kanagawa-generated RTL.
//
// embed_rom stores 3-bit values (uint3) indexed by (token_id, dim_idx).

#include "kanagawa_harness.h"
#include "Vembed_rom.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vembed_rom>;

// ---------------------------------------------------------------------------
// Method wrappers
// ---------------------------------------------------------------------------

// --- write_weight: token_id_in[16:0], dim_idx_in[11:0], value_in[2:0] → void
static void call_write_weight(Harness& h, uint32_t token_id, uint16_t dim_idx,
                              uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->write_weight_rdy_out);
  d->write_weight_valid_in = 1;
  d->write_weight_token_id_in = token_id;
  d->write_weight_dim_idx_in = dim_idx;
  d->write_weight_value_in = value & 0x7;
  h.tick();
  d->write_weight_valid_in = 0;
  h.drain_fifo(d->write_weight_rden_in, d->write_weight_empty_out);
}

// --- read_weight: token_id_in[16:0], dim_idx_in[11:0] → result_out[2:0]
static uint8_t call_read_weight(Harness& h, uint32_t token_id,
                                uint16_t dim_idx) {
  auto* d = h.dut();
  h.wait_ready(d->read_weight_rdy_out);
  d->read_weight_valid_in = 1;
  d->read_weight_token_id_in = token_id;
  d->read_weight_dim_idx_in = dim_idx;
  h.tick();
  d->read_weight_valid_in = 0;
  return h.read_fifo(d->read_weight_rden_in, d->read_weight_empty_out,
                     d->read_weight_result_out);
}

// --- set_bank_scale: value_in[7:0] → void
static void call_set_bank_scale(Harness& h, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_bank_scale_rdy_out);
  d->set_bank_scale_valid_in = 1;
  d->set_bank_scale_value_in = value;
  h.tick();
  d->set_bank_scale_valid_in = 0;
  h.drain_fifo(d->set_bank_scale_rden_in, d->set_bank_scale_empty_out);
}

// --- set_tensor_scale: value_in[31:0] → void
static void call_set_tensor_scale(Harness& h, uint32_t value) {
  auto* d = h.dut();
  h.wait_ready(d->set_tensor_scale_rdy_out);
  d->set_tensor_scale_valid_in = 1;
  d->set_tensor_scale_value_in = value;
  h.tick();
  d->set_tensor_scale_valid_in = 0;
  h.drain_fifo(d->set_tensor_scale_rden_in, d->set_tensor_scale_empty_out);
}

// --- get_bank_scale: → result_out[7:0]
static uint8_t call_get_bank_scale(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_bank_scale_rdy_out);
  d->get_bank_scale_valid_in = 1;
  h.tick();
  d->get_bank_scale_valid_in = 0;
  return h.read_fifo(d->get_bank_scale_rden_in, d->get_bank_scale_empty_out,
                     d->get_bank_scale_result_out);
}

// --- get_tensor_scale: → result_out[31:0]
static uint32_t call_get_tensor_scale(Harness& h) {
  auto* d = h.dut();
  h.wait_ready(d->get_tensor_scale_rdy_out);
  d->get_tensor_scale_valid_in = 1;
  h.tick();
  d->get_tensor_scale_valid_in = 0;
  return h.read_fifo(d->get_tensor_scale_rden_in,
                     d->get_tensor_scale_empty_out,
                     d->get_tensor_scale_result_out);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

static void test_write_read_roundtrip() {
  Harness h;
  h.reset();

  call_write_weight(h, 3, 7, 5);
  assert(call_read_weight(h, 3, 7) == 5);

  // Unwritten location should read 0
  assert(call_read_weight(h, 3, 8) == 0);

  std::puts("[PASS] write_read_roundtrip: write(3,7,5)=5, read(3,8)=0");
}

static void test_different_values() {
  Harness h;
  h.reset();

  call_write_weight(h, 0, 0, 0);
  call_write_weight(h, 0, 1, 3);
  call_write_weight(h, 0, 2, 7);
  call_write_weight(h, 1, 0, 1);
  call_write_weight(h, 1, 1, 6);

  assert(call_read_weight(h, 0, 0) == 0);
  assert(call_read_weight(h, 0, 1) == 3);
  assert(call_read_weight(h, 0, 2) == 7);
  assert(call_read_weight(h, 1, 0) == 1);
  assert(call_read_weight(h, 1, 1) == 6);

  std::puts("[PASS] different_values: 3-bit values at various positions");
}

static void test_different_tokens() {
  Harness h;
  h.reset();

  call_write_weight(h, 0, 0, 2);
  call_write_weight(h, 1, 0, 4);
  call_write_weight(h, 63, 0, 7);

  assert(call_read_weight(h, 0, 0) == 2);
  assert(call_read_weight(h, 1, 0) == 4);
  assert(call_read_weight(h, 63, 0) == 7);

  // Verify non-interference: writing to token 63 didn't affect token 0
  assert(call_read_weight(h, 0, 0) == 2);

  std::puts("[PASS] different_tokens: tokens 0,1,63 non-interference");
}

static void test_bank_scale() {
  Harness h;
  h.reset();

  call_set_bank_scale(h, 0xAB);
  assert(call_get_bank_scale(h) == 0xAB);

  call_set_bank_scale(h, 0x00);
  assert(call_get_bank_scale(h) == 0x00);

  call_set_bank_scale(h, 0xFF);
  assert(call_get_bank_scale(h) == 0xFF);

  std::puts("[PASS] bank_scale: set/get 0xAB, 0x00, 0xFF");
}

static void test_tensor_scale() {
  Harness h;
  h.reset();

  call_set_tensor_scale(h, 0xDEADBEEF);
  assert(call_get_tensor_scale(h) == 0xDEADBEEF);

  call_set_tensor_scale(h, 0x00000000);
  assert(call_get_tensor_scale(h) == 0x00000000);

  call_set_tensor_scale(h, 0xFFFFFFFF);
  assert(call_get_tensor_scale(h) == 0xFFFFFFFF);

  std::puts("[PASS] tensor_scale: set/get 0xDEADBEEF, 0, 0xFFFFFFFF");
}

int main() {
  test_write_read_roundtrip();
  test_different_values();
  test_different_tokens();
  test_bank_scale();
  test_tensor_scale();
  std::puts("\nAll embed_rom Verilator co-sim tests passed.");
  return 0;
}
