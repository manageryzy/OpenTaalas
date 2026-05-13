#!/usr/bin/env python3
"""Render the v11.3 multi_layer_chip floorplan — the ACTUAL integration.

What is hardened at chip level today (multi_layer_chip_wrapper.sv):
    1× rope_gen               (chip-singleton)
    2× transformer_layer_block (per layer; each wraps rope_apply only)
    + chip-level 4:1 phase slicer in glue logic

That's it. The mac_arrays, vector_unit, kv_cache, attention_unit etc. are
standalone per-tile PnR validations — they are NOT instantiated in
multi_layer_chip. Folding them into transformer_layer_block hits the
561K-cell flat-PnR wall (per `feedback_chip_routing_plateau.md`).

The figure draws the chip honestly and shows where the per-layer compute
would go in a future hierarchical-PnR-enabled integration.

Updated 2026-05-13 to reflect actual v11.3 RTL (was previously drawing
hypothetical per-layer mac/vector/kv tiles as if they were integrated).
"""
import os
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle


# Actual chip-level macros in multi_layer_chip_wrapper.sv (v11.3)
CHIP_MACROS = [
    # (name, w, h, color, label)
    ("rope_gen",    3300, 3000, "#3a6dd0",
        "rope_gen (R270, SOUTH dout)\n3300×3000\n2× nor_rom_4096x1024\n350 DRC, 147 MHz"),
    ("l0_block",    3000, 3500, "#a25dff",
        "L0.transformer_layer_block (v11.3)\n3000×3500\nrope_apply hardened\n1225 boundary pins\n0 DRC, 128 MHz"),
    ("l1_block",    3000, 3500, "#a25dff",
        "L1.transformer_layer_block (v11.3)\n3000×3500\nrope_apply hardened\n1225 boundary pins\n0 DRC, 128 MHz"),
]


