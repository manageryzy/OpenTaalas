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
# Die: 1500×1500 (was 2400×2400 — original 25% util was very wasteful), Macro: ~419×566
# Center: (1500-419)/2 ≈ 540, (1500-566)/2 ≈ 467
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "540 467" -orientation R0
}
