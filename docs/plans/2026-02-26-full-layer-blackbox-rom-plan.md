# Full Transformer Layer with Blackbox ROM — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a composed transformer layer (SV wrapper over Kanagawa-generated modules), generate blackbox ROMs with deterministic weights, and verify against SystemC reference via Verilator.

**Architecture:** Each Kanagawa module already generates standalone SV. A new SV wrapper (`transformer_layer_wrapper.sv`) instantiates all sub-modules (7 mac_arrays, vector_unit, kv_cache, attention_unit, layer_tile) and exposes a unified port interface. A C++ ROM generator produces SV blackbox modules with baked-in weights. The Verilator test drives the wrapper and compares against the SystemC reference model running identical weights.

**Tech Stack:** Kanagawa (existing modules), SystemVerilog (wrapper + blackbox ROMs), Verilator 5.020, C++17, CMake

**Key dimensions for CI test:** DIM=64, HEADS=4, HEAD_DIM=16, FFN_DIM=172, SEQ_LEN=8

---

### Task 0: Generate RTL for all modules

Ensure all Kanagawa modules have up-to-date generated SV before we start wiring them together.

**Files:**
- Check: `rtl/generated/kanagawa/*.sv` (all 17 modules)

**Step 1: Generate all RTL**

Run: `cmake --build build --target rtl_llama`

**Step 2: Verify all SV files exist**

Run: `ls rtl/generated/kanagawa/*mac_array* rtl/generated/kanagawa/*vector_unit* rtl/generated/kanagawa/*kv_cache* rtl/generated/kanagawa/*attention_unit* rtl/generated/kanagawa/*layer_tile*`

Expected: All files present.

**Step 3: Commit (if any regenerated)**

```bash
git add rtl/generated/
git commit -m "chore: regenerate RTL for all Kanagawa modules"
```

---

### Task 1: Create the SV transformer layer wrapper

Wire all sub-modules together in a single SV module. The wrapper instantiates the Kanagawa-generated modules and exposes a flat port interface for the testbench.

**Files:**
- Create: `rtl/sv/transformer_layer_wrapper.sv`

**Step 1: Study the generated SV port interfaces**

Read the generated SV for mac_array, vector_unit, kv_cache, attention_unit, and layer_tile. Note the exact port names (Kanagawa generates `<method>_valid_in`, `<method>_rdy_out`, `<method>_<arg>_in`, `<method>_result_out`, `<method>_rden_in`, `<method>_empty_out` for each public method).

**Step 2: Write the wrapper**

The wrapper instantiates:
- `mac_array` x7 (q, k, v, o, gate, up, down projections)
- `vector_unit` x1 (RMSNorm + RoPE + SwiGLU + dequant)
- `kv_cache` x1
- `attention_unit` x1
- `layer_tile` x1 (FSM controller)

Each sub-module gets its own prefixed ports exposed at the wrapper level. The wrapper does NOT contain orchestration logic — the C++ testbench drives the pipeline step by step (matching how the SystemC reference works).

```systemverilog
module transformer_layer_wrapper (
    input wire clk,
    input wire rst,
    input wire [2:0] stall_rate_in,
    input wire stall_rate_valid_in,
    output wire rst_and_startup_done_out,
    // ... per-submodule method ports, prefixed with submodule name
);
    // Instantiate sub-modules with prefix naming
    mac_array mac_q ( .clk(clk), .rst(rst), ... );
    mac_array mac_k ( .clk(clk), .rst(rst), ... );
    // ... etc
endmodule
```

**Step 3: Verify it parses**

Run: `verilator --lint-only -Wall rtl/sv/transformer_layer_wrapper.sv <all generated SV> <runtime SV>`

Expected: No errors (warnings OK with `-Wno-lint`).

**Step 4: Commit**

```bash
git add rtl/sv/transformer_layer_wrapper.sv
git commit -m "feat: SV transformer layer wrapper composing all sub-modules"
```

---

### Task 2: Create the deterministic weight generator

A C++ utility that produces reproducible IQ3_S weight blocks, codebook entries, RMSNorm gamma, RoPE sin/cos tables, and sigmoid LUT — all for small CI dimensions.

**Files:**
- Create: `tools/weight_generator.h` (header-only library)

**Step 1: Write the weight generator**

```cpp
// Deterministic weight generator for CI testing.
// Uses seeded PRNG to produce reproducible IQ3_S blocks,
// codebook entries, gamma tables, RoPE tables, sigmoid LUT.
// Small dimensions: DIM=64, HEADS=4, HEAD_DIM=16, FFN_DIM=172.

struct LayerWeights {
    // 7 projection weight ROMs (each: num_blocks * 110 bytes)
    std::vector<uint8_t> q_rom, k_rom, v_rom, o_rom;
    std::vector<uint8_t> gate_rom, up_rom, down_rom;
    // 7 codebook tables (each: 512 * 4 bytes)
    std::vector<uint32_t> q_grid, k_grid, v_grid, o_grid;
    std::vector<uint32_t> gate_grid, up_grid, down_grid;
    // RMSNorm gamma (DIM entries, BF16 as uint16)
    std::vector<uint16_t> gamma_pre_attn, gamma_pre_mlp;
    // rsqrt LUT (256 entries)
    std::vector<uint16_t> rsqrt_lut;
    // RoPE tables (positions * freq_pairs entries)
    std::vector<uint16_t> cos_table, sin_table;
    // Sigmoid LUT (256 entries)
    std::vector<uint16_t> sigmoid_lut;
};

LayerWeights generate_deterministic_weights(uint32_t seed = 42);
```

