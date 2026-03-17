# Place folded nor_rom_65536x192_phys macro in lm_head_demo
# Physical macro: ~1427×2225 µm, die: 3200×3200
# Center macro with routing channels on all sides
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
    place_macro -macro_name $inst_name -location "887 488" -orientation R0
}
