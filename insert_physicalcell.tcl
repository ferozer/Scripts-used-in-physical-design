####Adding endcap cells########

add_end_cap -respect_keepout -lib_cell {SHFILL3_RVT}

set_attribute [get_cells -hierarchical -all *endcap* ] is_fixed true
 
##Inserting tap cells###

add_tap_cell_array -master_cell_name SHFILL3_HVT -distance 60 -pattern stagger_every_other_row -respect_keepout -no_1x

set_attribute [get_cells -hierarchical -all *tap*] is_fixed true

