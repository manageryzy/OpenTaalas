# rtl/CMakeLists.txt — RTL generation targets for Chisel and Kanagawa

set(RTL_GENERATED_DIR "${CMAKE_SOURCE_DIR}/rtl/generated")
file(MAKE_DIRECTORY "${RTL_GENERATED_DIR}")
file(MAKE_DIRECTORY "${RTL_GENERATED_DIR}/kanagawa")

# =============================================================================
# Chisel targets
# =============================================================================
if(CHISEL_TOOLS_FOUND)
  set(_chisel_dir "${CMAKE_SOURCE_DIR}/rtl/chisel")

  add_custom_target(chisel_smoke_adder
    COMMAND ${CMAKE_COMMAND} -E env
      "JAVA_HOME=${JAVA_HOME}"
      "PATH=${FIRTOOL_BIN}/../:$ENV{PATH}"
      "GENERATED_DIR=${RTL_GENERATED_DIR}"
      ${MILL_BIN} -i smoke.run
    WORKING_DIRECTORY "${_chisel_dir}"
    COMMENT "Chisel: generating SmokeAdder.sv"
    VERBATIM
  )
else()
  message(STATUS "Chisel targets: skipped (toolchain not found)")
endif()

# =============================================================================
# Kanagawa targets
# =============================================================================

# Helper function: add_kanagawa_rtl(NAME <name> SOURCE <file> [DEPENDS <target>])
function(add_kanagawa_rtl)
  cmake_parse_arguments(KNG "" "NAME;SOURCE" "DEPENDS" ${ARGN})

  if(NOT KANAGAWA_FOUND)
    message(STATUS "Kanagawa target ${KNG_NAME}: skipped (compiler not found)")
    return()
  endif()

  set(_output_prefix "${RTL_GENERATED_DIR}/kanagawa/${KNG_NAME}")
  set(_source_file "${CMAKE_SOURCE_DIR}/rtl/kanagawa/${KNG_SOURCE}")

  set(_deps "")
  if(KANAGAWA_NEEDS_BUILD)
    list(APPEND _deps kanagawa_compiler)
  endif()
  if(KNG_DEPENDS)
    list(APPEND _deps ${KNG_DEPENDS})
  endif()

  add_custom_target(kanagawa_${KNG_NAME}
    COMMAND ${KANAGAWA_EXE}
      --backend=sv
      --import-dir=${KANAGAWA_LIBRARY_DIR}
      --base-library=${KANAGAWA_BASE_LIBRARY}
      --output=${_output_prefix}
      ${_source_file}
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    COMMENT "Kanagawa: generating ${KNG_NAME} RTL"
    VERBATIM
  )

  if(_deps)
    add_dependencies(kanagawa_${KNG_NAME} ${_deps})
  endif()
endfunction()

# --- Register Kanagawa designs ---
add_kanagawa_rtl(NAME smoke_accumulator SOURCE smoke_accumulator.k)

# --- LLaMA 3.1 8B accelerator modules ---
# Phase 1: Foundation
add_kanagawa_rtl(NAME rom_bank SOURCE rom_bank.k)
add_kanagawa_rtl(NAME scale_store SOURCE scale_store.k)
add_kanagawa_rtl(NAME lut_interp SOURCE lut_interp.k)

# Phase 2: Compute cores
add_kanagawa_rtl(NAME mac_pe SOURCE mac_pe.k)
add_kanagawa_rtl(NAME dequant SOURCE dequant.k)
add_kanagawa_rtl(NAME mac_array SOURCE mac_array.k)

# Phase 3: Attention and vector processing
add_kanagawa_rtl(NAME kv_cache SOURCE kv_cache.k)
add_kanagawa_rtl(NAME attention_unit SOURCE attention_unit.k)
add_kanagawa_rtl(NAME rmsnorm SOURCE rmsnorm.k)
add_kanagawa_rtl(NAME swiglu SOURCE swiglu.k)
add_kanagawa_rtl(NAME rope SOURCE rope.k)

# Phase 4: Integration
add_kanagawa_rtl(NAME vector_unit SOURCE vector_unit.k)
add_kanagawa_rtl(NAME layer_tile SOURCE layer_tile.k)

# Phase 5: Top-level
add_kanagawa_rtl(NAME embed_rom SOURCE embed_rom.k)
add_kanagawa_rtl(NAME lm_head SOURCE lm_head.k)
add_kanagawa_rtl(NAME global_controller SOURCE global_controller.k)
add_kanagawa_rtl(NAME llama_chip SOURCE llama_chip.k)

# =============================================================================
# Aggregate targets
# =============================================================================
add_custom_target(rtl_all
  COMMENT "Generating all RTL"
)

# LLaMA accelerator modules only
add_custom_target(rtl_llama
  COMMENT "Generating LLaMA 3.1 8B accelerator RTL"
)

if(CHISEL_TOOLS_FOUND)
  add_dependencies(rtl_all chisel_smoke_adder)
endif()
if(KANAGAWA_FOUND)
  add_dependencies(rtl_all kanagawa_smoke_accumulator
    kanagawa_rom_bank kanagawa_scale_store kanagawa_lut_interp
    kanagawa_mac_pe kanagawa_dequant kanagawa_mac_array
    kanagawa_kv_cache kanagawa_attention_unit kanagawa_rmsnorm
    kanagawa_swiglu kanagawa_rope
    kanagawa_vector_unit kanagawa_layer_tile
    kanagawa_embed_rom kanagawa_lm_head kanagawa_global_controller
    kanagawa_llama_chip
  )
  add_dependencies(rtl_llama
    kanagawa_rom_bank kanagawa_scale_store kanagawa_lut_interp
    kanagawa_mac_pe kanagawa_dequant kanagawa_mac_array
    kanagawa_kv_cache kanagawa_attention_unit kanagawa_rmsnorm
    kanagawa_swiglu kanagawa_rope
    kanagawa_vector_unit kanagawa_layer_tile
    kanagawa_embed_rom kanagawa_lm_head kanagawa_global_controller
    kanagawa_llama_chip
  )
endif()
