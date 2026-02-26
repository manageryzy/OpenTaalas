#pragma once
// CModelRunner — Skeleton forward pass for LLaMA using SystemC reference models.
// Pipeline: embed → per-layer(RMSNorm → MAC Q-proj → dequant) → LM head argmax.
// Full attention/MLP pipeline marked as TODO.

#include "gguf_converter.h"
#include "tensor_io.h"
#include <bf16_math.h>
#include <embed_rom.h>
#include <mac_array.h>
#include <lm_head.h>
#include <rmsnorm.h>
#include <dequant.h>
#include <vector_unit.h>

#include <cstdio>
#include <cmath>
#include <string>
#include <vector>

namespace opentaalas {

// Small defaults for pipeline verification; real runs use full LLaMA dims.
template <int DIM = 64, int VOCAB = 256, int N_LAYERS = 2>
class CModelRunner {
 public:
  bool load_weights(const std::string& dir) {
    std::fprintf(stderr, "CModelRunner: loading weights from %s\n", dir.c_str());

    // --- Embedding ---
    auto emb = load_converted_tensor(dir, "token_embd.weight");
    if (emb.is_quantized && !emb.weights.empty()) {
      int rows = std::min((int)emb.rows, VOCAB);
      int cols = std::min((int)emb.cols, DIM);
      for (int r = 0; r < rows; r++)
        for (int c = 0; c < cols; c++)
          _embed.write_weight(uint17(r), uint12(c),
                              uint3(emb.weights[r * emb.cols + c] & 0x7));
      if (!emb.bank_scales.empty())
        _embed.set_bank_scale(uint8(emb.bank_scales[0]));
      float ts;
      std::memcpy(&ts, &emb.tensor_scale, sizeof(float));
      uint32_t ts_bits;
      std::memcpy(&ts_bits, &ts, 4);
      _embed.set_tensor_scale(uint32(ts_bits));
      std::fprintf(stderr, "  embed: %dx%d loaded\n", rows, cols);
    } else {
      std::fprintf(stderr, "  embed: not found or not quantized\n");
    }

    // --- Per-layer Q projection weights ---
    for (int l = 0; l < N_LAYERS; l++) {
      std::string name = "blk." + std::to_string(l) + ".attn_q.weight";
      auto t = load_converted_tensor(dir, name);
      if (t.is_quantized && !t.weights.empty()) {
        int rows = std::min((int)t.rows, DIM);
        int cols = std::min((int)t.cols, DIM);
        for (int r = 0; r < rows; r++)
          for (int c = 0; c < cols; c++)
            _q_proj[l].write_weight(uint12(r), uint13(c),
                                    uint3(t.weights[r * t.cols + c] & 0x7));
        if (!t.bank_scales.empty())
          _q_proj[l].set_bank_scale(uint8(t.bank_scales[0]));
        float ts = t.tensor_scale;
        uint32_t ts_bits;
        std::memcpy(&ts_bits, &ts, 4);
        _q_proj[l].set_tensor_scale(uint32(ts_bits));
        std::fprintf(stderr, "  layer %d q_proj: %dx%d loaded\n", l, rows, cols);
      }

      // --- RMSNorm gamma (pre-attention) ---
      std::string gname = "blk." + std::to_string(l) + ".attn_norm.weight";
      auto g = load_converted_tensor(dir, gname);
      if (!g.is_quantized && !g.float_data.empty()) {
        int n = std::min((int)g.float_data.size(), DIM);
        for (int i = 0; i < n; i++)
          _gamma[l][i] = bf16_from_float(g.float_data[i]);
      }
    }

    // --- LM head weights ---
    auto lm = load_converted_tensor(dir, "output.weight");
    if (lm.is_quantized && !lm.weights.empty()) {
      int rows = std::min((int)lm.rows, VOCAB);
      int cols = std::min((int)lm.cols, DIM);
      for (int r = 0; r < rows; r++)
        for (int c = 0; c < cols; c++)
          _lm_head.write_weight(uint17(r), uint12(c),
                                uint3(lm.weights[r * lm.cols + c] & 0x7));
      if (!lm.bank_scales.empty())
        _lm_head.set_bank_scale(uint8(lm.bank_scales[0]));
      float ts = lm.tensor_scale;
      uint32_t ts_bits;
      std::memcpy(&ts_bits, &ts, 4);
      _lm_head.set_tensor_scale(uint32(ts_bits));
      std::fprintf(stderr, "  lm_head: %dx%d loaded\n", rows, cols);
    }

    // --- Final norm gamma ---
    auto fn = load_converted_tensor(dir, "output_norm.weight");
    if (!fn.is_quantized && !fn.float_data.empty()) {
      int n = std::min((int)fn.float_data.size(), DIM);
      for (int i = 0; i < n; i++)
        _final_gamma[i] = bf16_from_float(fn.float_data[i]);
    }

    return true;
  }

