Removing design 'fpu_top'
Running PRESTO HDLC
Compiling source file ./source/exponent_alu.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/exp_register_file.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/external_mul_16x16.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/fpu_control_unit.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/fpu_top.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/mask_and_shift.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/shift_and_extend.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/significand_alu.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/sig_register_file.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Running PRESTO HDLC
Compiling source file ./source/SVD_unit.v
Opening include file ./source/global.v
Presto compilation completed successfully.
Error: Value for list 'file_list' must have more than zero elements. (CMD-036)
Running PRESTO HDLC

Inferred memory devices in process
	in routine fpu_top line 173 in file
		'./source/fpu_top.v'.
====================================================================================
|      Register Name       |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
====================================================================================
| sigAluResultRegister_reg | Flip-flop |  32   |  Y  | N  | N  | N  | N  | N  | N  |
| expAluResultRegister_reg | Flip-flop |   9   |  Y  | N  | N  | N  | N  | N  | N  |
====================================================================================
Presto compilation completed successfully.
Elaborated 1 design.
Current design is now 'fpu_top'.
Information: Building the design 'SVDUnit'. (HDL-193)
Presto compilation completed successfully.
Information: Building the design 'FpuControlUnit'. (HDL-193)
Warning:  ./source/fpu_control_unit.v:483: signed to unsigned assignment occurs. (VER-318)
Warning:  ./source/fpu_control_unit.v:553: signed to unsigned assignment occurs. (VER-318)
Warning:  ./source/fpu_control_unit.v:625: signed to unsigned assignment occurs. (VER-318)
Warning:  ./source/fpu_control_unit.v:641: signed to unsigned assignment occurs. (VER-318)
$display output: Invalid operation: 0*Inf
$display output: Invalid operation: Inf*0
$display output: Invalid operation: (add) magnitude subtraction of infinities
$display output: Invalid operation: (sub) magnitude subtraction of infinities
$display output: Invalid operation: inf/inf
$display output: Invalid operation: 0/0
$display output: Invalid operation: division by zero
$display output: Invalid instruction or not yet implemented
$display output: Impossible case detected!
$display output: Round towards nearest even: not yet implemented

Statistics for case statements in always block at line 195 in file
	'./source/fpu_control_unit.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           266            |    auto/auto     |
|           293            |    auto/auto     |
|           821            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine FpuControlUnit line 932 in file
		'./source/fpu_control_unit.v'.
========================================================================================
|        Register Name         |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
========================================================================================
|    underflowDetected_reg     | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|     inexactDetected_reg      | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|       currentState_reg       | Flip-flop |   6   |  Y  | N  | N  | N  | N  | N  | N  |
|        fpuOpCode_reg         | Flip-flop |   4   |  Y  | N  | N  | N  | N  | N  | N  |
|       roundingMode_reg       | Flip-flop |   2   |  Y  | N  | N  | N  | N  | N  | N  |
|          signA_reg           | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|          signB_reg           | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|        stickyBit_reg         | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|        resultSign_reg        | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|     iterationCounter_reg     | Flip-flop |   5   |  Y  | N  | N  | N  | N  | N  | N  |
|      firstIterSign_reg       | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
| invalidOperationDetected_reg | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|  divisionByZeroDetected_reg  | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
|     overflowDetected_reg     | Flip-flop |   1   |  N  | N  | N  | N  | N  | N  | N  |
========================================================================================
Presto compilation completed successfully.
Information: Building the design 'ExpRegisterFile'. (HDL-193)

Statistics for case statements in always block at line 30 in file
	'./source/exp_register_file.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            31            |    auto/auto     |
|            42            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine ExpRegisterFile line 55 in file
		'./source/exp_register_file.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      reg1_reg       | Flip-flop |   9   |  Y  | N  | N  | N  | N  | N  | N  |
|      reg0_reg       | Flip-flop |   9   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'ExponentALU'. (HDL-193)
$display output: Exponent ALU: Undefined ALU OpCode!

Statistics for case statements in always block at line 18 in file
	'./source/exponent_alu.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            22            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'SigRegisterFile'. (HDL-193)
