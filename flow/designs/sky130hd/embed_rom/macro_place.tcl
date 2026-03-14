# Place monolithic nor_rom_65536x192 macro (~103x35404µm)
# Pins are at bottom 80µm of macro — place with bottom near die bottom
# Die: 600x36000, macro at left edge, cells in right strip
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

if {[llength $macros] != 1} {
    puts "ERROR: Expected 1 macro, found [llength $macros]"
    return
}

# Place macro at left side, bottom-aligned
# Macro is 102.58 wide, die is 600 wide → 497µm for cells on the right
# Leave 10µm margin from core edge
set inst_name [lindex $macros 0]
# Core: (10.12, 10.88) to (589.72, 35988.32)
# Macro: 102.58 × 35403.52
# Place at left of core, vertically centered
# Center Y: (10.88 + 35988.32)/2 = 17999.6, macro half-height = 17701.76
# Y = 17999.6 - 17701.76 = 297.84
place_macro -macro_name $inst_name -location "11 298" -orientation R0
