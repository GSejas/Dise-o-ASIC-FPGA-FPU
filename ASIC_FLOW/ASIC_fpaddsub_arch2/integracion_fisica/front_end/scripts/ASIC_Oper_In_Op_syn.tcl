####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:

####################################################################################################################################
set PRECISION(0) "SINGLE";
set PRECISION(1) "DOUBLE";
set PREC_PARAM(0) "W=32";
set PREC_PARAM(1) "W=64";
# Eliminar diseños previos
set OPIN_NAME  "Oper_Start_In.v"
set SUB1_NAME     "Oper_Start_In_2"
set CONTRAINTS_FILE_NAME "ASIC_fpaddsub_arch2_syn_constraints.tcl"


analyze -library WORK -format verilog "$OPIN_NAME"


set x 0;
while {$x < 1} {
set_flatten true -effort high
#Elaboramos el módulo principal
elaborate -update $SUB1_NAME -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

uniquify

#Enlazar los demás módulos al módulo principal
link


#Escribir el archivo *.ddc (base de datos sin sintetizar)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$SUB1_NAME\_syn_unmapped.ddc

#Aplicar especificaciones de diseño (constraints)
#source $CONTRAINTS_FILE_NAME

create_clock -period 10 [get_ports clk]
set_max_delay -from [get_ports {intDX intDY load_b_i}] -to [get_ports {DMP_o DmP_o}] 2
set_min_delay -from [get_ports {intDX intDY load_b_i}] -to [get_ports {DMP_o DmP_o}] 1
set_clock_transition 0.5 [get_clocks clk]

propagate_constraints

#Revisar el diseño
check_design

set compile_top_all_paths true;

#Compilar el diseño
compile_ultra -timing_high_effort_script -retime

#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
#- Como una de las entradas para el sintetizador físico (IC Compiler).
set verilogout_no_tri true
change_names -hierarchy -rules verilog
write -hierarchy -format verilog -output \
./db/$PRECISION($x)/$SUB1_NAME\_syn.v

#Generar los reportes

report_power -analysis_effort high > reports/$PRECISION($x)/$SUB1_NAME\_syn_power.txt
report_area >   reports/$PRECISION($x)/$SUB1_NAME\_syn_area.txt
report_cell >   reports/$PRECISION($x)/$SUB1_NAME\_syn_cell.txt
report_qor >    reports/$PRECISION($x)/$SUB1_NAME\_syn_qor.txt
report_timing > reports/$PRECISION($x)/$SUB1_NAME\_syn_timing.txt
report_port >   reports/$PRECISION($x)/$SUB1_NAME\_syn_port.txt

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$SUB1_NAME\_syn_mapped.ddc

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
#para el sintetizador físico (IC Compiler)
write_sdc ./db/$PRECISION($x)/$SUB1_NAME\_syn.sdc
write_sdf ./db/$PRECISION($x)/$SUB1_NAME\_syn.sdf
#Revisar la configuración de temporizado
check_timing

#FINALIZAMOS EL LOOP
set x [expr {$x + 1}]
}
