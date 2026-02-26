// tensor_extractor.cpp — Run llama.cpp inference and dump logits/embeddings
// Usage: tensor_extractor --model <path.gguf> --prompt <text> --output <dir>

#include <llama.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#include <sys/stat.h>

static void usage(const char* prog) {
    fprintf(stderr, "Usage: %s --model <path.gguf> --prompt <text> --output <dir>\n", prog);
    exit(1);
}

static bool write_floats(const char* path, const float* data, size_t count) {
    FILE* f = fopen(path, "wb");
    if (!f) { perror(path); return false; }
    size_t written = fwrite(data, sizeof(float), count, f);
    fclose(f);
    return written == count;
}

int main(int argc, char** argv) {
    const char* model_path = nullptr;
    const char* prompt = nullptr;
    const char* output_dir = nullptr;

    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--model") && i + 1 < argc) model_path = argv[++i];
        else if (!strcmp(argv[i], "--prompt") && i + 1 < argc) prompt = argv[++i];
        else if (!strcmp(argv[i], "--output") && i + 1 < argc) output_dir = argv[++i];
        else usage(argv[0]);
    }
    if (!model_path || !prompt || !output_dir) usage(argv[0]);

    mkdir(output_dir, 0755);

    // Load model
    auto mparams = llama_model_default_params();
    struct llama_model* model = llama_model_load_from_file(model_path, mparams);
    if (!model) { fprintf(stderr, "Failed to load model: %s\n", model_path); return 1; }

    const struct llama_vocab* vocab = llama_model_get_vocab(model);
    int32_t n_vocab = llama_vocab_n_tokens(vocab);
    int32_t n_embd = llama_model_n_embd(model);

    // Create context
    auto cparams = llama_context_default_params();
    cparams.n_ctx = 512;
    cparams.n_batch = 512;
    cparams.embeddings = true;

    struct llama_context* ctx = llama_init_from_model(model, cparams);
    if (!ctx) { fprintf(stderr, "Failed to create context\n"); llama_model_free(model); return 1; }

    // Tokenize
    int text_len = (int)strlen(prompt);
    std::vector<llama_token> tokens(text_len + 16);
    int32_t n_tokens = llama_tokenize(vocab, prompt, text_len,
                                       tokens.data(), (int32_t)tokens.size(),
                                       true, false);
    if (n_tokens < 0) {
        tokens.resize(-n_tokens);
        n_tokens = llama_tokenize(vocab, prompt, text_len,
                                   tokens.data(), (int32_t)tokens.size(),
                                   true, false);
    }
    if (n_tokens < 0) { fprintf(stderr, "Tokenization failed\n"); return 1; }
    tokens.resize(n_tokens);

    fprintf(stderr, "Tokens: %d, Vocab: %d, Embd: %d\n", n_tokens, n_vocab, n_embd);
    fprintf(stderr, "Token IDs:");
    for (int i = 0; i < n_tokens; i++) fprintf(stderr, " %d", tokens[i]);
    fprintf(stderr, "\n");

    // Decode
    struct llama_batch batch = llama_batch_get_one(tokens.data(), n_tokens);
    if (llama_decode(ctx, batch) != 0) { fprintf(stderr, "Decode failed\n"); return 1; }

    // Extract logits
    float* logits = llama_get_logits_ith(ctx, -1);
    if (logits) {
        std::string path = std::string(output_dir) + "/logits.bin";
        if (!write_floats(path.c_str(), logits, n_vocab)) return 1;
        fprintf(stderr, "Wrote logits: %d floats\n", n_vocab);
    } else {
        fprintf(stderr, "Warning: no logits available\n");
    }

    // Extract embeddings
    float* embd = llama_get_embeddings_ith(ctx, -1);
    if (embd) {
        std::string path = std::string(output_dir) + "/embeddings.bin";
        if (!write_floats(path.c_str(), embd, n_embd)) return 1;
        fprintf(stderr, "Wrote embeddings: %d floats\n", n_embd);
    }

    // Write manifest
    {
        std::string path = std::string(output_dir) + "/manifest.txt";
        FILE* f = fopen(path.c_str(), "w");
        if (!f) { perror(path.c_str()); return 1; }
        fprintf(f, "model=%s\n", model_path);
        fprintf(f, "prompt=%s\n", prompt);
        fprintf(f, "n_tokens=%d\n", n_tokens);
        fprintf(f, "n_vocab=%d\n", n_vocab);
        fprintf(f, "n_embd=%d\n", n_embd);
        fclose(f);
    }

    llama_free(ctx);
    llama_model_free(model);
    fprintf(stderr, "Done. Output in %s\n", output_dir);
    return 0;
}
