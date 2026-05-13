#!/usr/bin/env python3
"""Render the full-chip floorplan figure showing all hardened tiles to scale.

Each tile is drawn at proportional size with macro placements highlighted.
Saves to docs/images/full_chip_floorplan.png.

Updated 2026-05-13 to reflect v8 / v11.3 / v12 PnR results, including the
new layer_orchestrator and transformer_layer_block hardenings.
"""
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import os

# Tile catalog: name -> (width_um, height_um, macros_count, drc, fmax_mhz, color, label_color)
# Color groups: blue=NOR ROM, green=SRAM, gray=stdcell only
TILES = [
    # (name, w, h, n_macros, drc, fmax, fill_color, text)
    # === Folded NOR ROM giants ===
    ("embed_rom",       1900, 2400, 1,  0,  131, "#5b8def", "embed_rom\n1900×2400\n0 DRC, 131 MHz"),
    ("lm_head_demo",    1900, 2400, 1,  0,  127, "#5b8def", "lm_head_demo\n1900×2400\n0 DRC, 127 MHz"),
    # === Large NOR ROM tiles ===
    ("rope_gen",        3000, 3300, 2,  350,147, "#3a6dd0", "rope_gen (v7)\n3000×3300\n350 DRC, 147 MHz"),
    ("mac_array",       1800, 2400, 2,  0,  130,"#3a6dd0", "mac_array (v8)\n1800×2400\n0 DRC, 130 MHz"),
    ("rom_bank",        1500, 1500, 1,  0,  167,"#5b8def", "rom_bank\n1500×1500\n0 DRC, 167 MHz"),
    # === v11 / v12 composition tiles ===
    ("transformer_layer_block", 3000, 3500, 0, 0, 128, "#a25dff",
        "transformer_layer_block (v11.3)\n3000×3500\n1225 pins, 0 DRC"),
    ("layer_orchestrator", 3000, 3000, 4, 0, 118, "#9b3eff",
        "layer_orchestrator (v12)\n3000×3000\n4 SRAM, 0 DRC, 118 MHz\nrope_apply + vector_unit"),
    # === SRAM-bearing small tiles ===
    ("rmsnorm",         1200, 1200, 2,  0,  205,"#37b370","rmsnorm (v5)\n1200×1200\n0 DRC, 205 MHz"),
    ("swiglu",           700,  700, 3,  0,  157,"#37b370","swiglu (v5)\n700×700\n0 DRC, 157 MHz"),
    ("codebook_decoder", 800,  800, 5,  0,  249,"#37b370","codebook_decoder (v6)\n800×800\n0 DRC, 249 MHz MET"),
    ("kv_cache_demo",    595,  705, 4,  0,  230,"#37b370","kv_cache_demo\n595×705\n0 DRC, 230 MHz"),
    ("lut_interp",       600,  600, 1,  0,  253,"#37b370","lut_interp (v5)\n600×600\n0 DRC, 253 MHz MET"),
    ("rope_apply",      2800, 2800, 0,  0,  128,"#7c7c7c","rope_apply (v8 cascade)\n2800×2800\n0 DRC, 128 MHz"),
    # === Pure stdcell tiles ===
    ("attention_unit",  1000, 1000, 0,  0,  139,"#7c7c7c","attention_unit\n1000×1000\n139 MHz"),
    ("dequant",          800,  800, 0,  0,  214,"#7c7c7c","dequant\n800×800\n214 MHz"),
    ("scale_store",     1000, 1000, 0,  0,  243,"#7c7c7c","scale_store\n1000×1000\n243 MHz"),
    ("layer_tile",      1000, 1000, 0,  0,  254,"#7c7c7c","layer_tile\n1000×1000\n254 MHz"),
    ("llama_chip",      1000, 1000, 0,  0,  252,"#7c7c7c","llama_chip\n1000×1000\n252 MHz"),
    ("global_controller",1000,1000, 0,  0,  244,"#7c7c7c","global_ctrl\n1000×1000\n244 MHz"),
    ("mac_pe",           500,  500, 0,  0,  175,"#7c7c7c","mac_pe\n500×500\n175 MHz"),
    ("async_fifo",       400,  400, 0,  0,  326,"#7c7c7c","async_fifo\n400×400\n326 MHz"),
    ("vector_unit",     3000, 3500, 6,None, None,"#cccccc","vector_unit\n3000×3500\nstandalone PnR\npending"),
]

