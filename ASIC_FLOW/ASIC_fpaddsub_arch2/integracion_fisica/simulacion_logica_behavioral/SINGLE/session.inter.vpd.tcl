# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Mon Oct 10 00:45:53 2016
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 15 signals
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
# Saved on Mon Oct 10 00:45:53 2016
# 15 signals
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

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:Testbench_FPU_Add_Subt.contador} {Sim:Testbench_FPU_Add_Subt.underflow_flag} {Sim:Testbench_FPU_Add_Subt.overflow_flag} {Sim:Testbench_FPU_Add_Subt.ready} {Sim:Testbench_FPU_Add_Subt.ack_FSM} {Sim:Testbench_FPU_Add_Subt.add_subt} {Sim:Testbench_FPU_Add_Subt.beg_FSM} {Sim:Testbench_FPU_Add_Subt.final_result_ieee} {Sim:Testbench_FPU_Add_Subt.clk} {Sim:Testbench_FPU_Add_Subt.Data_X} {Sim:Testbench_FPU_Add_Subt.Data_Y} }
gui_sg_addsignal -group "$_wave_session_group_1" { {Divider} } -divider
gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:Testbench_FPU_Add_Subt.r_mode} {Sim:Testbench_FPU_Add_Subt.Recept} {Sim:Testbench_FPU_Add_Subt.Cont_CLK} {Sim:Testbench_FPU_Add_Subt.rst} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.contador}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.contador}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:Testbench_FPU_Add_Subt.final_result_ieee}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:Testbench_FPU_Add_Subt.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:Testbench_FPU_Add_Subt.Data_Y}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.Recept}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.Recept}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.Cont_CLK}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.Cont_CLK}
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
gui_wv_zoom_timerange -id ${Wave.1} 0 1359650
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_select -id ${Wave.1} {Testbench_FPU_Add_Subt.overflow_flag }
gui_seek_criteria -id ${Wave.1} {Any Edge}

gui_set_display_scheme -id ${Wave.1} -scheme vlgvector1 -signal {Sim:Testbench_FPU_Add_Subt.Data_X}

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
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group1}  -item Testbench_FPU_Add_Subt.overflow_flag -position below

gui_marker_move -id ${Wave.1} {C1} 127830
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

