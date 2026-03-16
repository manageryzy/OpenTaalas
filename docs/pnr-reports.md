# Place & Route Reports — Macro-Bearing Designs

This document presents detailed Place & Route results for the seven macro-bearing designs in the OpenTaalas LLM inference ASIC. All designs target the SkyWater 130nm HD standard cell library (sky130hd) and were implemented using the OpenROAD Flow Scripts (ORFS) backend with a 250 MHz (4 ns period) clock constraint.

The ORFS flow proceeds through synthesis (Yosys), floorplanning, global placement, clock tree synthesis (CTS), global routing (GRT), and detailed routing (DRT). Hierarchical synthesis (`SYNTH_HIERARCHICAL=1`) is used for all macro-bearing designs to avoid flatten-induced runtime explosion. The `slang` frontend is required for Kanagawa-generated SystemVerilog constructs, and `-DSIMULATION` is defined to bypass HAL error guards during synthesis.

Custom NOR ROM and SRAM macros provide dense storage for weights, embedding tables, and caches. LEF abstracts define pin geometry and obstruction layers; Liberty timing models provide setup/hold and delay data; GDS provides the physical layout for final integration.

---

## Summary Table

| Design | Die (um) | Macros | Std Cells | Util. | WNS (ns) | fmax (MHz) | GRT Overflow | DRC | Power (mW) |
|---|---|---|---|---|---|---|---|---|---|
| rom_bank | 2400 x 2400 | 1x nor_rom_1024x880 | 136,629 | 29.1% | -2.35 | 157 | 0 | 0 | 650 |
| mac_array | 3000 x 3000 | 1x nor_rom_1024x880 | 233,861 | 30.0% | -4.33 | 120 | 0 | 0 | 1,137 |
| rope | 5000 x 5000 | 2x nor_rom_4096x1024 | 478,014 | 23.4% | -8.78 | 78 | 858 | 9 | 1,622 |
| embed_rom | 600 x 36000 | 1x nor_rom_65536x192 | 244,741 | 20.6% | -5.86 | 101 | 2,924 | 0 | 194 |
| vector_unit | 5000 x 5000 | 2x nor_rom_4096x1024 | 790,947 | 50.2% | -19.30 | 43 | 54,540 | 782 | 5,045 |
| kv_cache_demo | 1200 x 5000 | 8x sram_4096x8 | 63,825 | 18.3% | -0.25 | 235 | 0 | 0 | 25 |
| lm_head_demo | 600 x 36000 | 1x nor_rom_65536x192 | 243,724 | 20.4% | -5.40 | 106 | 2,570 | 0 | 170 |

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

The nor_rom_1024x880 macro (566 x 2226 um) is centered within a 3000 x 3000 um die. Die sizing was determined by a sweep: 2000 um produced 150 overflow, 2400 um had 529, 2800 um had 9, and 3000 um achieved 0 overflow. The non-monotonic behavior at 2400 um suggests PDN stripe interference at that particular die dimension.

### Synthesis

- **Standard cells:** 233,861
- **Cell area:** 2.43 mm2
- **Macro area:** 0.24 mm2 (nor_rom_1024x880)
- **Total area:** 2.67 mm2
- **Utilization:** 30.0%

The four PEs plus dequantization logic account for 2.43 mm2 of standard cell area — 1.7x the rom_bank despite sharing the same macro. The macro represents only 9.0% of total area, with the bulk consumed by multiply-accumulate datapath logic.

### Routing

- **GRT overflow:** 0 (clean)
- **Total wirelength:** 10,234,114 um
- **Layer utilization:** met1 19.4%, met2 27.0%, met3 16.4%, met4 5.2%, met5 1.9%

Wirelength is 1.76x that of rom_bank, proportional to the increased cell count and die area. Metal 2 peaks at 27.0%. All layers remain well below congestion thresholds.

### Timing

- **WNS:** -4.33 ns
- **TNS:** -2,961.54 ns
- **fmax:** 120 MHz (target: 250 MHz)
- **Clock skew:** 0.45 ns (source latency 2.90 ns, target latency 2.45 ns)

The critical path runs through the shift-and-add multiply chain in the MAC PE, followed by BF16 dequantization. The 120 MHz fmax reflects the combinational depth of INT3 x INT8 multiplication without pipeline registers. Clock skew increases to 0.45 ns on the larger die but remains manageable.

