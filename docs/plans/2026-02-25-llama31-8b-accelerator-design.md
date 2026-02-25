# LLaMA 3.1 8B — 3-bit Fixed-Weight Inference ASIC Design

Decode-only accelerator for LLaMA 3.1 8B with all weights frozen in on-chip NOR ROM.
Implemented in Kanagawa HLS targeting the OpenTaalas ASIC platform.

## Model Target

| Parameter | Value |
|-----------|-------|
| Model | LLaMA 3.1 8B |
| Hidden size | 4096 |
| Layers | 32 |
| Attention heads (Q) | 32 |
| KV heads (GQA) | 8 |
| Head dimension | 128 |
| Intermediate size (MLP) | 14336 |
| Vocabulary | 128256 |
| RoPE theta | 500000.0 |
| RMSNorm eps | 1e-5 |
| Activation | SwiGLU (SiLU gating) |
| Total parameters | ~8.03B |

## Design Decisions

| Decision | Choice |
|----------|--------|
| HDL | Kanagawa |
| Weight precision | INT3 (3-bit NOR ROM, FP8 per-bank scale, FP32 per-tensor scale) |
| Inference mode | Decode-only (autoregressive, GEMV) |
| Context window | 4K tokens |
| Activation precision | INT8 (MAC input), BF16 (vector ops), FP32 (softmax internal) |
| Architecture | Layer-tile (32 identical hardened macros) |
| Compute | Dual INT3×INT8 weight MACs + dedicated INT8×INT8 attention unit + BF16/FP32 VPU |
| Nonlinear functions | LUT + linear interpolation (sigmoid, exp, rsqrt) |
| KV cache | On-chip 6T SRAM, 8 MB/layer, distributed |
| Transistor budget | ~55B |

## Top-Level Architecture

```
Token In → [Embed ROM] → [Layer 0] → [Layer 1] → ... → [Layer 31] → [LM Head] → Token Out
```

32 identical layer tiles chained sequentially. Activations flow layer-to-layer in BF16.
Embed ROM and LM Head ROM are separate global macros accessed once per token.

### Layer Pipeline

While MLP MAC processes layer N's gate/up/down projections, Attention MAC starts
layer N+1's Q/K/V/O projections concurrently. The dedicated attention unit runs
in parallel with MLP within each layer.

```
Layer N:   [RMSNorm]→[Attn MAC: Q/K/V/O]→[RoPE]→[Attn Unit: QK·soft·V]→[O proj]→[+res]→[RMSNorm]→[MLP MAC: gate/up/down]→[SiLU·mul]→[+res]
Layer N+1:                                         [Attn MAC: Q/K/V/O]→──────────────────────────────→[RoPE]→[Attn Unit]→...
```

## Per-Layer Tile (~1.7B transistors each)

```
┌──────────────────────────────────────────────────┐
│                 Layer Tile (×32)                  │
├───────────────┬──────────────────────────────────┤
│  ROM Banks    │  Compute                         │
│  (~21 banks)  │  ┌──────────────┐                │
│  ~694 Mbit    │  │ Attn Weight  │ INT3×INT8      │
│  3-bit aligned│  │ MAC          │→┐              │
│               │  │ (~4 banks)   │ │              │
│  Attn weights │  └──────────────┘ │  ┌─────────┐│
│  ~126 Mbit    │  ┌──────────────┐ │  │  VPU    ││
│               │  │ Attn Unit    │←┘  │BF16/FP32││
│  MLP weights  │  │ INT8×INT8    │    │RMSNorm  ││
│  ~528 Mbit    │  │ QK·soft·V   │    │SiLU     ││
│               │  └──────────────┘    │Dequant  ││
│  Scales       │  ┌──────────────┐    │RoPE     ││
│  FP8 + FP32   │  │ MLP Weight   │    └─────────┘│
│               │  │ MAC          │ INT3×INT8      │
│               │  │ (~17 banks)  │                │
│               │  └──────────────┘                │
├───────────────┴─────────────┬────────────────────┤
│  SRAM (~8 MB)               │ Layer Controller    │
│  K cache: 4 MB              │ FSM + pipeline ctrl │
│  V cache: 4 MB              │                    │
│  Activation buffers: 144 KB │                    │
└─────────────────────────────┴────────────────────┘
```

