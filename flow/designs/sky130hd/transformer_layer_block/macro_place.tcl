# transformer_layer_block — macro placement (v10, sized for 3500×4500 die)
#
# 22 macros total (post-synth):
#   7× nor_rom_1024x880 (419×566)  mac_array Q/K/V/O/gate/up/down ROMs
#   7× sram_512x32 (137×154)       codebook_decoder grids (inside mac_array)
#   4× sram_8192x8 (254×293)       kv_cache_demo K0/K1/V0/V1
#   2× sram_4096x16 (255×293)      vector_unit gamma_pre_attn/gamma_pre_mlp
#   2× sram_256x16 (78×85)         vector_unit rsqrt_lut/sigmoid_lut
#
# Layout strategy (die 3500 wide × 4500 tall):
#
#   y=4500 +-----------------------------------+
#          | TOP: stdcell zone for rope_apply  |
#          | + vector_unit logic + layer_tile  |
#          | + attention_unit + kv_cache_demo  |
#          | (no macros above y=2500)          |
#   y=2500 +-----------------------------------+
#          |  vector_unit LUTs (sram_256x16)   |  y=2400 row
#          |  vector_unit gamma (sram_4096x16) |  y=2050 row
#          |  KV cache (sram_8192x8 ×4)        |  y=1700 row
#          |  codebook decoders (sram_512x32×7)|  y=1500 row
#          |  mac_array ROMs (nor_rom×7)       |  y=900 row (3 rows for layout)
#   y=200  +-----------------------------------+
#          |  bottom margin                    |
#   y=0    +-----------------------------------+

set block [ord::get_db_block]
set macros {}
foreach inst [$block getInsts] {
    set master [$inst getMaster]
    if {[$master isBlock]} {
        lappend macros $inst
    }
}
puts "==> Found [llength $macros] macros at layer_block top level:"
foreach inst $macros {
    set master_name [[$inst getMaster] getName]
    set inst_name   [$inst getName]
    puts "    inst='$inst_name'  master='$master_name'"
}

# Index counters per macro family
set idx_nor_rom_1024x880 0
set idx_sram_512x32 0
set idx_sram_8192x8 0
set idx_sram_4096x16 0
set idx_sram_256x16 0

foreach inst $macros {
    set inst_name   [$inst getName]
    set master_name [[$inst getMaster] getName]

    if {[string match "*nor_rom_1024x880*" $master_name]} {
        # 7× mac ROMs in a 4×2 grid (4 in row 1 at y=200, 3 in row 2 at y=850).
        # Each is 419×566. Spacing ~80 µm.
        set col [expr $idx_nor_rom_1024x880 % 4]
        set row [expr $idx_nor_rom_1024x880 / 4]
        set x [expr 200 + $col * (419 + 80)]
        set y [expr 200 + $row * (566 + 80)]
        place_macro -macro_name $inst_name -location "$x $y" -orientation R0
        puts "    placed nor_rom_1024x880 #$idx_nor_rom_1024x880 ($inst_name) at ($x, $y) R0"
        incr idx_nor_rom_1024x880
    } elseif {[string match "*sram_512x32*" $master_name]} {
        # 7× codebook SRAMs in a row at y=1500. 137×154 each.
        set x [expr 200 + $idx_sram_512x32 * (137 + 50)]
        set y 1500
        place_macro -macro_name $inst_name -location "$x $y" -orientation R0
        puts "    placed sram_512x32 #$idx_sram_512x32 ($inst_name) at ($x, $y) R0"
        incr idx_sram_512x32
    } elseif {[string match "*sram_8192x8*" $master_name]} {
        # 4× KV cache SRAMs in a row at y=1700. 254×293 each.
        set x [expr 200 + $idx_sram_8192x8 * (254 + 80)]
        set y 1700
        place_macro -macro_name $inst_name -location "$x $y" -orientation R0
        puts "    placed sram_8192x8 #$idx_sram_8192x8 ($inst_name) at ($x, $y) R0"
        incr idx_sram_8192x8
    } elseif {[string match "*sram_4096x16*" $master_name]} {
        # 2× gamma SRAMs in a row at y=2050. 255×293 each.
        set x [expr 200 + $idx_sram_4096x16 * (255 + 80)]
        set y 2050
        place_macro -macro_name $inst_name -location "$x $y" -orientation R0
        puts "    placed sram_4096x16 #$idx_sram_4096x16 ($inst_name) at ($x, $y) R0"
        incr idx_sram_4096x16
    } elseif {[string match "*sram_256x16*" $master_name]} {
        # 2× LUT SRAMs in a row at y=2400. 78×85 each.
        set x [expr 200 + $idx_sram_256x16 * (78 + 50)]
        set y 2400
        place_macro -macro_name $inst_name -location "$x $y" -orientation R0
        puts "    placed sram_256x16 #$idx_sram_256x16 ($inst_name) at ($x, $y) R0"
        incr idx_sram_256x16
    } else {
        puts "WARNING: unexpected macro $inst_name (master=$master_name)"
    }
}

puts "==> Macro placement summary:"
puts "    nor_rom_1024x880: $idx_nor_rom_1024x880 placed (expected 7)"
puts "    sram_512x32:      $idx_sram_512x32 placed (expected 7)"
puts "    sram_8192x8:      $idx_sram_8192x8 placed (expected 4)"
puts "    sram_4096x16:     $idx_sram_4096x16 placed (expected 2)"
puts "    sram_256x16:      $idx_sram_256x16 placed (expected 2)"
