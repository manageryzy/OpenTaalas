#!/bin/bash
# run_orfs.sh — Wrapper to invoke OpenROAD Flow Scripts from CMake
#
# Usage: run_orfs.sh <ORFS_FLOW_DIR> <DESIGN_CONFIG> <TARGET> <WORK_HOME>
set -euo pipefail

ORFS_FLOW_DIR="$1"
DESIGN_CONFIG="$2"
TARGET="$3"
WORK_HOME="$4"

# Source EDA environment if available
EDA_ENV="$HOME/workspace/eda-env.sh"
if [ -f "$EDA_ENV" ]; then
  source "$EDA_ENV"
fi

mkdir -p "$WORK_HOME"

echo "=== ORFS: ${TARGET} ==="
echo "  Config:  ${DESIGN_CONFIG}"
echo "  WorkDir: ${WORK_HOME}"
echo ""

exec make -C "${ORFS_FLOW_DIR}" \
  DESIGN_CONFIG="${DESIGN_CONFIG}" \
  WORK_HOME="${WORK_HOME}" \
  "${TARGET}"
