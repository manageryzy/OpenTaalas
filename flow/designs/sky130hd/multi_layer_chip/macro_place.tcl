# multi_layer_chip — top-level chip macro placement (hierarchical PnR v9)
#
# Three tile macros (instantiated by multi_layer_chip_wrapper.sv):
#   u_rope_gen  : 3000 wide × 3300 tall   (master = rope_gen)
#   u_l0_ra     : 2800 wide × 2800 tall   (master = rope_apply)
#   u_l1_ra     : 2800 wide × 2800 tall   (master = rope_apply)
#
# Chip layout (6000 wide × 6500 tall die):
#
#   y=6500 +--------------------------------+
#          |                                |
#          |  TOP BAND (y=3500..6500)       |
#          |  +--rope_gen 3000×3300--+      |
#          |  |  centered at x=1500  |      |  rope_gen at x=1500, y=3500
#          |  |                      |      |
#          |  +----------------------+      |
#   y=3500 +--------------------------------+
#          |  CHANNEL (y=3300..3500)        |  200 µm strap channel
#   y=3300 +--------------------------------+
#          | BOTTOM BAND (y=200..3000)      |
#          | +--L0.ra 2800x2800-+ +-L1.ra-+ |
#          | |  cos_in (LEFT)   | |       | |  L0 at x=200..3000
#          | |  cos_out (RIGHT)→| |←(LEFT)| |  L1 at x=3200..6000
#          | |  sin_in (TOP)    | |       | |  channel = 200 µm
#          | |  sin_out (BOTTOM)| |       | |
#          | +------------------+ +-------+ |
#   y=200  +--------------------------------+
#          |  bottom margin                 |
#   y=0    +--------------------------------+
#
# Cascade routing:
#   rope_gen → L0.ra: rope_gen south edge → L0.ra north edge (~200µm hop)
#                     and rope_gen south → L0.ra west (cos_in) — longer L-shape
#   L0.ra → L1.ra:    L0.ra east (cos_out) → L1.ra west (cos_in) ✓ short hop
#                     L0.ra south (sin_out) → L1.ra north (sin_in) — needs wrap
#
# The DRT will do its best with the inter-tile wires; SDC budgets 0.2*clk_period
# for input/output_delay which is generous for sub-mm hops.

set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros $inst
    }
}
puts "==> Found [llength $macros] macros at chip top level:"
foreach inst $macros {
    set master_name [[$inst getMaster] getName]
    puts "    inst='[$inst getName]'  master='$master_name'"
}

# Per-master placement — match by master name, not instance name (more robust
# to Yosys naming changes).
set rope_apply_idx 0
foreach inst $macros {
    set inst_name   [$inst getName]
    set master_name [[$inst getMaster] getName]
    if {$master_name eq "rope_gen"} {
        # Center rope_gen (3000×3300) horizontally in TOP band.
        # die=6000×6500 → core ~10..5990 / 11..6490
        # y_origin: top edge at core top (6489) → y = 6489-3300 = 3189
        # x_origin: center → (6000-3000)/2 = 1500 → ends at 4500 < 5990 ✓
        place_macro -macro_name $inst_name -location "1500 3189" -orientation R0
        puts "    placed rope_gen $inst_name at (1500, 3189) R0"
    } elseif {$master_name eq "rope_apply"} {
        # Two rope_apply tiles side-by-side in BOTTOM band (2800×2800 each).
        # L0 at x=200..3000, L1 at x=3100..5900 (100µm channel, 90µm margins).
        # Both at y=200..3000 (bottom band ends 189µm below rope_gen).
        if {$rope_apply_idx == 0} {
            place_macro -macro_name $inst_name -location "200 200" -orientation R0
            puts "    placed rope_apply $inst_name (L0) at (200, 200) R0"
        } else {
            place_macro -macro_name $inst_name -location "3100 200" -orientation R0
            puts "    placed rope_apply $inst_name (L1) at (3100, 200) R0"
        }
        incr rope_apply_idx
    } else {
        puts "WARNING: unexpected chip-level macro $inst_name (master=$master_name)"
    }
}
