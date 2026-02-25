#!/bin/bash
# OpenTaalas smoke tests — verify toolchain and project structure
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

PASS=0
FAIL=0
SKIP=0

pass() { echo "  PASS: $1"; ((PASS++)) || true; }
fail() { echo "  FAIL: $1"; ((FAIL++)) || true; }
skip() { echo "  SKIP: $1"; ((SKIP++)) || true; }

ELABORATE=${ELABORATE:-0}
MILL_TIMEOUT=${MILL_TIMEOUT:-600}

# Prefer system ninja over depot_tools wrapper
NINJA_BIN=$(command -v ninja 2>/dev/null || true)
[ -x /usr/bin/ninja ] && NINJA_BIN=/usr/bin/ninja

echo "=== OpenTaalas Smoke Tests ==="
echo "  ELABORATE=$ELABORATE (set ELABORATE=1 to run Chisel + Kanagawa builds)"
echo ""

# --- 1. Project structure ---
echo "[1/6] Project structure"

for dir in rtl/chisel rtl/kanagawa rtl/generated flow constraints docs scripts third-party/kanagawa; do
  test -d "$PROJECT_ROOT/$dir" && pass "$dir/" || fail "$dir/ missing"
done

if [ -f "$PROJECT_ROOT/.gitmodules" ] && grep -q kanagawa "$PROJECT_ROOT/.gitmodules"; then
  pass "kanagawa submodule registered"
else
  fail "kanagawa submodule not in .gitmodules"
fi

test -f "$PROJECT_ROOT/third-party/kanagawa/CMakeLists.txt" \
  && pass "kanagawa source present" \
  || fail "kanagawa source missing (run: git submodule update --init)"

echo ""

# --- 2. Chisel toolchain ---
echo "[2/6] Chisel toolchain"

# Find JDK 17: prefer JAVA_HOME, then ~/workspace, then system
if [ -n "${JAVA_HOME:-}" ] && [ -x "$JAVA_HOME/bin/java" ]; then
  JDK17="$JAVA_HOME"
elif [ -x "$HOME/workspace/jdk-17.0.2/bin/java" ]; then
  JDK17="$HOME/workspace/jdk-17.0.2"
elif java -version 2>&1 | grep -q '"17\.'; then
  JDK17="$(dirname $(dirname $(readlink -f $(which java))))"
else
  JDK17=""
fi

if [ -n "$JDK17" ] && [ -x "$JDK17/bin/java" ]; then
  pass "JDK 17 ($($JDK17/bin/java -version 2>&1 | head -1))"
else
  fail "JDK 17 not found"
fi

# Find mill: PATH first, then ~/workspace
MILL_BIN=$(command -v mill 2>/dev/null || echo "$HOME/workspace/bin/mill")
test -x "$MILL_BIN" && pass "Mill found ($MILL_BIN)" || fail "Mill missing"

# Find firtool: PATH first, then ~/workspace
FIRTOOL_BIN=$(command -v firtool 2>/dev/null || echo "$HOME/workspace/bin/firtool")
test -x "$FIRTOOL_BIN" && pass "firtool found ($FIRTOOL_BIN)" || fail "firtool missing"

echo ""

# --- 3. Kanagawa toolchain prerequisites ---
echo "[3/6] Kanagawa prerequisites"

command -v gcc &>/dev/null && pass "GCC ($(gcc -dumpversion))" || fail "GCC missing"

cmake_ver=$(cmake --version 2>/dev/null | grep -oP '\d+\.\d+' | head -1 || true)
if [ -n "$cmake_ver" ]; then
  if python3 -c "import sys; sys.exit(0 if tuple(map(int,'$cmake_ver'.split('.')))>=(3,30) else 1)" 2>/dev/null; then
    pass "CMake $cmake_ver (>= 3.30)"
  else
    fail "CMake $cmake_ver (need >= 3.30)"
  fi
else
  fail "CMake not found"
fi