$display output: SRF: Undefined register port
$display output: SRF: Undefined register port

Statistics for case statements in always block at line 35 in file
	'./source/sig_register_file.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            36            |    auto/auto     |
|            54            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine SigRegisterFile line 74 in file
		'./source/sig_register_file.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|      reg1_reg       | Flip-flop |  32   |  Y  | N  | N  | N  | N  | N  | N  |
|      reg0_reg       | Flip-flop |  32   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'SignificandALU'. (HDL-193)
Warning:  ./source/significand_alu.v:14: signed to unsigned assignment occurs. (VER-318)
Warning:  ./source/significand_alu.v:15: signed to unsigned conversion occurs. (VER-318)
Warning:  ./source/significand_alu.v:24: unsigned to signed assignment occurs. (VER-318)
Warning:  ./source/significand_alu.v:25: unsigned to signed assignment occurs. (VER-318)
Warning:  ./source/significand_alu.v:29: unsigned to signed assignment occurs. (VER-318)
Warning:  ./source/significand_alu.v:37: unsigned to signed assignment occurs. (VER-318)
Warning:  ./source/significand_alu.v:45: unsigned to signed assignment occurs. (VER-318)
Warning:  ./source/significand_alu.v:53: unsigned to signed assignment occurs. (VER-318)

Statistics for case statements in always block at line 17 in file
	'./source/significand_alu.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            22            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'MaskAndShift'. (HDL-193)

Statistics for case statements in always block at line 10 in file
	'./source/mask_and_shift.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            11            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Building the design 'ExternalMul16x16'. (HDL-193)

Inferred memory devices in process
	in routine ExternalMul16x16 line 13 in file
		'./source/external_mul_16x16.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    delay_reg_reg    | Flip-flop |  32   |  Y  | N  | N  | N  | N  | N  | N  |
|   product_reg_reg   | Flip-flop |  32   |  Y  | N  | N  | N  | N  | N  | N  |
===============================================================================
Presto compilation completed successfully.
Information: Building the design 'ShiftAndExtend'. (HDL-193)

Statistics for case statements in always block at line 11 in file
	'./source/shift_and_extend.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|            13            |    auto/auto     |
===============================================
Presto compilation completed successfully.
Information: Uniquified 2 instances of design 'SVDUnit'. (OPT-1056)

  Linking design 'fpu_top'
  Using the following designs and libraries:
  --------------------------------------------------------------------------
  * (11 designs)              /home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_NTNU/integracion_fisica/front_end/fpu_top.db, etc
  scx3_cmos8rf_lpvt_tt_1p2v_25c (library)
                              /media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db
  dw_foundation.sldb (library)
                              /mnt/vol_NFS_Zener/tools/synopsys/apps/syn/L-2016.03-SP3/libraries/syn/dw_foundation.sldb

Writing ddc file './db/SINGLE/fpu_top_syn_unmapped.ddc'.
Using operating conditions 'tt_1p2v_25c' found in library 'scx3_cmos8rf_lpvt_tt_1p2v_25c'.

#   Propagate Constraints from cell shiftAndExtend/ (ShiftAndExtend) #

#   Propagate Constraints from cell externalMul/ (ExternalMul16x16) #

#   Propagate Constraints from cell maskAndShift/ (MaskAndShift) #

#   Propagate Constraints from cell sigALU/ (SignificandALU) #

#   Propagate Constraints from cell sigRegisterFile/ (SigRegisterFile) #

#   Propagate Constraints from cell expALU/ (ExponentALU) #

#   Propagate Constraints from cell expRegisterFile/ (ExpRegisterFile) #

#   Propagate Constraints from cell controlUnit/ (FpuControlUnit) #

#   Propagate Constraints from cell svdUnitB/ (SVDUnit_0) #

#   Propagate Constraints from cell svdUnitA/ (SVDUnit_1) #
 
****************************************
check_design summary:
Version:     L-2016.03-SP3
Date:        Mon Oct 31 14:12:36 2016
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                     76
    Unconnected ports (LINT-28)                                     6
    Feedthrough (LINT-29)                                          66
    Shorted outputs (LINT-31)                                       3
    Constant outputs (LINT-52)                                      1

