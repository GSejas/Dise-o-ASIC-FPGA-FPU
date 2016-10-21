# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Oct 20 19:49:03 2016
# Designs open: 1
#   Sim: simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut
#   Wave.1: 119 signals
#   List.1: 4 signals
#   Group count = 32
#   Group tb_FPU_PIPELINED_FPADDSUB2_vector_testing signal count = 28
#   Group Group1 signal count = 4
#   Group Group2 signal count = 4
#   Group Group3 signal count = 9
#   Group Group4 signal count = 9
#   Group SHT1_STAGE_DMP signal count = 6
#   Group SHT1_STAGE_DmP_mant signal count = 6
#   Group SHT1_STAGE_FLAGS signal count = 6
#   Group SHT1_STAGE_sft_amount signal count = 6
#   Group INPUT_STAGE_FLAGS signal count = 6
#   Group INPUT_STAGE_OPERANDX signal count = 6
#   Group INPUT_STAGE_OPERANDY signal count = 6
#   Group INIT signal count = 3
#   Group EXP signal count = 8
#   Group SHT1 signal count = 13
#   Group SHT2 signal count = 5
#   Group SGF signal count = 6
#   Group NRM signal count = 4
#   Group FRMT signal count = 8
#   Group Group12 signal count = 0
#   Group inst_ShiftRegister signal count = 5
#   Group Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load@0 signal count = 1
#   Group Group13 signal count = 1
#   Group Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg@105000 signal count = 1
#   Group inst_FSM_INPUT_ENABLE signal count = 8
#   Group Group14 signal count = 4
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE/FPU_ADD_PIPE_BEHAV_SINGLE_v4.tcl" type="Debug">

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
set DriverLoad.1 [gui_create_window -type DriverLoad -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 179]
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_width -value_type integer -value 150
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_height -value_type integer -value 179
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DriverLoad.1} {{left 0} {top 0} {width 1359} {height 178} {dock_state bottom} {dock_on_new_line false}}
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
set Console.1 [gui_create_window -type {Console}  -parent ${TopLevel.1}]
gui_show_window -window ${Console.1} -show_state maximized
gui_update_layout -id ${Console.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set HSPane.1 [gui_create_window -type {HSPane}  -parent ${TopLevel.1}]
if {[gui_get_shared_view -id ${HSPane.1} -type Hier] == {}} {
        set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier]
} else {
        set Hier.1  [gui_get_shared_view -id ${HSPane.1} -type Hier]
}

gui_show_window -window ${HSPane.1} -show_state maximized
gui_update_layout -id ${HSPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_hier_colhier 956} {child_hier_coltype 400} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type {DLPane}  -parent ${TopLevel.1}]
if {[gui_get_shared_view -id ${DLPane.1} -type Data] == {}} {
        set Data.1 [gui_share_window -id ${DLPane.1} -type Data]
} else {
        set Data.1  [gui_get_shared_view -id ${DLPane.1} -type Data]
}

gui_show_window -window ${DLPane.1} -show_state maximized
gui_update_layout -id ${DLPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_data_colvariable 571} {child_data_colvalue 358} {child_data_coltype 425} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 621} {child_wave_right 733} {child_wave_colname 287} {child_wave_colvalue 330} {child_wave_col1 0} {child_wave_col2 1}}
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set List.1 [gui_create_window -type {List}  -parent ${TopLevel.1}]
gui_show_window -window ${List.1} -show_state maximized
gui_update_layout -id ${List.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_list_left 150} {child_list_right 1204} {child_list_up 115} {child_list_down 285}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(List) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui +v2k +lint=all -l log_name +define+SINGLE}}
gui_set_env SIMSETUP::SIMEXE {simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {simv}] } {
gui_sim_run Ucli -exe simv -args {-ucligui +v2k +lint=all -l log_name +define+SINGLE} -dir ../SINGLE -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1ps
gui_set_time_units 1ns
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount}
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY}


