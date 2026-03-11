# SRAM & ROM Macro Integration for Backend PnR

## Goal

Unblock ORFS synthesis and PnR for 6 modules stuck on behavioral memory arrays. Restructure Kanagawa RTL to use wide-word ROMs, build a NOR ROM compiler for sky130hd, use OpenRAM for kv_cache SRAM, and create a sky130 HAL layer for the Kanagawa runtime.

## Scope

6 modules (excluding lm_head, which needs external DRAM — separate project):

| Module | Memory Type | Current Declaration | Problem |
|--------|------------|-------------------|---------|
| rom_bank | Mask ROM | `uint8[112640]` × 7 copies | 7 RAM duplicates, byte-narrow |
| mac_array | Mask ROM + small grid | `uint8[112640]` × 6 + `uint32[512]` × 4 | 6 ROM duplicates |
| rope | Mask ROM | `uint16[262144]` × 2 tables | 16-bit narrow, 262K deep |
| vector_unit | Mask ROM | `uint16[262144]` × 2 (rope tables) | Same as rope |
| embed_rom | Mask ROM | `uint3[4194304]` × 1 | 3-bit narrow, 4M deep |
| kv_cache | SRAM (read-write) | `int8[4194304]` × 2 (K, V) | Too deep for gate synthesis |

## Key Decisions

1. **Weights are mask ROM** — contents baked into GDS at tapeout, no runtime write
2. **Via-programmed NOR ROM** — custom ROM compiler (1 transistor/bit), not SRAM-as-ROM
3. **OpenRAM for kv_cache** — only module with true read-write SRAM
4. **HAL layer integration** — new `hal/sky130/` follows Kanagawa's existing HAL pattern
5. **Wide-word ROM restructuring** — fix Kanagawa source to eliminate RAM duplication

## Architecture

### Memory Duplication Problem

Kanagawa creates one `KanagawaSyncRam` instance per `atomic` block that accesses a `[[memory]]` array. When a module has N accessor methods (e.g., `get_super_scale`, `get_codebook_index`, `get_sign`, `get_sub_scale`, `read_byte`), the compiler generates N independent copies of the entire memory. This is why rom_bank has 7 copies of 112KB and mac_array has 6 copies.

### Wide-Word Solution

Restructure each ROM module to have a single wide read method returning the full row. Field extraction becomes combinational logic after the read, not separate memory accesses.

### Integration Stack

```
Kanagawa HLS source (.k)
  → [[memory]] uint<880>[1024]  (wide-word declaration)
  → KanagawaSyncRam (generated RTL, 1 instance per memory)
    → KanagawaHALDualPortRAM (HAL layer)
      → hal/mock/  (simulation: behavioral reg array)
      → hal/sky130/ (synthesis: physical ROM/SRAM macro)
        → nor_rom_* or openram_sram_* macro cells
```

## Stage 1A: Kanagawa Source Restructuring

Rewrite 5 ROM modules to use wide-word `[[memory]]` arrays. Update SystemC models and co-sim tests.

### rom_bank.k

**Before:** `[[memory]] uint8[112640] _data` — 7 RAM copies
**After:** `[[memory]] uint<880>[1024] _blocks` — 1 RAM instance

880-bit word = one Q3_K block (110 bytes):
```
bits [15:0]     d_bf16 (super-scale, little-endian)
bits [527:16]   qs[64] (codebook indices, low 8 bits)
bits [591:528]  qh[8] (codebook indices, high bits)
bits [847:592]  signs[32] (256 sign bits)
bits [879:848]  scales[4] (8 × 4-bit sub-scales, packed)
```

Interface: `read_block(block_addr) → uint<880>`, `write_block(block_addr, value)`.
Callers extract fields via bit slicing after the read.

### mac_array.k

**ROM:** Same restructuring as rom_bank — `uint<880>[1024]` with `read_block`.
**Grid:** `uint32[512]` stays as-is (16 Kbit, small enough for gate synthesis). Consolidate 4 decode methods into one `read_grid(index) → uint32` if possible.

### rope.k (and vector_unit.k)

**Before:** `[[memory]] uint16[262144]` per table — 16-bit × 262K
**After:** `[[memory]] uint<1024>[4096]` per table — 1024-bit × 4K

Structure: 4096 positions × 64 frequency pairs × 16 bits = 1024 bits per row.
Interface: `read_cos_row(position) → uint<1024>`, `read_sin_row(position) → uint<1024>`.
Caller extracts specific frequency with bit slicing.

### embed_rom.k

**Before:** `[[memory]] uint3[4194304]` — 3-bit × 4M
**After:** `[[memory]] uint<192>[65536]` — 192-bit × 64K (or similar chunked layout)

Structure: 1024 tokens × 64 dim-groups × 192 bits (64 dims × 3 bits per group).
Address: `(token_id << 6) | dim_group`.
Interface: `read_chunk(addr) → uint<192>`.
Caller extracts specific 3-bit weight from the 192-bit chunk.

### Files Changed

- `rtl/kanagawa/rom_bank.k` — wide-word rewrite
- `rtl/kanagawa/mac_array.k` — wide-word ROM, consolidated grid access
- `rtl/kanagawa/rope.k` — wide-word tables
- `rtl/kanagawa/vector_unit.k` — wide-word tables (inherits rope change)
- `rtl/kanagawa/embed_rom.k` — chunked wide-word
- `model/systemc/src/rom_bank.h` — match new interface
- `model/systemc/src/mac_array.h` — match new interface
- `model/systemc/src/rope.h` — match new interface
- `model/systemc/src/vector_unit.h` — match new interface
- `model/systemc/src/embed_rom.h` — match new interface
- `test/verilator/test_vl_rom_bank.cpp` — new port interface
- `test/verilator/test_vl_mac_array.cpp` — new port interface
- `test/verilator/test_vl_rope.cpp` — new port interface
- `test/verilator/test_vl_vector_unit.cpp` — new port interface
- `test/verilator/test_vl_embed_rom.cpp` — new port interface
- `test/verilator/test_vl_layer_e2e.cpp` — new port interface for sub-modules
- `test/verilator/test_vl_transformer_layer.cpp` — new port interface

