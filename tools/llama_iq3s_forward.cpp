// llama_iq3s_forward.cpp — IQ3_S quantized forward pass using hardware compute path
// Codebook decode: 9-bit index -> iq3s_grid[] -> 4x magnitudes (odd: 1,3,5,...,15)
// MAC: (2k+1) x INT8 shift-and-add -> INT32 accumulator
// Dequant: INT32 x (1+2*sub_scale) x BF16(d) -> FP32
// Matches the OpenTaalas ASIC datapath for IQ3_S weights.

#include "gguf_converter.h"
#include "tensor_io.h"
#include "ggml.h"
#include "gguf.h"

#define GGML_COMMON_DECL_CPP
#define GGML_COMMON_IMPL_CPP
#include "ggml-common.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <climits>

// --- Model config (LLaMA 3.1 8B) ---
struct LlamaConfig {
  int dim        = 4096;
  int n_layers   = 32;
  int n_heads    = 32;
  int n_kv_heads = 8;
  int head_dim   = 128;
  int ffn_dim    = 14336;
  int vocab_size = 128256;
  float rope_theta = 500000.0f;
  float norm_eps   = 1e-5f;
};

// --- IQ3_S weight tensor (raw block pointers into GGUF mmap) ---
// For non-IQ3_S tensors (e.g. IQ2_S in IQ3_M), falls back to float.
struct IQ3SWeight {
  const void* data;  // pointer to block_iq3_s array in GGUF (null if fallback)
  int rows, cols;     // logical dimensions
  int n_blocks_per_row;  // cols / QK_K (256)
  std::vector<float> float_fallback;  // dequantized float data for non-IQ3_S tensors
  bool is_iq3s;       // true if IQ3_S, false if float fallback
};

struct IQ3SLayerWeights {
  std::vector<float> attn_norm;  // [dim] float
  IQ3SWeight wq, wk, wv, wo;
  std::vector<float> ffn_norm;   // [dim] float
  IQ3SWeight w_gate, w_up, w_down;
};

struct IQ3SModelWeights {
  LlamaConfig cfg;
  std::vector<float> tok_embd;    // [vocab * dim] dequantized to float
  std::vector<IQ3SLayerWeights> layers;
  std::vector<float> output_norm; // [dim] float
  std::vector<float> output_float; // [vocab * dim] float (Q6_K dequantized)
};

// --- FP16 -> BF16 truncation (simulates hardware) ---
static inline uint16_t fp16_to_bf16_hw(uint16_t fp16) {
  float f = opentaalas::fp16_to_float(fp16);
  uint32_t bits;
  std::memcpy(&bits, &f, 4);
  // Truncate lower 16 bits (round-to-nearest-even on bit 15)
  uint16_t bf16 = (uint16_t)(bits >> 16);
  if (bits & 0x8000) {  // round bit set
    if ((bits & 0x7FFF) || (bf16 & 1)) bf16++;  // round to even
  }
  return bf16;
}

static inline float bf16_to_float(uint16_t bf16) {
  uint32_t bits = (uint32_t)bf16 << 16;
  float f;
  std::memcpy(&f, &bits, 4);
  return f;
}

// --- IQ3_S MAC primitive: (2k+1) x INT8 shift-and-add ---
// magnitude is an odd value from iq3s_grid: 1,3,5,7,9,11,13,15
// k = magnitude >> 1 (0..7), so (2k+1) reconstructs the magnitude
// Hardware implements this as shift-and-add without a multiplier.
static inline int32_t mac_pe_iq3s(int magnitude, int sign, int8_t activation) {
  int k = magnitude >> 1;  // 0..7
  int32_t a = activation;
  // Compute k * a via shift-and-add
  int32_t ka = 0;
  if (k & 1) ka += a;
  if (k & 2) ka += (a << 1);
  if (k & 4) ka += (a << 2);
  // (2k+1)*a = 2*ka + a
  int32_t product = (ka << 1) + a;
  return sign ? -product : product;
}

