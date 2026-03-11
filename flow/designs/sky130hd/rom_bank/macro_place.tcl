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

# Place macro at bottom-left with margin
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "30 30" -orientation R0
}
