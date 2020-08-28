# Load the library settings #
source ./scripts/library_settings_28nm_volcano.tcl

# Top Cell #
set top_cell volcano

# Verilog Netlist #
set input_verilog "./inputs/volcano.v"

# SDC #
set input_sdc_func "./inputs/volcano_func.sdc"

# Move the existing MW lib #
set date [sh date +%F_%H_%M]
catch {sh mv mwdb/${top_cell}.mw mwdb/${top_cell}.mw_old_${date}}

# Create the MW Lib #
create_mw_lib -technology $tech_file -mw_reference_library $ref_mw_libs -open mwdb/${top_cell}.mw

# Load the TLU+ Files #

set_tlu_plus_files -max_tluplus $max_tluplus -min_tluplus $min_tluplus -tech2itf_map $tech2itf_map

# Read the Verilog Netlist #
import_designs -format verilog $input_verilog

# Read the SDC #
read_sdc $input_sdc_func

# Link the timing library #
link > rpts/link_timing_lib.rpt

# Link the Physical Library #
link_physical_library > rpts/link_physical_lib.rpt

# Sanity Checks #
check_design -summary > rpts/check_design.summary
check_design > rpts/check_design.full.rpt
check_timing
check_timing > rpts/check_timing.full.rpt

# Derive PG Connection #
derive_pg_connection -power_pin VDD -ground_pin VSS -power_net VDD -ground_net VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie

# Save MW cel #
save_mw_cel -as ${top_cell}_imported
