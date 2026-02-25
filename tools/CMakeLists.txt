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
    "${_llama_src}/include")
  target_link_libraries(gguf_converter_lib PUBLIC ggml)

  add_executable(gguf_converter gguf_converter_main.cpp)
  target_link_libraries(gguf_converter PRIVATE gguf_converter_lib)
endif()
