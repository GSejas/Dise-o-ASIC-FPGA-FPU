# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Mon Oct 31 01:46:36 2016
# Designs open: 1
#   Sim: /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: Testbench_FPU_Mark1
#   Wave.1: 36 signals
#   Group count = 1
#   Group Testbench_FPU_Mark1 signal count = 36
# End_DVE_Session_Save_Info

# DVE version: K-2015.09-SP2-3_Full64
# DVE build date: Jun 15 2016 22:18:13


#<Session mode="Full" path="/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/DVEfiles/session.tcl" type="Debug">

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
gui_show_window -window ${TopLevel.1} -show_state maximized -rect {{2 51} {1025 742}}

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
gui_update_layout -id ${HSPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_hier_colhier 748} {child_hier_coltype 272} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type {DLPane}  -parent ${TopLevel.1}]
if {[gui_get_shared_view -id ${DLPane.1} -type Data] == {}} {
        set Data.1 [gui_share_window -id ${DLPane.1} -type Data]
} else {
        set Data.1  [gui_get_shared_view -id ${DLPane.1} -type Data]
}

gui_show_window -window ${DLPane.1} -show_state maximized
gui_update_layout -id ${DLPane.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_data_colvariable 338} {child_data_colvalue 474} {child_data_coltype 192} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 465} {child_wave_right 553} {child_wave_colname 300} {child_wave_colvalue 160} {child_wave_col1 0} {child_wave_col2 1}}
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

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
gui_set_env SIMSETUP::SIMARGS {{+v2k +lint=all -a log_name +define+DOUBLE +neg_tchk +sdfverbose}}
gui_set_env SIMSETUP::SIMEXE {simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/simv}] } {
gui_sim_run Ucli -exe simv -args { +v2k +lint=all -a log_name +define+DOUBLE +neg_tchk +sdfverbose -ucligui} -dir /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE -nosource
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
gui_load_child_values {Testbench_FPU_Mark1}


set _session_group_2 Testbench_FPU_Mark1
gui_sg_create "$_session_group_2"
set Testbench_FPU_Mark1 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { Testbench_FPU_Mark1.EW Testbench_FPU_Mark1.Data_1 Testbench_FPU_Mark1.Data_2 Testbench_FPU_Mark1.contador Testbench_FPU_Mark1.FPSEN Testbench_FPU_Mark1.Array_IN_1 Testbench_FPU_Mark1.II Testbench_FPU_Mark1.Array_IN_2 Testbench_FPU_Mark1.FPSUB Testbench_FPU_Mark1.SW Testbench_FPU_Mark1.begin_operation Testbench_FPU_Mark1.underflow_flag Testbench_FPU_Mark1.FileSaveData Testbench_FPU_Mark1.ack_operation Testbench_FPU_Mark1.SWR Testbench_FPU_Mark1.operation_ready Testbench_FPU_Mark1.PERIOD Testbench_FPU_Mark1.region_flag Testbench_FPU_Mark1.op_result Testbench_FPU_Mark1.EWR Testbench_FPU_Mark1.NaN_flag Testbench_FPU_Mark1.ROUNDING_MODE_POS_INF Testbench_FPU_Mark1.W Testbench_FPU_Mark1.operation Testbench_FPU_Mark1.III Testbench_FPU_Mark1.FPMULT Testbench_FPU_Mark1.clk Testbench_FPU_Mark1.r_mode Testbench_FPU_Mark1.overflow_flag Testbench_FPU_Mark1.IoIV1 Testbench_FPU_Mark1.IoIV2 Testbench_FPU_Mark1.FPCOS Testbench_FPU_Mark1.FPADD Testbench_FPU_Mark1.ROUNDING_MODE_TRUNCT Testbench_FPU_Mark1.rst Testbench_FPU_Mark1.ROUNDING_MODE_NEG_INF }
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.EW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.EW}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.contador}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.contador}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.FPSEN}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.FPSEN}
gui_set_radix -radix enum -signals {Sim:Testbench_FPU_Mark1.Array_IN_1}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.II}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.II}
gui_set_radix -radix enum -signals {Sim:Testbench_FPU_Mark1.Array_IN_2}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.FPSUB}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.FPSUB}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.SW}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.SW}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.FileSaveData}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.FileSaveData}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.SWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.SWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.PERIOD}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.EWR}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.EWR}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.ROUNDING_MODE_POS_INF}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.ROUNDING_MODE_POS_INF}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.W}
gui_set_radix -radix {twosComplement} -signals {Sim:Testbench_FPU_Mark1.W}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.III}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.III}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.FPMULT}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.FPMULT}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.IoIV1}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.IoIV1}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.IoIV2}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.IoIV2}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.FPCOS}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.FPCOS}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.FPADD}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.FPADD}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.ROUNDING_MODE_TRUNCT}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.ROUNDING_MODE_TRUNCT}
gui_set_radix -radix {decimal} -signals {Sim:Testbench_FPU_Mark1.ROUNDING_MODE_NEG_INF}
gui_set_radix -radix {unsigned} -signals {Sim:Testbench_FPU_Mark1.ROUNDING_MODE_NEG_INF}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 7393467870000



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
catch {gui_list_select -id ${Hier.1} {Testbench_FPU_Mark1}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {Testbench_FPU_Mark1}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 17
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 7393467869912 7393467870088
gui_list_add_group -id ${Wave.1} -after {New Group} {Testbench_FPU_Mark1}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Testbench_FPU_Mark1  -position in

gui_marker_move -id ${Wave.1} {C1} 7393467870000
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active Testbench_FPU_Mark1 /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/Testbench_FPUv1_Interface.v
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 405
gui_src_set_reusable -id ${Source.1}
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Console.1}
}
#</Session>

