#include "gguf_converter.h"
#include "ggml.h"
#include "gguf.h"
#include "ggml-quants.h"

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <algorithm>
#include <sys/stat.h>

// Q3_K block layout from ggml-common.h:
//   uint8_t hmask[QK_K/8]  — high bit of each 3-bit weight (32 bytes)
//   uint8_t qs[QK_K/4]     — low 2 bits of each weight (64 bytes)
//   uint8_t scales[12]     — packed 6-bit sub-block scales
//   ggml_half d            — FP16 super-block scale
// QK_K = 256 weights per block

namespace opentaalas {

static void decode_q3k_scales(const uint8_t scales_in[12], int8_t scales_out[16]) {
    // Unpack 12 bytes → 16 six-bit scales (stored as int8, need -32 bias later)
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

static ConvertedTensor convert_q3k_tensor(
    const char* name, const void* data, int64_t n_elements, int64_t ne0, int64_t ne1
) {
    ConvertedTensor ct;
    ct.name = name;
    ct.rows = ne1;
    ct.cols = ne0;
    ct.is_quantized = true;

    const int n_blocks = (int)(n_elements / 256);
    const auto* blocks = reinterpret_cast<const uint8_t*>(data);

    // block_q3_K size: 32 (hmask) + 64 (qs) + 12 (scales) + 2 (d) = 110 bytes
    static constexpr int BLOCK_SIZE = 110;

    ct.weights.resize(n_elements);
    ct.bank_scales.resize(n_blocks * 16); // 16 sub-blocks per super-block

    float max_scale = 0.0f;

    for (int i = 0; i < n_blocks; i++) {
        const uint8_t* block = blocks + i * BLOCK_SIZE;
        const uint8_t* hmask = block;           // 32 bytes
        const uint8_t* qs    = block + 32;      // 64 bytes
        const uint8_t* sc    = block + 96;      // 12 bytes
        uint16_t d_fp16;
        std::memcpy(&d_fp16, block + 108, 2);   // 2 bytes

        float d_all = fp16_to_float(d_fp16);

        int8_t sub_scales[16];
        decode_q3k_scales(sc, sub_scales);

        // Decode 256 weights
        uint8_t m = 1;
        int is = 0;
        const uint8_t* q = qs;

        for (int n = 0; n < 256; n += 128) {
            int shift = 0;
            for (int j = 0; j < 4; j++) {
                float dl = d_all * (sub_scales[is] - 32);
                bool neg_scale = (dl < 0);
                float abs_dl = std::fabs(dl);
                if (abs_dl > max_scale) max_scale = abs_dl;

                // Convert sub-block scale to unsigned FP8 E4M3
                // Sign is absorbed into weight encoding (matching golden generator + hardware)
                uint16_t dl_fp16;
                uint32_t dl_bits;
                std::memcpy(&dl_bits, &abs_dl, 4);
                int dl_exp = ((dl_bits >> 23) & 0xFF) - 127 + 15;
                uint16_t dl_mant = (dl_bits >> 13) & 0x3FF;
                if (dl_exp <= 0) dl_fp16 = 0;
                else if (dl_exp >= 31) dl_fp16 = 0x7C00;
                else dl_fp16 = (dl_exp << 10) | dl_mant;

                ct.bank_scales[i * 16 + is] = fp16_to_fp8_e4m3(dl_fp16);
                is++;

                for (int l = 0; l < 16; l++) {
                    int idx = i * 256 + n + j * 32 + l;
                    int low2 = (q[l] >> shift) & 3;
                    int high = (hmask[l + (n/128)*32] & m) ? 0 : 4;
                    int signed_w = low2 - high; // -4..+3
                    if (neg_scale) signed_w = -signed_w;
                    if (signed_w > 3) signed_w = 3;
                    if (signed_w < -4) signed_w = -4;
                    uint8_t our_w;
                    if (signed_w >= 0) our_w = (uint8_t)signed_w;       // 0..3
                    else               our_w = (uint8_t)(8 + signed_w); // 4..7
                    ct.weights[idx] = our_w;
                }

                // Second half of sub-block
                dl = d_all * (sub_scales[is] - 32);
                neg_scale = (dl < 0);
                abs_dl = std::fabs(dl);
                if (abs_dl > max_scale) max_scale = abs_dl;

                std::memcpy(&dl_bits, &abs_dl, 4);
                dl_exp = ((dl_bits >> 23) & 0xFF) - 127 + 15;
                dl_mant = (dl_bits >> 13) & 0x3FF;
                if (dl_exp <= 0) dl_fp16 = 0;
                else if (dl_exp >= 31) dl_fp16 = 0x7C00;
                else dl_fp16 = (dl_exp << 10) | dl_mant;

                ct.bank_scales[i * 16 + is] = fp16_to_fp8_e4m3(dl_fp16);
                is++;

                for (int l = 0; l < 16; l++) {
                    int idx = i * 256 + n + j * 32 + 16 + l;
                    int low2 = (q[l + 16] >> shift) & 3;
                    int high = (hmask[l + 16 + (n/128)*32] & m) ? 0 : 4;
                    int signed_w = low2 - high;
                    if (neg_scale) signed_w = -signed_w;
                    if (signed_w > 3) signed_w = 3;
                    if (signed_w < -4) signed_w = -4;
                    uint8_t our_w;
                    if (signed_w >= 0) our_w = (uint8_t)signed_w;
                    else               our_w = (uint8_t)(8 + signed_w);
                    ct.weights[idx] = our_w;
                }

                shift += 2;
                m <<= 1;
            }
            q += 32;
        }
    }

    ct.tensor_scale = max_scale;

    // --- Normalize bank scales by tensor_scale before FP8 encoding ---
    // Without normalization, small scales (like V projection's ~0.02) underflow
    // to zero in FP8 E4M3 (min normal ≈ 0.016). Normalizing puts values in
    // [-1, +1] range; the GEMV multiplies back by tensor_scale at inference.
    if (max_scale > 0) {
        float inv_max = 1.0f / max_scale;

        // Recompute FP8 bank scales with normalization
        for (int bi = 0; bi < n_blocks; bi++) {
            const uint8_t* block = blocks + bi * BLOCK_SIZE;
            const uint8_t* sc = block + 96;
            uint16_t d_fp16;
            std::memcpy(&d_fp16, block + 108, 2);
            float d_all = fp16_to_float(d_fp16);

            int8_t ssc[16];
            decode_q3k_scales(sc, ssc);

            for (int s = 0; s < 16; s++) {
                float dl_abs = std::fabs(d_all * (ssc[s] - 32)) * inv_max;

                // float → fp16 → fp8 (unsigned — sign already in weights)
                uint32_t dl_bits;
                std::memcpy(&dl_bits, &dl_abs, 4);
                int dl_exp = ((dl_bits >> 23) & 0xFF) - 127 + 15;
                uint16_t dl_mant = (dl_bits >> 13) & 0x3FF;
                uint16_t dl_fp16;
                if (dl_exp <= 0) dl_fp16 = 0;
                else if (dl_exp >= 31) dl_fp16 = 0x7C00;
                else dl_fp16 = (dl_exp << 10) | dl_mant;

                ct.bank_scales[bi * 16 + s] = fp16_to_fp8_e4m3(dl_fp16);
            }
        }
    }

    return ct;
}

std::vector<ConvertedTensor> convert_gguf(const std::string& gguf_path) {
    struct ggml_context* ctx_data = nullptr;
    struct gguf_init_params params = {};
    params.no_alloc = false;
    params.ctx = &ctx_data;

    struct gguf_context* gguf = gguf_init_from_file(gguf_path.c_str(), params);
    if (!gguf) {
        std::fprintf(stderr, "Failed to open GGUF: %s\n", gguf_path.c_str());
        return {};
    }

    int64_t n_tensors = gguf_get_n_tensors(gguf);
    std::fprintf(stderr, "GGUF: %ld tensors\n", (long)n_tensors);

    std::vector<ConvertedTensor> result;

    for (int64_t i = 0; i < n_tensors; i++) {
        const char* name = gguf_get_tensor_name(gguf, i);
        enum ggml_type type = gguf_get_tensor_type(gguf, i);

        struct ggml_tensor* tensor = ggml_get_tensor(ctx_data, name);
        if (!tensor) {
            std::fprintf(stderr, "  [%ld] %s: tensor data not found, skipping\n", (long)i, name);
            continue;
        }

        int64_t ne0 = tensor->ne[0];
        int64_t ne1 = tensor->ne[1] > 0 ? tensor->ne[1] : 1;
        int64_t n_elements = ne0 * ne1;

        if (type == GGML_TYPE_Q3_K) {
            result.push_back(convert_q3k_tensor(name, tensor->data, n_elements, ne0, ne1));
            std::fprintf(stderr, "  [%ld] %s: Q3_K [%ld x %ld] → converted\n",
                         (long)i, name, (long)ne1, (long)ne0);
        } else if (type == GGML_TYPE_Q6_K) {
            // Dequantize Q6_K to float (used for output/LM head weight)
            ConvertedTensor ct;
            ct.name = name;
            ct.rows = ne1;
            ct.cols = ne0;
            ct.is_quantized = false;
            ct.tensor_scale = 0.0f;
            ct.float_data.resize(n_elements);
            dequantize_row_q6_K(
                reinterpret_cast<const block_q6_K*>(tensor->data),
                ct.float_data.data(), n_elements);
            result.push_back(std::move(ct));
            std::fprintf(stderr, "  [%ld] %s: Q6_K [%ld x %ld] → dequantized to F32\n",
                         (long)i, name, (long)ne1, (long)ne0);
        } else {
            // Non-quantized tensor (norms, embeddings in F32/F16)
            ConvertedTensor ct;
            ct.name = name;
            ct.rows = ne1;
            ct.cols = ne0;
            ct.is_quantized = false;
            ct.tensor_scale = 0.0f;
            ct.float_data.resize(n_elements);

            if (type == GGML_TYPE_F32) {
                std::memcpy(ct.float_data.data(), tensor->data, n_elements * sizeof(float));
            } else if (type == GGML_TYPE_F16) {
                const uint16_t* fp16 = reinterpret_cast<const uint16_t*>(tensor->data);
                for (int64_t j = 0; j < n_elements; j++) {
                    ct.float_data[j] = fp16_to_float(fp16[j]);
                }
            } else {
                std::fprintf(stderr, "  [%ld] %s: unsupported type %d, skipping\n",
                             (long)i, name, (int)type);
                continue;
            }
            result.push_back(std::move(ct));
            std::fprintf(stderr, "  [%ld] %s: F32 [%ld x %ld]\n",
                         (long)i, name, (long)ne1, (long)ne0);
        }
    }

    gguf_free(gguf);
    ggml_free(ctx_data);
    return result;
}

static void mkdirs(const std::string& path) {
    mkdir(path.c_str(), 0755);
}

void save_converted(const std::vector<ConvertedTensor>& tensors, const std::string& output_dir) {
    mkdirs(output_dir);

    for (const auto& t : tensors) {
        // Sanitize name: replace '.' with '_'
        std::string safe = t.name;
        for (auto& c : safe) { if (c == '.') c = '_'; }

        if (t.is_quantized) {
            // Save weights
            std::string wpath = output_dir + "/" + safe + ".weights.bin";
            FILE* f = std::fopen(wpath.c_str(), "wb");
            if (f) { std::fwrite(t.weights.data(), 1, t.weights.size(), f); std::fclose(f); }

            // Save bank scales
            std::string spath = output_dir + "/" + safe + ".scales.bin";
            f = std::fopen(spath.c_str(), "wb");
            if (f) { std::fwrite(t.bank_scales.data(), 1, t.bank_scales.size(), f); std::fclose(f); }

            // Save tensor scale
            std::string tpath = output_dir + "/" + safe + ".tensor_scale.bin";
            f = std::fopen(tpath.c_str(), "wb");
            if (f) { std::fwrite(&t.tensor_scale, sizeof(float), 1, f); std::fclose(f); }
        } else {
            // Save float data
            std::string fpath = output_dir + "/" + safe + ".float.bin";
            FILE* f = std::fopen(fpath.c_str(), "wb");
            if (f) { std::fwrite(t.float_data.data(), sizeof(float), t.float_data.size(), f); std::fclose(f); }
        }

        // Save metadata
        std::string mpath = output_dir + "/" + safe + ".meta";
        FILE* f = std::fopen(mpath.c_str(), "w");
        if (f) {
            std::fprintf(f, "name=%s\nrows=%ld\ncols=%ld\nquantized=%d\ntensor_scale=%g\n",
                         t.name.c_str(), (long)t.rows, (long)t.cols, t.is_quantized ? 1 : 0, t.tensor_scale);
            std::fclose(f);
        }
    }

    std::fprintf(stderr, "Saved %zu tensors to %s\n", tensors.size(), output_dir.c_str());
}

ConvertedTensor load_converted_tensor(const std::string& dir, const std::string& name) {
    // Sanitize name same way as save_converted
    std::string safe = name;
    for (auto& c : safe) { if (c == '.') c = '_'; }

    ConvertedTensor ct;
    ct.name = name;

    // Read metadata
    std::string mpath = dir + "/" + safe + ".meta";
    FILE* f = std::fopen(mpath.c_str(), "r");
    if (!f) {
        std::fprintf(stderr, "load_converted_tensor: cannot open %s\n", mpath.c_str());
        return ct;
    }
    char line[512];
    while (std::fgets(line, sizeof(line), f)) {
        std::string s(line);
        if (s.rfind("rows=", 0) == 0) ct.rows = std::atol(s.c_str() + 5);
        else if (s.rfind("cols=", 0) == 0) ct.cols = std::atol(s.c_str() + 5);
        else if (s.rfind("quantized=", 0) == 0) ct.is_quantized = std::atoi(s.c_str() + 10) != 0;
        else if (s.rfind("tensor_scale=", 0) == 0) ct.tensor_scale = std::atof(s.c_str() + 13);
    }
    std::fclose(f);

    if (ct.is_quantized) {
        // Load weights
        std::string wpath = dir + "/" + safe + ".weights.bin";
        f = std::fopen(wpath.c_str(), "rb");
        if (f) {
            std::fseek(f, 0, SEEK_END);
            long sz = std::ftell(f);
            std::fseek(f, 0, SEEK_SET);
            ct.weights.resize(sz);
            std::fread(ct.weights.data(), 1, sz, f);
            std::fclose(f);
        }
        // Load bank scales
        std::string spath = dir + "/" + safe + ".scales.bin";
        f = std::fopen(spath.c_str(), "rb");
        if (f) {
            std::fseek(f, 0, SEEK_END);
            long sz = std::ftell(f);
            std::fseek(f, 0, SEEK_SET);
            ct.bank_scales.resize(sz);
            std::fread(ct.bank_scales.data(), 1, sz, f);
            std::fclose(f);
        }
    } else {
        std::string fpath = dir + "/" + safe + ".float.bin";
        f = std::fopen(fpath.c_str(), "rb");
        if (f) {
            std::fseek(f, 0, SEEK_END);
            long sz = std::ftell(f);
            std::fseek(f, 0, SEEK_SET);
            ct.float_data.resize(sz / sizeof(float));
            std::fread(ct.float_data.data(), sizeof(float), ct.float_data.size(), f);
            std::fclose(f);
        }
    }

    return ct;
}

} // namespace opentaalas