# Manual placement: x_origin, y_origin per tile, organized into 4 horizontal bands.
# Chip target: ~13000×8500 µm (added v11/v12 composition tiles).
PLACEMENTS = {
    # === TOP BAND (y = 5800 to 8500) — folded NOR ROM + composition tiles ===
    "embed_rom":         (100, 5800),
    "lm_head_demo":      (2100, 5800),
    "transformer_layer_block": (4200, 5000),  # v11.3 hardened block
    "layer_orchestrator":(7400, 5500),         # v12 composition, NEW
    "vector_unit":       (10600, 5000),        # right side, pending
    # === MIDDLE BAND (y = 1900 to 5400) — large macro tiles ===
    "rope_gen":          (100, 2200),
    "mac_array":         (3300, 2900),
    "rope_apply":        (5300, 2200),
    "rom_bank":          (8300, 3700),
    "rmsnorm":           (10100, 3700),
    # === BOTTOM-MIDDLE BAND (y = 1100 to 1900) — small macro/SRAM tiles ===
    "swiglu":            (8300, 1100),
    "codebook_decoder":  (9100, 1100),
    "lut_interp":        (10000, 1100),
    "kv_cache_demo":     (10700, 1100),
    # === BOTTOM BAND (y = 100 to 1000) — pure stdcell tiles ===
    "attention_unit":    (100, 100),
    "dequant":           (1200, 100),
    "scale_store":       (2100, 100),
    "layer_tile":        (3200, 100),
    "llama_chip":        (4300, 100),
    "global_controller": (5400, 100),
    "mac_pe":            (6500, 100),
    "async_fifo":        (7100, 100),
}

CHIP_W = 13700
CHIP_H = 8700

fig, ax = plt.subplots(figsize=(20, 12))

# Draw chip outline
ax.add_patch(Rectangle((0, 0), CHIP_W, CHIP_H, linewidth=2,
                        edgecolor="black", facecolor="#f8f8f8"))

# Draw each tile
for name, w, h, n_macros, drc, fmax, color, label in TILES:
    if name not in PLACEMENTS:
        continue
    x, y = PLACEMENTS[name]
    # Tile body
    edge = "red" if (drc is None or (drc and drc > 200)) else "black"
    lw = 2 if edge == "red" else 1.0
    ax.add_patch(Rectangle((x, y), w, h, linewidth=lw,
                            edgecolor=edge, facecolor=color, alpha=0.55))
    # Macro indicators (small dark rectangles at top of tile)
    if n_macros and n_macros > 0:
        macro_h = min(60, h * 0.06)
        macro_w = w * 0.85 / max(n_macros, 1)
        for i in range(n_macros):
            mx = x + (w - n_macros * macro_w * 1.05) / 2 + i * macro_w * 1.05
            my = y + h - macro_h - 30
            ax.add_patch(Rectangle((mx, my), macro_w, macro_h,
                                    linewidth=0.5, edgecolor="black",
                                    facecolor="#1a1a4d", alpha=0.85))
    # Label
    fontsize = 7 if min(w, h) < 700 else 9
    ax.text(x + w / 2, y + h / 2, label, ha="center", va="center",
            fontsize=fontsize, color="white" if color in ("#3a6dd0", "#1a1a4d", "#9b3eff", "#a25dff") else "black",
            weight="bold" if min(w, h) >= 1500 else "normal")

# Title and axes
ax.set_xlim(-200, CHIP_W + 1200)
ax.set_ylim(-200, CHIP_H + 200)
ax.set_aspect("equal")
ax.set_xlabel("x (µm)")
ax.set_ylabel("y (µm)")
ax.set_title("OpenTaalas Full-Chip Floorplan — All 20 Hardened Tiles (post v12 layer_orchestrator)\n"
             f"Total: ~{CHIP_W/1000:.1f} × {CHIP_H/1000:.1f} mm = {CHIP_W*CHIP_H/1e6:.1f} mm² (synthetic figure, not actual chip-level PnR)",
             fontsize=13, weight="bold")