### Power

- **Total power:** 1,137 mW

Power scales with the four-PE datapath. Each PE contributes roughly 250 mW of switching power through the multiply-accumulate chain, with the remainder consumed by ROM access and output staging.

### DRC

- **Violations:** 0

Clean DRC closure.

### Lessons

- Die sizing sweeps are necessary for macro-bearing designs; the relationship between die size and GRT overflow is non-monotonic due to PDN stripe interactions.
- The macro fill ratio of 2.6% is very low, meaning routing resources are abundant but die area is dominated by standard cells.
- The MAC PE critical path (shift-and-add multiply) is the timing bottleneck at 120 MHz; pipelining the multiply chain would be needed to reach higher frequencies.

---

## rope

### Overview

The Rotary Position Embedding (RoPE) unit applies rotational position encoding to query and key vectors. It contains two NOR ROM macros storing precomputed sin and cos tables — each with 4096 entries of 1024 bits, covering all sequence positions at the full head dimension. RoPE is applied after Q/K projection and before attention scoring.

### Floorplan

![rope](images/rope_final.png)

Two nor_rom_4096x1024 macros (485 x 2226 um each) are placed side-by-side, centered in a 5000 x 5000 um die. The dual-macro configuration creates a central routing blockage of approximately 2.16 mm2, forcing standard cells and signal routes to flow around the macro pair.

### Synthesis

- **Standard cells:** 478,014
- **Cell area:** 3.64 mm2
- **Macro area:** 2.16 mm2 (2x nor_rom_4096x1024)
- **Total area:** 5.80 mm2
- **Utilization:** 23.4%

Macros account for 37.2% of total area — a significant increase over the single-macro designs. The 478K standard cells implement the sin/cos multiplication pipeline, BF16 arithmetic for rotation, and the position counter logic.

### Routing

- **GRT overflow:** 858 total (met1: 121, met2: 376, met3: 73, met4: 288)
- **Total wirelength:** not reported (overflow present)
- **Layer utilization:** met1 12.1%, met2 20.6%, met3 10.3%, met4 5.2%, met5 0.8%

Despite moderate layer utilization, 858 GRT overflows persist. Metal 2 (376 overflows) and metal 4 (288 overflows) are the primary congestion layers. The dual-macro arrangement creates routing hotspots at the macro edges where signal wires must funnel through narrow channels between the macros and die boundary. The `-allow_congestion` GRT flag was used to allow routing to complete.

### Timing

- **WNS:** -8.78 ns
- **TNS:** -12,346.88 ns
- **fmax:** 78 MHz (target: 250 MHz)
- **Clock skew:** 0.81 ns (source latency 4.78 ns, target latency 3.97 ns)

The 78 MHz fmax reflects long combinational paths through the BF16 rotation arithmetic (sin/cos multiply, component add/subtract). Clock skew of 0.81 ns is elevated due to the 5 mm die dimension and CTS challenges routing around the two large macros. The high TNS of -12,346.88 ns indicates widespread timing failures across many endpoints.

### Power

- **Total power:** 1,622 mW

The two large ROMs and their 1024-bit-wide output buses drive substantial switching power. The BF16 multiplication pipeline for rotation adds further dynamic power.

### DRC

- **Violations:** 9

Nine DRC violations remain after detailed routing. These are likely metal spacing violations in congested regions near macro edges where the router was forced to use aggressive track spacing to resolve the 858 GRT overflows.

### Lessons

- Dual-macro designs with a combined macro fill ratio of 8.6% begin to exhibit meaningful routing congestion in sky130hd.
- The 858-overflow result required `-allow_congestion` plus `SKIP_INCREMENTAL_REPAIR=1`, `RECOVER_POWER=0`, and `SKIP_ANTENNA_REPAIR=1` to complete DRT.
- Clock skew grows significantly on 5 mm dies with large central obstructions, as CTS must route around macro blockages.
- Future iterations should explore separating the two macros to opposite die edges rather than centering them together, creating wider routing channels.

---

## embed_rom

### Overview

The embedding ROM performs token embedding lookup for the LLaMA model. Given a token ID, it reads the corresponding embedding vector from a 65536-row by 192-bit NOR ROM array, delivering 64 INT3 weights per row. This is the first stage of inference — converting input token IDs into dense vector representations before they enter the transformer layers.

