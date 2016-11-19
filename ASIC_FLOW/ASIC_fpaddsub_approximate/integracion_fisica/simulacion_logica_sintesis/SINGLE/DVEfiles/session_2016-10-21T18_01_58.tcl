# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Fri Oct 21 18:01:58 2016
# Designs open: 1
#   Sim: /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_sintesis/SINGLE/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: tb_FPU_PIPELINED_FPADDSUB2_vector_testing
#   List.1: 4 signals
#   Wave.1: 43 signals
#   Group count = 3
#   Group tb_FPU_PIPELINED_FPADDSUB2_vector_testing signal count = 39
#   Group Group1 signal count = 4
#   Group Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593 signal count = 4
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_sintesis/SINGLE/DVEfiles/session.tcl" type="Debug">

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
gui_set_pref_value -key app_default_font -value {Helvetica [Cronyx],9,-1,5,50,0,0,0,0,0}
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
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_width -value_type integer -value -1
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_height -value_type integer -value 179
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DriverLoad.1} {{left 0} {top 0} {width 454} {height 178} {dock_state bottom} {dock_on_new_line false}}
set Watch.1 [gui_create_window -type Watch -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 179]
gui_set_window_pref_key -window ${Watch.1} -key dock_width -value_type integer -value 746
gui_set_window_pref_key -window ${Watch.1} -key dock_height -value_type integer -value 179
gui_set_window_pref_key -window ${Watch.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Watch.1} {{left 0} {top 0} {width 904} {height 178} {dock_state bottom} {dock_on_new_line false}}
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
gui_update_layout -id ${DLPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_data_colvariable 566} {child_data_colvalue 353} {child_data_coltype 420} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 386} {child_wave_right 968} {child_wave_colname 218} {child_wave_colvalue 164} {child_wave_col1 0} {child_wave_col2 1}}
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set List.1 [gui_create_window -type {List}  -parent ${TopLevel.1}]
gui_show_window -window ${List.1} -show_state maximized
gui_update_layout -id ${List.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_list_left 150} {child_list_right 1204} {child_list_up 115} {child_list_down 295}}

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
gui_set_env SIMSETUP::SIMARGS {{ +v2k +lint=all -a log_name +define+SINGLE +define+FRANCIS_LZD=1 +neg_tchk +sdfverbose -ucligui}}
gui_set_env SIMSETUP::SIMEXE {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_sintesis/SINGLE/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_sintesis/SINGLE/simv}] } {
gui_sim_run Ucli -exe simv -args { +v2k +lint=all -a log_name +define+SINGLE +define+FRANCIS_LZD=1 +neg_tchk +sdfverbose -ucligui} -dir /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_sintesis/SINGLE -nosource
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
gui_load_child_values {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut}


set _session_group_1 tb_FPU_PIPELINED_FPADDSUB2_vector_testing
gui_sg_create "$_session_group_1"
set tb_FPU_PIPELINED_FPADDSUB2_vector_testing "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Cont_CLK tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_exp tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_mant tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_exp tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_mant tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.FileSaveData tb_FPU_PIPELINED_FPADDSUB2_vector_testing.PERIOD tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SWR tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SW tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_exponent tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_mantissa tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.W tb_FPU_PIPELINED_FPADDSUB2_vector_testing.add_subt tb_FPU_PIPELINED_FPADDSUB2_vector_testing.beg_OP tb_FPU_PIPELINED_FPADDSUB2_vector_testing.busy tb_FPU_PIPELINED_FPADDSUB2_vector_testing.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.contador tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_exponent tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_mantissa tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_sign tb_FPU_PIPELINED_FPADDSUB2_vector_testing.logVectorReference tb_FPU_PIPELINED_FPADDSUB2_vector_testing.overflow_flag tb_FPU_PIPELINED_FPADDSUB2_vector_testing.ready tb_FPU_PIPELINED_FPADDSUB2_vector_testing.rst tb_FPU_PIPELINED_FPADDSUB2_vector_testing.underflow_flag tb_FPU_PIPELINED_FPADDSUB2_vector_testing.zero_flag tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SWR}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SW}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SW}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {decimal} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.W}
gui_set_radix -radix {twosComplement} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.W}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}

set _session_group_2 Group1
gui_sg_create "$_session_group_2"
set Group1 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result}
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}

set _session_group_3 {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593}
gui_sg_create "$_session_group_3"
set {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593} "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.clk tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.n1893 tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.n579 }
gui_set_radix -radix {Hex2Float_BigEndian} -signals {Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Global: Watch 'Watch'

gui_watch_page_delete -id Watch -all
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 1}
gui_watch_list_add_expr -id Watch -expr {Data_X[31:0]} -meta tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X -type Reg -nonlocal -scope tb_FPU_PIPELINED_FPADDSUB2_vector_testing

gui_watch_list_add_expr -id Watch -expr {Data_Y[31:0]} -meta tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y -type Reg -nonlocal -scope tb_FPU_PIPELINED_FPADDSUB2_vector_testing

