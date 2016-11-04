###################################################################

# Created by write_sdc on Thu Nov  3 17:59:54 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 25 [current_design]
set_max_area 0
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports beg_fsm_cordic]
set_driving_cell -lib_cell TBUFX20TS [get_ports ack_cordic]
set_driving_cell -lib_cell TBUFX20TS [get_ports operation]
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
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {result_add_subt[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports ready_add_subt]
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
set_input_delay -clock clk  -max 14  [get_ports beg_fsm_cordic]
set_input_delay -clock clk  -min 4  [get_ports beg_fsm_cordic]
set_input_delay -clock clk  -max 14  [get_ports ack_cordic]
set_input_delay -clock clk  -min 4  [get_ports ack_cordic]
set_input_delay -clock clk  -max 14  [get_ports operation]
set_input_delay -clock clk  -min 4  [get_ports operation]
set_input_delay -clock clk  -max 14  [get_ports {data_in[31]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[31]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[30]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[30]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[29]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[29]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[28]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[28]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[27]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[27]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[26]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[26]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[25]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[25]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[24]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[24]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[23]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[23]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[22]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[22]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[21]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[21]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[20]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[20]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[19]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[19]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[18]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[18]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[17]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[17]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[16]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[16]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[15]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[15]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[14]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[14]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[13]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[13]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[12]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[12]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[11]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[11]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[10]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[10]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[9]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[9]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[8]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[8]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[7]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[7]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[6]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[6]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[5]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[5]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[4]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[4]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[3]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[3]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[2]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[2]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[1]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[1]}]
set_input_delay -clock clk  -max 14  [get_ports {data_in[0]}]
set_input_delay -clock clk  -min 4  [get_ports {data_in[0]}]
set_input_delay -clock clk  -max 14  [get_ports {shift_region_flag[1]}]
set_input_delay -clock clk  -min 4  [get_ports {shift_region_flag[1]}]
set_input_delay -clock clk  -max 14  [get_ports {shift_region_flag[0]}]
set_input_delay -clock clk  -min 4  [get_ports {shift_region_flag[0]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[31]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[31]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[30]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[30]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[29]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[29]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[28]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[28]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[27]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[27]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[26]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[26]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[25]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[25]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[24]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[24]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[23]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[23]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[22]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[22]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[21]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[21]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[20]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[20]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[19]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[19]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[18]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[18]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[17]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[17]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[16]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[16]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[15]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[15]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[14]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[14]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[13]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[13]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[12]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[12]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[11]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[11]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[10]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[10]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[9]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[9]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[8]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[8]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[7]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[7]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[6]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[6]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[5]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[5]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[4]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[4]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[3]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[3]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[2]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[2]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[1]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[1]}]
set_input_delay -clock clk  -max 14  [get_ports {result_add_subt[0]}]
set_input_delay -clock clk  -min 4  [get_ports {result_add_subt[0]}]
set_input_delay -clock clk  -max 14  [get_ports ready_add_subt]
set_input_delay -clock clk  -min 4  [get_ports ready_add_subt]
set_output_delay -clock clk  -max 8  [get_ports ready_cordic]
set_output_delay -clock clk  -min 4  [get_ports ready_cordic]
set_output_delay -clock clk  -max 8  [get_ports {data_output[31]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[31]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[30]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[30]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[29]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[29]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[28]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[28]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[27]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[27]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[26]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[26]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[25]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[25]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[24]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[24]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[23]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[23]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[22]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[22]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[21]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[21]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[20]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[20]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[19]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[19]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[18]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[18]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[17]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[17]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[16]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[16]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[15]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[15]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[14]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[14]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[13]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[13]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[12]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[12]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[11]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[11]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[10]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[10]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[9]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[9]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[8]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[8]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[7]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[7]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[6]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[6]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[5]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[5]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[4]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[4]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[3]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[3]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[2]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[2]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[1]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[1]}]
set_output_delay -clock clk  -max 8  [get_ports {data_output[0]}]
set_output_delay -clock clk  -min 4  [get_ports {data_output[0]}]
set_output_delay -clock clk  -max 8  [get_ports beg_add_subt]
set_output_delay -clock clk  -min 4  [get_ports beg_add_subt]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[31]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[31]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[30]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[30]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[29]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[29]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[28]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[28]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[27]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[27]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[26]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[26]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[25]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[25]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[24]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[24]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[23]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[23]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[22]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[22]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[21]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[21]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[20]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[20]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[19]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[19]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[18]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[18]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[17]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[17]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[16]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[16]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[15]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[15]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[14]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[14]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[13]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[13]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[12]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[12]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[11]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[11]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[10]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[10]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[9]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[9]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[8]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[8]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[7]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[7]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[6]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[6]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[5]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[5]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[4]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[4]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[3]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[3]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[2]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[2]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[1]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[1]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataA[0]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataA[0]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[31]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[31]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[30]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[30]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[29]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[29]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[28]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[28]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[27]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[27]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[26]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[26]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[25]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[25]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[24]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[24]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[23]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[23]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[22]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[22]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[21]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[21]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[20]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[20]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[19]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[19]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[18]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[18]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[17]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[17]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[16]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[16]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[15]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[15]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[14]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[14]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[13]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[13]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[12]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[12]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[11]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[11]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[10]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[10]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[9]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[9]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[8]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[8]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[7]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[7]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[6]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[6]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[5]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[5]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[4]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[4]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[3]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[3]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[2]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[2]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[1]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[1]}]
set_output_delay -clock clk  -max 8  [get_ports {add_subt_dataB[0]}]
set_output_delay -clock clk  -min 4  [get_ports {add_subt_dataB[0]}]
set_output_delay -clock clk  -max 8  [get_ports op_add_subt]
set_output_delay -clock clk  -min 4  [get_ports op_add_subt]
set_output_delay -clock clk  -max 8  [get_ports enab_cont_iter]
set_output_delay -clock clk  -min 4  [get_ports enab_cont_iter]
