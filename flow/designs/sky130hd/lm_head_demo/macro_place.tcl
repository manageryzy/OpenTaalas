# Place monolithic nor_rom_65536x192 macro (~103x35404µm)
# Same macro and layout as embed_rom — proven to route
# Die: 600x36000
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

set inst_name [lindex $macros 0]
# Core: (10.12, 10.88) to (589.72, 35988.32)
# Macro: 102.58 × 35403.52
# Place at left of core, vertically centered
place_macro -macro_name $inst_name -location "11 298" -orientation R0
