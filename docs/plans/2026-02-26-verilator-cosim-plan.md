# Stage 2: Verilator HLS Co-Simulation Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Verify all 17 Kanagawa-generated SystemVerilog modules match SystemC reference models bit-exactly using Verilator C++ simulation.

**Architecture:** Reusable C++ harness handles Kanagawa's valid/ready handshake protocol. Per-module Verilator tests mirror SystemC tests. CMake uses Verilator's built-in `verilate()` function for clean integration.

**Tech Stack:** Verilator 5.020, CMake `find_package(verilator)`, Kanagawa runtime RTL (mock HAL), C++17

---

## Key Context

### Kanagawa Generated SV Port Convention

Each Kanagawa method becomes ports on the top-level module:

```
<method>_valid_in      -- assert for 1 cycle to call method (when rdy_out=1)
<method>_<arg>_in      -- argument values (drive same cycle as valid)
<method>_rdy_out       -- DUT ready to accept (check before asserting valid)
<method>_rden_in       -- read enable for result FIFO
<method>_empty_out     -- result FIFO empty (0 = result available)
<method>_result_out    -- return value (read when !empty, assert rden for 1 cycle)
```

Global ports: `clk`, `rst`, `rst_and_startup_done_out`, `stall_rate_in` (set to 0), `stall_rate_valid_in` (set to 0).

### Reset Protocol

1. Assert `rst = 1` for 60+ cycles
2. Deassert `rst = 0`
3. Wait for `rst_and_startup_done_out == 1`

### Runtime SV Files Required

All generated modules use these Kanagawa runtime primitives. Verilator flags: `-Wno-lint -Wno-UNOPTFLAT -Wno-TIMESCALEMOD -DSIMULATION`

### Generated SV File Naming

Kanagawa outputs: `rtl/generated/kanagawa/<name><top_module>.sv` and `<name><top_module>_types.sv`

Example: `mac_pemac_pe.sv`, `mac_pemac_pe_types.sv`

---

### Task 0: CMake Infrastructure + FindVerilator

**Files:**
- Create: `cmake/FindVerilator.cmake`
- Create: `test/verilator/CMakeLists.txt`
- Modify: `test/CMakeLists.txt`
- Modify: `CMakeLists.txt`

**Step 1: Create cmake/FindVerilator.cmake**

Wrap `find_package(verilator)` with graceful degradation. Set `VERILATOR_FOUND` cache variable.

**Step 2: Create test/verilator/CMakeLists.txt**

Define `KANAGAWA_RUNTIME_SV` list with all runtime SV files in correct parse order (packages first). Define `add_verilator_cosim_test(NAME TOP TEST)` helper that calls `verilate()` with runtime SV + generated SV + correct flags, registers CTest with label "verilator".

**Step 3: Wire into build**

Add `include(FindVerilator)` to top-level CMakeLists.txt. Add `add_subdirectory(verilator)` to test/CMakeLists.txt.

**Step 4: Verify**

Run: `cmake -B build`
Expected: "Found Verilator" in output, no errors.

**Step 5: Commit**

```bash
git commit -m "feat: Verilator co-sim CMake infrastructure"
```

---

### Task 1: Kanagawa Harness + mac_pe Test

**Files:**
- Create: `test/verilator/kanagawa_harness.h`
- Create: `test/verilator/test_vl_mac_pe.cpp`
- Modify: `test/verilator/CMakeLists.txt`

**Step 1: Create kanagawa_harness.h**

Template class `KanagawaHarness<VModel>` with:
- Constructor: creates VerilatedContext + VModel, initializes clk=0, rst=1, stall_rate=0
- `reset()`: assert rst 60 cycles, deassert, wait for rst_and_startup_done_out
- `tick()`: posedge + negedge (clk=1 eval, clk=0 eval, cycle++)
- `tick_n(n)`: multiple ticks
- `wait_ready(rdy_signal)`: poll until rdy=1, timeout abort
- `read_fifo(rden, empty, result)`: wait !empty, capture result, assert rden 1 cycle
- `dut()`: raw model access
- `cycle_count()`: current cycle