## Weight MAC Datapath

Both Attention MAC and MLP MAC share the same PE design. Differ only in size.

### Single PE (INT3×INT8)

```
ROM (3-bit weight) → sign-extend INT4 → ×  → INT partial sum (accumulate)
Activation (INT8)  ────────────────────→ ×
```

### Dequantization Chain

```
INT accumulator → × FP8 bank scale → × FP32 tensor scale → BF16 output
```

### MAC Sizing Per Layer

| MAC | Matrices | Total MACs per token |
|-----|----------|---------------------|
| Attention MAC | Q(4096×4096) + K(4096×1024) + V(4096×1024) + O(4096×4096) | ~41.9M |
| MLP MAC | gate(4096×14336) + up(4096×14336) + down(14336×4096) | ~176.2M |

Exact PE counts and cycle budgets to be determined by Kanagawa scheduling.

## Attention Unit

Dedicated per-layer unit for KV cache operations. INT8×INT8 datapath.

### Operations

1. Receive Q, K, V vectors from Attention MAC (after dequant + RoPE for Q, K)
2. Append new K, V to this layer's KV cache in SRAM
3. QK dot products: Q (INT8, 8 groups × 4 heads × 128 dim) · K cache (INT8) → FP32 scores
4. Causal mask: implicit via cache valid-entry counter (read only positions 0..count-1)
5. Softmax: FP32 internal (subtract max, exp via LUT+interp, normalize)
6. V aggregation: FP32 probs × V cache (INT8) → BF16 output
7. Output → O projection via Attention MAC → residual add

### GQA Mapping

- 8 KV heads, 32 Q heads → 4 Q heads share 1 KV head
- Attention unit processes 8 groups, each group computes 4 Q-head dot products against 1 K-head

### Causal Mask

Decode-only: KV cache only contains valid entries up to current position.
A `write_ptr` counter per layer tracks the number of valid entries.
Attention reads entries `0..write_ptr-1` — mask is implicit in cache occupancy.

## Vector Processing Unit (VPU)

Per-layer BF16/FP32 unit for all non-GEMV operations.

### Operations

| Operation | Precision | When |
|-----------|-----------|------|
| RMSNorm | BF16 in, reduction in FP32, rsqrt via LUT+interp | ×2 per layer (pre-attn, pre-MLP) |
| RoPE | BF16 sin/cos LUT, BF16 rotation | After Q and K dequant |
| Dequantization | INT32 × FP8 × FP32 → BF16 | After each MAC accumulation |
| SiLU + element-wise mul | BF16, sigmoid via LUT+interp | SwiGLU activation in MLP |
| Residual addition | BF16 + BF16 → BF16 | ×2 per layer |
| Requantization | BF16 → INT8 (dynamic scale) | Before MAC and attention unit inputs |

### RoPE Implementation

- 64 frequency pairs per head dimension (128 / 2)
- Precomputed sin/cos LUT: 64 pairs × 4K positions × FP16
- ~1 MB total, stored in small ROM or SRAM (shared or per-tile)
- Applied to Q and K only, not V

### Per-Layer Dataflow

```
x (BF16)
  → RMSNorm → INT8
  → Attn MAC (Q) → dequant → BF16 → RoPE → INT8 → Q
  → Attn MAC (K) → dequant → BF16 → RoPE → INT8 → K (append to cache)
  → Attn MAC (V) → dequant → BF16 → INT8 → V (append to cache)
  → Attention Unit (QK · softmax · V) → BF16
  → Attn MAC (O) → dequant → BF16
  → + residual → BF16
  → RMSNorm → INT8
  → MLP MAC (gate) → dequant → BF16 ─┐
  → MLP MAC (up)   → dequant → BF16 ─┤ SiLU · mul → INT8
  → MLP MAC (down) → dequant → BF16
  → + residual → BF16 → next layer
```

## ROM Organization

Contact-programmed NOR ROM. 3-bit aligned banks (not byte-aligned).

### Bank Geometry

