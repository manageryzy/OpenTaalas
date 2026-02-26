// llama_forward.cpp — Full float forward pass for LLaMA 3.1 8B
// Loads GGUF, dequantizes all weights to float, runs inference,
// dumps logits for comparison against llama.cpp's tensor_extractor output.

#include "ggml.h"
#include "gguf.h"
#include "tensor_io.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>

// --- Model hyperparameters (LLaMA 3.1 8B) ---
struct LlamaConfig {
  int dim        = 4096;
  int n_layers   = 32;
  int n_heads    = 32;
  int n_kv_heads = 8;
  int head_dim   = 128;  // dim / n_heads
  int ffn_dim    = 14336;
  int vocab_size = 128256;
  float rope_theta = 500000.0f;
  float norm_eps   = 1e-5f;
};

// --- Weight storage ---
struct LayerWeights {
  std::vector<float> attn_norm;   // [dim]
  std::vector<float> wq;          // [dim * dim]
  std::vector<float> wk;          // [n_kv_heads * head_dim * dim]
  std::vector<float> wv;          // [n_kv_heads * head_dim * dim]
  std::vector<float> wo;          // [dim * dim]
  std::vector<float> ffn_norm;    // [dim]
  std::vector<float> w_gate;      // [ffn_dim * dim]
  std::vector<float> w_up;        // [ffn_dim * dim]
  std::vector<float> w_down;      // [dim * ffn_dim]
};

struct ModelWeights {
  LlamaConfig cfg;
  std::vector<float> tok_embd;    // [vocab * dim]
  std::vector<LayerWeights> layers;
  std::vector<float> output_norm; // [dim]
  std::vector<float> output;      // [vocab * dim]
  std::vector<float> rope_freqs;  // [head_dim/2]
};

// --- Tensor dequantization helper ---
static std::vector<float> get_tensor_float(struct ggml_context* ctx, const char* name, int64_t expected) {
  struct ggml_tensor* t = ggml_get_tensor(ctx, name);
  if (!t) {
    std::fprintf(stderr, "WARNING: tensor '%s' not found\n", name);
    return std::vector<float>(expected, 0.0f);
  }
  int64_t n = ggml_nelements(t);
  std::vector<float> out(n);

  if (t->type == GGML_TYPE_F32) {
    std::memcpy(out.data(), t->data, n * sizeof(float));
  } else {
    // Use ggml's built-in dequantization
    const struct ggml_type_traits* traits = ggml_get_type_traits(t->type);
    if (traits->to_float) {
      traits->to_float(t->data, out.data(), n);
    } else {
      std::fprintf(stderr, "WARNING: no dequantizer for tensor '%s' (type %d)\n", name, t->type);
    }
  }
  return out;
}

// --- Load model weights ---
static ModelWeights load_model(const std::string& path) {
  ModelWeights m;
  auto& c = m.cfg;

  struct ggml_context* ctx = nullptr;
  struct gguf_init_params params = {};
  params.no_alloc = false;
  params.ctx = &ctx;

  struct gguf_context* gguf = gguf_init_from_file(path.c_str(), params);
  if (!gguf) { std::fprintf(stderr, "Failed to open %s\n", path.c_str()); std::exit(1); }

  // Read config from GGUF metadata
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

  // Check vocab from token_embd shape
  struct ggml_tensor* embd_t = ggml_get_tensor(ctx, "token_embd.weight");
  if (embd_t) c.vocab_size = embd_t->ne[1];

  std::fprintf(stderr, "Config: dim=%d layers=%d heads=%d kv_heads=%d ffn=%d vocab=%d rope_theta=%.0f\n",
               c.dim, c.n_layers, c.n_heads, c.n_kv_heads, c.ffn_dim, c.vocab_size, c.rope_theta);

  // Load tensors
  int kv_dim = c.n_kv_heads * c.head_dim;

  m.tok_embd = get_tensor_float(ctx, "token_embd.weight", (int64_t)c.vocab_size * c.dim);
  m.output_norm = get_tensor_float(ctx, "output_norm.weight", c.dim);
  m.output = get_tensor_float(ctx, "output.weight", (int64_t)c.vocab_size * c.dim);

  m.layers.resize(c.n_layers);
  for (int l = 0; l < c.n_layers; l++) {
    auto& lw = m.layers[l];
    char buf[128];
    auto tn = [&](const char* suffix) -> const char* {
      std::snprintf(buf, sizeof(buf), "blk.%d.%s", l, suffix);
      return buf;
    };
    lw.attn_norm = get_tensor_float(ctx, tn("attn_norm.weight"), c.dim);
    lw.wq = get_tensor_float(ctx, tn("attn_q.weight"), (int64_t)c.dim * c.dim);
    lw.wk = get_tensor_float(ctx, tn("attn_k.weight"), (int64_t)kv_dim * c.dim);
    lw.wv = get_tensor_float(ctx, tn("attn_v.weight"), (int64_t)kv_dim * c.dim);
    lw.wo = get_tensor_float(ctx, tn("attn_output.weight"), (int64_t)c.dim * c.dim);
    lw.ffn_norm = get_tensor_float(ctx, tn("ffn_norm.weight"), c.dim);
    lw.w_gate = get_tensor_float(ctx, tn("ffn_gate.weight"), (int64_t)c.ffn_dim * c.dim);
    lw.w_up = get_tensor_float(ctx, tn("ffn_up.weight"), (int64_t)c.ffn_dim * c.dim);
    lw.w_down = get_tensor_float(ctx, tn("ffn_down.weight"), (int64_t)c.dim * c.ffn_dim);
    std::fprintf(stderr, "  layer %d loaded\n", l);
  }

  gguf_free(gguf);
  ggml_free(ctx);
  return m;
}