**Step 2: Create test_vl_mac_pe.cpp**

Mirror test/systemc/test_mac_pe.cpp exactly. Helper functions:
- `call_mac(h, mag, sign, act)` -> int32: wait_ready, drive valid+args, read_fifo
- `call_read_accum(h)` -> int32: wait_ready, drive valid, read_fifo
- `call_clear(h)`: wait_ready, drive valid, read_fifo (void return)
- `sext24(val)`: sign-extend 24-bit to int32

Tests (same as SystemC):
- test_all_magnitudes_positive: mag in {1,3,5,7,9,11,13,15}, sign=0, act=10
- test_all_magnitudes_negative: same mags, sign=1, act=10
- test_negative_activation: mag=5, act=-7, both signs
- test_accumulation_32_weights: 32x mac(1,0,1), expect 32
- test_worst_case_accumulation: 32x mac(15,0,127), expect 60960
- test_clear: mac then clear then mac, verify reset
- test_shift_and_add_correctness: all k=0..7, multiple activations

**Step 3: Register in CMakeLists.txt**

```cmake
add_verilator_cosim_test(NAME mac_pe TOP mac_pe TEST test_vl_mac_pe.cpp)
```

**Step 4: Build and run**

```bash
cmake --build build --target kanagawa_mac_pe
cmake --build build --target test_vl_mac_pe
ctest --test-dir build -R verilator_cosim_mac_pe -V
```

Expected: All 7 sub-tests pass.

**Step 5: Commit**

```bash
git commit -m "feat: Verilator co-sim harness + mac_pe test"
```

---

### Task 2: Storage Module Tests (rom_bank, scale_store, lut_interp)

**Files:**
- Create: `test/verilator/test_vl_rom_bank.cpp`
- Create: `test/verilator/test_vl_scale_store.cpp`
- Create: `test/verilator/test_vl_lut_interp.cpp`
- Modify: `test/verilator/CMakeLists.txt`

**Step 1: Generate RTL for all three**

```bash
cmake --build build --target kanagawa_rom_bank kanagawa_scale_store kanagawa_lut_interp
```

**Step 2: Check generated port interfaces**

Read each generated .sv to identify method ports. Each module will have different methods (write_byte/read_byte for rom_bank, set_bank_scale/get_bank_scale for scale_store, etc.).

**Step 3: Write tests mirroring SystemC**

For each module, create helper functions matching the SystemC test pattern:
- rom_bank: write_byte, read_byte, get_codebook_index, get_sign, get_sub_scale, get_super_scale
- scale_store: set_bank_scale, get_bank_scale, set_tensor_scale, get_tensor_scale
- lut_interp: write_entry, lookup

**Step 4: Register tests**

```cmake
add_verilator_cosim_test(NAME rom_bank TOP rom_bank TEST test_vl_rom_bank.cpp)
add_verilator_cosim_test(NAME scale_store TOP scale_store TEST test_vl_scale_store.cpp)
add_verilator_cosim_test(NAME lut_interp TOP lut_interp TEST test_vl_lut_interp.cpp)
```

**Step 5: Build and run**

```bash
cmake --build build
ctest --test-dir build -L verilator -V
```

**Step 6: Commit**

```bash
git commit -m "feat: Verilator co-sim tests for rom_bank, scale_store, lut_interp"
```

---

### Task 3: Compute Module Tests (codebook_decoder, dequant, mac_array)

**Files:**
- Create: `test/verilator/test_vl_codebook_decoder.cpp`
- Create: `test/verilator/test_vl_dequant.cpp`
- Create: `test/verilator/test_vl_mac_array.cpp`
- Modify: `test/verilator/CMakeLists.txt`

Same pattern as Task 2. Generate RTL, check ports, write tests mirroring SystemC, register, build, run, commit.

