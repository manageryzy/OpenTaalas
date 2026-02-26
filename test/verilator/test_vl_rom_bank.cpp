// test_vl_rom_bank.cpp — Verilator co-simulation tests for rom_bank
// Mirrors test/systemc/test_rom_bank.cpp against the Kanagawa-generated RTL.
//
// The RTL exposes byte-level access (write_byte/read_byte) rather than the
// block-level API used in the SystemC model.  We write individual bytes to
// construct IQ3SBlock data, then verify the accessor methods.
//
// IQ3SBlock layout (32 bytes per block, little-endian):
//   [0..1]   d_bf16       (super-scale)
//   [2..17]  qs[16]       (codebook indices, low 8 bits)
//   [18..19] qh[2]        (codebook index high bits)
//   [20..23] signs[4]
//   [24..25] scales[2]    (sub-scales, packed nibbles)
//   [26..31] padding

#include "kanagawa_harness.h"
#include "Vrom_bank.h"

#include <cassert>
#include <cstdint>
#include <cstdio>

using Harness = KanagawaHarness<Vrom_bank>;

// ---------- low-level helpers ----------

static void call_write_byte(Harness& h, uint16_t block_addr,
                            uint8_t byte_offset, uint8_t value) {
  auto* d = h.dut();
  h.wait_ready(d->write_byte_rdy_out);
  d->write_byte_valid_in = 1;
  d->write_byte_block_addr_in = block_addr;
  d->write_byte_byte_offset_in = byte_offset;
  d->write_byte_value_in = value;
  h.tick();
  d->write_byte_valid_in = 0;
  h.drain_fifo(d->write_byte_rden_in, d->write_byte_empty_out);
}

static uint8_t call_read_byte(Harness& h, uint16_t block_addr,
                              uint8_t byte_offset) {
  auto* d = h.dut();
  h.wait_ready(d->read_byte_rdy_out);
  d->read_byte_valid_in = 1;
  d->read_byte_block_addr_in = block_addr;
  d->read_byte_byte_offset_in = byte_offset;
  h.tick();
  d->read_byte_valid_in = 0;
  return h.read_fifo(d->read_byte_rden_in, d->read_byte_empty_out,
                     d->read_byte_result_out);
}

static uint16_t call_get_super_scale(Harness& h, uint16_t block_addr) {
  auto* d = h.dut();
  h.wait_ready(d->get_super_scale_rdy_out);
  d->get_super_scale_valid_in = 1;
  d->get_super_scale_block_addr_in = block_addr;
  h.tick();
  d->get_super_scale_valid_in = 0;
  return h.read_fifo(d->get_super_scale_rden_in, d->get_super_scale_empty_out,
                     d->get_super_scale_result_out);
}

static uint16_t call_get_codebook_index(Harness& h, uint16_t block_addr,
                                        uint8_t group_in_block) {
  auto* d = h.dut();
  h.wait_ready(d->get_codebook_index_rdy_out);
  d->get_codebook_index_valid_in = 1;
  d->get_codebook_index_block_addr_in = block_addr;
  d->get_codebook_index_group_in_block_in = group_in_block;
  h.tick();
  d->get_codebook_index_valid_in = 0;
  return h.read_fifo(d->get_codebook_index_rden_in,
                     d->get_codebook_index_empty_out,
                     d->get_codebook_index_result_out);
}

static uint8_t call_get_sign(Harness& h, uint16_t block_addr,
                             uint8_t weight_in_block) {
  auto* d = h.dut();
  h.wait_ready(d->get_sign_rdy_out);
  d->get_sign_valid_in = 1;
  d->get_sign_block_addr_in = block_addr;
  d->get_sign_weight_in_block_in = weight_in_block;
  h.tick();
  d->get_sign_valid_in = 0;
  return h.read_fifo(d->get_sign_rden_in, d->get_sign_empty_out,
                     d->get_sign_result_out);
}

static uint8_t call_get_sub_scale(Harness& h, uint16_t block_addr,
                                  uint8_t sub_block_idx) {
  auto* d = h.dut();
  h.wait_ready(d->get_sub_scale_rdy_out);
  d->get_sub_scale_valid_in = 1;
  d->get_sub_scale_block_addr_in = block_addr;
  d->get_sub_scale_sub_block_idx_in = sub_block_idx;
  h.tick();
  d->get_sub_scale_valid_in = 0;
  return h.read_fifo(d->get_sub_scale_rden_in, d->get_sub_scale_empty_out,
                     d->get_sub_scale_result_out);
}

// ---------- block-level write helper ----------

// Write a minimal IQ3SBlock via byte-level writes.
struct IQ3SBlock {
  uint16_t d_bf16 = 0;
  uint8_t  qs[16] = {};
  uint8_t  qh[2]  = {};
  uint8_t  signs[4] = {};
  uint8_t  scales[2] = {};
};