// --- Compute primitives ---

// RMSNorm: out[i] = x[i] * gamma[i] / sqrt(mean(x^2) + eps)
static void rmsnorm(float* out, const float* x, const float* gamma, int dim, float eps) {
  float ss = 0;
  for (int i = 0; i < dim; i++) ss += x[i] * x[i];
  float scale = 1.0f / std::sqrt(ss / dim + eps);
  for (int i = 0; i < dim; i++) out[i] = x[i] * scale * gamma[i];
}

// Matrix-vector multiply: out[rows] = W[rows x cols] * x[cols]
// W is row-major: W[r * cols + c]
static void matvec(float* out, const float* W, const float* x, int rows, int cols) {
  for (int r = 0; r < rows; r++) {
    float sum = 0;
    const float* row = W + (int64_t)r * cols;
    for (int c = 0; c < cols; c++) sum += row[c] * x[c];
    out[r] = sum;
  }
}

// RoPE: apply rotary position embedding to q/k vectors
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

// SiLU activation: x * sigmoid(x)
static float silu(float x) {
  return x / (1.0f + std::exp(-x));
}

// Softmax in-place
static void softmax(float* x, int n) {
  float max_val = *std::max_element(x, x + n);
  float sum = 0;
  for (int i = 0; i < n; i++) { x[i] = std::exp(x[i] - max_val); sum += x[i]; }
  for (int i = 0; i < n; i++) x[i] /= sum;
}

// --- Forward pass (single token at position pos) ---
// KV cache is managed externally for multi-token sequences
struct KVCache {
  std::vector<std::vector<std::vector<float>>> k; // [n_layers][seq_pos][kv_dim]
  std::vector<std::vector<std::vector<float>>> v;
};

