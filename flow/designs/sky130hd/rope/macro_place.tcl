# Place ROM macros in rope design (2x nor_rom_4096x1024, 485x2225µm each)
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
set idx 0
foreach inst_name $macros {
    set x [expr {30 + $idx * 520}]
    place_macro -macro_name $inst_name -location "$x 30" -orientation R0
    incr idx
}