// --- Quantize float activations to INT8 (symmetric, per-tensor) ---
static void quantize_to_int8(const float* input, int8_t* output, int n, float* out_scale) {
  float amax = 0;
  for (int i = 0; i < n; i++) {
    float a = std::fabs(input[i]);
    if (a > amax) amax = a;
  }
  float scale = amax / 127.0f;
  if (scale == 0) scale = 1.0f;
  *out_scale = scale;
  for (int i = 0; i < n; i++) {
    int v = (int)std::round(input[i] / scale);
    if (v > 127) v = 127;
    if (v < -128) v = -128;
    output[i] = (int8_t)v;
  }
}

// --- IQ3_S quantized GEMV ---
// Follows dequantize_row_iq3_s from ggml-quants.c exactly for bit extraction,
// but uses our hardware MAC + integer sub-scale + BF16 super-scale path.
static void iq3s_matvec(float* out, const IQ3SWeight& W,
                         const int8_t* x_q, float x_scale, int rows) {
  const block_iq3_s* all_blocks = reinterpret_cast<const block_iq3_s*>(W.data);
  int n_blocks_per_row = W.n_blocks_per_row;

  for (int r = 0; r < rows; r++) {
    float row_sum = 0.0f;
    const block_iq3_s* row_blocks = all_blocks + (int64_t)r * n_blocks_per_row;

    for (int b = 0; b < n_blocks_per_row; b++) {
      const block_iq3_s& blk = row_blocks[b];

      // FP16 super-scale -> BF16 -> float (simulates hardware truncation)
      uint16_t d_fp16;
      std::memcpy(&d_fp16, &blk.d, sizeof(uint16_t));
      float d = bf16_to_float(fp16_to_bf16_hw(d_fp16));

      const uint8_t* qs = blk.qs;
      const uint8_t* qh = blk.qh;
      const uint8_t* signs = blk.signs;
      const int8_t* act = x_q + b * QK_K;

      // Process 8 sub-blocks of 32 weights, paired as (ib32, ib32+1)
      // Follows the exact loop structure from dequantize_row_iq3_s
      for (int ib32 = 0; ib32 < QK_K / 32; ib32 += 2) {
        // Sub-scales: low nibble for first sub-block, high for second
        int sub_scale_lo = blk.scales[ib32 / 2] & 0xF;
        int sub_scale_hi = blk.scales[ib32 / 2] >> 4;

        // --- First sub-block (32 weights) ---
        int32_t accum0 = 0;
        for (int l = 0; l < 4; l++) {
          // 9-bit codebook indices
          uint16_t idx1 = qs[2 * l + 0] | ((qh[0] << (8 - 2 * l)) & 256);
          uint16_t idx2 = qs[2 * l + 1] | ((qh[0] << (7 - 2 * l)) & 256);
          const uint8_t* grid1 = reinterpret_cast<const uint8_t*>(iq3s_grid + idx1);
          const uint8_t* grid2 = reinterpret_cast<const uint8_t*>(iq3s_grid + idx2);
          uint8_t sign_byte = signs[l];

          // grid1: 4 weights, sign bits 0-3
          for (int j = 0; j < 4; j++) {
            int s = (sign_byte >> j) & 1;
            accum0 += mac_pe_iq3s(grid1[j], s, act[l * 8 + j]);
          }
          // grid2: 4 weights, sign bits 4-7
          for (int j = 0; j < 4; j++) {
            int s = (sign_byte >> (j + 4)) & 1;
            accum0 += mac_pe_iq3s(grid2[j], s, act[l * 8 + 4 + j]);
          }
        }
        // Hardware dequant: accum * int_scale * d
        int int_scale0 = 1 + 2 * sub_scale_lo;
        row_sum += (float)(accum0 * int_scale0) * d;

        // Advance pointers for second sub-block
        qs += 8;
        signs += 4;

        // --- Second sub-block (32 weights) ---
        int32_t accum1 = 0;
        for (int l = 0; l < 4; l++) {
          uint16_t idx1 = qs[2 * l + 0] | ((qh[1] << (8 - 2 * l)) & 256);
          uint16_t idx2 = qs[2 * l + 1] | ((qh[1] << (7 - 2 * l)) & 256);
          const uint8_t* grid1 = reinterpret_cast<const uint8_t*>(iq3s_grid + idx1);
          const uint8_t* grid2 = reinterpret_cast<const uint8_t*>(iq3s_grid + idx2);
          uint8_t sign_byte = signs[l];

          for (int j = 0; j < 4; j++) {
            int s = (sign_byte >> j) & 1;
            accum1 += mac_pe_iq3s(grid1[j], s, act[32 + l * 8 + j]);
          }
          for (int j = 0; j < 4; j++) {
            int s = (sign_byte >> (j + 4)) & 1;
            accum1 += mac_pe_iq3s(grid2[j], s, act[32 + l * 8 + 4 + j]);
          }
        }
        int int_scale1 = 1 + 2 * sub_scale_hi;
        row_sum += (float)(accum1 * int_scale1) * d;

        // Advance for next pair
        qh += 2;
        qs += 8;
        signs += 4;
        act += 64;
      }
    }
    out[r] = row_sum * x_scale;
  }
}

