#!/usr/bin/env python3
"""Render the v8 K=2 multi-layer floorplan with cascaded RoPE.

Two physical transformer layers (L0, L1) sit side-by-side in the bottom band.
The chip-shared rope_gen sits in the top band, rotated R270 so its 1024-bit
cos/sin dout buses exit the SOUTH edge directly above the layer band.

Cascade chain (the v8 architectural change):
    rope_gen (top)  --SOUTH-->  L0.rope_apply  --EAST--> L1.rope_apply
Each cascade hop is ≤ 1 mm — no chip-spanning broadcast.

Compared to v7 (which was 1 layer + a star-broadcast SDC sketch), v8 doubles
the per-layer compute area and replaces the broadcast bus with two short hops.
"""
import os
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle


# Per-tile (name, w, h, n_macros, color, label, group)
PER_LAYER_TILES = [
    # mac_array 3x3 grid (Q, K, V, O on row 0; gate, up, down on row 1; row 2 has 1 spare slot used by rope_apply)
    ("mac_q",    1800, 2400, 1, "#3a6dd0", "mac_q\n1800×2400"),
    ("mac_k",    1800, 2400, 1, "#3a6dd0", "mac_k\n1800×2400"),
    ("mac_v",    1800, 2400, 1, "#3a6dd0", "mac_v\n1800×2400"),
    ("mac_o",    1800, 2400, 1, "#3a6dd0", "mac_o\n1800×2400"),
    ("mac_gate", 1800, 2400, 1, "#3a6dd0", "mac_gate\n1800×2400"),
    ("mac_up",   1800, 2400, 1, "#3a6dd0", "mac_up\n1800×2400"),
    ("mac_down", 1800, 2400, 1, "#3a6dd0", "mac_down\n1800×2400"),
    ("vector_unit", 3000, 3500, 6, "#37b370", "vector_unit\n3000×3500"),
    ("kv_cache",     595,  705, 4, "#37b370", "kv_cache\n595×705"),
    ("attention_unit",1000,1000,0, "#7c7c7c", "attn\n1000×1000"),
    ("layer_tile",   1000,1000, 0, "#7c7c7c", "FSM\n1000×1000"),
    ("rope_apply",    800, 800, 0, "#7c7c7c", "rope_apply\n800×800\n(cascade)"),
]
CHIP_SINGLETONS = [
    ("rope_gen",    3300, 3000, 2, "#3a6dd0", "rope_gen (R270, SOUTH dout)\n3300×3000"),
    ("embed_rom",   1900, 2400, 1, "#5b8def", "embed_rom\n1900×2400"),
    ("lm_head",     1900, 2400, 1, "#5b8def", "lm_head\n1900×2400"),
    ("global_ctrl", 1000, 1000, 0, "#7c7c7c", "global_ctrl\n1000×1000"),
]


def layer_block_layout(x0, y0, mirror=False):
    """Place one transformer-layer block at origin (x0, y0).

    Layout per block:
      mac3x3 grid (5800 × 7600) on top
      bottom row: VU (3000) | rope_apply (800) | kv_cache (595) | attn (1000) | FSM (1000)
                 (~6395 wide, fits within 5800 if VU is its own subrow)

    For mirror=True (L1), swap the rope_apply to LEFT side so its EAST cos_out
    faces L1 NEXT (no L2 in K=2, but conceptually right).

    Returns: dict tile_name → (x, y) (lower-left corner)
    """
    placements = {}
    ch = 200  # channel
    # mac3x3: 3 cols × 3 rows of (1800×2400). Row order top-to-bottom: Q-K-V, O-gate-up, down-spare-spare
    mac_names = [
        ["mac_q", "mac_k", "mac_v"],
        ["mac_o", "mac_gate", "mac_up"],
        ["mac_down", None, None],
    ]
    # Place mac3x3 in upper part of layer band
    mac_grid_top_y = y0 + 4500  # leaves room for VU/ctrl below
    for r in range(3):
        for c in range(3):
            name = mac_names[r][c]
            if name is None:
                continue
            mx = x0 + c * (1800 + ch)
            my = mac_grid_top_y - (r + 1) * 2400 - r * ch
            placements[name] = (mx, my)
    # Bottom row: VU (3000×3500), then small tiles
    vu_x = x0 + (0 if not mirror else (5800 - 3000))
    vu_y = y0
    placements["vector_unit"] = (vu_x, vu_y)
    # Small tiles in remaining width
    sm_x = x0 + (3000 + ch if not mirror else 0)
    sm_y_base = y0
    placements["rope_apply"]    = (sm_x, sm_y_base + 0)
    placements["kv_cache"]      = (sm_x, sm_y_base + 800 + ch)
    placements["attention_unit"] = (sm_x + 800 + ch, sm_y_base + 0)
    placements["layer_tile"]     = (sm_x + 800 + ch, sm_y_base + 1000 + ch)
    return placements