### Floorplan

![embed_rom](images/embed_rom_final_rotated.png)

*Image rotated 90 degrees for readability.*

The design uses an extremely narrow die of 600 x 36000 um to accommodate the monolithic nor_rom_65536x192 macro (103 x 35404 um). The macro occupies the left edge of the die, and all standard cells are placed in a narrow 497 um strip along the right edge. This layout evolved from an earlier tiled approach using 16 separate nor_rom_4096x192 macros, which produced 18K GRT overflow due to 3072 met3 pins (16 macros x 192 pins) saturating horizontal routing capacity. The monolithic macro eliminated the inter-macro routing problem.

### Synthesis

- **Standard cells:** 244,741
- **Cell area:** 0.66 mm2
- **Macro area:** 3.63 mm2 (nor_rom_65536x192)
- **Total area:** 4.29 mm2
- **Utilization:** 20.6%

The macro dominates at 84.6% of total area. Standard cell logic is relatively modest — primarily address decoding, output formatting, and the handshake interface. The extreme aspect ratio (1:60) of the die is dictated entirely by the macro geometry.

### Routing

- **GRT overflow:** 2,924 total (met1: 2131, met2: 376, met3: 393, met4: 24)
- **Layer utilization:** met1 1.5%, met2 4.8%, met3 0.5%, met4 2.2%, met5 0.01%

Layer utilization is uniformly low (all under 5%), yet 2,924 GRT overflows persist. This paradox is explained by the extreme aspect ratio: while average utilization is low, local congestion in the narrow 497 um cell strip is severe. Metal 1 accounts for 2,131 of the overflows (72.9%), reflecting standard cell pin access congestion in the compressed placement region. The `-allow_congestion` flag was required for GRT completion.

### Timing

- **WNS:** -5.86 ns
- **TNS:** -1,353.44 ns
- **fmax:** 101 MHz (target: 250 MHz)
- **Clock skew:** 1.99 ns (source latency 7.17 ns, target latency 5.18 ns)

Clock skew of 1.99 ns is the highest among all designs, a direct consequence of the 36 mm die height. The CTS tree must span the full height, creating large insertion delay differences between cells at the top and bottom of the strip. The 101 MHz fmax is limited by the ROM access time through 65536 rows plus the clock skew penalty.

### Power

- **Total power:** 194 mW

Despite the large macro, power is relatively low because only one row is accessed per cycle and the 192-bit output bus is narrow compared to designs like rom_bank (880 bits) or rope (1024 bits).

### DRC

- **Violations:** 0

Clean DRC despite the routing overflow. The overflows are resolved during DRT without introducing spacing violations.

### Lessons

- Monolithic macros are preferable to tiled arrays when the tiled pin count saturates routing layers. The 16-macro tiled approach (18K overflow) was far worse than the single monolithic macro (2,924 overflow).
- Extreme aspect ratios (1:60) cause severe clock skew (1.99 ns) that directly limits achievable frequency.
- Low average layer utilization does not preclude local congestion; the narrow cell strip concentrates all routing demand into a small area.
- The embedding ROM is a memory-dominated design where macro geometry dictates die shape.

---

## vector_unit

### Overview

The vector processing unit (VPU) is the unified functional unit for all element-wise operations in the transformer layer: RMSNorm accumulation, RoPE rotation, SwiGLU activation (sigmoid LUT + two chained BF16 multiplies), and INT3-to-BF16 dequantization. It contains two NOR ROM macros for the RoPE sin/cos tables, identical to those in the standalone rope design.

### Floorplan

![vector_unit](images/vector_unit_final.png)

Two nor_rom_4096x1024 macros (485 x 2226 um each) are centered in a 5000 x 5000 um die. At 50.2% utilization, this is the densest design in the project. The high cell count is driven by gate-synthesized gamma arrays — 65K-bit behavioral RAMs that Yosys flattens into standard cell flip-flops, producing 791K instances.

### Synthesis

- **Standard cells:** 790,947
- **Cell area:** 10.29 mm2
- **Macro area:** 2.16 mm2 (2x nor_rom_4096x1024)
- **Total area:** 12.45 mm2
- **Utilization:** 50.2%

