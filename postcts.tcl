clock_opt
save_mw_cel -as CTS_1
#REPORTING The DESIGN for ANalysis
report_clock -skew -attributes >> /home/feroz/labs/temp/valcano_design/post_cts.rpt/clockreport.rpt
report_clock_tree -summary -local_skew >> /home/feroz/labs/temp/valcano_design/post_cts.rpt/CTreport.rpt
report_clock_timing -type skew significant_digits 3 >> /home/feroz/labs/temp/valcano_design/post_cts.rpt/ClockTiming.rpt
report_timing -delay_type max
report_timing -delay_type min
# If any hold violations try fix using following commands
set_fix_hold [all_clocks]
set_max_area 0
set physopt area_critical_range 0.1
psynopt -area_recovery
# Again try reporting the design for violation
report_timing -delay_type min

report_threshold_voltage_group > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_voltage_groups.rpt
report_power > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_power.rpt
report_clock_tree > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_clock_tree.rpt
report_timing -delay_type max -nosplit > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_timing_setup.rpt
report_timing -delay_type min -nosplit > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_timing_hold.rpt
report_qor > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_qor.rpt
report_congestion > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_congestion.rpt
report_design -physical > /home/feroz/labs/temp/valcano_design/post_cts.rpt/cts_cell_utilization.rpt

#If NO violations CTS step was completed. You can generate the report whatever you want and you can save the deaign for doing routing
save_mw_cel -as Leon_CTS_Completed


