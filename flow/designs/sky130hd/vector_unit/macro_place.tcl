# Place 6 macros in vector_unit (4 SRAM + 2 NOR ROM).
# Die: 3000×3500 (v6 shrunk from 4000×5500 after cell count dropped 791K → 127K).
#
# Layout (top of die for memories, cells below):
#
#   y=3468 ─┌──────────────┐  ┌──────────────┐
#           │  cos_table   │  │  sin_table   │   nor_rom_4096x1024 fold=2
#           │   (MY)       │  │   (R0)       │   956×1118 µm
#   y=2350 ─└──────────────┘  └──────────────┘
#                                                  100 µm gap
#   y=2243 ─┌──┐ ┌──┐ ┌─┐ ┌─┐
#           │ga│ │gm│ │rs│ │sg│   sram_4096x16 (255×293), sram_256x16 (78×85)
#   y=1950 ─└──┘ └──┘ └─┘ └─┘
#
#   y=1700 ─ stdcell sea (large) ─
#   y=10  ─
#
# Mirror cos_table (MY) so its 1024-bit dout faces west die edge.
# sin_table (R0) faces east die edge — same trick as rope.
set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros [$inst getName]
    }
}
puts "Found [llength $macros] macros:"
foreach m $macros { puts "  '$m'" }

# Sorted alphabetical name → fixed placement
# Order: _cos_table, _gamma_pre_attn, _gamma_pre_mlp, _rsqrt_lut, _sigmoid_lut, _sin_table
set macros [lsort $macros]
set placements {
    {200  2350 MY}
    {200  1950 R0}
    {550  1950 R0}
    {900  1950 R0}
    {1050 1950 R0}
    {1844 2350 R0}
}
set idx 0
foreach inst_name $macros {
    set p [lindex $placements $idx]
    set x [lindex $p 0]
    set y [lindex $p 1]
    set orient [lindex $p 2]
    place_macro -macro_name $inst_name -location "$x $y" -orientation $orient
    incr idx
}
