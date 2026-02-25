# OpenTaalas — Project Instructions

## Project Overview

Open-source ASIC for LLM inference, inspired by [Taalas](https://taalas.com). Target: sky130hd PDK via OpenROAD.

## Project Structure

```
rtl/
  chisel/              # Scala/Chisel source (build.sc + smoke/)
  kanagawa/            # Kanagawa HLS source (.k files)
  generated/           # Output SV from both tools
    kanagawa/          # Kanagawa-generated RTL
  CMakeLists.txt       # RTL generation targets
third-party/
  kanagawa/            # Kanagawa compiler (git submodule)
flow/                  # ORFS backend configs + scripts
  designs/sky130hd/    # Per-design ORFS config.mk + constraint.sdc
  scripts/run_orfs.sh  # ORFS invocation wrapper
  CMakeLists.txt       # Backend synthesis/PnR/GDS targets
test/
  CMakeLists.txt       # CTest targets
cmake/                 # CMake Find modules
  FindChiselTools.cmake
  FindKanagawaCompiler.cmake
  FindORFS.cmake
constraints/           # SDC timing constraints
docs/                  # Architecture notes, ORFS reference
scripts/               # smoke-test.sh and helpers
.devcontainer/         # Dev container (all toolchains pre-installed)
.build/                # Build artifacts (gitignored)
CMakeLists.txt         # Top-level CMake project
```

## Dev Container

The devcontainer has everything pre-installed: JDK 17, Mill, firtool, CMake 3.31, Boost 1.88, Verilator 5.040, GHC 9.6.7, cabal. Use it to avoid polluting the host.

```bash
# Build
docker build -t opentaalas-dev -f .devcontainer/Dockerfile \
  --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) .

# Run (podman/rootless docker need --userns=keep-id)
docker run --rm --userns=keep-id -v $(pwd):/workspace opentaalas-dev bash

# Inside container: CABAL_DIR=/opt/cabal must be set for Kanagawa builds
ELABORATE=1 CABAL_DIR=/opt/cabal bash scripts/smoke-test.sh
```

## Smoke Tests

```bash
bash scripts/smoke-test.sh              # Fast: structure + toolchain checks
ELABORATE=1 bash scripts/smoke-test.sh  # Full: Chisel elaboration + Kanagawa build + RTL generation
```

## Chisel Flow

Chisel source in `rtl/chisel/`, built with Mill. Output lands in `rtl/generated/`.

```bash
cd rtl/chisel
JAVA_HOME=<jdk17_path> mill -i smoke.run   # Generates rtl/generated/SmokeAdder.sv
```

- firtool version MUST match project's `chisel/etc/circt.json`
- JDK 17 required (JDK 25 breaks Scala 2.13)
- Mill `out/` cache is JDK-version-specific; delete it when switching environments

## Kanagawa Flow

Kanagawa is Microsoft's HLS compiler with Wavefront Threading. Submodule at `third-party/kanagawa`.

**Documentation:** `third-party/kanagawa/BUILDING.md` for build instructions, `third-party/kanagawa/doc/` for language docs. Upstream: https://github.com/microsoft/kanagawa

### Building the Compiler

```bash
# Init submodules (includes CIRCT + LLVM — large download)
cd third-party/kanagawa && git submodule update --init --recursive

# Configure + build (inside devcontainer)
mkdir -p .build/kanagawa
cmake -G Ninja \
  -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DBoost_DIR=/opt/boost/lib/cmake/Boost-1.88.0 \
  -DGHCUP_DIR=/opt/.ghcup/bin \
  -S third-party/kanagawa -B .build/kanagawa

CABAL_DIR=/opt/cabal ninja -C .build/kanagawa -j$(nproc) kanagawa_runtime
```

### Generating RTL

```bash
.build/kanagawa/dist/bin/kanagawa \
  --backend=sv \
  --import-dir=third-party/kanagawa/library \
  --base-library=third-party/kanagawa/library/mini-base.k \
  --output=rtl/generated/kanagawa/<prefix> \
  rtl/kanagawa/<source>.k
```

Output: `<prefix><classname>.sv`, `<prefix><classname>_types.sv`, plus path reports and RTL maps.

### Kanagawa Language Basics

- **Modules** declared with `module <name> { <exported_classes> }`
- **Classes** = hardware modules. Member variables = registers. Methods = hardware operations.
- **`atomic` blocks** ensure transactional hardware semantics (read-modify-write in one cycle)
- **`export <class>`** makes a class synthesizable to RTL
- **`inline` methods** are NOT allowed in exported classes (compile error)
- **Templates** (`template<auto Width>`) parameterize bit widths
- **`uint<N>`** = unsigned N-bit integer, `int<N>` = signed
- **`cast<T>(expr)`** for explicit type conversion
- **`concat(a, b, ...)`** for bit concatenation
- **`static assert`** for compile-time checks

### Kanagawa Key Flags

| Flag | Purpose |
|------|---------|
| `--backend=sv` | Generate SystemVerilog |
| `--import-dir=<path>` | Library search path |
| `--base-library=<path>` | Base library file (usually `mini-base.k`) |
| `--output=<prefix>` | Output file prefix |
| `--frequency=<MHz>` | Target frequency |
| `--register-ratio=<N>` | Pipeline register insertion ratio |
| `--Wall --Werror` | All warnings as errors |
| `--jobs=<N>` | Parallel compilation jobs |

### Running Kanagawa Tests

```bash
cd .build/kanagawa
ctest --verbose -R "^syntax\."     # Syntax tests (fast)
ctest --verbose -R "^logic\."      # Logic tests
ctest --verbose -R "^runtime\."    # RTL simulation tests (need Verilator)
```

## P&R Flow

OpenROAD 26Q1 at `~/workspace/OpenROAD-flow-scripts/`. See `docs/orfs-reference.md` for config templates, failure modes, and metrics extraction.

```bash
source ~/workspace/eda-env.sh
cd flow && make DESIGN_CONFIG=designs/sky130hd/<nickname>/config.mk
```

## CMake Build System

Unified build system orchestrating RTL generation (Chisel + Kanagawa), testing, and backend ORFS flow.

### Quick Start

```bash
# Configure (auto-detects JDK17, Mill, firtool, kanagawa, ORFS)
cmake -B build -DORFS_PATH=~/workspace/OpenROAD-flow-scripts

# Generate all RTL
cmake --build build --target rtl_all

# Run tests
cd build && ctest --verbose

# Full RTL → GDS
cmake --build build --target gds_smoke_adder
```

### CMake Options

| Option | Default | Purpose |
|--------|---------|---------|
| `ORFS_PATH` | `~/workspace/OpenROAD-flow-scripts` | Path to ORFS installation |
| `PLATFORM` | `sky130hd` | Target PDK platform |
| `BUILD_KANAGAWA_COMPILER` | `ON` | Build kanagawa from source if not found |

### Available Targets

| Target | What it does |
|--------|-------------|
| `rtl_all` | Generate all RTL (Chisel + Kanagawa) |
| `chisel_smoke_adder` | Mill → `rtl/generated/SmokeAdder.sv` |
| `kanagawa_smoke_accumulator` | Kanagawa → `rtl/generated/kanagawa/smoke_accumulator*.sv` |
| `synth_smoke_adder` | Yosys synthesis only |
| `pnr_smoke_adder` | Full PnR (synth → floorplan → place → CTS → route → finish) |
| `gds_smoke_adder` | Alias for `pnr_` — produces GDS |
| `backend_all` | All backend GDS targets |

### CTest Tests

| Test | What it checks |
|------|---------------|
| `chisel_compile` | Scala/Chisel type-check via `mill smoke.compile` |
| `kanagawa_syntax` | Kanagawa syntax test on `smoke_adder.k` |
| `kanagawa_rtl_gen` | Kanagawa generates valid SV from `smoke_accumulator.k` |
| `verilator_lint_smoke_adder` | Verilator lint on `SmokeAdder.sv` (if Verilator installed) |

### Find Modules

Three CMake modules in `cmake/` auto-detect toolchains:
- **FindChiselTools** — JDK 17, Mill, firtool → sets `CHISEL_TOOLS_FOUND`
- **FindKanagawaCompiler** — pre-built binary or ExternalProject build → sets `KANAGAWA_FOUND`, `KANAGAWA_EXE`
- **FindORFS** — validates ORFS Makefile → sets `ORFS_FOUND`, `ORFS_FLOW_DIR`

Missing tools degrade gracefully — targets that need them are skipped.

### Adding a New Design

**Chisel:** Add a new `ScalaModule` in `rtl/chisel/`, add a `add_custom_target()` in `rtl/CMakeLists.txt`.

**Kanagawa:** Add a `.k` file in `rtl/kanagawa/`, register with the helper function:
```cmake
add_kanagawa_rtl(NAME my_design SOURCE my_design.k)
```

**Backend:** Create `flow/designs/sky130hd/<name>/config.mk` + `constraint.sdc`, register:
```cmake
add_orfs_design(NAME my_design PLATFORM ${PLATFORM}
  CONFIG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/designs/sky130hd/my_design")
```

### ORFS Design Config Notes

- Tiny designs need explicit `DIE_AREA`/`CORE_AREA` — utilization-based sizing can produce dies too small for PDN straps
- Paths in `config.mk` must be absolute — use `$(abspath ...)` relative to `MAKEFILE_LIST`
- ORFS outputs land in `.build/flow/<platform>/<design>/`
