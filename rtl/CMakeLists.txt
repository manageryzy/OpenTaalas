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

# =============================================================================
# Aggregate target
# =============================================================================
add_custom_target(rtl_all
  COMMENT "Generating all RTL"
)

if(CHISEL_TOOLS_FOUND)
  add_dependencies(rtl_all chisel_smoke_adder)
endif()
if(KANAGAWA_FOUND)
  add_dependencies(rtl_all kanagawa_smoke_accumulator)
endif()
