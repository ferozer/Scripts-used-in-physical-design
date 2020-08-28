#sanity checks
check_legality -verbose
check_mv_design -verbose > /home/feroz/labs/temp/valcano_design/routing_reports/check_mv_design.rpt
#source scripts/derive_pg_connection.tcl
derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS
#derive_pg_connection -power_net VDD -ground_net VSS -tie
check_mv_design -verbose > /home/feroz/labs/temp/valcano_design/routing_reports/check_mv_design.rpt
check_physical_design -stage pre_route_opt > /home/feroz/labs/temp/valcano_design/routing_reports/check_physical_design.rpt

# Collect the ideal nets
all_ideal_nets
all_high_fanout -nets -threshold 100

# check routability
check_routeability
check_zrt_routability

# Routing options
set_clock_tree_options -routing_rule clk_rule -clock_trees [all_clocks ]
set_route_options -track_assign_timing_driven true
set_route_zrt_track_options -crosstalk_driven true -timing_driven true
set_route_zrt_global_options -timing_driven true
set_ignored_layers -max_routing_layer M6 -min_routing_layer M2
set_route_zrt_common_options -global_min_layer_mode allow_pin_connection
set_route_zrt_common_options -global_max_layer_mode soft

# Crosstalk related switches
set_si_options -route_xtalk_prevention true
set_si_options -delta_delay true
set_delay_calculation_options -routed_clock arnoldi
set_route_zrt_common_options -plan_group_aware all_routing

# Verify routing rules
report_route_options
report_net_routing_layer_constraints [get_nets *]
report_route_zrt_common_options
report_route_zrt_track_options
report_route_zrt_global_options
report_route_zrt_detail_options

# Route
route_zrt_group -all_clock_nets -reuse_existing_global_route true
route_zrt_global
route_zrt_track
route_zrt_detail -max_number_iterations 20
save_mw_cel -as leon

# Final; sanity checks
report_qor
report_constraint -all_violators
report_timing -delay_type max > /home/feroz/labs/temp/valcano_design/routing_reports/setup_violations.rpt
