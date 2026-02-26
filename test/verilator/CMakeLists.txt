# test/verilator/CMakeLists.txt — Verilator co-simulation tests for Kanagawa RTL

if(NOT VERILATOR_FOUND OR NOT KANAGAWA_FOUND)
  return()
endif()

set(_rt "${CMAKE_SOURCE_DIR}/third-party/kanagawa/runtime/rtl")
set(_gen_dir "${CMAKE_SOURCE_DIR}/rtl/generated/kanagawa")

# =============================================================================
# Kanagawa runtime SV files — parse-order matters (packages first)
# =============================================================================
set(KANAGAWA_RUNTIME_SV
  # Packages (MUST be first)
  ${_rt}/types.sv
  ${_rt}/functions.sv

  # Core primitives
  ${_rt}/flip_flop_chains.sv
  ${_rt}/reset_control.sv
  ${_rt}/write_delay_fifo.sv
  ${_rt}/fixed_delay_fifo.sv
  ${_rt}/sync_ram_with_error.sv
  ${_rt}/memory_bypass.sv
  ${_rt}/full_empty_counter.sv
  ${_rt}/fifo_ptrs.sv
  ${_rt}/fifo_ptrs_ex.sv
  ${_rt}/fifo_debug.sv
  ${_rt}/show_ahead_register_fifo.sv
  ${_rt}/register_fifo.sv
  ${_rt}/one_register_fifo.sv
  ${_rt}/skid_buffer.sv

  # Mock HAL (simulation-safe)
  ${_rt}/hal/mock/hal_non_mergeable_registers.sv
  ${_rt}/hal/mock/hal_show_ahead_fifo.sv
  ${_rt}/hal/mock/hal_ready_valid_fifo.sv
  ${_rt}/hal/mock/hal_simple_dual_port_ram_tile.sv
  ${_rt}/hal/mock/hal_dual_port_ram.sv

  # Sim utilities
  ${_rt}/sim/string_table.sv
)

# =============================================================================
# Helper: add_verilator_cosim_test(NAME <name> TOP <top_module> TEST <test.cpp>)
#
# Expects generated SV at:
#   ${_gen_dir}/${NAME}${TOP}_types.sv
#   ${_gen_dir}/${NAME}${TOP}.sv
# =============================================================================
function(add_verilator_cosim_test)
  cmake_parse_arguments(ARG "" "NAME;TOP;TEST" "" ${ARGN})

  if(NOT ARG_NAME OR NOT ARG_TOP OR NOT ARG_TEST)
    message(FATAL_ERROR "add_verilator_cosim_test requires NAME, TOP, and TEST")
  endif()

  set(_types_sv "${_gen_dir}/${ARG_NAME}${ARG_TOP}_types.sv")
  set(_top_sv   "${_gen_dir}/${ARG_NAME}${ARG_TOP}.sv")

  if(NOT EXISTS "${_top_sv}" OR NOT EXISTS "${_types_sv}")
    message(STATUS "Skipping verilator_cosim_${ARG_NAME}: generated SV not found")
    return()
  endif()

  set(_target "test_vl_${ARG_NAME}")

  add_executable(${_target} ${ARG_TEST})
  target_include_directories(${_target} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

  verilate(${_target}
    PREFIX V${ARG_TOP}
    TOP_MODULE ${ARG_TOP}
    SOURCES
      ${_types_sv}
      ${KANAGAWA_RUNTIME_SV}
      ${_top_sv}
    VERILATOR_ARGS
      -Wno-lint -Wno-UNOPTFLAT -Wno-TIMESCALEMOD -Wno-WIDTHCONCAT -DSIMULATION
  )

  add_test(
    NAME verilator_cosim_${ARG_NAME}
    COMMAND ${_target}
  )
  set_tests_properties(verilator_cosim_${ARG_NAME} PROPERTIES
    LABELS "verilator"
    TIMEOUT 30
  )
endfunction()

# =============================================================================
# Phase 1: Compute Core
# =============================================================================
add_verilator_cosim_test(NAME mac_pe TOP mac_pe TEST test_vl_mac_pe.cpp)

# =============================================================================
# Phase 1: Storage
# =============================================================================
add_verilator_cosim_test(NAME rom_bank    TOP rom_bank    TEST test_vl_rom_bank.cpp)
add_verilator_cosim_test(NAME scale_store TOP scale_store TEST test_vl_scale_store.cpp)
add_verilator_cosim_test(NAME lut_interp  TOP lut_unit    TEST test_vl_lut_interp.cpp)

# =============================================================================
# Phase 2: Compute
# =============================================================================
add_verilator_cosim_test(NAME codebook_decoder TOP codebook_decoder TEST test_vl_codebook_decoder.cpp)
add_verilator_cosim_test(NAME dequant         TOP dequant_unit     TEST test_vl_dequant.cpp)
add_verilator_cosim_test(NAME mac_array       TOP mac_array        TEST test_vl_mac_array.cpp)

# =============================================================================
# Phase 3: Attention & Vector
# =============================================================================
add_verilator_cosim_test(NAME kv_cache        TOP kv_cache        TEST test_vl_kv_cache.cpp)
add_verilator_cosim_test(NAME attention_unit  TOP attention_unit  TEST test_vl_attention_unit.cpp)
add_verilator_cosim_test(NAME rmsnorm        TOP rmsnorm_unit    TEST test_vl_rmsnorm.cpp)
add_verilator_cosim_test(NAME swiglu         TOP swiglu_unit     TEST test_vl_swiglu.cpp)
add_verilator_cosim_test(NAME rope           TOP rope_unit       TEST test_vl_rope.cpp)

# =============================================================================
# Phase 4: Integration
# =============================================================================
add_verilator_cosim_test(NAME vector_unit TOP vector_unit TEST test_vl_vector_unit.cpp)
add_verilator_cosim_test(NAME layer_tile  TOP layer_tile  TEST test_vl_layer_tile.cpp)

# =============================================================================
# Phase 5: Top-Level
# =============================================================================
add_verilator_cosim_test(NAME embed_rom         TOP embed_rom         TEST test_vl_embed_rom.cpp)
add_verilator_cosim_test(NAME lm_head           TOP lm_head           TEST test_vl_lm_head.cpp)
add_verilator_cosim_test(NAME global_controller TOP global_controller TEST test_vl_global_controller.cpp)
add_verilator_cosim_test(NAME llama_chip        TOP llama_chip        TEST test_vl_llama_chip.cpp)
