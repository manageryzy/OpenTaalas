// compare_tensors.cpp — Compare two sets of tensor dumps
// Usage: compare_tensors --ref <dir> --test <dir> [--threshold <max_abs>]

#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <vector>
#include <string>
#include <dirent.h>

static std::vector<float> load_floats(const char* path) {
    FILE* f = fopen(path, "rb");
    if (!f) return {};
    fseek(f, 0, SEEK_END);
    size_t bytes = ftell(f);
    fseek(f, 0, SEEK_SET);
    std::vector<float> data(bytes / sizeof(float));
    size_t nread = fread(data.data(), sizeof(float), data.size(), f);
    data.resize(nread);
    fclose(f);
    return data;
}

struct Metrics {
    double max_abs;
    double mean_abs;
    double cosine;
    int argmax_a, argmax_b;
    bool argmax_match;
};

static Metrics compare(const std::vector<float>& a, const std::vector<float>& b) {
    Metrics m = {};
    size_t n = a.size();
    double sum_abs = 0, dot = 0, norm_a = 0, norm_b = 0;
    m.argmax_a = 0; m.argmax_b = 0;

    for (size_t i = 0; i < n; i++) {
        double diff = fabs((double)a[i] - (double)b[i]);
        if (diff > m.max_abs) m.max_abs = diff;
        sum_abs += diff;
        dot += (double)a[i] * (double)b[i];
        norm_a += (double)a[i] * (double)a[i];
        norm_b += (double)b[i] * (double)b[i];
        if (a[i] > a[m.argmax_a]) m.argmax_a = (int)i;
        if (b[i] > b[m.argmax_b]) m.argmax_b = (int)i;
    }

    m.mean_abs = n > 0 ? sum_abs / n : 0;
    double denom = sqrt(norm_a) * sqrt(norm_b);
    m.cosine = denom > 0 ? dot / denom : 0;
    m.argmax_match = (m.argmax_a == m.argmax_b);
    return m;
}

int main(int argc, char** argv) {
    const char* ref_dir = nullptr;
    const char* test_dir = nullptr;
    double threshold = 0.01;

    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--ref") && i + 1 < argc) ref_dir = argv[++i];
        else if (!strcmp(argv[i], "--test") && i + 1 < argc) test_dir = argv[++i];
        else if (!strcmp(argv[i], "--threshold") && i + 1 < argc) threshold = atof(argv[++i]);
    }
    if (!ref_dir || !test_dir) {
        fprintf(stderr, "Usage: compare_tensors --ref <dir> --test <dir> [--threshold <max_abs>]\n");
        return 1;
    }

    // Find .bin files in ref directory
    DIR* dir = opendir(ref_dir);
    if (!dir) { perror(ref_dir); return 1; }

    int pass = 0, fail = 0;
    struct dirent* ent;
    while ((ent = readdir(dir))) {
        std::string name = ent->d_name;
        if (name.size() < 5 || name.substr(name.size() - 4) != ".bin") continue;

        std::string ref_path = std::string(ref_dir) + "/" + name;
        std::string test_path = std::string(test_dir) + "/" + name;

        auto a = load_floats(ref_path.c_str());
        auto b = load_floats(test_path.c_str());

        std::string label = name.substr(0, name.size() - 4);

        if (b.empty()) {
            printf("%-16s SKIP (not found in test)\n", label.c_str());
            continue;
        }
        if (a.size() != b.size()) {
            printf("%-16s FAIL size mismatch (ref=%zu test=%zu)\n", label.c_str(), a.size(), b.size());
            fail++;
            continue;
        }

        Metrics m = compare(a, b);
        bool ok = m.max_abs <= threshold && m.argmax_match;
        printf("%-16s max_abs=%.6f  mean_abs=%.6f  cosine=%.6f  argmax=%s(%d)  %s\n",
               (label + ":").c_str(), m.max_abs, m.mean_abs, m.cosine,
               m.argmax_match ? "MATCH" : "MISMATCH", m.argmax_a,
               ok ? "PASS" : "FAIL");
        if (ok) pass++; else fail++;
    }
    closedir(dir);

    printf("\nSummary: %d PASS, %d FAIL\n", pass, fail);
    return fail > 0 ? 1 : 0;
}
