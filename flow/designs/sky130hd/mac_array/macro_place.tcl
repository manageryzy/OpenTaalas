# Place ROM macro in mac_array design
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
    set x [expr {30 + $idx * 450}]
    place_macro -macro_name $inst_name -location "$x 30" -orientation R0
    incr idx
}