set _session_group_1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing
gui_sg_create "$_session_group_1"
set tb_FPU_PIPELINED_FPADDSUB2_vector_testing "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_exp tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_mant tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_exp tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_mant tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_exponent tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_mantissa tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_exponent tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_mantissa tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.add_subt tb_FPU_PIPELINED_FPADDSUB2_vector_testing.beg_OP tb_FPU_PIPELINED_FPADDSUB2_vector_testing.busy tb_FPU_PIPELINED_FPADDSUB2_vector_testing.rst tb_FPU_PIPELINED_FPADDSUB2_vector_testing.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.contador tb_FPU_PIPELINED_FPADDSUB2_vector_testing.overflow_flag tb_FPU_PIPELINED_FPADDSUB2_vector_testing.ready tb_FPU_PIPELINED_FPADDSUB2_vector_testing.underflow_flag tb_FPU_PIPELINED_FPADDSUB2_vector_testing.zero_flag }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.contador}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.contador}

set _session_group_2 Group1
gui_sg_create "$_session_group_2"
set Group1 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}

set _session_group_3 Group2
gui_sg_create "$_session_group_3"
set Group2 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}

set _session_group_4 Group3
gui_sg_create "$_session_group_4"
set Group3 "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_INIT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intDX_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intDY_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intAS tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.eqXY tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.gtXY tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_INIT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_INIT }

set _session_group_5 Group4
gui_sg_create "$_session_group_5"
set Group4 "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_INIT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intDX_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intDY_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intAS tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.eqXY tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.gtXY tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_INIT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_INIT }

set _session_group_6 SHT1_STAGE_DMP
gui_sg_create "$_session_group_6"
set SHT1_STAGE_DMP "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.Q tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.rst }
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DMP.W}

set _session_group_7 SHT1_STAGE_DmP_mant
gui_sg_create "$_session_group_7"
set SHT1_STAGE_DmP_mant "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.Q tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.rst }
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_DmP_mant.W}

set _session_group_8 SHT1_STAGE_FLAGS
gui_sg_create "$_session_group_8"
set SHT1_STAGE_FLAGS "$_session_group_8"

gui_sg_addsignal -group "$_session_group_8" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.Q tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.rst }
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_FLAGS.W}

set _session_group_9 SHT1_STAGE_sft_amount
gui_sg_create "$_session_group_9"
set SHT1_STAGE_sft_amount "$_session_group_9"

gui_sg_addsignal -group "$_session_group_9" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.rst tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.Q }
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_STAGE_sft_amount.W}

set _session_group_10 INPUT_STAGE_FLAGS
gui_sg_create "$_session_group_10"
set INPUT_STAGE_FLAGS "$_session_group_10"

gui_sg_addsignal -group "$_session_group_10" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.Q tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.rst }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_FLAGS.W}

set _session_group_11 INPUT_STAGE_OPERANDX
gui_sg_create "$_session_group_11"
set INPUT_STAGE_OPERANDX "$_session_group_11"

gui_sg_addsignal -group "$_session_group_11" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.Q tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.rst }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.D}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.Q}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDX.W}

set _session_group_12 INPUT_STAGE_OPERANDY
gui_sg_create "$_session_group_12"
set INPUT_STAGE_OPERANDY "$_session_group_12"

gui_sg_addsignal -group "$_session_group_12" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.rst tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.D tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.Q }
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.W}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.D}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_STAGE_OPERANDY.Q}

set _session_group_13 INIT
gui_sg_create "$_session_group_13"
set INIT "$_session_group_13"

gui_sg_addsignal -group "$_session_group_13" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intDX_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intDY_EWSW }

set _session_group_14 $_session_group_13|
append _session_group_14 FLAGS
gui_sg_create "$_session_group_14"
set INIT|FLAGS "$_session_group_14"

gui_sg_addsignal -group "$_session_group_14" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_INIT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.intAS tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.INPUT_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.eqXY tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.gtXY tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_INIT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_INIT }

set _session_group_15 EXP
gui_sg_create "$_session_group_15"
set EXP "$_session_group_15"

gui_sg_addsignal -group "$_session_group_15" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_EXP_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DmP_EXP_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_exp_EXP_EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DmP_exp_EXP_EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_mant_EXP_SW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DmP_mant_EXP_SW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.Shift_amount_EXP_EW }

set _session_group_16 $_session_group_15|
append _session_group_16 Group2
gui_sg_create "$_session_group_16"
set EXP|Group2 "$_session_group_16"

gui_sg_addsignal -group "$_session_group_16" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.EXP_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_EXP tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_EXP tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_EXP }

set _session_group_17 SHT1
gui_sg_create "$_session_group_17"
set SHT1 "$_session_group_17"

