#!/usr/bin/env python3
"""Render the full-chip floorplan figure showing all hardened tiles to scale.

Each tile is drawn at proportional size with macro placements highlighted.
Saves to docs/images/full_chip_floorplan.png.
"""
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
from matplotlib.lines import Line2D
import os

# Tile catalog: name -> (width_um, height_um, macros_count, drc, fmax_mhz, color, label_color)
# Color groups: blue=NOR ROM, green=SRAM, gray=stdcell only
TILES = [
    # (name, w, h, n_macros, drc, fmax, fill_color, text)
    # Top row — folded NOR ROM giants
    ("embed_rom",       1900, 2400, 1,  0,  131, "#5b8def", "embed_rom\n1900×2400\n0 DRC, 131 MHz"),
    ("lm_head_demo",    1900, 2400, 1,  0,  127, "#5b8def", "lm_head_demo\n1900×2400\n0 DRC, 127 MHz"),
    # Middle row — large NOR ROM tiles
    ("rope_gen",        3000, 3300, 2,  350,147, "#3a6dd0", "rope_gen (v7)\n3000×3300\n350 DRC, 147 MHz"),
    ("mac_array",       2500, 3000, 1,  641, 127,"#3a6dd0", "mac_array\n2500×3000\n641 DRC, 127 MHz"),
    ("rom_bank",        1500, 1500, 1,  0,  167,"#5b8def", "rom_bank\n1500×1500\n0 DRC, 167 MHz"),
    # Bottom-left — small macro/SRAM tiles
    ("rmsnorm",         1200, 1200, 2,  0,  205,"#37b370","rmsnorm (v5)\n1200×1200\n0 DRC, 205 MHz"),
    ("swiglu",           700,  700, 3,  0,  157,"#37b370","swiglu\n700×700\n0 DRC, 157 MHz"),
    ("codebook_decoder", 800,  800, 5,  0,  249,"#37b370","codebook_decoder\n800×800\n0 DRC, 249 MHz"),
    ("kv_cache_demo",    595,  705, 4,  0,  230,"#37b370","kv_cache_demo\n595×705\n0 DRC, 230 MHz"),
    ("lut_interp",       600,  600, 1,  0,  253,"#37b370","lut_interp\n600×600\n0 DRC, 253 MHz"),
    ("rope_apply",       800,  800, 0,  0,  192,"#7c7c7c","rope_apply (v7)\n800×800\n0 DRC, 192 MHz"),
    # Bottom-right — pure stdcell tiles
    ("attention_unit",  1000, 1000, 0,  0,  139,"#7c7c7c","attention_unit\n1000×1000\n139 MHz"),
    ("dequant",          800,  800, 0,  0,  214,"#7c7c7c","dequant\n800×800\n214 MHz"),
    ("scale_store",     1000, 1000, 0,  0,  243,"#7c7c7c","scale_store\n1000×1000\n243 MHz"),
    ("layer_tile",      1000, 1000, 0,  0,  254,"#7c7c7c","layer_tile\n1000×1000\n254 MHz"),
    ("llama_chip",      1000, 1000, 0,  0,  252,"#7c7c7c","llama_chip\n1000×1000\n252 MHz"),
    ("global_controller",1000,1000, 0,  0,  244,"#7c7c7c","global_ctrl\n1000×1000\n244 MHz"),
    ("mac_pe",           500,  500, 0,  0,  175,"#7c7c7c","mac_pe\n500×500\n175 MHz"),
    ("async_fifo",       400,  400, 0,  0,  326,"#7c7c7c","async_fifo\n400×400\n326 MHz"),
    ("vector_unit",     3000, 3500, 6,None, None,"#cccccc","vector_unit\n3000×3500\nPnR pending"),
]

