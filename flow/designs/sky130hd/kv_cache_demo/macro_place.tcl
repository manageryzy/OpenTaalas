# Place 4 SRAM macros in kv_cache_demo (4× sram_8192x8 with col_mux=32, ~254×293µm each)
# Layout: 2 columns × 2 rows grid centered in 595×710 die
# Macro architecture: 2 tiles per K array + 2 per V array = 4 total (was 8 with sram_4096x8)
# Wider/squarer macro reduces total macro count and improves floorplan density.
# Pins on left edge (clk/ce/we/addr/din), output pins on right edge (dout)
# 40µm channels between macros, target margins: x=23, y=42.5

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

# Macro footprint: 254.5 × 292.5 (snapped 254.840 × 293.760)
set mw 254.84
set mh 293.76
set cols 2
set chan_x 40
set chan_y 40

# Macro band: cols*mw + (cols-1)*chan_x = 549.7 wide
#             rows*mh + (rows-1)*chan_y = 627.5 tall
# Centered in 595×710 die: x_margin=22.7, y_margin=41.2
set margin_x 22.7
set y_bot 38.7
set y_top [expr {$y_bot + $mh + $chan_y}]

set idx 0
foreach inst_name $macros {
    set col [expr {$idx % $cols}]
    set row [expr {$idx / $cols}]
    set x [expr {$margin_x + $col * ($mw + $chan_x)}]
    set y [expr {$row == 0 ? $y_bot : $y_top}]
    place_macro -macro_name $inst_name -location "$x $y" -orientation R0
    puts "  placed $inst_name at ($x, $y)"
    incr idx
}
