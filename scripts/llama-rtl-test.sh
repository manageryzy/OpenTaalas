#!/usr/bin/env bash
# LLaMA 3.1 8B — RTL generation smoke test
# Compiles all Kanagawa modules and reports pass/fail.
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
# Resolve main tree root (handles worktrees where .build/ and third-party/ live)
MAIN_TREE="$(git -C "${SCRIPT_DIR}" worktree list --porcelain | head -1 | sed 's/^worktree //')"
KANAGAWA="${MAIN_TREE}/.build/kanagawa/dist/bin/kanagawa"
LIBRARY_DIR="${MAIN_TREE}/third-party/kanagawa/library"
BASE_LIBRARY="${LIBRARY_DIR}/mini-base.k"
SOURCE_DIR="${SCRIPT_DIR}/rtl/kanagawa"
OUTPUT_DIR="/tmp/kng_llama_rtl_test_$$"

# Allow override from environment
KANAGAWA="${KANAGAWA_EXE:-$KANAGAWA}"
LIBRARY_DIR="${KANAGAWA_LIBRARY_DIR:-$LIBRARY_DIR}"
BASE_LIBRARY="${KANAGAWA_BASE_LIBRARY:-$BASE_LIBRARY}"

MODULES=(
    rom_bank scale_store lut_interp
    mac_pe dequant mac_array
    kv_cache attention_unit rmsnorm swiglu rope
    vector_unit layer_tile
    embed_rom lm_head global_controller llama_chip
)

echo "=== LLaMA 3.1 8B RTL Generation Test ==="
echo "Kanagawa: ${KANAGAWA}"
echo "Library:  ${LIBRARY_DIR}"
echo "Source:   ${SOURCE_DIR}"
echo "Output:   ${OUTPUT_DIR}"
echo ""

mkdir -p "${OUTPUT_DIR}"

PASS=0
FAIL=0
FAILED_MODULES=()

for mod in "${MODULES[@]}"; do
    printf "  %-25s " "${mod}.k"
    if "${KANAGAWA}" \
        --backend=sv \
        --import-dir="${LIBRARY_DIR}" \
        --base-library="${BASE_LIBRARY}" \
        --output="${OUTPUT_DIR}/${mod}" \
        "${SOURCE_DIR}/${mod}.k" > "${OUTPUT_DIR}/${mod}.log" 2>&1; then
        echo "OK"
        ((PASS++))
    else
        echo "FAIL"
        ((FAIL++))
        FAILED_MODULES+=("${mod}")
    fi
done

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed out of ${#MODULES[@]} modules"

if [ "${FAIL}" -gt 0 ]; then
    echo ""
    echo "Failed modules:"
    for mod in "${FAILED_MODULES[@]}"; do
        echo "  - ${mod}"
        echo "    Log: ${OUTPUT_DIR}/${mod}.log"
    done
    exit 1
fi

# Cleanup on success
rm -rf "${OUTPUT_DIR}"
echo "All modules compiled successfully."