// Float matvec (for LM head — Q6_K dequantized to float)
static void matvec_float(float* out, const float* W, const float* x, int rows, int cols) {
  for (int r = 0; r < rows; r++) {
    float sum = 0;
    const float* row = W + (int64_t)r * cols;
    for (int c = 0; c < cols; c++) sum += row[c] * x[c];
    out[r] = sum;
  }
}

// Unified matvec: IQ3_S quantized path or float fallback
static void weight_matvec(float* out, const IQ3SWeight& W,
                           const float* x_float, const int8_t* x_q, float x_scale, int rows) {
  if (W.is_iq3s) {
    iq3s_matvec(out, W, x_q, x_scale, rows);
  } else {
    matvec_float(out, W.float_fallback.data(), x_float, rows, W.cols);
  }
}

// --- Non-quantized ops ---

static void rmsnorm(float* out, const float* x, const float* gamma, int dim, float eps) {
  float ss = 0;
  for (int i = 0; i < dim; i++) ss += x[i] * x[i];
  float scale = 1.0f / std::sqrt(ss / dim + eps);
  for (int i = 0; i < dim; i++) out[i] = x[i] * scale * gamma[i];
}

static void rope(float* vec, int head_dim, int pos, float theta) {
  for (int i = 0; i < head_dim; i += 2) {
    float freq = 1.0f / std::pow(theta, (float)i / head_dim);
    float angle = pos * freq;
    float cos_a = std::cos(angle);
    float sin_a = std::sin(angle);
    float v0 = vec[i];
    float v1 = vec[i + 1];
    vec[i]     = v0 * cos_a - v1 * sin_a;
    vec[i + 1] = v0 * sin_a + v1 * cos_a;
  }
}

static float silu(float x) { return x / (1.0f + std::exp(-x)); }

static void softmax(float* x, int n) {
  float max_val = *std::max_element(x, x + n);
  float sum = 0;
  for (int i = 0; i < n; i++) { x[i] = std::exp(x[i] - max_val); sum += x[i]; }
  for (int i = 0; i < n; i++) x[i] /= sum;
}

// --- Load model ---

static std::vector<float> get_float_tensor(struct ggml_context* ctx, const char* name, int64_t n) {
  struct ggml_tensor* t = ggml_get_tensor(ctx, name);
  if (!t) return std::vector<float>(n, 0.0f);
  std::vector<float> out(n);
  if (t->type == GGML_TYPE_F32) {
    std::memcpy(out.data(), t->data, n * sizeof(float));
  } else {
    const struct ggml_type_traits* traits = ggml_get_type_traits(t->type);
    if (traits->to_float) traits->to_float(t->data, out.data(), n);
  }
  return out;
}

static IQ3SWeight load_iq3s_weight(struct ggml_context* ctx, const char* name, int rows, int cols) {
  IQ3SWeight w = {};
  w.rows = rows;
  w.cols = cols;
  w.n_blocks_per_row = cols / QK_K;
  w.is_iq3s = false;

  struct ggml_tensor* t = ggml_get_tensor(ctx, name);
  if (!t) {
    std::fprintf(stderr, "WARNING: tensor '%s' not found\n", name);
    w.float_fallback.resize((int64_t)rows * cols, 0.0f);
    return w;
  }
  if (t->type == GGML_TYPE_IQ3_S) {
    w.data = t->data;
    w.is_iq3s = true;
  } else {
    // Fallback: dequantize to float (handles IQ2_S, Q4_K, etc.)
    std::fprintf(stderr, "NOTE: tensor '%s' is type %d (not IQ3_S), using float fallback\n",
                 name, t->type);
    int64_t n = ggml_nelements(t);
    w.float_fallback.resize(n);
    if (t->type == GGML_TYPE_F32) {
      std::memcpy(w.float_fallback.data(), t->data, n * sizeof(float));
    } else {
      const struct ggml_type_traits* traits = ggml_get_type_traits(t->type);
      if (traits->to_float) traits->to_float(t->data, w.float_fallback.data(), n);
    }
  }
  return w;
}

