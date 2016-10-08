####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:  13 Agosto 2012

####################################################################################################################################
set PRECISION(0) "SINGLE";
set PRECISION(1) "DOUBLE";
set PREC_PARAM(0) "W=32,SW=23,EW=8,SWR=26,EWR=5";
set PREC_PARAM(1) "W=64,SW=52,EW=11,SWR=55,EWR=6";
# Eliminar diseños previos
remove_design -designs

# Primero se analiza el módulo principal
analyze -library WORK -format verilog file_list

set x 0;
while {$x < 2} {

#Elaboramos el módulo principal
elaborate -update FPU_Add_Subtract_Function -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

#Enlazar los demás módulos al módulo principal
link

#Escribir el archivo *.ddc (base de datos sin sintetizar)
write -hierarchy -format ddc -output \
./db/fpaddsub_arch2_$PRECISION($x)_syn_unmapped.ddc

#Aplicar especificaciones de diseño (constraints)
#source fpaddsub_arch2_$precision($x)syn_constraints.tcl
propagate_constraints

#Revisar el diseño
check_design

#Compilar el diseño
compile_ultra

#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
#- Como una de las entradas para el sintetizador físico (IC Compiler).
set verilogout_no_tri true
change_names -hierarchy -rules verilog
write -hierarchy -format verilog -output \
./db/fpaddsub_arch2_$PRECISION($x)_syn.v

#Generar los reportes

report_power -analysis_effort high > reports/fpaddsub_arch2_$PRECISION($x)_syn_power.txt
report_area > reports/fpaddsub_arch2_$PRECISION($x)_syn_area.txt
report_cell > reports/fpaddsub_arch2_$PRECISION($x)_syn_cell.txt
report_qor > reports/fpaddsub_arch2_$PRECISION($x)_syn_qor.txt
report_timing > reports/fpaddsub_arch2_$PRECISION($x)_syn_timing.txt
report_port > reports/fpaddsub_arch2_$PRECISION($x)_syn_port.txt

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output \
./db/fpaddsub_arch2_$PRECISION($x)_syn_mapped.ddc

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
#para el sintetizador físico (IC Compiler)
write_sdc ./db/fpaddsub_arch2_$PRECISION($x)_syn.sdc

#Revisar la configuración de temporizado
check_timing

#FINALIZAMOS EL LOOP
set x [expr {$x + 1}]
}
