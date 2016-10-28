###################################################################

# Created by write_sdc on Fri Oct 28 09:17:22 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_fanout 10 [current_design]
set_max_area 0
set_driving_cell -lib_cell TBUFX20TS [get_ports rst]
set_driving_cell -lib_cell TBUFX20TS [get_ports load_b_i]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_A_i[0]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[53]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[52]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[51]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[50]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[49]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[48]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[47]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[46]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[45]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[44]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[43]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[42]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[41]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[40]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[39]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[38]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[37]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[36]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[35]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[34]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[33]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[32]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[31]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[30]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[29]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[28]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[27]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[26]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[25]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[24]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[23]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[22]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[21]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[20]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[19]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[18]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[17]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[16]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[15]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[14]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[13]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[12]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[11]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[10]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[9]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[8]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[7]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[6]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[5]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[4]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[3]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[2]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[1]}]
set_driving_cell -lib_cell TBUFX20TS [get_ports {Data_B_i[0]}]
create_clock [get_ports clk]  -period 9.5  -waveform {0 4.75}
set_clock_latency 0.5  [get_clocks clk]
set_clock_latency -source 0.5  [get_clocks clk]
set_clock_uncertainty -setup 0.5  [get_clocks clk]
set_clock_uncertainty -hold 0  [get_clocks clk]
set_clock_transition -max -rise 0.5 [get_clocks clk]
set_clock_transition -max -fall 0.5 [get_clocks clk]
set_clock_transition -min -rise 0.5 [get_clocks clk]
set_clock_transition -min -fall 0.5 [get_clocks clk]
set_input_delay -clock clk  -max 3  [get_ports rst]
set_input_delay -clock clk  -min 2  [get_ports rst]
set_input_delay -clock clk  -max 3  [get_ports load_b_i]
set_input_delay -clock clk  -min 2  [get_ports load_b_i]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[53]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[53]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[52]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[52]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[51]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[51]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[50]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[50]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[49]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[49]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[48]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[48]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[47]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[47]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[46]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[46]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[45]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[45]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[44]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[44]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[43]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[43]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[42]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[42]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[41]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[41]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[40]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[40]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[39]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[39]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[38]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[38]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[37]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[37]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[36]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[36]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[35]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[35]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[34]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[34]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[33]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[33]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[32]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[32]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[31]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[31]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[30]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[30]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[29]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[29]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[28]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[28]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[27]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[27]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[26]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[26]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[25]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[25]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[24]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[24]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[23]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[23]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[22]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[22]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[21]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[21]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[20]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[20]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[19]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[19]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[18]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[18]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[17]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[17]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[16]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[16]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[15]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[15]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[14]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[14]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[13]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[13]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[12]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[12]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[11]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[11]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[10]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[10]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[9]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[9]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[8]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[8]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[7]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[7]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[6]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[6]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[5]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[5]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[4]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[4]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[3]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[3]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[2]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[2]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[1]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[1]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_A_i[0]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_A_i[0]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[53]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[53]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[52]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[52]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[51]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[51]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[50]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[50]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[49]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[49]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[48]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[48]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[47]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[47]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[46]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[46]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[45]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[45]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[44]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[44]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[43]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[43]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[42]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[42]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[41]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[41]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[40]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[40]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[39]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[39]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[38]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[38]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[37]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[37]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[36]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[36]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[35]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[35]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[34]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[34]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[33]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[33]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[32]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[32]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[31]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[31]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[30]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[30]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[29]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[29]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[28]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[28]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[27]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[27]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[26]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[26]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[25]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[25]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[24]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[24]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[23]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[23]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[22]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[22]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[21]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[21]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[20]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[20]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[19]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[19]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[18]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[18]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[17]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[17]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[16]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[16]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[15]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[15]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[14]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[14]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[13]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[13]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[12]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[12]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[11]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[11]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[10]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[10]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[9]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[9]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[8]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[8]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[7]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[7]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[6]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[6]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[5]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[5]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[4]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[4]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[3]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[3]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[2]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[2]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[1]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[1]}]
set_input_delay -clock clk  -max 3  [get_ports {Data_B_i[0]}]
set_input_delay -clock clk  -min 2  [get_ports {Data_B_i[0]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[107]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[107]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[106]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[106]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[105]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[105]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[104]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[104]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[103]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[103]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[102]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[102]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[101]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[101]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[100]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[100]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[99]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[99]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[98]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[98]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[97]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[97]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[96]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[96]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[95]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[95]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[94]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[94]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[93]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[93]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[92]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[92]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[91]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[91]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[90]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[90]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[89]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[89]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[88]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[88]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[87]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[87]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[86]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[86]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[85]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[85]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[84]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[84]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[83]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[83]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[82]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[82]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[81]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[81]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[80]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[80]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[79]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[79]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[78]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[78]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[77]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[77]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[76]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[76]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[75]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[75]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[74]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[74]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[73]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[73]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[72]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[72]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[71]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[71]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[70]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[70]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[69]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[69]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[68]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[68]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[67]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[67]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[66]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[66]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[65]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[65]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[64]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[64]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[63]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[63]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[62]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[62]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[61]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[61]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[60]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[60]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[59]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[59]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[58]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[58]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[57]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[57]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[56]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[56]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[55]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[55]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[54]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[54]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[53]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[53]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[52]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[52]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[51]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[51]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[50]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[50]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[49]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[49]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[48]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[48]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[47]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[47]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[46]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[46]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[45]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[45]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[44]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[44]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[43]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[43]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[42]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[42]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[41]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[41]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[40]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[40]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[39]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[39]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[38]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[38]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[37]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[37]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[36]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[36]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[35]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[35]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[34]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[34]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[33]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[33]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[32]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[32]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[31]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[31]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[30]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[30]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[29]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[29]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[28]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[28]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[27]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[27]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[26]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[26]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[25]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[25]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[24]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[24]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[23]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[23]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[22]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[22]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[21]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[21]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[20]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[20]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[19]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[19]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[18]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[18]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[17]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[17]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[16]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[16]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[15]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[15]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[14]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[14]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[13]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[13]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[12]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[12]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[11]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[11]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[10]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[10]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[9]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[9]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[8]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[8]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[7]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[7]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[6]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[6]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[5]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[5]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[4]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[4]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[3]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[3]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[2]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[2]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[1]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[1]}]
set_output_delay -clock clk  -max 0  [get_ports {sgf_result_o[0]}]
set_output_delay -clock clk  -min -3  [get_ports {sgf_result_o[0]}]
