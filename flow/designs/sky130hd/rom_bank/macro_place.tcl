# Place ROM macro in rom_bank design
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
# Die: 2400x2400, Macro: ~419x566
# Center: (2400-419)/2 ≈ 990, (2400-566)/2 ≈ 917
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "990 917" -orientation R0
}
