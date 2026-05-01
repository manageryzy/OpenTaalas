# Place 2× nor_rom_4096x1024 fold=2 macros in rope_gen.
# Match proven rope layout exactly — same die, same y_base, same orientations.
# Die: 3000×3300, mirrored MY/R0 so dout faces opposite die edges.
#
# Each macro: 956×1118 µm. Pin sides:
#   dout[1023:0] on EAST (x=956)
#   addr[11:0], ce, clk on WEST (x=0)
#
# Layout (vertically centered):
#   left macro x=200 (orientation MY, dout faces west)
#   gap: 200 µm
#   right macro x=1356 (orientation R0, dout faces east)
#   east margin: 3000 - (1356 + 956) = 688 µm
# y_base = (3300 - 1118)/2 = 1091 (matches original rope)
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

set macros [lsort $macros]
set placements {
    {200  1091 MY}
    {1356 1091 R0}
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