| Parameter | Value |
|-----------|-------|
| Rows per bank | 4096 |
| Columns per bank | 8192 |
| Capacity per bank | 32 Mbit |
| Bitcell | 1 nMOS transistor |

### Per-Layer Weight Breakdown

| Matrix | Dimensions | 3-bit Bits |
|--------|-----------|-----------|
| Q proj | 4096 × 4096 | 50.33 Mbit |
| K proj | 4096 × 1024 | 12.58 Mbit |
| V proj | 4096 × 1024 | 12.58 Mbit |
| O proj | 4096 × 4096 | 50.33 Mbit |
| gate proj | 4096 × 14336 | 176.16 Mbit |
| up proj | 4096 × 14336 | 176.16 Mbit |
| down proj | 14336 × 4096 | 176.16 Mbit |
| **Layer total** | | **654.3 Mbit (~21 banks)** |

### Global ROM

| Component | Elements | Bits | Banks |
|-----------|---------|------|-------|
| 32 layers | 6.98B | 20.9 Gbit | 672 |
| embed_tokens | 525.3M | 1,576 Mbit | ~50 |
| lm_head | 525.3M | 1,576 Mbit | ~50 |
| Scales (FP8+FP32) | — | ~300 Mbit | ~10 |
| RMSNorm gamma (65×4096, BF16) | 0.27M | 4.3 Mbit | <1 |
| **Total** | | **~24.35 Gbit** | **~781** |

### ROM Read Interface

- One wordline active per cycle → reads 8192 × 3 = 24,576 bits per bank
- Attention ROM banks and MLP ROM banks have independent read ports
- ROM rows organized so one wordline read feeds a full PE column

## SRAM Organization

Distributed 6T SRAM across layer tiles plus global buffers.

### Per-Layer SRAM (×32)

| Buffer | Size |
|--------|------|
| K cache (4K tokens × 8 heads × 128 dim × INT8) | 4 MB |
| V cache (same) | 4 MB |
| Activation input buffer (4096 × BF16) | 16 KB |
| Activation output buffer (4096 × BF16) | 16 KB |
| MLP intermediate buffer (14336 × 2 × BF16 + 14336 × INT8) | ~112 KB |
| **Per-layer total** | **~8.14 MB** |

### Global SRAM

| Buffer | Size |
|--------|------|
| Embedding output buffer | 8 KB |
| LM head logits accumulator (128256 × FP32) | 512 KB |
| **Global total** | **~0.5 MB** |

### Total SRAM: ~261 MB

### KV Cache Management

- Write pointer per layer, incremented each token
- Circular buffer for context overflow (overwrite oldest when > 4K)
- Read: sequential scan from 0 to write_ptr for attention dot products

## Transistor Budget (~55B)

| Module | Transistors |
|--------|-------------|
| ROM (weights + scales, 781 banks) | 24.54B |
| MAC arrays (Attn + MLP, ~1.8M PEs total) | 7.60B |
| Attention units (32×, INT8×INT8) | 1.10B |
| VPU (32×, BF16/FP32) | 0.80B |
| SRAM (261 MB, 6T + 20% periphery) | 15.77B |
| Remainder (interconnect, global ctrl, I/O, clocking) | 5.19B |
| **Total** | **~55.0B** |

### ROM Breakdown

| Item | Transistors |
|------|-------------|
| Bitcells (24.35 Gbit × 1) | 24.35B |
| Column periphery (19/col × 781 banks × 8192 cols) | 0.12B |
| Row periphery (14/row × 781 banks × 4096 rows) | 0.045B |
| Bank control (30K/bank × 781) | 0.023B |
| **ROM total** | **24.54B** |

### SRAM Breakdown

| Item | Transistors |
|------|-------------|
| Bitcells (261 MB × 8 × 6) | 12.56B |
| 20% periphery overhead | 2.51B |
| **SRAM total** | **15.77B** (note: includes rounding from per-layer allocation) |

## I/O and Global Control

### External Interface

- Token input: 16-bit token ID via serial/parallel interface
- Token output: 16-bit token ID (argmax of logits)
- Control signals: start, reset, context clear, position reset
- No external memory interface (fully self-contained)