static IQ3SModelWeights load_model(const std::string& path) {
  IQ3SModelWeights m;
  auto& c = m.cfg;

  struct ggml_context* ctx = nullptr;
  struct gguf_init_params params = {};
  params.no_alloc = false;
  params.ctx = &ctx;

  struct gguf_context* gguf = gguf_init_from_file(path.c_str(), params);
  if (!gguf) { std::fprintf(stderr, "Failed to open %s\n", path.c_str()); std::exit(1); }

  int64_t key;
  key = gguf_find_key(gguf, "llama.embedding_length");
  if (key >= 0) c.dim = gguf_get_val_u32(gguf, key);
  key = gguf_find_key(gguf, "llama.block_count");
  if (key >= 0) c.n_layers = gguf_get_val_u32(gguf, key);
  key = gguf_find_key(gguf, "llama.attention.head_count");
  if (key >= 0) c.n_heads = gguf_get_val_u32(gguf, key);
  key = gguf_find_key(gguf, "llama.attention.head_count_kv");
  if (key >= 0) c.n_kv_heads = gguf_get_val_u32(gguf, key);
  key = gguf_find_key(gguf, "llama.feed_forward_length");
  if (key >= 0) c.ffn_dim = gguf_get_val_u32(gguf, key);
  key = gguf_find_key(gguf, "llama.rope.freq_base");
  if (key >= 0) c.rope_theta = gguf_get_val_f32(gguf, key);
  c.head_dim = c.dim / c.n_heads;

  struct ggml_tensor* embd_t = ggml_get_tensor(ctx, "token_embd.weight");
  if (embd_t) c.vocab_size = embd_t->ne[1];

  std::fprintf(stderr, "Config: dim=%d layers=%d heads=%d kv_heads=%d ffn=%d vocab=%d rope_theta=%.0f\n",
               c.dim, c.n_layers, c.n_heads, c.n_kv_heads, c.ffn_dim, c.vocab_size, c.rope_theta);

  int kv_dim = c.n_kv_heads * c.head_dim;

  // Embedding: dequantize to float (may be IQ3_S or F16/F32)
  m.tok_embd = get_float_tensor(ctx, "token_embd.weight", (int64_t)c.vocab_size * c.dim);
  std::fprintf(stderr, "  embedding loaded (dequantized to float)\n");

  // Output norm: float
  m.output_norm = get_float_tensor(ctx, "output_norm.weight", c.dim);

  // Output/LM head: Q6_K or other -> dequantized to float
  m.output_float = get_float_tensor(ctx, "output.weight", (int64_t)c.vocab_size * c.dim);
  std::fprintf(stderr, "  output loaded (dequantized to float)\n");

  // Layers: IQ3_S weight tensors (raw block pointers)
  m.layers.resize(c.n_layers);
  for (int l = 0; l < c.n_layers; l++) {
    auto& lw = m.layers[l];
    char buf[128];
    auto tn = [&](const char* suffix) -> const char* {
      std::snprintf(buf, sizeof(buf), "blk.%d.%s", l, suffix);
      return buf;
    };
    lw.attn_norm = get_float_tensor(ctx, tn("attn_norm.weight"), c.dim);
    lw.wq = load_iq3s_weight(ctx, tn("attn_q.weight"), c.dim, c.dim);
    lw.wk = load_iq3s_weight(ctx, tn("attn_k.weight"), kv_dim, c.dim);
    lw.wv = load_iq3s_weight(ctx, tn("attn_v.weight"), kv_dim, c.dim);
    lw.wo = load_iq3s_weight(ctx, tn("attn_output.weight"), c.dim, c.dim);
    lw.ffn_norm = get_float_tensor(ctx, tn("ffn_norm.weight"), c.dim);
    lw.w_gate = load_iq3s_weight(ctx, tn("ffn_gate.weight"), c.ffn_dim, c.dim);
    lw.w_up = load_iq3s_weight(ctx, tn("ffn_up.weight"), c.ffn_dim, c.dim);
    lw.w_down = load_iq3s_weight(ctx, tn("ffn_down.weight"), c.dim, c.ffn_dim);
    std::fprintf(stderr, "  layer %d loaded\n", l);
  }

  // NOTE: We intentionally do NOT free gguf/ctx here because IQ3SWeight
  // holds raw pointers into the mmap'd GGUF data. The gguf_context and
  // ggml_context must remain alive for the lifetime of the model.
  // In a real application you'd store these contexts in the model struct.
  // For this validation tool, they leak at exit (acceptable).

  return m;
}

