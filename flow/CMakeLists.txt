# flow/CMakeLists.txt — Backend targets (synthesis → PnR → GDS via ORFS)

if(NOT ORFS_FOUND)
  message(STATUS "Backend targets: skipped (ORFS not found)")
  return()
endif()

set(_run_orfs "${CMAKE_CURRENT_SOURCE_DIR}/scripts/run_orfs.sh")
set(_results_dir "${CMAKE_SOURCE_DIR}/.build/flow")

# Helper function: add_orfs_design(NAME <name> PLATFORM <platform> CONFIG_DIR <dir>)
# Creates targets: synth_<name>, pnr_<name>, gds_<name>
function(add_orfs_design)
  cmake_parse_arguments(ORFS "" "NAME;PLATFORM;CONFIG_DIR" "" ${ARGN})

  set(_config "${ORFS_CONFIG_DIR}/config.mk")
  set(_work "${_results_dir}/${ORFS_PLATFORM}/${ORFS_NAME}")

  # Synthesis only
  add_custom_target(synth_${ORFS_NAME}
    COMMAND bash "${_run_orfs}"
      "${ORFS_FLOW_DIR}"
      "${_config}"
      synth
      "${_work}"
    DEPENDS rtl_all
    COMMENT "ORFS synth: ${ORFS_NAME} (${ORFS_PLATFORM})"
    VERBATIM
  )

  # Full PnR → GDS
  add_custom_target(pnr_${ORFS_NAME}
    COMMAND bash "${_run_orfs}"
      "${ORFS_FLOW_DIR}"
      "${_config}"
      all
      "${_work}"
    DEPENDS rtl_all
    COMMENT "ORFS PnR → GDS: ${ORFS_NAME} (${ORFS_PLATFORM})"
    VERBATIM
  )

  # gds_ is an alias for pnr_
  add_custom_target(gds_${ORFS_NAME} DEPENDS pnr_${ORFS_NAME})
endfunction()

# --- Register designs ---

# Smoke test
add_orfs_design(
  NAME       smoke_adder
  PLATFORM   ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/smoke_adder"
)

# Tier 1: Leaf modules
add_orfs_design(NAME mac_pe            PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/mac_pe")
add_orfs_design(NAME dequant           PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/dequant")
add_orfs_design(NAME codebook_decoder  PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/codebook_decoder")
add_orfs_design(NAME lut_interp        PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/lut_interp")

# --- Aggregate target ---
add_custom_target(backend_all
  DEPENDS
    gds_smoke_adder
    gds_mac_pe
    gds_dequant
    gds_codebook_decoder
    gds_lut_interp
  COMMENT "Building all backend GDS targets"
)
