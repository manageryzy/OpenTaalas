// llama_quantized_forward.cpp — Quantized forward pass using our hardware compute path
// INT3 weights × INT8 activations → INT32 accumulator → FP8 dequant → BF16
// Compares against llama_forward.cpp (float) and llama.cpp (reference)

#include "gguf_converter.h"
#include "tensor_io.h"
#include "ggml.h"
#include "gguf.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <climits>

// --- Model config (same as llama_forward.cpp) ---
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

// --- Quantized weight tensor ---
struct QWeight {
  std::vector<uint8_t> w3;          // INT3 weights (0-7), one per byte
  std::vector<uint8_t> bank_scales; // FP8 E4M3, one per 16 weights
  float tensor_scale;
  int rows, cols;
};

struct QLayerWeights {
  std::vector<float> attn_norm;   // [dim] float (not quantized)
  QWeight wq, wk, wv, wo;
  std::vector<float> ffn_norm;    // [dim] float
  QWeight w_gate, w_up, w_down;
};

struct QModelWeights {
  LlamaConfig cfg;
  QWeight tok_embd;                // embedding is Q3_K too
  std::vector<QLayerWeights> layers;
  std::vector<float> output_norm;  // [dim] float
  std::vector<float> output_float; // [vocab * dim] float (Q6_K dequantized)
};

// --- Hardware compute primitives ---

// INT3 × INT8 shift-and-add (matches MacPE exactly)
static inline int32_t mac_pe(uint8_t w3, int8_t activation) {
  int32_t a = activation;
  switch (w3) {
    case 0: return 0;
    case 1: return a;
    case 2: return a << 1;
    case 3: return (a << 1) + a;
    case 4: return -(a << 2);
    case 5: return -((a << 1) + a);
    case 6: return -(a << 1);
    case 7: return -a;
    default: return 0;
  }
}

// FP8 E4M3 → float (matches DequantUnit)
static inline float fp8_e4m3_to_float_hw(uint8_t fp8) {
  uint32_t sign = (uint32_t)(fp8 >> 7) << 31;
  int exp = (fp8 >> 3) & 0xF;
  uint32_t mant = fp8 & 0x7;
  if (exp == 0 && mant == 0) return 0.0f;
  uint32_t f = sign | ((exp + 120) << 23) | (mant << 20);
  float result;
  std::memcpy(&result, &f, 4);
  return result;
}

// Dequantize INT32 accumulator → float using bank_scale (FP8) and tensor_scale (FP32)
// Matches DequantUnit::dequantize but in float for clarity
static inline float dequant_accum(int32_t accum, uint8_t bank_scale_fp8, float tensor_scale) {
  float scale = fp8_e4m3_to_float_hw(bank_scale_fp8);
  return (float)accum * scale;
}

// Quantize float activation to INT8 (symmetric, per-tensor)
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

// Quantized matrix-vector multiply: INT3 weights × INT8 activations → float output
// Uses per-16-weight bank scales (FP8 E4M3)
static void qmatvec(float* out, const QWeight& W, const int8_t* x_q, float x_scale, int rows, int cols) {
  for (int r = 0; r < rows; r++) {
    float row_sum = 0;
    const uint8_t* w_row = W.w3.data() + (int64_t)r * cols;
    const uint8_t* scales = W.bank_scales.data() + (int64_t)r * (cols / 16);

    // Process in 16-weight sub-blocks
    for (int c = 0; c < cols; c += 16) {
      int32_t accum = 0;
      int block_end = std::min(c + 16, cols);
      for (int j = c; j < block_end; j++) {
        accum += mac_pe(w_row[j], x_q[j]);
      }
      // Dequant this sub-block
      float bank_scale = fp8_e4m3_to_float_hw(scales[c / 16]);
      row_sum += (float)accum * bank_scale;
    }
    // Apply activation scale and tensor scale
    out[r] = row_sum * x_scale * W.tensor_scale;
  }
}

// Float matvec (for LM head which uses dequantized Q6_K weights)
static void matvec_float(float* out, const float* W, const float* x, int rows, int cols) {
  for (int r = 0; r < rows; r++) {
    float sum = 0;
    const float* row = W + (int64_t)r * cols;
    for (int c = 0; c < cols; c++) sum += row[c] * x[c];
    out[r] = sum;
  }
}

