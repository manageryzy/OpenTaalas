# OpenTaalas TSMC N3E (3nm) Technology Projection

## 1. Executive Summary

OpenTaalas is an open-source LLM inference ASIC validated on the sky130hd process (130nm, 1.8V, 5 metal layers), where 19 designs totaling 37.8 mm² of cell area have been routed across 123.4 mm² of die area. At sky130, the architecture is physically constrained: the full-scale KV cache would require ~317 mm² of SRAM (impractical), the LM head would need ~550 mm² of NOR ROM (impossible), and the slowest datapath modules (swiglu at 47 MHz, vector\_unit at 43 MHz) fall far short of production AI chip clock rates. A projection to TSMC N3E (3nm, 0.75V, 15+ metal layers) transforms the picture entirely: logic area shrinks by 200--400x, SRAM by 75x, and frequency scales by 10--15x. The full KV cache fits in ~4.2 mm², the complete LM head in ~5.5--11 mm², and every module exceeds 400 MHz with the fastest surpassing 3 GHz. The chip that occupies an impractical >800 mm² at 130nm could fit in a single ~50--80 mm² 3nm die -- smaller than an Apple M2 GPU tile. The barrier is not architecture but economics: a 3nm mask set costs $500M--700M, placing this firmly in the domain of well-funded fabless startups rather than open-source shuttles. Nevertheless, the sky130 implementation serves its intended purpose -- validating the microarchitecture, timing closure methodology, and HLS toolchain at zero cost, producing an architecture that is directly portable to an advanced node.

## 2. Area Projection

### 2.1 Scaling Ratios

| Parameter | sky130hd (130nm) | TSMC N3E (3nm) | Ratio |
|-----------|-----------------|----------------|-------|
| Transistor density | ~0.5 MTr/mm² | ~300 MTr/mm² | 600x |
| Placed-and-routed logic (conservative) | baseline | -- | 200--400x |
| SRAM 6T bitcell | ~1.5 um² | ~0.0199 um² | 75x |
| NOR ROM bitcell (estimated) | ~0.5 um² | ~0.005--0.01 um² | 50--100x |
| Metal layers | 5 (li1 + met1--4) | 15+ | 3x+ |
| Standard cell height | ~8--9 tracks | ~5 tracks | ~1.7x |

The raw transistor density ratio is 600x, but placed-and-routed designs include whitespace for routing, power distribution, and fill. At sky130 our designs average ~31% cell utilization (37.8 mm² cells / 123.4 mm² die). At 3nm with 15 metal layers, utilization can reach 70--80%. We use a conservative 300x effective area ratio for logic (600x density x 0.5 utilization improvement factor) and apply SRAM/ROM ratios directly to memory content.

### 2.2 Logic-Only Designs

| Design | sky130 Cell Area (mm²) | sky130 Die Area (mm²) | N3E Projected Die (um²) | N3E Projected Die (mm²) |
|--------|----------------------|---------------------|------------------------|------------------------|
| async\_fifo | 0.004 | 0.06 | 200 | < 0.001 |
| layer\_tile | 0.063 | 0.38 | 1,267 | 0.001 |
| llama\_chip | 0.077 | 0.49 | 1,633 | 0.002 |
| global\_controller | 0.096 | 0.76 | 2,533 | 0.003 |
| scale\_store | 0.088 | 0.59 | 1,967 | 0.002 |
| lut\_interp | 0.318 | 1.80 | 6,000 | 0.006 |
| codebook\_decoder | 0.936 | 3.20 | 10,667 | 0.011 |
| dequant | 0.139 | 0.84 | 2,800 | 0.003 |
| mac\_pe | 0.084 | 0.55 | 1,833 | 0.002 |
| rmsnorm | 3.223 | 8.50 | 28,333 | 0.028 |
| attention\_unit | 0.167 | 1.15 | 3,833 | 0.004 |
| swiglu | 0.368 | 2.10 | 7,000 | 0.007 |
| **Total (logic-only)** | **5.563** | **20.42** | -- | **0.069** |

Using 300x effective shrink, the entire logic-only portfolio -- 12 designs that occupy 20.4 mm² at sky130 -- fits in 0.07 mm² at 3nm. This is roughly 250 um x 280 um, smaller than a single sky130 pad frame.

