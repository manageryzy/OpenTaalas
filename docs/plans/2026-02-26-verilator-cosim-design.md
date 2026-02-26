# Stage 2: Verilator HLS Co-Simulation Design

**Goal:** Verify Kanagawa-generated SystemVerilog matches SystemC reference models bit-exactly, using Verilator C++ simulation.

**Architecture:** Reusable C++ harness for Kanagawa's valid/ready handshake protocol, per-module tests mirroring SystemC tests, CMake integration with automatic RTL generation.

---

## Kanagawa Generated RTL Interface

Each Kanagawa module compiles to SystemVerilog with this port pattern per method:

```
// Method call ports
<method>_valid_in     — assert to invoke method (when rdy_out is high)
<method>_<arg>_in     — argument values
<method>_rdy_out      — DUT ready to accept new call
<method>_rden_in      — read enable for result FIFO
<method>_empty_out    — result FIFO empty (active high = no result)
<method>_result_out   — return value (when !empty after rden)

// Global
clk, rst
rst_and_startup_done_out  — reset sequence complete
stall_rate_in, stall_rate_valid_in  — backpressure control (set to 0)
```

Reset protocol: assert `rst` for ≥50 cycles, deassert, wait for `rst_and_startup_done_out`.

Method call protocol:
1. Wait for `<method>_rdy_out == 1`
2. Drive `<method>_valid_in = 1` + argument values for 1 cycle
3. Deassert `valid_in`
4. Poll `<method>_empty_out` — when 0, result is available
5. Assert `<method>_rden_in` for 1 cycle to read result from `<method>_result_out`

---

## Components

### 1. `test/verilator/kanagawa_harness.h` — Reusable Harness

Template class wrapping any Verilated Kanagawa module:

```cpp
template <typename VModel>
class KanagawaHarness {
public:
  KanagawaHarness(int timeout_cycles = 10000);
  ~KanagawaHarness();

  void reset();           // Drive rst, wait for rst_and_startup_done_out
  void tick();            // Single clock cycle (posedge + negedge)
  void tick_n(int n);     // Multiple cycles

  // Method call helpers (per-module tests use these)
  bool is_ready(int rdy_signal);
  void wait_ready(int& rdy_signal);
  void drive_valid(int& valid_signal, int value = 1);
  uint32_t read_result(int& rden, int& empty, uint32_t& result);

  VModel* dut();          // Access raw Verilated model
  uint64_t cycle_count(); // Current simulation cycle

private:
  std::unique_ptr<VModel> _dut;
  std::unique_ptr<VerilatedContext> _ctx;
  uint64_t _cycle;
  int _timeout;
};
```

### 2. Per-Module Tests

One C++ file per module in `test/verilator/test_vl_<module>.cpp`. Each test:
- Instantiates `KanagawaHarness<Vmac_pe>` (or appropriate Verilated model)
- Drives the same inputs as the corresponding SystemC test
- Reads outputs via FIFO protocol
- Asserts bit-exact match against expected values

### 3. CMake Integration — `test/verilator/CMakeLists.txt`

```cmake
# Helper: add_verilator_test(NAME <name> TOP <top_module> SOURCES <test.cpp>
#                            DEPENDS <kanagawa_target> SV_FILES <generated .sv files>)
function(add_verilator_test)
  # 1. Verilate: sv files → C++ model
  # 2. Compile: test .cpp + verilated model
  # 3. Register CTest with label "verilator"
endfunction()
```

Each test depends on the corresponding `kanagawa_<module>` target for RTL generation.

Verilator include paths: `third-party/kanagawa/runtime/rtl/` for FIFO primitives, `rtl/generated/kanagawa/` for generated SV.

---

## Module Test Plan

### Phase 1: Compute Core (prove infrastructure)

| Module | SystemC Test | Key Checks |
|--------|-------------|------------|
| mac_pe | test_mac_pe | All 8 magnitudes × ±sign × ±activation, accumulation, clear |
| codebook_decoder | test_codebook_decoder | First/last/all entries, odd magnitude invariant |
| dequant | test_dequant | Unit scale, sub_scale multiplier, negative accum, BF16 precision |

### Phase 2: Storage

| Module | SystemC Test | Key Checks |
|--------|-------------|------------|
| rom_bank | test_rom_bank | Block write/read, codebook index, sign, sub-scale, super-scale |
| lut_interp | test_lut_interp | Table populate, lookup with interpolation |

### Phase 3: Composed Compute

| Module | SystemC Test | Key Checks |
|--------|-------------|------------|
| mac_array | test_mac_array | Multi-PE MAC, dequant output, FP32 accumulation |

### Phase 4: Attention & Vector

| Module | SystemC Test | Key Checks |
|--------|-------------|------------|
| kv_cache | test_kv_cache | Append/read K and V, circular wrap, reset |
| attention_unit | test_attention_unit | INT8×INT8 dot product, accumulation, max tracking |
| rmsnorm | test_rmsnorm | Accumulate, gamma, rsqrt LUT |
| swiglu | test_swiglu | Sigmoid LUT, SiLU, SwiGLU |
| rope | test_rope | Sin/cos tables, rotation |

### Phase 5: Integration

| Module | SystemC Test | Key Checks |
|--------|-------------|------------|
| vector_unit | test_vector_unit | All sub-functions |
| layer_tile | test_layer_tile | FSM states, position advance |

### Phase 6: Top-Level

| Module | SystemC Test | Key Checks |
|--------|-------------|------------|
| embed_rom | test_embed_rom | Weight write/read |
| lm_head | test_lm_head | Weight access, argmax |
| global_controller | test_global_controller | FSM walk all states |
| llama_chip | test_llama_chip | Full pipeline decode |

---

## Directory Structure

```
test/
  verilator/
    kanagawa_harness.h          # Reusable C++ harness
    test_vl_mac_pe.cpp          # 17 per-module tests
    test_vl_codebook_decoder.cpp
    test_vl_dequant.cpp
    test_vl_rom_bank.cpp
    test_vl_lut_interp.cpp
    test_vl_mac_array.cpp
    test_vl_kv_cache.cpp
    test_vl_attention_unit.cpp
    test_vl_rmsnorm.cpp
    test_vl_swiglu.cpp
    test_vl_rope.cpp
    test_vl_vector_unit.cpp
    test_vl_layer_tile.cpp
    test_vl_embed_rom.cpp
    test_vl_lm_head.cpp
    test_vl_global_controller.cpp
    test_vl_llama_chip.cpp
    CMakeLists.txt              # Verilator test targets
```

---

## Success Criteria

- All 17 Verilator tests pass with bit-exact output match against SystemC reference
- `ctest -L verilator -V` runs full suite
- Each test completes within 30 seconds (timeout)

---

## Dependencies

- Kanagawa compiler (built at `.build/kanagawa/dist/bin/kanagawa`)
- Verilator 5.020+ (system-installed)
- Kanagawa runtime RTL (`third-party/kanagawa/runtime/rtl/`)
- SystemC reference models (for expected values)

---

## Design Decisions

1. **C++ harness, not SV testbenches** — easier to compare against SystemC models, reuse test logic
2. **Per-module tests, not monolithic** — isolate failures, parallel CTest execution
3. **Bit-exact comparison** — no tolerance, hardware must match reference exactly
4. **Automatic RTL generation** — CMake dependency on `kanagawa_<module>` ensures SV is up-to-date
5. **No DPI-C** — simpler infrastructure, harness drives ports directly