ax.grid(True, alpha=0.2, linestyle=":")

# Legend
legend_elems = [
    Rectangle((0,0), 1, 1, facecolor="#3a6dd0", alpha=0.55, edgecolor="black", label="Large NOR ROM tile"),
    Rectangle((0,0), 1, 1, facecolor="#5b8def", alpha=0.55, edgecolor="black", label="Folded NOR ROM tile (internal mux)"),
    Rectangle((0,0), 1, 1, facecolor="#37b370", alpha=0.55, edgecolor="black", label="SRAM-bearing tile"),
    Rectangle((0,0), 1, 1, facecolor="#9b3eff", alpha=0.55, edgecolor="black", label="v12 Kanagawa orchestrator (composition)"),
    Rectangle((0,0), 1, 1, facecolor="#a25dff", alpha=0.55, edgecolor="black", label="v11.3 layer_block (cascade-ready)"),
    Rectangle((0,0), 1, 1, facecolor="#7c7c7c", alpha=0.55, edgecolor="black", label="Pure stdcell tile"),
    Rectangle((0,0), 1, 1, facecolor="#cccccc", alpha=0.55, edgecolor="red", linewidth=2, label="Standalone PnR pending"),
    Rectangle((0,0), 1, 1, facecolor="#1a1a4d", alpha=0.85, edgecolor="black", label="Macro instance (NOR ROM/SRAM)"),
]
ax.legend(handles=legend_elems, loc="lower right", fontsize=9, framealpha=0.95)

# Side annotations
ax.text(CHIP_W + 100, 500, "Logic-only\nstdcell tier",
        ha="left", va="center", fontsize=10, style="italic")
ax.text(CHIP_W + 100, 3500, "Macro-bearing\ntier",
        ha="left", va="center", fontsize=10, style="italic")
ax.text(CHIP_W + 100, 6800, "Composition + Folded ROM\ntier",
        ha="left", va="center", fontsize=10, style="italic")

# v11.3 cascade: rope_gen → transformer_layer_block (256-bit phased segments)
gen_x, gen_y = PLACEMENTS["rope_gen"]
gen_cx = gen_x + 3000 / 2
gen_cy = gen_y + 3300
blk_x, blk_y = PLACEMENTS["transformer_layer_block"]
blk_cx = blk_x + 100
blk_cy = blk_y + 1750
ax.annotate("",
    xy=(blk_cx, blk_cy), xytext=(gen_cx, gen_cy),
    arrowprops=dict(arrowstyle="->", color="#d0212e", lw=2.5))
ax.text((gen_cx + blk_cx) / 2, (gen_cy + blk_cy) / 2 + 200,
        "v11.3 cascade\n4× 256-bit phased\n(cos/sin)",
        ha="center", va="center", fontsize=8, color="#d0212e", weight="bold",
        bbox=dict(boxstyle="round,pad=0.25", facecolor="white", edgecolor="#d0212e"))

# v12 composition path: rope_apply + vector_unit → layer_orchestrator (composed inside)
orch_x, orch_y = PLACEMENTS["layer_orchestrator"]
ax.annotate("",
    xy=(orch_x, orch_y + 1500),
    xytext=(blk_x + 3000, blk_y + 1750),
    arrowprops=dict(arrowstyle="->", color="#9b3eff", lw=2.0, linestyle="dashed"))
ax.text((blk_x + 3000 + orch_x) / 2, (blk_y + 1750 + orch_y + 1500) / 2 + 150,
        "v12: composes\nrope_apply + vector_unit",
        ha="center", va="center", fontsize=8, color="#9b3eff", weight="bold",
        bbox=dict(boxstyle="round,pad=0.25", facecolor="white", edgecolor="#9b3eff"))

plt.tight_layout()
out = "/home/mana/workspace/OpenTaalas/docs/images/full_chip_floorplan.png"
os.makedirs(os.path.dirname(out), exist_ok=True)
plt.savefig(out, dpi=150, bbox_inches="tight")
print(f"Wrote {out}")
