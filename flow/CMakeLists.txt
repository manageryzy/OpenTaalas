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

# CDC: Async FIFO
add_orfs_design(NAME async_fifo        PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/async_fifo")

# Tier 2: Medium modules
add_orfs_design(NAME rom_bank          PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rom_bank")
add_orfs_design(NAME scale_store       PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/scale_store")
add_orfs_design(NAME rmsnorm           PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rmsnorm")
add_orfs_design(NAME swiglu            PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/swiglu")
add_orfs_design(NAME rope              PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rope")
add_orfs_design(NAME rope_gen          PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rope_gen")
add_orfs_design(NAME rope_apply        PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/rope_apply")
add_orfs_design(NAME attention_unit    PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/attention_unit")

# Tier 3: Composite modules
add_orfs_design(NAME mac_array         PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/mac_array")
add_orfs_design(NAME kv_cache          PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/kv_cache")
add_orfs_design(NAME vector_unit       PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/vector_unit")

# Tier 4: Controllers and top-level
add_orfs_design(NAME layer_tile        PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/layer_tile")
add_orfs_design(NAME embed_rom         PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/embed_rom")
add_orfs_design(NAME lm_head           PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/lm_head")
add_orfs_design(NAME global_controller PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/global_controller")
add_orfs_design(NAME llama_chip        PLATFORM ${PLATFORM} CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/llama_chip")

# --- Aggregate target ---
add_custom_target(backend_all
  DEPENDS
    gds_smoke_adder
    gds_mac_pe
    gds_dequant
    gds_codebook_decoder
    gds_lut_interp
    gds_async_fifo
    gds_rom_bank
    gds_scale_store
    gds_rmsnorm
    gds_swiglu
    gds_rope
    gds_attention_unit
    gds_mac_array
    gds_kv_cache
    gds_vector_unit
    gds_layer_tile
    gds_embed_rom
    gds_lm_head
    gds_global_controller
    gds_llama_chip
  COMMENT "Building all backend GDS targets"
)