This is the largest design by cell count (790,947) and cell area (10.29 mm2). The behavioral RAMs for RMSNorm gamma parameters synthesize to massive flip-flop arrays. The macros represent only 17.3% of total area; standard cells dominate.

### Routing

- **GRT overflow:** 54,540 total (met1: 34,118, met2: 16,604, met3: 1,683, met4: 2,089, met5: 46)
- **Layer utilization:** met1 37.8%, met2 49.6%, met3 40.9%, met4 18.0%, met5 23.6%

Routing is severely congested across all metal layers. Metal 2 reaches 49.6% utilization — approaching the practical congestion threshold for sky130hd. Metal 1 accounts for 62.6% of all overflows, reflecting pin access congestion in the extremely dense standard cell placement. The 54,540 total overflow is an order of magnitude worse than any other design in the project.

### Timing

- **WNS:** -19.30 ns
- **TNS:** -72,429.09 ns
- **fmax:** 43 MHz (target: 250 MHz)
- **Clock skew:** 1.69 ns (source latency 5.83 ns, target latency 4.15 ns)

At 43 MHz, the vector unit is the slowest design. The -19.30 ns WNS means the critical path consumes 23.30 ns — nearly 6x the 4 ns clock period. The massive TNS of -72,429 ns indicates pervasive timing failures. The combination of 50.2% utilization, severe routing congestion, and long combinational paths through the SwiGLU and RMSNorm datapaths creates an intractable timing closure problem at this die size.

### Power

- **Total power:** 5,045 mW

By far the highest power design at over 5 W. The 791K standard cells with high switching activity through the gamma arrays, sigmoid LUT, and two chained BF16 multipliers drive extreme dynamic power. This power level would require careful thermal management in a packaged die.

### DRC

- **Violations:** 782

The 782 DRC violations are a direct consequence of the 54,540 GRT overflows. The detailed router forces aggressive track usage and via placement to resolve congestion, resulting in metal spacing and via enclosure violations.

### Lessons

- 50.2% utilization is too high for a macro-bearing design in sky130hd. The practical limit appears to be around 30% for designs with large central macro obstructions.
- Behavioral RAM synthesis (65K-bit arrays to flip-flops) is the root cause of the cell count explosion. The gamma arrays should be mapped to SRAM macros or NOR ROM macros rather than gate-synthesized.
- A larger die (7000 x 7000 um or beyond) would reduce utilization to the 25-30% range, potentially bringing GRT overflow to manageable levels.
- This design represents the upper bound of what ORFS can attempt with sky130hd standard cells and demonstrates the need for memory macro integration for all large storage elements.

---

## kv_cache_demo

### Overview

The KV cache demo is a reduced-scale implementation of the key/value attention cache, storing 16 tokens across 8 attention heads with 128-dimension vectors. It uses SRAM macros for the circular buffer K and V stores, proving the architectural concept before scaling to full LLaMA 3.1 8B dimensions. The KV cache is read during attention scoring and updated with each new token during autoregressive decoding.

### Floorplan

![kv_cache_demo](images/kv_cache_demo_final.png)

Eight sram_4096x8 macros (26.68 x 4441.76 um each) are arranged in two groups of four at the top of the 1200 x 5000 um die. Macro pins face downward toward the standard cell region at the bottom. This top-macros/bottom-cells arrangement minimizes wire length between the SRAM data ports and the control logic.

### Synthesis

- **Standard cells:** 63,825
- **Cell area:** 0.12 mm2
- **Macro area:** 0.95 mm2 (8x sram_4096x8)
- **Total area:** 1.07 mm2
- **Utilization:** 18.3%

The eight SRAM macros account for 88.8% of total area. Standard cell logic is minimal at 0.12 mm2 — just the address generation, circular buffer pointer management, and handshake interface. This is a memory-dominated design by an even greater margin than embed_rom.

### Routing

- **GRT overflow:** 0 (clean)
- **Total wirelength:** 245,660 um
- **Layer utilization:** met1 1.0%, met2 1.0%, met3 0.3%, met4 0.2%, met5 0.0%

Routing is trivially easy. All metal layers are under 1% utilization. The 245,660 um total wirelength is the lowest of any macro-bearing design, reflecting the small standard cell count and efficient macro-to-logic connectivity.

### Timing

