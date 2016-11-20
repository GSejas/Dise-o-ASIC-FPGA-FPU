###################################################################

# Created by write_sdc on Sat Nov 19 19:30:55 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 10 [current_design]
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports beg_OP]
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
create_clock [get_ports clk]  -period 1  -waveform {0 0.5}
set_clock_latency 0.05  [get_clocks clk]
set_clock_latency -source 0.05  [get_clocks clk]
set_clock_uncertainty -setup 0.05  [get_clocks clk]
set_clock_uncertainty -hold 0  [get_clocks clk]
set_clock_transition -max -rise 0.05 [get_clocks clk]
set_clock_transition -max -fall 0.05 [get_clocks clk]
set_clock_transition -min -rise 0.05 [get_clocks clk]
set_clock_transition -min -fall 0.05 [get_clocks clk]
set_input_delay -clock clk  -max 0.3  [get_ports rst]
set_input_delay -clock clk  -min 0.1  [get_ports rst]
set_input_delay -clock clk  -max 0.3  [get_ports beg_OP]
set_input_delay -clock clk  -min 0.1  [get_ports beg_OP]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[31]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[31]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[30]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[30]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[29]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[29]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[28]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[28]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[27]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[27]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[26]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[26]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[25]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[25]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[24]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[24]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[23]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[23]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[22]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[22]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[21]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[21]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[20]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[20]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[19]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[19]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[18]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[18]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[17]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[17]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[16]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[16]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[15]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[15]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[14]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[14]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[13]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[13]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[12]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[12]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[11]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[11]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[10]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[10]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[9]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[9]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[8]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[8]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[7]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[7]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[6]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[6]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[5]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[5]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[4]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[4]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[3]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[3]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[2]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[2]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[1]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[1]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_X[0]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_X[0]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[31]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[31]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[30]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[30]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[29]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[29]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[28]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[28]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[27]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[27]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[26]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[26]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[25]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[25]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[24]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[24]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[23]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[23]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[22]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[22]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[21]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[21]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[20]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[20]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[19]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[19]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[18]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[18]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[17]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[17]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[16]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[16]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[15]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[15]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[14]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[14]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[13]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[13]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[12]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[12]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[11]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[11]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[10]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[10]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[9]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[9]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[8]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[8]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[7]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[7]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[6]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[6]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[5]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[5]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[4]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[4]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[3]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[3]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[2]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[2]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[1]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[1]}]
set_input_delay -clock clk  -max 0.3  [get_ports {Data_Y[0]}]
set_input_delay -clock clk  -min 0.1  [get_ports {Data_Y[0]}]
set_input_delay -clock clk  -max 0.3  [get_ports add_subt]
set_input_delay -clock clk  -min 0.1  [get_ports add_subt]
set_output_delay -clock clk  -max 0.2  [get_ports busy]
set_output_delay -clock clk  -min 0.1  [get_ports busy]
set_output_delay -clock clk  -max 0.2  [get_ports overflow_flag]
set_output_delay -clock clk  -min 0.1  [get_ports overflow_flag]
set_output_delay -clock clk  -max 0.2  [get_ports underflow_flag]
set_output_delay -clock clk  -min 0.1  [get_ports underflow_flag]
set_output_delay -clock clk  -max 0.2  [get_ports zero_flag]
set_output_delay -clock clk  -min 0.1  [get_ports zero_flag]
set_output_delay -clock clk  -max 0.2  [get_ports ready]
set_output_delay -clock clk  -min 0.1  [get_ports ready]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[31]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[31]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[30]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[30]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[29]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[29]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[28]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[28]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[27]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[27]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[26]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[26]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[25]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[25]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[24]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[24]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[23]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[23]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[22]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[22]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[21]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[21]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[20]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[20]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[19]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[19]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[18]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[18]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[17]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[17]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[16]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[16]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[15]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[15]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[14]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[14]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[13]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[13]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[12]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[12]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[11]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[11]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[10]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[10]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[9]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[9]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[8]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[8]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[7]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[7]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[6]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[6]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[5]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[5]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[4]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[4]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[3]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[3]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[2]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[2]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[1]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[1]}]
set_output_delay -clock clk  -max 0.2  [get_ports {final_result_ieee[0]}]
set_output_delay -clock clk  -min 0.1  [get_ports {final_result_ieee[0]}]
