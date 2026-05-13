# multi_layer_chip — top-level chip macro placement (v10 — layer_block tiles)
#
# Three tile macros (instantiated by multi_layer_chip_wrapper.sv):
#   u_rope_gen   : 3000 wide × 3300 tall   (master = rope_gen)
#   u_l0_block   : ?    wide × ?    tall   (master = transformer_layer_block)
#   u_l1_block   : ?    wide × ?    tall   (master = transformer_layer_block)
#
# Layer_block dimensions: TBD — extracted from the layer_block PnR run. Initial
# transformer_layer_block ORFS DIE_AREA is 6000×8000 µm but real footprint will
# differ once cells are placed. Update layer_w/layer_h below after first run.
#
# Layout intent:
#
#   +-----------------------------------------------+
#   |  TOP BAND  (singletons, ~3.3 mm tall)         |
#   |    [rope_gen 3000×3300 centered]              |
#   |       │ cos/sin 1024b SOUTH ↓                 |
#   +-----------------------------------------------+
#   |  CHANNEL (200 µm)                             |
#   +-----------------------------------------------+
#   |  BOTTOM BAND (2× layer_block side-by-side)    |
#   |  +---layer_block L0---+ +---layer_block L1--+ |
#   |  | rope_apply tucked   | | rope_apply tucked | |
#   |  | inside each block   | | inside each block | |
#   |  | cos/sin internal    | | cos/sin internal  | |
#   |  +---------------------+ +-------------------+ |
#   |        ↑ cos_out EAST → cos_in WEST ↑         |
#   |          200 µm cascade hop                   |
#   +-----------------------------------------------+

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

# v10 (shrunk): rope_gen above L0 (left column), L1 to the right of L0.
# Cascade direction: rope_gen.south → L0.cos_in (north→west wrap)
#                    L0.cos_out_east → L1.cos_in_west (200 µm channel)
set layer_w 3000
set layer_h 3500
set rope_gen_w 3000
set rope_gen_h 3300

set die_w 6300
set die_h 7100

set layer_idx 0
foreach inst $macros {
    set inst_name   [$inst getName]
    set master_name [[$inst getMaster] getName]
    if {$master_name eq "rope_gen"} {
        # Above L0 in the upper-left band (50, 3750)
        place_macro -macro_name $inst_name -location "50 3750" -orientation R0
        puts "    placed rope_gen $inst_name at (50, 3750) R0"
    } elseif {$master_name eq "transformer_layer_block"} {
        # 2× layer_block (3000×3500) side-by-side in BOTTOM band.
        # L0 at (50, 50); L1 at (3250, 50) with 200 µm cascade channel.
        if {$layer_idx == 0} {
            place_macro -macro_name $inst_name -location "50 50" -orientation R0
            puts "    placed transformer_layer_block $inst_name (L0) at (50, 50) R0"
        } else {
            place_macro -macro_name $inst_name -location "3250 50" -orientation R0
            puts "    placed transformer_layer_block $inst_name (L1) at (3250, 50) R0"
        }
        incr layer_idx
    } else {
        puts "WARNING: unexpected chip-level macro $inst_name (master=$master_name)"
    }
}
