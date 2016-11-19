###################################################################

# Created by write_sdc on Sat Nov 19 00:23:15 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions tt_1p2v_25c -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_wire_load_mode top
set_wire_load_model -name ibm13_wl10 -library scx3_cmos8rf_lpvt_tt_1p2v_25c
set_max_fanout 10 [current_design]
set_max_area 0
create_clock -name clk  -period 10  -waveform {0 5}
set_input_delay -clock clk  -max 3.5  [get_ports {in1[7]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[7]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[6]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[6]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[5]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[5]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[4]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[4]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[3]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[3]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[2]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[2]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[1]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[1]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in1[0]}]
set_input_delay -clock clk  -min 1  [get_ports {in1[0]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[7]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[7]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[6]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[6]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[5]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[5]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[4]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[4]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[3]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[3]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[2]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[2]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[1]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[1]}]
set_input_delay -clock clk  -max 3.5  [get_ports {in2[0]}]
set_input_delay -clock clk  -min 1  [get_ports {in2[0]}]
set_output_delay -clock clk  -max 2  [get_ports {res[8]}]
set_output_delay -clock clk  -min 1  [get_ports {res[8]}]
set_output_delay -clock clk  -max 2  [get_ports {res[7]}]
set_output_delay -clock clk  -min 1  [get_ports {res[7]}]
set_output_delay -clock clk  -max 2  [get_ports {res[6]}]
set_output_delay -clock clk  -min 1  [get_ports {res[6]}]
set_output_delay -clock clk  -max 2  [get_ports {res[5]}]
set_output_delay -clock clk  -min 1  [get_ports {res[5]}]
set_output_delay -clock clk  -max 2  [get_ports {res[4]}]
set_output_delay -clock clk  -min 1  [get_ports {res[4]}]
set_output_delay -clock clk  -max 2  [get_ports {res[3]}]
set_output_delay -clock clk  -min 1  [get_ports {res[3]}]
set_output_delay -clock clk  -max 2  [get_ports {res[2]}]
set_output_delay -clock clk  -min 1  [get_ports {res[2]}]
set_output_delay -clock clk  -max 2  [get_ports {res[1]}]
set_output_delay -clock clk  -min 1  [get_ports {res[1]}]
set_output_delay -clock clk  -max 2  [get_ports {res[0]}]
set_output_delay -clock clk  -min 1  [get_ports {res[0]}]