- **WNS:** -0.25 ns
- **TNS:** -3.52 ns
- **fmax:** 235 MHz (target: 250 MHz)
- **Clock skew:** -0.15 ns

At 235 MHz, the KV cache demo nearly meets the 250 MHz target — the closest of any macro-bearing design. The -0.25 ns WNS is within reach of optimization through minor retiming or buffer insertion. The negative clock skew (-0.15 ns) indicates the capture clock arrives slightly before the launch clock, a favorable CTS result. The low TNS of -3.52 ns confirms that only a handful of paths violate timing, and by small margins.

### Power

- **Total power:** 25 mW

The lowest power design by a wide margin. The small standard cell count and narrow 8-bit SRAM data paths result in minimal switching activity. SRAM leakage dominates at this activity level.

### DRC

- **Violations:** 0

Clean DRC closure with no violations of any kind.

### Lessons

- SRAM-based designs with low standard cell counts are highly favorable for PnR — the KV cache demo is the best-performing macro-bearing design across all metrics.
- The top-macros/bottom-cells floorplan strategy works well for narrow dies with multiple column-oriented macros.
- The 235 MHz result validates the SRAM macro timing models and proves that the KV cache architecture can operate near the 250 MHz target.
- Scaling to full LLaMA dimensions (2048 tokens, 32 heads) would require 2048 SRAM macros, which is impractical as a flat design. Hierarchical instantiation or banked architectures would be needed.

---

## lm_head_demo

### Overview

The LM head demo is a reduced-scale implementation of the final projection layer that converts the last transformer layer's output into vocabulary logits and selects the most probable next token via argmax. It stores a 1024 x 4096 weight matrix in a monolithic NOR ROM and implements the dot-product projection plus argmax pipeline. This proves the end-to-end decode path from hidden state to token prediction.

### Floorplan

![lm_head_demo](images/lm_head_demo_final_rotated.png)

*Image rotated 90 degrees for readability.*

The floorplan is identical to embed_rom: a 600 x 36000 um die with the nor_rom_65536x192 macro (103 x 35404 um) at the left edge and standard cells in the 497 um right strip. The same monolithic macro is reused since both designs require 65536 rows x 192 bits of storage (1024 vocab x 4096 dims packs into the same geometry as 65536 tokens x 192 bits).

This design initially included RMSNorm gamma arrays as behavioral RAMs, which synthesized to 125K standard cell instances and caused a 21-hour GRT failure. Removing the RMSNorm arrays reduced instance count to 12.9K and brought PnR runtime down to 40 minutes.

### Synthesis

- **Standard cells:** 243,724
- **Cell area:** 0.62 mm2
- **Macro area:** 3.63 mm2 (nor_rom_65536x192)
- **Total area:** 4.25 mm2
- **Utilization:** 20.4%

Nearly identical to embed_rom in structure — the macro dominates at 85.4% of total area. The standard cell area (0.62 mm2) is slightly less than embed_rom (0.66 mm2), with the difference being the argmax comparator tree versus the embedding output formatting logic.

### Routing

- **GRT overflow:** 2,570 total (met1: 1,758, met2: 330, met3: 470, met4: 12)
- **Layer utilization:** met1 1.4%, met2 4.5%, met3 0.4%, met4 1.8%, met5 0.02%

The routing profile closely mirrors embed_rom. Metal 1 dominates overflows (68.4% of total) due to pin access congestion in the narrow cell strip. Total overflow of 2,570 is slightly better than embed_rom's 2,924, likely due to the marginally smaller cell area.

### Timing

- **WNS:** -5.40 ns
- **TNS:** -1,166.42 ns
- **fmax:** 106 MHz (target: 250 MHz)
- **Clock skew:** 1.02 ns (source latency 6.43 ns, target latency 5.40 ns)

Clock skew is 1.02 ns — significantly better than embed_rom's 1.99 ns despite the identical die geometry. The improved skew suggests that the CTS engine found a more balanced tree for the lm_head cell placement. The 106 MHz fmax is 5 MHz better than embed_rom, with the critical path running through the ROM access and dot-product accumulation.

### Power

- **Total power:** 170 mW

Slightly lower than embed_rom (194 mW), consistent with the smaller cell area and narrower active datapath during argmax comparison versus embedding vector assembly.

