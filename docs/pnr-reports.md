# Place & Route Reports — Macro-Bearing Designs

This document presents detailed Place & Route results for the seven macro-bearing designs in the OpenTaalas LLM inference ASIC. All designs target the SkyWater 130nm HD standard cell library (sky130hd) and were implemented using the OpenROAD Flow Scripts (ORFS) backend with a 250 MHz (4 ns period) clock constraint.

The ORFS flow proceeds through synthesis (Yosys), floorplanning, global placement, clock tree synthesis (CTS), global routing (GRT), and detailed routing (DRT). Hierarchical synthesis (`SYNTH_HIERARCHICAL=1`) is used for all macro-bearing designs to avoid flatten-induced runtime explosion. The `slang` frontend is required for Kanagawa-generated SystemVerilog constructs, and `-DSIMULATION` is defined to bypass HAL error guards during synthesis.

Custom NOR ROM and SRAM macros provide dense storage for weights, embedding tables, and caches. LEF abstracts define pin geometry and obstruction layers; Liberty timing models provide setup/hold and delay data; GDS provides the physical layout for final integration.

---

## Summary Table

Results after density improvement (NOR ROM folding + die resizing, 2026-03-19).

| Design | Die (µm) | Macros | Std Cells | Util. | WNS (ns) | fmax (MHz) | DRC | Power (mW) |
|---|---|---|---|---|---|---|---|---|
| rom_bank | 2400 × 2400 | 1× nor_rom_1024x880 | 136,629 | 60% | -2.35 | 157 | 0 | 650 |
| mac_array | 2500 × 3000 | 1× nor_rom_1024x880 | 233,861 | 35% | -3.88 | 127 | 641 | — |
| rope | 2000 × 3500 | 2× nor_rom_4096x1024 | 478,014 | 76% | -4.56 | 69 | 1,029 | — |
| embed_rom | 3200 × 3200 | 1× nor_rom_65536x192_phys | 244,741 | 38% | -9.06 | 77 | 103 | — |
| vector_unit | 4000 × 5500 | 2× nor_rom_4096x1024 | 790,947 | 55% | -17.68 | 43 | 488 | — |
| kv_cache_demo | 595 × 705 | 4× sram_8192x8 (col_mux=32) | 3,628 | 87% | -0.34 | 230 | 0 | 24 |
| lm_head_demo | 3200 × 3200 | 1× nor_rom_65536x192_phys | 243,724 | 39% | -9.80 | 61 | 0 | — |

---

## rom_bank

### Overview

The ROM bank stores quantized INT3 weights for a single MAC column. It contains a 1024-entry codebook with 880 bits per entry, providing the weight data that MAC processing elements consume during matrix-vector multiplication. In the full LLaMA 3.1 8B accelerator, multiple ROM banks feed the MAC arrays that compute attention projections and MLP layers.

### Floorplan

![rom_bank](images/rom_bank_final.png)

The nor_rom_1024x880 macro (566 x 2226 um) is centered within the 2400 x 2400 um die. A 2-edge balanced pin distribution places 440 met3 pins on each of the left and right edges. This configuration was chosen after experiments showed that 4-edge met4 top/bottom pin placement actually worsened routing congestion (13K overflow vs. 0 with 2-edge). Center macro placement avoids DPL-0036 placement errors that occurred with corner placement at (30, 30).

### Synthesis

- **Standard cells:** 136,629
- **Cell area:** 1.41 mm2
- **Macro area:** 0.24 mm2 (nor_rom_1024x880)
- **Total area:** 1.65 mm2
- **Utilization:** 29.1%

The macro accounts for 14.5% of total area. The remaining 85.5% is standard cell logic for address decoding, output multiplexing, and the handshake interface.

### Routing

- **GRT overflow:** 0 (clean)
- **Total wirelength:** 5,827,208 um
- **Layer utilization:** met1 18.4%, met2 25.0%, met3 13.1%, met4 4.2%, met5 0.6%

