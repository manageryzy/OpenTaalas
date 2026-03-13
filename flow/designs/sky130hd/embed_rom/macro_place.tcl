# Place all macro instances for embed_rom (16x nor_rom_4096x192, each ~103x2225µm)
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

# Place in 4 columns x 4 rows, centered in 5000x9800 die
# Grid: 4×103 + 3×300 = 1312µm wide, 4×2225 + 3×120 = 9260µm tall
set tile_w 103.0
set tile_h 2225.0
set x_gap 300.0
set y_gap 120.0
set x_start 1844.0
set y_start 270.0

set idx 0
foreach inst_name $macros {
    set col [expr {$idx / 4}]
    set row [expr {$idx % 4}]
    set x [expr {$x_start + $col * ($tile_w + $x_gap)}]
    set y [expr {$y_start + $row * ($tile_h + $y_gap)}]
    place_macro -macro_name $inst_name -location "$x $y" -orientation R0
    incr idx
}
