# Place 2 ROM macros in vector_unit (2× nor_rom_4096x1024, each ~485×2225µm)
# Same layout as rope which routed successfully at 5000×5000
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

# Center 2 macros: grid = 2×485 + 300 gap = 1270µm wide
# Center X: (5000-1270)/2 = 1865
# Center Y: (5000-2225)/2 = 1388
set macros [lsort $macros]
set idx 0
foreach inst_name $macros {
    set x [expr {1865 + $idx * 785}]
    place_macro -macro_name $inst_name -location "$x 1388" -orientation R0
    incr idx
}
