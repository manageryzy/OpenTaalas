# FindSystemC.cmake — Locate SystemC via pkg-config
#
# Sets:
#   SYSTEMC_FOUND        — TRUE if SystemC found
#   SYSTEMC_INCLUDE_DIRS — Include directories
#   SYSTEMC_LIBRARIES    — Libraries to link

find_package(PkgConfig QUIET)
if(PkgConfig_FOUND)
  pkg_check_modules(SYSTEMC QUIET systemc)
endif()

if(SYSTEMC_FOUND)
  message(STATUS "Found SystemC: ${SYSTEMC_VERSION} (${SYSTEMC_LIBRARIES})")
else()
  message(STATUS "SystemC not found — SystemC targets disabled")
endif()