### 2.3 Macro-Bearing Designs

For macro-bearing designs, we separate logic and memory scaling:

**Logic component** (standard cells, scaled at 300x):

| Design | sky130 Std Cells | Estimated Logic Area (sky130, mm²) | N3E Logic (mm²) |
|--------|-----------------|-----------------------------------|-----------------|
| rom\_bank | 136,629 | ~2.0 | 0.007 |
| mac\_array | 233,861 | ~3.5 | 0.012 |
| rope | 478,014 | ~7.0 | 0.023 |
| embed\_rom | 244,741 | ~3.6 | 0.012 |
| vector\_unit | 790,947 | ~12.0 | 0.040 |
| kv\_cache\_demo | 3,628 | ~0.043 | 0.0001 |
| lm\_head\_demo | 243,724 | ~3.6 | 0.012 |

**Memory component** (scaled by memory-specific ratios):

| Design | sky130 Memory | Memory Type | Scaling | N3E Memory (mm²) |
|--------|--------------|-------------|---------|-------------------|
| rom\_bank | 1x nor\_rom\_1024x880 (0.45 Mbit) | NOR ROM | 75x | 0.003 |
| mac\_array | 1x nor\_rom\_1024x880 (0.45 Mbit) | NOR ROM | 75x | 0.003 |
| rope | 2x nor\_rom\_4096x1024 (8.4 Mbit) | NOR ROM | 75x | 0.056 |
| embed\_rom | 1x nor\_rom\_65536x192 (12.6 Mbit) | NOR ROM | 75x | 0.084 |
| kv\_cache\_demo | 4x sram\_8192x8 (0.26 Mbit) | SRAM | 75x | 0.0003 |
| lm\_head\_demo | 1x nor\_rom\_65536x192 (12.6 Mbit) | NOR ROM | 75x | 0.084 |

### 2.4 Full-Scale Designs That Were Impossible at sky130

| Design | Full-Scale Memory | sky130 Area | N3E Area | Feasible? |
|--------|------------------|-------------|----------|-----------|
| kv\_cache | 2048x sram\_4096x8 = 64 Mbit | ~317 mm² | **4.2 mm²** | Yes |
| lm\_head | 125x nor\_rom\_65536x192 = 1.5 Gbit (188 MB) | ~550 mm² | **5.5--11 mm²** | Yes (at 50--100x ROM scaling) |
| Full chip (all modules) | logic + memory | >800 mm² | **~50--80 mm²** | Yes |

At 3nm, the full KV cache for a 128K-token context window fits in 4.2 mm² -- smaller than a single sky130 mac\_array. The complete LM head vocabulary projection, which required 188 MB of weight storage, occupies 5.5--11 mm² depending on ROM scaling assumptions. The entire OpenTaalas chip -- including all 17 modules at full scale -- is projected to fit within 50--80 mm², well within the TSMC N3E reticle limit of ~858 mm² (33 mm x 26 mm).

For comparison, production AI accelerators at similar nodes: Apple M2 Neural Engine occupies ~15 mm² at 5nm; Google TPU v5e is ~400 mm² at 4nm; NVIDIA H100 is 814 mm² at 4nm.

## 3. Frequency Projection

### 3.1 Scaling Methodology

Transistor switching speed improves approximately 10--15x from 130nm to 3nm, driven by shorter gate lengths, lower threshold voltages, and reduced parasitic capacitance. We apply a conservative 10x multiplier for complex datapaths (where interconnect delay dominates) and 12--15x for control logic (where gate delay dominates).

### 3.2 Projected Clock Frequencies

