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

# Center macro in die — gives equal routing space for pins on both edges
# Die: 2000x2000, Macro: ~419x566
# Center: (2000-419)/2 ≈ 790, (2000-566)/2 ≈ 717
set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "790 717" -orientation R0
}
