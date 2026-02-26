# FindVerilator.cmake — Find Verilator and provide verilate() function
#
# Sets:
#   VERILATOR_FOUND — TRUE if Verilator available (with verilate() function)
#   VERILATOR_BIN   — Path to verilator_bin executable
#
# Verilator's CMake config calls check_cxx_compiler_flag(), so CXX must be
# enabled before find_package(verilator).  Enable it here if not already on
# (the project starts with LANGUAGES NONE).

get_property(_cxx_enabled GLOBAL PROPERTY ENABLED_LANGUAGES)
if(NOT "CXX" IN_LIST _cxx_enabled)
  enable_language(CXX)
endif()

find_package(verilator QUIET)
if(verilator_FOUND)
  set(VERILATOR_FOUND TRUE CACHE BOOL "Verilator found" FORCE)
  message(STATUS "Found Verilator: ${VERILATOR_BIN}")
else()
  set(VERILATOR_FOUND FALSE CACHE BOOL "Verilator found" FORCE)
  message(STATUS "Verilator not found — Verilator co-sim tests disabled")
endif()