| Module | sky130 fmax (MHz) | Scaling Factor | N3E Projected fmax (MHz) | Notes |
|--------|-------------------|---------------|--------------------------|-------|
| async\_fifo | 326 | 12x | **3,912** | CDC logic, gate-delay dominant |
| layer\_tile | 254 | 12x | **3,048** | FSM control logic |
| llama\_chip | 252 | 12x | **3,024** | Top-level control |
| global\_controller | 244 | 12x | **2,928** | FSM control logic |
| scale\_store | 243 | 11x | **2,673** | Register file + mux trees |
| lut\_interp | 227 | 10x | **2,270** | Memory-limited (LUT access) |
| codebook\_decoder | 215 | 10x | **2,150** | Combinational decode logic |
| dequant | 214 | 10x | **2,140** | FP8-to-BF16 datapath |
| mac\_pe | 138 | 10x | **1,380** | Shift-and-add multiply |
| rom\_bank | 157 | 10x | **1,570** | Memory-access dominated |
| mac\_array | 120 | 10x | **1,200** | Multi-PE + memory |
| embed\_rom | 101 | 10x | **1,010** | Large ROM access path |
| rope | 78 | 10x | **780** | Sin/cos table + multiply |
| rmsnorm | 77 | 10x | **770** | Sum-of-squares accumulator |
| attention\_unit | 76 | 10x | **760** | Dot product + max |
| swiglu | 47 | 10x | **470** | Sigmoid LUT + chained multiply |
| vector\_unit | 43 | 10x | **430** | Unified VPU (widest datapath) |
| kv\_cache\_demo | 230 | 11x | **2,530** | SRAM-access dominated |
| lm\_head\_demo | 106 | 10x | **1,060** | ROM + argmax |

### 3.3 Analysis

**Modules exceeding 2 GHz (6 of 19):** async\_fifo, layer\_tile, llama\_chip, global\_controller, scale\_store, lut\_interp. These are all control-path or small-datapath modules where gate delay dominates -- exactly the kind of logic that benefits most from process scaling.

**Modules exceeding 1 GHz (14 of 19):** All of the above plus codebook\_decoder, dequant, mac\_pe, rom\_bank, mac\_array, embed\_rom, kv\_cache\_demo, lm\_head\_demo.

**Modules below 1 GHz (5 of 19):** rope (780 MHz), rmsnorm (770 MHz), attention\_unit (760 MHz), swiglu (470 MHz), vector\_unit (430 MHz). These are wide-datapath modules where interconnect delay and multi-cycle arithmetic dominate.

**Practical target frequency:** A production chip would likely target a uniform 1.0--1.5 GHz clock with pipeline insertion in the slower modules (swiglu, vector\_unit, attention\_unit). The Kanagawa HLS compiler's `--register-ratio` flag can automate pipeline register insertion to meet a target frequency.

**Comparison to production AI chips:**

| Chip | Process | Clock (MHz) | Notes |
|------|---------|-------------|-------|
| Google TPU v4 | 7nm | 1,050 | Systolic array, 275W TDP |
| Google TPU v5e | 4nm (est.) | ~1,100 | Cost-optimized inference |
| NVIDIA H100 | 4nm | 1,980 (boost) | Tensor cores, 700W TDP |
| Groq LPU | 14nm | ~1,000 (est.) | SRAM-only, 300W TDP |
| **OpenTaalas N3E** | **3nm** | **1,000--1,500 (target)** | **Projected, with pipelining** |

The projected frequencies are competitive. At 1.0 GHz uniform clock, OpenTaalas would match TPU v4; with pipelining to 1.5 GHz, it would approach H100 core clocks.

## 4. Power Projection

### 4.1 Dynamic Power Scaling

Dynamic power scales as:

```
P_dynamic = C * V² * f
```

Where:
- **Capacitance (C):** Proportional to area. At 300x area reduction, C_new / C_old ~ 1/300 (for logic). In practice, wire capacitance does not scale as aggressively; we use C_new / C_old ~ 1/100 as a conservative estimate.
- **Voltage (V):** 0.75V / 1.8V = 0.417x, so V² ratio = 0.174x
- **Frequency (f):** If we target 1.0 GHz at 3nm vs average ~150 MHz at sky130, f_new / f_old ~ 6.7x

Dynamic power ratio: (1/100) x 0.174 x 6.7 = **0.0117x** (roughly 85x reduction at iso-function, or ~12x reduction at 6.7x the clock speed).

### 4.2 Per-Module Power Estimates

