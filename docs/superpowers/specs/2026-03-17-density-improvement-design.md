# Density Improvement: Full Floorplan Rearchitecture

**Date:** 2026-03-17
**Status:** COMPLETE (2026-03-19)
**Goal:** Reduce total macro-bearing die area from ~108 mm² to ~51.5 mm² (52% reduction) by fixing extreme macro aspect ratios and co-optimizing die sizes.
**Result:** 96.6 mm² → 57.0 mm² (41% reduction). Target dies required enlargement during PnR validation.

## Problem

Current macro-bearing designs have 18-50% cell utilization. Root causes:

1. **Extreme macro aspect ratios** — `nor_rom_65536x192` is 103×35,404 µm (344:1), forcing a 600×36,000 die where only 3.5% is usable for logic.
2. **Oversized dies** — dies were enlarged to eliminate GRT overflow without analyzing the routing space budget.
3. **Redundant hardenings** — rom_bank is hardened independently but its ROM already exists inside mac_array.

## Design

### 1. Module Hierarchy — What Gets Its Own Die

Only harden leaf-level macro-bearing modules:

| Harden Independently | Drop Standalone Hardening | Rationale |
|---------------------|--------------------------|-----------|
| mac_array (with ROM inside) | ~~rom_bank~~ | rom_bank's ROM is already inside mac_array |
| vector_unit (with rope ROMs inside) | — | vector_unit contains rope's cos/sin tables |
| rope | — | Keep independent — already DRT-complete, reusable outside vector_unit |
| kv_cache_demo (with SRAMs) | — | Standalone memory block |
| embed_rom (with NOR ROM) | — | Standalone lookup |
| lm_head_demo (with NOR ROM) | — | Standalone projection |
| attention_unit | — | Pure logic, no macros |

This eliminates 1 redundant hardening (rom_bank). Rope remains independently hardened since it is already DRT-complete and may be reused outside vector_unit.

### 2. NOR ROM Folding

The ROM compiler (`tools/rom_compiler/nor_rom_compiler.py`) currently calculates macro dimensions as:

- `width = cols × 0.460µm + 14µm` (bitcells + decoder + guard rings)
- `height = rows × 0.540µm + 12µm` (bitcells + sense amps + guard rings)

Add a `fold_factor` parameter that reorganizes the physical array:

- Physical rows = rows / fold_factor
- Physical cols = cols × fold_factor
- Internal column mux selects the correct fold bank
- External interface (addr width, dout width) unchanged

#### Folded Macro Dimensions

| Macro | Fold | Phys Rows | Phys Cols | Width (µm) | Height (µm) | Ratio | Before Ratio |
|-------|------|----------|----------|-----------|-------------|-------|-------------|
| nor_rom_65536x192 | 16 | 4,096 | 3,072 | 1,427 | 2,224 | **1.6:1** | 344:1 |
| nor_rom_4096x192 | 2 | 2,048 | 384 | 191 | 1,118 | **5.9:1** | 21.8:1 |
| nor_rom_4096x1024 | 1 | — | — | 485 | 2,226 | 4.6:1 | (keep) |
| nor_rom_1024x880 | 1 | — | — | 419 | 565 | 1.4:1 | (keep, already near-square) |

The critical fix: `nor_rom_65536x192` goes from **344:1 → 1.6:1** (nearly square).

#### Folding Implementation

The folded macro is implemented as a **wrapper module** with the same name and interface as the original blackbox. Internally it instantiates a wider physical ROM blackbox and adds column mux logic:

- Upper address bits (`addr[15:12]` for fold=16) registered alongside the ROM read
- Physical ROM blackbox: `nor_rom_65536x192_phys` (4096 rows × 3072 cols)
- Output mux selects the correct 192-bit slice from the 3072-bit physical row
- The wrapper is **not** `(* blackbox *)` — it contains behavioral mux logic that synthesizes to gates
- The physical ROM inside retains `(* blackbox *)` and maps to the LEF/LIB/GDS macro
- No change to the HAL layer — external interface stays `65536 × 192`

#### Timing Impact

The 16:1 column mux adds combinational delay after the ROM read. The current `CLK_TO_Q = 2.0 ns` Liberty timing is an estimate for the physical ROM. The mux delay (~0.3-0.5 ns at sky130) is additional and will be handled by synthesis as combinational logic outside the macro. This is conservative — if timing is tight, the mux can be registered (adding 1 cycle latency) in a future revision.

#### SRAM: No Change

`sram_4096x8` is a fixed third-party macro. kv_cache_demo already works at 0 DRC with 8 narrow macros placed side-by-side.

### 3. Die Sizing with Routing Margins

Routing channel budget per die:

- **100µm minimum** between macro edge and die edge (PDN + routing)
- **150-200µm** between two macros placed side-by-side
- **Cell utilization 40-50%** in routing area (higher causes GRT overflow per experience)
- Cell utilization percentages below are **routing-area utilization** (excluding macro footprint), not die-level
- Macro pins need clear met3 flyover space

#### Target Dies

