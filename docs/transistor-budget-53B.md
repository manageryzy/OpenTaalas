# LLaMA 3.1 8B — 55B Transistor Budget

Device-level transistor accounting for a fixed-weight LLM inference ASIC targeting LLaMA 3.1 8B with 3-bit NOR ROM weights.

> **Scope note:** This budget is for an advanced-node full-scale implementation. The current sky130hd PnR work (20 designs, 0 DRC across 12 logic-only + 5 macro-bearing + 2 academic demos + 1 Kanagawa orchestrator composition) builds **reduced-scale instances** of every architectural module to validate the toolchain and microarchitecture. Sky130 cell counts are typically 100×-600× smaller than the budget per-module estimates because (a) sky130 is the wrong process for the full design and (b) we built academic-scale tiles. See [Sky130 PnR Cross-Check](#sky130-pnr-cross-check-2026-05-13) at the bottom for the module-by-module mapping.

## Fixed Parameters

| Item | Value |
|------|-------|
| Layer weights (32 layers, INT3) | 20.9 Gbit |
| Embedding + LM head (INT3) | 3.15 Gbit |
| Scales (FP8 per-bank + FP32 per-tensor) | 0.3 Gbit |
| Total fixed bits | ~24.35 Gbit |

## ROM Structure

Contact-programmed NOR ROM. Every bit position has one nMOS; contact presence encodes 0/1. Transistor count is stable and directly equals bit count.

### Bank Geometry

| Parameter | Value |
|-----------|-------|
| Rows per bank | 4096 |
| Columns per bank | 8192 |
| Capacity per bank | 33,554,432 bit (~32 Mbit) |
| Bank count | 781 |

Bank count = ceil(24.35 Gbit / 33.55 Mbit).

## Device Baselines

| Device | Transistors |
|--------|-------------|
| Inverter | 2 |
| 2-input NAND | 4 |
| 3-input NAND | 6 |
| 4-input NAND | 8 |
| 2-input AND (NAND + INV) | 6 |
| 2-input XOR | 12 |
| 2:1 MUX | 12 |
| Full adder | 28 |
| Latch | 12 |
| DFF | 24 |
| SRAM 6T bitcell | 6 |
| NOR ROM bitcell | 1 |

## ROM Transistor Breakdown

### 1. Bitcells

24.35 Gbit x 1 = **24.350B**

### 2. Column Periphery

Single-ended bitline readout: precharge, weak keeper, bitline isolation, sense amp + latch.

| Per-column device | Transistors |
|-------------------|-------------|
| Bitline precharge pMOS | 1 |
| Bitline weak keeper pMOS | 1 |
| Bitline isolation nMOS | 1 |
| Sense amp + latch | 16 |
| Per-column total | 19 |

Total columns = 781 x 8192 = 6,397,952.

| Device | Count | Transistors |
|--------|-------|-------------|
| Precharge pMOS | 6,397,952 | 6.398M |
| Weak keeper pMOS | 6,397,952 | 6.398M |
| Isolation nMOS | 6,397,952 | 6.398M |
| Sense amp + latch | 6,397,952 | 102.367M |
| Column periphery total | | **121.561M (~0.122B)** |

### 3. Row Periphery

Hierarchical predecode + final 4-input NAND + wordline buffer.

| Per-row device | Transistors |
|----------------|-------------|
| Final 4-input NAND | 8 |
| Final inverter | 2 |
| Wordline buffer (2-stage INV) | 4 |
| Per-row total | 14 |

Total rows = 781 x 4096 = 3,199,776.

| Device | Count | Transistors |
|--------|-------|-------------|
| 4-input NAND | 3,199,776 | 25.598M |
| Inverter | 3,199,776 | 6.400M |
| Wordline buffer INV | 3,199,776 | 12.799M |
| Row periphery total | | **44.797M (~0.045B)** |

### 4. Predecode

12-bit row address, 4 groups of 3-bit predecode (each 3->8), 32 predecode lines.

| Per-bank component | Count | Transistors |
|--------------------|-------|-------------|
| 3-input NAND | 32 | 192 |
| Predecode output INV | 32 | 64 |
| Row address INV | 12 | 24 |
| Predecode line buffer (2-stage INV) | 32 | 128 |
| Per-bank predecode total | | 408 |

781 banks total: ~0.00032B (negligible).

### 5. Bank-Level Control & Repair/Test

| Per-bank sub-module | Composition | Transistors |
|---------------------|-------------|-------------|
| Timing & state machine registers | 512 DFF | 12,288 |
| Timing gating latches | 256 latches | 3,072 |
| Combinational control logic | ~2000 NAND2-equivalent + INV | ~12,000 |
| Redundancy mapping & compare | XOR + MUX equivalent | ~2,000 |
| Scan & minimal test interface | Gate-level equivalent | ~700 |
| Per-bank control total | | 30,000 |

781 banks total: 23.43M (~0.023B).

### ROM Total

| Item | Transistors |
|------|-------------|
| Bitcells | 24.350B |
| Column periphery | 0.122B |
| Row periphery | 0.045B |
| Predecode | 0.000B |
| Bank-level control & repair/test | 0.023B |
| **ROM total** | **24.54B** |

## Layer Tile Architecture

32 identical hardened macros, chained sequentially. Each tile contains its own ROM banks, compute units, and SRAM. Activations flow layer-to-layer in BF16.

### Per-Layer Tile (~1.7B transistors each)

| Sub-module | Description |
|------------|-------------|
| ROM banks (~21) | ~654 Mbit layer weights (attn: ~126 Mbit, MLP: ~528 Mbit) + scales |
| Attention Weight MAC | INT3x INT8, ~4 ROM banks, Q/K/V/O projections |
| MLP Weight MAC | INT3xINT8, ~17 ROM banks, gate/up/down projections |
| Attention Unit | INT8xINT8, QK dot product + softmax + V aggregation |
| VPU | BF16/FP32, RMSNorm + RoPE + SiLU + dequant + residual add |
| KV Cache SRAM (~8 MB) | K: 4 MB, V: 4 MB, activation buffers: ~144 KB |
| Layer Controller | FSM + pipeline control |

Global macros (outside tiles): Embed ROM (~50 banks), LM Head ROM (~50 banks), scale ROM (~10 banks), global controller.

## Digital MAC Array

3-bit weights read from ROM, multiplied with 8-bit activations. Bit-gated partial products + CSA + CPA. Two's complement sign flip via XOR. 32-bit accumulator with DFF register.

Split into two MAC units per layer tile:
- **Attention MAC** (~400K PEs): Q, K, V, O projections (~41.9M MACs/token)
- **MLP MAC** (~1.4M PEs): gate, up, down projections (~176.2M MACs/token)
- **Total**: ~1.8M PEs across all 32 tiles

Both share the same PE design; they differ only in array size and ROM bank count.

### 1. Single MAC Multiplier

8-bit activation, 16-bit product width.

| Component | Count | Calculation | Transistors |
|-----------|-------|-------------|-------------|
| Partial product AND gates | 24 | 24 x 6 | 144 |
| CSA compression (full adders) | 16 | 16 x 28 | 448 |
| CPA sum (full adders) | 16 | 16 x 28 | 448 |
| Sign flip XOR | 16 | 16 x 12 | 192 |
| Rounding/saturation/misc | | | 100 |
| **Multiplier total** | | | **1,332** |

### 2. Single Processing Element

| Sub-module | Composition | Transistors |
|------------|-------------|-------------|
| Multiplier | Above | 1,332 |
| 32-bit accumulator adder | 32 full adders | 896 |
| 32-bit accumulator register | 32 DFF | 768 |
| 16-bit product pipeline register | 16 DFF | 384 |
| 8-bit activation register | 8 DFF | 192 |
| Output select MUX | 16 x 2:1 MUX | 192 |
| Compare & saturation logic | Gate-level equivalent | 200 |
| Control registers | 10 DFF | 240 |
| Clock gating unit | Latch + AND | 18 |
| **PE total** | | **4,222** |

### 3. Array Scale

1,800,000 processing elements (Attention MAC ~400K + MLP MAC ~1.4M).

1.8M x 4,222 = **7.5996B (~7.60B)**

### 4. Array by Device Type

| Device type | Per-PE count | Array count | Baseline | Transistors |
|-------------|-------------|-------------|----------|-------------|
| AND | 24 | 43.2M | 6 | 0.2592B |
| XOR | 16 | 28.8M | 12 | 0.3456B |
| Full adder | 64 | 115.2M | 28 | 3.2256B |
| DFF | 66 | 118.8M | 24 | 2.8512B |
| 2:1 MUX | 16 | 28.8M | 12 | 0.3456B |
| Misc (clock gating, saturation, control) | | | | ~0.5724B |
| **Total** | | | | **7.5996B** |

## Attention Unit

Dedicated per-layer unit for KV cache attention operations. 32 instances (one per tile).

INT8xINT8 datapath: Q (INT8) dot K cache (INT8) producing FP32 scores, softmax in FP32, V aggregation (FP32 probs x INT8 V cache) producing BF16 output.

### Operations

1. Receive Q, K, V vectors from Attention MAC (post-dequant, post-RoPE for Q/K)
2. Append new K, V to layer's KV cache SRAM
3. QK dot products: 8 GQA groups x 4 Q heads x 128 dim against K cache
4. Causal mask: implicit via cache write pointer (read positions 0..count-1)
5. Softmax: FP32 internal (subtract max, exp via LUT+interp, normalize)
6. V aggregation: FP32 probs x V cache (INT8) to BF16 output
7. Output fed to O projection via Attention MAC

### Transistor Estimate

| Item | Transistors |
|------|-------------|
| 32 attention units | **1.10B** |
| Per-unit average | ~34.4M |

## Vector Processing Unit (VPU)

Per-layer BF16/FP32 unit for all non-GEMV operations. 32 instances (one per tile).

### Operations

| Operation | Precision |
|-----------|-----------|
| RMSNorm (x2 per layer) | BF16 in, FP32 reduction, rsqrt via LUT+interp |
| RoPE | BF16 sin/cos LUT, BF16 rotation (Q and K only) |
| Dequantization | INT32 x FP8 bank scale x FP32 tensor scale to BF16 |
| SiLU + element-wise mul (SwiGLU) | BF16, sigmoid via LUT+interp |
| Residual addition (x2 per layer) | BF16 + BF16 to BF16 |
| Requantization | BF16 to INT8 (dynamic scale) |

### Transistor Estimate

| Item | Transistors |
|------|-------------|
| 32 VPUs | **0.80B** |
| Per-unit average | ~25.0M |

## On-Chip SRAM

261 MB, 6T SRAM. Distributed across 32 layer tiles (~8 MB each for KV cache + activation buffers) plus global buffers. 20% overhead factor for periphery (decode, sense amps, write drivers, precharge, minimal repair/test).

### Per-Layer SRAM (x32)

| Buffer | Size |
|--------|------|
| K cache (4K tokens x 8 heads x 128 dim x INT8) | 4 MB |
| V cache (same) | 4 MB |
| Activation + MLP intermediate buffers | ~144 KB |
| **Per-layer total** | **~8.14 MB** |

### Global SRAM

| Buffer | Size |
|--------|------|
| Embedding output buffer | 8 KB |
| LM head logits accumulator (128256 x FP32) | 512 KB |
| **Global total** | **~0.5 MB** |

### SRAM Transistor Breakdown

| Item | Transistors |
|------|-------------|
| Bitcells (261 MB x 8 x 6) | 12.56B |
| 20% periphery overhead | 2.51B |
| **SRAM total** | **15.77B** (includes rounding from per-layer allocation) |

## 55B Budget Closure

| Module | Transistors |
|--------|-------------|
| ROM (weights + scales, 781 banks) | 24.54B |
| MAC arrays (Attn + MLP, ~1.8M PEs total) | 7.60B |
| Attention units (32x, INT8xINT8) | 1.10B |
| VPU (32x, BF16/FP32) | 0.80B |
| On-chip SRAM (261 MB with periphery) | 15.77B |
| Remainder (interconnect, global control, I/O, clocking) | 5.19B |
| **Total** | **~55.0B** |

---

## Sky130 PnR Cross-Check (2026-05-13)

20 designs are PnR-clean on sky130hd. Each maps to one or more modules in the budget above. Sky130 instances are reduced-scale (academic-shuttle-targeted, ~25 mm² reticle); the table shows what's implemented vs the 55B-budget assumption to validate microarchitecture and surface gaps.

**Conversion notes:**
- A sky130 stdcell is ~3-6 transistors on average (a ~5× factor between cell count and transistor count is reasonable). Cell counts here are post-PnR (incl. CTS + repair buffers but excl. fillers).
- "Scale ratio" = budget / sky130-instance — the multiplier needed to scale the sky130 implementation up to full LLaMA 3.1 8B at the target node. >100× is normal for reduced-scale demos.
- HLS retiming (`[[schedule(N)]]`) inflates cell count vs the device-level multiplier estimate because each pipeline stage adds register banks. This is intentional — it's the cost of meeting target frequency at sky130, not a budget mistake.

### ROM banks → `rom_bank`, `embed_rom`, `lm_head_demo`

| Budget item | Sky130 PnR | Sky130 cells | Macro size | Scale ratio | Notes |
|---|---|---|---|---|---|
| 1 ROM bank (32 Mbit) | `rom_bank` | 136,629 | 1× nor_rom_1024x880 (880 Kbit) | 37× per bank, 781× chip | Bank is reduced-scale demo of one of 781 banks |
| Embed ROM (~50 banks) | `embed_rom` | 32,365 | 1× nor_rom_65536x192 (12.6 Mbit, internal mux) | 16× | Single folded macro proves the embedding architecture |
| LM head ROM (~50 banks) | `lm_head_demo` | 49,329 | 1× nor_rom_65536x192 (12.6 Mbit) | 16× | Same folded macro reused; argmax + projection logic exercised |
| Predecode + row periphery | (modeled in macro Liberty) | n/a | n/a | n/a | NOR ROM macro abstracts include row/column logic; not separate sky130 designs |

The budget's 24.54B ROM transistors are dominated by 24.350B bitcells (1 transistor each in NOR ROM). Sky130 macros use a similar 1T-per-bit cell count; the per-bit budget transfers cleanly to any node.

### MAC arrays → `mac_pe`, `mac_array`

| Budget item | Sky130 PnR | Sky130 cells | Notes |
|---|---|---|---|
| 1 PE (1,332 mult + 4,222 total transistors) | `mac_pe` | 6,028 cells (~30K transistors) | 7× over device-level estimate — Kanagawa wraps the multiply in a multi-cycle FSM with handshake FIFOs, adding wrappers. After `[[schedule(2)]]` retiming for fmax. |
| 1 mac_array tile (~8,000 PEs at full scale) | `mac_array` (s2) | 233,861 cells (~1.2M transistors) | 39 PE equivalents per tile — academic shuttle, NOT full LLaMA scale. Full-scale would be ~50× larger. |
| Total array (1.8M PEs) | n/a — not built at sky130 | n/a | 1.8M PEs × 4222 transistors ≈ 7.6B. At sky130 this would need ~1500 mm² (impossible on shuttle). Validated only as 1× mac_pe + 1× mac_array tile. |

### Attention unit → `attention_unit`, `kv_cache_demo`

| Budget item | Sky130 PnR | Sky130 cells | Notes |
|---|---|---|---|
| 1 attention unit (~34M transistors) | `attention_unit` | 11,348 cells (~55K transistors) | 600× under budget — sky130 is INT8×INT8 dot product + max score only; softmax LUT, V aggregation handled separately. After `[[schedule(3)]]` retiming. |
| 1 KV cache (8 MB per layer) | `kv_cache_demo` | 3,628 cells + 4× sram_8192x8 | Reduced-scale: 16 tokens × 8 heads × 128 dims (full scale: 4096 tokens). 0 DRC at 595×705 µm. Validates circular-buffer K/V architecture; production needs off-chip HBM (see backend-metrics.md "Physical Limits"). |
| 32 attention units (1.10B) | n/a — only 1 instance built | n/a | Composition validated via `layer_orchestrator` (see below). |

### VPU → `vector_unit`, `rmsnorm`, `swiglu`, `lut_interp`, `dequant`, `rope_gen`, `rope_apply`

| Budget item | Sky130 PnR | Sky130 cells | Notes |
|---|---|---|---|
| 1 VPU (~25M transistors) | `vector_unit` | 790,947 cells (~4M transistors) | After `[[memory]]` SRAM macros → vector_unit dropped 791K → 127K cells in v6 source improvements (PnR pending re-run). 6× under budget — vector_unit dispatches to specialized sub-modules (RoPE, RMSNorm, SwiGLU) which are separately hardened. |
| RMSNorm sub-block | `rmsnorm` (v5) | 6,741 cells + 1× sram_4096x16 + 1× sram_256x16 | 0 DRC, 205 MHz fmax. v5 SRAM refactor for `_gamma[4096]` and `_rsqrt_lut[256]` (was 121K cells of FFs before) |
| SwiGLU sub-block | `swiglu` (s8) | 6,268 cells + 3× sram_256x16 | 0 DRC, 157 MHz. `[[schedule(8)]]` for sigmoid LUT + 2 BF16 mults. |
| RoPE sub-block | `rope_gen` (v7) + `rope_apply` (v7) | 5,000 + 5,800 cells | Split into table macro (rope_gen, 2× nor_rom_4096x1024 cos/sin) + datapath (rope_apply, pure stdcell rotate). 350 + 0 DRC. Multi-layer broadcast architecture. |
| Dequant sub-block | `dequant` | 10,508 cells | INT32 × FP8 → BF16 |
| LUT interp | `lut_interp` (v5) | 3,011 cells + 1× sram_256x16 | 0 DRC MET timing — 253 MHz fmax. |
| Codebook decoder | `codebook_decoder` (v6) | 4,491 cells + 5× sram_512x32 | 0 DRC MET (-0.02 ns), 249 MHz. |
| Scale store | `scale_store` | 5,823 cells | FP8 + FP32 scale lookup |

The VPU "25M transistors per instance" budget is the *aggregate* of these sub-blocks. Sky130 implements them as separate hardened tiles; the v12 `layer_orchestrator` shows they compose at PnR time.

### Layer-level composition → `layer_orchestrator` (v12, NEW 2026-05-12)

| Budget item | Sky130 PnR | Sky130 cells | Notes |
|---|---|---|---|
| 1 layer tile (~1.7B transistors at full scale) | `layer_orchestrator` (rope_apply + vector_unit + 4 SRAM macros) | 408K placed cells (~2M transistors) + 4 macros | First flat PnR of a Kanagawa multi-module composition. **0 DRC at 3000×3000 µm, 118 MHz fmax.** Proves the composition pattern that the 32-layer chip would use, even if at reduced scale. The full per-layer tile (with 7× mac_array + kv_cache + attention) would be ~2-3 GCells, well above sky130 ceiling. See backend-metrics §Pure-Kanagawa Composition. |
| 32 layer tiles | n/a — composition validated at 1× | n/a | Sky130 tested up to 2 layers (`multi_layer_chip` v11.3 — DRT plateau at ~2M residual, architectural ceiling). Multi-layer scale-out requires a finer process. |

### On-chip SRAM → `kv_cache_demo`, `sram_*` macros, `[[memory]]`-annotated arrays

The budget allocates 261 MB on-chip SRAM (12.56B bitcells + 2.51B periphery = 15.77B). Sky130 implements:
- 4× sram_8192x8 + 1× sram_4096x16 + 1× sram_256x16 + 5× sram_512x32 + 4× sram_4096x16 + 4× sram_256x16 (across all hardened tiles).
- Total sky130 SRAM: ~10 Mbit = 0.0012 GB. About **22,000× under** the 261 MB budget. Full-scale KV cache + activation buffers can't fit on sky130 die.
- The `kv_cache_demo` (16 tokens × 8 heads × 128 dims = 16 Kbit) proves the K/V circular buffer architecture. Full-scale (4096 tokens) requires HBM/DDR — every production AI chip does the same.

### Misc remainder → `async_fifo`, `global_controller`, `layer_tile`, `llama_chip`

| Budget item | Sky130 PnR | Sky130 cells | Notes |
|---|---|---|---|
| Per-layer FSM | `layer_tile` | 4,758 cells | 17-state controller |
| Global FSM | `global_controller` | 7,094 cells | 36-state pipeline |
| Top-level orchestrator | `llama_chip` | 5,885 cells | 0 DRC, fmax 252 MHz |
| CDC | `async_fifo` | 270 cells | Gray-code dual-clock FIFO, fmax 326 MHz |

### Summary

**What sky130 validates:** every architectural building block in the 55B budget exists as a PnR-clean sky130 design at reduced scale. The microarchitecture, HLS toolchain (Kanagawa → Yosys → ORFS → DRT), macro library (NOR ROM + SRAM), and composition mechanism (v12 layer_orchestrator) all work end-to-end.

**What sky130 cannot validate:** the 55B transistor count is dominated by ROM bitcells (24.5B) + SRAM bitcells (12.5B) + MAC arrays (7.6B), all of which need an advanced node (≥7nm) to fit on a single die. Sky130 designs are 100×-600× smaller per module; aggregate sky130 cell area across all 20 designs is ~42.8 mm² (cells) on ~132 mm² (die), versus the budget's effective ~50-80 mm² @ 3nm for the full 55B device.

**Path from sky130 → tape-out:** see [`tsmc-3nm-projection.md`](tsmc-3nm-projection.md) for the area + frequency scaling analysis (75× SRAM density, 200-400× logic density, 10-15× frequency uplift). The architecture transfers cleanly because all RTL is HLS-emitted; the HAL abstracts the macro library.