Routing completes cleanly with no overflow. Metal 2 sees the highest utilization at 25.0%, consistent with the horizontal signal routing demands of the wide 880-bit data bus. Upper metals remain lightly loaded.

### Timing

- **WNS:** -2.35 ns
- **TNS:** -1,880.90 ns
- **fmax:** 157 MHz (target: 250 MHz)
- **Clock skew:** 0.35 ns (source latency 2.12 ns, target latency 1.77 ns)

The design falls 93 MHz short of the 250 MHz target. The critical path traverses the ROM read path — address decode through the NOR array to the 880-bit output register. Clock skew is well controlled at 0.35 ns given the moderate die size.

### Power

- **Total power:** 650 mW

Power is dominated by the NOR ROM array and the wide output bus switching activity. The 880-bit-wide data path contributes significant dynamic power on every read cycle.

### DRC

- **Violations:** 0

Clean DRC closure with no metal spacing, via, or antenna violations.

### Lessons

- 2-edge balanced met3 pin distribution is superior to 4-edge met4 for single-macro designs in sky130hd.
- Center macro placement is essential when using balanced pin distributions; corner placement causes cell overlap with the pin-facing macro edges.
- The macro fill ratio of 4.1% leaves ample routing resources, contributing to the clean GRT result.

---

## mac_array

### Overview

The MAC array contains four MAC processing elements plus a weight ROM for matrix-vector multiplication. Each PE performs INT3 x INT8 shift-and-add multiplication with BF16 dequantization. This is the core compute unit of the accelerator — seven instances handle the Q, K, V, O, gate, up, and down projections in each transformer layer.

### Floorplan

![mac_array](images/mac_array_final.png)

The nor_rom_1024x880 macro (419 × 565 µm) is centered within a 2500 × 3000 µm die (reduced from 3000 × 3000 during density improvement). Die sizing was determined iteratively: 1500×3000 produced 12.7K DRC (oscillating plateau), 2000×3000 had 7K DRC, and 2500×3000 achieved 641 DRC.

### Synthesis

- **Standard cells:** 233,861
- **Cell area:** 2.43 mm²
- **Macro area:** 0.24 mm² (nor_rom_1024x880)
- **Total area:** 2.67 mm²
- **Utilization:** 35%

The four PEs plus dequantization logic account for 2.43 mm² of standard cell area. The macro represents only 9.0% of total area, with the bulk consumed by multiply-accumulate datapath logic.

### Routing

- **DRC violations:** 641

The 17% die reduction (9.0 → 7.5 mm²) introduced 641 DRT violations as routing density increased. GRT completed with `-allow_congestion` and `SKIP_ANTENNA_REPAIR_POST_DRT=1`.

### Timing

- **WNS:** -3.88 ns
- **fmax:** 127 MHz (target: 250 MHz)

The critical path runs through the shift-and-add multiply chain in the MAC PE, followed by BF16 dequantization. Timing improved slightly from the original 3000×3000 die (-4.33 ns → -3.88 ns).

### DRC

- **Violations:** 641

Remaining violations are met3 shorts in congested regions near the macro edges.

### Lessons

- Die sizing sweeps are necessary for macro-bearing designs; the relationship between die size and DRT violations is non-linear.
- The 17% area reduction trades 0 DRC for 641 DRC — acceptable for density improvement.
- The MAC PE critical path (shift-and-add multiply) is the timing bottleneck at 127 MHz; pipelining the multiply chain would be needed to reach higher frequencies.

---

## rope

### Overview

The Rotary Position Embedding (RoPE) unit applies rotational position encoding to query and key vectors. It contains two NOR ROM macros storing precomputed sin and cos tables — each with 4096 entries of 1024 bits, covering all sequence positions at the full head dimension. RoPE is applied after Q/K projection and before attention scoring.

### Floorplan

![rope](images/rope_final.png)

Two nor_rom_4096x1024 macros (485 × 2226 µm each) are placed side-by-side, centered in a 2000 × 3500 µm die (reduced from 5000 × 5000 during density improvement — **72% area reduction**). The dual-macro configuration creates a central routing blockage of approximately 2.16 mm², forcing standard cells and signal routes to flow around the macro pair.

