


analyze -library WORK -format verilog Shifter_DW_combinational.v
elaborate Mux_Array_DW
set_cost_priority -delay
create_clock -period 10 clk

set_max_delay 5 {Data_o}
compile_ultra
write -hierarchy -format verilog -output ./db/Mux_Array_DW_syn.v
