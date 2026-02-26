# test/CMakeLists.txt — CTest targets for OpenTaalas

enable_testing()

set(_kng_src "${CMAKE_SOURCE_DIR}/third-party/kanagawa")

# =============================================================================
# Chisel tests
# =============================================================================
if(CHISEL_TOOLS_FOUND)
  set(_chisel_dir "${CMAKE_SOURCE_DIR}/rtl/chisel")

  add_test(
    NAME chisel_compile
    COMMAND ${CMAKE_COMMAND} -E env
      "JAVA_HOME=${JAVA_HOME}"
      ${MILL_BIN} -i smoke.compile
    WORKING_DIRECTORY "${_chisel_dir}"
  )
  set_tests_properties(chisel_compile PROPERTIES
    LABELS "chisel"
    TIMEOUT 300
  )
endif()

# =============================================================================
# Kanagawa tests
# =============================================================================
if(KANAGAWA_FOUND)
  # Syntax test on smoke_adder.k
  find_program(_python3 python3)
  if(_python3 AND EXISTS "${_kng_src}/test/syntax/syntax-test.py")
    add_test(
      NAME kanagawa_syntax
      COMMAND ${_python3} "${_kng_src}/test/syntax/syntax-test.py"
        -kanagawa "${KANAGAWA_EXE}"
        -testfile "${CMAKE_SOURCE_DIR}/rtl/kanagawa/smoke_adder.k"
        -helperdir "${_kng_src}/test/syntax"
        -options "--jobs=1 --Wno-redundant-import --base-library=${KANAGAWA_BASE_LIBRARY} --import-dir=${KANAGAWA_LIBRARY_DIR}"
      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    )
    set_tests_properties(kanagawa_syntax PROPERTIES
      LABELS "kanagawa"
      TIMEOUT 60
    )
  endif()

  # RTL generation test — verify kanagawa produces .sv output
  set(_kng_test_out "${CMAKE_BINARY_DIR}/test_output/kanagawa")
  file(MAKE_DIRECTORY "${_kng_test_out}")

  add_test(
    NAME kanagawa_rtl_gen
    COMMAND ${KANAGAWA_EXE}
      --backend=sv
      --import-dir=${KANAGAWA_LIBRARY_DIR}
      --base-library=${KANAGAWA_BASE_LIBRARY}
      --output=${_kng_test_out}/smoke_accumulator
      "${CMAKE_SOURCE_DIR}/rtl/kanagawa/smoke_accumulator.k"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  )
  set_tests_properties(kanagawa_rtl_gen PROPERTIES
    LABELS "kanagawa"
    TIMEOUT 120
  )

  # --- LLaMA 3.1 8B module RTL generation tests ---
  set(_llama_modules
    rom_bank scale_store lut_interp
    codebook_decoder mac_pe dequant mac_array
    kv_cache attention_unit rmsnorm swiglu rope
    vector_unit layer_tile
    embed_rom lm_head global_controller llama_chip
  )

  foreach(_mod ${_llama_modules})
    add_test(
      NAME kanagawa_rtl_${_mod}
      COMMAND ${KANAGAWA_EXE}
        --backend=sv
        --import-dir=${KANAGAWA_LIBRARY_DIR}
        --base-library=${KANAGAWA_BASE_LIBRARY}
        --output=${_kng_test_out}/${_mod}
        "${CMAKE_SOURCE_DIR}/rtl/kanagawa/${_mod}.k"
      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    )
    set_tests_properties(kanagawa_rtl_${_mod} PROPERTIES
      LABELS "kanagawa;llama"
      TIMEOUT 300
    )
  endforeach()
endif()

# =============================================================================
# Verilator lint tests
# =============================================================================
if(VERILATOR_BIN)
  set(_gen_dir "${CMAKE_SOURCE_DIR}/rtl/generated")

  if(EXISTS "${_gen_dir}/SmokeAdder.sv")
    add_test(
      NAME verilator_lint_smoke_adder
      COMMAND ${VERILATOR_BIN} --lint-only "${_gen_dir}/SmokeAdder.sv"
    )
    set_tests_properties(verilator_lint_smoke_adder PROPERTIES
      LABELS "lint"
      TIMEOUT 30
    )
  endif()
endif()

# =============================================================================
# SystemC reference model tests
# =============================================================================
if(SYSTEMC_FOUND AND AC_TYPES_FOUND)
  add_subdirectory(systemc)
endif()
