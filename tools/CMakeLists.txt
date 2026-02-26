# tools/CMakeLists.txt — Validation pipeline tools
# Requires llama.cpp for GGUF parsing and tensor extraction

set(_llama_src "${CMAKE_SOURCE_DIR}/third-party/llama.cpp")

if(EXISTS "${_llama_src}/CMakeLists.txt")
  # Build llama.cpp as subdirectory (static libs only, no examples)
  set(LLAMA_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
  set(LLAMA_BUILD_TESTS OFF CACHE BOOL "" FORCE)
  set(LLAMA_BUILD_SERVER OFF CACHE BOOL "" FORCE)
  set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
  add_subdirectory("${_llama_src}" "${CMAKE_BINARY_DIR}/third-party/llama.cpp" EXCLUDE_FROM_ALL)
  set(LLAMA_FOUND TRUE CACHE BOOL "llama.cpp found" FORCE)
  message(STATUS "Found llama.cpp: third-party/llama.cpp (building from source)")
else()
  set(LLAMA_FOUND FALSE CACHE BOOL "llama.cpp found" FORCE)
  message(STATUS "llama.cpp not found — validation tools disabled")
endif()

# --- GGUF Weight Converter ---
if(LLAMA_FOUND)
  add_library(gguf_converter_lib STATIC gguf_converter.cpp)
  target_include_directories(gguf_converter_lib PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}"
    "${_llama_src}/ggml/include"
    "${_llama_src}/ggml/src"
    "${_llama_src}/include")
  target_link_libraries(gguf_converter_lib PUBLIC ggml)

  add_executable(gguf_converter gguf_converter_main.cpp)
  target_link_libraries(gguf_converter PRIVATE gguf_converter_lib)

  # --- Tensor Extractor (llama.cpp inference + logits dump) ---
  add_executable(tensor_extractor tensor_extractor.cpp)
  target_include_directories(tensor_extractor PRIVATE
    "${_llama_src}/include"
    "${_llama_src}/ggml/include"
    "${CMAKE_CURRENT_SOURCE_DIR}")
  target_link_libraries(tensor_extractor PRIVATE llama ggml)

  # --- C Model Forward Pass Runner ---
  add_executable(cmodel_runner cmodel_runner_main.cpp)
  target_include_directories(cmodel_runner PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
  target_link_libraries(cmodel_runner PRIVATE gguf_converter_lib opentaalas_model)
endif()

# --- Tensor Comparison Tool (standalone, no dependencies) ---
add_executable(compare_tensors compare_tensors.cpp)
target_link_libraries(compare_tensors PRIVATE m)