// --- Non-quantized ops (same as llama_forward.cpp) ---

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

// --- Load quantized model ---

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

static void decode_q3k_scales(const uint8_t scales_in[12], int8_t scales_out[16]) {
    uint32_t aux[4];
    std::memcpy(aux, scales_in, 12);
    const uint32_t kmask1 = 0x03030303;
    const uint32_t kmask2 = 0x0f0f0f0f;
    uint32_t tmp = aux[2];
    aux[2] = ((aux[0] >> 4) & kmask2) | (((tmp >> 4) & kmask1) << 4);
    aux[3] = ((aux[1] >> 4) & kmask2) | (((tmp >> 6) & kmask1) << 4);
    aux[0] = (aux[0] & kmask2) | (((tmp >> 0) & kmask1) << 4);
    aux[1] = (aux[1] & kmask2) | (((tmp >> 2) & kmask1) << 4);
    std::memcpy(scales_out, aux, 16);
}

static float float_to_fp16_to_float(float v) {
    // Round-trip through FP16 for scale conversion
    uint32_t bits;
    std::memcpy(&bits, &v, 4);
    int exp32 = ((bits >> 23) & 0xFF) - 127 + 15;
    uint16_t mant = (bits >> 13) & 0x3FF;
    uint16_t sign = (bits >> 16) & 0x8000;
    uint16_t fp16;
    if (exp32 <= 0) fp16 = sign;
    else if (exp32 >= 31) fp16 = sign | 0x7C00;
    else fp16 = sign | (exp32 << 10) | mant;
    return opentaalas::fp16_to_float(fp16);
}

