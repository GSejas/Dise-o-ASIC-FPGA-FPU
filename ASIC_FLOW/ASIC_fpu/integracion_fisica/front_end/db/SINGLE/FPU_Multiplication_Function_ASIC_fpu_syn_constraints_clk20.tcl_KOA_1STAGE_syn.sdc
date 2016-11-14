###################################################################

# Created by write_sdc on Sun Nov 13 13:58:04 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 15 [current_design]
set_max_area 0
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports beg_FSM]
set_driving_cell -lib_cell TBUFX20TS [get_ports ack_FSM]
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
set_input_delay -clock clk  -max 6  [get_ports beg_FSM]
set_input_delay -clock clk  -min 3  [get_ports beg_FSM]
set_input_delay -clock clk  -max 6  [get_ports ack_FSM]
set_input_delay -clock clk  -min 3  [get_ports ack_FSM]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[31]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[31]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[30]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[30]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[29]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[29]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[28]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[28]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[27]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[27]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[26]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[26]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[25]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[25]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[24]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[24]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[23]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[23]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[22]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[22]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[21]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[21]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[20]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[20]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[19]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[19]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[18]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[18]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[17]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[17]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[16]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[16]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[15]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[15]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[14]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[14]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[13]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[13]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[12]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[12]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[11]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[11]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[10]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[10]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[9]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[9]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[8]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[8]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[7]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[7]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[6]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[6]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[5]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[5]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[4]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[4]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[3]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[3]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[2]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[2]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[1]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[1]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MX[0]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MX[0]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[31]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[31]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[30]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[30]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[29]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[29]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[28]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[28]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[27]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[27]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[26]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[26]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[25]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[25]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[24]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[24]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[23]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[23]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[22]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[22]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[21]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[21]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[20]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[20]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[19]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[19]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[18]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[18]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[17]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[17]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[16]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[16]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[15]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[15]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[14]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[14]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[13]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[13]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[12]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[12]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[11]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[11]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[10]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[10]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[9]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[9]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[8]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[8]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[7]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[7]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[6]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[6]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[5]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[5]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[4]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[4]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[3]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[3]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[2]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[2]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[1]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[1]}]
set_input_delay -clock clk  -max 6  [get_ports {Data_MY[0]}]
set_input_delay -clock clk  -min 3  [get_ports {Data_MY[0]}]
set_input_delay -clock clk  -max 6  [get_ports {round_mode[1]}]
set_input_delay -clock clk  -min 3  [get_ports {round_mode[1]}]
set_input_delay -clock clk  -max 6  [get_ports {round_mode[0]}]
set_input_delay -clock clk  -min 3  [get_ports {round_mode[0]}]
set_output_delay -clock clk  -max 5  [get_ports overflow_flag]
set_output_delay -clock clk  -min 3  [get_ports overflow_flag]
set_output_delay -clock clk  -max 5  [get_ports underflow_flag]
set_output_delay -clock clk  -min 3  [get_ports underflow_flag]
set_output_delay -clock clk  -max 5  [get_ports ready]
set_output_delay -clock clk  -min 3  [get_ports ready]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[31]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[31]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[30]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[30]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[29]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[29]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[28]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[28]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[27]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[27]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[26]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[26]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[25]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[25]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[24]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[24]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[23]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[23]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[22]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[22]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[21]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[21]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[20]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[20]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[19]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[19]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[18]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[18]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[17]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[17]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[16]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[16]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[15]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[15]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[14]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[14]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[13]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[13]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[12]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[12]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[11]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[11]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[10]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[10]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[9]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[9]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[8]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[8]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[7]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[7]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[6]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[6]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[5]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[5]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[4]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[4]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[3]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[3]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[2]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[2]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[1]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[1]}]
set_output_delay -clock clk  -max 5  [get_ports {final_result_ieee[0]}]
set_output_delay -clock clk  -min 3  [get_ports {final_result_ieee[0]}]