static void write_block(Harness& h, uint16_t addr, const IQ3SBlock& blk) {
  // d_bf16: bytes 0-1 (little-endian)
  call_write_byte(h, addr, 0, blk.d_bf16 & 0xFF);
  call_write_byte(h, addr, 1, (blk.d_bf16 >> 8) & 0xFF);
  // qs[16]: bytes 2-17
  for (int i = 0; i < 16; ++i)
    call_write_byte(h, addr, 2 + i, blk.qs[i]);
  // qh[2]: bytes 18-19
  call_write_byte(h, addr, 18, blk.qh[0]);
  call_write_byte(h, addr, 19, blk.qh[1]);
  // signs[4]: bytes 20-23
  for (int i = 0; i < 4; ++i)
    call_write_byte(h, addr, 20 + i, blk.signs[i]);
  // scales[2]: bytes 24-25
  call_write_byte(h, addr, 24, blk.scales[0]);
  call_write_byte(h, addr, 25, blk.scales[1]);
}

// ---- Tests ----

static void test_write_read_round_trip() {
  Harness h;
  h.reset();

  IQ3SBlock blk;
  blk.d_bf16 = 0x3F80;
  blk.qs[0] = 0x42;
  blk.qh[0] = 0x01;
  blk.signs[0] = 0xA5;
  blk.scales[0] = 0x73;
  write_block(h, 0, blk);

  // Read back every written byte
  assert(call_read_byte(h, 0, 0) == 0x80);   // d_bf16 low
  assert(call_read_byte(h, 0, 1) == 0x3F);   // d_bf16 high
  assert(call_read_byte(h, 0, 2) == 0x42);   // qs[0]
  assert(call_read_byte(h, 0, 18) == 0x01);  // qh[0]
  assert(call_read_byte(h, 0, 20) == 0xA5);  // signs[0]
  assert(call_read_byte(h, 0, 24) == 0x73);  // scales[0]
  std::puts("[PASS] write/read byte round-trip");
}

static void test_get_codebook_index() {
  Harness h;
  h.reset();

  IQ3SBlock blk;
  blk.qs[0] = 0xAB;
  blk.qs[1] = 0xCD;
  blk.qh[0] = 0x02;  // bit 1 set
  write_block(h, 0, blk);

  // Group 0: index = qs[0] | ((qh[0] << 8) & 256) = 0xAB | 0 = 0xAB = 171
  assert(call_get_codebook_index(h, 0, 0) == 0xAB);
  // Group 1: index = qs[1] | ((qh[0] << 7) & 256) = 0xCD | 0x100 = 0x1CD = 461
  assert(call_get_codebook_index(h, 0, 1) == 461);
  std::puts("[PASS] get_codebook_index");
}

static void test_get_sign() {
  Harness h;
  h.reset();

  IQ3SBlock blk;
  blk.signs[0] = 0xA5;  // 10100101
  write_block(h, 0, blk);

  assert(call_get_sign(h, 0, 0) == 1);  // bit 0
  assert(call_get_sign(h, 0, 1) == 0);  // bit 1
  assert(call_get_sign(h, 0, 2) == 1);  // bit 2
  assert(call_get_sign(h, 0, 5) == 1);  // bit 5
  assert(call_get_sign(h, 0, 7) == 1);  // bit 7
  std::puts("[PASS] get_sign");
}

static void test_get_sub_scale() {
  Harness h;
  h.reset();

  IQ3SBlock blk;
  blk.scales[0] = 0x73;  // low=3, high=7
  blk.scales[1] = 0xBF;  // low=15, high=11
  write_block(h, 0, blk);

  assert(call_get_sub_scale(h, 0, 0) == 3);
  assert(call_get_sub_scale(h, 0, 1) == 7);
  assert(call_get_sub_scale(h, 0, 2) == 15);
  assert(call_get_sub_scale(h, 0, 3) == 11);
  std::puts("[PASS] get_sub_scale");
}

static void test_get_super_scale() {
  Harness h;
  h.reset();

  IQ3SBlock blk;
  blk.d_bf16 = 0x4000;  // BF16(2.0)
  write_block(h, 0, blk);

  assert(call_get_super_scale(h, 0) == 0x4000);
  std::puts("[PASS] get_super_scale");
}

static void test_multiple_blocks() {
  Harness h;
  h.reset();

  for (int i = 0; i < 4; ++i) {
    IQ3SBlock blk;
    blk.d_bf16 = 0x3F80 + i;
    blk.qs[0] = i * 10;
    write_block(h, i, blk);
  }
  for (int i = 0; i < 4; ++i) {
    assert(call_get_super_scale(h, i) == (uint16_t)(0x3F80 + i));
    assert(call_read_byte(h, i, 2) == (uint8_t)(i * 10));  // qs[0]
  }
  std::puts("[PASS] multiple blocks");
}

int main() {
  test_write_read_round_trip();
  test_get_codebook_index();
  test_get_sign();
  test_get_sub_scale();
  test_get_super_scale();
  test_multiple_blocks();
  std::puts("\nAll rom_bank Verilator co-sim tests passed.");
  return 0;
}
