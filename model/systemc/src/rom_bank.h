#pragma once
#include <opentaalas/types.h>
#include <array>
#include <cstdint>
#include <cstring>
#include <vector>

namespace opentaalas {

// IQ3_S block: 110 bytes for 256 weights (3.4375 bpw)
struct IQ3SBlock {
  uint16_t d_bf16;       // BF16 super-scale
  uint8_t qs[64];        // codebook indices, low 8 bits (64 groups of 4 weights)
  uint8_t qh[8];         // codebook indices, high 1 bit
  uint8_t signs[32];     // 1 sign bit per weight (256 bits)
  uint8_t scales[4];     // 4-bit sub-scales, packed pairs (8 sub-blocks of 32)
};
static_assert(sizeof(IQ3SBlock) == 110, "IQ3SBlock must be 110 bytes");

// Block-packed IQ3_S ROM bank
// Stores weight blocks in IQ3_S format. Addressed by block index.
class RomBank {
 public:
  RomBank() : _blocks(1024) {}  // default 1024 blocks (256K weights)
  explicit RomBank(int num_blocks) : _blocks(num_blocks) {}

  void write_block(int block_addr, const IQ3SBlock& blk) {
    _blocks[block_addr] = blk;
  }

  IQ3SBlock read_block(int block_addr) const {
    return _blocks[block_addr];
  }

  // Get 9-bit codebook index for weight group within a block
  // group_in_block: 0..63 (each group = 4 weights)
  // IQ3_S indexing follows llama.cpp dequantize_row_iq3_s:
  //   For sub-block pair ib32 (0..3 within half-block):
  //     l = group within sub-block pair (0..3)
  //     index = qs[2*l+0] | ((qh[half] << (8-2*l)) & 256)
  uint9 get_codebook_index(int block_addr, int group_in_block) const {
    const auto& blk = _blocks[block_addr];
    // Each half-block (128 weights) has 4 sub-block pairs, each with 4 groups
    int half = group_in_block / 32;          // 0 or 1
    int within_half = group_in_block % 32;
    int ib32_pair = within_half / 8;         // 0..3 (sub-block pair within half)
    int l = (within_half % 8) / 2;           // 0..3 (group pair within sub-block)
    int lr = within_half % 2;                // 0 or 1 (which of the pair)

    int qs_offset = half * 32 + ib32_pair * 8 + l * 2 + lr;
    int qh_idx = half * 4 + ib32_pair;
    int qh_shift = lr == 0 ? (8 - 2 * l) : (7 - 2 * l);

    uint16_t idx = blk.qs[qs_offset];
    idx |= ((blk.qh[qh_idx] << qh_shift) & 256);
    return uint9(idx);
  }

  // Get sign bit for a specific weight within a block (0..255)
  uint1 get_sign(int block_addr, int weight_in_block) const {
    const auto& blk = _blocks[block_addr];
    int byte_idx = weight_in_block / 8;
    int bit_idx = weight_in_block % 8;
    return uint1((blk.signs[byte_idx] >> bit_idx) & 1);
  }

  // Get 4-bit sub-scale for a sub-block (0..7, each = 32 weights)
  uint4 get_sub_scale(int block_addr, int sub_block_idx) const {
    const auto& blk = _blocks[block_addr];
    int byte_idx = sub_block_idx / 2;
    if (sub_block_idx % 2 == 0)
      return uint4(blk.scales[byte_idx] & 0xF);
    else
      return uint4(blk.scales[byte_idx] >> 4);
  }

  // Get BF16 super-scale for a block
  uint16 get_super_scale(int block_addr) const {
    return uint16(_blocks[block_addr].d_bf16);
  }

  // Pack IQ3SBlock into 110-byte array matching RTL 880-bit word layout:
  // bits [15:0]     d_bf16
  // bits [527:16]   qs[64]
  // bits [591:528]  qh[8]
  // bits [847:592]  signs[32]
  // bits [879:848]  scales[4]
  static std::array<uint8_t, 110> pack_block_bytes(const IQ3SBlock& blk) {
    std::array<uint8_t, 110> bytes{};
    bytes[0] = blk.d_bf16 & 0xFF;
    bytes[1] = (blk.d_bf16 >> 8) & 0xFF;
    std::memcpy(&bytes[2], blk.qs, 64);
    std::memcpy(&bytes[66], blk.qh, 8);
    std::memcpy(&bytes[74], blk.signs, 32);
    std::memcpy(&bytes[106], blk.scales, 4);
    return bytes;
  }

  // Read a block as 110-byte packed representation (matches RTL 880-bit word)
  std::array<uint8_t, 110> read_block_bytes(int block_addr) const {
    return pack_block_bytes(_blocks[block_addr]);
  }

 private:
  std::vector<IQ3SBlock> _blocks;
};

}  // namespace opentaalas
