# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Oct 13 19:23:49 2016
# Designs open: 1
#   Sim: /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Wave.1: 151 signals
#   Group count = 14
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
#   Group Barrel_Shifter_S_V_mux signal count = 7
#   Group FS_Module signal count = 43
#   Group Add_Subt_Sgf_module signal count = 10
#   Group Add_Sub_Sgf_Oper_B_mux signal count = 5
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/DVEfiles/session.tcl" type="Debug">

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 230]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 230
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 229} {height 489} {dock_state left} {dock_on_new_line true} {child_hier_colhier 217} {child_hier_coltype 10} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 125]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 125
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 124} {height 489} {dock_state left} {dock_on_new_line true} {child_data_colvariable 80} {child_data_colvalue 10} {child_data_coltype 25} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set DriverLoad.1 [gui_create_window -type DriverLoad -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 129]
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_width -value_type integer -value 150
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_height -value_type integer -value 129
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DriverLoad.1} {{left 0} {top 0} {width 1359} {height 128} {dock_state bottom} {dock_on_new_line false}}
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
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 269} {child_wave_right 730} {child_wave_colname 122} {child_wave_colvalue 143} {child_wave_col1 0} {child_wave_col2 1}}

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
gui_set_env SIMSETUP::SIMEXE {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv}] } {
gui_sim_run Ucli -exe simv -args { +v2k +lint=all -l log_name +define+SINGLE -ucligui} -dir /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE -nosource
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
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module}
gui_load_child_values {Testbench_FPU_Add_Subt.uut}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.FS_Module}


set _session_group_91 Testbench_FPU_Add_Subt
gui_sg_create "$_session_group_91"
set Testbench_FPU_Add_Subt "$_session_group_91"


set _session_group_92 Group1
gui_sg_create "$_session_group_92"
set Group1 "$_session_group_92"


set _session_group_93 Group2
gui_sg_create "$_session_group_93"
set Group2 "$_session_group_93"


set _session_group_94 Group3
gui_sg_create "$_session_group_94"
set Group3 "$_session_group_94"


set _session_group_95 Group4
gui_sg_create "$_session_group_95"
set Group4 "$_session_group_95"


set _session_group_96 Group5
gui_sg_create "$_session_group_96"
set Group5 "$_session_group_96"


set _session_group_97 Group6
gui_sg_create "$_session_group_97"
set Group6 "$_session_group_97"


set _session_group_98 Group7
gui_sg_create "$_session_group_98"
set Group7 "$_session_group_98"


set _session_group_99 Group8
gui_sg_create "$_session_group_99"
set Group8 "$_session_group_99"

