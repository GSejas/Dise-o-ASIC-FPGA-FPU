# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Oct 13 19:31:49 2016
# Designs open: 1
#   Sim: /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: Testbench_FPU_Add_Subt
#   Wave.1: 105 signals
#   Group count = 7
#   Group Testbench_FPU_Add_Subt signal count = 24
#   Group Add_Sub_Sgf_Oper_B_mux signal count = 5
#   Group Add_Subt_Sgf_module signal count = 11
#   Group Barrel_Shifter_module signal count = 11
#   Group Barrel_Shifter_S_V_mux signal count = 6
#   Group Barrel_Shifter_D_I_mux signal count = 5
#   Group FS_Module signal count = 43
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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 259]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 259
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 258} {height 438} {dock_state left} {dock_on_new_line true} {child_hier_colhier 262} {child_hier_coltype 10} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 286]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 286
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 285} {height 438} {dock_state left} {dock_on_new_line true} {child_data_colvariable 175} {child_data_colvalue 12} {child_data_coltype 89} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 180]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 689
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 180
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1359} {height 179} {dock_state bottom} {dock_on_new_line true}}
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
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 386} {child_wave_right 423} {child_wave_colname 222} {child_wave_colvalue 160} {child_wave_col1 0} {child_wave_col2 1}}

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
gui_set_env SIMSETUP::SIMARGS {{-ucligui +v2k +lint=all -l log_name +define+SINGLE}}
gui_set_env SIMSETUP::SIMEXE {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv}] } {
gui_sim_run Ucli -exe simv -args {-ucligui +v2k +lint=all -l log_name +define+SINGLE} -dir /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE -nosource
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
gui_load_child_values {Testbench_FPU_Add_Subt}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.FS_Module}
gui_load_child_values {Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux}


set _session_group_8 Testbench_FPU_Add_Subt
gui_sg_create "$_session_group_8"
set Testbench_FPU_Add_Subt "$_session_group_8"

gui_sg_addsignal -group "$_session_group_8" { Testbench_FPU_Add_Subt.EW Testbench_FPU_Add_Subt.contador Testbench_FPU_Add_Subt.Array_IN_2 Testbench_FPU_Add_Subt.SW Testbench_FPU_Add_Subt.underflow_flag Testbench_FPU_Add_Subt.FileSaveData Testbench_FPU_Add_Subt.ready Testbench_FPU_Add_Subt.SWR Testbench_FPU_Add_Subt.ack_FSM Testbench_FPU_Add_Subt.PERIOD Testbench_FPU_Add_Subt.Array_IN Testbench_FPU_Add_Subt.add_subt Testbench_FPU_Add_Subt.EWR Testbench_FPU_Add_Subt.beg_FSM Testbench_FPU_Add_Subt.W Testbench_FPU_Add_Subt.clk Testbench_FPU_Add_Subt.r_mode Testbench_FPU_Add_Subt.Data_X Testbench_FPU_Add_Subt.Data_Y Testbench_FPU_Add_Subt.final_result_ieee Testbench_FPU_Add_Subt.Recept Testbench_FPU_Add_Subt.overflow_flag Testbench_FPU_Add_Subt.Cont_CLK Testbench_FPU_Add_Subt.rst }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.EW}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.SW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.SW}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.SWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.EWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.W}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:Testbench_FPU_Add_Subt.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:Testbench_FPU_Add_Subt.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:Testbench_FPU_Add_Subt.final_result_ieee}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.Recept}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.Recept}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.Cont_CLK}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.Cont_CLK}

set _session_group_9 Add_Sub_Sgf_Oper_B_mux
gui_sg_create "$_session_group_9"
set Add_Sub_Sgf_Oper_B_mux "$_session_group_9"

gui_sg_addsignal -group "$_session_group_9" { Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.S Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.W Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.D0 Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.D1 Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.ctrl }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Add_Sub_Sgf_Oper_B_mux.W}

set _session_group_10 Add_Subt_Sgf_module
gui_sg_create "$_session_group_10"
set Add_Subt_Sgf_module "$_session_group_10"

gui_sg_addsignal -group "$_session_group_10" { Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Add_Sub_op_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Data_A_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Data_Result_o Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.load_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.SWR Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.PreData_B_i Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.clk Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.Co_to_D Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.S_to_D Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.FSM_C_o Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.rst }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module.SWR}

set _session_group_11 Barrel_Shifter_module
gui_sg_create "$_session_group_11"
set Barrel_Shifter_module "$_session_group_11"

gui_sg_addsignal -group "$_session_group_11" { Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Data_Reg Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.load_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Shift_Data_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Shift_Value_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Left_Right_i Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.clk Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.N_mant_o Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.rst Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.Bit_Shift_i }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.SWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_module.EWR}

set _session_group_12 Barrel_Shifter_S_V_mux
gui_sg_create "$_session_group_12"
set Barrel_Shifter_S_V_mux "$_session_group_12"

gui_sg_addsignal -group "$_session_group_12" { Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.S Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.W Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.D0 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.D1 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.D2 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.ctrl }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_S_V_mux.W}

set _session_group_13 Barrel_Shifter_D_I_mux
gui_sg_create "$_session_group_13"
set Barrel_Shifter_D_I_mux "$_session_group_13"

gui_sg_addsignal -group "$_session_group_13" { Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.S Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.W Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.D0 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.D1 Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.ctrl }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Add_Subt.uut.Barrel_Shifter_D_I_mux.W}

