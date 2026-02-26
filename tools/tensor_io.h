#pragma once
#include <vector>
#include <string>
#include <cstdio>
#include <cstdint>
#include <sys/stat.h>

namespace opentaalas {

struct TensorDump {
  std::string name;
  std::vector<float> data;
  int64_t size;
};

inline void dump_tensor(const std::string& dir, const std::string& name,
                        const float* data, int64_t n) {
  mkdir(dir.c_str(), 0755);
  std::string path = dir + "/" + name + ".bin";
  FILE* f = std::fopen(path.c_str(), "wb");
  if (f) { std::fwrite(data, sizeof(float), n, f); std::fclose(f); }
}

inline void dump_tensor(const std::string& dir, const std::string& name,
                        const std::vector<float>& data) {
  dump_tensor(dir, name, data.data(), data.size());
}

inline TensorDump load_tensor(const std::string& dir, const std::string& name) {
  TensorDump t;
  t.name = name;
  std::string path = dir + "/" + name + ".bin";
  FILE* f = std::fopen(path.c_str(), "rb");
  if (!f) { t.size = 0; return t; }
  std::fseek(f, 0, SEEK_END);
  long sz = std::ftell(f);
  std::fseek(f, 0, SEEK_SET);
  t.size = sz / sizeof(float);
  t.data.resize(t.size);
  std::fread(t.data.data(), sizeof(float), t.size, f);
  std::fclose(f);
  return t;
}

} // namespace opentaalas