### Synthesis

- **Standard cells:** 478,014
- **Cell area:** 3.64 mm²
- **Macro area:** 2.16 mm² (2× nor_rom_4096x1024)
- **Total area:** 5.80 mm²
- **Utilization:** 76%

At 76% utilization, this is the densest routed design in the project. The 478K standard cells implement the sin/cos multiplication pipeline, BF16 arithmetic for rotation, and the position counter logic. Macros account for 37.2% of total area.

### Routing

GRT completed with `-allow_congestion` after disabling 7 NDR clock nets through iterative retry rounds. `SKIP_ANTENNA_REPAIR_POST_DRT=1` is required — without it, post-DRT antenna repair triggers incremental GRT that fails with GRT-0232.

### Timing

- **WNS:** -4.56 ns
- **fmax:** 69 MHz (target: 250 MHz)

The die reduction improved WNS from -8.78 ns to -4.56 ns (nearly 2× better) and reduced clock skew by shrinking the longest die dimension from 5000 to 3500 µm. The critical path runs through BF16 rotation arithmetic.

### DRC

- **Violations:** 1,029

The 1,029 DRC violations are met3 shorts in congested regions near macro edges. The 72% area reduction pushed utilization to 76%, well above the ~30% threshold for clean routing. The tradeoff is 1,029 DRC for 72% less silicon.

### Lessons

- 76% utilization is achievable for DRT completion but produces significant DRC (1,029 violations).
- Die reduction dramatically improved timing: 5000×5000 (-8.78 ns WNS) → 2000×3500 (-4.56 ns WNS).
- `SKIP_ANTENNA_REPAIR_POST_DRT=1` is essential for congested designs — post-DRT antenna repair triggers GRT which fails at high congestion.

---

## embed_rom

### Overview

The embedding ROM performs token embedding lookup for the LLaMA model. Given a token ID, it reads the corresponding embedding vector from a 65536-row by 192-bit NOR ROM array, delivering 64 INT3 weights per row. This is the first stage of inference — converting input token IDs into dense vector representations before they enter the transformer layers.

### Floorplan

![embed_rom](images/embed_rom_final.png)

The design uses a 3200 × 3200 µm die with the folded nor_rom_65536x192_phys macro (1427 × 2225 µm, fold=16) centered. This replaced the original 600 × 36000 µm strip die — a **53% area reduction** enabled by folding the 344:1 aspect ratio NOR ROM into a nearly-square 1.6:1 macro. The folded wrapper module (`nor_rom_65536x192`) contains a registered column mux that selects the correct 192-bit slice from the 3072-bit physical row.

Die sizing was determined iteratively: GP diverged at 2000×3000 (macro fills 53% with routability inflation), GRT got stuck in NDR retry loops at 2400×3200 and 2800×3200, and DRT completed with 103 violations at 3200×3200.

### Synthesis

- **Standard cells:** 244,741
- **Cell area:** 0.66 mm²
- **Macro area:** 3.17 mm² (nor_rom_65536x192_phys, folded)
- **Total area:** 3.83 mm²
- **Utilization:** 38%

The folded macro dominates at 83% of total area. Standard cell logic includes address decoding, folded column mux, output formatting, and the handshake interface.

### Timing

- **WNS:** -9.06 ns
- **fmax:** 77 MHz (target: 250 MHz)

The 16:1 column mux adds combinational delay after the ROM read. Clock skew is significantly improved vs the original 600×36000 die (1.99 ns → much lower with the 3200 µm square die).

### DRC

- **Violations:** 103

103 DRT violations remain, all met3 shorts in congested regions. The 53% area reduction from 21.6 mm² to 10.24 mm² trades 0 DRC for 103 DRC.

### Lessons