```cmake
add_verilator_cosim_test(NAME codebook_decoder TOP codebook_decoder TEST test_vl_codebook_decoder.cpp)
add_verilator_cosim_test(NAME dequant TOP dequant_unit TEST test_vl_dequant.cpp)
add_verilator_cosim_test(NAME mac_array TOP mac_array TEST test_vl_mac_array.cpp)
```

Note: dequant's top module may be `dequant_unit` (check generated filename).

**Commit:**
```bash
git commit -m "feat: Verilator co-sim tests for codebook_decoder, dequant, mac_array"
```

---

### Task 4: Attention & Vector Module Tests

**Files:**
- Create: `test/verilator/test_vl_kv_cache.cpp`
- Create: `test/verilator/test_vl_attention_unit.cpp`
- Create: `test/verilator/test_vl_rmsnorm.cpp`
- Create: `test/verilator/test_vl_swiglu.cpp`
- Create: `test/verilator/test_vl_rope.cpp`
- Modify: `test/verilator/CMakeLists.txt`

Same pattern. Generate RTL, check ports, write tests, register, build, run, commit.

```cmake
add_verilator_cosim_test(NAME kv_cache TOP kv_cache TEST test_vl_kv_cache.cpp)
add_verilator_cosim_test(NAME attention_unit TOP attention_unit TEST test_vl_attention_unit.cpp)
add_verilator_cosim_test(NAME rmsnorm TOP rmsnorm TEST test_vl_rmsnorm.cpp)
add_verilator_cosim_test(NAME swiglu TOP swiglu TEST test_vl_swiglu.cpp)
add_verilator_cosim_test(NAME rope TOP rope TEST test_vl_rope.cpp)
```

**Commit:**
```bash
git commit -m "feat: Verilator co-sim tests for attention and vector modules"
```

---

### Task 5: Integration Module Tests (vector_unit, layer_tile)

**Files:**
- Create: `test/verilator/test_vl_vector_unit.cpp`
- Create: `test/verilator/test_vl_layer_tile.cpp`
- Modify: `test/verilator/CMakeLists.txt`

```cmake
add_verilator_cosim_test(NAME vector_unit TOP vector_unit TEST test_vl_vector_unit.cpp)
add_verilator_cosim_test(NAME layer_tile TOP layer_tile TEST test_vl_layer_tile.cpp)
```

**Commit:**
```bash
git commit -m "feat: Verilator co-sim tests for vector_unit and layer_tile"
```

---

### Task 6: Top-Level Module Tests (embed_rom, lm_head, global_controller, llama_chip)

**Files:**
- Create: `test/verilator/test_vl_embed_rom.cpp`
- Create: `test/verilator/test_vl_lm_head.cpp`
- Create: `test/verilator/test_vl_global_controller.cpp`
- Create: `test/verilator/test_vl_llama_chip.cpp`
- Modify: `test/verilator/CMakeLists.txt`

```cmake
add_verilator_cosim_test(NAME embed_rom TOP embed_rom TEST test_vl_embed_rom.cpp)
add_verilator_cosim_test(NAME lm_head TOP lm_head TEST test_vl_lm_head.cpp)
add_verilator_cosim_test(NAME global_controller TOP global_controller TEST test_vl_global_controller.cpp)
add_verilator_cosim_test(NAME llama_chip TOP llama_chip TEST test_vl_llama_chip.cpp)
```

**Commit:**
```bash
git commit -m "feat: Verilator co-sim tests for top-level modules"
```

---

### Task 7: Full Suite Verification

**Step 1: Run all Verilator tests**

```bash
ctest --test-dir build -L verilator -V
```

Expected: All 17 tests pass.

**Step 2: Run all tests (SystemC + Verilator + existing)**

```bash
ctest --test-dir build -V
```

Expected: All tests pass (SystemC + Verilator + Kanagawa syntax + lint).

**Step 3: Final commit**

```bash
git commit -m "feat: Stage 2 Verilator co-sim complete — all 17 modules verified"
```
