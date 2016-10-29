# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Fri Oct 28 20:49:10 2016
# Designs open: 1
#   Sim: /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_cordic_Arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Wave.1: 26 signals
#   Schematic.1: testbench_CORDIC_Arch3
#   Source.1: CORDIC_Arch2
#   Source.2: testbench_CORDIC_Arch3
#   Group count = 2
#   Group testbench_CORDIC_Arch3 signal count = 24
#   Group Drivers: Sim:testbench_CORDIC_Arch3.Recept[31:0]@1217855000 signal count = 2
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_cordic_Arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE/DVEfiles/session.tcl" type="Debug">

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
gui_show_window -window ${TopLevel.1} -show_state maximized -rect {{27 51} {1050 742}}

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
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 180]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value -1
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 180
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 271} {height 179} {dock_state bottom} {dock_on_new_line true}}
set DriverLoad.1 [gui_create_window -type DriverLoad -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 180]
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_width -value_type integer -value 150
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_height -value_type integer -value 180
gui_set_window_pref_key -window ${DriverLoad.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DriverLoad.1} {{left 0} {top 0} {width 751} {height 179} {dock_state bottom} {dock_on_new_line false}}
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
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 465} {child_wave_right 553} {child_wave_colname 301} {child_wave_colvalue 160} {child_wave_col1 0} {child_wave_col2 1}}
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Source.2 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.2} -show_state maximized
gui_update_layout -id ${Source.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set HSPane.1 [gui_create_window -type {HSPane}  -parent ${TopLevel.1}]
if {[gui_get_shared_view -id ${HSPane.1} -type Hier] == {}} {
        set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier]
} else {
        set Hier.1  [gui_get_shared_view -id ${HSPane.1} -type Hier]
}

gui_show_window -window ${HSPane.1} -show_state maximized
gui_update_layout -id ${HSPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_hier_colhier 748} {child_hier_coltype 272} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
gui_use_schematics
set Schematic.1 [gui_create_window -type {Schematic}  -parent ${TopLevel.1} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DveSchematicSettings]
Misc::init_window $setting ${Schematic.1}
::Misc::exec_method -window ${Schematic.1} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.1}
gui_show_window -window ${Schematic.1} -show_state maximized
gui_update_layout -id ${Schematic.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

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
gui_set_env SIMSETUP::SIMARGS {{}}
gui_set_env SIMSETUP::SIMEXE {./simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_cordic_Arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE/simv}] } {
gui_sim_run Ucli -exe simv -args { -ucligui} -dir /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_cordic_Arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE -nosource
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
gui_load_child_values {testbench_CORDIC_Arch3}


set _session_group_1 testbench_CORDIC_Arch3
gui_sg_create "$_session_group_1"
set testbench_CORDIC_Arch3 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { testbench_CORDIC_Arch3.Array_IN testbench_CORDIC_Arch3.Cont_CLK testbench_CORDIC_Arch3.EWR testbench_CORDIC_Arch3.EW testbench_CORDIC_Arch3.FileSaveData testbench_CORDIC_Arch3.PERIOD testbench_CORDIC_Arch3.Recept testbench_CORDIC_Arch3.SWR testbench_CORDIC_Arch3.SW testbench_CORDIC_Arch3.W testbench_CORDIC_Arch3.ack_cordic testbench_CORDIC_Arch3.beg_fsm_cordic testbench_CORDIC_Arch3.busy testbench_CORDIC_Arch3.clk testbench_CORDIC_Arch3.contador testbench_CORDIC_Arch3.data_in testbench_CORDIC_Arch3.data_output testbench_CORDIC_Arch3.operation testbench_CORDIC_Arch3.overflow_flag testbench_CORDIC_Arch3.ready_cordic testbench_CORDIC_Arch3.rst testbench_CORDIC_Arch3.shift_region_flag testbench_CORDIC_Arch3.underflow_flag testbench_CORDIC_Arch3.zero_flag }
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.Cont_CLK}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.Cont_CLK}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.EWR}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.EW}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.FileSaveData}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.FileSaveData}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.Recept}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.Recept}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.SWR}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.SW}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.SW}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.W}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.W}
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.contador}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.contador}

set _session_group_2 {Drivers: Sim:testbench_CORDIC_Arch3.Recept[31:0]@1217855000}
gui_sg_create "$_session_group_2"
set {Drivers: Sim:testbench_CORDIC_Arch3.Recept[31:0]@1217855000} "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { testbench_CORDIC_Arch3.Recept testbench_CORDIC_Arch3.ready_cordic }
gui_set_radix -radix {decimal} -signals {Sim:testbench_CORDIC_Arch3.Recept}
gui_set_radix -radix {twosComplement} -signals {Sim:testbench_CORDIC_Arch3.Recept}

# Global: Highlighting
gui_highlight_signals -color #00ff00 {testbench_CORDIC_Arch3.ready_cordic}

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 1212688329



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


# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 17
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 1212652964 1212733518
gui_list_add_group -id ${Wave.1} -after {New Group} {testbench_CORDIC_Arch3}
gui_list_add_group -id ${Wave.1} -after {New Group} {{Drivers: Sim:testbench_CORDIC_Arch3.Recept[31:0]@1217855000}}
gui_list_select -id ${Wave.1} {testbench_CORDIC_Arch3.Recept }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group testbench_CORDIC_Arch3  -position in

gui_marker_move -id ${Wave.1} {C1} 1212688329
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active CORDIC_Arch2 /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_cordic_Arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE/../../front_end/source/CORDIC_Arch2.v
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 240
gui_src_set_reusable -id ${Source.1}

# Source 'Source.2'
gui_src_value_annotate -id ${Source.2} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.2}  -replace -active testbench_CORDIC_Arch3 /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_cordic_Arch3/integracion_fisica/simulacion_logica_behavioral/SINGLE/tb_CORDIC_Arch3.v
gui_src_value_annotate -id ${Source.2} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.2} -vertical -set 660
gui_src_set_reusable -id ${Source.2} -disable

# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_select -id ${Hier.1} {testbench_CORDIC_Arch3}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# DriverLoad 'DriverLoad.1'
gui_get_drivers -session -id ${DriverLoad.1} -signal {testbench_CORDIC_Arch3.Recept[31:0]} -time 1217855000 -starttime 1217855000

# View 'Schematic.1'
gui_use_schematics

# Create schematic window 'Schematic.1'
gui_sch_show -window ${Schematic.1} -name testbench_CORDIC_Arch3
gui_show_pin_value_annotate [gui_window_hier_name -window ${Schematic.1}]
gui_zoom -window ${Schematic.1} -rect { {-19994 -45702} {95811 -6562} }


# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.2}
}
#</Session>

