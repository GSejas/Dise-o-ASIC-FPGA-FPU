# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Tue Oct 11 15:03:16 2016
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 12 signals
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="View" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/BARREL_SHIFTER/session.inter.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 1ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Tue Oct 11 15:03:16 2016
# 12 signals
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#Add ncecessay scopes
gui_load_child_values {Testbench_Barrel_Shifter}

gui_set_time_units 1ps

set _wave_session_group_1 Testbench_Barrel_Shifter
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:Testbench_Barrel_Shifter.Contador_shiftvalue} {Sim:Testbench_Barrel_Shifter.load_i} {Sim:Testbench_Barrel_Shifter.Shift_Data_i} {Sim:Testbench_Barrel_Shifter.Shift_Value_i} {Sim:Testbench_Barrel_Shifter.SWR} {Sim:Testbench_Barrel_Shifter.PERIOD} {Sim:Testbench_Barrel_Shifter.Left_Right_i} {Sim:Testbench_Barrel_Shifter.EWR} {Sim:Testbench_Barrel_Shifter.clk} {Sim:Testbench_Barrel_Shifter.N_mant_o} {Sim:Testbench_Barrel_Shifter.rst} {Sim:Testbench_Barrel_Shifter.Bit_Shift_i} }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.Contador_shiftvalue}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.Contador_shiftvalue}
gui_set_radix -radix {binary} -signals {Sim:Testbench_Barrel_Shifter.Shift_Data_i}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_Barrel_Shifter.Shift_Data_i}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.SWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_Barrel_Shifter.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_Barrel_Shifter.EWR}
gui_set_radix -radix {binary} -signals {Sim:Testbench_Barrel_Shifter.N_mant_o}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_Barrel_Shifter.N_mant_o}
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
gui_wv_zoom_timerange -id ${Wave.1} 0 1724859
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_select -id ${Wave.1} {Testbench_Barrel_Shifter.Shift_Value_i }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group1}  -position in

gui_marker_move -id ${Wave.1} {C1} 144962
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

