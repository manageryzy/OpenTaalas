# Place 5× sram_512x32 macros along top of codebook_decoder die.
# Each macro: 137×154 µm. Die: 800×800.
# Top row: y = 800 - 154 - 50 = 596.
# Spread 5 macros horizontally: pitch ~150 µm.
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
    {30  596}
    {180 596}
    {330 596}
    {480 596}
    {630 596}
}
set idx 0
foreach inst_name $macros {
    set p [lindex $placements $idx]
    set x [lindex $p 0]
    set y [lindex $p 1]
    place_macro -macro_name $inst_name -location "$x $y" -orientation R0
    incr idx
}