Cells                                                              11
    Cells do not drive (LINT-1)                                    11

Nets                                                                2
    Unloaded nets (LINT-2)                                          2
--------------------------------------------------------------------------------

Warning: In design 'FpuControlUnit', cell 'B_71' does not drive any nets. (LINT-1)
Warning: In design 'FpuControlUnit', cell 'B_72' does not drive any nets. (LINT-1)
Warning: In design 'FpuControlUnit', cell 'B_73' does not drive any nets. (LINT-1)
Warning: In design 'ExponentALU', cell 'B_8' does not drive any nets. (LINT-1)
Warning: In design 'ExponentALU', cell 'B_9' does not drive any nets. (LINT-1)
Warning: In design 'ExponentALU', cell 'B_10' does not drive any nets. (LINT-1)
Warning: In design 'ExponentALU', cell 'B_11' does not drive any nets. (LINT-1)
Warning: In design 'SignificandALU', cell 'B_25' does not drive any nets. (LINT-1)
Warning: In design 'SignificandALU', cell 'B_26' does not drive any nets. (LINT-1)
Warning: In design 'SignificandALU', cell 'B_27' does not drive any nets. (LINT-1)
Warning: In design 'ExternalMul16x16', cell 'C222' does not drive any nets. (LINT-1)
Warning: In design 'fpu_top', net 'operandBExpanded[32]' driven by pin 'svdUnitB/operand_out[32]' has no loads. (LINT-2)
Warning: In design 'fpu_top', net 'operandAExpanded[32]' driven by pin 'svdUnitA/operand_out[32]' has no loads. (LINT-2)
Warning: In design 'FpuControlUnit', port 'isNanA_in' is not connected to any nets. (LINT-28)
Warning: In design 'FpuControlUnit', port 'isNanB_in' is not connected to any nets. (LINT-28)
Warning: In design 'FpuControlUnit', port 'isDenormA_in' is not connected to any nets. (LINT-28)
Warning: In design 'FpuControlUnit', port 'isDenormB_in' is not connected to any nets. (LINT-28)
Warning: In design 'FpuControlUnit', port 'expAluZeroFlag_in' is not connected to any nets. (LINT-28)
Warning: In design 'FpuControlUnit', port 'sigAluZeroFlag_in' is not connected to any nets. (LINT-28)
Warning: In design 'SVDUnit_1', input port 'operand_in[31]' is connected directly to output port 'sign_out'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[31]' is connected directly to output port 'operand_out[32]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[30]' is connected directly to output port 'operand_out[31]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[29]' is connected directly to output port 'operand_out[30]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[28]' is connected directly to output port 'operand_out[29]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[27]' is connected directly to output port 'operand_out[28]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[26]' is connected directly to output port 'operand_out[27]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[25]' is connected directly to output port 'operand_out[26]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[24]' is connected directly to output port 'operand_out[25]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[23]' is connected directly to output port 'operand_out[24]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[22]' is connected directly to output port 'operand_out[22]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[21]' is connected directly to output port 'operand_out[21]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[20]' is connected directly to output port 'operand_out[20]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[19]' is connected directly to output port 'operand_out[19]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[18]' is connected directly to output port 'operand_out[18]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[17]' is connected directly to output port 'operand_out[17]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[16]' is connected directly to output port 'operand_out[16]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[15]' is connected directly to output port 'operand_out[15]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[14]' is connected directly to output port 'operand_out[14]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[13]' is connected directly to output port 'operand_out[13]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[12]' is connected directly to output port 'operand_out[12]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[11]' is connected directly to output port 'operand_out[11]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[10]' is connected directly to output port 'operand_out[10]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[9]' is connected directly to output port 'operand_out[9]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[8]' is connected directly to output port 'operand_out[8]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[7]' is connected directly to output port 'operand_out[7]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[6]' is connected directly to output port 'operand_out[6]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[5]' is connected directly to output port 'operand_out[5]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[4]' is connected directly to output port 'operand_out[4]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[3]' is connected directly to output port 'operand_out[3]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[2]' is connected directly to output port 'operand_out[2]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[1]' is connected directly to output port 'operand_out[1]'. (LINT-29)
Warning: In design 'SVDUnit_1', input port 'operand_in[0]' is connected directly to output port 'operand_out[0]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[31]' is connected directly to output port 'sign_out'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[31]' is connected directly to output port 'operand_out[32]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[30]' is connected directly to output port 'operand_out[31]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[29]' is connected directly to output port 'operand_out[30]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[28]' is connected directly to output port 'operand_out[29]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[27]' is connected directly to output port 'operand_out[28]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[26]' is connected directly to output port 'operand_out[27]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[25]' is connected directly to output port 'operand_out[26]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[24]' is connected directly to output port 'operand_out[25]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[23]' is connected directly to output port 'operand_out[24]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[22]' is connected directly to output port 'operand_out[22]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[21]' is connected directly to output port 'operand_out[21]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[20]' is connected directly to output port 'operand_out[20]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[19]' is connected directly to output port 'operand_out[19]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[18]' is connected directly to output port 'operand_out[18]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[17]' is connected directly to output port 'operand_out[17]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[16]' is connected directly to output port 'operand_out[16]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[15]' is connected directly to output port 'operand_out[15]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[14]' is connected directly to output port 'operand_out[14]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[13]' is connected directly to output port 'operand_out[13]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[12]' is connected directly to output port 'operand_out[12]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[11]' is connected directly to output port 'operand_out[11]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[10]' is connected directly to output port 'operand_out[10]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[9]' is connected directly to output port 'operand_out[9]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[8]' is connected directly to output port 'operand_out[8]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[7]' is connected directly to output port 'operand_out[7]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[6]' is connected directly to output port 'operand_out[6]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[5]' is connected directly to output port 'operand_out[5]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[4]' is connected directly to output port 'operand_out[4]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[3]' is connected directly to output port 'operand_out[3]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[2]' is connected directly to output port 'operand_out[2]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[1]' is connected directly to output port 'operand_out[1]'. (LINT-29)
Warning: In design 'SVDUnit_0', input port 'operand_in[0]' is connected directly to output port 'operand_out[0]'. (LINT-29)
Warning: In design 'SVDUnit_1', output port 'sign_out' is connected directly to output port 'operand_out[32]'. (LINT-31)
Warning: In design 'FpuControlUnit', output port 'srfShiftEnableR0_out' is connected directly to output port 'srrShiftEnable_out'. (LINT-31)
Warning: In design 'SVDUnit_0', output port 'sign_out' is connected directly to output port 'operand_out[32]'. (LINT-31)
Warning: In design 'FpuControlUnit', output port 'srfReadSelectA_out[2]' is connected directly to 'logic 0'. (LINT-52)
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Alib files are up-to-date.
Information: Sequential output inversion is enabled.  SVF file must be used for formal verification. (OPT-1208)
Information: Retiming is enabled. SVF file must be used for formal verification. (OPT-1210)

