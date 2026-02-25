# FindSystemC.cmake — Build SystemC from third-party source or find system-installed
#
# Sets:
#   SYSTEMC_FOUND        — TRUE if SystemC available
#   SYSTEMC_INCLUDE_DIRS — Include directories
#   SYSTEMC_LIBRARIES    — Libraries to link

set(_systemc_src "${CMAKE_SOURCE_DIR}/third-party/systemc")

if(EXISTS "${_systemc_src}/CMakeLists.txt")
  # Build from third-party source
  set(CMAKE_CXX_STANDARD 17 CACHE STRING "" FORCE)
  set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
  set(ENABLE_EXAMPLES OFF CACHE BOOL "" FORCE)
  set(ENABLE_REGRESSION OFF CACHE BOOL "" FORCE)
  add_subdirectory("${_systemc_src}" "${CMAKE_BINARY_DIR}/third-party/systemc" EXCLUDE_FROM_ALL)

  set(SYSTEMC_FOUND TRUE)
  set(SYSTEMC_INCLUDE_DIRS "${_systemc_src}/src")
  set(SYSTEMC_LIBRARIES systemc)
  message(STATUS "Found SystemC: third-party/systemc (building from source)")
else()
  # Fallback to system-installed via pkg-config
  find_package(PkgConfig QUIET)
  if(PkgConfig_FOUND)
    pkg_check_modules(SYSTEMC QUIET systemc)
  endif()

  if(SYSTEMC_FOUND)
    message(STATUS "Found SystemC: ${SYSTEMC_VERSION} (system-installed)")
  else()
    message(STATUS "SystemC not found — SystemC targets disabled")
  endif()
endif()
