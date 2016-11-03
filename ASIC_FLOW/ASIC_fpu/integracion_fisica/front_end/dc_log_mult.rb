####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com
#Herramienta:        Design Compiler
#Fecha de creación:
####################################################################################################################################
set PRECISION(0) "SINGLE";
SINGLE
set PRECISION(1) "DOUBLE";
DOUBLE
set PREC_PARAM(0) "W=32,SW=23,EW=8";
W=32,SW=23,EW=8
set PREC_PARAM(1) "W=64,SW=52,EW=11";
W=64,SW=52,EW=11
# Eliminar diseños previos
set DESIGN_NAME  "fpmult_arch3"
fpmult_arch3
set TOP_NAME     "FPU_Multiplication_Function"
FPU_Multiplication_Function
set CONTRAINTS_FILE_NAME "ASIC_fpu_syn_constraints.tcl"
ASIC_fpu_syn_constraints.tcl
set compile_fix_cell_degradation true
true
remove_design -designs
Removing design 'FPU_Multiplication_Function_W32_EW8_SW23'
Removing design 'RegisterAdd_W1_0'
Removing design 'RegisterMult_W32_0'
Removing design 'Comparator_Equal_S31_0'
Removing design 'RegisterMult_W1_0'
Removing design 'RegisterAdd_W1_1'
Removing design 'RegisterAdd_W1_2'
Removing design 'RegisterAdd_W1_3'
Removing design 'RegisterMult_W32_1'
Removing design 'Comparator_Equal_S31_1'
Removing design 'RegisterMult_W1_1'
Removing design 'FSM_Mult_Function'
Removing design 'RegisterAdd_W2'
Removing design 'First_Phase_M_W32'
Removing design 'Zero_InfMult_Unit_W32'
Removing design 'Multiplexer_AC_W9'
Removing design 'Mux_3x1_W8'
Removing design 'Exp_Operation_m_EW8'
Removing design 'XOR_M'
Removing design 'Multiplexer_AC_W24'
Removing design 'Barrel_Shifter_M_SW24'
Removing design 'Round_decoder_M_SW23'
Removing design 'Adder_Round_SW24'
Removing design 'Tenth_Phase_W32_EW8_SW23'
Removing design 'add_sub_carry_out_W9'
Removing design 'add_sub_carry_out_W9_DW01_add_0'
Removing design 'add_sub_carry_out_W9_DW01_sub_0'
Removing design 'RegisterMult_W9'
Removing design 'Comparator_Less_W9'
Removing design 'shift_mux_array_SWR24_LEVEL0'
Removing design 'RegisterMult_W24'
Removing design 'OR_Module_W23'
Removing design 'Deco_Round_Mult'
Removing design 'adder_W24'
Removing design 'adder_W24_DW01_add_0'
Removing design 'RegisterAdd_W24'
Removing design 'Mux_3x1_W1'
Removing design 'Multiplexer_AC_W8'
Removing design 'Multiplexer_AC_W23'
Removing design 'RegisterAdd_W32'
1
# NOMBRE DEL MACRO DE LAS ARQUITECTURAS EN CUESTION
set MULT_ARCHS "KOA_1STAGE RKOA_1STAGE DW_1STAGE KOA_2STAGE RKOA_2STAGE"
KOA_1STAGE RKOA_1STAGE DW_1STAGE KOA_2STAGE RKOA_2STAGE
set MARCH [split $MULT_ARCHS "\ "]
KOA_1STAGE RKOA_1STAGE DW_1STAGE KOA_2STAGE RKOA_2STAGE
remove_design -designs
1
suppress_message LINT-321
suppress_message UID-401
#WE PARSE THE FILE_LIST GENERATED OUTSIDE THIS SCRIPT LINK:http://wiki.tcl.tk/367
set fp [open "scripts/file_list" r]
file19
set file_sources [read $fp]
Adder_Round.v
adder.v
add_sub_carry_out.v
Add_Subt.v
Barrel_Shifter_M.v
Barrel_shifter.v
cmult.v
Comparator_Equal.v
Comparator_Less.v
Comparators.v
Comparator.v
CORDIC_Arch2.v
CORDIC_Arch2v1.v
CORDIC_Arch3.v
CORDIC_Arch3v1.v
CORDIC_FSM_v2.v
CORDIC_FSM_v3.v
counter_d.v
counter_up.v
DECO_CORDIC_OP.v
DECO_CORDIC_OP2.v
deco_op.v
Deco_Round_Mult.v
demux_1x3.v
d_ff_en.v
DW_mult.v
Exp_operation_m.v
exp_operation.v
First_Phase_M.v
FORMATTER.v
FPU_ADD_Substract_PIPELINED.v
FPU_Add_Subtract_Function.v
FPU_Interface_1v1.v
FPU_Interface2v1.v
FPU_Multiplication_Function.v
FSM_Add_Subtract.v
FSM_input_enable.v
FSM_Mult_Function.v
global.v
Greater_Comparator.v
KOA_1c.v
KOA_2c.v
lut_CASE_32.v
lut_CASE_64.v
LZD.v
mult2.v
Multiplexer_AC.v
MultiplexTxT.v
multiplier.v
mult.v
Mux_2x1.v
Mux_3x1_b.v
Mux_3x1_b_v2.v
Mux_3x1.v
Mux_Array.v
NaN_mod_32.v
NaN_mod_64.v
Oper_Start_In.v
Op_Select.v
OR_Module.v
Priority_Codec_32.v
Priority_Codec_64.v
PriorityEncoder_ExtCORDIC.v
RecursiveKOA_1c.v
RecursiveKOA.v
RecursiveKOA_Weighted.v
RegisterAdd.v
RegisterMult.v
Rotate_Mux_Array.v
Round_decoder_M.v
Round_Sgf_Dec.v
Sgf_Multiplication.v
sgn_result.v
shift_mux.v
shift_reg.v
sign_inverter.v
Simple_Subt.v
submidRecursiveKOA2.v
submidRecursiveKOA.v
subRecursiveKOA_1c.v
subRecursiveKOA.v
substractor.v
Tenth_Phase.v
Tenth_Phase_v2.v
Up_Counter.v
XOR_M.v
xor_tri.v
Zero_InfMult_Unit.v

close $fp
set data [split $file_sources "\n"]
Adder_Round.v adder.v add_sub_carry_out.v Add_Subt.v Barrel_Shifter_M.v Barrel_shifter.v cmult.v Comparator_Equal.v Comparator_Less.v Comparators.v Comparator.v CORDIC_Arch2.v CORDIC_Arch2v1.v CORDIC_Arch3.v CORDIC_Arch3v1.v CORDIC_FSM_v2.v CORDIC_FSM_v3.v counter_d.v counter_up.v DECO_CORDIC_OP.v DECO_CORDIC_OP2.v deco_op.v Deco_Round_Mult.v demux_1x3.v d_ff_en.v DW_mult.v Exp_operation_m.v exp_operation.v First_Phase_M.v FORMATTER.v FPU_ADD_Substract_PIPELINED.v FPU_Add_Subtract_Function.v FPU_Interface_1v1.v FPU_Interface2v1.v FPU_Multiplication_Function.v FSM_Add_Subtract.v FSM_input_enable.v FSM_Mult_Function.v global.v Greater_Comparator.v KOA_1c.v KOA_2c.v lut_CASE_32.v lut_CASE_64.v LZD.v mult2.v Multiplexer_AC.v MultiplexTxT.v multiplier.v mult.v Mux_2x1.v Mux_3x1_b.v Mux_3x1_b_v2.v Mux_3x1.v Mux_Array.v NaN_mod_32.v NaN_mod_64.v Oper_Start_In.v Op_Select.v OR_Module.v Priority_Codec_32.v Priority_Codec_64.v PriorityEncoder_ExtCORDIC.v RecursiveKOA_1c.v RecursiveKOA.v RecursiveKOA_Weighted.v RegisterAdd.v RegisterMult.v Rotate_Mux_Array.v Round_decoder_M.v Round_Sgf_Dec.v Sgf_Multiplication.v sgn_result.v shift_mux.v shift_reg.v sign_inverter.v Simple_Subt.v submidRecursiveKOA2.v submidRecursiveKOA.v subRecursiveKOA_1c.v subRecursiveKOA.v substractor.v Tenth_Phase.v Tenth_Phase_v2.v Up_Counter.v XOR_M.v xor_tri.v Zero_InfMult_Unit.v {}
# Primero se analiza el módulo principal
foreach line $data {
  analyze -library WORK -format verilog "$line"
}
Running PRESTO HDLC
Compiling source file ./source/Adder_Round.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/adder.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/add_sub_carry_out.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Add_Subt.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Barrel_Shifter_M.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Barrel_shifter.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/cmult.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Comparator_Equal.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Comparator_Less.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Comparators.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Comparator.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/CORDIC_Arch2.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/CORDIC_Arch2v1.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/CORDIC_Arch3.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/CORDIC_Arch3v1.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/CORDIC_FSM_v2.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/CORDIC_FSM_v3.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/counter_d.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/counter_up.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/DECO_CORDIC_OP.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/DECO_CORDIC_OP2.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/deco_op.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Deco_Round_Mult.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/demux_1x3.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/d_ff_en.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/DW_mult.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Exp_operation_m.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/exp_operation.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/First_Phase_M.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FORMATTER.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FPU_ADD_Substract_PIPELINED.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FPU_Add_Subtract_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FPU_Interface_1v1.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FPU_Interface2v1.v
Warning:  ./source/FPU_Interface2v1.v:296: the undeclared symbol 'zero_flag' assumed to have the default net type, which is 'wire'. (VER-936)
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FSM_Add_Subtract.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FSM_input_enable.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/FSM_Mult_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Greater_Comparator.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/KOA_1c.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/KOA_2c.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/lut_CASE_32.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/lut_CASE_64.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/LZD.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/mult2.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Multiplexer_AC.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/MultiplexTxT.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/multiplier.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/mult.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Mux_2x1.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Mux_3x1_b.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Mux_3x1_b_v2.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Mux_3x1.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Mux_Array.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/NaN_mod_32.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/NaN_mod_64.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Oper_Start_In.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Op_Select.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/OR_Module.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Priority_Codec_32.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Priority_Codec_64.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/PriorityEncoder_ExtCORDIC.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/RecursiveKOA_1c.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/RecursiveKOA.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/RecursiveKOA_Weighted.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/RegisterAdd.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/RegisterMult.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Rotate_Mux_Array.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Round_decoder_M.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Round_Sgf_Dec.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Sgf_Multiplication.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/sgn_result.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/shift_mux.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/shift_reg.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/sign_inverter.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Simple_Subt.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/submidRecursiveKOA2.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/submidRecursiveKOA.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/subRecursiveKOA_1c.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/subRecursiveKOA.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/substractor.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Tenth_Phase.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Tenth_Phase_v2.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Up_Counter.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/XOR_M.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/xor_tri.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/Zero_InfMult_Unit.v
Presto compilation completed successfully.
Error: Value for list 'file_list' must have more than zero elements. (CMD-036)
#source "ASIC_fpaddsub_arch2_syn_2.tcl"
set x 0;
0
while {$x < 2} {
    foreach mult_arch $MARCH {

    # Re analizamos el diseno FPU_MULT, ya que se debe de tomar en consideracion 
    # cada modulo bajo prueba. Esto se puede expandir para diferentes arquitecturas futuras
    analyze -library WORK -define "$mult_arch" -format verilog "FPU_Multiplication_Function.v" 
   
	#Elaboramos el módulo principal
	elaborate $TOP_NAME -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

	uniquify

	#Enlazar los demás módulos al módulo principal
	link


	 #Escribir el archivo *.ddc (base de datos sin sintetizar)
	 write -hierarchy -format ddc -output 	 ./db/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_unmapped.ddc

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
	set TOP_PARAM $current_design

	#LO SIGUIENTE SE VA A COMENTAR PARA NO GENERAR UNA VERSION APARTE DE LA SECCION OPER_IN_OP

	current_design "$TOP_PARAM"

	set verilogout_no_tri true
	change_names -hierarchy -rules verilog
	write -hierarchy -format verilog -output 	./db/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn.v

	#Generar los reportes

	report_power -analysis_effort high > reports/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_power.txt
	report_area >   reports/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_area.txt
	report_cell >   reports/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_cell.txt
	report_qor >    reports/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_qor.txt
	report_timing > reports/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_timing.txt
	report_port >   reports/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_port.txt

	#Escribir el archivo *.ddc (base de datos sintetizada)
	write -hierarchy -format ddc -output 	./db/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn_mapped.ddc

	#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
	#para el sintetizador físico (IC Compiler)
	write_sdc ./db/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn.sdc
	write_sdf ./db/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn.sdf
	write_sdf ../simulacion_logica_sintesis/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn.sdf

	##LE AGREGAMOS CON UN COMANDO DE BASH EL SDF CORRESPONDIENTE PARA LA SIMULACION
	set string_replace "sed -i \"s/endmodule/initial\ \\\$sdf\_annotate\(\\\"$TOP_NAME\_$mult_arch\_syn.sdf\\\"\)\\\\; \\n endmodule/g\" db/$PRECISION($x)/$TOP_NAME\_$mult_arch\_syn.v"
	#set string_replace "sed -i \"s/endmodule/ initial \t \$sdf_annotate\(\"$TOP_NAME\_$mult_arch\_syn.sdf\"\); \n endmodule/g\" db/$PRECISION(1)/$TOP_NAME\_$mult_arch\_syn.v"
	exec /bin/sh -c "$string_replace"
	#Revisar la configuración de temporizado
	check_timing
	
	}

# #FINALIZAMOS EL LOOP
  set x [expr {$x + 1}]
}
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W32_EW8_SW23'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=9". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "EW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Simple_KOA_STAGE_1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=24". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32,EW=8,SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W32' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W32 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W32' with
	the parameters "S=31". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W9 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   9   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'Simple_KOA_STAGE_1_SW24' with
	the parameters "SW=12". (HDL-193)

Inferred memory devices in process
	in routine mult_SW12 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  24   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'Simple_KOA_STAGE_1_SW24' with
	the parameters "SW=13". (HDL-193)