static QWeight load_qweight(struct ggml_context* ctx, const char* name, int rows, int cols) {
  QWeight qw;
  qw.rows = rows;
  qw.cols = cols;

  struct ggml_tensor* t = ggml_get_tensor(ctx, name);
  if (!t) {
    std::fprintf(stderr, "WARNING: tensor '%s' not found\n", name);
    qw.w3.resize((int64_t)rows * cols, 0);
    qw.bank_scales.resize((int64_t)rows * (cols / 16), 0);
    qw.tensor_scale = 0;
    return qw;
  }

  int64_t n = (int64_t)rows * cols;
  qw.w3.resize(n);
  // Q3_K has 16 sub-blocks of 16 weights per 256-weight super-block
  qw.bank_scales.resize(n / 16);
  qw.tensor_scale = 1.0f;

  if (t->type == GGML_TYPE_Q3_K) {
    // Parse Q3_K blocks directly — no double quantization
    static constexpr int QK = 256;
    static constexpr int BLOCK_SIZE = 110; // 32 + 64 + 12 + 2
    int n_blocks = n / QK;
    const uint8_t* raw = reinterpret_cast<const uint8_t*>(t->data);
    float max_abs_dl = 0;

    for (int i = 0; i < n_blocks; i++) {
      const uint8_t* block = raw + i * BLOCK_SIZE;
      const uint8_t* hmask = block;
      const uint8_t* qs    = block + 32;
      const uint8_t* sc    = block + 96;
      uint16_t d_fp16;
      std::memcpy(&d_fp16, block + 108, 2);
      float d_all = opentaalas::fp16_to_float(d_fp16);

      int8_t sub_scales[16];
      decode_q3k_scales(sc, sub_scales);

      uint8_t m = 1;
      int is = 0;
      const uint8_t* q = qs;

      for (int nn = 0; nn < QK; nn += 128) {
        int shift = 0;
        for (int j = 0; j < 4; j++) {
          // Sub-block scale = d_all * (sub_scale - 32)
          float dl = d_all * (sub_scales[is] - 32);
          // Our hardware uses unsigned FP8 scales — if dl is negative,
          // negate the weights and use |dl| as scale
          bool neg_scale = (dl < 0);
          float abs_dl = std::fabs(dl);
          if (abs_dl > max_abs_dl) max_abs_dl = abs_dl;
          // Convert to FP8 E4M3 via FP16
          uint32_t dl_bits;
          std::memcpy(&dl_bits, &abs_dl, 4);
          int dl_exp = ((dl_bits >> 23) & 0xFF) - 127 + 15;
          uint16_t dl_mant = (dl_bits >> 13) & 0x3FF;
          uint16_t dl_fp16;
          if (dl_exp <= 0) dl_fp16 = 0;
          else if (dl_exp >= 31) dl_fp16 = 0x7C00;
          else dl_fp16 = (dl_exp << 10) | dl_mant;
          qw.bank_scales[i * 16 + is] = opentaalas::fp16_to_fp8_e4m3(dl_fp16);
          is++;

          for (int l = 0; l < 16; l++) {
            int idx = i * QK + nn + j * 32 + l;
            int low2 = (q[l] >> shift) & 3;
            int high = (hmask[l + (nn/128)*32] & m) ? 0 : 4;
            int signed_w = low2 - high; // -4..+3
            if (neg_scale) signed_w = -signed_w; // absorb scale sign into weight
            // Clamp after negation
            if (signed_w > 3) signed_w = 3;
            if (signed_w < -4) signed_w = -4;
            uint8_t our_w = (signed_w >= 0) ? (uint8_t)signed_w : (uint8_t)(8 + signed_w);
            qw.w3[idx] = our_w;
          }

          dl = d_all * (sub_scales[is] - 32);
          neg_scale = (dl < 0);
          abs_dl = std::fabs(dl);
          if (abs_dl > max_abs_dl) max_abs_dl = abs_dl;
          std::memcpy(&dl_bits, &abs_dl, 4);
          dl_exp = ((dl_bits >> 23) & 0xFF) - 127 + 15;
          dl_mant = (dl_bits >> 13) & 0x3FF;
          if (dl_exp <= 0) dl_fp16 = 0;
          else if (dl_exp >= 31) dl_fp16 = 0x7C00;
          else dl_fp16 = (dl_exp << 10) | dl_mant;
          qw.bank_scales[i * 16 + is] = opentaalas::fp16_to_fp8_e4m3(dl_fp16);
          is++;

          for (int l = 0; l < 16; l++) {
            int idx = i * QK + nn + j * 32 + 16 + l;
            int low2 = (q[l + 16] >> shift) & 3;
            int high = (hmask[l + 16 + (nn/128)*32] & m) ? 0 : 4;
            int signed_w = low2 - high;
            if (neg_scale) signed_w = -signed_w;
            if (signed_w > 3) signed_w = 3;
            if (signed_w < -4) signed_w = -4;
            uint8_t our_w = (signed_w >= 0) ? (uint8_t)signed_w : (uint8_t)(8 + signed_w);
            qw.w3[idx] = our_w;
          }

          shift += 2;
          m <<= 1;
        }
        q += 32;
      }
    }

    // Normalize bank_scales by max_abs_dl to prevent FP8 E4M3 underflow
    // (same fix as gguf_converter.cpp — V projection scales ~0.001-0.02 underflow otherwise)
    qw.tensor_scale = max_abs_dl;
    if (max_abs_dl > 0) {
      float inv_max = 1.0f / max_abs_dl;
      for (int i = 0; i < n_blocks; i++) {
        const uint8_t* block = raw + i * BLOCK_SIZE;
        const uint8_t* sc = block + 96;
        uint16_t d_fp16;
        std::memcpy(&d_fp16, block + 108, 2);
        float d_all = opentaalas::fp16_to_float(d_fp16);
        int8_t ssc[16];
        decode_q3k_scales(sc, ssc);
        for (int s = 0; s < 16; s++) {
          float dl_abs = std::fabs(d_all * (ssc[s] - 32)) * inv_max;
          uint32_t dl_bits;
          std::memcpy(&dl_bits, &dl_abs, 4);
          int dl_exp = ((dl_bits >> 23) & 0xFF) - 127 + 15;
          uint16_t dl_mant = (dl_bits >> 13) & 0x3FF;
          uint16_t dl_fp16;
          if (dl_exp <= 0) dl_fp16 = 0;
          else if (dl_exp >= 31) dl_fp16 = 0x7C00;
          else dl_fp16 = (dl_exp << 10) | dl_mant;
          qw.bank_scales[i * 16 + s] = opentaalas::fp16_to_fp8_e4m3(dl_fp16);
        }
      }
    }
  } else {
    // Non-Q3_K: dequantize to float, then quantize to our format
    std::vector<float> floats(n);
    const struct ggml_type_traits* traits = ggml_get_type_traits(t->type);
    if (traits->to_float) traits->to_float(t->data, floats.data(), n);

    for (int r = 0; r < rows; r++) {
      for (int b = 0; b < cols / 16; b++) {
        int offset = r * cols + b * 16;
        float amax = 0;
        for (int j = 0; j < 16; j++) {
          float a = std::fabs(floats[offset + j]);
          if (a > amax) amax = a;
        }
        float scale = amax / 4.0f;
        if (scale == 0) scale = 1e-10f;

        uint32_t sbits;
        std::memcpy(&sbits, &scale, 4);
        int sexp = ((sbits >> 23) & 0xFF) - 127 + 15;
        uint16_t smant = (sbits >> 13) & 0x3FF;
        uint16_t fp16_scale;
        if (sexp <= 0) fp16_scale = 0;
        else if (sexp >= 31) fp16_scale = 0x7C00;
        else fp16_scale = (sexp << 10) | smant;
        qw.bank_scales[r * (cols / 16) + b] = opentaalas::fp16_to_fp8_e4m3(fp16_scale);

        float inv_scale = 1.0f / scale;
        for (int j = 0; j < 16; j++) {
          int q = (int)std::round(floats[offset + j] * inv_scale);
          if (q > 3) q = 3;
          if (q < -4) q = -4;
          uint8_t enc = (q >= 0) ? (uint8_t)q : (uint8_t)(8 + q);
          qw.w3[offset + j] = enc;
        }
      }
    }
  }

  return qw;
}

