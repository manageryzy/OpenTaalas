# Custom PDN for multi_layer_chip — works around layer_block met4 obstruction.
#
# layer_block.lef has met1-met5 ALL marked obstructed (because the hardened
# block uses every metal layer internally). The platform default PDN tries to
# add an internal macro grid (met4 stripes inside the macro) which fails with
# PDN-0233 because there's no room for met4 inside the macro footprint.
#
# Workaround: skip the macro grid entirely. The chip-level met5 power stripes
# are at pitch 27.2 µm and align with every other VDD/VSS strap in the macro
# (the macro has alternating VDD/VSS at 13.6 µm pitch). Chip met5 stripes
# directly overlap macro's met5 power pins, providing electrical connection
# without needing met4 stripes through the macro.
#
# This is the "feed-through" model: chip-level routing uses met5 over the
# macro footprint, doesn't try to penetrate met4 inside.

####################################
# global connections
####################################
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDD$} -power
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDDPE$}
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {^VDDCE$}
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {VPWR}
add_global_connection -net {VDD} -inst_pattern {.*} -pin_pattern {VPB}
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {^VSS$} -ground
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {^VSSE$}
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {VGND}
add_global_connection -net {VSS} -inst_pattern {.*} -pin_pattern {VNB}
global_connect

####################################
# voltage domains
####################################
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}

####################################
# standard cell grid (met1 followpins + met4/met5 stripes)
####################################
define_pdn_grid -name {grid} -voltage_domains {CORE} -pins {met5}
add_pdn_stripe -grid {grid} -layer {met1} -width {0.48} -pitch {5.44} -offset {0} -followpins
add_pdn_stripe -grid {grid} -layer {met4} -width {1.600} -pitch {27.140} -offset {13.570}
add_pdn_stripe -grid {grid} -layer {met5} -width {1.600} -pitch {27.200} -offset {13.600}
add_pdn_connect -grid {grid} -layers {met1 met4}
add_pdn_connect -grid {grid} -layers {met4 met5}

####################################
# macro grids — NONE.
# layer_block / rope_gen / rope_apply / nor_rom / sram macros all have met5
# power pins pre-routed at sky130 standard pitch. Chip met5 stripes overlap
# them directly. No internal met4 macro grid needed.
####################################
