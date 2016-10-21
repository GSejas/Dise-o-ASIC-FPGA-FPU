###################################################################

# Created by write_sdc on Wed Oct 19 19:49:19 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_transition -max -rise 0.5 [get_clocks clk]
set_clock_transition -max -fall 0.5 [get_clocks clk]
set_clock_transition -min -rise 0.5 [get_clocks clk]
set_clock_transition -min -fall 0.5 [get_clocks clk]
set_max_delay 2  -from [list [get_ports {intDX[31]}] [get_ports {intDX[30]}] [get_ports        \
{intDX[29]}] [get_ports {intDX[28]}] [get_ports {intDX[27]}] [get_ports        \
{intDX[26]}] [get_ports {intDX[25]}] [get_ports {intDX[24]}] [get_ports        \
{intDX[23]}] [get_ports {intDX[22]}] [get_ports {intDX[21]}] [get_ports        \
{intDX[20]}] [get_ports {intDX[19]}] [get_ports {intDX[18]}] [get_ports        \
{intDX[17]}] [get_ports {intDX[16]}] [get_ports {intDX[15]}] [get_ports        \
{intDX[14]}] [get_ports {intDX[13]}] [get_ports {intDX[12]}] [get_ports        \
{intDX[11]}] [get_ports {intDX[10]}] [get_ports {intDX[9]}] [get_ports         \
{intDX[8]}] [get_ports {intDX[7]}] [get_ports {intDX[6]}] [get_ports           \
{intDX[5]}] [get_ports {intDX[4]}] [get_ports {intDX[3]}] [get_ports           \
{intDX[2]}] [get_ports {intDX[1]}] [get_ports {intDX[0]}] [get_ports           \
{intDY[31]}] [get_ports {intDY[30]}] [get_ports {intDY[29]}] [get_ports        \
{intDY[28]}] [get_ports {intDY[27]}] [get_ports {intDY[26]}] [get_ports        \
{intDY[25]}] [get_ports {intDY[24]}] [get_ports {intDY[23]}] [get_ports        \
{intDY[22]}] [get_ports {intDY[21]}] [get_ports {intDY[20]}] [get_ports        \
{intDY[19]}] [get_ports {intDY[18]}] [get_ports {intDY[17]}] [get_ports        \
{intDY[16]}] [get_ports {intDY[15]}] [get_ports {intDY[14]}] [get_ports        \
{intDY[13]}] [get_ports {intDY[12]}] [get_ports {intDY[11]}] [get_ports        \
{intDY[10]}] [get_ports {intDY[9]}] [get_ports {intDY[8]}] [get_ports          \
{intDY[7]}] [get_ports {intDY[6]}] [get_ports {intDY[5]}] [get_ports           \
{intDY[4]}] [get_ports {intDY[3]}] [get_ports {intDY[2]}] [get_ports           \
{intDY[1]}] [get_ports {intDY[0]}] [get_ports load_b_i]]  -to [list [get_ports {DMP_o[30]}] [get_ports {DMP_o[29]}] [get_ports          \
{DMP_o[28]}] [get_ports {DMP_o[27]}] [get_ports {DMP_o[26]}] [get_ports        \
{DMP_o[25]}] [get_ports {DMP_o[24]}] [get_ports {DMP_o[23]}] [get_ports        \
{DMP_o[22]}] [get_ports {DMP_o[21]}] [get_ports {DMP_o[20]}] [get_ports        \
{DMP_o[19]}] [get_ports {DMP_o[18]}] [get_ports {DMP_o[17]}] [get_ports        \
{DMP_o[16]}] [get_ports {DMP_o[15]}] [get_ports {DMP_o[14]}] [get_ports        \
{DMP_o[13]}] [get_ports {DMP_o[12]}] [get_ports {DMP_o[11]}] [get_ports        \
{DMP_o[10]}] [get_ports {DMP_o[9]}] [get_ports {DMP_o[8]}] [get_ports          \
{DMP_o[7]}] [get_ports {DMP_o[6]}] [get_ports {DMP_o[5]}] [get_ports           \
{DMP_o[4]}] [get_ports {DMP_o[3]}] [get_ports {DMP_o[2]}] [get_ports           \
{DMP_o[1]}] [get_ports {DMP_o[0]}] [get_ports {DmP_o[30]}] [get_ports          \
{DmP_o[29]}] [get_ports {DmP_o[28]}] [get_ports {DmP_o[27]}] [get_ports        \
{DmP_o[26]}] [get_ports {DmP_o[25]}] [get_ports {DmP_o[24]}] [get_ports        \
{DmP_o[23]}] [get_ports {DmP_o[22]}] [get_ports {DmP_o[21]}] [get_ports        \
{DmP_o[20]}] [get_ports {DmP_o[19]}] [get_ports {DmP_o[18]}] [get_ports        \
{DmP_o[17]}] [get_ports {DmP_o[16]}] [get_ports {DmP_o[15]}] [get_ports        \
{DmP_o[14]}] [get_ports {DmP_o[13]}] [get_ports {DmP_o[12]}] [get_ports        \
{DmP_o[11]}] [get_ports {DmP_o[10]}] [get_ports {DmP_o[9]}] [get_ports         \
{DmP_o[8]}] [get_ports {DmP_o[7]}] [get_ports {DmP_o[6]}] [get_ports           \
{DmP_o[5]}] [get_ports {DmP_o[4]}] [get_ports {DmP_o[3]}] [get_ports           \
{DmP_o[2]}] [get_ports {DmP_o[1]}] [get_ports {DmP_o[0]}]]
set_min_delay 1  -from [list [get_ports {intDX[31]}] [get_ports {intDX[30]}] [get_ports        \
{intDX[29]}] [get_ports {intDX[28]}] [get_ports {intDX[27]}] [get_ports        \
{intDX[26]}] [get_ports {intDX[25]}] [get_ports {intDX[24]}] [get_ports        \
{intDX[23]}] [get_ports {intDX[22]}] [get_ports {intDX[21]}] [get_ports        \
{intDX[20]}] [get_ports {intDX[19]}] [get_ports {intDX[18]}] [get_ports        \
{intDX[17]}] [get_ports {intDX[16]}] [get_ports {intDX[15]}] [get_ports        \
{intDX[14]}] [get_ports {intDX[13]}] [get_ports {intDX[12]}] [get_ports        \
{intDX[11]}] [get_ports {intDX[10]}] [get_ports {intDX[9]}] [get_ports         \
{intDX[8]}] [get_ports {intDX[7]}] [get_ports {intDX[6]}] [get_ports           \
{intDX[5]}] [get_ports {intDX[4]}] [get_ports {intDX[3]}] [get_ports           \
{intDX[2]}] [get_ports {intDX[1]}] [get_ports {intDX[0]}] [get_ports           \
{intDY[31]}] [get_ports {intDY[30]}] [get_ports {intDY[29]}] [get_ports        \
{intDY[28]}] [get_ports {intDY[27]}] [get_ports {intDY[26]}] [get_ports        \
{intDY[25]}] [get_ports {intDY[24]}] [get_ports {intDY[23]}] [get_ports        \
{intDY[22]}] [get_ports {intDY[21]}] [get_ports {intDY[20]}] [get_ports        \
{intDY[19]}] [get_ports {intDY[18]}] [get_ports {intDY[17]}] [get_ports        \
{intDY[16]}] [get_ports {intDY[15]}] [get_ports {intDY[14]}] [get_ports        \
{intDY[13]}] [get_ports {intDY[12]}] [get_ports {intDY[11]}] [get_ports        \
{intDY[10]}] [get_ports {intDY[9]}] [get_ports {intDY[8]}] [get_ports          \
{intDY[7]}] [get_ports {intDY[6]}] [get_ports {intDY[5]}] [get_ports           \
{intDY[4]}] [get_ports {intDY[3]}] [get_ports {intDY[2]}] [get_ports           \
{intDY[1]}] [get_ports {intDY[0]}] [get_ports load_b_i]]  -to [list [get_ports {DMP_o[30]}] [get_ports {DMP_o[29]}] [get_ports          \
{DMP_o[28]}] [get_ports {DMP_o[27]}] [get_ports {DMP_o[26]}] [get_ports        \
{DMP_o[25]}] [get_ports {DMP_o[24]}] [get_ports {DMP_o[23]}] [get_ports        \
{DMP_o[22]}] [get_ports {DMP_o[21]}] [get_ports {DMP_o[20]}] [get_ports        \
{DMP_o[19]}] [get_ports {DMP_o[18]}] [get_ports {DMP_o[17]}] [get_ports        \
{DMP_o[16]}] [get_ports {DMP_o[15]}] [get_ports {DMP_o[14]}] [get_ports        \
{DMP_o[13]}] [get_ports {DMP_o[12]}] [get_ports {DMP_o[11]}] [get_ports        \
{DMP_o[10]}] [get_ports {DMP_o[9]}] [get_ports {DMP_o[8]}] [get_ports          \
{DMP_o[7]}] [get_ports {DMP_o[6]}] [get_ports {DMP_o[5]}] [get_ports           \
{DMP_o[4]}] [get_ports {DMP_o[3]}] [get_ports {DMP_o[2]}] [get_ports           \
{DMP_o[1]}] [get_ports {DMP_o[0]}] [get_ports {DmP_o[30]}] [get_ports          \
{DmP_o[29]}] [get_ports {DmP_o[28]}] [get_ports {DmP_o[27]}] [get_ports        \
{DmP_o[26]}] [get_ports {DmP_o[25]}] [get_ports {DmP_o[24]}] [get_ports        \
{DmP_o[23]}] [get_ports {DmP_o[22]}] [get_ports {DmP_o[21]}] [get_ports        \
{DmP_o[20]}] [get_ports {DmP_o[19]}] [get_ports {DmP_o[18]}] [get_ports        \
{DmP_o[17]}] [get_ports {DmP_o[16]}] [get_ports {DmP_o[15]}] [get_ports        \
{DmP_o[14]}] [get_ports {DmP_o[13]}] [get_ports {DmP_o[12]}] [get_ports        \
{DmP_o[11]}] [get_ports {DmP_o[10]}] [get_ports {DmP_o[9]}] [get_ports         \
{DmP_o[8]}] [get_ports {DmP_o[7]}] [get_ports {DmP_o[6]}] [get_ports           \
{DmP_o[5]}] [get_ports {DmP_o[4]}] [get_ports {DmP_o[3]}] [get_ports           \
{DmP_o[2]}] [get_ports {DmP_o[1]}] [get_ports {DmP_o[0]}]]
