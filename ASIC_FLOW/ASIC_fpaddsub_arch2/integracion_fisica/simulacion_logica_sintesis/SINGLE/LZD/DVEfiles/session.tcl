# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Tue Oct 18 14:21:14 2016
# Designs open: 1
#   Sim: /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_sintesis/SINGLE/LZD/simv
# Toplevel windows open: 1
# 	TopLevel.2
#   Wave.2: 10 signals
#   Schematic.2: .
#   Group count = 3
#   Group tb_LZD signal count = 9
#   Group bt_Schematic.2 signal count = 4
#   Group bt_end-points_Schematic.2 signal count = 6
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_sintesis/SINGLE/LZD/DVEfiles/session.tcl" type="Debug">

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


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{3 52} {1360 755}}

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
gui_set_toolbar_attributes -toolbar {BackTrace} -dock_state top
gui_set_toolbar_attributes -toolbar {BackTrace} -offset 0
gui_show_toolbar -toolbar {BackTrace}
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
set Wave.2 [gui_create_window -type Wave -parent ${TopLevel.2} -dock_state bottom -dock_on_new_line false -dock_extent 261]
gui_set_window_pref_key -window ${Wave.2} -key dock_width -value_type integer -value -1
gui_set_window_pref_key -window ${Wave.2} -key dock_height -value_type integer -value 261
gui_set_window_pref_key -window ${Wave.2} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Wave.2} {{left 0} {top 0} {width 1357} {height 260} {dock_state bottom} {dock_on_new_line false} {child_wave_left 387} {child_wave_right 945} {child_wave_colname 261} {child_wave_colvalue 122} {child_wave_col1 0} {child_wave_col2 1}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
gui_use_schematics
set Schematic.2 [gui_create_window -type {Schematic}  -parent ${TopLevel.2} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DveBtSchematicSettings]
Misc::init_window $setting ${Schematic.2}
::Misc::exec_method -window ${Schematic.2} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.2}
gui_show_window -window ${Schematic.2} -show_state maximized
gui_update_layout -id ${Schematic.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) none
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) none
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{ +v2k +lint=all -a log_name +define+SYN_SINGLE -ucligui}}
gui_set_env SIMSETUP::SIMEXE {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_sintesis/SINGLE/LZD/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_sintesis/SINGLE/LZD/simv}] } {
gui_sim_run Ucli -exe simv -args { +v2k +lint=all -a log_name +define+SYN_SINGLE -ucligui} -dir /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_sintesis/SINGLE/LZD -nosource
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


set _session_group_1 tb_LZD
gui_sg_create "$_session_group_1"
set tb_LZD "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { tb_LZD.Contador tb_LZD.load_i tb_LZD.SWR tb_LZD.Shift_Value_o tb_LZD.PERIOD tb_LZD.Add_subt_result_i tb_LZD.EWR tb_LZD.clk tb_LZD.rst }
gui_set_radix -radix {decimal} -signals {Sim:tb_LZD.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_LZD.SWR}
gui_set_radix -radix {decimal} -signals {Sim:tb_LZD.Shift_Value_o}
gui_set_radix -radix {unsigned} -signals {Sim:tb_LZD.Shift_Value_o}
gui_set_radix -radix {decimal} -signals {Sim:tb_LZD.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_LZD.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:tb_LZD.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_LZD.EWR}

set _session_group_2 bt_Schematic.2
gui_sg_create "$_session_group_2"
set bt_Schematic.2 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { {tb_LZD.Shift_Value_o[1]} tb_LZD.inst_LZD.Output_Reg.clk tb_LZD.clk {tb_LZD.inst_LZD.Output_Reg.Q[4]} }

set _session_group_3 bt_end-points_Schematic.2
gui_sg_create "$_session_group_3"
set bt_end-points_Schematic.2 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { {tb_LZD.inst_LZD.Output_Reg.\Q_reg[0] .D} tb_LZD.inst_LZD.Output_Reg.clk {tb_LZD.inst_LZD.Output_Reg.\Q_reg[1] .D} {tb_LZD.inst_LZD.Output_Reg.\Q_reg[2] .D} {tb_LZD.inst_LZD.Output_Reg.\Q_reg[3] .D} {tb_LZD.inst_LZD.Output_Reg.\Q_reg[4] .D} }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 409536000



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


# View 'Schematic.2'
gui_use_schematics

# Create backtrace schematic window 'Schematic.2'
qtcl_add_property -name ${Schematic.2} -property windowSubType -type QString -value "BtSchematic"
qtcl_set_property -name ${Schematic.2} -property useBackTraceBar -value true
gui_bt_set_start -restart -id ${Schematic.2} -time 409542715 -precision 1ps {Sim:tb_LZD.Shift_Value_o[1]}
gui_zoom -window ${Schematic.2} -rect { {-94319 -43269} {144513 3711} }



# View 'Wave.2'
gui_wv_sync -id ${Wave.2} -switch false
qtcl_set_property -name ${Wave.2} -property attachedView -value Schematic.2
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.2}  C1
gui_wv_zoom_timerange -id ${Wave.2} 163639986 655091244
gui_list_add_group -id ${Wave.2} -after {New Group} {bt_Schematic.2}
gui_list_add_group -id ${Wave.2} -after {New Group} {bt_end-points_Schematic.2}
gui_list_select -id ${Wave.2} {tb_LZD.inst_LZD.Output_Reg.clk }
gui_seek_criteria -id ${Wave.2} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.2} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.2} -text {*}
gui_list_set_insertion_bar  -id ${Wave.2} -group bt_Schematic.2  -item {tb_LZD.inst_LZD.Output_Reg.Q[4]} -position below

gui_marker_move -id ${Wave.2} {C1} 409536000
gui_view_scroll -id ${Wave.2} -vertical -set 10
gui_show_grid -id ${Wave.2} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Schematic.2}
}
#</Session>