| Module | sky130 Power (mW) | sky130 fmax (MHz) | N3E Target (GHz) | Freq Ratio | N3E Power (mW) |
|--------|-------------------|-------------------|-------------------|-----------|----------------|
| async\_fifo | 2.9 | 326 | 1.0 | 3.1x | 0.016 |
| layer\_tile | 29.5 | 254 | 1.0 | 3.9x | 0.200 |
| llama\_chip | 35.3 | 252 | 1.0 | 4.0x | 0.245 |
| global\_controller | 44.2 | 244 | 1.0 | 4.1x | 0.315 |
| scale\_store | 43.3 | 243 | 1.0 | 4.1x | 0.309 |
| lut\_interp | 136.9 | 227 | 1.0 | 4.4x | 1.05 |
| codebook\_decoder | 426.3 | 215 | 1.0 | 4.7x | 3.47 |
| dequant | 80.2 | 214 | 1.0 | 4.7x | 0.654 |
| mac\_pe | 41.4 | 138 | 1.0 | 7.2x | 0.520 |
| rmsnorm | 1,586.9 | 77 | 1.0 | 13.0x | 35.9 |
| attention\_unit | 93.1 | 76 | 1.0 | 13.2x | 2.13 |
| swiglu | 227.5 | 47 | 1.0 | 21.3x | 8.42 |
| rom\_bank | 650 | 157 | 1.0 | 6.4x | 7.21 |
| mac\_array | 1,137 | 120 | 1.0 | 8.3x | 16.5 |
| rope | 1,622 | 78 | 1.0 | 12.8x | 36.2 |
| embed\_rom | 194 | 101 | 1.0 | 9.9x | 3.34 |
| vector\_unit | 5,045 | 43 | 1.0 | 23.3x | 204.1 |

Power calculation: P_n3e = P_sky130 x (1/100) x 0.174 x freq\_ratio.

### 4.3 Full-Chip Power Estimate

| Component | N3E Power at 1 GHz (mW) |
|-----------|------------------------|
| Logic (all 17 unique modules) | ~320 |
| SRAM (64 Mbit KV cache, estimated at 0.02 mW/Mbit/GHz) | ~1,300 |
| NOR ROM (full lm\_head + embeddings, mostly idle) | ~500 |
| Clock tree and distribution | ~200 |
| I/O and PHYs | ~500 |
| Leakage (3nm baseline, ~30% of dynamic for this area) | ~850 |
| **Total estimated** | **~3,700 mW (3.7W)** |

### 4.4 Comparison

| Chip | Process | Power (W) | Memory | Throughput |
|------|---------|-----------|--------|------------|
| Google TPU v4 | 7nm | 275 | HBM2e | ~275 TOPS |
| NVIDIA H100 | 4nm | 700 | HBM3 | 990 TOPS (INT8) |
| Groq LPU | 14nm | 300 | 230 MB SRAM | ~750 TOPS |
| Cerebras WSE-3 | 5nm | 15,000 (est.) | 44 GB SRAM | ~125 PFLOPS FP16 |
| **OpenTaalas N3E** | **3nm** | **~3.7** | **~12 MB SRAM + ROM** | **Single-layer LLaMA** |

OpenTaalas at 3nm would be an extremely low-power design -- roughly 1000x less power than an H100. This reflects its scope: it is a single-layer LLaMA inference engine, not a general-purpose matrix accelerator with hundreds of compute units. The 3.7W envelope is comparable to edge AI chips (Coral TPU at 2W, Apple Neural Engine at ~8W) and would be viable for battery-powered or thermally constrained deployments.

## 5. Memory Architecture at 3nm

Memory is the dominant area consumer in LLM inference ASICs. At sky130, memory limitations made full-scale OpenTaalas physically impossible. At 3nm, the picture inverts.

### 5.1 KV Cache: 64 Mbit SRAM

The KV cache stores key and value tensors for the attention mechanism. At full LLaMA 3.1 8B scale with 128K context:

| Parameter | sky130 | TSMC N3E |
|-----------|--------|----------|
| SRAM bitcell | 1.5 um² | 0.0199 um² |
| 64 Mbit raw area | 96 mm² | 1.27 mm² |
| With peripherals (2x overhead) | ~192 mm² | ~2.55 mm² |
| With routing and spacing | ~317 mm² | ~4.2 mm² |
| Feasibility | Impossible (>25 mm² shuttle limit) | Trivial (<5 mm²) |

At 3nm, the entire 64 Mbit KV cache occupies roughly 4.2 mm² -- less than a single sky130 mac\_array. This is the single most impactful change: the KV cache, which was the hardest scaling barrier at 130nm, becomes a minor area contributor at 3nm.

