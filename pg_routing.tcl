derive_pg_connection -power_pin VDD -ground_pin VSS -power_net VDD -ground_net VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie

create_power_straps  -direction horizontal  -start_at 5 -num_placement_strap 113 -increment_x_or_y 7 -nets  {VSS VDD} -layer M9 -width 2 -keep_floating_wire_pieces

create_power_straps  -direction vertical  -start_at 5 -num_placement_strap 113 -increment_x_or_y 7 -nets  {VSS VDD} -layer M8 -width 2 -keep_floating_wire_pieces

preroute_standard_cells -route_pins_on_layer M1  -connect both -avoid_merging_vias -do_not_route_over_macros -fill_empty_rows -route_type {P/G Std. Cell Pin Conn}iles -max_tluplus $max_tluplus -min_tluplus $min_tluplus -tech2itf_map $tech2itf_map
