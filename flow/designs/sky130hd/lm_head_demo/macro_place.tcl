# Place nor_rom_65536x192 macro in lm_head_demo (now with internal col mux — 210 pins)
# Physical macro: ~1427×2225 µm, die: 1900×2400
# Center macro: x=(1900-1427)/2≈236, y=(2400-2225)/2≈87
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
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "236 87" -orientation R0
}