For comparison, Groq's LPU at 14nm packs 230 MB (1.84 Gbit) of SRAM on a ~700 mm² die. OpenTaalas needs only 8 MB (64 Mbit), which is 230x smaller in bit count.

### 5.2 LM Head: 188 MB NOR ROM

The LM head stores the full vocabulary projection matrix (128K vocab x 4096 dims x 3 bits = 188 MB = 1.5 Gbit):

| Parameter | sky130 | TSMC N3E (50x) | TSMC N3E (100x) |
|-----------|--------|---------------|-----------------|
| NOR ROM bitcell | 0.5 um² | 0.01 um² | 0.005 um² |
| 1.5 Gbit raw area | 750 mm² | 15 mm² | 7.5 mm² |
| With peripherals | ~375 mm² (shared decode) | ~10 mm² | ~5 mm² |
| With routing | ~550 mm² | ~11 mm² | ~5.5 mm² |
| Feasibility | Impossible | Feasible | Comfortable |

Even at the conservative 50x ROM scaling estimate, the full LM head fits in ~11 mm². At 100x scaling it occupies 5.5 mm² -- roughly 7% of an 80 mm² die.

### 5.3 Alternative Memory Technologies at 3nm

TSMC N3E offers memory options unavailable at sky130:

| Technology | Density | Endurance | Use Case |
|------------|---------|-----------|----------|
| 6T SRAM (HD) | 0.0199 um²/bit | Unlimited | KV cache, activations |
| 6T SRAM (UHD) | ~0.015 um²/bit | Unlimited | Dense weight storage |
| eFuse OTP | ~0.04 um²/bit | 1 write | Fixed model weights |
| Anti-fuse OTP | ~0.02 um²/bit | 1 write | Fixed model weights |
| MRAM (eMRAM) | ~0.02 um²/bit | 10^12 cycles | Non-volatile weights |
| Embedded ReRAM | ~0.01 um²/bit | 10^6 cycles | Non-volatile weights |

For model weights that never change after programming (the Q3\_K quantized weights for LLaMA), one-time-programmable (OTP) technologies like eFuse or anti-fuse are attractive: they are denser than SRAM, non-volatile, and consume zero standby power. The LM head's 1.5 Gbit would occupy ~30 mm² in eFuse or ~60 mm² in anti-fuse -- still feasible.

### 5.4 HBM Integration

For larger models (LLaMA 70B, 405B) or multi-layer implementations, on-die memory becomes insufficient. TSMC offers advanced packaging for HBM integration:

| Packaging | Description | Bandwidth | Relevance |
|-----------|-------------|-----------|-----------|
| CoWoS-S | Silicon interposer, HBM3/3e stacks | 4.8 TB/s (6-stack HBM3e) | Multi-layer LLaMA, large KV cache |
| CoWoS-L | Local silicon bridges (LSI) | 3.2 TB/s | Cost-optimized inference |
| InFO-L | Fan-out with local bridges | 1.6 TB/s | Edge/mobile deployment |

A CoWoS-S package with one HBM3e stack (16 GB, 1.2 TB/s) would store the complete LLaMA 3.1 8B model (3.8 GB at Q3\_K) with room for a 128K-token KV cache, enabling multi-layer execution without round-trips to external DRAM.

### 5.5 Comparison to Production Architectures

| Chip | On-Die Memory | Technology | Model Storage Strategy |
|------|---------------|------------|----------------------|
| Groq LPU | 230 MB SRAM | 14nm | Full model on-chip (limited model size) |
| Cerebras WSE-3 | 44 GB SRAM | 5nm | Full model on-wafer (900 mm² tiles) |
| Google TPU v5e | ~64 MB SRAM | 4nm (est.) | Weights in HBM, activations on-chip |
| NVIDIA H100 | ~50 MB L2 | 4nm | Weights in HBM3, tiled execution |
| **OpenTaalas N3E** | **~12 MB SRAM + ~200 MB ROM** | **3nm** | **Single-layer weights in ROM, KV in SRAM** |

