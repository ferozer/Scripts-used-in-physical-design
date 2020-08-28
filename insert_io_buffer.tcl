proc insert_io_buffer {buf} {
  foreach_in_collection each_port [get_ports *] {
    set port_name [get_object_name $each_port]
    insert_buffer -new_cell_names io_buff [get_ports $port_name] $buf
  }
  get_flat_cells *io_buff*
  magnet_placement -logical_level 1 [get_ports *] -mark_fixed
  set_dont_touch [get_cells *io_buf*] true
}

insert_io_buffer NBUFFX4_RVT

set_attribute [get_cells io_buff*] is_fixed false
legalize_placement -cells io_buf*
set_attribute [get_cells io_buff*] is_fixed true
