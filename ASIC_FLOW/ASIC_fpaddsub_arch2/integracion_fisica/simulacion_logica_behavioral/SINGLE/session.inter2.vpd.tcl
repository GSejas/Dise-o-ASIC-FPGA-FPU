# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Wed Oct 12 20:14:08 2016
# Designs open: 1
#   Sim: simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Wave.1: 86 signals
#   Group count = 10
#   Group Testbench_FPU_Add_Subt signal count = 0
#   Group Group1 signal count = 0
#   Group Group2 signal count = 0
#   Group Group3 signal count = 0
#   Group Group4 signal count = 0
#   Group Group5 signal count = 0
#   Group Group6 signal count = 0
#   Group Group7 signal count = 0
#   Group Group8 signal count = 76
#   Group Barrel_Shifter_module signal count = 12
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/session.inter2.vpd.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state maximized -rect {{0 24} {1359 767}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set HSPane.1 [gui_create_window -type {HSPane}  -parent ${TopLevel.1}]
if {[gui_get_shared_view -id ${HSPane.1} -type Hier] == {}} {
        set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier]
} else {
        set Hier.1  [gui_get_shared_view -id ${HSPane.1} -type Hier]
}

gui_show_window -window ${HSPane.1} -show_state maximized
gui_update_layout -id ${HSPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_hier_colhier 830} {child_hier_coltype 510} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type {DLPane}  -parent ${TopLevel.1}]
if {[gui_get_shared_view -id ${DLPane.1} -type Data] == {}} {
        set Data.1 [gui_share_window -id ${DLPane.1} -type Data]
} else {
        set Data.1  [gui_get_shared_view -id ${DLPane.1} -type Data]
}

gui_show_window -window ${DLPane.1} -show_state maximized
gui_update_layout -id ${DLPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_data_colvariable 552} {child_data_colvalue 367} {child_data_coltype 436} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 486} {child_wave_right 868} {child_wave_colname 320} {child_wave_colvalue 162} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{ +v2k +lint=all -l log_name +define+SINGLE -ucligui}}
gui_set_env SIMSETUP::SIMEXE {simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {simv}] } {
gui_sim_run Ucli -exe simv -args { +v2k +lint=all -l log_name +define+SINGLE -ucligui} -dir ../SINGLE -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module}
gui_load_child_values {Testbench_FPU_Add_Subt.uut}


set _session_group_11 Testbench_FPU_Add_Subt
gui_sg_create "$_session_group_11"
set Testbench_FPU_Add_Subt "$_session_group_11"


set _session_group_12 Group1
gui_sg_create "$_session_group_12"
set Group1 "$_session_group_12"


set _session_group_13 Group2
gui_sg_create "$_session_group_13"
set Group2 "$_session_group_13"


set _session_group_14 Group3
gui_sg_create "$_session_group_14"
set Group3 "$_session_group_14"


set _session_group_15 Group4
gui_sg_create "$_session_group_15"
set Group4 "$_session_group_15"


set _session_group_16 Group5
gui_sg_create "$_session_group_16"
set Group5 "$_session_group_16"


set _session_group_17 Group6
gui_sg_create "$_session_group_17"
set Group6 "$_session_group_17"


set _session_group_18 Group7
gui_sg_create "$_session_group_18"
set Group7 "$_session_group_18"


set _session_group_19 Group8
gui_sg_create "$_session_group_19"
set Group8 "$_session_group_19"

