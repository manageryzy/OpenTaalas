# FindORFS.cmake — Locate OpenROAD Flow Scripts
#
# Options:
#   ORFS_PATH — Path to OpenROAD-flow-scripts (default: ~/workspace/OpenROAD-flow-scripts)
#
# Sets:
#   ORFS_FOUND    — TRUE if ORFS located
#   ORFS_FLOW_DIR — Path to ORFS flow/ directory

if(NOT ORFS_PATH)
  if(DEFINED ENV{ORFS_PATH})
    set(ORFS_PATH "$ENV{ORFS_PATH}")
  else()
    set(ORFS_PATH "$ENV{HOME}/workspace/OpenROAD-flow-scripts")
  endif()
endif()

set(ORFS_PATH "${ORFS_PATH}" CACHE PATH "Path to OpenROAD-flow-scripts")

if(EXISTS "${ORFS_PATH}/flow/Makefile")
  set(ORFS_FOUND TRUE)
  set(ORFS_FLOW_DIR "${ORFS_PATH}/flow")
  message(STATUS "Found ORFS: ${ORFS_FLOW_DIR}")
else()
  set(ORFS_FOUND FALSE)
  message(STATUS "ORFS not found at ${ORFS_PATH} — backend targets disabled")
endif()