Inferred memory devices in process
	in routine mult_SW13 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  26   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Simple_KOA_STAGE_1_SW24' with
	the parameters "W=48". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W48 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  48   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "SWR=24,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W24 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW23' with
	the parameters "W=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W24 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=23". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W32 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W32'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S31'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'mult_SW12'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W32_EW8_SW23'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (42 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/SINGLE/FPU_Multiplication_Function_KOA_1STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W32_EW8_SW23) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W32) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W23) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W8) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW24) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W24) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W24) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW23) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W23) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW24) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W24) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR24_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W24) #

#   Propagate Constraints from cell Sgf_operation/ (Simple_KOA_STAGE_1_SW24) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.finalreg/              \
(RegisterAdd_W48) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.middle/ (mult_SW13) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.right/ (mult_SW12_0) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.left/ (mult_SW12_1) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW8) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W9) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/ (RegisterMult_W9) \
#

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W9) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W8) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W9) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W32) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S31_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S31_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W32) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W32_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W32_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:07:11 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             241
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        151
    Nets connected to multiple pins on same cell (LINT-33)         11
    Leaf pins connected to undriven nets (LINT-58)                 74
    Cells have undriven hier pins (LINT-59)                         3
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W9', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W9', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 1. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW24', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[7]', 'D2[7]'', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[6]', 'D1[5]'', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[23]', 'Data_B_i[23]''.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[23]', 'Data_B_i[22]'', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[5]', 'Data_B_i[3]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[4]', 'Data_B_i[2]'', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[30]', 'Data_B[29]'', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[30]', 'Data_A[29]'', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[8]', 'Data_B[7]''.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[6]', 'Data_B[5]'', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[7]', 'D1[6]'', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[22]', 'D1[21]'', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[23]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[22]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[21]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[20]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[19]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[18]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[17]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[16]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[15]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[14]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[13]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[12]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[11]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[10]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[9]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[8]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[7]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[6]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[5]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[4]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[3]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[2]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[1]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_1', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[0]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[25]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[24]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[23]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[22]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[21]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[20]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[19]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[18]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[17]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[16]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[15]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[14]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[13]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[12]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[11]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[10]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[9]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[8]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[7]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[6]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[5]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[4]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[3]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[2]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[1]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW13', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[0]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[23]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[22]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[21]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[20]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[19]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[18]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[17]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[16]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[15]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[14]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[13]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[12]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[11]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[10]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[9]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[8]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[7]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[6]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[5]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[4]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[3]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[2]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[1]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'mult_SW12_0', input pin 'clocked_on' of leaf cell 'Data_S_o_reg[0]' is connected to undriven net 'clk'.  (LINT-58)
Warning: In design 'Simple_KOA_STAGE_1_SW24', input pin 'clk' of hierarchical cell 'EVEN1.left' has one or more internal loads, but is not connected to any nets. 'Logic 0' is assumed. (LINT-59)
Warning: In design 'Simple_KOA_STAGE_1_SW24', input pin 'clk' of hierarchical cell 'EVEN1.right' has one or more internal loads, but is not connected to any nets. 'Logic 0' is assumed. (LINT-59)
Warning: In design 'Simple_KOA_STAGE_1_SW24', input pin 'clk' of hierarchical cell 'EVEN1.middle' has one or more internal loads, but is not connected to any nets. 'Logic 0' is assumed. (LINT-59)
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 242 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W32_EW8_SW23'

Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'
Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping 41 of 42 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W32_EW8_SW23'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W32_EW8_SW23'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W32_EW8_SW23'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:14   32294.9      0.00       0.0     484.8                           41311.3164
    0:00:14   32294.9      0.00       0.0     484.8                           41311.3164
    0:00:14   32294.9      0.00       0.0     484.8                           41311.3164
    0:00:14   32292.0      0.00       0.0     484.8                           41314.1094

  Beginning WLM Backend Optimization
  --------------------------------------
    0:00:16   32133.6      0.00       0.0     479.5                           41189.1758
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:17   32133.6      0.00       0.0     479.1                           41119.0625
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:00:20   34488.0      0.00       0.0       0.0                           43914.2031
    0:00:20   34488.0      0.00       0.0       0.0                           43914.2031


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:20   34488.0      0.00       0.0       0.0                           43914.2031
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
    0:00:22   32937.1      0.00       0.0       0.0                           41712.9883
    0:00:22   32937.1      0.00       0.0       0.0                           41712.9883
    0:00:22   32937.1      0.00       0.0       0.0                           41712.9883
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:23   32849.3      0.00       0.0       0.0                           41400.2617
    0:00:23   32744.2      0.00       0.0       0.0                           41283.2812
    0:00:23   32744.2      0.00       0.0       0.0                           41283.2812
    0:00:23   32744.2      0.00       0.0       0.0                           41283.2812
    0:00:24   32745.6      0.00       0.0       0.0                           41243.0039
    0:00:25   32738.4      0.00       0.0       0.0                           41234.5820
    0:00:25   32738.4      0.00       0.0       0.0                           41234.5820
    0:00:25   32738.4      0.00       0.0       0.0                           41234.5820
    0:00:25   32738.4      0.00       0.0       0.0                           41234.5820
    0:00:25   32644.8      0.00       0.0       0.0                           41208.0000
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W32_EW8_SW23'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_KOA_1STAGE_syn.v'.
Writing ddc file './db/SINGLE/FPU_Multiplication_Function_KOA_1STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_KOA_1STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/SINGLE/FPU_Multiplication_Function_KOA_1STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W32_EW8_SW23'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=9". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "EW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RecursiveKOA_STAGE_1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=24". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32,EW=8,SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W32' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W32 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W32' with
	the parameters "S=31". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W9 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   9   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_1_SW24' with
	the parameters "SW=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_1_SW24' with
	the parameters "SW=13". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'RecursiveKOA_STAGE_1_SW24' with
	the parameters "W=48". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W48 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  48   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "SWR=24,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W24 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW23' with
	the parameters "W=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W24 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=23". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W32 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW12' with
	the parameters "SW=6". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW12' with
	the parameters "SW=7". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW13' with
	the parameters "SW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW6' with
	the parameters "SW=6". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW7' with
	the parameters "SW=7". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW8' with
	the parameters "SW=8". (HDL-193)
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W32'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S31'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'csubRecursiveKOA_SW12'. (OPT-1056)
Information: Uniquified 5 instances of design 'csubRecursiveKOA_SW6'. (OPT-1056)
Information: Uniquified 3 instances of design 'csubRecursiveKOA_SW7'. (OPT-1056)
Information: Uniquified 5 instances of design 'cmult_SW6'. (OPT-1056)
Information: Uniquified 3 instances of design 'cmult_SW7'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W32_EW8_SW23'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (60 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/SINGLE/FPU_Multiplication_Function_RKOA_1STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W32_EW8_SW23) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W32) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W23) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W8) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW24) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W24) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W24) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW23) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W23) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW24) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W24) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR24_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W24) #

#   Propagate Constraints from cell Sgf_operation/ (RecursiveKOA_STAGE_1_SW24) \
#

#   Propagate Constraints from cell Sgf_operation/EVEN1.finalreg/              \
(RegisterAdd_W48) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.middle/                \
(csubRecursiveKOA_SW13) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle/ (csubRecursiveKOA_SW8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult/           \
(cmult_SW8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right/ (csubRecursiveKOA_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_cmult/            \
(cmult_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left/ (csubRecursiveKOA_SW6_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_cmult/             \
(cmult_SW6_0) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.right/                 \
(csubRecursiveKOA_SW12_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle/ (csubRecursiveKOA_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult/           \
(cmult_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right/ (csubRecursiveKOA_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult/            \
(cmult_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left/ (csubRecursiveKOA_SW6_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult/             \
(cmult_SW6_2) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.left/                  \
(csubRecursiveKOA_SW12_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle/ (csubRecursiveKOA_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult/            \
(cmult_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right/ (csubRecursiveKOA_SW6_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult/             \
(cmult_SW6_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left/ (csubRecursiveKOA_SW6_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult/              \
(cmult_SW6_4) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW8) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W9) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/ (RegisterMult_W9) \
#

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W9) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W8) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W9) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W32) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S31_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S31_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W32) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W32_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W32_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:07:43 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             164
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        151
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W9', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W9', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 1. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW24', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[7]', 'D2[7]'', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[6]', 'D1[5]'', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[23]', 'Data_B_i[23]''.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[23]', 'Data_B_i[22]'', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[5]', 'Data_B_i[3]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[4]', 'Data_B_i[2]'', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[30]', 'Data_B[29]'', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[30]', 'Data_A[29]'', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[8]', 'Data_B[7]''.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[6]', 'Data_B[5]'', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[7]', 'D1[6]'', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[22]', 'D1[21]'', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 165 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W32_EW8_SW23'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping 59 of 60 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W32_EW8_SW23'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W32_EW8_SW23'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W32_EW8_SW23'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:41   99509.8      0.00       0.0     131.6                           154005.2031
    0:00:41   99509.8      0.00       0.0     131.6                           154005.2031

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------
    0:00:47   59677.9      3.65     262.1     181.4                           82212.9609
  Mapping 'FPU_Multiplication_Function_W32_EW8_SW23_DW01_add_19'
    0:00:48   60287.0      3.05     208.7     177.8                           83265.5312
    0:00:48   60287.0      3.05     208.7     177.8                           83265.5312
    0:00:53   66863.5      0.10       1.1     157.4                           95729.3828
    0:00:53   66863.5      0.10       1.1     157.4                           95729.3828
    0:00:55   66895.2      0.09       0.8     159.8                           95731.3359

  Beginning WLM Backend Optimization
  --------------------------------------
    0:00:59   65602.1      0.01       0.0     156.4                           93802.2266
    0:01:00   65541.6      0.01       0.0     156.3                           93646.2656
    0:01:00   65541.6      0.01       0.0     156.3                           93646.2656
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:01   65587.7      0.00       0.0     155.3                           93701.3828
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:01:03   66157.9      0.00       0.0       0.0                           94497.7656
    0:01:03   66157.9      0.00       0.0       0.0                           94497.7656


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:03   66157.9      0.00       0.0       0.0                           94497.7656
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
    0:01:09   66250.1      0.00       0.0       2.1                           94501.7188
    0:01:09   66250.1      0.00       0.0       2.1                           94501.7188
    0:01:09   66250.1      0.00       0.0       2.1                           94501.7188
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:10   66237.1      0.00       0.0       2.1                           94468.5625
    0:01:11   65168.6      0.00       0.0       2.1                           92457.8047
    0:01:11   65175.8      0.00       0.0       2.1                           92464.3750
    0:01:11   65175.8      0.00       0.0       2.1                           92464.3750
    0:01:12   65175.8      0.00       0.0       2.1                           92464.3750
    0:01:12   64617.1      0.00       0.0       0.0                           91539.3359
    0:01:12   64617.1      0.00       0.0       0.0                           91539.3359
    0:01:13   64617.1      0.00       0.0       0.0                           91539.3359
    0:01:13   64617.1      0.00       0.0       0.0                           91539.3359
    0:01:15   62673.1      0.00       0.0       0.0                           88212.3047
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W32_EW8_SW23'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_RKOA_1STAGE_syn.v'.
Writing ddc file './db/SINGLE/FPU_Multiplication_Function_RKOA_1STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_RKOA_1STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/SINGLE/FPU_Multiplication_Function_RKOA_1STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W32_EW8_SW23'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=9". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "EW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'DW_mult' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=24". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32,EW=8,SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W32' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W32 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W32' with
	the parameters "S=31". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W9 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   9   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'DW_mult_SW24' with
	the parameters "W=48". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W48 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  48   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "SWR=24,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W24 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW23' with
	the parameters "W=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W24 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=23". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W32 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W32'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S31'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W32_EW8_SW23'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (39 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/SINGLE/FPU_Multiplication_Function_DW_1STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W32_EW8_SW23) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W32) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W23) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W8) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW24) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W24) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W24) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW23) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W23) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW24) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W24) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR24_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W24) #

#   Propagate Constraints from cell Sgf_operation/ (DW_mult_SW24) #

#   Propagate Constraints from cell Sgf_operation/finalreg/ (RegisterAdd_W48) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW8) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W9) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/ (RegisterMult_W9) \
#

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W9) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W8) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W9) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W32) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S31_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S31_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W32) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W32_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W32_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:09:04 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             164
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        151
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W9', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W9', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 1. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW24', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[7]', 'D2[7]'', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[6]', 'D1[5]'', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[23]', 'Data_B_i[23]''.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[23]', 'Data_B_i[22]'', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[5]', 'Data_B_i[3]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[4]', 'Data_B_i[2]'', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[30]', 'Data_B[29]'', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[30]', 'Data_A[29]'', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[8]', 'Data_B[7]''.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[6]', 'Data_B[5]'', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[7]', 'D1[6]'', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[22]', 'D1[21]'', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 165 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W32_EW8_SW23'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping 38 of 39 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W32_EW8_SW23'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W32_EW8_SW23'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W32_EW8_SW23'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:17   34634.9      1.25      31.8     101.8                           44602.9492
  Mapping 'FPU_Multiplication_Function_W32_EW8_SW23_DW_mult_uns_1'
    0:00:19   36087.8      0.00       0.0     122.0                           46894.5664
    0:00:19   36087.8      0.00       0.0     122.0                           46894.5664
    0:00:20   36087.8      0.00       0.0     122.0                           46894.5664

  Beginning WLM Backend Optimization
  --------------------------------------
    0:00:23   35477.3      0.00       0.0     121.0                           46068.6445
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:23   35467.2      0.00       0.0     120.9                           46055.0781
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:00:25   35546.4      0.00       0.0       0.0                           46155.1523
    0:00:25   35546.4      0.00       0.0       0.0                           46155.1523


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:25   35546.4      0.00       0.0       0.0                           46155.1523
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
    0:00:28   35157.6      0.00       0.0       0.0                           45499.2852
    0:00:28   35157.6      0.00       0.0       0.0                           45499.2852
    0:00:28   35157.6      0.00       0.0       0.0                           45499.2852
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:29   35138.9      0.00       0.0       0.0                           45475.2305
    0:00:30   34724.2      0.00       0.0       0.0                           44671.2578
    0:00:30   34724.2      0.00       0.0       0.0                           44671.2578
    0:00:30   34724.2      0.00       0.0       0.0                           44671.2578
    0:00:30   34724.2      0.00       0.0       0.0                           44671.2578
    0:00:31   34573.0      0.00       0.0       0.0                           44425.2031
    0:00:31   34573.0      0.00       0.0       0.0                           44425.2031
    0:00:31   34573.0      0.00       0.0       0.0                           44425.2031
    0:00:31   34573.0      0.00       0.0       0.0                           44425.2031
    0:00:33   33937.9      0.00       0.0       0.0                           43268.3203
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W32_EW8_SW23'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_DW_1STAGE_syn.v'.
Writing ddc file './db/SINGLE/FPU_Multiplication_Function_DW_1STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_DW_1STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/SINGLE/FPU_Multiplication_Function_DW_1STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W32_EW8_SW23'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=9". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "EW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Simple_KOA_STAGE_2' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=24". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32,EW=8,SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W32' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W32 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W32' with
	the parameters "S=31". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W9 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   9   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'mult2' instantiated from design 'Simple_KOA_STAGE_2_SW24' with
	the parameters "SW=12". (HDL-193)

Inferred memory devices in process
	in routine mult2_SW12 line 27 in file
		'./source/mult2.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      DatO_reg       | Flip-flop |  24   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult2' instantiated from design 'Simple_KOA_STAGE_2_SW24' with
	the parameters "SW=13". (HDL-193)

Inferred memory devices in process
	in routine mult2_SW13 line 27 in file
		'./source/mult2.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      DatO_reg       | Flip-flop |  26   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Simple_KOA_STAGE_2_SW24' with
	the parameters "W=48". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W48 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  48   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "SWR=24,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W24 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW23' with
	the parameters "W=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W24 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=23". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W32 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W32'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S31'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'mult2_SW12'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W32_EW8_SW23'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (42 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/SINGLE/FPU_Multiplication_Function_KOA_2STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W32_EW8_SW23) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W32) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W23) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W8) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW24) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W24) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W24) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW23) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W23) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW24) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W24) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR24_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W24) #

#   Propagate Constraints from cell Sgf_operation/ (Simple_KOA_STAGE_2_SW24) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.EVEN1.finalreg/    \
(RegisterAdd_W48) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.EVEN1.middle/      \
(mult2_SW13) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.EVEN1.right/       \
(mult2_SW12_0) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.EVEN1.left/        \
(mult2_SW12_1) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW8) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W9) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/ (RegisterMult_W9) \
#

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W9) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W8) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W9) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W32) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S31_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S31_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W32) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W32_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W32_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:09:42 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             164
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        151
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W9', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W9', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 1. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW24', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[7]', 'D2[7]'', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[6]', 'D1[5]'', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[23]', 'Data_B_i[23]''.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[23]', 'Data_B_i[22]'', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[5]', 'Data_B_i[3]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[4]', 'Data_B_i[2]'', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[30]', 'Data_B[29]'', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[30]', 'Data_A[29]'', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[8]', 'Data_B[7]''.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[6]', 'Data_B[5]'', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[7]', 'D1[6]'', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[22]', 'D1[21]'', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 165 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W32_EW8_SW23'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.EVEN1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping 41 of 42 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W32_EW8_SW23'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W32_EW8_SW23'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W32_EW8_SW23'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:15   37268.6      0.90      11.9     450.3                           48741.6719
    0:00:15   37952.6      0.00       0.0     447.5                           49809.8633
    0:00:15   37952.6      0.00       0.0     447.5                           49809.8633
    0:00:16   37942.6      0.00       0.0     444.5                           49820.9922

  Beginning WLM Backend Optimization
  --------------------------------------
    0:00:18   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:19   37464.5      0.00       0.0     414.3                           49207.2031
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:00:21   39111.8      0.00       0.0       0.0                           51264.4297
    0:00:21   39111.8      0.00       0.0       0.0                           51264.4297


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:21   39111.8      0.00       0.0       0.0                           51264.4297
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
    0:00:24   37359.4      0.00       0.0       0.0                           48047.2656
    0:00:24   37359.4      0.00       0.0       0.0                           48047.2656
    0:00:24   37359.4      0.00       0.0       0.0                           48047.2656
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:24   37350.7      0.00       0.0       0.0                           48024.6797
    0:00:25   37126.1      0.00       0.0       0.0                           47785.8984
    0:00:25   37126.1      0.00       0.0       0.0                           47785.8984
    0:00:25   37126.1      0.00       0.0       0.0                           47785.8984
    0:00:26   37126.1      0.00       0.0       0.0                           47785.8984
    0:00:26   36898.6      0.00       0.0       0.0                           47476.6562
    0:00:26   36898.6      0.00       0.0       0.0                           47476.6562
    0:00:26   36898.6      0.00       0.0       0.0                           47476.6562
    0:00:26   36898.6      0.00       0.0       0.0                           47476.6562
    0:00:27   36329.8      0.00       0.0       0.0                           46642.5156
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W32_EW8_SW23'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_KOA_2STAGE_syn.v'.
Writing ddc file './db/SINGLE/FPU_Multiplication_Function_KOA_2STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_KOA_2STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/SINGLE/FPU_Multiplication_Function_KOA_2STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W32_EW8_SW23'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=9". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "EW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RecursiveKOA_STAGE_2' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=24". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "SW=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W32_EW8_SW23' with
	the parameters "W=32,EW=8,SW=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W32' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W32 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W32' with
	the parameters "S=31". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W9 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   9   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW8' with
	the parameters "W=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_2_SW24' with
	the parameters "SW=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_2_SW24' with
	the parameters "SW=13". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'RecursiveKOA_STAGE_2_SW24' with
	the parameters "W=48". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W48 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  48   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "SWR=24,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W24 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW23' with
	the parameters "W=23". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW24' with
	the parameters "W=24". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W24 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  24   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=8". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=23". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W32_EW8_SW23' with
	the parameters "W=32". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W32 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW12' with
	the parameters "SW=6". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW12' with
	the parameters "SW=7". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW13' with
	the parameters "SW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW6' with
	the parameters "SW=6". (HDL-193)