def main():
    # Chip dimensions
    layer_block_w = 5800
    layer_block_h = 8000  # mac3x3 (7400) + bottom row (3500) - 2900 overlap accounting; rough
    layer_block_h = 4500 + 3500 + 200  # actual: bottom row 3500 + mac3x3 with mac_grid_top_y=4500
    layer_block_h = 8200  # 4500 + 2400 + 1300 (spacing)

    chip_w = 2 * layer_block_w + 200  # 11800
    chip_h = layer_block_h + 200 + 3000  # layer band + channel + singleton band
    # Bump for label margins
    chip_w_eff = chip_w + 200
    chip_h_eff = chip_h + 200

    fig, ax = plt.subplots(figsize=(16, 13))
    ax.add_patch(Rectangle((0, 0), chip_w_eff, chip_h_eff, linewidth=2,
                           edgecolor="black", facecolor="#f8f8f8"))

    # === TOP BAND: chip-singletons ===
    top_y = layer_block_h + 200
    cur_x = 100
    singleton_pos = {}
    for name, w, h, n_macros, color, label in CHIP_SINGLETONS:
        # Stack singletons left-to-right; rope_gen last (it's the widest)
        pass
    # Manual placement: rope_gen centered horizontally, embed_rom to its left,
    # lm_head to its right, global_ctrl tucked next to lm_head.
    rg_w, rg_h = 3300, 3000
    rg_x = (chip_w - rg_w) // 2
    singleton_pos["rope_gen"] = (rg_x, top_y)
    singleton_pos["embed_rom"] = (rg_x - 1900 - 200, top_y)
    singleton_pos["lm_head"]   = (rg_x + rg_w + 200, top_y)
    singleton_pos["global_ctrl"] = (rg_x + rg_w + 200, top_y + 2400 + 100)

    # === LAYER BAND: 2 layer blocks side by side ===
    l0 = layer_block_layout(100, 100, mirror=False)
    l1 = layer_block_layout(100 + layer_block_w + 200, 100, mirror=True)

    # Draw all placed tiles
    def draw_tile(name, x, y, w, h, n_macros, color, label, prefix=""):
        edge = "black"
        lw = 1.0
        ax.add_patch(Rectangle((x, y), w, h, linewidth=lw,
                               edgecolor=edge, facecolor=color, alpha=0.55))
        if n_macros and n_macros > 0:
            macro_h = min(60, h * 0.06)
            macro_w = w * 0.85 / max(n_macros, 1)
            for i in range(n_macros):
                mx = x + (w - n_macros * macro_w * 1.05) / 2 + i * macro_w * 1.05
                my = y + h - macro_h - 30
                ax.add_patch(Rectangle((mx, my), macro_w, macro_h,
                                       linewidth=0.5, edgecolor="black",
                                       facecolor="#1a1a4d", alpha=0.85))
        fontsize = 6 if min(w, h) < 700 else 8
        ax.text(x + w / 2, y + h / 2, prefix + label, ha="center", va="center",
                fontsize=fontsize,
                color="white" if color == "#3a6dd0" else "black",
                weight="bold" if min(w, h) >= 1500 else "normal")

    for name, w, h, n_macros, color, label in PER_LAYER_TILES:
        x, y = l0[name]
        draw_tile(name, x, y, w, h, n_macros, color, label, prefix="L0.")
        x, y = l1[name]
        draw_tile(name, x, y, w, h, n_macros, color, label, prefix="L1.")

    for name, w, h, n_macros, color, label in CHIP_SINGLETONS:
        x, y = singleton_pos[name]
        draw_tile(name, x, y, w, h, n_macros, color, label)

    # === Cascade arrows ===
    # rope_gen SOUTH → L0.rope_apply NORTH
    rg_x, rg_y = singleton_pos["rope_gen"]
    rg_south_x = rg_x + rg_w / 2
    rg_south_y = rg_y
    l0_ra_x, l0_ra_y = l0["rope_apply"]
    l0_ra_north_x = l0_ra_x + 800 / 2
    l0_ra_north_y = l0_ra_y + 800
    ax.annotate("",
                xy=(l0_ra_north_x, l0_ra_north_y),
                xytext=(rg_south_x, rg_south_y),
                arrowprops=dict(arrowstyle="->", color="#d0212e", lw=2.5))
    ax.text((rg_south_x + l0_ra_north_x) / 2 + 100,
            (rg_south_y + l0_ra_north_y) / 2,
            "cos/sin\n(2× 1024-bit)\nrope_gen → L0",
            ha="left", va="center", fontsize=8, color="#d0212e", weight="bold",
            bbox=dict(boxstyle="round,pad=0.25", facecolor="white", edgecolor="#d0212e"))

    # L0.rope_apply EAST → L1.rope_apply WEST (cascade hop)
    l0_ra_east_x = l0_ra_x + 800
    l0_ra_east_y = l0_ra_y + 800 / 2
    l1_ra_x, l1_ra_y = l1["rope_apply"]
    l1_ra_west_x = l1_ra_x
    l1_ra_west_y = l1_ra_y + 800 / 2
    ax.annotate("",
                xy=(l1_ra_west_x, l1_ra_west_y),
                xytext=(l0_ra_east_x, l0_ra_east_y),
                arrowprops=dict(arrowstyle="->", color="#d0212e", lw=2.5))
    midx = (l0_ra_east_x + l1_ra_west_x) / 2
    midy = (l0_ra_east_y + l1_ra_west_y) / 2
    ax.text(midx, midy + 200,
            "L0.RA → L1.RA\n(1-cycle reg)\n≤ 1 mm hop",
            ha="center", va="center", fontsize=7, color="#d0212e", weight="bold",
            bbox=dict(boxstyle="round,pad=0.2", facecolor="white", edgecolor="#d0212e"))

    # Title and axes
    ax.set_xlim(-300, chip_w_eff + 300)
    ax.set_ylim(-300, chip_h_eff + 300)
    ax.set_aspect("equal")
    ax.set_xlabel("x (µm)")
    ax.set_ylabel("y (µm)")
    title = ("OpenTaalas v8 Multi-Layer Floorplan (K=2, cascaded RoPE)\n"
             f"Chip: ~{chip_w_eff/1000:.1f} × {chip_h_eff/1000:.1f} mm "
             f"= {chip_w_eff*chip_h_eff/1e6:.1f} mm²")
    ax.set_title(title, fontsize=13, weight="bold")
    ax.grid(True, alpha=0.2, linestyle=":")

    # Legend (reuse v7 colors)
    legend_elems = [
        Rectangle((0,0), 1, 1, facecolor="#3a6dd0", alpha=0.55, edgecolor="black", label="Per-layer NOR ROM tile"),
        Rectangle((0,0), 1, 1, facecolor="#5b8def", alpha=0.55, edgecolor="black", label="Folded NOR ROM (chip-singleton)"),
        Rectangle((0,0), 1, 1, facecolor="#37b370", alpha=0.55, edgecolor="black", label="SRAM-bearing tile"),
        Rectangle((0,0), 1, 1, facecolor="#7c7c7c", alpha=0.55, edgecolor="black", label="Pure stdcell tile"),
        Rectangle((0,0), 1, 1, facecolor="#1a1a4d", alpha=0.85, edgecolor="black", label="Macro instance"),
    ]
    ax.legend(handles=legend_elems, loc="upper right", fontsize=9, framealpha=0.95)

    # Annotation key
    ax.text(-280, chip_h_eff / 2,
            "K=2 layer blocks\n(L0 left, L1 right;\nidentical layout)",
            ha="left", va="center", fontsize=9, style="italic", rotation=90)
    ax.text(-280, top_y + 1500,
            "Chip-singletons\n(rope_gen, embed_rom,\nlm_head, global_ctrl)",
            ha="left", va="center", fontsize=9, style="italic", rotation=90)

    plt.tight_layout()
    out = "/home/mana/workspace/OpenTaalas/docs/images/multi_layer_floorplan.png"
    os.makedirs(os.path.dirname(out), exist_ok=True)
    plt.savefig(out, dpi=150, bbox_inches="tight")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
