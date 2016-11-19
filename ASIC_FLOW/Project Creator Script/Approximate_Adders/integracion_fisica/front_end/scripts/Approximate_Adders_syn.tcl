####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:

####################################################################################################################################

set PREC_PARAM(0) "W=16";

# Eliminar diseños previos
set DESIGN_NAME  "FPU_Interface"
set TOP_NAME     "FPU_Interface"
set CONTRAINTS_FILE_NAME "ASIC_fpu_syn_constraints.tcl"
set compile_fix_cell_degradation true

# NOMBRE DEL MACRO DE LAS ARQUITECTURAS EN CUESTION
set ADD_ARCHS "ACAI ACAII ETAI GDA RCA LOA GeAr"
set AARCH [split $ADD_ARCHS "\ "]

remove_design -designs
suppress_message LINT-321
suppress_message UID-401
#WE PARSE THE FILE_LIST GENERATED OUTSIDE THIS SCRIPT LINK:http://wiki.tcl.tk/367
set fp [open "scripts/file_list" r]
set file_sources [read $fp]
close $fp

set data [split $file_sources "\n"]

# Primero se analiza el módulo principal

foreach line $data {
  analyze -library WORK -format verilog "$line"

  set line2 [string trim $line ".v"]
  #Elaboramos el módulo principal
  elaborate $line2 -architecture verilog -library WORK

  uniquify

  #Enlazar los demás módulos al módulo principal
  link


   #Escribir el archivo *.ddc (base de datos sin sintetizar)
   write -hierarchy -format ddc -output \
   ./db/$line2\_syn_unmapped.ddc

  # #Aplicar especificaciones de diseño (constraints)
   source $CONTRAINTS_FILE_NAME
   propagate_constraints

  # #Revisar el diseño
   check_design -multiple_designs

  set compile_top_all_paths true;

  # #Compilar el diseño
   compile_ultra -timing_high_effort_script -retime

  #Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
  #- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
  #- Como una de las entradas para el sintetizador físico (IC Compiler).

  set verilogout_no_tri true
  change_names -hierarchy -rules verilog
  write -hierarchy -format verilog -output \
  ./db/$line2\_syn.v

  #Generar los reportes

  report_power -analysis_effort high > reports/$line2\_syn_power.txt
  report_area >   reports/$line2\_syn_area.txt
  report_cell >   reports/$line2\_syn_cell.txt
  report_qor >    reports/$line2\_syn_qor.txt
  report_timing > reports/$line2\_syn_timing.txt
  report_port >   reports/$line2\_syn_port.txt

  #Escribir el archivo *.ddc (base de datos sintetizada)
  write -hierarchy -format ddc -output \
  ./db/$TOP_NAME\_$line2\_syn_mapped.ddc

  #Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
  #para el sintetizador físico (IC Compiler)
  write_sdc ./db/$line2\_syn.sdc
  write_sdf ./db/$line2\_syn.sdf
  write_sdf ../simulacion_logica_sintesis/$line2\_syn.sdf

  ##LE AGREGAMOS CON UN COMANDO DE BASH EL SDF CORRESPONDIENTE PARA LA SIMULACION
  set string_replace "sed -i \"s/endmodule/initial\ \\\$sdf\_annotate\(\\\"$line2\_syn.sdf\\\"\)\\\\; \\n endmodule/g\" db/$line2\_syn.v"
  #set string_replace "sed -i \"s/endmodule/ initial \t \$sdf_annotate\(\"$TOP_NAME\_$mult_arch\_syn.sdf\"\); \n endmodule/g\" db/$PRECISION(1)/$TOP_NAME\_$mult_arch\_syn.v"
  exec /bin/sh -c "$string_replace"
  #Revisar la configuración de temporizado
  check_timing

}
