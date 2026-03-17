# Place folded nor_rom_65536x192_phys macro in embed_rom
# Physical macro: ~1427×2225 µm, die: 2000×3000
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

# Expect 1 macro (nor_rom_65536x192_phys)
# Center: X=(2000-1427)/2≈287, Y=(3000-2225)/2≈388
set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "287 388" -orientation R0
}