### Verification Gate

- All 17 SystemC unit tests pass
- All 19 Verilator co-sim tests pass
- 44 E2E checks pass (synthetic weights)
- Confirm KanagawaSyncRam instance count dropped (rom_bank: 7→1, mac_array: 10→2, rope: 2→2, embed_rom: 1→1)

## Stage 1B: GGUF Converter + Real-Data Verification

Update the GGUF converter to pack weights into wide words matching the new ROM layout.

### Files Changed

- `tools/gguf_converter.cpp` — pack Q3_K blocks into 880-bit words
- `tools/gguf_converter.h` — wide-word packing utilities
- `test/verilator/test_vl_layer_real_data.cpp` — drive new port interface

### Verification Gate

- All 16 real-data checks pass with actual LLaMA 3.1 8B layer 0 weights
- Cosine similarity matches previous results exactly:
  - Q/K/V/O projections: 1.000000
  - Post-attention residual: 0.999996
  - Gate/Up projections: 0.999965
  - SwiGLU activation: 0.998585
  - Down projection: 0.995683
  - Post-MLP residual: 0.999701

## Stage 2: NOR ROM Compiler

Python tool at `tools/rom_compiler/` that generates physical macro collateral.

### Inputs

ROM dimensions (rows, columns), macro name, sky130hd PDK parameters.

### Outputs per Macro

- `<name>.lib` — Liberty timing model (clk→data delay, setup/hold on address)
- `<name>.lef` — Abstract layout (outline, pin positions, metal obstructions)
- `<name>.gds` — Placeholder layout (filled rectangle + pins; real transistor layout deferred to tapeout)

### Macros to Generate

| Macro | Rows | Cols | Bits | Est. Area |
|-------|------|------|------|-----------|
| `nor_rom_1024x880` | 1024 | 880 | 901 Kbit | ~0.54 mm² |
| `nor_rom_4096x1024` | 4096 | 1024 | 4 Mbit | ~2.4 mm² |
| `nor_rom_65536x192` | 65536 | 192 | 12.6 Mbit | ~7.5 mm² |

### Timing Model

Contact-programmed NOR ROM, single-cycle synchronous read with output register:
- Clock → wordline decode → bitline discharge → sense → output register
- Estimated ~2ns at sky130 (fits in 4ns clock period)
- Setup time on address: ~0.5ns before clock edge
- Hold time: ~0.1ns

### Area Model

Based on architecture doc NOR ROM structure:
- Bitcell: ~0.5 µm² per bit at sky130
- ~20% overhead for row/column periphery

### Verification Gate

- LEF validates with OpenROAD `read_lef`
- Liberty validates with OpenSTA `read_liberty`
- GDS opens in KLayout without errors
- Area estimates plausible vs transistor budget doc

## Stage 3: OpenRAM SRAM for kv_cache

### Macro

| Macro | Width | Depth | Bits |
|-------|-------|-------|------|
| `openram_sram_8x4194304` | 8 | 4,194,304 | 33.6 Mbit |

OpenRAM generates tiled SRAM from smaller sub-banks internally. May need to generate multiple smaller macros (e.g., 8x4096) and tile with external address decode in the HAL layer.

### Verification Gate

- LEF/LIB/GDS validate cleanly
- Area plausible for 6T SRAM at sky130 (~0.5 µm² per bitcell × 6T overhead)

## Stage 4: HAL sky130 + ORFS Integration

### New Files

- `third-party/kanagawa/runtime/rtl/hal/sky130/hal_dual_port_ram.sv`
- `third-party/kanagawa/runtime/rtl/hal/sky130/hal_simple_dual_port_ram_tile.sv`

### HAL Implementation

Sky130 `KanagawaHALDualPortRAM` matches mock HAL port interface. Internally uses `generate` blocks to select the correct macro based on `DATA_WIDTH` and `DEPTH` parameters. Write ports are no-ops for ROM macros.

### Runtime Switching

`kanagawa_runtime.mk` gets `KANAGAWA_HAL_DIR` variable:
- `hal/mock` for simulation (default, unchanged)
- `hal/sky130` for synthesis

### ORFS Config Updates

Each module's `config.mk` adds:
```makefile
export ADDITIONAL_LEFS = <path to macro LEF files>
export ADDITIONAL_LIBS = <path to macro LIB files>
export ADDITIONAL_GDS  = <path to macro GDS files>
```

Macro files live in `flow/macros/sky130hd/`.

### CMake Integration

New target `macros_all` generates ROM + SRAM macros. Existing `synth_*` / `pnr_*` targets depend on it.

### Verification Gate

- Verilator tests still pass with `hal/mock/` (no regression)
- ORFS synthesis completes for all 6 modules (no Yosys hang)
- ORFS PnR completes for all 6 modules
- Collect area/timing/power metrics

## Stage 5: Full Integration Verification

- All 18 modules have PnR results (12 existing + 6 newly unblocked)
- Full backend metrics summary table
- No DRC violations from macro integration
- Timing analysis: wide-word ROM read fits in 4ns clock

## Execution Order

```
Stage 1A  →  Stage 1B  →  Stage 2  →  Stage 3  →  Stage 4  →  Stage 5
 (RTL)      (real data)   (ROM gen)   (OpenRAM)   (HAL+ORFS)  (metrics)
```

Stages 2 and 3 are independent and can run in parallel after Stage 1B passes.
