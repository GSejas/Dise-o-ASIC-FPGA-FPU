# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Wed Oct 12 17:27:13 2016
# Toplevel windows open: 1
# 	TopLevel.1
#   Wave.1: 434 signals
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="View" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/BARREL_SHIFTER/session2.inter.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 1ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Wed Oct 12 17:27:13 2016
# 434 signals
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#Add ncecessay scopes
gui_load_child_values {Testbench_Barrel_Shifter.shift_mux_array1}
gui_load_child_values {Testbench_Barrel_Shifter.shift_mux_array2}
gui_load_child_values {Testbench_Barrel_Shifter.shift_mux_array3}
gui_load_child_values {Testbench_Barrel_Shifter.shift_mux_array4}
gui_load_child_values {Testbench_Barrel_Shifter.shift_mux_array5}
gui_load_child_values {Testbench_Barrel_Shifter}

gui_set_time_units 1ps

set _wave_session_group_1 Testbench_Barrel_Shifter
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:Testbench_Barrel_Shifter.Bit_Shift_i} {Sim:Testbench_Barrel_Shifter.Contador_shiftvalue} {Sim:Testbench_Barrel_Shifter.Data_arrayHW} {Sim:Testbench_Barrel_Shifter.Data_array} {Sim:Testbench_Barrel_Shifter.EWR} {Sim:Testbench_Barrel_Shifter.Left_Right_i} {Sim:Testbench_Barrel_Shifter.N_mant_o} {Sim:Testbench_Barrel_Shifter.PERIOD} {Sim:Testbench_Barrel_Shifter.SWR} {Sim:Testbench_Barrel_Shifter.Shift_Data_i} {Sim:Testbench_Barrel_Shifter.Shift_Value_i} {Sim:Testbench_Barrel_Shifter.clk} {Sim:Testbench_Barrel_Shifter.load_i} {Sim:Testbench_Barrel_Shifter.rst} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.Contador_shiftvalue}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.Contador_shiftvalue}
gui_set_radix -radix enum -signals {Sim:Testbench_Barrel_Shifter.Data_arrayHW}
gui_set_radix -radix enum -signals {Sim:Testbench_Barrel_Shifter.Data_array}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.EWR}
gui_set_radix -radix {binary} -signals {Sim:Testbench_Barrel_Shifter.N_mant_o}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_Barrel_Shifter.N_mant_o}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.SWR}
gui_set_radix -radix {binary} -signals {Sim:Testbench_Barrel_Shifter.Shift_Data_i}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_Barrel_Shifter.Shift_Data_i}

set _wave_session_group_2 shift_mux_array1
if {[gui_sg_is_group -name "$_wave_session_group_2"]} {
    set _wave_session_group_2 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_2"

gui_sg_addsignal -group "$_wave_session_group_2" { {Sim:Testbench_Barrel_Shifter.shift_mux_array1.Data_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.Data_o} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.LEVEL} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].lvl} }
gui_sg_addsignal -group "$_wave_session_group_2" { {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.SWR} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.bit_shift_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array1.select_i} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array1.LEVEL}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array1.LEVEL}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[0].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[1].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[2].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[3].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[4].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[5].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[6].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[7].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[8].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[9].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[10].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[11].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[12].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[13].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[14].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[15].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[16].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[17].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[18].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[19].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[20].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[21].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[22].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[23].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[24].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array1.MUX_ODDNORM[25].x}}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array1.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array1.SWR}

set _wave_session_group_3 shift_mux_array2
if {[gui_sg_is_group -name "$_wave_session_group_3"]} {
    set _wave_session_group_3 [gui_sg_generate_new_name]
}
set Group3 "$_wave_session_group_3"

gui_sg_addsignal -group "$_wave_session_group_3" { {Sim:Testbench_Barrel_Shifter.shift_mux_array2.Data_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.Data_o} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.LEVEL} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].lvl} }
gui_sg_addsignal -group "$_wave_session_group_3" { {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.SWR} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.bit_shift_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array2.select_i} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array2.LEVEL}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array2.LEVEL}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[0].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[1].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[2].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[3].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[4].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[5].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[6].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[7].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[8].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[9].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[10].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[11].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[12].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[13].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[14].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[15].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[16].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[17].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[18].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[19].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[20].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[21].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[22].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[23].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[24].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array2.MUX_ODDNORM[25].x}}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array2.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array2.SWR}

