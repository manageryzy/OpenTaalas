# test/systemc/CMakeLists.txt — Per-module SystemC reference model tests

if(NOT (SYSTEMC_FOUND AND AC_TYPES_FOUND))
  return()
endif()

set(_systemc_modules
  bf16_math
  rom_bank lut_interp
  mac_pe dequant mac_array
  codebook_decoder
  kv_cache attention_unit rmsnorm swiglu rope
  vector_unit layer_tile
  embed_rom lm_head global_controller llama_chip
)

foreach(_mod ${_systemc_modules})
  add_executable(test_${_mod} test_${_mod}.cpp)
  target_link_libraries(test_${_mod} PRIVATE opentaalas_model)
  add_test(
    NAME systemc_${_mod}
    COMMAND test_${_mod}
  )
  set_tests_properties(systemc_${_mod} PROPERTIES
    LABELS "systemc"
    TIMEOUT 30
  )
endforeach()

# Weight generator test (header-only, no SystemC/ac_types dependency)
add_executable(test_weight_generator test_weight_generator.cpp)
target_include_directories(test_weight_generator PRIVATE
  "${CMAKE_SOURCE_DIR}/tools")
add_test(NAME systemc_weight_generator COMMAND test_weight_generator)
set_tests_properties(systemc_weight_generator PROPERTIES
  LABELS "systemc"
  TIMEOUT 30
)

# ROM SV generator test (header-only, no SystemC/ac_types dependency)
add_executable(test_rom_sv_generator test_rom_sv_generator.cpp)
target_include_directories(test_rom_sv_generator PRIVATE
  "${CMAKE_SOURCE_DIR}/tools")
add_test(NAME systemc_rom_sv_generator COMMAND test_rom_sv_generator)
set_tests_properties(systemc_rom_sv_generator PROPERTIES
  LABELS "systemc"
  TIMEOUT 30
)

# GGUF converter test (needs tools/ include path, no ggml dependency for unit test)
if(LLAMA_FOUND)
  add_executable(test_gguf_converter test_gguf_converter.cpp)
  target_include_directories(test_gguf_converter PRIVATE
    "${CMAKE_SOURCE_DIR}/tools")
  add_test(NAME systemc_gguf_converter COMMAND test_gguf_converter)
  set_tests_properties(systemc_gguf_converter PROPERTIES
    LABELS "systemc"
    TIMEOUT 30
  )
endif()
