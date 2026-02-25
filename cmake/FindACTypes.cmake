# FindACTypes.cmake — Locate Algorithmic C datatypes (header-only)
#
# Sets:
#   AC_TYPES_FOUND       — TRUE if ac_int.h found
#   AC_TYPES_INCLUDE_DIR — Include directory

find_path(AC_TYPES_INCLUDE_DIR ac_int.h
  HINTS "${CMAKE_SOURCE_DIR}/third-party/ac_types/include"
  NO_DEFAULT_PATH)

if(AC_TYPES_INCLUDE_DIR)
  set(AC_TYPES_FOUND TRUE)
  message(STATUS "Found ac_types: ${AC_TYPES_INCLUDE_DIR}")
else()
  set(AC_TYPES_FOUND FALSE)
  message(STATUS "ac_types not found — AC types targets disabled")
endif()