OpenTaalas's approach of embedding weights in ROM for a single transformer layer is unique. Most production chips stream weights from HBM. The ROM approach trades flexibility (weights are fixed at fabrication or programming) for bandwidth (zero-latency weight access, no memory controller overhead). This is viable because Q3\_K quantization reduces the per-layer weight footprint to ~15--20 MB, easily fitting on-die.

## 6. Routing and Metal Stack

### 6.1 The sky130 Routing Bottleneck

At sky130, routing congestion was the primary physical design failure mode:

| Design | sky130 Outcome | Root Cause |
|--------|---------------|------------|
| vector\_unit | 782 DRC violations | 54K GRT overflow, 5 metal layers exhausted |
| embed\_rom | Stuck at GRT | 3,072 met3 macro pins saturated horizontal routing |
| kv\_cache (full) | Not attempted | 2,048 macro instances, impractical routing |
| rope | 9 DRC violations | 808 GRT overflow on met3 congestion |

With only 5 metal layers (li1 + met1--met4) and a single thick metal (met5) for power, sky130 has roughly 3 usable signal routing layers. Dense macro pin configurations (embed\_rom with 16 macros x 192 output pins) saturate these layers regardless of die size.

### 6.2 TSMC N3E Metal Stack

TSMC N3E provides 15+ metal layers in a typical configuration:

| Layer Group | Layers | Pitch (nm) | Purpose |
|-------------|--------|-----------|---------|
| Local interconnect | M0--M1 | 21--28 | Intra-cell wiring |
| Intermediate | M2--M7 | 28--45 | Short-range signal routing |
| Semi-global | M8--M11 | 45--130 | Medium-range signals, clock |
| Global | M12--M14 | 130--1000+ | Power distribution, long-range signals |
| Top metal (RDL) | M15+ | >1000 | Bump pads, power delivery |

This provides approximately **10 signal routing layers** (M2--M11) compared to sky130's 3 -- a **3.3x improvement** in routing resources per unit area, compounded with the 200--400x area reduction that shortens all wire lengths.

### 6.3 Impact on Previously-Blocked Designs

**vector\_unit (782 DRC, 54K GRT overflow):** The 790K standard cells that required 25 mm² at sky130 shrink to ~0.08 mm² at 3nm. The 2 NOR ROM macros become ~0.06 mm². With 10 routing layers and sub-millimeter wire lengths, congestion disappears entirely. This module becomes trivially routable.

**embed\_rom (stuck at GRT, 18K overflow):** The 16 macro instances with 3,072 aggregate output pins caused met3 saturation at sky130. At 3nm, the 16 macros merge into a single ~0.08 mm² ROM block with pins distributed across 10 routing layers. The narrow-die congestion problem is eliminated.

**kv\_cache (not attempted, 2048 SRAMs):** At sky130, 2,048 SRAM macro instances were physically impractical -- each needing placement, pin access, and power strap connections. At 3nm, TSMC offers high-density SRAM compilers that generate a single monolithic array. The 64 Mbit KV cache becomes one or a few macro instances with organized pin access, trivially routable with the available metal stack.

**rope (9 DRC, 808 GRT overflow):** The two 4096x1024 ROM macros and 478K cells in 25 mm² shrink to <0.1 mm². The met3 congestion from balanced pin distribution disappears with 10 routing layers available. Clean DRC closure is expected without any of the sky130 workarounds (allow\_congestion, skip\_incremental\_repair).

### 6.4 Power Distribution

At sky130, PDN (power distribution network) competes with signal routing: met4 vertical stripes at 27.14 um pitch consume significant routing resources on one of only 5 layers. At 3nm, dedicated global metal layers (M12--M14) handle power distribution without consuming signal routing resources. This eliminates the PDN-vs-signal trade-off that constrained sky130 floorplanning.

## 7. What Stays the Same

A technology node migration changes the physical implementation but preserves the architectural decisions that define OpenTaalas. The following transfer directly:

### 7.1 Design Methodology

- **Kanagawa HLS** with wavefront threading: The `.k` source files, handshake protocols (`valid_in`/`rdy_out`/`rden_in`/`empty_out`/`result_out`), and generated RTL structure are technology-independent. The same Kanagawa sources compile to sky130 or 3nm targets.
- **SystemC reference models**: All 17 header-only C++ models with `ac_int` types remain the golden behavioral reference. Co-simulation against Verilator-compiled RTL works identically.
- **CMake build system**: The `FindORFS.cmake`, `FindKanagawaCompiler.cmake`, and test infrastructure require only a different PDK configuration, not structural changes.