command -v ninja &>/dev/null && pass "Ninja found" || fail "Ninja missing"
command -v python3 &>/dev/null && pass "Python 3 found" || fail "Python 3 missing"
command -v verilator &>/dev/null && pass "Verilator found" || skip "Verilator not installed"
command -v ghcup &>/dev/null && pass "ghcup found" || skip "ghcup not installed"

echo ""

# --- 4. Chisel elaboration ---
echo "[4/6] Chisel elaboration"

if [ "$ELABORATE" = "1" ] && [ -f "$PROJECT_ROOT/rtl/chisel/build.sc" ]; then
  echo "  Running Mill (timeout ${MILL_TIMEOUT}s)..."
  rm -f "$PROJECT_ROOT/rtl/generated/SmokeAdder.sv"
  cd "$PROJECT_ROOT/rtl/chisel"
  # Always clean Mill cache to avoid cross-environment issues (host vs container JDK)
  rm -rf out
  if timeout "$MILL_TIMEOUT" env JAVA_HOME="$JDK17" \
    "$MILL_BIN" -i smoke.run >/dev/null 2>&1; then
    test -f "$PROJECT_ROOT/rtl/generated/SmokeAdder.sv" \
      && pass "Chisel -> SV generation (SmokeAdder.sv)" \
      || fail "SmokeAdder.sv not generated"
  else
    fail "Mill elaboration failed or timed out"
  fi
  cd "$PROJECT_ROOT"
elif [ -f "$PROJECT_ROOT/rtl/generated/SmokeAdder.sv" ]; then
  pass "SmokeAdder.sv exists (prior run)"
else
  skip "Set ELABORATE=1 to run Chisel generation"
fi

echo ""

# --- 5. Kanagawa CMake configure ---
echo "[5/6] Kanagawa CMake configure"

KNG_SRC="$PROJECT_ROOT/third-party/kanagawa"
if [ -f "$KNG_SRC/CMakeLists.txt" ]; then
  KNG_BUILD=$(mktemp -d)
  CMAKE_EXTRA_ARGS=""
  if [ -n "${Boost_DIR:-}" ]; then
    CMAKE_EXTRA_ARGS="$CMAKE_EXTRA_ARGS -DBoost_DIR=$Boost_DIR"
  fi
  if [ -n "${GHCUP_DIR:-}" ]; then
    CMAKE_EXTRA_ARGS="$CMAKE_EXTRA_ARGS -DGHCUP_DIR=$GHCUP_DIR"
  fi
  cmake_out=$(timeout 30 cmake -G Ninja \
    -DCMAKE_MAKE_PROGRAM="$NINJA_BIN" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    $CMAKE_EXTRA_ARGS \
    -S "$KNG_SRC" -B "$KNG_BUILD" 2>&1) || true
  cmake_rc=${PIPESTATUS[0]:-$?}
  if [ $cmake_rc -eq 0 ]; then
    pass "Kanagawa CMake configure succeeded"
  else
    # Extract the specific missing dep
    missing=$(echo "$cmake_out" | grep -oP 'Could not find.*package "\K[^"]+' | head -1)
    if [ -n "$missing" ]; then
      fail "Kanagawa CMake configure: missing $missing"
    else
      missing=$(echo "$cmake_out" | grep -i 'fatal_error\|not found' | head -1)
      fail "Kanagawa CMake configure: ${missing:-unknown error}"
    fi
  fi
  rm -rf "$KNG_BUILD"
else
  skip "Kanagawa source not present"
fi

echo ""

# --- 6. Kanagawa compiler build + syntax test ---
echo "[6/6] Kanagawa compiler build + syntax test"

