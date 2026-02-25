# LLaMA 3.1 8B — 55B Transistor Budget

Device-level transistor accounting for a fixed-weight LLM inference ASIC targeting LLaMA 3.1 8B with 3-bit NOR ROM weights.

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