### Global Controller

- Token-level FSM: `IDLE → EMBED → LAYER[0..31] → LM_HEAD → OUTPUT`
- Pipeline management: overlaps adjacent layer computation
- Embed lookup at start, LM head GEMV + argmax at end

### Clock and Power

- Single clock domain (Kanagawa generates synchronous RTL)
- Per-tile clock gating for idle tiles during pipeline fill/drain
- Target frequency: determined by Kanagawa scheduling + ORFS timing closure

## Kanagawa Module Hierarchy

```
module llama31 {

  class LlamaChip {
    EmbedRom embed;
    LayerTile[32] layers;
    LmHeadRom lm_head;
    GlobalController ctrl;

    decode(uint<16> token_id) → uint<16>;
  }

  class LayerTile {
    AttnWeightMac attn_mac;
    MlpWeightMac mlp_mac;
    AttentionUnit attn_unit;
    VectorUnit vpu;
    KvCache kv_cache;
    LayerController ctrl;

    forward(bf16[4096] x) → bf16[4096];
  }

  class AttnWeightMac {
    RomBank[4] rom;
    ScaleStore scales;

    gemv(int8[4096] activation, uint<3> matrix_id) → int32[N];
  }

  class MlpWeightMac {
    RomBank[17] rom;
    ScaleStore scales;

    gemv(int8[N] activation, uint<2> matrix_id) → int32[N];
  }

  class AttentionUnit {
    SoftmaxUnit softmax;

    attend(int8[8][128] Q, KvCache cache, uint<12> seq_len) → bf16[32][128];
  }

  class VectorUnit {
    RmsNormUnit rmsnorm;
    SiluUnit silu;
    DequantUnit dequant;
    RopeUnit rope;

    rmsnorm(bf16[4096] x, bf16[4096] gamma) → int8[4096];
    apply_rope(bf16[N][128] qk, uint<12> position) → bf16[N][128];
    swiglu(bf16[14336] gate, bf16[14336] up) → int8[14336];
    dequantize(int32[N] accum, fp8 bank_scale, fp32 tensor_scale) → bf16[N];
    residual_add(bf16[4096] a, bf16[4096] b) → bf16[4096];
  }

  class KvCache {
    int8[4096][8][128] k_store;
    int8[4096][8][128] v_store;
    uint<12> write_ptr;

    append(int8[8][128] k, int8[8][128] v);
    read_k(uint<4> head_id) → int8[seq_len][128];
    read_v(uint<4> head_id) → int8[seq_len][128];
  }

  class SoftmaxUnit {
    ExpLut exp_lut;
    RsqrtLut rsqrt_lut;

    softmax(fp32[N] scores) → fp32[N];
  }

  class RmsNormUnit {
    RsqrtLut rsqrt_lut;

    normalize(bf16[4096] x, bf16[4096] gamma) → bf16[4096];
  }

  class SiluUnit {
    SigmoidLut sigmoid_lut;

    silu(bf16[N] x) → bf16[N];
  }

  class RopeUnit {
    bf16[64][4096] sin_lut;  // 64 freq pairs × 4K positions
    bf16[64][4096] cos_lut;

    rotate(bf16[128] vec, uint<12> position) → bf16[128];
  }

  class RomBank {
    read(uint<12> row_addr) → uint<3>[8192];
  }

  class EmbedRom {
    RomBank[50] rom;
    lookup(uint<16> token_id) → bf16[4096];
  }

  class LmHeadRom {
    RomBank[50] rom;
    gemv(int8[4096] hidden) → fp32[128256];
  }
}
```

## Weight Format

Weights provided as 3-bit GGUF (Q3_K variant). The GGUF file is parsed offline
and converted to the ROM programming format:

- 3-bit integer weights extracted per matrix, per layer
- FP8 per-bank scales and FP32 per-tensor scales extracted from GGUF metadata
- ROM bank layout: weights arranged so one wordline read feeds a PE column
- Contact mask generated from the binary weight data for NOR ROM fabrication

Weight conversion tooling (GGUF → ROM contact mask) is a separate offline tool,
not part of the RTL.