Key properties:
- Seeded PRNG (std::mt19937) for full reproducibility
- IQ3_S blocks: random qs[64], qh[8], signs[32], scales[4], d_bf16
- Codebook: 512 entries, each 4 packed uint8 magnitudes (0-7)
- Gamma: random BF16 values near 1.0
- RoPE: precomputed sin/cos for small position range
- Sigmoid LUT: precomputed sigmoid(x) for 256 BF16 input bins

**Step 2: Write a unit test**

Create: `test/systemc/test_weight_generator.cpp`

```cpp
// Verify deterministic generation: same seed → same weights
auto w1 = generate_deterministic_weights(42);
auto w2 = generate_deterministic_weights(42);
assert(w1.q_rom == w2.q_rom);
// Verify dimensions
assert(w1.q_rom.size() == expected_num_blocks * 110);
assert(w1.q_grid.size() == 512);
```

**Step 3: Add to CMake and run**

Add test to `test/systemc/CMakeLists.txt`.

Run: `cmake --build build --target test_weight_generator && ctest --test-dir build -R weight_generator -V`

Expected: PASS

**Step 4: Commit**

```bash
git add tools/weight_generator.h test/systemc/test_weight_generator.cpp test/systemc/CMakeLists.txt
git commit -m "feat: deterministic weight generator for CI testing"
```

---

### Task 3: Create the blackbox ROM SV generator

A C++ tool that takes weight data and produces SV modules with pre-initialized memory, using the same `KanagawaHALDualPortRAM` interface.

**Files:**
- Create: `tools/rom_sv_generator.h` (header-only)

**Step 1: Write the ROM SV generator**

```cpp
// Generates a SV file containing a KanagawaHALDualPortRAM module
// with memory pre-initialized from the given data.
//
// Output format:
//   module KanagawaHALDualPortRAM #(params) (ports);
//     reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
//     initial begin
//       mem[0] = <WIDTH>'h<val>;
//       ...
//     end
//     // standard read/write logic
//   endmodule

void generate_rom_sv(
    const std::string& output_path,
    const std::string& comment,
    int data_width,
    int addr_width,
    int depth,
    const std::vector<uint64_t>& init_data  // one entry per address
);
```

The generated module has the exact same interface as `hal_dual_port_ram.sv` (mock HAL) but with `initial begin` blocks that set memory contents. This makes it a drop-in replacement.

For sparse data (most entries zero), only emit non-zero entries and default-initialize to zero.

**Step 2: Write a unit test**

Create: `test/systemc/test_rom_sv_generator.cpp`

- Generate a small ROM (8 entries, 8-bit width)
- Verify the output file is valid SV (check key strings)
- Verify non-zero entries appear in the initial block
- Verify zero entries are omitted (sparse optimization)

**Step 3: Run test**

Run: `cmake --build build --target test_rom_sv_generator && ctest --test-dir build -R rom_sv_generator -V`

Expected: PASS

**Step 4: Commit**

```bash
git add tools/rom_sv_generator.h test/systemc/test_rom_sv_generator.cpp test/systemc/CMakeLists.txt
git commit -m "feat: blackbox ROM SV generator for synthesis and testing"
```

---

### Task 4: Create the layer ROM generation CMake target

A CMake target that runs the weight generator + ROM SV generator to produce all blackbox ROM files needed for the transformer layer test.

**Files:**
- Create: `tools/generate_layer_roms.cpp` (CLI tool)
- Modify: `tools/CMakeLists.txt`
- Modify: `test/verilator/CMakeLists.txt`

**Step 1: Write the CLI tool**

```cpp
// tools/generate_layer_roms.cpp
// Generates deterministic weights and produces blackbox ROM SV files
// for one transformer layer.
//
// Usage: generate_layer_roms --output-dir=<dir> [--seed=42]
//
// Output files:
//   <dir>/rom_mac_q_weights.sv
//   <dir>/rom_mac_q_codebook.sv
//   <dir>/rom_mac_k_weights.sv
//   ... (7 weight ROMs + 7 codebook ROMs)
//   <dir>/rom_gamma_pre_attn.sv  (vector_unit gamma)
//   <dir>/rom_gamma_pre_mlp.sv
//   <dir>/rom_rsqrt_lut.sv
//   <dir>/rom_cos_table.sv
//   <dir>/rom_sin_table.sv
//   <dir>/rom_sigmoid_lut.sv
```

**Step 2: Add CMake build target**

In `tools/CMakeLists.txt`:
```cmake
add_executable(generate_layer_roms generate_layer_roms.cpp)
target_include_directories(generate_layer_roms PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
```