KNG_SRC="$PROJECT_ROOT/third-party/kanagawa"
KNG_BUILD_DIR="$PROJECT_ROOT/.build/kanagawa"
if [ "$ELABORATE" = "1" ] && [ -f "$KNG_SRC/CMakeLists.txt" ]; then
  CMAKE_KNG_ARGS="-DCMAKE_MAKE_PROGRAM=$NINJA_BIN -DCMAKE_BUILD_TYPE=RelWithDebInfo"
  [ -n "${Boost_DIR:-}" ] && CMAKE_KNG_ARGS="$CMAKE_KNG_ARGS -DBoost_DIR=$Boost_DIR"
  [ -n "${GHCUP_DIR:-}" ] && CMAKE_KNG_ARGS="$CMAKE_KNG_ARGS -DGHCUP_DIR=$GHCUP_DIR"
  [ -n "${VERILATOR_EXE:-}" ] && CMAKE_KNG_ARGS="$CMAKE_KNG_ARGS -DVERILATOR_EXE=$VERILATOR_EXE"

  # Configure if needed
  if [ ! -f "$KNG_BUILD_DIR/build.ninja" ]; then
    echo "  Configuring Kanagawa..."
    mkdir -p "$KNG_BUILD_DIR"
    if ! cmake -G Ninja $CMAKE_KNG_ARGS -S "$KNG_SRC" -B "$KNG_BUILD_DIR" >/dev/null 2>&1; then
      fail "Kanagawa CMake configure failed"
    fi
  fi

  if [ -f "$KNG_BUILD_DIR/build.ninja" ]; then
    # Build compiler
    echo "  Building Kanagawa compiler (this may take a while)..."
    if timeout 600 env CABAL_DIR="${CABAL_DIR:-}" "$NINJA_BIN" -C "$KNG_BUILD_DIR" -j$(nproc) kanagawa_runtime 2>&1 | tail -3; then
      pass "Kanagawa compiler built"

      # Run syntax smoke test
      KNG_EXE="$KNG_BUILD_DIR/dist/bin/kanagawa"
      if [ -x "$KNG_EXE" ]; then
        echo "  Running syntax smoke test..."
        if python3 "$KNG_SRC/test/syntax/syntax-test.py" \
          -kanagawa "$KNG_EXE" \
          -testfile "$PROJECT_ROOT/rtl/kanagawa/smoke_adder.k" \
          -helperdir "$KNG_SRC/test/syntax" \
          -options "--jobs=1 --Wno-redundant-import --base-library=$KNG_SRC/library/mini-base.k --import-dir=$KNG_SRC/library" \
          2>&1; then
          pass "Kanagawa syntax test passed"
        else
          fail "Kanagawa syntax test failed"
        fi

        # Generate RTL from synthesizable design
        echo "  Generating RTL (smoke_accumulator)..."
        KNG_RTL_OUT="$PROJECT_ROOT/rtl/generated/kanagawa"
        mkdir -p "$KNG_RTL_OUT"
        if "$KNG_EXE" \
          --backend=sv \
          --import-dir="$KNG_SRC/library" \
          --base-library="$KNG_SRC/library/mini-base.k" \
          --output="$KNG_RTL_OUT/smoke_accumulator" \
          "$PROJECT_ROOT/rtl/kanagawa/smoke_accumulator.k" \
          2>&1; then
          sv_count=$(ls "$KNG_RTL_OUT"/smoke_accumulator*.sv 2>/dev/null | wc -l)
          if [ "$sv_count" -gt 0 ]; then
            pass "Kanagawa -> SV generation ($sv_count files in rtl/generated/kanagawa/)"
          else
            fail "Kanagawa RTL: no .sv files generated"
          fi
        else
          fail "Kanagawa RTL generation failed"
        fi
      else
        fail "Kanagawa binary not found at $KNG_EXE"
      fi
    else
      fail "Kanagawa compiler build failed or timed out"
    fi
  fi
elif [ "$ELABORATE" != "1" ]; then
  skip "Set ELABORATE=1 to build Kanagawa compiler"
else
  skip "Kanagawa source not present"
fi

echo ""
echo "=== Results: $PASS passed, $FAIL failed, $SKIP skipped ==="
exit $((FAIL > 0 ? 1 : 0))
