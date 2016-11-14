###################################################################

# Created by write_sdc on Sun Nov 13 09:21:03 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 25 [current_design]
set_max_area 0
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports beg_FSM]
set_driving_cell -lib_cell TBUFX20TS [get_ports ack_FSM]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_X[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_Y[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports add_subt]
set_driving_cell -lib_cell TBUFX20TS [get_ports {r_mode[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {r_mode[0]}]
create_clock [get_ports clk]  -period 40  -waveform {0 20}
set_clock_latency 2  [get_clocks clk]
set_clock_latency -source 2  [get_clocks clk]
set_clock_uncertainty -setup 2  [get_clocks clk]
set_clock_uncertainty -hold 0  [get_clocks clk]
set_clock_transition -min -fall 2 [get_clocks clk]
set_clock_transition -min -rise 2 [get_clocks clk]
set_clock_transition -max -fall 2 [get_clocks clk]
set_clock_transition -max -rise 2 [get_clocks clk]
set_input_delay -clock clk  -max 14  [get_ports rst]
set_input_delay -clock clk  -min 4  [get_ports rst]
set_input_delay -clock clk  -max 14  [get_ports beg_FSM]
set_input_delay -clock clk  -min 4  [get_ports beg_FSM]
set_input_delay -clock clk  -max 14  [get_ports ack_FSM]
set_input_delay -clock clk  -min 4  [get_ports ack_FSM]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[63]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[63]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[62]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[62]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[61]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[61]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[60]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[60]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[59]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[59]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[58]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[58]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[57]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[57]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[56]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[56]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[55]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[55]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[54]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[54]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[53]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[53]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[52]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[52]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[51]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[51]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[50]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[50]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[49]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[49]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[48]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[48]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[47]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[47]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[46]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[46]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[45]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[45]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[44]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[44]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[43]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[43]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[42]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[42]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[41]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[41]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[40]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[40]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[39]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[39]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[38]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[38]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[37]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[37]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[36]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[36]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[35]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[35]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[34]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[34]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[33]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[33]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[32]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[32]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[31]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[31]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[30]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[30]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[29]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[29]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[28]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[28]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[27]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[27]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[26]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[26]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[25]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[25]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[24]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[24]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[23]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[23]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[22]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[22]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[21]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[21]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[20]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[20]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[19]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[19]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[18]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[18]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[17]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[17]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[16]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[16]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[15]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[15]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[14]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[14]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[13]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[13]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[12]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[12]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[11]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[11]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[10]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[10]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[9]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[9]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[8]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[8]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[7]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[7]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[6]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[6]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[5]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[5]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[4]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[4]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[3]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[3]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[2]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[2]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[1]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[1]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_X[0]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_X[0]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[63]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[63]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[62]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[62]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[61]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[61]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[60]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[60]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[59]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[59]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[58]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[58]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[57]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[57]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[56]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[56]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[55]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[55]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[54]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[54]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[53]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[53]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[52]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[52]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[51]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[51]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[50]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[50]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[49]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[49]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[48]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[48]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[47]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[47]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[46]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[46]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[45]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[45]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[44]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[44]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[43]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[43]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[42]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[42]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[41]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[41]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[40]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[40]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[39]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[39]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[38]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[38]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[37]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[37]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[36]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[36]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[35]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[35]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[34]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[34]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[33]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[33]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[32]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[32]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[31]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[31]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[30]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[30]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[29]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[29]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[28]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[28]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[27]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[27]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[26]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[26]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[25]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[25]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[24]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[24]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[23]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[23]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[22]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[22]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[21]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[21]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[20]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[20]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[19]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[19]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[18]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[18]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[17]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[17]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[16]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[16]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[15]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[15]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[14]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[14]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[13]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[13]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[12]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[12]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[11]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[11]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[10]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[10]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[9]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[9]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[8]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[8]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[7]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[7]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[6]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[6]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[5]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[5]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[4]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[4]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[3]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[3]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[2]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[2]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[1]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[1]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_Y[0]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_Y[0]}]
set_input_delay -clock clk  -max 14  [get_ports add_subt]
set_input_delay -clock clk  -min 4  [get_ports add_subt]
set_input_delay -clock clk  -max 14  [get_ports {r_mode[1]}]
set_input_delay -clock clk  -min 4  [get_ports {r_mode[1]}]
set_input_delay -clock clk  -max 14  [get_ports {r_mode[0]}]
set_input_delay -clock clk  -min 4  [get_ports {r_mode[0]}]
set_output_delay -clock clk  -max 8  [get_ports overflow_flag]
set_output_delay -clock clk  -min 4  [get_ports overflow_flag]
set_output_delay -clock clk  -max 8  [get_ports underflow_flag]
set_output_delay -clock clk  -min 4  [get_ports underflow_flag]
set_output_delay -clock clk  -max 8  [get_ports ready]
set_output_delay -clock clk  -min 4  [get_ports ready]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[63]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[63]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[62]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[62]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[61]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[61]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[60]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[60]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[59]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[59]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[58]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[58]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[57]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[57]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[56]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[56]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[55]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[55]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[54]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[54]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[53]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[53]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[52]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[52]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[51]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[51]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[50]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[50]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[49]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[49]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[48]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[48]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[47]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[47]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[46]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[46]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[45]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[45]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[44]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[44]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[43]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[43]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[42]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[42]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[41]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[41]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[40]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[40]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[39]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[39]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[38]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[38]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[37]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[37]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[36]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[36]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[35]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[35]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[34]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[34]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[33]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[33]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[32]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[32]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[31]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[31]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[30]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[30]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[29]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[29]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[28]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[28]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[27]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[27]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[26]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[26]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[25]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[25]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[24]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[24]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[23]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[23]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[22]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[22]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[21]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[21]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[20]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[20]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[19]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[19]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[18]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[18]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[17]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[17]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[16]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[16]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[15]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[15]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[14]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[14]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[13]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[13]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[12]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[12]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[11]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[11]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[10]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[10]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[9]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[9]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[8]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[8]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[7]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[7]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[6]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[6]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[5]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[5]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[4]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[4]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[3]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[3]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[2]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[2]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[1]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[1]}]
set_output_delay -clock clk  -max 8  [get_ports {final_result_ieee[0]}]
set_output_delay -clock clk  -min 4  [get_ports {final_result_ieee[0]}]
