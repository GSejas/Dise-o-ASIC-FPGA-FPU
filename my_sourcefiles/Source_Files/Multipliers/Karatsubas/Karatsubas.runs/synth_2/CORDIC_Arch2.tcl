# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.cache/wt [current_project]
set_property parent.project_path /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/Simple_Subt.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/sign_inverter.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/Op_Select.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/Mux_3x1_b.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/Mux_2x1.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/LUT_ROM_64bits.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/LUT_ROM_32bits.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/d_ff_en.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/counter_up.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/counter_d.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/CORDIC_FSM_v2.v
  /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.srcs/sources_1/imports/sine_cosine_CORDIC/CORDIC_Arch2.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/jorge/Documents/1Proyectos_TesisdeGraduacion/FPGA_FLOW/Karat/MUL_FPU_FUNCIONAL_v2.srcs/constrs_Sgf/imports/RKOA/Time_Constrains_RKOA_sfg.xdc
set_property used_in_implementation false [get_files /home/jorge/Documents/1Proyectos_TesisdeGraduacion/FPGA_FLOW/Karat/MUL_FPU_FUNCIONAL_v2.srcs/constrs_Sgf/imports/RKOA/Time_Constrains_RKOA_sfg.xdc]


synth_design -top CORDIC_Arch2 -part xc7a100tcsg324-1 -directive AreaOptimized_high -control_set_opt_threshold 1


write_checkpoint -force -noxdef CORDIC_Arch2.dcp

catch { report_utilization -file CORDIC_Arch2_utilization_synth.rpt -pb CORDIC_Arch2_utilization_synth.pb }