static std::vector<float> forward(const ModelWeights& m, int token, int pos,
                                   KVCache& cache, const std::string& dump_dir,
                                   bool dump) {
  auto& c = m.cfg;
  int kv_dim = c.n_kv_heads * c.head_dim;

  // Grow KV cache if needed
  for (int l = 0; l < c.n_layers; l++) {
    while ((int)cache.k[l].size() <= pos) {
      cache.k[l].push_back(std::vector<float>(kv_dim, 0.0f));
      cache.v[l].push_back(std::vector<float>(kv_dim, 0.0f));
    }
  }

  // 1. Embedding lookup
  std::vector<float> hidden(c.dim);
  for (int i = 0; i < c.dim; i++)
    hidden[i] = m.tok_embd[(int64_t)token * c.dim + i];
  if (dump) opentaalas::dump_tensor(dump_dir, "embed_out", hidden);
  std::fprintf(stderr, "  pos %d: embed done\n", pos);

  // 2. Transformer layers
  std::vector<float> normed(c.dim);
  std::vector<float> q(c.dim), k(kv_dim), v(kv_dim);
  std::vector<float> attn_out(c.dim);
  std::vector<float> gate(c.ffn_dim), up(c.ffn_dim), down(c.dim);

  for (int l = 0; l < c.n_layers; l++) {
    auto& lw = m.layers[l];

    // --- Attention block ---
    // Pre-attention RMSNorm
    rmsnorm(normed.data(), hidden.data(), lw.attn_norm.data(), c.dim, c.norm_eps);

    // Q, K, V projections
    matvec(q.data(), lw.wq.data(), normed.data(), c.dim, c.dim);
    matvec(k.data(), lw.wk.data(), normed.data(), kv_dim, c.dim);
    matvec(v.data(), lw.wv.data(), normed.data(), kv_dim, c.dim);

    // RoPE on Q and K (per-head)
    for (int h = 0; h < c.n_heads; h++)
      rope(q.data() + h * c.head_dim, c.head_dim, pos, c.rope_theta);
    for (int h = 0; h < c.n_kv_heads; h++)
      rope(k.data() + h * c.head_dim, c.head_dim, pos, c.rope_theta);

    // Store K, V in cache
    cache.k[l][pos] = k;
    cache.v[l][pos] = v;

    // Multi-head attention with GQA
    int kv_group = c.n_heads / c.n_kv_heads; // 4 for LLaMA 3.1 8B
    std::fill(attn_out.begin(), attn_out.end(), 0.0f);

    for (int h = 0; h < c.n_heads; h++) {
      int kv_h = h / kv_group;
      float* q_head = q.data() + h * c.head_dim;

      // Compute attention scores: Q * K^T / sqrt(head_dim)
      // For single token at pos=0, seq_len=1
      int seq_len = pos + 1;
      std::vector<float> scores(seq_len);
      for (int t = 0; t < seq_len; t++) {
        float dot = 0;
        for (int d = 0; d < c.head_dim; d++)
          dot += q_head[d] * cache.k[l][t][kv_h * c.head_dim + d];
        scores[t] = dot / std::sqrt((float)c.head_dim);
      }

      // Softmax
      softmax(scores.data(), seq_len);

      // Weighted sum of V
      for (int t = 0; t < seq_len; t++) {
        for (int d = 0; d < c.head_dim; d++)
          attn_out[h * c.head_dim + d] += scores[t] * cache.v[l][t][kv_h * c.head_dim + d];
      }
    }

    // Output projection
    std::vector<float> o_proj(c.dim);
    matvec(o_proj.data(), lw.wo.data(), attn_out.data(), c.dim, c.dim);

    // Residual
    for (int i = 0; i < c.dim; i++) hidden[i] += o_proj[i];

    if (dump) opentaalas::dump_tensor(dump_dir, "layer" + std::to_string(l) + "_post_attn", hidden);

    // --- MLP block ---
    // Pre-MLP RMSNorm
    rmsnorm(normed.data(), hidden.data(), lw.ffn_norm.data(), c.dim, c.norm_eps);

    // Gate and Up projections
    matvec(gate.data(), lw.w_gate.data(), normed.data(), c.ffn_dim, c.dim);
    matvec(up.data(), lw.w_up.data(), normed.data(), c.ffn_dim, c.dim);

    // SwiGLU: silu(gate) * up
    for (int i = 0; i < c.ffn_dim; i++)
      gate[i] = silu(gate[i]) * up[i];

    // Down projection
    matvec(down.data(), lw.w_down.data(), gate.data(), c.dim, c.ffn_dim);

    // Residual
    for (int i = 0; i < c.dim; i++) hidden[i] += down[i];

    if (dump) opentaalas::dump_tensor(dump_dir, "layer" + std::to_string(l) + "_post_mlp", hidden);
    std::fprintf(stderr, "  pos %d: layer %d done\n", pos, l);
  }

  // 3. Final RMSNorm
  rmsnorm(normed.data(), hidden.data(), m.output_norm.data(), c.dim, c.norm_eps);
  if (dump) opentaalas::dump_tensor(dump_dir, "final_norm", normed);

  // 4. LM head: logits = output_weight * normed
  std::vector<float> logits(c.vocab_size);
  matvec(logits.data(), m.output.data(), normed.data(), c.vocab_size, c.dim);
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

  // Parse comma-separated token IDs
  std::vector<int> tokens;
  {
    std::string s = argv[2];
    size_t pos = 0;
    while (pos < s.size()) {
      size_t next = s.find(',', pos);
      if (next == std::string::npos) next = s.size();
      tokens.push_back(std::atoi(s.substr(pos, next - pos).c_str()));
      pos = next + 1;
    }
  }

  std::fprintf(stderr, "Loading model: %s\n", model_path.c_str());
  auto model = load_model(model_path);

  // Initialize KV cache
  KVCache cache;
  cache.k.resize(model.cfg.n_layers);
  cache.v.resize(model.cfg.n_layers);

  std::fprintf(stderr, "Running forward pass for %zu tokens\n", tokens.size());
  std::vector<float> logits;
  for (int i = 0; i < (int)tokens.size(); i++) {
    bool is_last = (i == (int)tokens.size() - 1);
    logits = forward(model, tokens[i], i, cache, output_dir, is_last);
  }

  std::fprintf(stderr, "Done. Output in %s\n", output_dir.c_str());
  return 0;
}