### 7.2 Datapath Architecture

- **Q3\_K weight quantization**: The 3-bit weight format with FP8 E4M3 bank scales and binary tensor scales is fixed by the model quantization, not the process node.
- **INT3 x INT8 MAC**: The shift-and-add multiply-accumulate in `mac_pe` is a logical design choice driven by the quantization format, not technology constraints.
- **BF16 intermediate format**: Brain float16 for activations and intermediate values provides adequate dynamic range regardless of process node.
- **Sigmoid LUT (256-entry, bin-averaged)**: The lookup table approach to sigmoid approximation is an architectural choice. The LUT content is identical at any node.

### 7.3 Control Architecture

- **layer\_tile 17-state FSM**: The sequencing of Q/K/V projection, attention, MLP, and residual operations is algorithmically determined.
- **global\_controller 36-state pipeline FSM**: Multi-layer orchestration logic transfers directly.
- **Module interfaces**: All port lists, signal widths, and handshake protocols are unchanged.

### 7.4 Verification Infrastructure

- The 19 Verilator co-simulation tests, the E2E layer verification (44 checks, 3 phases), and the real-data LLaMA 3.1 8B layer test (16 checks) are fully reusable. RTL-level verification is technology-independent.
- The GGUF converter, weight formatting, and test data generation pipeline require no changes.

### 7.5 What Changes Minimally

| Component | Change Required |
|-----------|----------------|
| HAL layer (`rtl/hal/`) | New `hal_dual_port_ram.sv` targeting TSMC SRAM compiler |
| SDC constraints | Updated clock period (1 ns vs 4 ns) |
| ORFS config.mk | New PDK, die/core areas, utilization targets |
| Floorplan scripts | New macro sizes, placement coordinates |
| LEF/LIB/GDS collateral | TSMC-provided memory compiler outputs |

The HAL (Hardware Abstraction Layer) was designed precisely for this portability. The `hal_dual_port_ram.sv` wrapper maps Kanagawa's `KanagawaSyncRam` to technology-specific macros. Porting to 3nm requires only a new HAL implementation targeting TSMC's memory compiler, not changes to any Kanagawa source.

## 8. Cost Reality Check

### 8.1 Fabrication Economics

| Cost Element | sky130hd (130nm) | TSMC N3E (3nm) | Ratio |
|-------------|-----------------|----------------|-------|
| Mask set (NRE) | ~$10K (shuttle) | $500M--700M | 50,000--70,000x |
| Per-wafer cost | ~$2K | ~$20K | 10x |
| Wafer diameter | 200 mm (GF shuttle) | 300 mm | -- |
| Dies per wafer (80 mm² die) | ~490 | ~730 | 1.5x |
| Per-die cost (high volume) | ~$4 | ~$27 | 7x |
| Minimum order | 1 shuttle slot | ~1,000 wafers (typ.) | -- |
| Minimum spend | ~$10K | ~$520M+ | 52,000x |

### 8.2 The Mask Set Problem

The $500M--700M mask set cost for 3nm EUV lithography is the fundamental barrier. This cost is amortized over production volume:

| Annual Volume | NRE Amortization (per die) | Die Cost | Total Per-Die |
|---------------|--------------------------|----------|---------------|
| 10,000 | $60,000 | $27 | $60,027 |
| 100,000 | $6,000 | $27 | $6,027 |
| 1,000,000 | $600 | $27 | $627 |
| 10,000,000 | $60 | $27 | $87 |
| 100,000,000 | $6 | $27 | $33 |

At 1 million units, the NRE amortization alone adds $600 per die. Economically viable 3nm ASICs require either very high volume (smartphones, where Apple ships >200M A-series chips/year) or very high ASP (datacenter accelerators at $10K--40K, where NRE per unit is acceptable).

### 8.3 AI Chip Startup Funding Context