gui_sg_addsignal -group "$_session_group_19" { Testbench_FPU_Add_Subt.uut.zero_flag Testbench_FPU_Add_Subt.uut.underflow_flag Testbench_FPU_Add_Subt.uut.sign_final_result Testbench_FPU_Add_Subt.uut.selector_D Testbench_FPU_Add_Subt.uut.selector_C Testbench_FPU_Add_Subt.uut.selector_B Testbench_FPU_Add_Subt.uut.selector_A Testbench_FPU_Add_Subt.uut.rst_int Testbench_FPU_Add_Subt.uut.rst Testbench_FPU_Add_Subt.uut.round_flag Testbench_FPU_Add_Subt.uut.real_op Testbench_FPU_Add_Subt.uut.ready Testbench_FPU_Add_Subt.uut.r_mode Testbench_FPU_Add_Subt.uut.overflow_flag Testbench_FPU_Add_Subt.uut.load_b Testbench_FPU_Add_Subt.uut.final_result_ieee Testbench_FPU_Add_Subt.uut.exp_oper_result Testbench_FPU_Add_Subt.uut.clk Testbench_FPU_Add_Subt.uut.clk Testbench_FPU_Add_Subt.uut.clk Testbench_FPU_Add_Subt.uut.beg_FSM Testbench_FPU_Add_Subt.uut.add_subt Testbench_FPU_Add_Subt.uut.add_overflow_flag Testbench_FPU_Add_Subt.uut.ack_FSM Testbench_FPU_Add_Subt.uut.W Testbench_FPU_Add_Subt.uut.Sgf_normalized_result Testbench_FPU_Add_Subt.uut.Sgf_normalized_result Testbench_FPU_Add_Subt.uut.S_Shift_Value Testbench_FPU_Add_Subt.uut.S_Shift_Value Testbench_FPU_Add_Subt.uut.S_Oper_B_exp Testbench_FPU_Add_Subt.uut.S_Oper_A_exp Testbench_FPU_Add_Subt.uut.S_Data_Shift Testbench_FPU_Add_Subt.uut.S_Data_Shift Testbench_FPU_Add_Subt.uut.S_Data_Shift Testbench_FPU_Add_Subt.uut.S_A_S_op Testbench_FPU_Add_Subt.uut.S_A_S_Oper_B Testbench_FPU_Add_Subt.uut.S_A_S_Oper_B Testbench_FPU_Add_Subt.uut.S_A_S_Oper_A Testbench_FPU_Add_Subt.uut.S_A_S_Oper_A Testbench_FPU_Add_Subt.uut.LZA_output Testbench_FPU_Add_Subt.uut.FSM_selector_D Testbench_FPU_Add_Subt.uut.FSM_selector_D Testbench_FPU_Add_Subt.uut.FSM_selector_C Testbench_FPU_Add_Subt.uut.FSM_selector_C Testbench_FPU_Add_Subt.uut.FSM_selector_B Testbench_FPU_Add_Subt.uut.FSM_selector_A Testbench_FPU_Add_Subt.uut.FSM_op_start_in_load_b Testbench_FPU_Add_Subt.uut.FSM_op_start_in_load_a Testbench_FPU_Add_Subt.uut.FSM_exp_operation_load_diff Testbench_FPU_Add_Subt.uut.FSM_exp_operation_load_OU Testbench_FPU_Add_Subt.uut.FSM_exp_operation_A_S Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_load Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_L_R Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_B_S Testbench_FPU_Add_Subt.uut.FSM_LZA_load Testbench_FPU_Add_Subt.uut.FSM_Final_Result_load Testbench_FPU_Add_Subt.uut.FSM_Add_Subt_Sgf_load Testbench_FPU_Add_Subt.uut.Exp_oper_B_D2 Testbench_FPU_Add_Subt.uut.Exp_oper_B_D1 Testbench_FPU_Add_Subt.uut.EW Testbench_FPU_Add_Subt.uut.EWR Testbench_FPU_Add_Subt.uut.DmP Testbench_FPU_Add_Subt.uut.DmP }
gui_sg_addsignal -group "$_session_group_19" { Divider } -divider
gui_sg_addsignal -group "$_session_group_19" { }
gui_sg_addsignal -group "$_session_group_19" { Divider } -divider
gui_sg_addsignal -group "$_session_group_19" { Testbench_FPU_Add_Subt.uut.Data_Y Testbench_FPU_Add_Subt.uut.Data_X Testbench_FPU_Add_Subt.uut.DMP Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_D2 Testbench_FPU_Add_Subt.uut.Add_Subt_result Testbench_FPU_Add_Subt.uut.Add_Subt_result Testbench_FPU_Add_Subt.uut.Add_Subt_result Testbench_FPU_Add_Subt.uut.Add_Subt_LZD Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_A_D1 Testbench_FPU_Add_Subt.uut.A_S_P Testbench_FPU_Add_Subt.uut.A_S_C }
gui_set_display_scheme -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_display_scheme -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_display_scheme -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.W}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.EW}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.EWR}

set _session_group_20 Barrel_Shifter_module
gui_sg_create "$_session_group_20"
set Barrel_Shifter_module "$_session_group_20"

gui_sg_addsignal -group "$_session_group_20" { Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Data_Reg Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.load_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Shift_Data_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Shift_Value_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.load_o Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Left_Right_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.clk Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.N_mant_o Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.rst Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Bit_Shift_i }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 185000



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} Testbench_FPU_Add_Subt}
catch {gui_list_expand -id ${Hier.1} Testbench_FPU_Add_Subt.uut}
catch {gui_list_select -id ${Hier.1} {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module}}
gui_view_scroll -id ${Hier.1} -vertical -set 11
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 11
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_create -id ${Wave.1} M1 245000
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 339914
gui_list_add_group -id ${Wave.1} -after {New Group} {Testbench_FPU_Add_Subt}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group3}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group4}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group5}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group6}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group7}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group8}
gui_list_add_group -id ${Wave.1} -after {New Group} {Barrel_Shifter_module}
gui_list_select -id ${Wave.1} {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.load_o }
gui_seek_criteria -id ${Wave.1} {Any Edge}

gui_set_display_scheme -id ${Wave.1} -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_display_scheme -id ${Wave.1} -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_display_scheme -id ${Wave.1} -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}


gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Barrel_Shifter_module  -position in

gui_marker_move -id ${Wave.1} {C1} 185000
gui_view_scroll -id ${Wave.1} -vertical -set 1990
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${DLPane.1}
}
#</Session>