// --- KV Cache ---
struct KVCache {
  std::vector<std::vector<std::vector<float>>> k, v;
};

// --- IQ3_S forward pass ---
static std::vector<float> forward(const IQ3SModelWeights& m, int token, int pos,
                                   KVCache& cache, const std::string& dump_dir, bool dump) {
  auto& c = m.cfg;
  int kv_dim = c.n_kv_heads * c.head_dim;

  for (int l = 0; l < c.n_layers; l++) {
    while ((int)cache.k[l].size() <= pos) {
      cache.k[l].push_back(std::vector<float>(kv_dim, 0.0f));
      cache.v[l].push_back(std::vector<float>(kv_dim, 0.0f));
    }
  }

  // 1. Embedding lookup (float, already dequantized)
  std::vector<float> hidden(c.dim);
  for (int i = 0; i < c.dim; i++)
    hidden[i] = m.tok_embd[(int64_t)token * c.dim + i];
  if (dump) opentaalas::dump_tensor(dump_dir, "embed_out", hidden);
  std::fprintf(stderr, "  pos %d: embed done\n", pos);

  // Buffers
  std::vector<float> normed(c.dim);
  std::vector<float> q(c.dim), k(kv_dim), v(kv_dim);
  std::vector<float> attn_out(c.dim);
  std::vector<float> gate(c.ffn_dim), up(c.ffn_dim), down(c.dim);
  std::vector<int8_t> x_q(std::max(c.dim, c.ffn_dim));
  float x_scale;

  for (int l = 0; l < c.n_layers; l++) {
    auto& lw = m.layers[l];

    // --- Attention ---
    rmsnorm(normed.data(), hidden.data(), lw.attn_norm.data(), c.dim, c.norm_eps);
    quantize_to_int8(normed.data(), x_q.data(), c.dim, &x_scale);

    weight_matvec(q.data(), lw.wq, normed.data(), x_q.data(), x_scale, c.dim);
    weight_matvec(k.data(), lw.wk, normed.data(), x_q.data(), x_scale, kv_dim);
    weight_matvec(v.data(), lw.wv, normed.data(), x_q.data(), x_scale, kv_dim);

    for (int h = 0; h < c.n_heads; h++)
      rope(q.data() + h * c.head_dim, c.head_dim, pos, c.rope_theta);
    for (int h = 0; h < c.n_kv_heads; h++)
      rope(k.data() + h * c.head_dim, c.head_dim, pos, c.rope_theta);

    cache.k[l][pos] = k;
    cache.v[l][pos] = v;

    // GQA attention
    int kv_group = c.n_heads / c.n_kv_heads;
    std::fill(attn_out.begin(), attn_out.end(), 0.0f);

    for (int h = 0; h < c.n_heads; h++) {
      int kv_h = h / kv_group;
      float* q_head = q.data() + h * c.head_dim;
      int seq_len = pos + 1;
      std::vector<float> scores(seq_len);
      for (int t = 0; t < seq_len; t++) {
        float dot = 0;
        for (int d = 0; d < c.head_dim; d++)
          dot += q_head[d] * cache.k[l][t][kv_h * c.head_dim + d];
        scores[t] = dot / std::sqrt((float)c.head_dim);
      }
      softmax(scores.data(), seq_len);
      for (int t = 0; t < seq_len; t++)
        for (int d = 0; d < c.head_dim; d++)
          attn_out[h * c.head_dim + d] += scores[t] * cache.v[l][t][kv_h * c.head_dim + d];
    }

    // O projection (quantized)
    quantize_to_int8(attn_out.data(), x_q.data(), c.dim, &x_scale);
    std::vector<float> o_proj(c.dim);
    weight_matvec(o_proj.data(), lw.wo, attn_out.data(), x_q.data(), x_scale, c.dim);

    for (int i = 0; i < c.dim; i++) hidden[i] += o_proj[i];
    if (dump) opentaalas::dump_tensor(dump_dir, "layer" + std::to_string(l) + "_post_attn", hidden);

    // --- MLP ---
    rmsnorm(normed.data(), hidden.data(), lw.ffn_norm.data(), c.dim, c.norm_eps);
    quantize_to_int8(normed.data(), x_q.data(), c.dim, &x_scale);

    weight_matvec(gate.data(), lw.w_gate, normed.data(), x_q.data(), x_scale, c.ffn_dim);
    weight_matvec(up.data(), lw.w_up, normed.data(), x_q.data(), x_scale, c.ffn_dim);

    for (int i = 0; i < c.ffn_dim; i++)
      gate[i] = silu(gate[i]) * up[i];

    quantize_to_int8(gate.data(), x_q.data(), c.ffn_dim, &x_scale);
    weight_matvec(down.data(), lw.w_down, gate.data(), x_q.data(), x_scale, c.dim);

    for (int i = 0; i < c.dim; i++) hidden[i] += down[i];
    if (dump) opentaalas::dump_tensor(dump_dir, "layer" + std::to_string(l) + "_post_mlp", hidden);
    std::fprintf(stderr, "  pos %d: layer %d done\n", pos, l);
  }

  // Final norm
  rmsnorm(normed.data(), hidden.data(), m.output_norm.data(), c.dim, c.norm_eps);
  if (dump) opentaalas::dump_tensor(dump_dir, "final_norm", normed);

  // LM head (float, Q6_K was dequantized)
  std::vector<float> logits(c.vocab_size);
  matvec_float(logits.data(), m.output_float.data(), normed.data(), c.vocab_size, c.dim);
  if (dump) opentaalas::dump_tensor(dump_dir, "logits", logits);

  int argmax = std::max_element(logits.begin(), logits.end()) - logits.begin();
  std::fprintf(stderr, "  predicted token: %d (logit=%.4f)\n", argmax, logits[argmax]);

  return logits;
}