Information: There are 89 potential problems in your design. Please run 'check_design' for more information. (LINT-99)

  Simplifying Design 'fpu_top'

Loaded alib file '../alib-52/scx3_cmos8rf_lpvt_tt_1p2v_25c.db.alib'
Information: Ungrouping hierarchy svdUnitA before Pass 1 (OPT-776)
Information: Ungrouping hierarchy controlUnit before Pass 1 (OPT-776)
Information: Ungrouping hierarchy expRegisterFile before Pass 1 (OPT-776)
Information: Ungrouping hierarchy expALU before Pass 1 (OPT-776)
Information: Ungrouping hierarchy sigRegisterFile before Pass 1 (OPT-776)
Information: Ungrouping hierarchy sigALU before Pass 1 (OPT-776)
Information: Ungrouping hierarchy maskAndShift before Pass 1 (OPT-776)
Information: Ungrouping hierarchy externalMul before Pass 1 (OPT-776)
Information: Ungrouping hierarchy shiftAndExtend before Pass 1 (OPT-776)
Information: Ungrouping hierarchy svdUnitB before Pass 1 (OPT-776)
Information: Ungrouping 10 of 11 hierarchies before Pass 1 (OPT-775)
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping
  ------------------------
  Processing 'fpu_top'
Information: The register 'controlUnit/underflowDetected_reg' is a constant and will be removed. (OPT-1206)
Information: The register 'controlUnit/inexactDetected_reg' is a constant and will be removed. (OPT-1206)
Information: The register 'controlUnit/overflowDetected_reg' is a constant and will be removed. (OPT-1206)
 Implement Synthetic for 'fpu_top'.
