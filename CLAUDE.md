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
third-party/
  kanagawa/            # Kanagawa compiler (git submodule)
flow/                  # ORFS configs (see docs/orfs-reference.md)
constraints/           # SDC timing constraints
docs/                  # Architecture notes, ORFS reference
scripts/               # smoke-test.sh and helpers
.devcontainer/         # Dev container (all toolchains pre-installed)
.build/                # Build artifacts (gitignored)
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
