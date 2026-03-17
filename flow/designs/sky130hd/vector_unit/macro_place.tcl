# Place 2× nor_rom_4096x1024 macros in vector_unit
# Each macro: ~485×2226 µm, die: 4000×5500
# Place macros near top, cells fill below
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

# Total macro width: 2×485 + 200 gap = 1170
# Center X: (4000-1170)/2 ≈ 1415, Right X: 1415+485+200 = 2100
# Y: near top: 5500 - 2226 - 150 = 3124
set macros [lsort $macros]
set x_positions {1415 2100}
set base_y 3124
set idx 0
foreach inst_name $macros {
    set x [lindex $x_positions $idx]
    place_macro -macro_name $inst_name -location "$x $base_y" -orientation R0
    incr idx
}