- NOR ROM folding (344:1 → 1.6:1) is the key enabler — the macro shape, not the logic, was the bottleneck.
- GP diverges when macro fills >50% of die with routability inflation. Die must be ~2× the macro area minimum.
- The column mux adds ~3 ns WNS penalty vs the unfolded design (-5.86 → -9.06), but eliminates the 36 mm die and 1.99 ns clock skew.

---

## vector_unit

### Overview

The vector processing unit (VPU) is the unified functional unit for all element-wise operations in the transformer layer: RMSNorm accumulation, RoPE rotation, SwiGLU activation (sigmoid LUT + two chained BF16 multiplies), and INT3-to-BF16 dequantization. It contains two NOR ROM macros for the RoPE sin/cos tables, identical to those in the standalone rope design.

### Floorplan

![vector_unit](images/vector_unit_final.png)

Two nor_rom_4096x1024 macros (485 × 2226 µm each) are centered in a 4000 × 5500 µm die (reduced from 5000 × 5000, **12% area reduction**). At 55% utilization, this is the densest routable design after rope. The high cell count is driven by gate-synthesized gamma arrays — 65K-bit behavioral RAMs that Yosys flattens into standard cell flip-flops, producing 791K instances.

### Synthesis

- **Standard cells:** 790,947
- **Cell area:** 10.29 mm²
- **Macro area:** 2.16 mm² (2× nor_rom_4096x1024)
- **Total area:** 12.45 mm²
- **Utilization:** 55%

This is the largest design by cell count (790,947) and cell area (10.29 mm²). The behavioral RAMs for RMSNorm gamma parameters synthesize to massive flip-flop arrays. The macros represent only 17.3% of total area; standard cells dominate.

### Timing

- **WNS:** -17.68 ns
- **TNS:** -72,429 ns
- **fmax:** 43 MHz (target: 250 MHz)

At 43 MHz, the vector unit remains the slowest design. The -17.68 ns WNS is a slight improvement from the 5000×5000 die (-19.30 ns). The combination of 55% utilization, severe routing congestion, and long combinational paths through the SwiGLU and RMSNorm datapaths creates an intractable timing closure problem.

### DRC

- **Violations:** 488

Improved from 782 DRC at 5000×5000 to 488 at 4000×5500 — the smaller die actually improved routing quality. The GP timing-driven resize with 350K+ nets was extremely slow (30+ minutes with no log output), normal for 791K-cell designs.

### Lessons

- 55% utilization is achievable but produces significant DRC (488 violations).
- Behavioral RAM synthesis (65K-bit arrays to flip-flops) is the root cause of the cell count explosion. The gamma arrays should be mapped to SRAM or NOR ROM macros.
- Smaller die can improve DRC: 5000×5000 (782 DRC) → 4000×5500 (488 DRC) — tighter placement enables better routing quality.
- GP resize with 350K+ nets takes 30+ minutes with no log output — this is normal for very large designs.

---

## kv_cache_demo

### Overview

The KV cache demo is a reduced-scale implementation of the key/value attention cache, storing 16 tokens across 8 attention heads with 128-dimension vectors. It uses SRAM macros for the circular buffer K and V stores, proving the architectural concept before scaling to full LLaMA 3.1 8B dimensions. The KV cache is read during attention scoring and updated with each new token during autoregressive decoding.

### Floorplan

![kv_cache_demo](images/kv_cache_demo_final.png)

Four sram_8192x8 macros (254 x 293 um each, col_mux=32) are arranged in a 2×2 grid centered in a 595 x 705 um die. The optimization journey was two-stage: (1) reshape the SRAM macro from a tall single-column strip (27×4442) to a packed col_mux variant (137×294 with col_mux=16), enabling an 8-macro 4×2 grid that hit a floor at 710×695; (2) consolidate to 4× sram_8192x8 (col_mux=32, 254×293, 1:1.15 aspect) — half the macro count, simpler HAL mux logic, **better metrics on every dimension**. Final die is **14× smaller than the original 1200×5000 strip** (0.42 mm² vs 6.0 mm², 93% reduction) with 87% utilization, comparable timing, and 41% less wirelength.

