####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica

#Realizado por:		   Jairo Mauricio Valverde Cruz           jmvc04@gmail.com
#Corregido por:		Reinaldo Castro González	shidarimo@gmail.com

#Proyecto:   Detector de secuencia: 1101. Proyecto creado con fines didácticos

#Herramienta:        Version K-2015.06-SP3-3 for linux64 - Jan 15, 2016

#Fecha de creación:  29 Agosto 2011, editado 17 de Agosto de 2016 

#Refrencias (detalladas en el Manual - Wiki):
# 1. Bindu, 2009. 
# 2. Manuales de Design Compiler.
####################################################################################################################################

set home_base [exec pwd]
set tech_home {/media/datos/IBM/TECH/ibm130_lp}
# El siguente comando concatena al search path los directorios listados
set search_path {$home_base}
set search_path    "$search_path ./libs ./reports ./source ./scripts"
set search_path [concat $search_path $tech_home/libs/milkyway $tech_home/physical $tech_home/digital]

# El comando set establece un valor para una variable. 
set link_library  "* scx3_cmos8rf_lpvt_tt_1p2v_25c.db"
set target_library "scx3_cmos8rf_lpvt_tt_1p2v_25c.db"

echo "search_path:       $search_path"
echo "link_library:      $link_library"
echo "target_library:    $target_library"
set power_enable_analysis "true"
# Leer el archivo de verilog obtenido al final de la implementación física (detector_phy.v)
read_verilog $home_base/source/FPU_Multiplication_Function_ASIC_fpu_syn_constraints_clk10.tcl_DW_1STAGE_syn.v

#Definir el módulo principal
current_design FPU_Multiplication_Function_W32_EW8_SW23

link
set power_analysis_mode "averaged"

read_saif "../source/activity.saif"

report_switching_activity -list_not_annotated

report_power -verbose -hierarchy

set power_analysis_mode "time_based"

report_switching_activity -list_not_annotated

report_power -verbose -hierarchy

#Leer las especificaciones de las parasitancias
read_sdf $home_base/source/FPU_Multiplication_Function_ASIC_fpu_syn_constraints_clk10.tcl_DW_1STAGE_syn.sdf

#Leer las especificaciones de temporizado
read_sdc $home_base/source/FPU_Multiplication_Function_ASIC_fpu_syn_constraints_clk10.tcl_DW_1STAGE_syn.sdc
 
read_sdc
#Generar reportes de temporizado
report_timing -from [all_inputs] -to [all_registers -data_pins] -max_paths 40 > reports/entrada_registro.txt
report_timing -from [all_register -clock_pins] -to [all_registers -data_pins] -max_paths 40 > reports/registro_registro.txt
report_timing -from [all_register -clock_pins] -to [all_outputs] -max_paths 40 > reports/registro_salida.txt

#Generar el reporte de temporizado de registro a registro con el tiempo de transición y la capacitancia
report_timing -transition_time -capacitance -nets -input_pins -from [all_registers -clock_pins] -to [all_registers -data_pins] > reports/criticas_tran_cap.txt