Information: Added key list 'DesignWare' to design 'fpu_top'. (DDB-72)

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1TS' in the library 'scx3_cmos8rf_lpvt_tt_1p2v_25c' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)
Information: The register 'expRegisterFile/reg1_reg[8]' is a constant and will be removed. (OPT-1206)

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
  Mapping 'fpu_top_DW_mult_uns_1'

  Beginning Isolate Ports
  -----------------------

  Beginning Delay Optimization
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:31   46533.6      2.13     145.9     256.9                           55954.3867
    0:00:36   52149.6      0.06       0.5     286.8                           65138.7422
    0:00:36   52149.6      0.06       0.5     286.8                           65138.7422
    0:00:36   52149.6      0.06       0.5     286.8                           65138.7422

  Beginning WLM Backend Optimization
  --------------------------------------
    0:00:40   51145.9      0.00       0.0     282.9                           63683.5234
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484


  Beginning Design Rule Fixing  (max_transition)  (max_fanout)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:41   51052.3      0.00       0.0     282.8                           63521.6484
  Global Optimization (Phase 32)
  Global Optimization (Phase 33)
  Global Optimization (Phase 34)
    0:00:43   51989.8      0.00       0.0       0.0                           64960.4180
    0:00:43   51989.8      0.00       0.0       0.0                           64960.4180


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:43   51989.8      0.00       0.0       0.0                           64960.4180
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
    0:00:50   51916.3      0.00       0.0      21.0                           64796.3398
    0:00:50   51916.3      0.00       0.0      21.0                           64796.3398
    0:00:50   51916.3      0.00       0.0      21.0                           64796.3398
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:51   51819.8      0.00       0.0      21.0                           64627.2734
    0:00:52   50911.2      0.00       0.0      21.0                           63055.7539
    0:00:52   50911.2      0.00       0.0      21.0                           63055.7539
    0:00:52   50911.2      0.00       0.0      21.0                           63055.7539
    0:00:53   50911.2      0.00       0.0      21.0                           63041.0156
    0:00:54   50436.0      0.00       0.0       0.0                           62275.6094
    0:00:54   50436.0      0.00       0.0       0.0                           62275.6094
    0:00:54   50436.0      0.00       0.0       0.0                           62275.6094
    0:00:54   50436.0      0.00       0.0       0.0                           62275.6094
    0:00:57   48856.3      0.00       0.0       0.0                           59716.0859
Loading db file '/media/datos/IBM/TECH/ibm130_lp/digital/scx3_cmos8rf_lpvt_tt_1p2v_25c.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Current design is 'fpu_top'.
Warning: In the design fpu_top, net 'overflow_out' is connecting multiple ports. (UCN-1)
Writing verilog file '/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_NTNU/integracion_fisica/front_end/db/SINGLE/fpu_top_syn.v'.
Warning: Verilog 'assign' or 'tran' statements are written out. (VO-4)
Writing ddc file './db/SINGLE/fpu_top_syn_mapped.ddc'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_NTNU/integracion_fisica/front_end/db/SINGLE/fpu_top_syn.sdf'. (WT-3)
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/home/local/ESTUDIANTES/jsequeira/Documents/Dise-o-ASIC-FPGA-FPU/ASIC_FLOW/ASIC_NTNU/integracion_fisica/simulacion_logica_sintesis/SINGLE/fpu_top_syn.sdf'. (WT-3)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