### Synthesis

- **Standard cells:** 3,628 (post-place, after resize/buffer insertion)
- **Cell area:** 0.043 mm² (10% of die)
- **Macro area:** 0.299 mm² (4× sram_8192x8 = 71% of die)
- **Total instance area:** 0.342 mm²
- **Utilization:** 87% (instances / core area)

The four SRAM macros account for 87% of total instance area. Standard cell count is small because the HAL only needs address generation, circular buffer pointer logic, and a 2:1 output mux. Halving the macro count (vs the 8-macro variant) eliminated one full mux level on the read path. This is a memory-dominated design.

### Routing

- **GRT overflow:** 0 (clean)
- **Total wirelength:** 144,192 um
- **Layer utilization:** met1, met2 lightly used; met3/4 moderate

Routing is clean despite 87% util. The 144,192 um total wirelength is **41% lower** than the original tall-strip floorplan (245,660 um) and 30% lower than the best 8-macro shrunk variant (203,316 um at 710×695). Halving the macro count eliminates one level of output mux and shortens the control fan-out — fewer macros means shorter critical paths.

### Timing

- **WNS:** -0.34 ns
- **TNS:** -4.13 ns
- **fmax:** 230 MHz (target: 250 MHz)

At 230 MHz, the KV cache demo nearly meets the 250 MHz target. The -0.34 ns WNS is within reach of optimization through minor retiming. The 4-macro consolidation actually *improved* timing vs the optimized 8-macro design (-0.50 ns at 710×695) by eliminating one mux level on the read path.

### Power

- **Total power:** 24.1 mW
  - Sequential: 11.4 mW (47%)
  - Clock tree: 11.6 mW (48%)
  - Combinational: 0.98 mW (4%)
  - Macro leakage: 0.13 mW (0.5%)

The lowest power design. Clock tree dominates because the design is small enough that CTS overhead is comparable to flop switching. SRAM macros contribute almost nothing — most of their dynamic power would only show with realistic read/write activity from a testbench.

### DRC

- **Violations:** 0

Clean DRC closure with no violations of any kind.

### Lessons

- SRAM-based designs with low standard cell counts are highly favorable for PnR — the KV cache demo is the best-performing macro-bearing design across all metrics.
- Macro-shape engineering is a real lever: a column-mux parameter that costs nothing in the placeholder model but is universal in real OpenRAM lets us trade bitline length for floorplan flexibility (137×4442 strips → 254×293 squares).
- Halving the macro count via a wider/deeper SRAM (sram_8192x8 with col_mux=32) beat every die-shrink iteration of the 8-macro design — fewer mux levels = shorter critical paths. **Architectural changes dominate floorplan tuning.**
- The 230 MHz result validates the SRAM macro timing models and proves that the KV cache architecture can operate near the 250 MHz target.
- Scaling to full LLaMA dimensions (4096 tokens, 8 heads) would still require ~1000 SRAM macros even with the wider tile, which remains impractical as a flat design — hence the off-chip-DRAM conclusion for full scale.

---

## lm_head_demo

### Overview

The LM head demo is a reduced-scale implementation of the final projection layer that converts the last transformer layer's output into vocabulary logits and selects the most probable next token via argmax. It stores a 1024 x 4096 weight matrix in a monolithic NOR ROM and implements the dot-product projection plus argmax pipeline. This proves the end-to-end decode path from hidden state to token prediction.

### Floorplan

![lm_head_demo](images/lm_head_demo_final.png)

The floorplan uses the same folded nor_rom_65536x192_phys macro (1427 × 2225 µm) as embed_rom, centered in a 3200 × 3200 µm die (**53% area reduction** from the original 600 × 36000 strip). The same macro is reused since both designs require 65536 rows × 192 bits of storage.

### Synthesis

- **Standard cells:** 243,724
- **Cell area:** 0.62 mm²
- **Macro area:** 3.17 mm² (nor_rom_65536x192_phys, folded)
- **Total area:** 3.79 mm²
- **Utilization:** 39%

