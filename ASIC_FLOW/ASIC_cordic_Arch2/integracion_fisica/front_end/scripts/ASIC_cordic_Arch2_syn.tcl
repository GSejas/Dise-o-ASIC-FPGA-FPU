####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:  13 Agosto 2012

####################################################################################################################################

# Eliminar diseños previos
remove_design -designs

# Primero se analiza el módulo principal
analyze -library WORK -format verilog {counter.v}

#Luego se analiza los otros módulos
#analyze -format verilog {divisor_frecuencia.v \
#secuenciaFSM.v}

#Elaboramos el módulo principal
elaborate counter -architecture verilog -library WORK

#Enlazar los demás módulos al módulo principal
link

#Escribir el archivo *.ddc (base de datos sin sintetizar)
write -hierarchy -format ddc -output \
./db/counter_syn_unmapped.ddc

#Aplicar especificaciones de diseño (constraints)
#source counter_syn_constraints.tcl
#propagate_constraints

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
./db/counter_syn.v

#Generar los reportes

report_power -analysis_effort high > reports/counter_syn_power.txt
report_area > reports/counter_syn_area.txt
report_cell > reports/counter_syn_cell.txt
report_qor > reports/counter_syn_qor.txt
report_timing > reports/counter_syn_timing.txt
report_port > reports/counter_syn_port.txt

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output \
./db/counter_syn_mapped.ddc

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
#para el sintetizador físico (IC Compiler)
write_sdc ./db/counter_syn.sdc

#Revisar la configuración de temporizado
check_timing