Inferred memory devices in process
	in routine mult_SW6 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  12   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW7' with
	the parameters "SW=7". (HDL-193)

Inferred memory devices in process
	in routine mult_SW7 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  14   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW8' with
	the parameters "SW=8". (HDL-193)

Inferred memory devices in process
	in routine mult_SW8 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  16   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W32'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S31'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'subRecursiveKOA_SW12'. (OPT-1056)
Information: Uniquified 5 instances of design 'subRecursiveKOA_SW6'. (OPT-1056)
Information: Uniquified 3 instances of design 'subRecursiveKOA_SW7'. (OPT-1056)
Information: Uniquified 5 instances of design 'mult_SW6'. (OPT-1056)
Information: Uniquified 3 instances of design 'mult_SW7'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W32_EW8_SW23'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (60 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W32_EW8_SW23.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/SINGLE/FPU_Multiplication_Function_RKOA_2STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W32_EW8_SW23) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W32) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W23) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W8) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW24) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W24) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W24) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW23) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W23) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW24) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W24) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR24_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W24) #

#   Propagate Constraints from cell Sgf_operation/ (RecursiveKOA_STAGE_2_SW24) \
#

#   Propagate Constraints from cell Sgf_operation/EVEN1.finalreg/              \
(RegisterAdd_W48) #

