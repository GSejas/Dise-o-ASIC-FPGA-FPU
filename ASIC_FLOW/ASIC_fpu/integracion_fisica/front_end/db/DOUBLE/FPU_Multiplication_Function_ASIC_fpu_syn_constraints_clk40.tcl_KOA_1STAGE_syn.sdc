###################################################################

# Created by write_sdc on Thu Nov  3 16:55:42 2016

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
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MX[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_MY[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {round_mode[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {round_mode[0]}]
create_clock [get_ports clk]  -period 40  -waveform {0 20}
set_clock_latency 2  [get_clocks clk]
set_clock_latency -source 2  [get_clocks clk]
set_clock_uncertainty -setup 2  [get_clocks clk]
set_clock_uncertainty -hold 0  [get_clocks clk]
set_clock_transition -max -rise 2 [get_clocks clk]
set_clock_transition -max -fall 2 [get_clocks clk]
set_clock_transition -min -rise 2 [get_clocks clk]
set_clock_transition -min -fall 2 [get_clocks clk]
set_input_delay -clock clk  -max 14  [get_ports rst]
set_input_delay -clock clk  -min 4  [get_ports rst]
set_input_delay -clock clk  -max 14  [get_ports beg_FSM]
set_input_delay -clock clk  -min 4  [get_ports beg_FSM]
set_input_delay -clock clk  -max 14  [get_ports ack_FSM]
set_input_delay -clock clk  -min 4  [get_ports ack_FSM]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[63]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[63]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[62]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[62]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[61]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[61]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[60]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[60]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[59]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[59]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[58]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[58]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[57]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[57]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[56]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[56]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[55]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[55]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[54]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[54]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[53]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[53]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[52]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[52]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[51]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[51]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[50]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[50]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[49]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[49]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[48]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[48]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[47]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[47]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[46]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[46]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[45]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[45]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[44]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[44]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[43]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[43]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[42]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[42]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[41]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[41]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[40]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[40]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[39]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[39]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[38]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[38]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[37]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[37]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[36]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[36]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[35]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[35]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[34]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[34]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[33]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[33]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[32]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[32]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[31]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[31]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[30]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[30]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[29]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[29]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[28]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[28]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[27]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[27]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[26]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[26]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[25]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[25]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[24]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[24]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[23]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[23]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[22]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[22]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[21]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[21]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[20]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[20]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[19]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[19]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[18]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[18]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[17]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[17]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[16]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[16]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[15]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[15]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[14]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[14]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[13]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[13]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[12]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[12]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[11]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[11]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[10]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[10]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[9]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[9]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[8]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[8]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[7]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[7]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[6]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[6]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[5]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[5]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[4]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[4]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[3]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[3]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[2]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[2]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[1]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[1]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MX[0]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MX[0]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[63]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[63]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[62]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[62]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[61]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[61]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[60]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[60]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[59]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[59]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[58]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[58]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[57]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[57]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[56]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[56]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[55]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[55]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[54]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[54]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[53]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[53]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[52]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[52]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[51]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[51]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[50]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[50]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[49]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[49]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[48]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[48]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[47]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[47]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[46]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[46]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[45]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[45]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[44]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[44]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[43]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[43]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[42]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[42]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[41]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[41]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[40]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[40]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[39]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[39]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[38]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[38]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[37]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[37]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[36]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[36]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[35]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[35]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[34]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[34]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[33]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[33]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[32]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[32]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[31]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[31]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[30]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[30]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[29]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[29]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[28]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[28]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[27]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[27]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[26]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[26]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[25]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[25]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[24]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[24]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[23]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[23]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[22]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[22]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[21]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[21]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[20]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[20]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[19]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[19]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[18]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[18]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[17]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[17]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[16]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[16]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[15]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[15]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[14]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[14]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[13]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[13]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[12]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[12]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[11]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[11]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[10]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[10]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[9]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[9]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[8]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[8]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[7]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[7]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[6]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[6]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[5]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[5]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[4]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[4]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[3]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[3]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[2]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[2]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[1]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[1]}]
set_input_delay -clock clk  -max 14  [get_ports {Data_MY[0]}]
set_input_delay -clock clk  -min 4  [get_ports {Data_MY[0]}]
set_input_delay -clock clk  -max 14  [get_ports {round_mode[1]}]
set_input_delay -clock clk  -min 4  [get_ports {round_mode[1]}]
set_input_delay -clock clk  -max 14  [get_ports {round_mode[0]}]
set_input_delay -clock clk  -min 4  [get_ports {round_mode[0]}]
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