def main():
    # Chip layout: rope_gen on top, 2 layer_blocks below side-by-side.
    # Channel margin between macros.
    ch = 300

    # Layer block placements (bottom band)
    l0_x, l0_y = 200, 200
    l1_x, l1_y = l0_x + 3000 + 600, 200

    # rope_gen placement (top band, centered above the two blocks)
    rg_x = (l0_x + l1_x + 3000) // 2 - 3300 // 2
    rg_y = l0_y + 3500 + ch + 600

    placements = {
        "rope_gen": (rg_x, rg_y),
        "l0_block": (l0_x, l0_y),
        "l1_block": (l1_x, l1_y),
    }

    chip_w = l1_x + 3000 + 200
    chip_h = rg_y + 3000 + 600

    fig, ax = plt.subplots(figsize=(13, 12))
    ax.add_patch(Rectangle((0, 0), chip_w, chip_h, linewidth=2,
                           edgecolor="black", facecolor="#f8f8f8"))

    # Draw each macro
    for name, w, h, color, label in CHIP_MACROS:
        x, y = placements[name]
        ax.add_patch(Rectangle((x, y), w, h, linewidth=1.5,
                               edgecolor="black", facecolor=color, alpha=0.55))
        # Indicate the inner macros (NOR ROM for rope_gen, abstract for layer_block)
        if name == "rope_gen":
            for i, mx in enumerate([x + 200, x + 1900]):
                ax.add_patch(Rectangle((mx, y + 100), 1200, 800,
                                       linewidth=0.5, edgecolor="black",
                                       facecolor="#1a1a4d", alpha=0.85))
                ax.text(mx + 600, y + 500, f"nor_rom_4096x1024\n(fold=2)",
                        ha="center", va="center", fontsize=7, color="white", weight="bold")
        elif "block" in name:
            # Show the abstract LEF status
            ax.add_patch(Rectangle((x + 100, y + h - 700), w - 200, 500,
                                   linewidth=0.5, edgecolor="black",
                                   facecolor="#5a2f8c", alpha=0.85))
            ax.text(x + w / 2, y + h - 450, "rope_apply\n(hardened abstract LEF)",
                    ha="center", va="center", fontsize=8, color="white", weight="bold")

        ax.text(x + w / 2, y + h / 2 - 200, label, ha="center", va="center",
                fontsize=9, color="black", weight="bold")

    # === Cascade arrows (v11.3 256-bit phased) ===
    # rope_gen SOUTH → L0.layer_block (cos/sin row, sliced 4:1 in chip glue)
    rg_south_x = rg_x + 3300 / 2
    rg_south_y = rg_y
    l0_north_x = l0_x + 3000 / 2
    l0_north_y = l0_y + 3500
    ax.annotate("",
                xy=(l0_north_x, l0_north_y),
                xytext=(rg_south_x, rg_south_y),
                arrowprops=dict(arrowstyle="->", color="#d0212e", lw=3))
    ax.text(rg_south_x - 1600, (rg_south_y + l0_north_y) / 2,
            "v11.3 cascade\n4× 256-bit phased\n(chip-level 4:1 slicer\nin open area near rope_gen)\nL0 input",
            ha="center", va="center", fontsize=8, color="#d0212e", weight="bold",
            bbox=dict(boxstyle="round,pad=0.3", facecolor="white", edgecolor="#d0212e"))

    # L0 → L1 forward cascade (registered pass-through)
    l0_east_x = l0_x + 3000
    l0_east_y = l0_y + 3500 / 2
    l1_west_x = l1_x
    l1_west_y = l1_y + 3500 / 2
    ax.annotate("",
                xy=(l1_west_x, l1_west_y),
                xytext=(l0_east_x, l0_east_y),
                arrowprops=dict(arrowstyle="->", color="#d0212e", lw=3))
    ax.text((l0_east_x + l1_west_x) / 2, (l0_east_y + l1_west_y) / 2 + 250,
            "L0 → L1 forward\n(phased 256-bit\nregistered hop)",
            ha="center", va="center", fontsize=8, color="#d0212e", weight="bold",
            bbox=dict(boxstyle="round,pad=0.25", facecolor="white", edgecolor="#d0212e"))

    # === Note: what's missing from this chip ===
    note_text = (
        "What's INSIDE each transformer_layer_block (v11.3):\n"
        "  • rope_apply hardened (~111K cells, cascade I/O, 0 DRC)\n"
        "\n"
        "What's NOT in this chip (standalone per-tile PnR only):\n"
        "  • mac_array × 7 (Q/K/V/O/gate/up/down)\n"
        "  • vector_unit, kv_cache, attention_unit\n"
        "  • embed_rom, lm_head, global_controller, layer_tile\n"
        "  • codebook_decoder, rmsnorm, swiglu, lut_interp\n"
        "\n"
        "Why: composing all per-layer compute into one layer_block hits the\n"
        "561K-cell flat-PnR wall (GPL repair_design hangs). Hierarchical PnR\n"
        "is the path forward. v12 layer_orchestrator (rope_apply + vector_unit,\n"
        "408K cells, 0 DRC standalone) is the first proof of composition."
    )
    ax.text(chip_w / 2, -1800, note_text,
            ha="center", va="top", fontsize=9, family="monospace",
            bbox=dict(boxstyle="round,pad=0.5", facecolor="#fffce8", edgecolor="#888"))

    # === Chip DRT plateau callout ===
    plateau_text = (
        "Chip DRT plateau: ~2M residual violations\n"
        "(architectural ceiling for multi-macro sky130 — \n"
        "  inter-macro channels carry handshake + clock\n"
        "  signals competing for the same routing tracks)"
    )
    ax.text(chip_w + 200, chip_h / 2, plateau_text,
            ha="left", va="center", fontsize=9, color="#a02020",
            bbox=dict(boxstyle="round,pad=0.3", facecolor="#fff0f0", edgecolor="#a02020"))

    # Title and axes
    ax.set_xlim(-300, chip_w + 3200)
    ax.set_ylim(-2500, chip_h + 200)
    ax.set_aspect("equal")
    ax.set_xlabel("x (µm)")
    ax.set_ylabel("y (µm)")
    title = ("OpenTaalas v11.3 multi_layer_chip — ACTUAL Integration (3 macros)\n"
             f"rope_gen + 2× transformer_layer_block · "
             f"~{chip_w/1000:.1f} × {chip_h/1000:.1f} mm")
    ax.set_title(title, fontsize=12, weight="bold")
    ax.grid(True, alpha=0.2, linestyle=":")

    legend_elems = [
        Rectangle((0,0), 1, 1, facecolor="#3a6dd0", alpha=0.55, edgecolor="black",
                  label="Chip-singleton (rope_gen, 2× NOR ROM)"),
        Rectangle((0,0), 1, 1, facecolor="#a25dff", alpha=0.55, edgecolor="black",
                  label="Per-layer transformer_layer_block (v11.3)"),
        Rectangle((0,0), 1, 1, facecolor="#5a2f8c", alpha=0.85, edgecolor="black",
                  label="Hardened sub-block inside layer_block (rope_apply)"),
        Rectangle((0,0), 1, 1, facecolor="#1a1a4d", alpha=0.85, edgecolor="black",
                  label="Macro instance (NOR ROM/SRAM)"),
    ]
    ax.legend(handles=legend_elems, loc="upper left", fontsize=9, framealpha=0.95)

    plt.tight_layout()
    out = "/home/mana/workspace/OpenTaalas/docs/images/multi_layer_floorplan.png"
    os.makedirs(os.path.dirname(out), exist_ok=True)
    plt.savefig(out, dpi=150, bbox_inches="tight")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