// --- Main ---
int main(int argc, char** argv) {
  if (argc < 4) {
    std::fprintf(stderr, "Usage: %s <model.gguf> <token_ids (comma-sep)> <output_dir>\n", argv[0]);
    std::fprintf(stderr, "\nRuns IQ3_S quantized forward pass using hardware compute path:\n");
    std::fprintf(stderr, "  Codebook: iq3s_grid[512] -> 4x odd magnitudes {1,3,...,15}\n");
    std::fprintf(stderr, "  MAC: (2k+1) x INT8 shift-and-add -> INT32\n");
    std::fprintf(stderr, "  Dequant: INT32 x (1+2*sub_scale) x BF16(d) -> FP32\n");
    return 1;
  }

  std::string model_path = argv[1];
  std::string output_dir = argv[3];

  std::vector<int> tokens;
  {
    std::string s = argv[2];
    size_t p = 0;
    while (p < s.size()) {
      size_t next = s.find(',', p);
      if (next == std::string::npos) next = s.size();
      tokens.push_back(std::atoi(s.substr(p, next - p).c_str()));
      p = next + 1;
    }
  }

  std::fprintf(stderr, "Loading IQ3_S model: %s\n", model_path.c_str());
  auto model = load_model(model_path);

  KVCache cache;
  cache.k.resize(model.cfg.n_layers);
  cache.v.resize(model.cfg.n_layers);

  std::fprintf(stderr, "Running IQ3_S forward pass for %zu tokens\n", tokens.size());
  std::vector<float> logits;
  for (int i = 0; i < (int)tokens.size(); i++) {
    bool is_last = (i == (int)tokens.size() - 1);
    logits = forward(model, tokens[i], i, cache, output_dir, is_last);
  }

  std::fprintf(stderr, "Done. Output in %s\n", output_dir.c_str());
  return 0;
}
