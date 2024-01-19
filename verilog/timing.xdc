
create_clock -period 10.000 -name sys_clk_i_0 [get_ports sys_clk_i_0]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLDOWN [current_design]

set_false_path -from [get_clocks -of_objects [get_pins pll/CLKOUT1]] -to [get_clocks -of_objects [get_pins pll/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins pll/CLKOUT0]] -to [get_clocks -of_objects [get_pins pll/CLKOUT1]]