**Step 3: Add CMake custom command for ROM generation**

In `test/verilator/CMakeLists.txt`:
```cmake
set(_rom_dir "${CMAKE_CURRENT_BINARY_DIR}/gen_roms")
add_custom_command(
    OUTPUT ${_rom_dir}/rom_mac_q_weights.sv  # ... and all others
    COMMAND generate_layer_roms --output-dir=${_rom_dir} --seed=42
    DEPENDS generate_layer_roms
    COMMENT "Generating blackbox ROM SV files for transformer layer test"
)
```

**Step 4: Build and verify ROM generation**

Run: `cmake --build build --target generate_layer_roms && ./build/tools/generate_layer_roms --output-dir=/tmp/test_roms --seed=42`

Expected: All ROM SV files generated in `/tmp/test_roms/`.

Verify: `head -20 /tmp/test_roms/rom_mac_q_weights.sv` shows valid SV with initial block.

**Step 5: Commit**

```bash
git add tools/generate_layer_roms.cpp tools/CMakeLists.txt test/verilator/CMakeLists.txt
git commit -m "feat: layer ROM generation CLI tool and CMake target"
```

---

### Task 5: Create the Verilator transformer layer test

The main test that instantiates the SV wrapper (with blackbox ROMs), loads the same weights into the SystemC reference, runs a forward pass through both, and compares outputs.

**Files:**
- Create: `test/verilator/test_vl_transformer_layer.cpp`
- Modify: `test/verilator/CMakeLists.txt`

**Step 1: Write the test driver**

The test:
1. Loads deterministic weights (same seed as ROM generator)
2. Resets the DUT (transformer_layer_wrapper)
3. Programs weights into each sub-module via method ports (write_rom_byte, write_grid_entry, set_gamma, etc.)
4. Feeds an input activation vector
5. Steps through the layer pipeline (RMSNorm → Q/K/V proj → RoPE → KV cache → attention → O proj → residual → RMSNorm → gate/up → SwiGLU → down → residual)
6. Reads output activation vector
7. Runs the same sequence through SystemC reference models
8. Compares outputs at each stage

For the initial version, test individual sub-module operations through the wrapper:
- Write weights to mac_q, read them back
- Run a MAC step, compare against SystemC MacArray
- Write gamma to vector_unit, read back
- Run RMSNorm accumulate, compare

**Step 2: Add CMake test registration**

```cmake
add_verilator_cosim_test(
    NAME transformer_layer
    TOP transformer_layer_wrapper
    TEST test_vl_transformer_layer.cpp
    SPARSE_RAM
    # Additional sources: generated blackbox ROMs
)
```

This needs a new CMake pattern since the wrapper is hand-written SV (not Kanagawa-generated). Add a new helper or extend the existing one.

**Step 3: Build and run**

Run: `cmake --build build --target test_vl_transformer_layer && ctest --test-dir build -R transformer_layer -V`

Expected: All sub-module operations match SystemC reference.

**Step 4: Commit**

```bash
git add test/verilator/test_vl_transformer_layer.cpp test/verilator/CMakeLists.txt
git commit -m "feat: Verilator transformer layer test with blackbox ROMs"
```

---

### Task 6: Full pipeline forward pass test

Extend the transformer layer test to run a complete forward pass through all pipeline stages.

**Files:**
- Modify: `test/verilator/test_vl_transformer_layer.cpp`

**Step 1: Implement full pipeline test**

Add test functions for each pipeline stage:
- `test_rmsnorm_pre_attn()` — accumulate input, check sum_sq
- `test_q_projection()` — MAC GEMV with real weights, compare dequant output
- `test_k_projection()` — same for K
- `test_v_projection()` — same for V
- `test_rope()` — write sin/cos, read back, verify rotation
- `test_kv_cache()` — append K/V, read back
- `test_attention()` — QK dot product, compare scores
- `test_o_projection()` — O GEMV
- `test_rmsnorm_pre_mlp()` — second RMSNorm
- `test_gate_up_projection()` — gate and up GEMVs
- `test_swiglu()` — SiLU activation
- `test_down_projection()` — down GEMV
- `test_full_forward()` — chain all stages, compare final output

Each test function:
1. Programs weights into RTL sub-module
2. Programs same weights into SystemC model
3. Drives identical inputs
4. Compares outputs bit-exactly

**Step 2: Run full test**

Run: `ctest --test-dir build -R transformer_layer -V`

Expected: All pipeline stages pass.

**Step 3: Commit**

```bash
git add test/verilator/test_vl_transformer_layer.cpp
git commit -m "feat: full pipeline forward pass in transformer layer test"
```

---

### Task 7: Full suite verification

Run the complete test suite to ensure nothing is broken.

**Step 1: Run all tests**

Run: `ctest --test-dir build -V`

Expected: All tests pass (59 existing + new transformer_layer tests).

**Step 2: Commit any fixes**

If any tests broke, fix and commit.

**Step 3: Final commit**

```bash
git add -A
git commit -m "feat: full transformer layer with blackbox ROM and real-weight testing"
```
