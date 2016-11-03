###################################################################

# Created by write_sdc on Thu Nov  3 12:03:08 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 10 [current_design]
set_max_area 0
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports beg_fsm_cordic]
set_driving_cell -lib_cell TBUFX20TS [get_ports ack_cordic]
set_driving_cell -lib_cell TBUFX20TS [get_ports operation]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[63]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[62]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[61]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[60]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[59]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[58]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[57]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[56]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[55]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[54]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {data_in[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {shift_region_flag[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {shift_region_flag[0]}]