set _session_group_14 FS_Module
gui_sg_create "$_session_group_14"
set FS_Module "$_session_group_14"

gui_sg_addsignal -group "$_session_group_14" { Testbench_FPU_Add_Subt.uut.FS_Module.A_S_op_o Testbench_FPU_Add_Subt.uut.FS_Module.load_2_o Testbench_FPU_Add_Subt.uut.FS_Module.bit_shift_o Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add Testbench_FPU_Add_Subt.uut.FS_Module.state_next Testbench_FPU_Add_Subt.uut.FS_Module.load_3_o Testbench_FPU_Add_Subt.uut.FS_Module.round_sgf Testbench_FPU_Add_Subt.uut.FS_Module.zero_info_state Testbench_FPU_Add_Subt.uut.FS_Module.add_overflow_i Testbench_FPU_Add_Subt.uut.FS_Module.extra1_64 Testbench_FPU_Add_Subt.uut.FS_Module.load_4_o Testbench_FPU_Add_Subt.uut.FS_Module.extra2_64 Testbench_FPU_Add_Subt.uut.FS_Module.overflow_add_r Testbench_FPU_Add_Subt.uut.FS_Module.load_final_result Testbench_FPU_Add_Subt.uut.FS_Module.ready Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_a_o Testbench_FPU_Add_Subt.uut.FS_Module.rst_FSM Testbench_FPU_Add_Subt.uut.FS_Module.ready_flag Testbench_FPU_Add_Subt.uut.FS_Module.load_5_o Testbench_FPU_Add_Subt.uut.FS_Module.load_oper Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_b_o Testbench_FPU_Add_Subt.uut.FS_Module.add_subt Testbench_FPU_Add_Subt.uut.FS_Module.load_6_o Testbench_FPU_Add_Subt.uut.FS_Module.beg_FSM Testbench_FPU_Add_Subt.uut.FS_Module.left_right_o Testbench_FPU_Add_Subt.uut.FS_Module.norm_iteration_i Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_c_o Testbench_FPU_Add_Subt.uut.FS_Module.zero_flag_i Testbench_FPU_Add_Subt.uut.FS_Module.load_7_o Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_r Testbench_FPU_Add_Subt.uut.FS_Module.round_i Testbench_FPU_Add_Subt.uut.FS_Module.clk Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_d_o Testbench_FPU_Add_Subt.uut.FS_Module.state_reg Testbench_FPU_Add_Subt.uut.FS_Module.start Testbench_FPU_Add_Subt.uut.FS_Module.load_8_o Testbench_FPU_Add_Subt.uut.FS_Module.add_subt_r Testbench_FPU_Add_Subt.uut.FS_Module.load_diff_exp Testbench_FPU_Add_Subt.uut.FS_Module.ctrl_b_load_o Testbench_FPU_Add_Subt.uut.FS_Module.load_1_o Testbench_FPU_Add_Subt.uut.FS_Module.norm_sgf_first Testbench_FPU_Add_Subt.uut.FS_Module.rst_int Testbench_FPU_Add_Subt.uut.FS_Module.rst }
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

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 245000



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
catch {gui_list_select -id ${Hier.1} {Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {Testbench_FPU_Add_Subt.uut.Add_Subt_Sgf_module}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active Testbench_FPU_Add_Subt /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch2/integracion_fisica/simulacion_logica_behavioral/SINGLE/Testbench_FPU_Add_Subt.v
gui_view_scroll -id ${Source.1} -vertical -set 294
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 54495 329014
gui_list_add_group -id ${Wave.1} -after {New Group} {Testbench_FPU_Add_Subt}
gui_list_add_group -id ${Wave.1} -after {New Group} {Add_Sub_Sgf_Oper_B_mux}
gui_list_add_group -id ${Wave.1} -after {New Group} {Add_Subt_Sgf_module}
gui_list_add_group -id ${Wave.1} -after {New Group} {Barrel_Shifter_module}
gui_list_add_group -id ${Wave.1} -after {New Group} {Barrel_Shifter_S_V_mux}
gui_list_add_group -id ${Wave.1} -after {New Group} {Barrel_Shifter_D_I_mux}
gui_list_add_group -id ${Wave.1} -after {New Group} {FS_Module}
gui_list_collapse -id ${Wave.1} Add_Sub_Sgf_Oper_B_mux
gui_list_collapse -id ${Wave.1} Add_Subt_Sgf_module
gui_list_collapse -id ${Wave.1} Barrel_Shifter_module
gui_list_collapse -id ${Wave.1} Barrel_Shifter_S_V_mux
gui_list_collapse -id ${Wave.1} Barrel_Shifter_D_I_mux
gui_list_collapse -id ${Wave.1} FS_Module
gui_list_select -id ${Wave.1} {Testbench_FPU_Add_Subt.Data_X Testbench_FPU_Add_Subt.Data_Y Testbench_FPU_Add_Subt.final_result_ieee }
gui_seek_criteria -id ${Wave.1} {Any Edge}



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
gui_list_set_insertion_bar  -id ${Wave.1} -group Testbench_FPU_Add_Subt  -item {Testbench_FPU_Add_Subt.final_result_ieee[31:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 245000
gui_view_scroll -id ${Wave.1} -vertical -set 310
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

