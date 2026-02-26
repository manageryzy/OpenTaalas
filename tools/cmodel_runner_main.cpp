// cmodel_runner_main.cpp — CLI for C model forward pass runner
#include "cmodel_runner.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>

static void usage(const char* prog) {
  std::fprintf(stderr, "Usage: %s --weights <dir> --token <id> --output <dir>\n", prog);
  std::exit(1);
}

int main(int argc, char** argv) {
  const char* weights_dir = nullptr;
  const char* output_dir = nullptr;
  int token_id = -1;

  for (int i = 1; i < argc; i++) {
    if (std::strcmp(argv[i], "--weights") == 0 && i + 1 < argc)
      weights_dir = argv[++i];
    else if (std::strcmp(argv[i], "--token") == 0 && i + 1 < argc)
      token_id = std::atoi(argv[++i]);
    else if (std::strcmp(argv[i], "--output") == 0 && i + 1 < argc)
      output_dir = argv[++i];
    else
      usage(argv[0]);
  }

  if (!weights_dir || token_id < 0 || !output_dir) usage(argv[0]);

  opentaalas::CModelRunner<> runner;
  if (!runner.load_weights(weights_dir)) {
    std::fprintf(stderr, "Failed to load weights from %s\n", weights_dir);
    return 1;
  }

  int result = runner.run_token(token_id, output_dir);
  std::printf("%d\n", result);
  return 0;
}
