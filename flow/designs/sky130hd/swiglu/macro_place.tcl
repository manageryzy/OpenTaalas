# Place 3× sram_256x16 macros along the top of the swiglu die.
# Each macro is ~78×85 µm. Die: 700×700.
# Top row: y = 700 - 85 - 50 = 565 (50 µm margin from top edge for met4 PDN).
# Spread 3 macros horizontally with ~150 µm spacing for met1 channel routing.
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
    {100 565}
    {300 565}
    {500 565}
}
set idx 0
foreach inst_name $macros {
    set p [lindex $placements $idx]
    set x [lindex $p 0]
    set y [lindex $p 1]
    place_macro -macro_name $inst_name -location "$x $y" -orientation R0
    incr idx
}