# Manual placement: x_origin, y_origin per tile, organized into 3 horizontal bands.
# Chip target: ~10000×7500 µm. Band heights: bottom=1100, middle=3500, top=2500 with 100µm channels.
PLACEMENTS = {
    # === TOP BAND (y = 5100 to 7500) — folded NOR ROM tiles ===
    "embed_rom":         (100, 5100),
    "lm_head_demo":      (2100, 5100),
    "rope_gen":          (4100, 4200),  # spans middle+top
    "vector_unit":       (7300, 4000),  # right side, spans bands
    # === MIDDLE BAND (y = 1900 to 4100) — large macro tiles ===
    "mac_array":         (100, 1100),  # tall, spans middle+bottom
    "rom_bank":          (2700, 2600),
    "rmsnorm":           (4300, 2700),  # wedged left of rope_gen
    # === BOTTOM BAND (y = 100 to 1000) — logic + small macros ===
    "swiglu":            (2700, 1700),
    "codebook_decoder":  (3500, 1700),
    "lut_interp":        (4400, 1700),
    "kv_cache_demo":     (5100, 1700),
    "rope_apply":        (5800, 1700),
    "attention_unit":    (2700, 100),
    "dequant":           (3800, 100),
    "scale_store":       (4700, 100),
    "layer_tile":        (5800, 100),
    "llama_chip":        (6900, 100),
    "global_controller": (8000, 100),
    "mac_pe":            (9100, 100),
    "async_fifo":        (9100, 700),
}

CHIP_W = 10500
CHIP_H = 7700

fig, ax = plt.subplots(figsize=(16, 12))

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
            fontsize=fontsize, color="white" if color in ("#3a6dd0", "#1a1a4d") else "black",
            weight="bold" if min(w, h) >= 1500 else "normal")

# Title and axes
ax.set_xlim(-200, CHIP_W + 200)
ax.set_ylim(-200, CHIP_H + 200)
ax.set_aspect("equal")
ax.set_xlabel("x (µm)")
ax.set_ylabel("y (µm)")
ax.set_title("OpenTaalas Full-Chip Floorplan — Hierarchical (post v7 RoPE split)\n"
             f"Total: ~{CHIP_W/1000:.1f} × {CHIP_H/1000:.1f} mm = {CHIP_W*CHIP_H/1e6:.1f} mm²",
             fontsize=13, weight="bold")
ax.grid(True, alpha=0.2, linestyle=":")

# Legend
legend_elems = [
    Rectangle((0,0), 1, 1, facecolor="#3a6dd0", alpha=0.55, edgecolor="black", label="Large NOR ROM tile"),
    Rectangle((0,0), 1, 1, facecolor="#5b8def", alpha=0.55, edgecolor="black", label="Folded NOR ROM tile (internal mux)"),
    Rectangle((0,0), 1, 1, facecolor="#37b370", alpha=0.55, edgecolor="black", label="SRAM-bearing tile"),
    Rectangle((0,0), 1, 1, facecolor="#7c7c7c", alpha=0.55, edgecolor="black", label="Pure stdcell tile"),
    Rectangle((0,0), 1, 1, facecolor="#cccccc", alpha=0.55, edgecolor="red", linewidth=2, label="PnR not yet complete"),
    Rectangle((0,0), 1, 1, facecolor="#1a1a4d", alpha=0.85, edgecolor="black", label="Macro instance (NOR ROM/SRAM)"),
]
ax.legend(handles=legend_elems, loc="upper right", fontsize=9, framealpha=0.95)

# Side annotations
ax.text(CHIP_W + 100, 600, "Logic-only\ntier",
        ha="left", va="center", fontsize=10, style="italic")
ax.text(CHIP_W + 100, 3000, "Macro-bearing\ntier",
        ha="left", va="center", fontsize=10, style="italic")
ax.text(CHIP_W + 100, 6300, "Folded ROM\ntier",
        ha="left", va="center", fontsize=10, style="italic")

# Critical rope_gen → rope_apply broadcast bus arrow (1024-bit cos/sin)
gen_x, gen_y = PLACEMENTS["rope_gen"]
gen_cx = gen_x + 3000 / 2
gen_cy = gen_y + 100
app_x, app_y = PLACEMENTS["rope_apply"]
app_cx = app_x + 800 / 2
app_cy = app_y + 800
ax.annotate("",
    xy=(app_cx, app_cy), xytext=(gen_cx, gen_cy),
    arrowprops=dict(arrowstyle="->", color="#d0212e", lw=2.5))
ax.text((gen_cx + app_cx) / 2 + 50, (gen_cy + app_cy) / 2,
        "cos/sin bus\n2× 1024-bit\n(broadcast)",
        ha="left", va="center", fontsize=9, color="#d0212e", weight="bold",
        bbox=dict(boxstyle="round,pad=0.25", facecolor="white", edgecolor="#d0212e"))

plt.tight_layout()
out = "/home/mana/workspace/OpenTaalas/docs/images/full_chip_floorplan.png"
os.makedirs(os.path.dirname(out), exist_ok=True)
plt.savefig(out, dpi=150, bbox_inches="tight")
print(f"Wrote {out}")
