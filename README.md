# OpenTaalas

An open-source ASIC for LLM inference, targeting the sky130hd PDK.

OpenTaalas implements a complete LLaMA 3.1 8B transformer decoder in hardware — from token embedding through 32 transformer layers to argmax output. The RTL is written in [Kanagawa](https://github.com/microsoft/kanagawa), Microsoft's HLS compiler with Wavefront Threading, and verified cycle-accurate against SystemC reference models using Verilator.

```
Token In ──► Embed ROM ──► 32× Transformer Layer ──► LM Head ──► Token Out
                                    │
                    ┌───────────────┼───────────────┐
                    ▼               ▼               ▼
               RMSNorm ──►    Attention    ──► RMSNorm ──► MLP
                    │          Q K V O          │      Gate Up Down
                    │          ┌──┴──┐          │      ┌──┴──┐
                    │        KV Cache │          │    SwiGLU  │
                    │          RoPE   │          │   Sigmoid  │
                    │               Softmax     │     LUT    │
                    └── Residual Add ◄──────────┘── Residual Add
```

## Verification Status

All RTL modules verified against SystemC reference models with 100% exact bit match. Real-data verification at full LLaMA 3.1 8B dimensions (DIM=4096, HEADS=32, KV\_HEADS=8, FFN\_DIM=14336):

| Stage | Cosine vs FP32 Golden |
|---|---|
| RMSNorm pre-attention | 1.000000 |
| Q / K / V / O projections | 1.000000 |
| Post-attention residual | 0.999996 |
| Gate / Up projections | 0.999965 |
| SwiGLU activation | 0.998585 |
| Down projection | 0.995683 |
| Post-MLP residual | 0.999701 |

The remaining ~0.14% SwiGLU gap is inherent to the 256-entry sigmoid LUT — not a bug. See [docs/project-status.md](docs/project-status.md) for error decomposition.

## Test Suite

- 44 end-to-end checks at CI dimensions — all passing
- 16 real-data checks at full LLaMA 3.1 8B dimensions — all passing
- 19 individual module co-simulation tests
- 17 SystemC reference model unit tests

```bash
# Run all tests
cmake -B build && cmake --build build
ctest --test-dir build -V

# Run by category
ctest --test-dir build -L systemc -V    # SystemC reference models
ctest --test-dir build -L verilator -V  # RTL co-simulation
ctest --test-dir build -L e2e -V        # End-to-end layer tests
```

## Hardware Modules

20 Kanagawa HLS modules, each with a matching SystemC reference model:

| Module | Purpose |
|---|---|
| `mac_pe` | INT3×INT8 shift-and-add multiply-accumulate |
| `mac_array` | 4 PEs + weight ROM + inline dequantization |
| `rom_bank` | Parameterized weight storage |
| `scale_store` | FP8 bank scales + FP32 tensor scales |
| `codebook_decoder` | IQ3\_S 9-bit codebook → 4 magnitudes |
| `dequant` | FP8 E4M3 → BF16 conversion |
| `lut_interp` | 256-entry LUT with nearest-neighbor lookup |
| `rmsnorm` | BF16 sum-of-squares + gamma + rsqrt LUT |
| `swiglu` | Sigmoid LUT + two chained BF16 multiplies |
| `rope` | Rotary position embeddings (sin/cos tables) |
| `vector_unit` | Unified VPU: RMSNorm, RoPE, SwiGLU, dequant, residual add |
| `attention_unit` | INT8×INT8 dot product + softmax + max score |
| `kv_cache` | Circular buffer K/V stores with GQA broadcast |
| `layer_tile` | 17-state FSM orchestrating one transformer layer |
| `embed_rom` | Token embedding lookup |
| `lm_head` | Final projection + argmax |
| `global_controller` | 36-state pipeline FSM across 32 layers |
| `llama_chip` | Top-level decode orchestrator |

## Quantization

Weights use Q3\_K\_S format (110 bytes per 256-weight block):

```
┌─────────────────────────────────────────────────┐
│  256 weights × 3-bit  │  IQ3_S codebook indices │
│  32 × FP8 E4M3        │  Per-bank scales        │
│  1 × BF16             │  Super-scale per block   │
│  Sign bits absorbed into weight magnitudes       │
└─────────────────────────────────────────────────┘
```

The GGUF converter (`tools/gguf_converter.cpp`) handles sign absorption and FP8 bank scale normalization for direct hardware consumption.

## Project Structure

```
rtl/
  kanagawa/            20 Kanagawa HLS source files (.k)
  chisel/              Chisel/Scala source (structural RTL)
  generated/           Generated SystemVerilog
  sv/                  Hand-written SV wrappers
model/
  systemc/src/         17 header-only C++ reference models
test/
  verilator/           21 Verilator co-simulation tests
  systemc/             17 SystemC unit tests
tools/
  gguf_converter.cpp   GGUF Q3_K → binary weight converter
  weight_generator.h   Deterministic weights/LUTs for CI
  llama_quantized_forward.cpp   Golden FP32 forward pass
flow/                  OpenROAD backend (sky130hd, 18 module configs)
  designs/sky130hd/    Per-module config.mk + constraint.sdc
  scripts/             ORFS invocation wrapper
third-party/
  kanagawa/            Kanagawa compiler (git submodule)
  ac_types/            Algorithmic C datatypes (git submodule)
```

## Getting Started

The easiest way to build is with the dev container, which has all toolchains pre-installed:

```bash
# Build the dev container
docker build -t opentaalas-dev -f .devcontainer/Dockerfile \
  --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) .

# Run it
docker run --rm --userns=keep-id -v $(pwd):/workspace opentaalas-dev bash

# Inside the container: build and test
cmake -B build
cmake --build build
ctest --test-dir build -V
```

Without the container, you'll need:

- CMake 3.20+
- Verilator 5.040+
- SystemC 2.3.4
- GHC 9.6+ and Cabal (for building the Kanagawa compiler)
- Boost 1.74+

## HDL Stack

- [Kanagawa](https://github.com/microsoft/kanagawa) — Microsoft HLS with Wavefront Threading for all accelerator blocks
- [Chisel](https://www.chisel-lang.org/) — Scala-based HDL for structural RTL
- [Verilator](https://www.veripool.org/verilator/) — Cycle-accurate RTL simulation
- [OpenROAD](https://theopenroadproject.org/) — RTL → GDS backend targeting sky130hd

## Backend Flow

Physical design uses OpenROAD Flow Scripts for synthesis, place-and-route, and GDS generation on sky130hd at 250 MHz:

```bash
# Generate RTL
cmake --build build --target rtl_all

# Run full backend for a single module
cmake --build build --target gds_smoke_adder

# Run all backend targets
cmake --build build --target backend_all
```

### PnR Status (sky130hd @ 250 MHz)

19 designs configured. 14 modules completed through detailed routing (12 logic-only + 2 macro-bearing). 3 designs are physically blocked.

| Module | fmax (MHz) | Status |
|--------|-----------|--------|
| async_fifo | 326 | GDS |
| layer_tile | 254 | GDS |
| llama_chip | 252 | GDS |
| global_controller | 244 | GDS |
| scale_store | 243 | GDS |
| lut_interp | 227 | GDS |
| codebook_decoder | 215 | GDS |
| dequant | 214 | GDS |
| mac_pe | 138 | GDS |
| rom_bank | 157 | DRT (macro) |
| attention_unit | 76 | GDS |
| rmsnorm | 77 | GDS |
| swiglu | 47 | GDS |
| mac_array | 120 | DRT (macro) |
| embed_rom | — | GRT (congestion) |
| rope | — | Placement timeout |
| vector_unit | — | Blocked (101K nets) |
| kv_cache | — | Blocked (2048 SRAM tiles) |
| lm_head | — | Blocked (188 MB ROM) |

See [docs/backend-metrics.md](docs/backend-metrics.md) for full metrics, timing analysis, and lessons learned.

## Inspired By

[Taalas](https://taalas.com) — a commercial LLM inference ASIC. OpenTaalas is an independent open-source exploration of similar ideas.

## License

TBD
