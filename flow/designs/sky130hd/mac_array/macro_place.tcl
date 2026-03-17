# Place nor_rom_1024x880 macro in mac_array
# Macro: ~419×565 µm, die: 2500×3000
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

# Center: X=(2500-419)/2≈1041, Y=(3000-565)/2≈1218
set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "1041 1218" -orientation R0
}