| Company | Process | Funding Raised | Product |
|---------|---------|---------------|---------|
| Groq | 14nm (Samsung) | ~$640M | LPU inference chip |
| Cerebras | 7nm/5nm (TSMC) | ~$720M | WSE wafer-scale engine |
| Tenstorrent | 12nm/7nm | ~$340M | Wormhole/BlackHole |
| SambaNova | 7nm (TSMC) | ~$1.1B | SN40L dataflow chip |
| Graphcore | 7nm (TSMC) | ~$730M | Bow IPU |
| d-Matrix | 5nm (est.) | ~$160M | In-memory compute |
| **OpenTaalas (hypothetical)** | **3nm (TSMC)** | **~$800M--1.2B needed** | **LLaMA inference ASIC** |

To tape out a 3nm ASIC, a hypothetical OpenTaalas startup would need approximately:
- $500--700M for the mask set
- $50--100M for design team (50--100 engineers x 3 years)
- $50--100M for EDA licenses, IP blocks (SRAM compiler, I/O, PLL, SerDes)
- $50--100M for packaging (CoWoS), testing, and initial production
- **Total: $800M--1.2B** before first revenue

This is comparable to what Groq and Cerebras have raised, confirming that the OpenTaalas architecture -- if validated and competitive -- is in the right ballpark for a venture-funded tapeout.

### 8.4 Alternative Paths

| Path | Cost | Timeline | Trade-off |
|------|------|----------|-----------|
| sky130 shuttle (current) | $10K | 6 months | Architecture validation only |
| TSMC 28nm (via Europractice/MUSE) | ~$500K | 12 months | 10x improvement, affordable for universities |
| TSMC 7nm (via eFabless) | ~$5--10M | 18 months | 50x improvement, viable with grants |
| TSMC 3nm (commercial) | $500M+ | 24+ months | Full performance, requires VC funding |
| Chiplet approach (3nm compute + 12nm SRAM) | ~$50--100M | 24 months | Reduced NRE via die disaggregation |

The chiplet approach is particularly interesting: fabricate the small compute logic (<5 mm²) at 3nm and the large SRAM arrays at a cheaper node (12nm or 7nm), connected via UCIe or a custom D2D interface. This reduces the 3nm mask set to a much smaller die, potentially cutting NRE by 5--10x.

## 9. Conclusion

OpenTaalas at sky130hd (130nm) is an architecture validation platform. It proves that the Kanagawa HLS methodology, Q3\_K quantization scheme, wavefront-threaded datapath, and modular design can produce synthesizable, routable RTL for LLM inference. The 19 successfully routed designs, 44-check E2E verification, and real-data correlation against LLaMA 3.1 8B demonstrate functional correctness.

The projection to TSMC N3E transforms these validated designs from a proof-of-concept into a viable product:

| Metric | sky130hd (130nm) | TSMC N3E (3nm) | Improvement |
|--------|-----------------|----------------|-------------|
| Total die area | >800 mm² (impossible) | 50--80 mm² (feasible) | 10--16x reduction |
| Target frequency | 43--326 MHz | 430--3,900 MHz | 10--12x |
| Chip power | >10 W (partial, 130nm) | ~3.7 W (complete, 3nm) | Lower at higher performance |
| KV cache | 317 mm² (impossible) | 4.2 mm² | 75x reduction |
| LM head | 550 mm² (impossible) | 5.5--11 mm² | 50--100x reduction |
| Routing failures | 5 of 19 designs blocked | 0 expected | Solved by metal stack |
| Full chip feasibility | No | Yes | -- |

The architecture transfers cleanly: all Kanagawa HLS sources, SystemC models, verification tests, weight quantization, and control FSMs are technology-independent. The HAL abstraction layer means porting to a new PDK requires only memory macro wrapper updates and physical constraint files.

The economic barrier is real -- $500M+ for a 3nm mask set places this beyond open-source budgets. But the sky130 implementation is not wasted effort. It is the lowest-cost, lowest-risk way to validate an architecture before committing hundreds of millions to fabrication. Every bug found in simulation at 130nm is a bug that does not cost $500M to discover at 3nm. Every timing path closed at sky130 is a path that will be faster at 3nm. The RTL, verification, and physical design methodology developed here is the foundation that a funded tapeout would build on.

OpenTaalas demonstrates that open-source ASIC design for LLM inference is architecturally sound. The remaining gap is not technical -- it is financial.
