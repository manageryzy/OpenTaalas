#include "gguf_converter.h"
#include <cstdio>
#include <cstdlib>

int main(int argc, char** argv) {
  if (argc != 3) {
    std::fprintf(stderr, "Usage: %s <input.gguf> <output_dir>\n", argv[0]);
    return 1;
  }

  auto tensors = opentaalas::convert_gguf(argv[1]);
  if (tensors.empty()) {
    std::fprintf(stderr, "No tensors converted\n");
    return 1;
  }

  opentaalas::save_converted(tensors, argv[2]);
  std::fprintf(stderr, "Done: %zu tensors converted\n", tensors.size());
  return 0;
}