static QModelWeights load_model(const std::string& path) {
  QModelWeights m;
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

  std::fprintf(stderr, "Config: dim=%d layers=%d heads=%d kv_heads=%d ffn=%d vocab=%d\n",
               c.dim, c.n_layers, c.n_heads, c.n_kv_heads, c.ffn_dim, c.vocab_size);

  int kv_dim = c.n_kv_heads * c.head_dim;

  // Embedding: quantized
  m.tok_embd = load_qweight(ctx, "token_embd.weight", c.vocab_size, c.dim);
  std::fprintf(stderr, "  embedding loaded\n");

  // Output norm: float
  m.output_norm = get_float_tensor(ctx, "output_norm.weight", c.dim);

  // Output/LM head: Q6_K → dequantized to float
  m.output_float = get_float_tensor(ctx, "output.weight", (int64_t)c.vocab_size * c.dim);
  std::fprintf(stderr, "  output loaded\n");

  // Layers
  m.layers.resize(c.n_layers);
  for (int l = 0; l < c.n_layers; l++) {
    auto& lw = m.layers[l];
    char buf[128];
    auto tn = [&](const char* suffix) -> const char* {
      std::snprintf(buf, sizeof(buf), "blk.%d.%s", l, suffix);
      return buf;
    };
    lw.attn_norm = get_float_tensor(ctx, tn("attn_norm.weight"), c.dim);
    lw.wq = load_qweight(ctx, tn("attn_q.weight"), c.dim, c.dim);
    lw.wk = load_qweight(ctx, tn("attn_k.weight"), kv_dim, c.dim);
    lw.wv = load_qweight(ctx, tn("attn_v.weight"), kv_dim, c.dim);
    lw.wo = load_qweight(ctx, tn("attn_output.weight"), c.dim, c.dim);
    lw.ffn_norm = get_float_tensor(ctx, tn("ffn_norm.weight"), c.dim);
    lw.w_gate = load_qweight(ctx, tn("ffn_gate.weight"), c.ffn_dim, c.dim);
    lw.w_up = load_qweight(ctx, tn("ffn_up.weight"), c.ffn_dim, c.dim);
    lw.w_down = load_qweight(ctx, tn("ffn_down.weight"), c.dim, c.ffn_dim);
    std::fprintf(stderr, "  layer %d loaded\n", l);
  }

  gguf_free(gguf);
  ggml_free(ctx);
  return m;
}