gui_sg_addsignal -group "$_session_group_17" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_SHT1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT1_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_SHT1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_SHT1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_SHT1_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DmP_mant_SHT1_SW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.Shift_amount_SHT1_EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.shft_value_mux_o_EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.left_right_SHT1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.bit_shift_SHT1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.sftr_idat_SHT1_SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.sftr_odat_SHT1_SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.mux_sel_norm_EWR }

set _session_group_18 SHT2
gui_sg_create "$_session_group_18"
set SHT2 "$_session_group_18"

gui_sg_addsignal -group "$_session_group_18" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_SHT2_EWSW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.shift_value_SHT2_EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.sftr_idat_SHT2_SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.sftr_odat_SHT2_SWR }

set _session_group_19 $_session_group_18|
append _session_group_19 FLAGS
gui_sg_create "$_session_group_19"
set SHT2|FLAGS "$_session_group_19"

gui_sg_addsignal -group "$_session_group_19" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_SHT2 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_SHT2 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_SHT2 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SHT2_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.left_right_SHT2 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.bit_shift_SHT2 }

set _session_group_20 SGF
gui_sg_create "$_session_group_20"
set SGF "$_session_group_20"

gui_sg_addsignal -group "$_session_group_20" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DmP_mant_SFG_SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_mant_SFG_SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_exp_SFG tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.Raw_mant_SGF tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_SFG }

set _session_group_21 $_session_group_20|
append _session_group_21 FLAGS
gui_sg_create "$_session_group_21"
set SGF|FLAGS "$_session_group_21"

gui_sg_addsignal -group "$_session_group_21" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OP_FLAG_SFG tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SFG_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_SFG tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_SFG tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ADD_OVRFLW_SGF tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.Carry_out_SGF }

set _session_group_22 NRM
gui_sg_create "$_session_group_22"
set NRM "$_session_group_22"

gui_sg_addsignal -group "$_session_group_22" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_exp_NRM_EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.Add_Subt_LZD_SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.Raw_mant_NRM_SWR }

set _session_group_23 $_session_group_22|
append _session_group_23 FLAGS
gui_sg_create "$_session_group_23"
set NRM|FLAGS "$_session_group_23"

gui_sg_addsignal -group "$_session_group_23" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ADD_OVRFLW_NRM tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.NRM_ACTIVE tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.SIGN_FLAG_NRM tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ZERO_FLAG_NRM }

set _session_group_24 FRMT
gui_sg_create "$_session_group_24"
set FRMT "$_session_group_24"

gui_sg_addsignal -group "$_session_group_24" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.LZD_output_NRM2_EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.DMP_exp_NRM2_EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.LZD_raw_out_NRM2_EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.LZD_raw_out_EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.LZD_ZFiller tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.exp_rslt_NRM2_EW1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.formatted_number_W }

set _session_group_25 $_session_group_24|
append _session_group_25 FLAGS
gui_sg_create "$_session_group_25"
set FRMT|FLAGS "$_session_group_25"

gui_sg_addsignal -group "$_session_group_25" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.OVRFLW_FLAG_FRMT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.UNDRFLW_FLAG_FRMT tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.ADD_OVRFLW_NRM2 }

set _session_group_26 Group12
gui_sg_create "$_session_group_26"
set Group12 "$_session_group_26"


set _session_group_27 inst_ShiftRegister
gui_sg_create "$_session_group_27"
set inst_ShiftRegister "$_session_group_27"

gui_sg_addsignal -group "$_session_group_27" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.rst tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.in_bit tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.Q }

set _session_group_28 {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load@0}
gui_sg_create "$_session_group_28"
set {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load@0} "$_session_group_28"

gui_sg_addsignal -group "$_session_group_28" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load }

set _session_group_29 Group13
gui_sg_create "$_session_group_29"
set Group13 "$_session_group_29"

gui_sg_addsignal -group "$_session_group_29" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg }

set _session_group_30 {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg@105000}
gui_sg_create "$_session_group_30"
set {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg@105000} "$_session_group_30"

gui_sg_addsignal -group "$_session_group_30" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg }

set _session_group_31 inst_FSM_INPUT_ENABLE
gui_sg_create "$_session_group_31"
set inst_FSM_INPUT_ENABLE "$_session_group_31"

