# Place macros in mac_array — die: 1800×2400 (v8 multi-layer shrink)
# Macros (after codebook_decoder integration, post v6):
#   1× nor_rom_1024x880  (419×565 µm) — INT3 weight ROM (the dominant macro)
#   1× sram_512x32       (137×154 µm) — codebook _grid (much smaller)
# Place ROM centered (proven v6 placement); tuck SRAM into the bottom-left
# corner where it doesn't fight the ROM's dout escape.
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

# Per-macro placement keyed by master cell name (more robust than positional).
foreach inst_name $macros {
    set inst [$block findInst $inst_name]
    set master_name [[$inst getMaster] getName]
    if {[string match "nor_rom_1024x880*" $master_name]} {
        # ROM centered: X=(1800-419)/2≈691, Y=(2400-565)/2≈918
        place_macro -macro_name $inst_name -location "691 918" -orientation R0
    } elseif {[string match "sram_512x32*" $master_name]} {
        # SRAM tucked in bottom-left corner (avoids ROM east-dout escape lane)
        place_macro -macro_name $inst_name -location "50 50" -orientation R0
    } else {
        puts "WARNING: unknown macro master $master_name for instance $inst_name"
        place_macro -macro_name $inst_name -location "50 1900" -orientation R0
    }
}