// --- KV Cache ---
struct KVCache {
  std::vector<std::vector<std::vector<float>>> k, v;
};

// --- Quantized forward pass ---
static std::vector<float> forward(const QModelWeights& m, int token, int pos,
                                   KVCache& cache, const std::string& dump_dir, bool dump) {
  auto& c = m.cfg;
  int kv_dim = c.n_kv_heads * c.head_dim;

  for (int l = 0; l < c.n_layers; l++) {
    while ((int)cache.k[l].size() <= pos) {
      cache.k[l].push_back(std::vector<float>(kv_dim, 0.0f));
      cache.v[l].push_back(std::vector<float>(kv_dim, 0.0f));
    }
  }

  // 1. Embedding: dequantize the token's row from quantized embedding
  std::vector<float> hidden(c.dim);
  {
    const QWeight& emb = m.tok_embd;
    int64_t offset = (int64_t)token * c.dim;
    for (int b = 0; b < c.dim / 16; b++) {
      float bank_scale = fp8_e4m3_to_float_hw(emb.bank_scales[token * (c.dim / 16) + b]);
      for (int j = 0; j < 16; j++) {
        uint8_t w = emb.w3[offset + b * 16 + j];
        // Decode INT3 to signed: 0-3 → 0..3, 4-7 → -4..-1
        int sw = (w <= 3) ? (int)w : (int)w - 8;
        hidden[b * 16 + j] = (float)sw * bank_scale * emb.tensor_scale;
      }
    }
  }
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

    // Quantize normed to INT8
    quantize_to_int8(normed.data(), x_q.data(), c.dim, &x_scale);

    // Q, K, V projections (quantized)
    qmatvec(q.data(), lw.wq, x_q.data(), x_scale, c.dim, c.dim);
    qmatvec(k.data(), lw.wk, x_q.data(), x_scale, kv_dim, c.dim);
    qmatvec(v.data(), lw.wv, x_q.data(), x_scale, kv_dim, c.dim);

    // RoPE
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
    qmatvec(o_proj.data(), lw.wo, x_q.data(), x_scale, c.dim, c.dim);

    for (int i = 0; i < c.dim; i++) hidden[i] += o_proj[i];
    if (dump) opentaalas::dump_tensor(dump_dir, "layer" + std::to_string(l) + "_post_attn", hidden);

    // --- MLP ---
    rmsnorm(normed.data(), hidden.data(), lw.ffn_norm.data(), c.dim, c.norm_eps);
    quantize_to_int8(normed.data(), x_q.data(), c.dim, &x_scale);

    qmatvec(gate.data(), lw.w_gate, x_q.data(), x_scale, c.ffn_dim, c.dim);
    qmatvec(up.data(), lw.w_up, x_q.data(), x_scale, c.ffn_dim, c.dim);

    for (int i = 0; i < c.ffn_dim; i++)
      gate[i] = silu(gate[i]) * up[i];

    // Down projection: quantize ffn_dim-wide vector
    quantize_to_int8(gate.data(), x_q.data(), c.ffn_dim, &x_scale);
    qmatvec(down.data(), lw.w_down, x_q.data(), x_scale, c.dim, c.ffn_dim);

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

  std::fprintf(stderr, "Loading model (quantized): %s\n", model_path.c_str());
  auto model = load_model(model_path);

  KVCache cache;
  cache.k.resize(model.cfg.n_layers);
  cache.v.resize(model.cfg.n_layers);

  std::fprintf(stderr, "Running quantized forward pass for %zu tokens\n", tokens.size());
  std::vector<float> logits;
  for (int i = 0; i < (int)tokens.size(); i++) {
    bool is_last = (i == (int)tokens.size() - 1);
    logits = forward(model, tokens[i], i, cache, output_dir, is_last);
  }

  std::fprintf(stderr, "Done. Output in %s\n", output_dir.c_str());
  return 0;
}
