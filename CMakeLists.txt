cmake_minimum_required(VERSION 3.20)
project(OpenTaalas LANGUAGES NONE)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# --- Options ---
option(BUILD_KANAGAWA_COMPILER "Build Kanagawa compiler from source if not found" ON)
set(ORFS_PATH "" CACHE PATH "Path to OpenROAD-flow-scripts")
set(PLATFORM "sky130hd" CACHE STRING "Target PDK platform")

# --- Find toolchains ---
include(FindChiselTools)
include(FindKanagawaCompiler)
include(FindORFS)

# --- Verilator (optional, for lint tests) ---
find_program(VERILATOR_BIN verilator)
if(VERILATOR_BIN)
  message(STATUS "Found Verilator: ${VERILATOR_BIN}")
endif()

# --- Subdirectories ---
enable_testing()
add_subdirectory(rtl)
add_subdirectory(test)
add_subdirectory(flow)

# --- Summary ---
message(STATUS "")
message(STATUS "=== OpenTaalas Build Configuration ===")
message(STATUS "  Chisel toolchain:  ${CHISEL_TOOLS_FOUND}")
message(STATUS "  Kanagawa compiler: ${KANAGAWA_FOUND}")
message(STATUS "  ORFS backend:      ${ORFS_FOUND}")
message(STATUS "  Verilator:         ${VERILATOR_BIN}")
message(STATUS "  Platform:          ${PLATFORM}")
message(STATUS "======================================")
