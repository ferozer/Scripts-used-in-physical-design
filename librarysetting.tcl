# Search Path #
set_app_var search_path "/home/tools/libraries/28nm"

# Timing & Power Library #
set_app_var link_library "* /home/tools/libraries/28nm/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p95v125c.db /home/tools/libraries/28nm/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95v125c.db /home/tools/libraries/28nm/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95v125c.db /home/tools/libraries/28nm/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/sram_lp_new/db_nldm/saed32sramlp_ss0p95v125c_i0p95v.db /home/tools/libraries/28nm/lib/sram/db_nldm/saed32sram_ss0p95v125c.db /home/tools/libraries/28nm/lib/pll/db_nldm/saed32pll_ss0p95v125c_2p25v.db"

# Target Library #
set_app_var target_library "/home/tools/libraries/28nm/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p95v125c.db"

# Tech-File -- 28nm #
set tech_file "/home/tools/libraries/28nm/tech/milkyway/saed32nm_1p9m_mw.tf"

# Physical Library - FRAM #
set ref_mw_libs "/home/tools/libraries/28nm/lib/pll/milkyway/SAED32_PLL_FR /home/tools/libraries/28nm/lib/sram_lp/milkyway/saed32sram_lp /home/tools/libraries/28nm/lib/sram/milkyway/SRAM32NM /home/tools/libraries/28nm/lib/stdcell_hvt/milkyway/saed32nm_hvt_1p9m /home/tools/libraries/28nm/lib/stdcell_lvt/milkyway/saed32nm_lvt_1p9m /home/tools/libraries/28nm/lib/stdcell_rvt/milkyway/saed32nm_rvt_1p9m"

# TLU+ Settings #
set max_tluplus /home/tools/libraries/28nm/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus
set min_tluplus /home/tools/libraries/28nm/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus
set tech2itf_map /home/tools/libraries/28nm/tech/star_rcxt/saed32nm_tf_itf_tluplus.map

set_tlu_plus_files -max_tluplus $max_tluplus -min_tluplus $min_tluplus -tech2itf_map $tech2itf_map
