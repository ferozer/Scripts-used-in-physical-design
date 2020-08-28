######Detail placement & Timing Optimization#####
place_opt -effort medium -continue_on_missing_scandef -skip_initial_placement
save_mw_cel -as place_done

psynopt -area_recovery -congestion -continue_on_missing_scandef
save_mw_cel -as place_psynopt_done

#####Quality/sanity checks#######
check_legality -verbose > ./rpts/check_leagality_place.rpt
report_design -physical > ./rpts/report_design_place.rpt
report_timing -nets -input_pins -transition_time -capacitance -max_paths 50 -slack_lesser_than 0 -physical -nosplit > ./rpts/timing_place.rpt
report_threshold_voltage_group > ./rpts/multi_vt_place.rpt
report_power > ./rpts/power_place.rpt
report_qor > ./rpts/qor_place.rpt
report_congestion > ./rpts/congestion_place.rpt
report_design -physical > ./rpts/cell_area_util.rpt
