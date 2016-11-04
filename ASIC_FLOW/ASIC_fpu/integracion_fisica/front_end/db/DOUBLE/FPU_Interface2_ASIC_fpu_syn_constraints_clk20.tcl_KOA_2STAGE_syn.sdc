###################################################################

# Created by write_sdc on Thu Nov  3 19:56:37 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 15 [current_design]
set_max_area 0
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports begin_operation]
set_driving_cell -lib_cell TBUFX20TS [get_ports ack_operation]
set_driving_cell -lib_cell TBUFX20TS [get_ports {operation[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {operation[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {operation[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {region_flag[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {region_flag[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_1[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_2[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {r_mode[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {r_mode[0]}]
create_clock [get_ports clk]  -period 20  -waveform {0 10}
set_clock_latency 1  [get_clocks clk]
set_clock_latency -source 1  [get_clocks clk]
set_clock_uncertainty -setup 1  [get_clocks clk]
set_clock_uncertainty -hold 0  [get_clocks clk]
set_clock_transition -max -rise 1 [get_clocks clk]
set_clock_transition -max -fall 1 [get_clocks clk]
set_clock_transition -min -rise 1 [get_clocks clk]
set_clock_transition -min -fall 1 [get_clocks clk]
set_input_delay -clock clk  -max 6  [get_ports rst]
set_input_delay -clock clk  -min 3  [get_ports rst]
set_input_delay -clock clk  -max 6  [get_ports begin_operation]
set_input_delay -clock clk  -min 3  [get_ports begin_operation]
set_input_delay -clock clk  -max 6  [get_ports ack_operation]
set_input_delay -clock clk  -min 3  [get_ports ack_operation]
set_input_delay -clock clk  -max 6  [get_ports {operation[2]}]
set_input_delay -clock clk  -min 3  [get_ports {operation[2]}]
set_input_delay -clock clk  -max 6  [get_ports {operation[1]}]
set_input_delay -clock clk  -min 3  [get_ports {operation[1]}]
set_input_delay -clock clk  -max 6  [get_ports {operation[0]}]
set_input_delay -clock clk  -min 3  [get_ports {operation[0]}]
set_input_delay -clock clk  -max 6  [get_ports {region_flag[1]}]
set_input_delay -clock clk  -min 3  [get_ports {region_flag[1]}]
set_input_delay -clock clk  -max 6  [get_ports {region_flag[0]}]
set_input_delay -clock clk  -min 3  [get_ports {region_flag[0]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[63]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[63]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[62]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[62]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[61]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[61]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[60]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[60]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[59]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[59]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[58]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[58]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[57]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[57]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[56]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[56]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[55]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[55]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[54]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[54]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[53]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[53]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[52]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[52]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[51]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[51]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[50]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[50]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[49]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[49]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[48]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[48]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[47]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[47]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[46]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[46]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[45]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[45]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[44]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[44]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[43]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[43]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[42]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[42]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[41]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[41]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[40]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[40]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[39]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[39]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[38]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[38]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[37]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[37]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[36]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[36]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[35]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[35]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[34]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[34]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[33]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[33]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[32]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[32]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[31]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[31]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[30]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[30]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[29]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[29]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[28]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[28]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[27]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[27]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[26]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[26]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[25]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[25]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[24]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[24]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[23]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[23]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[22]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[22]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[21]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[21]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[20]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[20]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[19]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[19]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[18]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[18]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[17]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[17]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[16]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[16]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[15]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[15]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[14]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[14]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[13]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[13]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[12]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[12]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[11]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[11]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[10]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[10]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[9]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[9]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[8]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[8]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[7]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[7]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[6]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[6]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[5]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[5]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[4]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[4]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[3]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[3]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[2]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[2]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[1]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[1]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_1[0]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_1[0]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[63]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[63]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[62]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[62]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[61]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[61]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[60]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[60]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[59]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[59]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[58]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[58]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[57]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[57]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[56]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[56]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[55]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[55]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[54]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[54]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[53]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[53]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[52]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[52]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[51]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[51]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[50]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[50]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[49]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[49]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[48]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[48]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[47]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[47]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[46]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[46]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[45]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[45]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[44]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[44]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[43]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[43]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[42]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[42]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[41]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[41]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[40]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[40]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[39]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[39]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[38]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[38]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[37]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[37]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[36]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[36]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[35]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[35]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[34]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[34]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[33]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[33]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[32]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[32]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[31]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[31]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[30]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[30]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[29]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[29]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[28]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[28]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[27]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[27]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[26]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[26]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[25]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[25]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[24]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[24]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[23]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[23]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[22]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[22]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[21]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[21]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[20]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[20]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[19]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[19]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[18]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[18]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[17]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[17]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[16]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[16]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[15]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[15]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[14]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[14]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[13]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[13]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[12]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[12]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[11]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[11]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[10]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[10]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[9]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[9]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[8]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[8]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[7]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[7]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[6]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[6]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[5]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[5]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[4]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[4]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[3]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[3]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[2]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[2]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[1]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[1]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_2[0]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_2[0]}]
set_input_delay -clock clk  -max 6  [get_ports {r_mode[1]}]
set_input_delay -clock clk  -min 3  [get_ports {r_mode[1]}]
set_input_delay -clock clk  -max 6  [get_ports {r_mode[0]}]
set_input_delay -clock clk  -min 3  [get_ports {r_mode[0]}]
set_output_delay -clock clk  -max 5  [get_ports overflow_flag]
set_output_delay -clock clk  -min 3  [get_ports overflow_flag]
set_output_delay -clock clk  -max 5  [get_ports underflow_flag]
set_output_delay -clock clk  -min 3  [get_ports underflow_flag]
set_output_delay -clock clk  -max 5  [get_ports NaN_flag]
set_output_delay -clock clk  -min 3  [get_ports NaN_flag]
set_output_delay -clock clk  -max 5  [get_ports operation_ready]
set_output_delay -clock clk  -min 3  [get_ports operation_ready]
set_output_delay -clock clk  -max 5  [get_ports {op_result[63]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[63]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[62]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[62]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[61]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[61]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[60]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[60]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[59]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[59]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[58]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[58]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[57]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[57]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[56]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[56]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[55]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[55]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[54]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[54]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[53]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[53]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[52]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[52]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[51]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[51]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[50]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[50]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[49]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[49]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[48]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[48]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[47]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[47]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[46]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[46]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[45]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[45]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[44]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[44]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[43]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[43]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[42]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[42]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[41]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[41]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[40]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[40]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[39]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[39]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[38]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[38]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[37]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[37]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[36]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[36]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[35]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[35]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[34]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[34]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[33]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[33]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[32]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[32]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[31]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[31]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[30]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[30]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[29]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[29]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[28]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[28]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[27]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[27]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[26]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[26]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[25]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[25]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[24]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[24]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[23]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[23]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[22]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[22]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[21]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[21]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[20]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[20]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[19]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[19]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[18]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[18]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[17]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[17]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[16]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[16]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[15]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[15]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[14]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[14]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[13]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[13]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[12]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[12]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[11]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[11]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[10]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[10]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[9]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[9]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[8]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[8]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[7]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[7]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[6]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[6]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[5]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[5]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[4]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[4]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[3]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[3]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[2]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[2]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[1]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[1]}]
set_output_delay -clock clk  -max 5  [get_ports {op_result[0]}]
set_output_delay -clock clk  -min 3  [get_ports {op_result[0]}]
set_output_delay -clock clk  -max 5  [get_ports busy]
set_output_delay -clock clk  -min 3  [get_ports busy]