#   Propagate Constraints from cell Sgf_operation/EVEN1.middle/                \
(subRecursiveKOA_SW13) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle/ (subRecursiveKOA_SW8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_mult/ (mult_SW8) \
#

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right/ (subRecursiveKOA_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_mult/             \
(mult_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left/ (subRecursiveKOA_SW6_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_mult/ (mult_SW6_0) \
#

#   Propagate Constraints from cell Sgf_operation/EVEN1.right/                 \
(subRecursiveKOA_SW12_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle/ (subRecursiveKOA_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult/            \
(mult_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right/ (subRecursiveKOA_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_mult/             \
(mult_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left/ (subRecursiveKOA_SW6_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_mult/ (mult_SW6_2) \
#

#   Propagate Constraints from cell Sgf_operation/EVEN1.left/                  \
(subRecursiveKOA_SW12_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle/ (subRecursiveKOA_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult/             \
(mult_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right/ (subRecursiveKOA_SW6_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_mult/ (mult_SW6_3) \
#

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left/ (subRecursiveKOA_SW6_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_mult/ (mult_SW6_4)  \
#

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW8) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W9) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/ (RegisterMult_W9) \
#

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W9) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W8) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W9) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W32) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S31_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S31_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W32) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W32_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W32_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:10:16 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             164
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        151
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W9', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W9', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 1. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W32', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW8', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW24', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W32_EW8_SW23', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[7]', 'D2[7]'', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[6]', 'D1[5]'', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[23]', 'Data_B_i[23]''.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[23]', 'Data_B_i[22]'', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[5]', 'Data_B_i[3]'.
Warning: In design 'FPU_Multiplication_Function_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[4]', 'Data_B_i[2]'', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[30]', 'Data_B[29]'', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W32', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[30]', 'Data_A[29]'', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[8]', 'Data_B[7]''.
Warning: In design 'Exp_Operation_m_EW8', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[6]', 'Data_B[5]'', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[7]', 'D1[6]'', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W32_EW8_SW23', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[22]', 'D1[21]'', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 165 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W32_EW8_SW23'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping 59 of 60 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W32_EW8_SW23'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W32_EW8_SW23'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W32_EW8_SW23'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)
  Selecting critical implementations
  Mapping 'FPU_Multiplication_Function_W32_EW8_SW23_DW_mult_uns_1'
  Mapping 'FPU_Multiplication_Function_W32_EW8_SW23_DW_mult_uns_2'
  Mapping 'FPU_Multiplication_Function_W32_EW8_SW23_DP_OP_158J23_127_356_3'

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:25   61443.4      1.53      34.1     216.0                           83369.4922
    0:00:27   63224.6      0.00       0.0     229.7                           86271.6250
    0:00:27   63224.6      0.00       0.0     229.7                           86271.6250
    0:00:28   63125.3      0.00       0.0     235.6                           86160.5938

  Beginning WLM Backend Optimization
  --------------------------------------
    0:00:31   60747.8      0.00       0.0     215.7                           82490.2969
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:32   60088.3      0.00       0.0     215.1                           81370.8906
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:00:34   59150.9      0.00       0.0       0.0                           79892.9297
    0:00:34   59150.9      0.00       0.0       0.0                           79892.9297


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:34   59150.9      0.00       0.0       0.0                           79892.9297
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
    0:00:40   53850.2      0.00       0.0       0.0                           70578.4844
    0:00:40   53850.2      0.00       0.0       0.0                           70578.4844
    0:00:40   53850.2      0.00       0.0       0.0                           70578.4844
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:40   53799.8      0.00       0.0       0.0                           70474.8516

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:41   53799.8      0.00       0.0       0.0                           70474.8516
    0:00:42   52539.8      0.00       0.0       0.0                           68449.5234
    0:00:42   52539.8      0.00       0.0       0.0                           68449.5234
    0:00:42   52539.8      0.00       0.0       0.0                           68449.5234
    0:00:42   52537.0      0.00       0.0       0.0                           68444.3906
    0:00:43   52122.2      0.00       0.0       0.0                           67845.4531
    0:00:43   52122.2      0.00       0.0       0.0                           67845.4531
    0:00:43   52122.2      0.00       0.0       0.0                           67845.4531
    0:00:43   52122.2      0.00       0.0       0.0                           67845.4531
    0:00:45   50711.0      0.00       0.0       0.0                           65566.5938
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W32_EW8_SW23'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_RKOA_2STAGE_syn.v'.
Writing ddc file './db/SINGLE/FPU_Multiplication_Function_RKOA_2STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/SINGLE/FPU_Multiplication_Function_RKOA_2STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/SINGLE/FPU_Multiplication_Function_RKOA_2STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W64_EW11_SW52'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=12". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "EW=11". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Simple_KOA_STAGE_1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=53". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64,EW=11,SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W64' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W64 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W64' with
	the parameters "S=63". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W12 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'Simple_KOA_STAGE_1_SW53' with
	the parameters "SW=26". (HDL-193)

Inferred memory devices in process
	in routine mult_SW26 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  52   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'Simple_KOA_STAGE_1_SW53' with
	the parameters "SW=27". (HDL-193)

Inferred memory devices in process
	in routine mult_SW27 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  54   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'Simple_KOA_STAGE_1_SW53' with
	the parameters "SW=28". (HDL-193)

Inferred memory devices in process
	in routine mult_SW28 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  56   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Simple_KOA_STAGE_1_SW53' with
	the parameters "W=106". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W106 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  106  |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "SWR=53,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W53 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW52' with
	the parameters "W=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W53 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=52". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W64 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W64'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S63'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W64_EW11_SW52'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (43 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_KOA_1STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W64_EW11_SW52) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W64) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W52) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W11) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW53) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W53) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W53) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW52) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W52) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW53) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W53) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR53_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W53) #

#   Propagate Constraints from cell Sgf_operation/ (Simple_KOA_STAGE_1_SW53) #

#   Propagate Constraints from cell Sgf_operation/ODD1.finalreg/               \
(RegisterAdd_W106) #

#   Propagate Constraints from cell Sgf_operation/ODD1.middle/ (mult_SW28) #

#   Propagate Constraints from cell Sgf_operation/ODD1.right/ (mult_SW27) #

#   Propagate Constraints from cell Sgf_operation/ODD1.left/ (mult_SW26) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW11) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W12) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/                   \
(RegisterMult_W12) #

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W12) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W11) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W12) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W64) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S63_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S63_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W64) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W64_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W64_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:11:08 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             298
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        285
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W12', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W12', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[51]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[50]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[49]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[48]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[47]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[46]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[45]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[44]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[43]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[42]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[41]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[40]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[39]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[38]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[37]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[36]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[35]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[34]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[33]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[32]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[31]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[30]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[29]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[28]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[27]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[26]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[25]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[24]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW53', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[51]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[50]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[49]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[48]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[47]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[46]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[45]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[44]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[43]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[42]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[41]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[40]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[39]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[38]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[37]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[36]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[35]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[34]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[33]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[32]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[31]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[30]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[29]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[28]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[27]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[26]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[25]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[24]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[23]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[10]', 'D2[10]'', 'D2[9]', 'D2[8]', 'D2[7]', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[9]', 'D1[8]'', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[52]', 'Data_B_i[52]''.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[52]', 'Data_B_i[51]'', 'Data_B_i[50]', 'Data_B_i[49]', 'Data_B_i[48]', 'Data_B_i[47]', 'Data_B_i[46]', 'Data_B_i[45]', 'Data_B_i[44]', 'Data_B_i[43]', 'Data_B_i[42]', 'Data_B_i[41]', 'Data_B_i[40]', 'Data_B_i[39]', 'Data_B_i[38]', 'Data_B_i[37]', 'Data_B_i[36]', 'Data_B_i[35]', 'Data_B_i[34]', 'Data_B_i[33]', 'Data_B_i[32]', 'Data_B_i[31]', 'Data_B_i[30]', 'Data_B_i[29]', 'Data_B_i[28]', 'Data_B_i[27]', 'Data_B_i[26]', 'Data_B_i[25]', 'Data_B_i[24]', 'Data_B_i[23]', 'Data_B_i[22]', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[3]', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[5]', 'Data_B_i[4]'', 'Data_B_i[2]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[62]', 'Data_B[61]'', 'Data_B[60]', 'Data_B[59]', 'Data_B[58]', 'Data_B[57]', 'Data_B[56]', 'Data_B[55]', 'Data_B[54]', 'Data_B[53]', 'Data_B[52]', 'Data_B[51]', 'Data_B[50]', 'Data_B[49]', 'Data_B[48]', 'Data_B[47]', 'Data_B[46]', 'Data_B[45]', 'Data_B[44]', 'Data_B[43]', 'Data_B[42]', 'Data_B[41]', 'Data_B[40]', 'Data_B[39]', 'Data_B[38]', 'Data_B[37]', 'Data_B[36]', 'Data_B[35]', 'Data_B[34]', 'Data_B[33]', 'Data_B[32]', 'Data_B[31]', 'Data_B[30]', 'Data_B[29]', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[62]', 'Data_A[61]'', 'Data_A[60]', 'Data_A[59]', 'Data_A[58]', 'Data_A[57]', 'Data_A[56]', 'Data_A[55]', 'Data_A[54]', 'Data_A[53]', 'Data_A[52]', 'Data_A[51]', 'Data_A[50]', 'Data_A[49]', 'Data_A[48]', 'Data_A[47]', 'Data_A[46]', 'Data_A[45]', 'Data_A[44]', 'Data_A[43]', 'Data_A[42]', 'Data_A[41]', 'Data_A[40]', 'Data_A[39]', 'Data_A[38]', 'Data_A[37]', 'Data_A[36]', 'Data_A[35]', 'Data_A[34]', 'Data_A[33]', 'Data_A[32]', 'Data_A[31]', 'Data_A[30]', 'Data_A[29]', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[11]', 'Data_B[10]''.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[9]', 'Data_B[8]'', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[10]', 'D1[9]'', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[51]', 'D1[50]'', 'D1[49]', 'D1[48]', 'D1[47]', 'D1[46]', 'D1[45]', 'D1[44]', 'D1[43]', 'D1[42]', 'D1[41]', 'D1[40]', 'D1[39]', 'D1[38]', 'D1[37]', 'D1[36]', 'D1[35]', 'D1[34]', 'D1[33]', 'D1[32]', 'D1[31]', 'D1[30]', 'D1[29]', 'D1[28]', 'D1[27]', 'D1[26]', 'D1[25]', 'D1[24]', 'D1[23]', 'D1[22]', 'D1[21]', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 299 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W64_EW11_SW52'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping 41 of 42 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W64_EW11_SW52'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W64_EW11_SW52'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W64_EW11_SW52'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:40  126485.3      1.95     195.5     252.5                           169761.9844
  Mapping 'FPU_Multiplication_Function_W64_EW11_SW52_DP_OP_169J24_123_4229_1'
    0:00:58  138121.9      0.00       0.0     496.9                           190076.2812
    0:00:58  138121.9      0.00       0.0     496.9                           190076.2812
    0:00:59  138080.2      0.00       0.0     496.9                           190013.1562

  Beginning WLM Backend Optimization
  --------------------------------------
    0:01:10  136355.0      0.05       1.6     495.4                           187626.0938
    0:01:11  136435.7      0.01       0.0     497.9                           187670.9688
    0:01:12  136180.8      0.01       0.0     497.2                           187239.5625
    0:01:12  136180.8      0.01       0.0     497.2                           187239.5625
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:14  136392.5      0.00       0.0     497.7                           187509.2188
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:01:18  137364.5      0.55      18.8      32.8 net848638                 188864.2344
    0:01:21  138494.9      0.00       0.0       0.0                           190767.9375
    0:01:21  138494.9      0.00       0.0       0.0                           190767.9375


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:21  138494.9      0.00       0.0       0.0                           190767.9375
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
  Global Optimization (Phase 51)
    0:01:39  142289.3      0.00       0.0       0.0                           198476.5938
    0:01:39  142289.3      0.00       0.0       0.0                           198476.5938
    0:01:39  142289.3      0.00       0.0       0.0                           198476.5938
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:44  138772.8      0.00       0.0       0.0                           191162.0469
    0:01:44  138772.8      0.00       0.0       0.0                           191162.0469
    0:01:44  138772.8      0.00       0.0       0.0                           191162.0469
    0:01:45  138741.1      0.00       0.0       0.0                           191093.7812
    0:01:48  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:48  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:49  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:49  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:55  132279.8      0.00       0.0       0.0                           179659.1094
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W64_EW11_SW52'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_KOA_1STAGE_syn.v'.
Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_KOA_1STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_KOA_1STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/FPU_Multiplication_Function_KOA_1STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W64_EW11_SW52'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=12". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "EW=11". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RecursiveKOA_STAGE_1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=53". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64,EW=11,SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W64' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W64 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W64' with
	the parameters "S=63". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W12 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_1_SW53' with
	the parameters "SW=26". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_1_SW53' with
	the parameters "SW=27". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_1_SW53' with
	the parameters "SW=28". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'RecursiveKOA_STAGE_1_SW53' with
	the parameters "W=106". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W106 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  106  |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "SWR=53,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W53 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW52' with
	the parameters "W=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W53 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=52". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W64 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW26' with
	the parameters "SW=13". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW26' with
	the parameters "SW=14". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW27' with
	the parameters "SW=15". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW13' with
	the parameters "SW=6". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW13' with
	the parameters "SW=7". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW13' with
	the parameters "SW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'csubRecursiveKOA' instantiated from design 'csubRecursiveKOA_SW15' with
	the parameters "SW=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW6' with
	the parameters "SW=6". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW7' with
	the parameters "SW=7". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW8' with
	the parameters "SW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'cmult' instantiated from design 'csubRecursiveKOA_SW9' with
	the parameters "SW=9". (HDL-193)
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W64'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S63'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)
Information: Uniquified 3 instances of design 'csubRecursiveKOA_SW13'. (OPT-1056)
Information: Uniquified 4 instances of design 'csubRecursiveKOA_SW14'. (OPT-1056)
Information: Uniquified 2 instances of design 'csubRecursiveKOA_SW15'. (OPT-1056)
Information: Uniquified 3 instances of design 'csubRecursiveKOA_SW6'. (OPT-1056)
Information: Uniquified 13 instances of design 'csubRecursiveKOA_SW7'. (OPT-1056)
Information: Uniquified 9 instances of design 'csubRecursiveKOA_SW8'. (OPT-1056)
Information: Uniquified 2 instances of design 'csubRecursiveKOA_SW9'. (OPT-1056)
Information: Uniquified 3 instances of design 'cmult_SW6'. (OPT-1056)
Information: Uniquified 13 instances of design 'cmult_SW7'. (OPT-1056)
Information: Uniquified 9 instances of design 'cmult_SW8'. (OPT-1056)
Information: Uniquified 2 instances of design 'cmult_SW9'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W64_EW11_SW52'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (106 designs)             /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_RKOA_1STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W64_EW11_SW52) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W64) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W52) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W11) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW53) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W53) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W53) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW52) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W52) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW53) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W53) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR53_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W53) #

#   Propagate Constraints from cell Sgf_operation/ (RecursiveKOA_STAGE_1_SW53) \
#

#   Propagate Constraints from cell Sgf_operation/ODD1.finalreg/               \
(RegisterAdd_W106) #

#   Propagate Constraints from cell Sgf_operation/ODD1.middle/                 \
(csubRecursiveKOA_SW28) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/ (csubRecursiveKOA_SW15_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle/        \
(csubRecursiveKOA_SW9_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult/ \
(cmult_SW9_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right/         \
(csubRecursiveKOA_SW8_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_cmult/ \
(cmult_SW8_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left/          \
(csubRecursiveKOA_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_cmult/ \
(cmult_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/ (csubRecursiveKOA_SW14_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle/        \
(csubRecursiveKOA_SW8_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right/         \
(csubRecursiveKOA_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left/          \
(csubRecursiveKOA_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult/ \
(cmult_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/ (csubRecursiveKOA_SW14_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle/         \
(csubRecursiveKOA_SW8_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right/          \
(csubRecursiveKOA_SW7_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left/           \
(csubRecursiveKOA_SW7_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult/ \
(cmult_SW7_4) #

#   Propagate Constraints from cell Sgf_operation/ODD1.right/                  \
(csubRecursiveKOA_SW27) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/ (csubRecursiveKOA_SW15_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle/          \
(csubRecursiveKOA_SW9_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult/ \
(cmult_SW9_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right/           \
(csubRecursiveKOA_SW8_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_cmult/ \
(cmult_SW8_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left/            \
(csubRecursiveKOA_SW7_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_cmult/ \
(cmult_SW7_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/ (csubRecursiveKOA_SW14_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle/          \
(csubRecursiveKOA_SW8_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right/           \
(csubRecursiveKOA_SW7_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left/            \
(csubRecursiveKOA_SW7_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult/ \
(cmult_SW7_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/ (csubRecursiveKOA_SW13_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle/            \
(csubRecursiveKOA_SW8_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right/             \
(csubRecursiveKOA_SW7_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left/              \
(csubRecursiveKOA_SW6_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left/GENSTOP.inst_cmult/ \
(cmult_SW6_0) #

#   Propagate Constraints from cell Sgf_operation/ODD1.left/                   \
(csubRecursiveKOA_SW26) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/ (csubRecursiveKOA_SW14_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle/         \
(csubRecursiveKOA_SW8_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right/          \
(csubRecursiveKOA_SW7_9) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_9) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left/           \
(csubRecursiveKOA_SW7_10) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult/ \
(cmult_SW7_10) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/ (csubRecursiveKOA_SW13_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle/           \
(csubRecursiveKOA_SW8_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right/            \
(csubRecursiveKOA_SW7_11) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_11) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left/             \
(csubRecursiveKOA_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left/GENSTOP.inst_cmult/ \
(cmult_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/ (csubRecursiveKOA_SW13_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle/            \
(csubRecursiveKOA_SW8_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult/ \
(cmult_SW8_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right/             \
(csubRecursiveKOA_SW7_12) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right/GENSTOP.inst_cmult/ \
(cmult_SW7_12) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left/              \
(csubRecursiveKOA_SW6_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left/GENSTOP.inst_cmult/ \
(cmult_SW6_2) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW11) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W12) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/                   \
(RegisterMult_W12) #

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W12) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W11) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W12) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W64) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S63_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S63_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W64) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W64_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W64_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:13:15 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             298
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        285
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W12', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W12', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[51]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[50]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[49]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[48]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[47]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[46]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[45]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[44]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[43]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[42]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[41]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[40]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[39]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[38]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[37]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[36]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[35]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[34]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[33]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[32]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[31]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[30]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[29]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[28]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[27]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[26]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[25]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[24]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW53', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[51]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[50]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[49]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[48]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[47]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[46]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[45]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[44]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[43]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[42]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[41]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[40]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[39]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[38]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[37]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[36]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[35]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[34]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[33]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[32]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[31]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[30]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[29]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[28]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[27]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[26]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[25]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[24]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[23]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[10]', 'D2[10]'', 'D2[9]', 'D2[8]', 'D2[7]', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[9]', 'D1[8]'', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[52]', 'Data_B_i[52]''.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[52]', 'Data_B_i[51]'', 'Data_B_i[50]', 'Data_B_i[49]', 'Data_B_i[48]', 'Data_B_i[47]', 'Data_B_i[46]', 'Data_B_i[45]', 'Data_B_i[44]', 'Data_B_i[43]', 'Data_B_i[42]', 'Data_B_i[41]', 'Data_B_i[40]', 'Data_B_i[39]', 'Data_B_i[38]', 'Data_B_i[37]', 'Data_B_i[36]', 'Data_B_i[35]', 'Data_B_i[34]', 'Data_B_i[33]', 'Data_B_i[32]', 'Data_B_i[31]', 'Data_B_i[30]', 'Data_B_i[29]', 'Data_B_i[28]', 'Data_B_i[27]', 'Data_B_i[26]', 'Data_B_i[25]', 'Data_B_i[24]', 'Data_B_i[23]', 'Data_B_i[22]', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[3]', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[5]', 'Data_B_i[4]'', 'Data_B_i[2]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[62]', 'Data_B[61]'', 'Data_B[60]', 'Data_B[59]', 'Data_B[58]', 'Data_B[57]', 'Data_B[56]', 'Data_B[55]', 'Data_B[54]', 'Data_B[53]', 'Data_B[52]', 'Data_B[51]', 'Data_B[50]', 'Data_B[49]', 'Data_B[48]', 'Data_B[47]', 'Data_B[46]', 'Data_B[45]', 'Data_B[44]', 'Data_B[43]', 'Data_B[42]', 'Data_B[41]', 'Data_B[40]', 'Data_B[39]', 'Data_B[38]', 'Data_B[37]', 'Data_B[36]', 'Data_B[35]', 'Data_B[34]', 'Data_B[33]', 'Data_B[32]', 'Data_B[31]', 'Data_B[30]', 'Data_B[29]', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[62]', 'Data_A[61]'', 'Data_A[60]', 'Data_A[59]', 'Data_A[58]', 'Data_A[57]', 'Data_A[56]', 'Data_A[55]', 'Data_A[54]', 'Data_A[53]', 'Data_A[52]', 'Data_A[51]', 'Data_A[50]', 'Data_A[49]', 'Data_A[48]', 'Data_A[47]', 'Data_A[46]', 'Data_A[45]', 'Data_A[44]', 'Data_A[43]', 'Data_A[42]', 'Data_A[41]', 'Data_A[40]', 'Data_A[39]', 'Data_A[38]', 'Data_A[37]', 'Data_A[36]', 'Data_A[35]', 'Data_A[34]', 'Data_A[33]', 'Data_A[32]', 'Data_A[31]', 'Data_A[30]', 'Data_A[29]', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[11]', 'Data_B[10]''.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[9]', 'Data_B[8]'', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[10]', 'D1[9]'', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[51]', 'D1[50]'', 'D1[49]', 'D1[48]', 'D1[47]', 'D1[46]', 'D1[45]', 'D1[44]', 'D1[43]', 'D1[42]', 'D1[41]', 'D1[40]', 'D1[39]', 'D1[38]', 'D1[37]', 'D1[36]', 'D1[35]', 'D1[34]', 'D1[33]', 'D1[32]', 'D1[31]', 'D1[30]', 'D1[29]', 'D1[28]', 'D1[27]', 'D1[26]', 'D1[25]', 'D1[24]', 'D1[23]', 'D1[22]', 'D1[21]', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 299 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W64_EW11_SW52'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_cmult before Pass 1 (OPT-776)
Information: Ungrouping 104 of 105 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W64_EW11_SW52'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W64_EW11_SW52'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W64_EW11_SW52'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:03:39  382796.6      3.99    1082.9     819.8                           586380.3750
    0:03:39  382796.6      3.99    1082.9     819.8                           586380.3750

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------
    0:04:04  267514.6      5.48    1239.0     371.9                           381994.7812
    0:04:28  283223.5      2.08     525.0     312.9                           410222.2188
    0:04:28  283223.5      2.08     525.0     312.9                           410222.2188
    0:04:32  283633.9      2.07     527.4     328.9                           410746.4062

  Beginning WLM Backend Optimization
  --------------------------------------
    0:04:46  279786.2      2.38     562.0     302.9                           405263.7500
    0:04:49  280399.7      2.08     505.6     295.3                           408715.2500
    0:04:51  283223.5      2.08     478.3     293.1                           414732.1250
    0:04:54  283390.6      2.08     473.1     292.2                           415099.0938
    0:04:54  283390.6      2.08     473.1     292.2                           415099.0938
    0:05:31  297673.9      1.81     451.2     288.7                           435942.0000
    0:05:31  297673.9      1.81     451.2     288.7                           435942.0000
    0:05:33  300080.2      1.71     424.4     289.7                           440505.9062
    0:05:33  300080.2      1.71     424.4     289.7                           440505.9062
    0:06:28  312495.8      1.72     381.6     292.7                           458275.2188
    0:06:28  312495.8      1.72     381.6     292.7                           458275.2188
    0:07:02  320555.5      1.16     280.0     263.6                           472681.6875
    0:07:02  320555.5      1.16     280.0     263.6                           472681.6875
    0:08:00  329673.6      1.12     271.1     261.7                           485112.2188
    0:08:00  329673.6      1.12     271.1     261.7                           485112.2188
    0:08:44  336404.2      0.87     202.7     249.1                           497318.8750
    0:08:44  336404.2      0.87     202.7     249.1                           497318.8750
    0:09:37  342603.4      0.85     199.4     247.7                           505323.5312
    0:09:37  342603.4      0.85     199.4     247.7                           505323.5312
    0:09:46  343039.7      0.84     194.8     247.8                           506172.4688
    0:09:46  343039.7      0.84     194.8     247.8                           506172.4688
    0:10:39  347960.2      0.90     198.0     266.3                           513108.1562


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:10:39  347960.2      0.90     198.0     266.3                           513108.1562
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:10:44  350638.6      0.90     191.4       6.0 DP_OP_340J25_124_618/R_4977/D 517118.0938
    0:10:48  352288.8      0.79     178.2       6.0 DP_OP_340J25_124_618/R_4977/D 521035.7812
    0:10:51  352693.4      0.77     174.2       6.0 add_x_19/R_5270_RW_2/D    522031.5625
    0:10:53  353004.5      0.75     171.1       6.0 add_x_23/R_6777/D         522840.2500
    0:10:55  353266.6      0.74     165.9       0.0 add_x_19/R_5270_RW_2/D    523467.7188
    0:10:58  353615.0      0.73     163.4       0.0 add_x_19/R_5270_RW_2/D    524351.2500
    0:11:00  353720.2      0.73     161.5       0.0 DP_OP_340J25_124_618/R_4977/D 524640.1875
    0:11:02  354247.2      0.71     159.2       0.0 DP_OP_340J25_124_618/R_4977/D 525846.4375
    0:11:04  354598.6      0.71     158.2       0.0 R_6248/D                  526567.2500
    0:11:06  354899.5      0.70     157.1       0.0 DP_OP_340J25_124_618/R_5224_RW_0/D 527247.5625
    0:11:08  355053.6      0.69     155.7       0.0 DP_OP_340J25_124_618/R_4977/D 527464.5625
    0:11:10  355194.7      0.68     154.2       0.0 add_x_19/R_5270_RW_2/D    527689.8750
    0:11:12  355540.3      0.68     146.6       0.0 add_x_19/R_5270_RW_2/D    528485.7500
    0:11:13  355749.1      0.67     145.1       0.0 add_x_19/R_5651_RW_0/D    528929.5000
    0:11:15  355861.4      0.66     143.2       0.0 DP_OP_340J25_124_618/R_4977/D 529140.8125
    0:11:17  356067.4      0.65     142.2       0.0 add_x_24/R_5357/D         529618.8750
    0:11:19  356356.8      0.65     140.9       0.0 add_x_19/R_4937_RW_1/D    530224.3125
    0:11:21  356558.4      0.64     139.8       0.0 DP_OP_340J25_124_618/R_5224_RW_0/D 530653.3125
    0:11:23  356554.1      0.64     138.5       0.0 DP_OP_340J25_124_618/R_4977/D 530674.6875
    0:11:24  356459.0      0.63     137.6       0.0 add_x_19/R_5270_RW_2/D    530497.9375
    0:11:26  356548.3      0.63     136.9       0.0 add_x_19/R_5270_RW_2/D    530764.3750
    0:11:27  356582.9      0.63     136.7       0.0 add_x_23/R_5187_RW_1/D    530819.8750
    0:11:28  356657.8      0.62     136.3       0.0                           530956.8750
    0:12:19  361681.9      0.72     142.1       1.1                           537485.1250


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:12:19  361681.9      0.72     142.1       1.1                           537485.1250
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
  Global Optimization (Phase 51)
  Global Optimization (Phase 52)
  Global Optimization (Phase 53)
  Global Optimization (Phase 54)
  Global Optimization (Phase 55)
  Global Optimization (Phase 56)
  Global Optimization (Phase 57)
  Global Optimization (Phase 58)
  Global Optimization (Phase 59)
  Global Optimization (Phase 60)
  Global Optimization (Phase 61)
  Global Optimization (Phase 62)
  Global Optimization (Phase 63)
  Global Optimization (Phase 64)
  Global Optimization (Phase 65)
  Global Optimization (Phase 66)
  Global Optimization (Phase 67)
  Global Optimization (Phase 68)
  Global Optimization (Phase 69)
  Global Optimization (Phase 70)
  Global Optimization (Phase 71)
  Global Optimization (Phase 72)
  Global Optimization (Phase 73)
    0:13:33  335524.3      0.54      94.5      31.5 add_x_23/R_6776/D         495960.9062
    0:13:35  335731.7      0.53      92.8      31.0 DP_OP_340J25_124_618/R_4977/D 496380.7188
    0:13:36  335751.8      0.52      92.6      31.0                           496446.8750
    0:14:33  342447.8      0.57      88.7      33.1                           505952.5000
    0:14:33  342447.8      0.57      88.7      33.1                           505952.5000
    0:14:36  340233.1      0.56      84.2      32.6                           502547.4062
    0:14:36  340233.1      0.56      84.2      32.6                           502547.4062
    0:15:26  346367.5      0.52      79.1      33.7                           511125.9375
    0:15:26  346367.5      0.52      79.1      33.7                           511125.9375
    0:15:27  346533.1      0.51      78.8      33.7                           511434.6250
    0:15:27  346533.1      0.51      78.8      33.7                           511434.6250
    0:15:56  348111.4      0.49      77.3      33.7                           513619.0938
    0:15:56  348111.4      0.49      77.3      33.7                           513619.0938
    0:16:18  349898.4      0.41      60.3      35.0                           516640.4062
    0:16:18  349898.4      0.41      60.3      35.0                           516640.4062
    0:16:20  349907.0      0.41      60.4      35.0                           516645.5000
    0:16:20  349907.0      0.41      60.4      35.0                           516645.5000
    0:16:31  350665.9      0.40      56.6      35.0                           517962.8125
    0:16:31  350665.9      0.40      56.6      35.0                           517962.8125
    0:16:32  350665.9      0.40      56.6      35.0                           517962.8125
    0:16:32  350665.9      0.40      56.6      35.0                           517962.8125
    0:16:33  350665.9      0.40      56.6      35.0                           517962.8125
    0:16:33  350665.9      0.40      56.6      35.0                           517962.8125
    0:16:34  350665.9      0.40      56.6      35.0                           517962.8125

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:16:35  350628.5      0.40      56.6      35.0                           517931.3750
    0:16:41  340103.5      0.42      52.0      33.9                           500619.4062
    0:16:43  339887.5      0.39      49.8      34.0                           500489.9375
    0:16:43  339887.5      0.39      49.8      34.0                           500489.9375
    0:16:43  339887.5      0.39      49.8      34.0                           500489.9375
    0:16:46  339825.6      0.39      47.3      33.7                           500501.8125
    0:16:48  337759.2      0.39      47.3      33.6                           497684.5938
    0:16:50  336888.0      0.39      47.3       0.0 DP_OP_340J25_124_618/R_5224_RW_0/D 495988.8125
    0:16:53  337219.2      0.38      45.9       0.0 add_x_24/R_5215_RW_2/D    496568.0625
    0:16:54  337377.6      0.37      45.0       0.1 add_x_24/R_5215_RW_2/D    496808.0312
    0:16:56  337576.3      0.37      44.3       0.2 DP_OP_340J25_124_618/R_4977/D 497168.9688
    0:16:57  337559.0      0.37      44.3       0.0                           497127.8438
    0:17:21  338523.8      0.36      42.6       0.1                           498732.4688
    0:17:23  338578.6      0.35      41.0       0.1                           498914.8125
    0:17:23  338616.0      0.35      41.0       0.1                           498963.7188
    0:17:37  325980.0      0.35      41.0       0.0                           476861.4062
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Warning: Design 'FPU_Multiplication_Function_W64_EW11_SW52' contains 1 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)
     Net 'clk': 1204 load(s), 1 driver(s)
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W64_EW11_SW52'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_RKOA_1STAGE_syn.v'.
Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_RKOA_1STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_RKOA_1STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/FPU_Multiplication_Function_RKOA_1STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W64_EW11_SW52'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=12". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "EW=11". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'DW_mult' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=53". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64,EW=11,SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W64' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W64 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W64' with
	the parameters "S=63". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W12 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'DW_mult_SW53' with
	the parameters "W=106". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W106 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  106  |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "SWR=53,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W53 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW52' with
	the parameters "W=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W53 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=52". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W64 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W64'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S63'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W64_EW11_SW52'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (40 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_DW_1STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W64_EW11_SW52) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W64) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W52) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W11) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW53) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W53) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W53) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW52) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W52) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW53) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W53) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR53_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W53) #

#   Propagate Constraints from cell Sgf_operation/ (DW_mult_SW53) #

#   Propagate Constraints from cell Sgf_operation/finalreg/ (RegisterAdd_W106) \
#

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW11) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W12) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/                   \
(RegisterMult_W12) #

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W12) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W11) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W12) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W64) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S63_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S63_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W64) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W64_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W64_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:31:09 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             298
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        285
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W12', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W12', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[51]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[50]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[49]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[48]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[47]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[46]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[45]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[44]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[43]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[42]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[41]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[40]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[39]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[38]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[37]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[36]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[35]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[34]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[33]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[32]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[31]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[30]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[29]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[28]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[27]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[26]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[25]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[24]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW53', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[51]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[50]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[49]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[48]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[47]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[46]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[45]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[44]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[43]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[42]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[41]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[40]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[39]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[38]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[37]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[36]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[35]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[34]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[33]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[32]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[31]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[30]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[29]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[28]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[27]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[26]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[25]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[24]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[23]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[10]', 'D2[10]'', 'D2[9]', 'D2[8]', 'D2[7]', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[9]', 'D1[8]'', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[52]', 'Data_B_i[52]''.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[52]', 'Data_B_i[51]'', 'Data_B_i[50]', 'Data_B_i[49]', 'Data_B_i[48]', 'Data_B_i[47]', 'Data_B_i[46]', 'Data_B_i[45]', 'Data_B_i[44]', 'Data_B_i[43]', 'Data_B_i[42]', 'Data_B_i[41]', 'Data_B_i[40]', 'Data_B_i[39]', 'Data_B_i[38]', 'Data_B_i[37]', 'Data_B_i[36]', 'Data_B_i[35]', 'Data_B_i[34]', 'Data_B_i[33]', 'Data_B_i[32]', 'Data_B_i[31]', 'Data_B_i[30]', 'Data_B_i[29]', 'Data_B_i[28]', 'Data_B_i[27]', 'Data_B_i[26]', 'Data_B_i[25]', 'Data_B_i[24]', 'Data_B_i[23]', 'Data_B_i[22]', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[3]', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[5]', 'Data_B_i[4]'', 'Data_B_i[2]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[62]', 'Data_B[61]'', 'Data_B[60]', 'Data_B[59]', 'Data_B[58]', 'Data_B[57]', 'Data_B[56]', 'Data_B[55]', 'Data_B[54]', 'Data_B[53]', 'Data_B[52]', 'Data_B[51]', 'Data_B[50]', 'Data_B[49]', 'Data_B[48]', 'Data_B[47]', 'Data_B[46]', 'Data_B[45]', 'Data_B[44]', 'Data_B[43]', 'Data_B[42]', 'Data_B[41]', 'Data_B[40]', 'Data_B[39]', 'Data_B[38]', 'Data_B[37]', 'Data_B[36]', 'Data_B[35]', 'Data_B[34]', 'Data_B[33]', 'Data_B[32]', 'Data_B[31]', 'Data_B[30]', 'Data_B[29]', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[62]', 'Data_A[61]'', 'Data_A[60]', 'Data_A[59]', 'Data_A[58]', 'Data_A[57]', 'Data_A[56]', 'Data_A[55]', 'Data_A[54]', 'Data_A[53]', 'Data_A[52]', 'Data_A[51]', 'Data_A[50]', 'Data_A[49]', 'Data_A[48]', 'Data_A[47]', 'Data_A[46]', 'Data_A[45]', 'Data_A[44]', 'Data_A[43]', 'Data_A[42]', 'Data_A[41]', 'Data_A[40]', 'Data_A[39]', 'Data_A[38]', 'Data_A[37]', 'Data_A[36]', 'Data_A[35]', 'Data_A[34]', 'Data_A[33]', 'Data_A[32]', 'Data_A[31]', 'Data_A[30]', 'Data_A[29]', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[11]', 'Data_B[10]''.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[9]', 'Data_B[8]'', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[10]', 'D1[9]'', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[51]', 'D1[50]'', 'D1[49]', 'D1[48]', 'D1[47]', 'D1[46]', 'D1[45]', 'D1[44]', 'D1[43]', 'D1[42]', 'D1[41]', 'D1[40]', 'D1[39]', 'D1[38]', 'D1[37]', 'D1[36]', 'D1[35]', 'D1[34]', 'D1[33]', 'D1[32]', 'D1[31]', 'D1[30]', 'D1[29]', 'D1[28]', 'D1[27]', 'D1[26]', 'D1[25]', 'D1[24]', 'D1[23]', 'D1[22]', 'D1[21]', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 299 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W64_EW11_SW52'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping 37 of 39 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W64_EW11_SW52'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W64_EW11_SW52'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W64_EW11_SW52'.
  Processing 'DW_mult_SW53'
 Implement Synthetic for 'DW_mult_SW53'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
Information: Ungrouping hierarchy Sgf_operation 'DW_mult_SW53' #insts = 214. (OPT-777)
  Mapping Optimization (Phase 1)
  Mapping Optimization (Phase 2)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:41  119328.5      2.65     169.3     137.1                           182156.1250
  Mapping 'FPU_Multiplication_Function_W64_EW11_SW52_DW_mult_uns_1'
  Mapping 'FPU_Multiplication_Function_W64_EW11_SW52_DW01_add_2'
    0:01:02  131402.9      0.39      24.6     814.3                           203309.5156
    0:01:02  131402.9      0.39      24.6     814.3                           203309.5156
    0:01:03  132233.8      0.30      14.1     783.3                           204896.1719

  Beginning WLM Backend Optimization
  --------------------------------------
    0:01:15  135161.3      0.04       1.0     779.9                           210543.0469
    0:01:17  135347.0      0.02       0.1     780.6                           210792.9531
    0:01:18  135283.7      0.02       0.2     778.4                           210790.7188
    0:01:18  135283.7      0.02       0.2     778.4                           210790.7188
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:20  135944.6      0.00       0.0     784.1                           211818.8125
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:01:25  137286.7      0.15       5.5      46.0 net1016045                213844.6250
    0:01:27  137857.0      0.00       0.0       0.0                           214541.6719
    0:01:27  137857.0      0.00       0.0       0.0                           214541.6719


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:27  137857.0      0.00       0.0       0.0                           214541.6719
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
  Global Optimization (Phase 51)
    0:01:45  150289.9      0.00       0.0       0.0                           238058.7812
    0:01:45  150289.9      0.00       0.0       0.0                           238058.7812
    0:01:45  150289.9      0.00       0.0       0.0                           238058.7812
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:47  149330.9      0.00       0.0       0.0                           236013.5938
    0:01:50  143615.5      0.00       0.0       0.0                           223741.0312
    0:01:50  143615.5      0.00       0.0       0.0                           223741.0312
    0:01:50  143615.5      0.00       0.0       0.0                           223741.0312
    0:01:51  143614.1      0.00       0.0       0.0                           223738.1719
    0:01:55  141421.0      0.00       0.0       0.0                           219738.8281
    0:01:55  141421.0      0.00       0.0       0.0                           219738.8281
    0:01:55  141421.0      0.00       0.0       0.0                           219738.8281
    0:01:55  141421.0      0.00       0.0       0.0                           219738.8281
    0:02:02  134465.8      0.00       0.0       0.0                           206884.9688
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W64_EW11_SW52'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_DW_1STAGE_syn.v'.
Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_DW_1STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_DW_1STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/FPU_Multiplication_Function_DW_1STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W64_EW11_SW52'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=12". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "EW=11". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Simple_KOA_STAGE_2' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=53". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64,EW=11,SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W64' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W64 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W64' with
	the parameters "S=63". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W12 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'mult2' instantiated from design 'Simple_KOA_STAGE_2_SW53' with
	the parameters "SW=26". (HDL-193)

Inferred memory devices in process
	in routine mult2_SW26 line 27 in file
		'./source/mult2.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      DatO_reg       | Flip-flop |  52   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult2' instantiated from design 'Simple_KOA_STAGE_2_SW53' with
	the parameters "SW=27". (HDL-193)

Inferred memory devices in process
	in routine mult2_SW27 line 27 in file
		'./source/mult2.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      DatO_reg       | Flip-flop |  54   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult2' instantiated from design 'Simple_KOA_STAGE_2_SW53' with
	the parameters "SW=28". (HDL-193)

Inferred memory devices in process
	in routine mult2_SW28 line 27 in file
		'./source/mult2.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      DatO_reg       | Flip-flop |  56   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Simple_KOA_STAGE_2_SW53' with
	the parameters "W=106". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W106 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  106  |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "SWR=53,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W53 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW52' with
	the parameters "W=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W53 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=52". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W64 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W64'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S63'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W64_EW11_SW52'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (43 designs)              /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_KOA_2STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W64_EW11_SW52) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W64) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W52) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W11) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW53) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W53) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W53) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW52) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W52) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW53) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W53) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR53_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W53) #

#   Propagate Constraints from cell Sgf_operation/ (Simple_KOA_STAGE_2_SW53) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.ODD1.finalreg/     \
(RegisterAdd_W106) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.ODD1.middle/       \
(mult2_SW28) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.ODD1.right/        \
(mult2_SW27) #

#   Propagate Constraints from cell Sgf_operation/RECURSIVE.ODD1.left/         \
(mult2_SW26) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW11) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W12) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/                   \
(RegisterMult_W12) #

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W12) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W11) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W12) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W64) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S63_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S63_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W64) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W64_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W64_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:33:22 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             298
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        285
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W12', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W12', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[51]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[50]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[49]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[48]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[47]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[46]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[45]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[44]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[43]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[42]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[41]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[40]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[39]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[38]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[37]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[36]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[35]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[34]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[33]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[32]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[31]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[30]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[29]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[28]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[27]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[26]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[25]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[24]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW53', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[51]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[50]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[49]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[48]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[47]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[46]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[45]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[44]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[43]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[42]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[41]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[40]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[39]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[38]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[37]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[36]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[35]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[34]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[33]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[32]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[31]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[30]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[29]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[28]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[27]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[26]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[25]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[24]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[23]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[10]', 'D2[10]'', 'D2[9]', 'D2[8]', 'D2[7]', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[9]', 'D1[8]'', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[52]', 'Data_B_i[52]''.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[52]', 'Data_B_i[51]'', 'Data_B_i[50]', 'Data_B_i[49]', 'Data_B_i[48]', 'Data_B_i[47]', 'Data_B_i[46]', 'Data_B_i[45]', 'Data_B_i[44]', 'Data_B_i[43]', 'Data_B_i[42]', 'Data_B_i[41]', 'Data_B_i[40]', 'Data_B_i[39]', 'Data_B_i[38]', 'Data_B_i[37]', 'Data_B_i[36]', 'Data_B_i[35]', 'Data_B_i[34]', 'Data_B_i[33]', 'Data_B_i[32]', 'Data_B_i[31]', 'Data_B_i[30]', 'Data_B_i[29]', 'Data_B_i[28]', 'Data_B_i[27]', 'Data_B_i[26]', 'Data_B_i[25]', 'Data_B_i[24]', 'Data_B_i[23]', 'Data_B_i[22]', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[3]', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[5]', 'Data_B_i[4]'', 'Data_B_i[2]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[62]', 'Data_B[61]'', 'Data_B[60]', 'Data_B[59]', 'Data_B[58]', 'Data_B[57]', 'Data_B[56]', 'Data_B[55]', 'Data_B[54]', 'Data_B[53]', 'Data_B[52]', 'Data_B[51]', 'Data_B[50]', 'Data_B[49]', 'Data_B[48]', 'Data_B[47]', 'Data_B[46]', 'Data_B[45]', 'Data_B[44]', 'Data_B[43]', 'Data_B[42]', 'Data_B[41]', 'Data_B[40]', 'Data_B[39]', 'Data_B[38]', 'Data_B[37]', 'Data_B[36]', 'Data_B[35]', 'Data_B[34]', 'Data_B[33]', 'Data_B[32]', 'Data_B[31]', 'Data_B[30]', 'Data_B[29]', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[62]', 'Data_A[61]'', 'Data_A[60]', 'Data_A[59]', 'Data_A[58]', 'Data_A[57]', 'Data_A[56]', 'Data_A[55]', 'Data_A[54]', 'Data_A[53]', 'Data_A[52]', 'Data_A[51]', 'Data_A[50]', 'Data_A[49]', 'Data_A[48]', 'Data_A[47]', 'Data_A[46]', 'Data_A[45]', 'Data_A[44]', 'Data_A[43]', 'Data_A[42]', 'Data_A[41]', 'Data_A[40]', 'Data_A[39]', 'Data_A[38]', 'Data_A[37]', 'Data_A[36]', 'Data_A[35]', 'Data_A[34]', 'Data_A[33]', 'Data_A[32]', 'Data_A[31]', 'Data_A[30]', 'Data_A[29]', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[11]', 'Data_B[10]''.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[9]', 'Data_B[8]'', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[10]', 'D1[9]'', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[51]', 'D1[50]'', 'D1[49]', 'D1[48]', 'D1[47]', 'D1[46]', 'D1[45]', 'D1[44]', 'D1[43]', 'D1[42]', 'D1[41]', 'D1[40]', 'D1[39]', 'D1[38]', 'D1[37]', 'D1[36]', 'D1[35]', 'D1[34]', 'D1[33]', 'D1[32]', 'D1[31]', 'D1[30]', 'D1[29]', 'D1[28]', 'D1[27]', 'D1[26]', 'D1[25]', 'D1[24]', 'D1[23]', 'D1[22]', 'D1[21]', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 299 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W64_EW11_SW52'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/RECURSIVE.ODD1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping 41 of 42 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W64_EW11_SW52'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W64_EW11_SW52'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W64_EW11_SW52'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)

  Beginning Constant Register Removal
  -----------------------------------

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:39  126485.3      1.95     195.5     252.5                           169761.9844
  Mapping 'FPU_Multiplication_Function_W64_EW11_SW52_DP_OP_169J27_123_4229_1'
    0:00:58  138121.9      0.00       0.0     496.9                           190076.2812
    0:00:58  138121.9      0.00       0.0     496.9                           190076.2812
    0:00:59  138080.2      0.00       0.0     496.9                           190013.1562

  Beginning WLM Backend Optimization
  --------------------------------------
    0:01:09  136355.0      0.05       1.6     495.4                           187626.0938
    0:01:10  136435.7      0.01       0.0     497.9                           187670.9688
    0:01:12  136180.8      0.01       0.0     497.2                           187239.5625
    0:01:12  136180.8      0.01       0.0     497.2                           187239.5625
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:13  136392.5      0.00       0.0     497.7                           187509.2188
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:01:18  137364.5      0.55      18.8      32.8 net1045698                188864.2344
    0:01:21  138494.9      0.00       0.0       0.0                           190767.9375
    0:01:21  138494.9      0.00       0.0       0.0                           190767.9375


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:21  138494.9      0.00       0.0       0.0                           190767.9375
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
  Global Optimization (Phase 51)
    0:01:39  142289.3      0.00       0.0       0.0                           198476.5938
    0:01:39  142289.3      0.00       0.0       0.0                           198476.5938
    0:01:39  142289.3      0.00       0.0       0.0                           198476.5938
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:40  142014.2      0.00       0.0       0.0                           197997.5000

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:41  142014.2      0.00       0.0       0.0                           197997.5000
    0:01:43  138772.8      0.00       0.0       0.0                           191162.0469
    0:01:43  138772.8      0.00       0.0       0.0                           191162.0469
    0:01:43  138772.8      0.00       0.0       0.0                           191162.0469
    0:01:44  138741.1      0.00       0.0       0.0                           191093.7812
    0:01:48  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:48  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:48  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:48  137486.9      0.00       0.0       0.0                           188992.6250
    0:01:55  132279.8      0.00       0.0       0.0                           179659.1094
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W64_EW11_SW52'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_KOA_2STAGE_syn.v'.
Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_KOA_2STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_KOA_2STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/FPU_Multiplication_Function_KOA_2STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
Running PRESTO HDLC
Compiling source file ./source/FPU_Multiplication_Function.v
Presto compilation completed successfully.
Running PRESTO HDLC
Presto compilation completed successfully.
Warning: Overwriting design file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db'. (DDB-24)
Elaborated 1 design.
Current design is now 'FPU_Multiplication_Function_W64_EW11_SW52'.
Information: Building the design 'FSM_Mult_Function'. (HDL-193)

Statistics for case statements in always block at line 128 in file
	'./source/FSM_Mult_Function.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           173            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FSM_Mult_Function line 121 in file
		'./source/FSM_Mult_Function.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    state_reg_reg    | Flip-flop |   4   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W1 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=2". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W2 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   2   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'First_Phase_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Zero_InfMult_Unit' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=12". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Exp_Operation_m' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "EW=11". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'XOR_M'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RecursiveKOA_STAGE_2' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=53". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Barrel_Shifter_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Round_decoder_M' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Adder_Round' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "SW=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Tenth_Phase' instantiated from design 'FPU_Multiplication_Function_W64_EW11_SW52' with
	the parameters "W=64,EW=11,SW=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'First_Phase_M_W64' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W64 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Equal' instantiated from design 'Zero_InfMult_Unit_W64' with
	the parameters "S=63". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'add_sub_carry_out' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W12 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  12   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=1". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W1 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Comparator_Less' instantiated from design 'Exp_Operation_m_EW11' with
	the parameters "W=12". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_2_SW53' with
	the parameters "SW=26". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_2_SW53' with
	the parameters "SW=27". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'RecursiveKOA_STAGE_2_SW53' with
	the parameters "SW=28". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'RecursiveKOA_STAGE_2_SW53' with
	the parameters "W=106". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W106 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  106  |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'shift_mux_array' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "SWR=53,LEVEL=0". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterMult' instantiated from design 'Barrel_Shifter_M_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterMult_W53 line 31 in file
		'./source/RegisterMult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'OR_Module' instantiated from design 'Round_decoder_M_SW52' with
	the parameters "W=52". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'Deco_Round_Mult'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/Deco_Round_Mult.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'adder' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Adder_Round_SW53' with
	the parameters "W=53". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W53 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  53   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'Mux_3x1' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=1". (HDL-193)

Statistics for case statements in always block at line 35 in file
	'./source/Mux_3x1.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=11". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'Multiplexer_AC' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=52". (HDL-193)

Statistics for case statements in always block at line 32 in file
	'./source/Multiplexer_AC.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            33            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'RegisterAdd' instantiated from design 'Tenth_Phase_W64_EW11_SW52' with
	the parameters "W=64". (HDL-193)

Inferred memory devices in process
	in routine RegisterAdd_W64 line 31 in file
		'./source/RegisterAdd.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|        Q_reg        | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW26' with
	the parameters "SW=13". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW26' with
	the parameters "SW=14". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW27' with
	the parameters "SW=15". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW13' with
	the parameters "SW=6". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW13' with
	the parameters "SW=7". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW13' with
	the parameters "SW=8". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'subRecursiveKOA' instantiated from design 'subRecursiveKOA_SW15' with
	the parameters "SW=9". (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW6' with
	the parameters "SW=6". (HDL-193)

Inferred memory devices in process
	in routine mult_SW6 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  12   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW7' with
	the parameters "SW=7". (HDL-193)

Inferred memory devices in process
	in routine mult_SW7 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  14   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW8' with
	the parameters "SW=8". (HDL-193)

Inferred memory devices in process
	in routine mult_SW8 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  16   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'mult' instantiated from design 'subRecursiveKOA_SW9' with
	the parameters "SW=9". (HDL-193)

Inferred memory devices in process
	in routine mult_SW9 line 27 in file
		'./source/mult.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    Data_S_o_reg     | Flip-flop |  18   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Uniquified 4 instances of design 'RegisterAdd_W1'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W64'. (OPT-1056)
Information: Uniquified 2 instances of design 'Comparator_Equal_S63'. (OPT-1056)
Information: Uniquified 2 instances of design 'RegisterMult_W1'. (OPT-1056)
Information: Uniquified 3 instances of design 'subRecursiveKOA_SW13'. (OPT-1056)
Information: Uniquified 4 instances of design 'subRecursiveKOA_SW14'. (OPT-1056)
Information: Uniquified 2 instances of design 'subRecursiveKOA_SW15'. (OPT-1056)
Information: Uniquified 3 instances of design 'subRecursiveKOA_SW6'. (OPT-1056)
Information: Uniquified 13 instances of design 'subRecursiveKOA_SW7'. (OPT-1056)
Information: Uniquified 9 instances of design 'subRecursiveKOA_SW8'. (OPT-1056)
Information: Uniquified 2 instances of design 'subRecursiveKOA_SW9'. (OPT-1056)
Information: Uniquified 3 instances of design 'mult_SW6'. (OPT-1056)
Information: Uniquified 13 instances of design 'mult_SW7'. (OPT-1056)
Information: Uniquified 9 instances of design 'mult_SW8'. (OPT-1056)
Information: Uniquified 2 instances of design 'mult_SW9'. (OPT-1056)

  Linking design 'FPU_Multiplication_Function_W64_EW11_SW52'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (106 designs)             /mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/FPU_Multiplication_Function_W64_EW11_SW52.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_RKOA_2STAGE_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell final_result_ieee_Module/                  \
(Tenth_Phase_W64_EW11_SW52) #

#   Propagate Constraints from cell                                            \
final_result_ieee_Module/Final_Result_IEEE/ (RegisterAdd_W64) #

#   Propagate Constraints from cell final_result_ieee_Module/Sgf_Mux/          \
(Multiplexer_AC_W52) #

#   Propagate Constraints from cell final_result_ieee_Module/Exp_Mux/          \
(Multiplexer_AC_W11) #

#   Propagate Constraints from cell final_result_ieee_Module/Sign_Mux/         \
(Mux_3x1_W1) #

#   Propagate Constraints from cell Adder_M/ (Adder_Round_SW53) #

#   Propagate Constraints from cell Adder_M/Add_overflow_Result/               \
(RegisterAdd_W1_0) #

#   Propagate Constraints from cell Adder_M/Add_Subt_Result/ (RegisterAdd_W53) \
#

#   Propagate Constraints from cell Adder_M/A_operation/ (adder_W53) #

#   Propagate Constraints from cell Round_Decoder/ (Round_decoder_M_SW52) #

#   Propagate Constraints from cell Round_Decoder/Rounding_Deco/               \
(Deco_Round_Mult) #

#   Propagate Constraints from cell Round_Decoder/OR_info_reg/ (OR_Module_W52) \
#

#   Propagate Constraints from cell Barrel_Shifter_module/                     \
(Barrel_Shifter_M_SW53) #

#   Propagate Constraints from cell Barrel_Shifter_module/Output_Reg/          \
(RegisterMult_W53) #

#   Propagate Constraints from cell Barrel_Shifter_module/shift_mux_array/     \
(shift_mux_array_SWR53_LEVEL0) #

#   Propagate Constraints from cell Barrel_Shifter_D_I_mux/                    \
(Multiplexer_AC_W53) #

#   Propagate Constraints from cell Sgf_operation/ (RecursiveKOA_STAGE_2_SW53) \
#

#   Propagate Constraints from cell Sgf_operation/ODD1.finalreg/               \
(RegisterAdd_W106) #

#   Propagate Constraints from cell Sgf_operation/ODD1.middle/                 \
(subRecursiveKOA_SW28) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/ (subRecursiveKOA_SW15_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle/        \
(subRecursiveKOA_SW9_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_mult/ \
(mult_SW9_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right/         \
(subRecursiveKOA_SW8_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_mult/ \
(mult_SW8_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left/          \
(subRecursiveKOA_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_mult/ \
(mult_SW7_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/ (subRecursiveKOA_SW14_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle/        \
(subRecursiveKOA_SW8_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult/ \
(mult_SW8_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right/         \
(subRecursiveKOA_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_mult/ \
(mult_SW7_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left/          \
(subRecursiveKOA_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_mult/ \
(mult_SW7_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/ (subRecursiveKOA_SW14_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle/         \
(subRecursiveKOA_SW8_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult/ \
(mult_SW8_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right/          \
(subRecursiveKOA_SW7_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_mult/ \
(mult_SW7_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left/           \
(subRecursiveKOA_SW7_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_mult/ \
(mult_SW7_4) #

#   Propagate Constraints from cell Sgf_operation/ODD1.right/                  \
(subRecursiveKOA_SW27) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/ (subRecursiveKOA_SW15_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle/          \
(subRecursiveKOA_SW9_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_mult/ \
(mult_SW9_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right/           \
(subRecursiveKOA_SW8_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_mult/ \
(mult_SW8_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left/            \
(subRecursiveKOA_SW7_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_mult/ \
(mult_SW7_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/ (subRecursiveKOA_SW14_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle/          \
(subRecursiveKOA_SW8_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult/ \
(mult_SW8_4) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right/           \
(subRecursiveKOA_SW7_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_mult/ \
(mult_SW7_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left/            \
(subRecursiveKOA_SW7_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_mult/ \
(mult_SW7_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/ (subRecursiveKOA_SW13_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle/            \
(subRecursiveKOA_SW8_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_mult/ \
(mult_SW8_5) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right/             \
(subRecursiveKOA_SW7_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right/GENSTOP.inst_mult/ \
(mult_SW7_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left/              \
(subRecursiveKOA_SW6_0) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left/GENSTOP.inst_mult/ \
(mult_SW6_0) #

#   Propagate Constraints from cell Sgf_operation/ODD1.left/                   \
(subRecursiveKOA_SW26) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/ (subRecursiveKOA_SW14_3) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle/         \
(subRecursiveKOA_SW8_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult/ \
(mult_SW8_6) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right/          \
(subRecursiveKOA_SW7_9) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right/GENSTOP.inst_mult/ \
(mult_SW7_9) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left/           \
(subRecursiveKOA_SW7_10) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left/GENSTOP.inst_mult/ \
(mult_SW7_10) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/ (subRecursiveKOA_SW13_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle/           \
(subRecursiveKOA_SW8_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle/GENSTOP.inst_mult/ \
(mult_SW8_7) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right/            \
(subRecursiveKOA_SW7_11) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right/GENSTOP.inst_mult/ \
(mult_SW7_11) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left/             \
(subRecursiveKOA_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left/GENSTOP.inst_mult/ \
(mult_SW6_1) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/ (subRecursiveKOA_SW13_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle/            \
(subRecursiveKOA_SW8_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_mult/ \
(mult_SW8_8) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right/             \
(subRecursiveKOA_SW7_12) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right/GENSTOP.inst_mult/ \
(mult_SW7_12) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left/              \
(subRecursiveKOA_SW6_2) #

#   Propagate Constraints from cell                                            \
Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left/GENSTOP.inst_mult/ \
(mult_SW6_2) #

#   Propagate Constraints from cell Sign_operation/ (XOR_M) #

#   Propagate Constraints from cell Exp_module/ (Exp_Operation_m_EW11) #

#   Propagate Constraints from cell Exp_module/Underflow_m/                    \
(RegisterMult_W1_0) #

#   Propagate Constraints from cell Exp_module/Exp_unflow_Comparator_m/        \
(Comparator_Less_W12) #

#   Propagate Constraints from cell Exp_module/Oflow_A_m/ (RegisterMult_W1_1) #

#   Propagate Constraints from cell Exp_module/exp_result_m/                   \
(RegisterMult_W12) #

#   Propagate Constraints from cell Exp_module/exp_add_subt_m/                 \
(add_sub_carry_out_W12) #

#   Propagate Constraints from cell Exp_Oper_B_mux/ (Mux_3x1_W11) #

#   Propagate Constraints from cell Exp_Oper_A_mux/ (Multiplexer_AC_W12) #

#   Propagate Constraints from cell Zero_Result_Detect/                        \
(Zero_InfMult_Unit_W64) #

#   Propagate Constraints from cell Zero_Result_Detect/Zero_Info_Mult/         \
(RegisterAdd_W1_1) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_B_Comp/            \
(Comparator_Equal_S63_0) #

#   Propagate Constraints from cell Zero_Result_Detect/Data_A_Comp/            \
(Comparator_Equal_S63_1) #

#   Propagate Constraints from cell Operands_load_reg/ (First_Phase_M_W64) #

#   Propagate Constraints from cell Operands_load_reg/YMRegister/              \
(RegisterMult_W64_0) #

#   Propagate Constraints from cell Operands_load_reg/XMRegister/              \
(RegisterMult_W64_1) #

#   Propagate Constraints from cell Sel_B/ (RegisterAdd_W2) #

#   Propagate Constraints from cell Sel_C/ (RegisterAdd_W1_2) #

#   Propagate Constraints from cell Sel_A/ (RegisterAdd_W1_3) #

#   Propagate Constraints from cell FS_Module/ (FSM_Mult_Function) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Wed Nov  2 11:35:29 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      1
    Shorted outputs (LINT-31)                                       1

Cells                                                             298
    Cells do not drive (LINT-1)                                     2
    Connected to power or ground (LINT-32)                        285
    Nets connected to multiple pins on same cell (LINT-33)         11
--------------------------------------------------------------------------------

Warning: In design 'add_sub_carry_out_W12', cell 'B_2' does not drive any nets. (LINT-1)
Warning: In design 'add_sub_carry_out_W12', cell 'B_3' does not drive any nets. (LINT-1)
Warning: In design 'FSM_Mult_Function', output port 'load_1_o' is connected directly to output port 'ctrl_select_a_o'. (LINT-31)
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_A' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sel_C' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_A_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D0[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[5]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[4]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[2]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_Oper_B_mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Exp_module' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Sgf_operation' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[52]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[51]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[50]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[49]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[48]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[47]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[46]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[45]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[44]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[43]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[42]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[41]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[40]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[39]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[38]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[37]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[36]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[35]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[34]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[33]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[32]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[31]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[30]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[29]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[28]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[27]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[26]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[25]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[24]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[23]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[22]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[21]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[20]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[19]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[18]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[17]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[16]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[15]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[14]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[13]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[12]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[11]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[10]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[9]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[8]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[7]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[6]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[5]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[4]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[3]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[2]' is connected to logic 1. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[1]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', a pin on submodule 'Adder_M' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B_i[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_A_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[62]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[61]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[60]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[59]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[58]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[57]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[56]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[55]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[54]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[53]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[52]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[51]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[50]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[49]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[48]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[47]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[46]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[45]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[44]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[43]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[42]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[41]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[40]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[39]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[38]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[37]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[36]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[35]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[34]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[33]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[32]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[31]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[30]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[29]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[28]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[27]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[26]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[25]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[24]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[23]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[22]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[21]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[20]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[19]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[18]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[17]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[16]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[15]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[14]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[13]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[12]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[11]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[10]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[9]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[8]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[7]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[6]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[5]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[4]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[3]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[2]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[1]' is connected to logic 0. 
Warning: In design 'Zero_InfMult_Unit_W64', a pin on submodule 'Data_B_Comp' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_A[0]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[11]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[10]' is connected to logic 0. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[9]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[8]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[7]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[6]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[5]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[4]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[3]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[2]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[1]' is connected to logic 1. 
Warning: In design 'Exp_Operation_m_EW11', a pin on submodule 'Exp_unflow_Comparator_m' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'Data_B[0]' is connected to logic 1. 
Warning: In design 'Barrel_Shifter_M_SW53', a pin on submodule 'shift_mux_array' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'bit_shift_i' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sign_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D2[0]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Exp_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 1. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[51]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[50]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[49]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[48]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[47]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[46]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[45]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[44]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[43]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[42]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[41]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[40]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[39]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[38]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[37]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[36]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[35]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[34]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[33]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[32]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[31]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[30]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[29]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[28]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[27]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[26]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[25]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[24]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[23]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[22]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[21]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[20]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[19]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[18]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[17]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[16]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[15]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[14]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[13]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[12]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[11]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[10]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[9]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[8]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[7]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[6]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[5]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[4]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[3]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[2]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[1]' is connected to logic 0. 
Warning: In design 'Tenth_Phase_W64_EW11_SW52', a pin on submodule 'Sgf_Mux' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'D1[0]' is connected to logic 0. 
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[10]', 'D2[10]'', 'D2[9]', 'D2[8]', 'D2[7]', 'D2[6]', 'D2[5]', 'D2[4]', 'D2[3]', 'D2[2]', 'D2[1]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Oper_B_mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[9]', 'D1[8]'', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]', 'D2[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_operation'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_A_i[52]', 'Data_B_i[52]''.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B_i[52]', 'Data_B_i[51]'', 'Data_B_i[50]', 'Data_B_i[49]', 'Data_B_i[48]', 'Data_B_i[47]', 'Data_B_i[46]', 'Data_B_i[45]', 'Data_B_i[44]', 'Data_B_i[43]', 'Data_B_i[42]', 'Data_B_i[41]', 'Data_B_i[40]', 'Data_B_i[39]', 'Data_B_i[38]', 'Data_B_i[37]', 'Data_B_i[36]', 'Data_B_i[35]', 'Data_B_i[34]', 'Data_B_i[33]', 'Data_B_i[32]', 'Data_B_i[31]', 'Data_B_i[30]', 'Data_B_i[29]', 'Data_B_i[28]', 'Data_B_i[27]', 'Data_B_i[26]', 'Data_B_i[25]', 'Data_B_i[24]', 'Data_B_i[23]', 'Data_B_i[22]', 'Data_B_i[21]', 'Data_B_i[20]', 'Data_B_i[19]', 'Data_B_i[18]', 'Data_B_i[17]', 'Data_B_i[16]', 'Data_B_i[15]', 'Data_B_i[14]', 'Data_B_i[13]', 'Data_B_i[12]', 'Data_B_i[11]', 'Data_B_i[10]', 'Data_B_i[9]', 'Data_B_i[8]', 'Data_B_i[7]', 'Data_B_i[6]', 'Data_B_i[3]', 'Data_B_i[1]', 'Data_B_i[0]'.
Warning: In design 'FPU_Multiplication_Function_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Adder_M'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B_i[5]', 'Data_B_i[4]'', 'Data_B_i[2]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_A_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[62]', 'Data_B[61]'', 'Data_B[60]', 'Data_B[59]', 'Data_B[58]', 'Data_B[57]', 'Data_B[56]', 'Data_B[55]', 'Data_B[54]', 'Data_B[53]', 'Data_B[52]', 'Data_B[51]', 'Data_B[50]', 'Data_B[49]', 'Data_B[48]', 'Data_B[47]', 'Data_B[46]', 'Data_B[45]', 'Data_B[44]', 'Data_B[43]', 'Data_B[42]', 'Data_B[41]', 'Data_B[40]', 'Data_B[39]', 'Data_B[38]', 'Data_B[37]', 'Data_B[36]', 'Data_B[35]', 'Data_B[34]', 'Data_B[33]', 'Data_B[32]', 'Data_B[31]', 'Data_B[30]', 'Data_B[29]', 'Data_B[28]', 'Data_B[27]', 'Data_B[26]', 'Data_B[25]', 'Data_B[24]', 'Data_B[23]', 'Data_B[22]', 'Data_B[21]', 'Data_B[20]', 'Data_B[19]', 'Data_B[18]', 'Data_B[17]', 'Data_B[16]', 'Data_B[15]', 'Data_B[14]', 'Data_B[13]', 'Data_B[12]', 'Data_B[11]', 'Data_B[10]', 'Data_B[9]', 'Data_B[8]', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Zero_InfMult_Unit_W64', the same net is connected to more than one pin on submodule 'Data_B_Comp'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_A[62]', 'Data_A[61]'', 'Data_A[60]', 'Data_A[59]', 'Data_A[58]', 'Data_A[57]', 'Data_A[56]', 'Data_A[55]', 'Data_A[54]', 'Data_A[53]', 'Data_A[52]', 'Data_A[51]', 'Data_A[50]', 'Data_A[49]', 'Data_A[48]', 'Data_A[47]', 'Data_A[46]', 'Data_A[45]', 'Data_A[44]', 'Data_A[43]', 'Data_A[42]', 'Data_A[41]', 'Data_A[40]', 'Data_A[39]', 'Data_A[38]', 'Data_A[37]', 'Data_A[36]', 'Data_A[35]', 'Data_A[34]', 'Data_A[33]', 'Data_A[32]', 'Data_A[31]', 'Data_A[30]', 'Data_A[29]', 'Data_A[28]', 'Data_A[27]', 'Data_A[26]', 'Data_A[25]', 'Data_A[24]', 'Data_A[23]', 'Data_A[22]', 'Data_A[21]', 'Data_A[20]', 'Data_A[19]', 'Data_A[18]', 'Data_A[17]', 'Data_A[16]', 'Data_A[15]', 'Data_A[14]', 'Data_A[13]', 'Data_A[12]', 'Data_A[11]', 'Data_A[10]', 'Data_A[9]', 'Data_A[8]', 'Data_A[7]', 'Data_A[6]', 'Data_A[5]', 'Data_A[4]', 'Data_A[3]', 'Data_A[2]', 'Data_A[1]', 'Data_A[0]'.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic0*' is connected to pins 'Data_B[11]', 'Data_B[10]''.
Warning: In design 'Exp_Operation_m_EW11', the same net is connected to more than one pin on submodule 'Exp_unflow_Comparator_m'. (LINT-33)
   Net '*Logic1*' is connected to pins 'Data_B[9]', 'Data_B[8]'', 'Data_B[7]', 'Data_B[6]', 'Data_B[5]', 'Data_B[4]', 'Data_B[3]', 'Data_B[2]', 'Data_B[1]', 'Data_B[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Exp_Mux'. (LINT-33)
   Net '*Logic1*' is connected to pins 'D1[10]', 'D1[9]'', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: In design 'Tenth_Phase_W64_EW11_SW52', the same net is connected to more than one pin on submodule 'Sgf_Mux'. (LINT-33)
   Net '*Logic0*' is connected to pins 'D1[51]', 'D1[50]'', 'D1[49]', 'D1[48]', 'D1[47]', 'D1[46]', 'D1[45]', 'D1[44]', 'D1[43]', 'D1[42]', 'D1[41]', 'D1[40]', 'D1[39]', 'D1[38]', 'D1[37]', 'D1[36]', 'D1[35]', 'D1[34]', 'D1[33]', 'D1[32]', 'D1[31]', 'D1[30]', 'D1[29]', 'D1[28]', 'D1[27]', 'D1[26]', 'D1[25]', 'D1[24]', 'D1[23]', 'D1[22]', 'D1[21]', 'D1[20]', 'D1[19]', 'D1[18]', 'D1[17]', 'D1[16]', 'D1[15]', 'D1[14]', 'D1[13]', 'D1[12]', 'D1[11]', 'D1[10]', 'D1[9]', 'D1[8]', 'D1[7]', 'D1[6]', 'D1[5]', 'D1[4]', 'D1[3]', 'D1[2]', 'D1[1]', 'D1[0]'.
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 299 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'FPU_Multiplication_Function_W64_EW11_SW52'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy FS_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_A before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_B before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_A_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_Oper_B_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sign_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_D_I_mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sel_C before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/XMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_A_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_add_subt_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/exp_result_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Oflow_A_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Exp_unflow_Comparator_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.finalreg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/shift_mux_array before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Barrel_Shifter_module/Output_Reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/OR_info_reg before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Round_Decoder/Rounding_Deco before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/A_operation before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_Subt_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sign_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Exp_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Sgf_Mux before Pass 1 (OPT-776)
Information: Ungrouping hierarchy final_result_ieee_Module/Final_Result_IEEE before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Adder_M/Add_overflow_Result before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Zero_Info_Mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Operands_load_reg/YMRegister before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Zero_Result_Detect/Data_B_Comp before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Exp_module/Underflow_m before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.left/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.left/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.middle/RECURSIVE.ODD1.right/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.right/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.right/RECURSIVE.ODD1.left/RECURSIVE.ODD1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.middle/RECURSIVE.EVEN1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.left/RECURSIVE.EVEN1.right/RECURSIVE.ODD1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping hierarchy Sgf_operation/ODD1.middle/RECURSIVE.EVEN1.middle/RECURSIVE.ODD1.middle/GENSTOP.inst_mult before Pass 1 (OPT-776)
Information: Ungrouping 104 of 105 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'FPU_Multiplication_Function_W64_EW11_SW52'
Information: Added key list 'DesignWare' to design 'FPU_Multiplication_Function_W64_EW11_SW52'. (DDB-72)
 Implement Synthetic for 'FPU_Multiplication_Function_W64_EW11_SW52'.

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)

  Beginning Mapping Optimizations  (Ultra High effort)
  -------------------------------
  Mapping Optimization (Phase 1)
  Mapping Optimization (Phase 2)

  Beginning Constant Register Removal
  -----------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:01:45  311824.8      0.84     137.5     516.6                           448802.0938
    0:01:45  311824.8      0.84     137.5     516.6                           448802.0938

  Beginning Global Optimizations
  ------------------------------
  Numerical Synthesis (Phase 1)
  Numerical Synthesis (Phase 2)
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)
  Global Optimization (Phase 6)
  Global Optimization (Phase 7)
  Global Optimization (Phase 8)
  Global Optimization (Phase 9)
  Global Optimization (Phase 10)
  Global Optimization (Phase 11)
  Global Optimization (Phase 12)
  Global Optimization (Phase 13)
  Global Optimization (Phase 14)
  Global Optimization (Phase 15)
  Global Optimization (Phase 16)
  Global Optimization (Phase 17)
  Global Optimization (Phase 18)
  Global Optimization (Phase 19)
  Global Optimization (Phase 20)
  Global Optimization (Phase 21)
  Global Optimization (Phase 22)
  Global Optimization (Phase 23)
  Global Optimization (Phase 24)
  Global Optimization (Phase 25)
  Global Optimization (Phase 26)
  Global Optimization (Phase 27)
  Global Optimization (Phase 28)
  Global Optimization (Phase 29)
  Global Optimization (Phase 30)
  Global Optimization (Phase 31)

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------
    0:02:03  198555.8      2.08     393.6     439.4                           260359.1562
  Mapping 'FPU_Multiplication_Function_W64_EW11_SW52_DP_OP_341J28_125_618_5'
  Mapping 'FPU_Multiplication_Function_W64_EW11_SW52_DW01_add_53'
    0:02:18  218875.7      0.12       5.3     414.1                           296357.0625
    0:02:18  218875.7      0.12       5.3     414.1                           296357.0625
    0:02:23  218705.8      0.12       4.9     418.5                           296047.5312

  Beginning WLM Backend Optimization
  --------------------------------------
    0:02:34  215775.4      0.11       3.6     402.4                           291343.9688
    0:02:36  215151.8      0.01       0.0     399.0                           290693.7500
    0:02:38  213737.8      0.01       0.0     398.5                           288311.8750
    0:02:38  213737.8      0.01       0.0     398.5                           288311.8750
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:02:40  213949.4      0.00       0.0     398.6                           288703.4062
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:02:45  216328.3      0.02       0.2       0.0 DP_OP_350J28_134_1342/R_3047_RW_0/D 291424.6250
    0:02:45  216306.7      0.00       0.0       0.0                           291289.0625
    0:02:45  216306.7      0.00       0.0       0.0                           291289.0625


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:02:45  216306.7      0.00       0.0       0.0                           291289.0625
  Global Optimization (Phase 35)
  Global Optimization (Phase 36)
  Global Optimization (Phase 37)
  Global Optimization (Phase 38)
  Global Optimization (Phase 39)
  Global Optimization (Phase 40)
  Global Optimization (Phase 41)
  Global Optimization (Phase 42)
  Global Optimization (Phase 43)
  Global Optimization (Phase 44)
  Global Optimization (Phase 45)
  Global Optimization (Phase 46)
  Global Optimization (Phase 47)
  Global Optimization (Phase 48)
  Global Optimization (Phase 49)
  Global Optimization (Phase 50)
  Global Optimization (Phase 51)
  Global Optimization (Phase 52)
    0:03:05  215238.2      0.00       0.0      16.2                           288972.1875
    0:03:05  215238.2      0.00       0.0      16.2                           288972.1875
    0:03:05  215238.2      0.00       0.0      16.2                           288972.1875
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:07  214636.3      0.00       0.0      16.2                           287976.6250

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:03:08  214636.3      0.00       0.0      16.2                           287976.6250
    0:03:11  212041.4      0.01       0.0      16.2                           283139.6562
    0:03:11  212050.1      0.00       0.0      16.2                           283144.8438
    0:03:11  212050.1      0.00       0.0      16.2                           283144.8438
    0:03:13  211978.1      0.00       0.0      16.2                           283009.0000
    0:03:15  210877.9      0.00       0.0      16.1                           281153.8750
    0:03:16  210585.6      0.00       0.0       0.0                           280641.8125
    0:03:16  210585.6      0.00       0.0       0.0                           280641.8125
    0:03:16  210585.6      0.00       0.0       0.0                           280641.8125
    0:03:16  210585.6      0.00       0.0       0.0                           280641.8125
    0:03:22  204616.8      0.00       0.0       0.0                           270760.5938
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Warning: Design 'FPU_Multiplication_Function_W64_EW11_SW52' contains 1 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)
     Net 'clk': 1431 load(s), 1 driver(s)
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'FPU_Multiplication_Function_W64_EW11_SW52'.
Writing verilog file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_RKOA_2STAGE_syn.v'.
Writing ddc file './db/DOUBLE/FPU_Multiplication_Function_RKOA_2STAGE_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/front_end/db/DOUBLE/FPU_Multiplication_Function_RKOA_2STAGE_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/mnt/vol_NFS_Zener/WD_ESPEC/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_fpu/integracion_fisica/simulacion_logica_sintesis/DOUBLE/FPU_Multiplication_Function_RKOA_2STAGE_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