set _wave_session_group_4 shift_mux_array3
if {[gui_sg_is_group -name "$_wave_session_group_4"]} {
    set _wave_session_group_4 [gui_sg_generate_new_name]
}
set Group4 "$_wave_session_group_4"

gui_sg_addsignal -group "$_wave_session_group_4" { {Sim:Testbench_Barrel_Shifter.shift_mux_array3.Data_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.Data_o} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.LEVEL} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].lvl} }
gui_sg_addsignal -group "$_wave_session_group_4" { {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.SWR} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.bit_shift_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array3.select_i} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array3.LEVEL}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array3.LEVEL}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[0].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[1].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[2].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[3].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[4].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[5].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[6].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[7].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[8].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[9].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[10].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[11].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[12].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[13].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[14].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[15].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[16].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[17].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[18].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[19].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[20].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[21].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[22].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[23].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[24].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array3.MUX_ODDNORM[25].x}}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array3.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array3.SWR}

set _wave_session_group_5 shift_mux_array4
if {[gui_sg_is_group -name "$_wave_session_group_5"]} {
    set _wave_session_group_5 [gui_sg_generate_new_name]
}
set Group5 "$_wave_session_group_5"

gui_sg_addsignal -group "$_wave_session_group_5" { {Sim:Testbench_Barrel_Shifter.shift_mux_array4.Data_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.Data_o} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.LEVEL} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].lvl} }
gui_sg_addsignal -group "$_wave_session_group_5" { {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.SWR} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.bit_shift_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array4.select_i} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array4.LEVEL}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array4.LEVEL}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[0].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[1].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[2].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[3].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[4].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[5].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[6].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[7].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[8].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[9].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[10].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[11].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[12].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[13].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[14].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[15].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[16].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[17].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[18].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[19].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[20].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[21].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[22].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[23].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[24].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array4.MUX_ODDNORM[25].x}}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array4.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array4.SWR}

set _wave_session_group_6 shift_mux_array5
if {[gui_sg_is_group -name "$_wave_session_group_6"]} {
    set _wave_session_group_6 [gui_sg_generate_new_name]
}
set Group6 "$_wave_session_group_6"

gui_sg_addsignal -group "$_wave_session_group_6" { {Sim:Testbench_Barrel_Shifter.shift_mux_array5.Data_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.Data_o} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.LEVEL} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].lvl} }
gui_sg_addsignal -group "$_wave_session_group_6" { {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].lvl} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].sh} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].x} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.SWR} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.bit_shift_i} {Sim:Testbench_Barrel_Shifter.shift_mux_array5.select_i} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array5.LEVEL}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array5.LEVEL}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[0].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[1].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[2].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[3].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[4].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[5].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[6].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[7].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[8].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[9].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[10].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[11].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[12].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[13].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[14].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[15].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[16].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[17].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[18].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[19].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[20].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[21].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[22].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[23].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[24].x}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].lvl}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].sh}}
gui_set_radix -radix {decimal} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].x}}
gui_set_radix -radix {twosComplement} -signals {{Sim:Testbench_Barrel_Shifter.shift_mux_array5.MUX_ODDNORM[25].x}}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array5.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.shift_mux_array5.SWR}
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 10240000
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group3}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group4}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group5}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group6}]
gui_list_collapse -id ${Wave.1} ${Group2}
gui_list_collapse -id ${Wave.1} ${Group3}
gui_list_collapse -id ${Wave.1} ${Group4}
gui_list_collapse -id ${Wave.1} ${Group5}
gui_list_select -id ${Wave.1} {Testbench_Barrel_Shifter.Data_arrayHW Testbench_Barrel_Shifter.Data_array Testbench_Barrel_Shifter.N_mant_o Testbench_Barrel_Shifter.Shift_Data_i }
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group6}  -position in

gui_marker_move -id ${Wave.1} {C1} 10240000
gui_view_scroll -id ${Wave.1} -vertical -set 100
gui_show_grid -id ${Wave.1} -enable false
#</Session>

