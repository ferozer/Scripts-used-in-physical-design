check_legality -verbose 

check_mv_design -verbose

#source scripts/derive_pg_connection.tcl

check_physical_design -stage pre_clock_opt > /home/feroz/labs/temp/reports

report_clock [get_clocks *] -skew -attributes  > /home/feroz/labs/temp/reports

define_routing_rule clk_rule -widths {M4 0.112 M5 0.112 M6 0.112 M7 0.112} -spacings {M4 0.056 M5 0.056 M6 0.056 M7 0.056}

reset_clock_tree_references

set_clock_tree_references -clock_trees [get_clocks *] -references "NBUFFX2_RVT NBUFFX4_RVT NBUFFX8_RVT NBUFFX16_RVT NBUFFX32_RVT INVX2_RVT INVX4_RVT INVX8_RVT INVX16_RVT INVX32_RVT" -sizing_only -delay_insertion_only

set_clock_tree_options -clock_trees [get_clocks *] -routing_rule clk_rule -target_skew 0.050 -use_default_routing_for_sinks 1 -buffer_relocation TRUE -gate_sizing FALSE -buffer_sizing TRUE -gate_relocation TRUE -max_transition 0.100 -leaf_max_transition 0.100 -max_fanout 32 -target_early_delay 0.200 