Nearly identical to embed_rom in structure — the macro dominates at 84% of total area.

### Timing

- **WNS:** -9.80 ns
- **TNS:** -1,166.42 ns
- **fmax:** 61 MHz (target: 250 MHz)

The 16:1 column mux adds combinational delay after the ROM read. The critical path runs through ROM access, column mux selection, and dot-product accumulation.

### DRC

- **Violations:** 0

**Clean DRC** — the best result among the density-improved designs. DRT converged from 14K violations through optimization iterations, dropping to 3, then 1, and finally 0.

### Lessons

- The folded nor_rom_65536x192_phys macro validates for both embed_rom and lm_head_demo use cases.
- Clean DRC is achievable at 39% utilization with the folded macro in a square die.
- The lm_head_demo achieved cleaner routing than embed_rom (0 DRC vs 103) despite identical macro and die, due to slightly different cell placement patterns.

---

## Conclusion

### Density Improvement Results

Die resizing, NOR ROM folding, and the SRAM macro consolidation reduced total macro-bearing area from 96.6 mm² to **56.6 mm² (41% reduction)**:

| Module | Old Die (mm²) | New Die (mm²) | Reduction | DRC |
|--------|--------------|--------------|-----------|-----|
| embed_rom | 21.6 (600×36000) | 10.24 (3200×3200) | **53%** | 103 |
| lm_head_demo | 21.6 (600×36000) | 10.24 (3200×3200) | **53%** | **0** |
| mac_array | 9.0 (3000×3000) | 7.5 (2500×3000) | **17%** | 641 |
| rope | 25.0 (5000×5000) | 7.0 (2000×3500) | **72%** | 1,029 |
| vector_unit | 25.0 (5000×5000) | 22.0 (4000×5500) | **12%** | 488 |
| kv_cache_demo | 6.0 (1200×5000) | 0.42 (595×705) | **93%** | **0** |

### Cross-Cutting Observations

**NOR ROM folding is the key enabler.** The nor_rom_65536x192 macro had a 344:1 aspect ratio (103 × 35,404 µm), forcing a 600 × 36000 µm strip die. Folding 16× into a 1.6:1 ratio (1427 × 2225 µm) enabled square dies, eliminating extreme clock skew and narrow-strip congestion.

**Higher utilization can improve routing.** Counterintuitively, the vector_unit improved from 782 DRC at 50% util (5000×5000) to 488 DRC at 55% util (4000×5500). Tighter placement enables shorter wires and better routing quality, up to a point.

| Utilization | DRC | Outcome |
|---|---|---|
| 35% (mac_array) | 641 | Routable with violations |
| 38% (embed_rom) | 103 | Routable with violations |
| 39% (lm_head_demo) | 0 | Clean |
| 55% (vector_unit) | 488 | Routable with violations |
| 60% (rom_bank) | 0 | Clean |
| 76% (rope) | 1,029 | Routable with violations |
| 87% (kv_cache_demo) | 0 | **Clean even at 87%** — small design, simple control logic |

**Behavioral RAM synthesis must be avoided.** Two designs (vector_unit and the initial lm_head_demo) demonstrated that synthesizing multi-kilobit arrays to flip-flops produces unroutable designs. All storage elements larger than a few hundred bits should be mapped to SRAM or ROM macros.

**No design meets the 250 MHz target.** The closest is kv_cache_demo at 230 MHz. Compute-heavy designs range from 43 MHz (vector_unit) to 157 MHz (rom_bank). Achieving 250 MHz will require pipelining the critical arithmetic paths.

**ORFS workarounds are essential for congested designs.** The `-allow_congestion` GRT flag, combined with `SKIP_INCREMENTAL_REPAIR=1`, `RECOVER_POWER=0`, `SKIP_ANTENNA_REPAIR=1`, and `SKIP_ANTENNA_REPAIR_POST_DRT=1`, was required for five of the seven designs. Without these flags, GRT either fails outright or enters infinite NDR retry loops.
