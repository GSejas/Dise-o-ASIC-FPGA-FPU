####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:

####################################################################################################################################
set PRECISION(0) "SINGLE";
set PRECISION(1) "DOUBLE";
set PREC_PARAM(0) "SW=24";
set PREC_PARAM(1) "SW=54";
# Eliminar diseños previos
set DESIGN_NAME  "RecursiveKOA"
set TOP_NAME     "RecursiveKOA"
set CONTRAINTS_FILE_NAME "ASIC_KOA_syn_constraints.tcl"
set compile_fix_cell_degradation true
remove_design -designs

#WE PARSE THE FILE_LIST GENERATED OUTSIDE THIS SCRIPT LINK:http://wiki.tcl.tk/367
set fp [open "scripts/file_list" r]
set file_sources [read $fp]
close $fp

set data [split $file_sources "\n"]

# Primero se analiza el módulo principal

foreach line $data {
  analyze -library WORK -format verilog "$line"
}

#source "ASIC_fpaddsub_arch2_syn_2.tcl"

set x 0;
while {$x < 2} {

#Elaboramos el módulo principal
elaborate $TOP_NAME -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

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
check_design -multiple_designs

#set compile_top_all_paths true;

#Compilar el diseño

#Este compile ultra es para el timing, se le puede quitar ese retime si fuera el caso de area o algo más
compile_ultra -retime 
#compile


#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
#- Como una de las entradas para el sintetizador físico (IC Compiler).
set TOP_PARAM $current_design

#LO SIGUIENTE SE VA A COMENTAR PARA NO GENERAR UNA VERSION APARTE DE LA SECCION OPER_IN_OP
#source "ASIC_Oper_In_Op_syn.tcl"
#write_sdc ./db/$PRECISION($x)/Oper_Start_in\_syn.sdc

#current_design "$TOP_PARAM"

set verilogout_no_tri true
change_names -hierarchy -rules verilog
write -hierarchy -format verilog -output \
./db/$PRECISION($x)/$TOP_NAME\_syn.v

#Generar los reportes

report_power -analysis_effort high > reports/$PRECISION($x)/$TOP_NAME\_syn_power.txt
report_area -hierarchy -designware >   reports/$PRECISION($x)/$TOP_NAME\_syn_area.txt
report_cell >   reports/$PRECISION($x)/$TOP_NAME\_syn_cell.txt
report_qor >    reports/$PRECISION($x)/$TOP_NAME\_syn_qor.txt
report_timing -max_paths 5 > reports/$PRECISION($x)/$TOP_NAME\_syn_timing.txt
report_port >   reports/$PRECISION($x)/$TOP_NAME\_syn_port.txt

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$TOP_NAME\_syn_mapped.ddc

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
#para el sintetizador físico (IC Compiler)
write_sdc ./db/$PRECISION($x)/$TOP_NAME\_syn.sdc
write_sdf ./db/$PRECISION($x)/$TOP_NAME\_syn.sdf
write_sdf ../simulacion_logica_sintesis/$PRECISION($x)/$TOP_NAME\_syn.sdf

##LE AGREGAMOS CON UN COMANDO DE BASH EL SDF CORRESPONDIENTE PARA LA SIMULACION
set string_replace "sed -i \"s/endmodule/initial\ \\\$sdf\_annotate\(\\\"$TOP_NAME\_syn.sdf\\\"\)\\\\; \\n endmodule/g\" db/$PRECISION($x)/$TOP_NAME\_syn.v"
#set string_replace "sed -i \"s/endmodule/ initial \t \$sdf_annotate\(\"$TOP_NAME\_syn.sdf\"\); \n endmodule/g\" db/$PRECISION(1)/$TOP_NAME\_syn.v"
exec /bin/sh -c "$string_replace"
#Revisar la configuración de temporizado
check_timing

#FINALIZAMOS EL LOOP
set x [expr {$x + 1}]
}