gui_watch_list_add_expr -id Watch -expr {Theoretical_result[31:0]} -meta tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result -type Reg -nonlocal -scope tb_FPU_PIPELINED_FPADDSUB2_vector_testing

gui_watch_list_add_expr -id Watch -expr {final_result_ieee[31:0]} -meta tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee -type Wire -nonlocal -scope tb_FPU_PIPELINED_FPADDSUB2_vector_testing

gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 2}
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 3}

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 185.786



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


# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]} -time 3.593 -starttime 118

# Watch 'Watch.1'
gui_watch_page_activate -id ${Watch.1} -page {Watch 1}
gui_list_set_filter -id ${Watch.1} -page {Watch 1} -list { {static 1} {randc 1} {public 1} {Parameter 1} {protected 1} {OtherTypes 1} {array 1} {local 1} {class 1} {AllTypes 1} {rand 1} {constraint 1} }
gui_list_set_filter -id ${Watch.1} -page {Watch 1} -text {*}
gui_watch_list_scroll_to -id ${Watch.1} -horz 0 -vert 0
gui_watch_page_activate -id ${Watch.1} -page {Watch 2}
gui_list_set_filter -id ${Watch.1} -page {Watch 2} -list { {static 1} {randc 1} {public 1} {Parameter 1} {protected 1} {OtherTypes 1} {array 1} {local 1} {class 1} {AllTypes 1} {rand 1} {constraint 1} }
gui_list_set_filter -id ${Watch.1} -page {Watch 2} -text {*}
gui_watch_page_activate -id ${Watch.1} -page {Watch 3}
gui_list_set_filter -id ${Watch.1} -page {Watch 3} -list { {static 1} {randc 1} {public 1} {Parameter 1} {protected 1} {OtherTypes 1} {array 1} {local 1} {class 1} {AllTypes 1} {rand 1} {constraint 1} }
gui_list_set_filter -id ${Watch.1} -page {Watch 3} -text {*}
gui_watch_page_activate -id ${Watch.1} -page {Watch 1}
gui_view_scroll -id ${Watch.1} -vertical -set 0
gui_view_scroll -id ${Watch.1} -horizontal -set 0

# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_select -id ${Hier.1} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 15
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 428.137
gui_list_add_group -id ${Wave.1} -after {New Group} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing}
gui_list_set_height -id ${Wave.1} -height 25 -name tb_FPU_PIPELINED_FPADDSUB2_vector_testing
gui_list_add_group -id ${Wave.1} -after {New Group} {{Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593}}
gui_list_set_height -id ${Wave.1} -height 25 -name {Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593}
gui_list_select -id ${Wave.1} {tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee }
gui_seek_criteria -id ${Wave.1} {Any Edge}

gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Cont_CLK -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_exp -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_mant -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X_sign -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_exp -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_mant -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y_sign -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EWR -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.EW -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.FileSaveData -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.PERIOD -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SWR -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.SW -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_exponent -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_mantissa -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result_sign -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.W -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.add_subt -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.beg_OP -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.busy -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.clk -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.contador -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_exponent -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_mantissa -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee_sign -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.logVectorReference -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.overflow_flag -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.ready -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.rst -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.underflow_flag -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.zero_flag -occurrence 1 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_X -occurrence 2 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Data_Y -occurrence 2 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.Theoretical_result -occurrence 2 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee -occurrence 2 -group ${tb_FPU_PIPELINED_FPADDSUB2_vector_testing} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee -occurrence 1 -group ${Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.clk -occurrence 1 -group ${Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.n1893 -occurrence 1 -group ${Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593} 
gui_list_set_height -id ${Wave.1} -height 25  -name Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.inst_uut.n579 -occurrence 1 -group ${Drivers: Sim:tb_FPU_PIPELINED_FPADDSUB2_vector_testing.final_result_ieee[31:0]@3593} 


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
gui_list_set_insertion_bar  -id ${Wave.1} -group tb_FPU_PIPELINED_FPADDSUB2_vector_testing  -position in

gui_marker_move -id ${Wave.1} {C1} 185.786
gui_view_scroll -id ${Wave.1} -vertical -set 782
gui_show_grid -id ${Wave.1} -enable false

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active tb_FPU_PIPELINED_FPADDSUB2_vector_testing /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpaddsub_arch3/integracion_fisica/simulacion_logica_sintesis/SINGLE/tb_FPU_PIPELINED_FPADDSUB2_vector_testing.v
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 1120
gui_src_set_reusable -id ${Source.1}

# View 'List.1'
gui_lst_add_group -id ${List.1} {{Group1} } -noupdate
gui_lst_set_strobing_period -id ${List.1} -start {0} -end {0} -update -all

gui_set_env TOGGLE::DEFAULT_LIST_WINDOW ${List.1}
gui_view_scroll -id ${List.1} -vertical -set 240
gui_view_scroll -id ${List.1} -horizontal -set 0
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

