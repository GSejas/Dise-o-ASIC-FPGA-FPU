####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:

####################################################################################################################################
set PRECISION(0) "SINGLE";
set PRECISION(1) "DOUBLE";
set PREC_PARAM(0) "W=32,SW=23,EW=8,SWR=26,EWR=5";
set PREC_PARAM(1) "W=64,SW=52,EW=11,SWR=55,EWR=6";
# Eliminar diseños previos

set compile_fix_cell_degradation true

# NOMBRE DEL MACRO DE LAS ARQUITECTURAS EN CUESTION

set OP_LIST "CORDIC_Arch2 CORDIC_Arch3 CORDIC_Arch2v1 CORDIC_Arch3v1 FPU_Add_Subtract_Function FPU_PIPELINED_FPADDSUB"
set OP_LIST_LINE [split $OP_LIST "\ "]

set FPU_CONSTRAINTS "ASIC_fpu_syn_constraints_clk10.tcl ASIC_fpu_syn_constraints_clk20.tcl ASIC_fpu_syn_constraints_clk30.tcl ASIC_fpu_syn_constraints_clk40.tcl"
set F_TIME_CONTRAINTS_ARRAY [split $FPU_CONSTRAINTS "\ "]

remove_design -designs
suppress_message LINT-321
suppress_message LINT-32
suppress_message UID-401
#WE PARSE THE FILE_LIST GENERATED OUTSIDE THIS SCRIPT LINK:http://wiki.tcl.tk/367
set fp [open "scripts/file_list" r]
set file_sources [read $fp]
close $fp

set data [split $file_sources "\n"]

# Primero se analiza el módulo principal

foreach line $data {
  analyze -library WORK -format verilog "$line"
}


set x 0;
while {$x < 2} {
    foreach OP_LINE $OP_LIST_LINE {
    	foreach CONTRAINTS_FILE_NAME $F_TIME_CONTRAINTS_ARRAY {

		#Elaboramos el módulo principal
		elaborate $OP_LINE -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

		uniquify

		#Enlazar los demás módulos al módulo principal
		link


		 #Escribir el archivo *.ddc (base de datos sin sintetizar)
		 write -hierarchy -format ddc -output \
		 ./db/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_unmapped.ddc

		# #Aplicar especificaciones de diseño (constraints)
		 source $CONTRAINTS_FILE_NAME
		 propagate_constraints

		# #Revisar el diseño
		 check_design -multiple_designs

		set compile_top_all_paths true;

		# #Compilar el diseño
		 compile_ultra -timing_high_effort_script -retime  -gate_clock

		#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
		#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
		#- Como una de las entradas para el sintetizador físico (IC Compiler).
		#set TOP_PARAM $current_design

		#LO SIGUIENTE SE VA A COMENTAR PARA NO GENERAR UNA VERSION APARTE DE LA SECCION OPER_IN_OP

		#current_design "$TOP_PARAM"

		set verilogout_no_tri true
		change_names -hierarchy -rules verilog
		write -hierarchy -format verilog -output \
		./db/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn.v

		#Generar los reportes

		report_power -analysis_effort high > reports/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_power.txt
		report_area >   reports/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_area.txt
		report_cell >   reports/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_cell.txt
		report_qor >    reports/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_qor.txt
		report_timing > reports/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_timing.txt
		report_port >   reports/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_port.txt

		#Escribir el archivo *.ddc (base de datos sintetizada)
		write -hierarchy -format ddc -output \
		./db/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn_mapped.ddc

		#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
		#para el sintetizador físico (IC Compiler)
		write_sdc ./db/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn.sdc
		write_sdf ./db/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn.sdf
		write_sdf ../simulacion_logica_sintesis/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn.sdf

		##LE AGREGAMOS CON UN COMANDO DE BASH EL SDF CORRESPONDIENTE PARA LA SIMULACION
		set string_replace "sed -i \"s/endmodule/initial\ \\\$sdf\_annotate\(\\\"$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn.sdf\\\"\)\\\\; \\n endmodule/g\" db/$PRECISION($x)/$OP_LINE\_$CONTRAINTS_FILE_NAME\_GATED\_syn.v"
		#set string_replace "sed -i \"s/endmodule/ initial \t \$sdf_annotate\(\"$TOP_NAME\_syn.sdf\"\); \n endmodule/g\" db/$PRECISION(1)/$TOP_NAME\_syn.v"
		exec /bin/sh -c "$string_replace"
		#Revisar la configuración de temporizado
		check_timing
		}		
	}

# #FINALIZAMOS EL LOOP
  set x [expr {$x + 1}]
}
