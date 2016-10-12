# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Tue Oct 11 15:24:48 2016
# Toplevel windows open: 1
# 	TopLevel.1
#   Wave.1: 72 signals
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="View" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/session.inter.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 1ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Tue Oct 11 15:24:48 2016
# 72 signals
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#Add ncecessay scopes

gui_set_time_units 1ps

set _wave_session_group_1 Testbench_FPU_Add_Subt
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { } 

set _wave_session_group_2 Group1
if {[gui_sg_is_group -name "$_wave_session_group_2"]} {
    set _wave_session_group_2 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_2"

gui_sg_addsignal -group "$_wave_session_group_2" { } 

set _wave_session_group_3 Group2
if {[gui_sg_is_group -name "$_wave_session_group_3"]} {
    set _wave_session_group_3 [gui_sg_generate_new_name]
}
set Group3 "$_wave_session_group_3"

gui_sg_addsignal -group "$_wave_session_group_3" { } 

set _wave_session_group_4 Group3
if {[gui_sg_is_group -name "$_wave_session_group_4"]} {
    set _wave_session_group_4 [gui_sg_generate_new_name]
}
set Group4 "$_wave_session_group_4"

gui_sg_addsignal -group "$_wave_session_group_4" { } 

set _wave_session_group_5 Group4
if {[gui_sg_is_group -name "$_wave_session_group_5"]} {
    set _wave_session_group_5 [gui_sg_generate_new_name]
}
set Group5 "$_wave_session_group_5"

gui_sg_addsignal -group "$_wave_session_group_5" { } 

set _wave_session_group_6 Group5
if {[gui_sg_is_group -name "$_wave_session_group_6"]} {
    set _wave_session_group_6 [gui_sg_generate_new_name]
}
set Group6 "$_wave_session_group_6"

gui_sg_addsignal -group "$_wave_session_group_6" { } 

set _wave_session_group_7 Group6
if {[gui_sg_is_group -name "$_wave_session_group_7"]} {
    set _wave_session_group_7 [gui_sg_generate_new_name]
}
set Group7 "$_wave_session_group_7"

gui_sg_addsignal -group "$_wave_session_group_7" { } 

set _wave_session_group_8 Group7
if {[gui_sg_is_group -name "$_wave_session_group_8"]} {
    set _wave_session_group_8 [gui_sg_generate_new_name]
}
set Group8 "$_wave_session_group_8"

gui_sg_addsignal -group "$_wave_session_group_8" { } 

set _wave_session_group_9 Group8
if {[gui_sg_is_group -name "$_wave_session_group_9"]} {
    set _wave_session_group_9 [gui_sg_generate_new_name]
}
set Group9 "$_wave_session_group_9"

gui_sg_addsignal -group "$_wave_session_group_9" { {Sim:Testbench_FPU_Add_Subt.uut.A_S_C} {Sim:Testbench_FPU_Add_Subt.uut.A_S_P} {Sim:Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_A_D1} {Sim:Testbench_FPU_Add_Subt.uut.Add_Subt_LZD} {Sim:Testbench_FPU_Add_Subt.uut.Add_Subt_result} {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_D2} {Sim:Testbench_FPU_Add_Subt.uut.DMP} {Sim:Testbench_FPU_Add_Subt.uut.Data_X} {Sim:Testbench_FPU_Add_Subt.uut.Data_Y} {Sim:Testbench_FPU_Add_Subt.uut.DmP} {Sim:Testbench_FPU_Add_Subt.uut.EWR} {Sim:Testbench_FPU_Add_Subt.uut.EW} {Sim:Testbench_FPU_Add_Subt.uut.Exp_oper_B_D1} {Sim:Testbench_FPU_Add_Subt.uut.Exp_oper_B_D2} {Sim:Testbench_FPU_Add_Subt.uut.FSM_Add_Subt_Sgf_load} {Sim:Testbench_FPU_Add_Subt.uut.FSM_Final_Result_load} {Sim:Testbench_FPU_Add_Subt.uut.FSM_LZA_load} {Sim:Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_B_S} {Sim:Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_L_R} {Sim:Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_load} {Sim:Testbench_FPU_Add_Subt.uut.FSM_exp_operation_A_S} {Sim:Testbench_FPU_Add_Subt.uut.FSM_exp_operation_load_OU} {Sim:Testbench_FPU_Add_Subt.uut.FSM_exp_operation_load_diff} {Sim:Testbench_FPU_Add_Subt.uut.FSM_op_start_in_load_a} {Sim:Testbench_FPU_Add_Subt.uut.FSM_op_start_in_load_b} {Sim:Testbench_FPU_Add_Subt.uut.FSM_selector_A} {Sim:Testbench_FPU_Add_Subt.uut.FSM_selector_B} {Sim:Testbench_FPU_Add_Subt.uut.FSM_selector_C} {Sim:Testbench_FPU_Add_Subt.uut.FSM_selector_D} {Sim:Testbench_FPU_Add_Subt.uut.LZA_output} {Sim:Testbench_FPU_Add_Subt.uut.S_A_S_Oper_A} {Sim:Testbench_FPU_Add_Subt.uut.S_A_S_Oper_B} {Sim:Testbench_FPU_Add_Subt.uut.S_A_S_op} {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift} {Sim:Testbench_FPU_Add_Subt.uut.S_Oper_A_exp} {Sim:Testbench_FPU_Add_Subt.uut.S_Oper_B_exp} {Sim:Testbench_FPU_Add_Subt.uut.S_Shift_Value} {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result} {Sim:Testbench_FPU_Add_Subt.uut.W} {Sim:Testbench_FPU_Add_Subt.uut.ack_FSM} {Sim:Testbench_FPU_Add_Subt.uut.add_overflow_flag} {Sim:Testbench_FPU_Add_Subt.uut.add_subt} {Sim:Testbench_FPU_Add_Subt.uut.beg_FSM} {Sim:Testbench_FPU_Add_Subt.uut.clk} {Sim:Testbench_FPU_Add_Subt.uut.exp_oper_result} {Sim:Testbench_FPU_Add_Subt.uut.final_result_ieee} {Sim:Testbench_FPU_Add_Subt.uut.load_b} {Sim:Testbench_FPU_Add_Subt.uut.overflow_flag} {Sim:Testbench_FPU_Add_Subt.uut.r_mode} {Sim:Testbench_FPU_Add_Subt.uut.ready} {Sim:Testbench_FPU_Add_Subt.uut.real_op} {Sim:Testbench_FPU_Add_Subt.uut.round_flag} {Sim:Testbench_FPU_Add_Subt.uut.rst} {Sim:Testbench_FPU_Add_Subt.uut.rst_int} {Sim:Testbench_FPU_Add_Subt.uut.selector_A} {Sim:Testbench_FPU_Add_Subt.uut.selector_B} {Sim:Testbench_FPU_Add_Subt.uut.selector_C} {Sim:Testbench_FPU_Add_Subt.uut.selector_D} {Sim:Testbench_FPU_Add_Subt.uut.sign_final_result} {Sim:Testbench_FPU_Add_Subt.uut.underflow_flag} {Sim:Testbench_FPU_Add_Subt.uut.zero_flag} }
gui_sg_addsignal -group "$_wave_session_group_9" { {Divider} } -divider
gui_sg_addsignal -group "$_wave_session_group_9" { {Sim:Testbench_FPU_Add_Subt.uut.FSM_selector_D} {Sim:Testbench_FPU_Add_Subt.uut.S_Shift_Value} {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift} {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result} {Sim:Testbench_FPU_Add_Subt.uut.S_A_S_Oper_A} {Sim:Testbench_FPU_Add_Subt.uut.S_A_S_Oper_B} {Sim:Testbench_FPU_Add_Subt.uut.Add_Subt_result} {Sim:Testbench_FPU_Add_Subt.uut.FSM_selector_C} {Sim:Testbench_FPU_Add_Subt.uut.Add_Subt_result} {Sim:Testbench_FPU_Add_Subt.uut.DmP} {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift} }
gui_sg_addsignal -group "$_wave_session_group_9" { {Divider} } -divider
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.EWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.EW}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.W}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
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
gui_marker_create -id ${Wave.1} M1 245000
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 102141 249401
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group3}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group4}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group5}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group6}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group7}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group8}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group9}]
gui_list_select -id ${Wave.1} {Testbench_FPU_Add_Subt.uut.S_Data_Shift }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group9}  -item {Testbench_FPU_Add_Subt.uut.S_Shift_Value[4:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 127330
gui_view_scroll -id ${Wave.1} -vertical -set 1590
gui_show_grid -id ${Wave.1} -enable false
#</Session>