gui_sg_addsignal -group "$_session_group_99" { }
gui_sg_addsignal -group "$_session_group_99" { Divider } -divider
gui_sg_addsignal -group "$_session_group_99" { Testbench_FPU_Add_Subt.uut.A_S_C Testbench_FPU_Add_Subt.uut.A_S_P Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_A_D1 Testbench_FPU_Add_Subt.uut.Add_Subt_LZD }
gui_sg_addsignal -group "$_session_group_99" { Divider } -divider
gui_sg_addsignal -group "$_session_group_99" { Testbench_FPU_Add_Subt.uut.EWR Testbench_FPU_Add_Subt.uut.EW Testbench_FPU_Add_Subt.uut.W Testbench_FPU_Add_Subt.uut.clk Testbench_FPU_Add_Subt.uut.clk Testbench_FPU_Add_Subt.uut.rst Testbench_FPU_Add_Subt.uut.beg_FSM Testbench_FPU_Add_Subt.uut.ack_FSM Testbench_FPU_Add_Subt.uut.Data_X Testbench_FPU_Add_Subt.uut.Data_Y Testbench_FPU_Add_Subt.uut.add_subt Testbench_FPU_Add_Subt.uut.r_mode Testbench_FPU_Add_Subt.uut.overflow_flag Testbench_FPU_Add_Subt.uut.underflow_flag Testbench_FPU_Add_Subt.uut.ready Testbench_FPU_Add_Subt.uut.final_result_ieee Testbench_FPU_Add_Subt.uut.FSM_op_start_in_load_a Testbench_FPU_Add_Subt.uut.FSM_op_start_in_load_b Testbench_FPU_Add_Subt.uut.DMP Testbench_FPU_Add_Subt.uut.DmP Testbench_FPU_Add_Subt.uut.DmP Testbench_FPU_Add_Subt.uut.real_op Testbench_FPU_Add_Subt.uut.sign_final_result Testbench_FPU_Add_Subt.uut.FSM_selector_A Testbench_FPU_Add_Subt.uut.S_Oper_A_exp Testbench_FPU_Add_Subt.uut.FSM_selector_B Testbench_FPU_Add_Subt.uut.S_Oper_B_exp Testbench_FPU_Add_Subt.uut.FSM_exp_operation_A_S Testbench_FPU_Add_Subt.uut.FSM_exp_operation_load_OU Testbench_FPU_Add_Subt.uut.FSM_exp_operation_load_diff Testbench_FPU_Add_Subt.uut.exp_oper_result Testbench_FPU_Add_Subt.uut.S_Shift_Value Testbench_FPU_Add_Subt.uut.clk Testbench_FPU_Add_Subt.uut.S_Shift_Value Testbench_FPU_Add_Subt.uut.Sgf_normalized_result Testbench_FPU_Add_Subt.uut.FSM_selector_C Testbench_FPU_Add_Subt.uut.FSM_selector_C Testbench_FPU_Add_Subt.uut.S_Data_Shift Testbench_FPU_Add_Subt.uut.S_Data_Shift Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_B_S Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_L_R Testbench_FPU_Add_Subt.uut.FSM_barrel_shifter_load Testbench_FPU_Add_Subt.uut.S_Data_Shift Testbench_FPU_Add_Subt.uut.Sgf_normalized_result Testbench_FPU_Add_Subt.uut.FSM_selector_D Testbench_FPU_Add_Subt.uut.FSM_selector_D Testbench_FPU_Add_Subt.uut.S_A_S_op Testbench_FPU_Add_Subt.uut.S_A_S_Oper_A Testbench_FPU_Add_Subt.uut.S_A_S_Oper_A Testbench_FPU_Add_Subt.uut.S_A_S_Oper_B Testbench_FPU_Add_Subt.uut.S_A_S_Oper_B Testbench_FPU_Add_Subt.uut.FSM_Add_Subt_Sgf_load Testbench_FPU_Add_Subt.uut.add_overflow_flag Testbench_FPU_Add_Subt.uut.Add_Subt_result Testbench_FPU_Add_Subt.uut.Add_Subt_result Testbench_FPU_Add_Subt.uut.Add_Subt_result Testbench_FPU_Add_Subt.uut.FSM_LZA_load Testbench_FPU_Add_Subt.uut.LZA_output Testbench_FPU_Add_Subt.uut.round_flag Testbench_FPU_Add_Subt.uut.FSM_Final_Result_load Testbench_FPU_Add_Subt.uut.rst_int Testbench_FPU_Add_Subt.uut.selector_A Testbench_FPU_Add_Subt.uut.selector_B Testbench_FPU_Add_Subt.uut.load_b Testbench_FPU_Add_Subt.uut.selector_C Testbench_FPU_Add_Subt.uut.selector_D Testbench_FPU_Add_Subt.uut.zero_flag Testbench_FPU_Add_Subt.uut.Exp_oper_B_D1 Testbench_FPU_Add_Subt.uut.Exp_oper_B_D2 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_D2 }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.EWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.EW}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.W}
gui_set_display_scheme -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_display_scheme -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_display_scheme -scheme scalarStrength -signal {Sim:Testbench_FPU_Add_Subt.uut.clk}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.S_Data_Shift}
gui_set_radix -radix {binary} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.Sgf_normalized_result}

set _session_group_100 Barrel_Shifter_module
gui_sg_create "$_session_group_100"
set Barrel_Shifter_module "$_session_group_100"

gui_sg_addsignal -group "$_session_group_100" { Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.clk Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.rst Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.load_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Shift_Value_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Shift_Data_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Left_Right_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Bit_Shift_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.N_mant_o Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Data_Reg Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.load_o }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR}

set _session_group_101 Barrel_Shifter_S_V_mux
gui_sg_create "$_session_group_101"
set Barrel_Shifter_S_V_mux "$_session_group_101"

gui_sg_addsignal -group "$_session_group_101" { Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.W Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.ctrl Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.ctrl Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.D0 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.D1 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.D2 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.S }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.W}

set _session_group_102 FS_Module
gui_sg_create "$_session_group_102"
set FS_Module "$_session_group_102"

