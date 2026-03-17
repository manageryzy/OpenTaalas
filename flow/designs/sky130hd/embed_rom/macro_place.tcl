# Place folded nor_rom_65536x192_phys macro in embed_rom
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

# Expect 1 macro (nor_rom_65536x192_phys)
# Center: X=(3200-1427)/2≈887, Y=(3200-2225)/2≈488
set macros [lsort $macros]
foreach inst_name $macros {
    place_macro -macro_name $inst_name -location "887 488" -orientation R0
}
