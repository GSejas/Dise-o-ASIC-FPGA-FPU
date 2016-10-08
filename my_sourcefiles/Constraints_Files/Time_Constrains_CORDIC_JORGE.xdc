create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk];

set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports {data_in[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports {data_in[*]}]
set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports {shift_region_flag[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports {shift_region_flag[*]}]

set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports operation]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports operation]
set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports beg_fsm_cordic]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports beg_fsm_cordic]
set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports rst]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports rst]
set_input_delay -clock [get_clocks clk] -min -add_delay 2.000 [get_ports ack_cordic]
set_input_delay -clock [get_clocks clk] -max -add_delay 3.000 [get_ports ack_cordic]

#Outputs
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {data_output[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports {data_output[*]}]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports overflow_flag]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports overflow_flag]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports zero_flag]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports zero_flag]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports ready_cordic]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports ready_cordic]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports underflow_flag]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports underflow_flag]

set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports busy]
set_output_delay -clock [get_clocks clk] -max -add_delay -3.000 [get_ports busy]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