| Module | Macro Area (mm²) | Cells | Target Die (µm) | Die Area (mm²) | Routing-Area Util |
|--------|-----------------|-------|-----------------|----------------|-------------------|
| embed_rom | 3.17 (1× folded) | 14K | 2,000 × 3,000 | 6.0 | 40-45% |
| lm_head_demo | 3.17 (1× folded) | 13K | 2,000 × 3,000 | 6.0 | 40-45% |
| mac_array | 1.26 (1× ROM) | 23K | 1,500 × 3,000 | 4.5 | 45-50% |
| rope | 2.16 (2× ROM) | 33K | 2,000 × 3,500 | 7.0 | 45% |
| vector_unit | 2.16 (2× ROM) | 791K | 4,000 × 5,500 | 22.0 | 50% |
| kv_cache_demo | — (8× SRAM) | 2.6K | 1,200 × 5,000 | 6.0 | keep as-is |

#### Routing Channel Example (embed_rom, 2,000 × 3,000 — not to scale)

```
+--------------------------------------------------+
|  ~100µm margin                                   |
|  +--------------------------------------------+  |
|  |         routing area (~290µm tall)          |  |
|  +--------------------------------------------+  |
|  |                                             |  |
|  |        folded nor_rom_65536x192             |  |
|  |        1,427 × 2,224 µm                    |  |
|  |                                             |  |
|  +--------------------------------------------+  |
|  |         routing area (~290µm tall)          |  |
|  +--------------------------------------------+  |
|  ~100µm margin                                   |
+--------------------------------------------------+
       ~290µm    1,427µm macro    ~290µm
```

Horizontal margins: (2000 - 1427) / 2 ≈ 287 µm each side. Vertical margins: (3000 - 2224) / 2 ≈ 388 µm each side, minus 100 µm die edge margin ≈ 288 µm routing channel.

### 4. GRT/DRT Strategy

Based on lessons learned from 19 completed designs:

- Keep `-allow_congestion` on initial GRT pass
- Keep `SKIP_INCREMENTAL_REPAIR=1` and `RECOVER_POWER=0` to avoid NDR retry loops
- If GRT overflow > 0 at target die size, increase die by **10% increments** rather than fighting congestion
- Target **0 GRT overflow** before entering DRT

### 5. Area Summary

| Module | Original Die (mm²) | Target Die (mm²) | Actual Die (mm²) | Reduction |
|--------|-------------------|-------------------|------------------|-----------|
| embed_rom | 21.6 | 6.0 | 10.24 (3200×3200) | **53%** |
| lm_head_demo | 21.6 | 6.0 | 10.24 (3200×3200) | **53%** |
| mac_array | 9.0 | 4.5 | 7.5 (2500×3000) | **17%** |
| rope | 25.0 | 7.0 | 7.0 (2000×3500) | **72%** |
| vector_unit | 25.0 | 22.0 | 22.0 (4000×5500) | **12%** |
| kv_cache_demo | 6.0 | 6.0 | 6.0 (unchanged) | 0% |
| **Total** | **108.2** | **51.5** | **63.0** | **42%** |

**Note:** Target dies of 2000×3000 for embed_rom/lm_head_demo were too aggressive — GP diverged at those sizes. Final 3200×3200 is the minimum that routes. mac_array target of 1500×3000 also too aggressive (12.7K DRC), settled at 2500×3000.

## Implementation Order

### Phase 1: ROM Compiler Folding

1. Add `--fold` parameter to `tools/rom_compiler/nor_rom_compiler.py`
   - Folded LEF: wider physical macro, redistributed L/R met3 pins
   - Folded wrapper Verilog: instantiates wider physical blackbox + column mux
   - Folded physical blackbox Verilog: `(* blackbox *)` with wider dout
   - Folded Liberty: timing for physical macro, updated area
   - Folded GDS: updated boundary for physical macro
2. Regenerate `nor_rom_65536x192` with fold=16
3. Regenerate `nor_rom_4096x192` with fold=2 (if used)
4. Verilator lint on new wrapper + blackbox

### Phase 2: Die Resizing (one module at a time)

5. **embed_rom** — update config.mk (2000×3000), macro_place.tcl, run PnR
6. **lm_head_demo** — same macro shape, same approach
7. **mac_array** — shrink to 1500×3000
8. **rope** — shrink to 2000×3500
9. **vector_unit** — shrink to 4000×5500 (highest risk, do last)

### Files Changed

| File | Change |
|------|--------|
| `tools/rom_compiler/nor_rom_compiler.py` | Add fold parameter, generate wrapper + physical blackbox |
| `flow/macros/sky130hd/nor_rom_65536x192.*` | Regenerated with fold=16 (physical macro collateral) |
| `flow/macros/sky130hd/nor_rom_65536x192_wrapper.v` | New: wrapper with column mux |
| `flow/designs/sky130hd/embed_rom/config.mk` | New DIE_AREA/CORE_AREA |
| `flow/designs/sky130hd/embed_rom/macro_place.tcl` | New macro placement |
| `flow/designs/sky130hd/lm_head_demo/config.mk` | New DIE_AREA/CORE_AREA |
| `flow/designs/sky130hd/lm_head_demo/macro_place.tcl` | New macro placement |
| `flow/designs/sky130hd/mac_array/config.mk` | New DIE_AREA/CORE_AREA |
| `flow/designs/sky130hd/mac_array/macro_place.tcl` | New macro placement |
| `flow/designs/sky130hd/rope/config.mk` | New DIE_AREA/CORE_AREA |
| `flow/designs/sky130hd/rope/macro_place.tcl` | New macro placement |
| `flow/designs/sky130hd/vector_unit/config.mk` | New DIE_AREA/CORE_AREA |
| `flow/designs/sky130hd/vector_unit/macro_place.tcl` | New macro placement |

No HAL changes. No Kanagawa source changes. The only RTL addition is the folded ROM wrapper module.
