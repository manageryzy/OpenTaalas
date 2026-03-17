# Place 2× nor_rom_4096x1024 macros in rope
# Each macro: ~485×2226 µm, die: 2000×3500
# Side by side with ~200µm gap, ~150µm margin to die edge
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
# Left X: (2000-1170)/2 ≈ 415, Right X: 415+485+200 = 1100
# Center Y: (3500-2226)/2 ≈ 637
set macros [lsort $macros]
set x_positions {415 1100}
set base_y 637
set idx 0
foreach inst_name $macros {
    set x [lindex $x_positions $idx]
    place_macro -macro_name $inst_name -location "$x $base_y" -orientation R0
    incr idx
}
