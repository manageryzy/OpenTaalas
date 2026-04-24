# Place 2× nor_rom_4096x1024 macros in vector_unit.
# After fold=2 refold: each macro is 956×1118 µm (was 485×2226).
# Die: 4000×5500.
#
# Pins are on EAST/WEST edges of macro:
#   dout[1023:0] on EAST (x=956)
#   addr/ce/clk on WEST (x=0)
# Mirror left macro (MY) so 1024 dout pins face the west die edge.
# Right macro stays R0 so its dout faces the east die edge.
# Both addr/clk pin clusters meet in the central gap.
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

# Layout (2× 956×1118 macros side-by-side near top of die):
#   west margin: 600 µm
#   left macro x=600 (orientation MY)
#   gap: 200 µm
#   right macro x=1756 (orientation R0)
#   east margin: 4000 - (1756 + 956) = 1288 µm
# Place near top so 791K stdcells fill below.
# y_base = 5500 - 1118 - 200 = 4182
set macros [lsort $macros]
set placements {
    {600  4182 MY}
    {1756 4182 R0}
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
