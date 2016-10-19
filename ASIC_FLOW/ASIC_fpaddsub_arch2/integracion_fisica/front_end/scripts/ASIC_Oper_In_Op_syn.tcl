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
set DESIGN_NAME  "Oper_Start_In.v"
set TOP_NAME     "Oper_Start_In_2"
set CONTRAINTS_FILE_NAME "ASIC_fpaddsub_arch2_syn_constraints.tcl"
remove_design -designs


analyze -library WORK -format verilog "$DESIGN_NAME"


set x 0;
while {$x < 1} {

#Elaboramos el módulo principal
elaborate -update $TOP_NAME -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

uniquify

#Enlazar los demás módulos al módulo principal
link


#Escribir el archivo *.ddc (base de datos sin sintetizar)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$TOP_NAME\_syn_unmapped.ddc

#Aplicar especificaciones de diseño (constraints)
source $CONTRAINTS_FILE_NAME
propagate_constraints

#Revisar el diseño
check_design

#set compile_top_all_paths true;

#Compilar el diseño
compile_ultra -timing_high_effort_script

#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
#- Como una de las entradas para el sintetizador físico (IC Compiler).
set verilogout_no_tri true
change_names -hierarchy -rules verilog
write -hierarchy -format verilog -output \
./db/$PRECISION($x)/$TOP_NAME\_syn.v

#Generar los reportes

report_power -analysis_effort high > reports/$PRECISION($x)/$TOP_NAME\_syn_power.txt
report_area >   reports/$PRECISION($x)/$TOP_NAME\_syn_area.txt
report_cell >   reports/$PRECISION($x)/$TOP_NAME\_syn_cell.txt
report_qor >    reports/$PRECISION($x)/$TOP_NAME\_syn_qor.txt
report_timing > reports/$PRECISION($x)/$TOP_NAME\_syn_timing.txt
report_port >   reports/$PRECISION($x)/$TOP_NAME\_syn_port.txt

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$TOP_NAME\_syn_mapped.ddc

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
#para el sintetizador físico (IC Compiler)
write_sdc ./db/$PRECISION($x)/$TOP_NAME\_syn.sdc

#Revisar la configuración de temporizado
check_timing

#FINALIZAMOS EL LOOP
set x [expr {$x + 1}]
}
