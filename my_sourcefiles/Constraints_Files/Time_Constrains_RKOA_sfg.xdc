create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk];


set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports rst]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports rst]
set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports load_b_i]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports load_b_i]

set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports {Data_A_i[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports {Data_A_i[*]}]
set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports {Data_B_i[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports {Data_B_i[*]}]


#Outputs

set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {sgf_result_o[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports {sgf_result_o[*]}]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