### DRC

- **Violations:** 0

Clean DRC despite the 2,570 GRT overflows, matching embed_rom's behavior. The DRT engine resolves the met1 pin access congestion without introducing spacing violations.

### Lessons

- Behavioral RAM synthesis is a critical risk factor. The initial 125K-instance design with gamma arrays was completely unroutable (21-hour GRT failure). Removing them reduced runtime from 21 hours to 40 minutes.
- The monolithic nor_rom_65536x192 macro is reusable across embed_rom and lm_head_demo, validating the macro design for multiple use cases.
- Clock skew varies significantly (1.02 ns vs. 1.99 ns) even with identical die geometry, depending on standard cell placement patterns and CTS optimization.
- The argmax pipeline adds negligible area overhead — the design is dominated by memory, making ROM access time the primary frequency limiter.

---

## Conclusion

### Cross-Cutting Observations

**Memory dominates area and shapes floorplans.** Across all seven designs, macro area ranges from 9.0% (mac_array) to 88.8% (kv_cache_demo) of total area. The macro geometry — not the logic — dictates die shape, aspect ratio, and routing topology. The extreme 1:60 aspect ratio of embed_rom and lm_head_demo is entirely driven by the 35 mm tall NOR ROM macro.

**Utilization is the strongest predictor of PnR outcome.** The three designs with clean GRT (0 overflow) have utilizations of 18.3%, 29.1%, and 30.0%. The design with 54,540 overflows has 50.2% utilization. The practical ceiling for macro-bearing designs in sky130hd appears to be approximately 30% utilization.

| Utilization | GRT Overflow | Outcome |
|---|---|---|
| 18.3% | 0 | Clean |
| 20.4% | 2,570 | Routable (narrow die) |
| 20.6% | 2,924 | Routable (narrow die) |
| 23.4% | 858 | Marginal (9 DRC) |
| 29.1% | 0 | Clean |
| 30.0% | 0 | Clean |
| 50.2% | 54,540 | Failed (782 DRC) |

Note that the 20% utilization designs with overflow (embed_rom, lm_head_demo) suffer from extreme aspect ratios rather than density — their local congestion in the 497 um cell strip is far higher than the global 20% average suggests.

**Behavioral RAM synthesis must be avoided.** Two designs (vector_unit and the initial lm_head_demo) demonstrated that synthesizing multi-kilobit arrays to flip-flops produces unroutable designs. The vector_unit's 65K-bit gamma arrays expanded to 791K standard cells, and lm_head_demo's initial gamma arrays produced 125K instances with a 21-hour GRT failure. All storage elements larger than a few hundred bits should be mapped to SRAM or ROM macros.

**Clock skew scales with die dimension.** Designs with a longest die edge of 2400-3000 um achieve 0.35-0.45 ns skew. At 5000 um, skew grows to 0.81-1.69 ns. The 36 mm tall embed_rom reaches 1.99 ns. For designs targeting 250 MHz (4 ns period), clock skew above 0.5 ns directly erodes the available path delay budget.

**No design meets the 250 MHz target.** The closest is kv_cache_demo at 235 MHz (-0.25 ns WNS), which is a simple memory-dominated design. Compute-heavy designs range from 43 MHz (vector_unit) to 157 MHz (rom_bank). Achieving 250 MHz will require pipelining the critical arithmetic paths (MAC shift-and-add, BF16 multiply, ROM access) and reducing die dimensions to control clock skew.

**Power scales with cell count and bus width.** The vector_unit at 5,045 mW (791K cells) and mac_array at 1,137 mW (234K cells) dominate power. Memory-dominated designs with narrow buses (kv_cache_demo at 25 mW, lm_head_demo at 170 mW) are far more power-efficient. Full-chip power budgeting will need to account for seven mac_array instances at approximately 8 W combined.

**ORFS workarounds are essential for congested designs.** The `-allow_congestion` GRT flag, combined with `SKIP_INCREMENTAL_REPAIR=1`, `RECOVER_POWER=0`, and `SKIP_ANTENNA_REPAIR=1`, was required for four of the seven designs. Without these flags, GRT either fails outright or enters infinite retry loops. A patched `global_route.tcl` wrapping `recover_power` incremental GRT in a catch block was needed to prevent `GRT-0116` errors from aborting the flow.