gui_sg_addsignal -group "$_session_group_31" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.init_OPERATION tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.rst tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_input_internal tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_Pipeline_input tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.state_reg tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.state_next }

set _session_group_32 Group14
gui_sg_create "$_session_group_32"
set Group14 "$_session_group_32"

gui_sg_addsignal -group "$_session_group_32" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}

# Global: Highlighting
gui_highlight_signals -color #006400 {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.NRM_ACTIVE}

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 308



# Save global setting...

# Wave/List view global setting
gui_list_create_group_when_add -wave -enable
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load -time 0 -starttime 102
gui_get_drivers -session -id ${DriverLoad.1} -signal tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg -time 105 -starttime 105

# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} tb_FPU_PIPELINED_FPADDSUB2_vector_testing}
catch {gui_list_expand -id ${Hier.1} tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut}
catch {gui_list_select -id ${Hier.1} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE}}
gui_view_scroll -id ${Hier.1} -vertical -set 734
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 734
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 242.181 403.862
gui_list_add_group -id ${Wave.1} -after {New Group} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing}
gui_list_add_group -id ${Wave.1} -after {New Group} {{Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_ShiftRegister.load@0}}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {INIT}
gui_list_add_group -id ${Wave.1}  -after INIT {INIT|FLAGS}
gui_list_add_group -id ${Wave.1} -after {New Group} {EXP}
gui_list_add_group -id ${Wave.1}  -after EXP {EXP|Group2}
gui_list_add_group -id ${Wave.1} -after {New Group} {SHT1}
gui_list_add_group -id ${Wave.1} -after {New Group} {SHT2}
gui_list_add_group -id ${Wave.1}  -after SHT2 {SHT2|FLAGS}
gui_list_add_group -id ${Wave.1} -after {New Group} {SGF}
gui_list_add_group -id ${Wave.1}  -after SGF {SGF|FLAGS}
gui_list_add_group -id ${Wave.1} -after {New Group} {NRM}
gui_list_add_group -id ${Wave.1}  -after NRM {NRM|FLAGS}
gui_list_add_group -id ${Wave.1} -after {New Group} {FRMT}
gui_list_add_group -id ${Wave.1}  -after FRMT {FRMT|FLAGS}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group12}
gui_list_add_group -id ${Wave.1} -after {New Group} {inst_ShiftRegister}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group13}
gui_list_add_group -id ${Wave.1} -after {New Group} {{Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg@105000}}
gui_list_add_group -id ${Wave.1} -after {New Group} {inst_FSM_INPUT_ENABLE}
gui_list_collapse -id ${Wave.1} INIT
gui_list_collapse -id ${Wave.1} EXP
gui_list_collapse -id ${Wave.1} SHT1
gui_list_collapse -id ${Wave.1} SHT2
gui_list_collapse -id ${Wave.1} SGF
gui_list_collapse -id ${Wave.1} NRM
gui_list_collapse -id ${Wave.1} FRMT
gui_list_collapse -id ${Wave.1} inst_ShiftRegister
gui_list_collapse -id ${Wave.1} Group13
gui_list_collapse -id ${Wave.1} {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.inst_FSM_INPUT_ENABLE.enable_shift_reg@105000}
gui_list_collapse -id ${Wave.1} inst_FSM_INPUT_ENABLE
gui_list_select -id ${Wave.1} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group inst_FSM_INPUT_ENABLE  -position in

gui_marker_move -id ${Wave.1} {C1} 308
gui_view_scroll -id ${Wave.1} -vertical -set 743
gui_set_grid_property -id ${Wave.1} -grid_range {Begin End} -enable_count -type signal -criteria {Any Edge} -number 1 -signals {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X[31:0] tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_exp[7:0] tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_mant[22:0] tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_sign }
gui_show_grid -id ${Wave.1} -enable true

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/front_end/source/FPU_ADD_Substract_PIPELINED.v
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 742
gui_src_set_reusable -id ${Source.1}

# View 'List.1'
gui_lst_add_group -id ${List.1} {{Group14} } -noupdate
gui_lst_set_strobing_period -id ${List.1} -start {0} -end {20695} -update -all

gui_set_env TOGGLE::DEFAULT_LIST_WINDOW ${List.1}
gui_view_scroll -id ${List.1} -vertical -set 0
gui_view_scroll -id ${List.1} -horizontal -set 0
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${List.1}
}
#</Session>

