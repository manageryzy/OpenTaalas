# 53B Transistor Budget — Distributed Mask ROM + Digital MAC Array

Device-level transistor accounting for a fixed-weight LLM inference ASIC.

## Fixed Parameters

| Item | Value |
|------|-------|
| Weight bits | 24.0 Gbit |
| Quantization metadata bits (group scale etc.) | 4.0 Gbit |
| Total fixed bits | 28.0 Gbit |

## ROM Structure

Contact-programmed NOR ROM. Every bit position has one nMOS; contact presence encodes 0/1. Transistor count is stable and directly equals bit count.

### Bank Geometry

| Parameter | Value |
|-----------|-------|
| Rows per bank | 4096 |
| Columns per bank | 8192 |
| Capacity per bank | 33,554,432 bit (~32 Mbit) |
| Bank count | 835 |

Bank count = ceil(28.0 Gbit / 33.55 Mbit).

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

28.0 Gbit x 1 = **28.000B**

### 2. Column Periphery

Single-ended bitline readout: precharge, weak keeper, bitline isolation, sense amp + latch.

| Per-column device | Transistors |
|-------------------|-------------|
| Bitline precharge pMOS | 1 |
| Bitline weak keeper pMOS | 1 |
| Bitline isolation nMOS | 1 |
| Sense amp + latch | 16 |
| Per-column total | 19 |

Total columns = 835 x 8192 = 6,840,320.

| Device | Count | Transistors |
|--------|-------|-------------|
| Precharge pMOS | 6,840,320 | 6.840M |
| Weak keeper pMOS | 6,840,320 | 6.840M |
| Isolation nMOS | 6,840,320 | 6.840M |
| Sense amp + latch | 6,840,320 | 109.445M |
| Column periphery total | | **129.966M (~0.130B)** |

### 3. Row Periphery

Hierarchical predecode + final 4-input NAND + wordline buffer.

| Per-row device | Transistors |
|----------------|-------------|
| Final 4-input NAND | 8 |
| Final inverter | 2 |
| Wordline buffer (2-stage INV) | 4 |
| Per-row total | 14 |

Total rows = 835 x 4096 = 3,420,160.

| Device | Count | Transistors |
|--------|-------|-------------|
| 4-input NAND | 3,420,160 | 27.361M |
| Inverter | 3,420,160 | 6.840M |
| Wordline buffer INV | 3,420,160 | 13.681M |
| Row periphery total | | **47.882M (~0.048B)** |

### 4. Predecode

12-bit row address, 4 groups of 3-bit predecode (each 3->8), 32 predecode lines.

| Per-bank component | Count | Transistors |
|--------------------|-------|-------------|
| 3-input NAND | 32 | 192 |
| Predecode output INV | 32 | 64 |
| Row address INV | 12 | 24 |
| Predecode line buffer (2-stage INV) | 32 | 128 |
| Per-bank predecode total | | 408 |

835 banks total: ~0.00034B (negligible).

### 5. Bank-Level Control & Repair/Test

| Per-bank sub-module | Composition | Transistors |
|---------------------|-------------|-------------|
| Timing & state machine registers | 512 DFF | 12,288 |
| Timing gating latches | 256 latches | 3,072 |
| Combinational control logic | ~2000 NAND2-equivalent + INV | ~12,000 |
| Redundancy mapping & compare | XOR + MUX equivalent | ~2,000 |
| Scan & minimal test interface | Gate-level equivalent | ~700 |
| Per-bank control total | | 30,000 |

835 banks total: 25.05M (~0.025B).

### ROM Total

| Item | Transistors |
|------|-------------|
| Bitcells | 28.000B |
| Column periphery | 0.130B |
| Row periphery | 0.048B |
| Predecode | 0.000B |
| Bank-level control & repair/test | 0.025B |
| **ROM total** | **28.221B** |

## Digital MAC Array

3-bit weights read from ROM, multiplied with 8-bit activations. Bit-gated partial products + CSA + CPA. Two's complement sign flip via XOR. 32-bit accumulator with DFF register.

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

1,800,000 processing elements.

1.8M x 4,222 = **7.5996B**

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

## On-Chip SRAM

192 MB, 6T SRAM. Used for activation block cache, local intermediates, and small KV cache fragments. 20% overhead factor for periphery (decode, sense amps, write drivers, precharge, minimal repair/test).

| Item | Formula | Value |
|------|---------|-------|
| SRAM bits | 192 MB x 8 | 1.6106 Gbit |
| Bitcell transistors | 1.6106 Gbit x 6 | 9.6637B |
| With periphery | 9.6637B x 1.2 | **11.5964B** |

## 53B Budget Closure

| Module | Transistors |
|--------|-------------|
| Distributed mask ROM | 28.221B |
| On-chip SRAM (192 MB with periphery) | 11.596B |
| Digital MAC array (1.8M PEs) | 7.600B |
| Remainder (interconnect, global control, I/O) | 5.583B |
| **Total** | **53.000B** |