  int run_token(int token_id, const std::string& output_dir) {
    std::fprintf(stderr, "CModelRunner: running token %d\n", token_id);

    // --- 1. Embedding lookup → BF16 hidden state ---
    std::vector<float> hidden(DIM);
    DequantUnit dq;
    uint8 emb_bs = _embed.get_bank_scale();
    uint32 emb_ts = _embed.get_tensor_scale();
    for (int i = 0; i < DIM; i++) {
      uint3 w = _embed.read_weight(uint17(token_id), uint12(i));
      // Treat weight as small signed int via MAC encoding, dequant
      auto w32 = static_cast<std::int32_t>(w.to_int());
      uint32 acc(static_cast<std::uint32_t>(w32));
      uint16 bf = dq.dequantize(acc, emb_bs, emb_ts);
      hidden[i] = bf16_to_float(bf);
    }
    dump_tensor(output_dir, "embed_out", hidden);

    // --- 2. Per-layer: RMSNorm → MAC Q-proj → dequant → dump ---
    for (int l = 0; l < N_LAYERS; l++) {
      // RMSNorm
      std::vector<float> normed(DIM);
      float sum_sq = 0;
      for (int i = 0; i < DIM; i++) sum_sq += hidden[i] * hidden[i];
      float rms = 1.0f / std::sqrt(sum_sq / DIM + 1e-5f);
      for (int i = 0; i < DIM; i++)
        normed[i] = hidden[i] * rms * bf16_to_float(_gamma[l][i]);
      dump_tensor(output_dir, "layer" + std::to_string(l) + "_rmsnorm", normed);

      // Quantize normed to int8 for MAC input
      float amax = 0;
      for (int i = 0; i < DIM; i++)
        amax = std::max(amax, std::fabs(normed[i]));
      float inv_scale = (amax > 0) ? 127.0f / amax : 0;

      // MAC Q-projection: [DIM x DIM] * [DIM] → [DIM]
      // Bank/tensor scales already loaded into MacArray; read_output uses them.
      std::vector<float> q_out(DIM);
      for (int r = 0; r < DIM; r++) {
        _q_proj[l].clear_pe(0);
        for (int c = 0; c < DIM; c++) {
          uint3 w = _q_proj[l].read_weight(uint12(r), uint13(c));
          auto a = static_cast<std::int8_t>(
              std::max(-127.0f, std::min(127.0f, normed[c] * inv_scale)));
          _q_proj[l].mac_step(0, w, int8(a));
        }
        uint16 bf = _q_proj[l].read_output(0);
        q_out[r] = bf16_to_float(bf);
      }
      dump_tensor(output_dir, "layer" + std::to_string(l) + "_q_proj", q_out);

      // TODO: K/V projections, RoPE, KV cache, attention, output projection
      // TODO: RMSNorm (pre-MLP), gate/up projections, SwiGLU, down projection
      // TODO: Residual connections

      // For skeleton: pass Q-proj output as next hidden state
      hidden = q_out;
    }

    // --- 3. Final RMSNorm ---
    float sum_sq = 0;
    for (int i = 0; i < DIM; i++) sum_sq += hidden[i] * hidden[i];
    float rms = 1.0f / std::sqrt(sum_sq / DIM + 1e-5f);
    for (int i = 0; i < DIM; i++)
      hidden[i] = hidden[i] * rms * bf16_to_float(_final_gamma[i]);
    dump_tensor(output_dir, "final_rmsnorm", hidden);

    // --- 4. LM head: MAC + argmax ---
    float amax = 0;
    for (int i = 0; i < DIM; i++)
      amax = std::max(amax, std::fabs(hidden[i]));
    float inv_scale = (amax > 0) ? 127.0f / amax : 0;

    _lm_head.reset_argmax();
    for (int v = 0; v < VOCAB; v++) {
      int32 acc(0);
      for (int c = 0; c < DIM; c++) {
        uint3 w = _lm_head.read_weight(uint17(v), uint12(c));
        auto a = static_cast<std::int8_t>(
            std::max(-127.0f, std::min(127.0f, hidden[c] * inv_scale)));
        // Manual MAC (LmHead has no mac_step)
        int32 ai(a);
        int32 product(0);
        int wv = w.to_int();
        if (wv == 0) product = int32(0);
        else if (wv == 1) product = ai;
        else if (wv == 2) product = ai << 1;
        else if (wv == 3) product = (ai << 1) + ai;
        else if (wv == 4) product = int32(0) - (ai << 2);
        else if (wv == 5) product = int32(0) - ((ai << 1) + ai);
        else if (wv == 6) product = int32(0) - (ai << 1);
        else product = int32(0) - ai;
        acc = acc + product;
      }
      _lm_head.update_argmax(uint17(v), acc);
    }

    int result = _lm_head.get_best_token().to_int();
    std::fprintf(stderr, "CModelRunner: predicted token = %d\n", result);
    return result;
  }

 private:
  EmbedRom<VOCAB, DIM> _embed;
  MacArray<DIM, DIM> _q_proj[N_LAYERS];
  LmHead<VOCAB, DIM> _lm_head;
  uint16 _gamma[N_LAYERS][DIM]{};
  uint16 _final_gamma[DIM]{};
};

} // namespace opentaalas
