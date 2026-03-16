# Place 8 SRAM macros in kv_cache_demo (8× sram_4096x8, each ~27×4442µm)
# Pins at bottom of macro (y < 20µm) — place macros at top, cells + routing below
# Die: 1200×5000, 2 groups of 4 macros with routing channel between
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

# Sort for deterministic placement
set macros [lsort $macros]

# Layout: 2 groups of 4, spaced across die width
# Macro width: 26.68, gap between macros: 50µm
# Group width: 4*26.68 + 3*50 = 256.72
# Total: 2*256.72 + 200 center gap = 713.44
# Left group start X: (1200-713.44)/2 = 243
# Right group start X: 243 + 256.72 + 200 = 699.72
# Y: place at top so pins (at y=0 of macro) face down toward cells
# Macro height: 4441.76, die height: 5000
# Y = 5000 - 4442 - 10 margin = 548 (bottom of macro)
set left_x 243
set right_x 700
set base_y 540
set gap 76.68

set idx 0
foreach inst_name $macros {
    if {$idx < 4} {
        set x [expr {$left_x + $idx * $gap}]
    } else {
        set x [expr {$right_x + ($idx - 4) * $gap}]
    }
    place_macro -macro_name $inst_name -location "$x $base_y" -orientation R0
    incr idx
}
