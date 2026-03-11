#pragma once
#include <opentaalas/types.h>
#include <array>
#include <mac_pe.h>
#include <dequant.h>
#include <rom_bank.h>
#include <codebook_decoder.h>

namespace opentaalas {

// IQ3_S MAC Array GEMV Engine
// Composes: 4x MacPE + RomBank + CodebookDecoder + DequantUnit + FP32 accumulators
class MacArray {
 public:
  MacArray() {
    for (int i = 0; i < 4; ++i) _fp32_accum[i] = 0.0f;
  }

  // --- Weight ROM access ---
  void write_block(int block_addr, const IQ3SBlock& blk) {
    _rom.write_block(block_addr, blk);
  }

  IQ3SBlock read_block(int block_addr) const {
    return _rom.read_block(block_addr);
  }

  // --- MAC operations ---
  int24 mac_step(int pe_id, uint4 magnitude, uint1 sign, int8 activation) {
    return _pe[pe_id].mac(magnitude, sign, activation);
  }

  int24 read_accum(int pe_id) const {
    return _pe[pe_id].read_accum();
  }

  // --- Dequantization ---
  float read_dequant(int pe_id, uint16 super_scale_bf16, uint4 sub_scale) const {
    return _dequant.dequantize(_pe[pe_id].read_accum(), super_scale_bf16, sub_scale);
  }

  // --- FP32 row accumulator ---
  void accumulate_fp32(int pe_id, float partial) {
    _fp32_accum[pe_id] += partial;
  }

  float read_fp32_accum(int pe_id) const {
    return _fp32_accum[pe_id];
  }

  // --- Codebook decode ---
  void decode_codebook(uint9 index, uint4& m0, uint4& m1, uint4& m2, uint4& m3) const {
    _codebook.decode(index, m0, m1, m2, m3);
  }

  // Wide-word ROM access (matches RTL 880-bit interface)
  std::array<uint8_t, 110> read_rom_block_bytes(int block_addr) const {
    return _rom.read_block_bytes(block_addr);
  }

  // Raw codebook grid read (matches RTL read_grid)
  uint32_t read_grid_raw(int index) const {
    return _codebook.read_raw(index);
  }

  // --- Control ---
  void clear_pe(int pe_id) {
    _pe[pe_id].clear();
  }

  void clear_fp32(int pe_id) {
    _fp32_accum[pe_id] = 0.0f;
  }

  void clear_all() {
    for (int i = 0; i < 4; ++i) {
      _pe[i].clear();
      _fp32_accum[i] = 0.0f;
    }
  }

 private:
  MacPE _pe[4];
  RomBank _rom;
  CodebookDecoder _codebook;
  DequantUnit _dequant;
  float _fp32_accum[4];
};

}  // namespace opentaalas
