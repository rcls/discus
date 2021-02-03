set_property BEL RAMB18E1 [get_cells memory_reg]
set_property LOC RAMB18_X1Y27 [get_cells memory_reg]

set_property BEL RAMB18E1 [get_cells prgram_reg]
set_property LOC RAMB18_X1Y26 [get_cells prgram_reg]


# IO pins.
set_property IOSTANDARD LVCMOS33 [get_ports {BASE_UART0_rxd BASE_UART0_txd}]
set_property PACKAGE_PIN A8 [get_ports BASE_UART0_rxd]

set_property DRIVE 12 [get_ports BASE_UART0_txd]
set_property SLEW SLOW [get_ports BASE_UART0_txd]
set_property PACKAGE_PIN B8 [get_ports BASE_UART0_txd]

set_property IOSTANDARD SSTL15 [get_ports sys_clk_i_0]
set_property PACKAGE_PIN F4 [get_ports sys_clk_i_0]

set_property SLEW SLOW [get_ports {LED_RED_XA_SC USERLED FLED1 FLED2}]
set_property DRIVE 12 [get_ports {LED_RED_XA_SC USERLED FLED1 FLED2}]

set_property IOSTANDARD LVCMOS15 [get_ports LED_RED_XA_SC]

set_property IOSTANDARD LVCMOS33 [get_ports {USERLED FLED1 FLED2}]

set_property PACKAGE_PIN G3 [get_ports LED_RED_XA_SC]
set_property PACKAGE_PIN L15 [get_ports USERLED]
set_property PACKAGE_PIN K6 [get_ports FLED1]
set_property PACKAGE_PIN U8 [get_ports FLED2]


#create_pblock pblock_io
#add_cells_to_pblock [get_pblocks pblock_io] [get_cells -quiet [list io]]
#resize_pblock [get_pblocks pblock_io] -add {SLICE_X66Y55:SLICE_X73Y61}
#resize_pblock [get_pblocks pblock_io] -add {RAMB18_X2Y22:RAMB18_X2Y25}
#resize_pblock [get_pblocks pblock_io] -add {RAMB36_X2Y11:RAMB36_X2Y12}
