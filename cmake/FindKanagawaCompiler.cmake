# FindKanagawaCompiler.cmake — Locate or build the Kanagawa HLS compiler
#
# Sets:
#   KANAGAWA_FOUND        — TRUE if compiler available
#   KANAGAWA_EXE          — Path to kanagawa binary
#   KANAGAWA_LIBRARY_DIR  — Path to kanagawa standard library
#   KANAGAWA_BASE_LIBRARY — Path to mini-base.k

set(_kng_src "${CMAKE_SOURCE_DIR}/third-party/kanagawa")
set(_kng_build "${CMAKE_SOURCE_DIR}/.build/kanagawa")

set(KANAGAWA_LIBRARY_DIR "${_kng_src}/library")
set(KANAGAWA_BASE_LIBRARY "${_kng_src}/library/mini-base.k")

# --- Check for pre-built compiler ---
if(EXISTS "${_kng_build}/dist/bin/kanagawa")
  set(KANAGAWA_EXE "${_kng_build}/dist/bin/kanagawa")
  set(KANAGAWA_FOUND TRUE)
  message(STATUS "Found Kanagawa compiler (pre-built): ${KANAGAWA_EXE}")
  return()
endif()

# --- Check for system-installed kanagawa ---
find_program(KANAGAWA_EXE kanagawa)
if(KANAGAWA_EXE)
  set(KANAGAWA_FOUND TRUE)
  message(STATUS "Found Kanagawa compiler (system): ${KANAGAWA_EXE}")
  return()
endif()

# --- Build from source via ExternalProject ---
if(NOT EXISTS "${_kng_src}/CMakeLists.txt")
  set(KANAGAWA_FOUND FALSE)
  message(WARNING "Kanagawa source not found at ${_kng_src} — run: git submodule update --init --recursive")
  return()
endif()

include(ExternalProject)

# Forward environment variables for the kanagawa build
set(_kng_cmake_args
  -DCMAKE_BUILD_TYPE=RelWithDebInfo
  -DCMAKE_MAKE_PROGRAM=${CMAKE_MAKE_PROGRAM}
)
if(DEFINED ENV{Boost_DIR})
  list(APPEND _kng_cmake_args "-DBoost_DIR=$ENV{Boost_DIR}")
endif()
if(DEFINED ENV{GHCUP_DIR})
  list(APPEND _kng_cmake_args "-DGHCUP_DIR=$ENV{GHCUP_DIR}")
endif()

# Build environment
set(_kng_build_env "")
if(DEFINED ENV{CABAL_DIR})
  set(_kng_build_env "CABAL_DIR=$ENV{CABAL_DIR}")
endif()

ExternalProject_Add(kanagawa_compiler
  SOURCE_DIR        "${_kng_src}"
  BINARY_DIR        "${_kng_build}"
  CMAKE_GENERATOR   Ninja
  CMAKE_ARGS        ${_kng_cmake_args}
  BUILD_COMMAND     ${CMAKE_COMMAND} -E env ${_kng_build_env}
                    ninja -C "${_kng_build}" kanagawa_runtime
  INSTALL_COMMAND   ""
  BUILD_BYPRODUCTS  "${_kng_build}/dist/bin/kanagawa"
  EXCLUDE_FROM_ALL  TRUE
)

set(KANAGAWA_EXE "${_kng_build}/dist/bin/kanagawa")
set(KANAGAWA_FOUND TRUE)
set(KANAGAWA_NEEDS_BUILD TRUE)
message(STATUS "Kanagawa compiler: will build from source (target: kanagawa_compiler)")