gui_sg_addsignal -group "$_session_group_102" { Testbench_FPU_Add_Subt.uut.FS_Module.A_S_op_o Testbench_FPU_Add_Subt.uut.FS_Module.load_2_o Testbench_FPU_Add_Subt.uut.FS_Module.bit_shift_o Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add Testbench_FPU_Add_Subt.uut.FS_Module.load_3_o Testbench_FPU_Add_Subt.uut.FS_Module.round_sgf Testbench_FPU_Add_Subt.uut.FS_Module.zero_info_state Testbench_FPU_Add_Subt.uut.FS_Module.extra1_64 Testbench_FPU_Add_Subt.uut.FS_Module.load_4_o Testbench_FPU_Add_Subt.uut.FS_Module.extra2_64 Testbench_FPU_Add_Subt.uut.FS_Module.add_overflow_i Testbench_FPU_Add_Subt.uut.FS_Module.state_reg Testbench_FPU_Add_Subt.uut.FS_Module.state_next Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add_r Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_b_o Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_b_load_o Testbench_FPU_Add_Subt.uut.FS_Module.load_final_result Testbench_FPU_Add_Subt.uut.FS_Module.ready Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_a_o Testbench_FPU_Add_Subt.uut.FS_Module.rst_FSM Testbench_FPU_Add_Subt.uut.FS_Module.ready_flag Testbench_FPU_Add_Subt.uut.FS_Module.load_5_o Testbench_FPU_Add_Subt.uut.FS_Module.load_oper Testbench_FPU_Add_Subt.uut.FS_Module.add_subt Testbench_FPU_Add_Subt.uut.FS_Module.load_6_o Testbench_FPU_Add_Subt.uut.FS_Module.beg_FSM Testbench_FPU_Add_Subt.uut.FS_Module.left_right_o Testbench_FPU_Add_Subt.uut.FS_Module.norm_iteration_i Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_c_o Testbench_FPU_Add_Subt.uut.FS_Module.zero_flag_i Testbench_FPU_Add_Subt.uut.FS_Module.load_7_o Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_r Testbench_FPU_Add_Subt.uut.FS_Module.round_i Testbench_FPU_Add_Subt.uut.FS_Module.clk Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_d_o Testbench_FPU_Add_Subt.uut.FS_Module.start Testbench_FPU_Add_Subt.uut.FS_Module.load_8_o Testbench_FPU_Add_Subt.uut.FS_Module.add_subt_r Testbench_FPU_Add_Subt.uut.FS_Module.load_diff_exp Testbench_FPU_Add_Subt.uut.FS_Module.load_1_o Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_first Testbench_FPU_Add_Subt.uut.FS_Module.rst_int Testbench_FPU_Add_Subt.uut.FS_Module.rst }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.round_sgf}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.round_sgf}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.zero_info_state}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.zero_info_state}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.extra1_64}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.extra1_64}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.extra2_64}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.extra2_64}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add_r}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add_r}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.load_final_result}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.load_final_result}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.ready_flag}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.ready_flag}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.load_oper}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.load_oper}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.add_subt}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.add_subt}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_r}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_r}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.start}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.start}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.add_subt_r}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.add_subt_r}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.load_diff_exp}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.load_diff_exp}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_first}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_first}

set _session_group_103 Add_Subt_Sgf_module
gui_sg_create "$_session_group_103"
set Add_Subt_Sgf_module "$_session_group_103"

gui_sg_addsignal -group "$_session_group_103" { Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.clk Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.rst Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.load_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Data_A_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.PreData_B_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Data_Result_o Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Add_Sub_op_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.FSM_C_o Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.S_to_D Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Co_to_D }

set _session_group_104 Add_Sub_Sgf_Oper_B_mux
gui_sg_create "$_session_group_104"
set Add_Sub_Sgf_Oper_B_mux "$_session_group_104"

gui_sg_addsignal -group "$_session_group_104" { Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.ctrl Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.D0 Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.D1 Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.S Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.W }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.W}

# Global: Highlighting
gui_highlight_signals -color #006400 {{Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_b_o[1:0]}}
gui_highlight_signals -color #008b8b {{Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add_r[3:0]} Testbench_FPU_Add_Subt.uut.FS_Module.add_overflow_i}
gui_highlight_signals -color #00ff00 {{Testbench_FPU_Add_Subt.uut.FS_Module.state_reg[3:0]}}

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 195000



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
catch {gui_list_select -id ${Hier.1} {Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux}}
gui_view_scroll -id ${Hier.1} -vertical -set 38
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 38
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_create -id ${Wave.1} M1 0
gui_marker_create -id ${Wave.1} M3 246056
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 82326 383622
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
gui_list_add_group -id ${Wave.1} -after {New Group} {Barrel_Shifter_S_V_mux}
gui_list_add_group -id ${Wave.1} -after {New Group} {FS_Module}
gui_list_add_group -id ${Wave.1} -after {New Group} {Add_Subt_Sgf_module}
gui_list_add_group -id ${Wave.1} -after {New Group} {Add_Sub_Sgf_Oper_B_mux}
gui_list_collapse -id ${Wave.1} Barrel_Shifter_S_V_mux
gui_list_collapse -id ${Wave.1} FS_Module
gui_list_select -id ${Wave.1} {Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.D0 }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Add_Subt_Sgf_module  -item Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Co_to_D -position below

gui_marker_move -id ${Wave.1} {C1} 195000
gui_view_scroll -id ${Wave.1} -vertical -set 2518
gui_show_grid -id ${Wave.1} -enable false

# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal {Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_b_o[1:0]} -time 195000 -starttime 199235
gui_get_drivers -session -id ${DriverLoad.1} -signal {Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.PreData_B_i[25:0]} -time 195000 -starttime 195000
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

