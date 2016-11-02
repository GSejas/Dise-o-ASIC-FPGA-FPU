`timescale 1ns/1ps

`include "global.v"

module FpuControlUnit(clk_in, reset_in, fpuOpCode_in, roundingMode_in,	
	signA_in, signB_in, isZeroA_in, isZeroB_in, isInfA_in, isInfB_in, isNanA_in, 
		isNanB_in, isDenormA_in, isDenormB_in,
	expAluNegFlag_in, expAluZeroFlag_in, 
	sigAluNegFlag_in, sigAluZeroFlag_in, 
	guardBit_in, roundBit_in, stickyBitData_in,
	readFPInput_out,
	erfWriteSelectR0_out, erfWriteSelectR1_out, erfWriteEnableR0_out, erfWriteEnableR1_out, 
		erfReadSelectA_out, erfReadSelectB_out,
	srfWriteSelectR0_out, srfWriteSelectR1_out, srfWriteEnableR0_out, srfWriteEnableR1_out, 
		srfShiftEnableR0_out, srfReadSelectA_out, srfReadSelectB_out,
	expAluRegOrSigResult_out,
	expAluOp_out,
	errWriteEnable_out,
	sigAluRegOrMul_out, sigAluSrr_out, sigAluRegOrExpResult_out,
	sigAluOp_out,
	srrWriteEnable_out,
	srrShiftEnable_out,
	srrShiftIn_out,
	maskAndShiftOp_out,
	mulEnable_out,
	shiftAndExtendOp_out,
	outputFPResult_out,
	resultSign_out,
	resultReady_out,
	invalidOperationDetected_out, divisionByZeroDetected_out, overflowDetected_out, 
		underflowDetected_out, inexactDetected_out
	);	  
	
//STATE DEFINITIONS
//Pre-process states
	parameter STATE_IDLE 				=  0; //idle state, ready for new input
	parameter STATE_INIT				=  1; //read inputs, determine operation, detect exceptions
	
//Arithmetic states	
	//MUL states
	parameter STATE_MUL_M1				=  2; //start first multiplication, add exponents
	parameter STATE_MUL_M2				=  3; //start second multiplication, subtract bias from exponent sum
	parameter STATE_MUL_M3				=  4; //start third multiplication
	parameter STATE_MUL_M4				=  5; //start fourth multiplication, accumulate
	parameter STATE_MUL_M5				=  6; //complete fourth multiplication, accumulate
	parameter STATE_MUL_M6				=  7; //final accumulate
	
	//ADDSUB states
	parameter STATE_ADDSUB_EXPSUB		=  8; //compare input exponents
	parameter STATE_ADDSUB_DIFFNEG		=  9; //find the absolute value of the exp. difference
	parameter STATE_ADDSUB_DIFFPOS		= 10; //empty state - may be removed 
	parameter STATE_ADDSUB_SHIFTFRACA	= 11; //adjust input significand A
	parameter STATE_ADDSUB_SHIFTFRACB	= 12; //adjust input significand B
	parameter STATE_ADDSUB_ADDSUBFRACS	= 13; //add or subtract the adjusted significands
	parameter STATE_ADDSUB_NEGSUM		= 14; //negate any negative sum, set the output sign to negative
	parameter STATE_ADDSUB_POSSUM		= 15; //keep the sum, set the output sign to positive
	
	//DIV states
	parameter STATE_DIV_ADD_BIAS		= 16; 
	parameter STATE_DIV_SUB_EXP			= 17;
	parameter STATE_DIV_ITER			= 18; 
	
	//int2fp states
	parameter STATE_I2FP_TEST_SIGN		= 19;
	parameter STATE_I2FP_NEGATE			= 20;
	parameter STATE_I2FP_CLZ			= 21;
	parameter STATE_I2FP_ADJ1			= 22;
	parameter STATE_I2FP_ADJ2			= 23;
	
	//fp2int states
	parameter STATE_FP2SI_UNBIAS		= 24;
	parameter STATE_FP2SI_CALC_ADJ		= 25;
	parameter STATE_FP2SI_PREROUND_RSH	= 26;
	parameter STATE_FP2SI_ROUND			= 27;
	parameter STATE_FP2SI_POSTROUND_RSH = 28; 
	parameter STATE_FP2SI_NEGATE		= 29;
	
//Post-process states
	//addsub-normalization
	parameter STATE_CLZ					= 30; //count leading zeros in a significand, needed for generic rounding 
	parameter STATE_NORMALIZE_CALC_ADJ	= 31; //calculate the required normalization adjustments
	parameter STATE_NORMALIZE_GENERIC	= 32; //perform the actual normalization
	//mul normalization
	parameter STATE_MUL_NORM0			= 33; //multiplication normalization, case 1
	parameter STATE_MUL_NORM1			= 34; //empty state, may be removed
	//div/sqrt normalization
	parameter STATE_NORM_DIV_SQRT		= 35; //normalize division or square root
	//rounding
	parameter STATE_ROUND				= 36; //round the result: R0 = round(R0)
	parameter STATE_POST_ROUND_NORM		= 37; //correct de-normalize caused by rounding
	//output states
	parameter STATE_EMIT_RESULT			= 38;
	parameter STATE_EMIT_ZERO			= 39;
	parameter STATE_EMIT_INF			= 40;
	parameter STATE_EMIT_NAN			= 41;
	
	
//PORTS
	//input ports
		input clk_in, reset_in;	
		input [3:0] fpuOpCode_in;
		input [1:0] roundingMode_in;   
	
	//SVD values
		input signA_in, signB_in, isZeroA_in, isZeroB_in, isInfA_in, isInfB_in, isNanA_in, 
			  isNanB_in, isDenormA_in, isDenormB_in;
	
	//ALU status flags
		input expAluNegFlag_in, expAluZeroFlag_in;
		input sigAluNegFlag_in, sigAluZeroFlag_in;	
		
	//bits 5 and 6 of the s.R0 register
		input guardBit_in, roundBit_in;
	//the logical OR between all discarded bits 
		input stickyBitData_in;
		
	// input control
	output reg readFPInput_out;	 //interpret input as floating-point or integer?
	
	//Register file control
		//exponent register file
			output reg erfWriteSelectR0_out, erfWriteSelectR1_out, erfWriteEnableR0_out, erfWriteEnableR1_out;
			output reg [2:0] erfReadSelectA_out, erfReadSelectB_out;
		//exponent result register
			output reg errWriteEnable_out;
		//significand register file
			output reg srfWriteSelectR0_out, srfWriteSelectR1_out, srfWriteEnableR0_out, srfWriteEnableR1_out, srfShiftEnableR0_out; 
			output reg [3:0] srfReadSelectA_out, srfReadSelectB_out;
		//significand result register
			output reg srrWriteEnable_out, srrShiftEnable_out, srrShiftIn_out;

			
	//Exponent ALU control
		output reg expAluRegOrSigResult_out;
		output reg [2:0] expAluOp_out;
	
	
	//Significand ALU control 
		output reg sigAluRegOrMul_out, sigAluSrr_out;
		output reg sigAluRegOrExpResult_out;
		output reg [3:0] sigAluOp_out;
	 
	   
	//multiplier chain
		output reg [1:0] maskAndShiftOp_out;
		output reg mulEnable_out;
		output reg [1:0] shiftAndExtendOp_out;
	
	//result related values	 
		output reg outputFPResult_out;
		output resultSign_out;
		output reg resultReady_out;
	
	//exception flags
	output invalidOperationDetected_out, divisionByZeroDetected_out, 
		   overflowDetected_out, underflowDetected_out, inexactDetected_out;
	
	
//INTERNAL REGISTERS
	reg [5:0] currentState, nextState; //state registers
	reg [3:0] fpuOpCode;			   //active operation
	reg [1:0] roundingMode;			   //active rounding mode
	reg signA, signB, isZeroA, isZeroB, isInfA, isInfB, isNanA, isNanB, isDenormA, isDenormB;
	reg stickyBit;					   //current sticky bit value
	reg resultSign;	 				   //result sign of active operation
	reg [4:0] iterationCounter;		   //counter used by DIV and SQRT
	reg firstIterSign;				   //holds the sign generated by the first iteration, used for norm. 
	reg invalidOperationDetected, divisionByZeroDetected, overflowDetected, underflowDetected, inexactDetected;
	
	
//INTERNAL TEMPORARY VALUES
	reg [3:0] fpuOpCode_val;
	reg [1:0] roundingMode_val;
	reg signA_val, signB_val, isZeroA_val, isZeroB_val, isInfA_val, isInfB_val, isNanA_val,
		isNanB_val, isDenormA_val, isDenormB_val;
	reg stickyBit_val;
	reg resultSign_val;	 
	reg [4:0] iterationCounter_val;  
	reg firstIterSign_val;
	reg invalidOperationDetected_val, divisionByZeroDetected_val, overflowDetected_val, 
		underflowDetected_val, inexactDetected_val;
	
//ASSIGNMENTS							
	//output the sign of the active operation  
	assign resultSign_out = resultSign; 
	//output exception flags
	assign invalidOperationDetected_out	= invalidOperationDetected;
	assign divisionByZeroDetected_out	= divisionByZeroDetected;
	assign overflowDetected_out 		= overflowDetected;
	assign underflowDetected_out		= underflowDetected;
	assign inexactDetected_out			= inexactDetected;

	
//asynchronous block
	always @(*) begin
	//DEFAULT VALUES		
		//preserve register values by default 
		fpuOpCode_val		 = fpuOpCode;
		roundingMode_val	 = roundingMode;
		signA_val			 = signA;
		signB_val			 = signB;
		isZeroA_val			 = isZeroA;
		isZeroB_val	 		 = isZeroB;
		isInfA_val			 = isInfA;
		isInfB_val			 = isInfB;
		isNanA_val			 = isNanA;
		isNanB_val			 = isNanB;
		isDenormA_val		 = isDenormA;
		isDenormB_val	 	 = isDenormB;	 		
		stickyBit_val   	 = stickyBit;
		resultSign_val		 = resultSign;
		iterationCounter_val = iterationCounter; 
		firstIterSign_val 	 = firstIterSign;
		invalidOperationDetected_val= invalidOperationDetected;
		divisionByZeroDetected_val	= divisionByZeroDetected;
		overflowDetected_val		= overflowDetected;
		underflowDetected_val		= underflowDetected;
		inexactDetected_val 		= inexactDetected;
		
		//input control
		readFPInput_out = 1'b1; //interpret input as FP by default
		
		//exponent register file
		erfWriteEnableR0_out = 1'b0;
		erfWriteEnableR1_out = 1'b0;
		erfWriteSelectR0_out = 1'b0;
		erfWriteSelectR1_out = 1'b0;	 
		erfReadSelectA_out	 = `ERF_REG_R0;
		erfReadSelectB_out	 = `ERF_REG_R1;
		
		//significand register file
		srfWriteEnableR0_out = 1'b0;
		srfWriteEnableR1_out = 1'b0;
		srfWriteSelectR0_out = 1'b0;
		srfWriteSelectR1_out = 1'b0; 
		srfShiftEnableR0_out = 1'b0;		
		srfReadSelectA_out	 = `SRF_REG_R0;
		srfReadSelectB_out	 = `SRF_REG_R1;
		
		//exponent ALU
		expAluRegOrSigResult_out= 1'b0;	 
		expAluOp_out			= `EXP_ALU_OP_NOP;
		errWriteEnable_out 		= 1'b0;
		
		//significand ALU
		sigAluRegOrMul_out		= 1'b0;	 //read op.A from register file or from multiplier?
		sigAluSrr_out 			= 1'b0;	 //read op.A from Significand Result Register, og register file/multiplier?
		sigAluRegOrExpResult_out= 1'b0;	 //read op.B from register file or exponent result register=
		sigAluOp_out			= `SIG_ALU_OP_NOP;	
		srrWriteEnable_out		= 1'b0;
		srrShiftEnable_out		= 1'b0;
		srrShiftIn_out			= 1'b0;
				
		//multiplier chain
		maskAndShiftOp_out	 = `MASK_AND_SHIFT_A8C8;
		mulEnable_out		 = 1'b0;
		shiftAndExtendOp_out = `SHIFT_16_BIT_AND_EXTEND;
		
		//output related
		outputFPResult_out = 1'b1; //output floating-point result by default
		resultReady_out	   = 1'b0;		  
		
	//END: DEFAULT VALUES

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		case (currentState) 			
//--------PRE-PROCESS STATES BEGIN
			STATE_IDLE: begin
				nextState = STATE_INIT;
				
				//keep previous result valid, until a new operation is started
				resultReady_out = 1'b1;
				outputFPResult_out = ~(fpuOpCode == `FPU_INSTR_FP2SI);
			end
			STATE_INIT: begin				
				fpuOpCode_val = fpuOpCode_in;		//update active operation
				roundingMode_val = roundingMode_in;	//update active rounding modes
				
				//read SVD signals
				signA_val		= signA_in;
				signB_val		= signB_in;
				isZeroA_val		= isZeroA_in;
				isZeroB_val	 	= isZeroB_in;
				isInfA_val		= isInfA_in;
				isInfB_val		= isInfB_in;
				isNanA_val		= isNanA_in;
				isNanB_val		= isNanB_in;
				isDenormA_val	= isDenormA_in;
				isDenormB_val	= isDenormB_in;	
						
				
				//determine next state
				case (fpuOpCode_in)
					`FPU_INSTR_MUL: begin
						nextState = STATE_MUL_M1;	//default nextState
						
						//detect input-time exceptions
						if (isZeroA_in)
							if (isInfB_in) begin // 0*Inf
								$display("Invalid operation: 0*Inf");
								nextState = STATE_EMIT_NAN;
								invalidOperationDetected_val = 1'b1;
						  	end
						
						if (isZeroB_in)
							if (isInfA_in) begin //Inf*0		
								$display("Invalid operation: Inf*0");
								nextState = STATE_EMIT_NAN;	
								invalidOperationDetected_val = 1'b1;
							end
							
						//read new inputs exponents
						erfWriteEnableR0_out = 1'b1;
						erfWriteEnableR1_out = 1'b1;
						erfWriteSelectR0_out = 1'b1;
						erfWriteSelectR1_out = 1'b1;	
					end
					`FPU_INSTR_ADD: begin
						nextState = STATE_ADDSUB_EXPSUB; //default next-state
						
						//detect input-time exceptions
						if (isInfA_in && isInfB_in) //both operands Inf?
							if (signA_in != signB_in) begin //different signs?							
								$display("Invalid operation: (add) magnitude subtraction of infinities");
								nextState = STATE_EMIT_NAN;			
								invalidOperationDetected_val = 1'b1;
							end
						
						//read new inputs exponents
						erfWriteEnableR0_out = 1'b1;
						erfWriteEnableR1_out = 1'b1;
						erfWriteSelectR0_out = 1'b1;
						erfWriteSelectR1_out = 1'b1;
						//read new significands
						srfWriteEnableR0_out = 1'b1;
						srfWriteEnableR1_out = 1'b1;
						srfWriteSelectR0_out = 1'b1;
						srfWriteSelectR1_out = 1'b1;
					end
					`FPU_INSTR_SUB: begin
						nextState = STATE_ADDSUB_EXPSUB;
						
						//detect input-time exceptions
						if (isInfA_in && isInfB_in) //both operands Inf?
							if (signA_in == signB_in) begin //equal signs?
								$display("Invalid operation: (sub) magnitude subtraction of infinities");
								nextState = STATE_EMIT_NAN;			
								invalidOperationDetected_val = 1'b1;
							end
						
						//read new inputs exponents
						erfWriteEnableR0_out = 1'b1;
						erfWriteEnableR1_out = 1'b1;
						erfWriteSelectR0_out = 1'b1;
						erfWriteSelectR1_out = 1'b1;
						//read new significands
						srfWriteEnableR0_out = 1'b1;
						srfWriteEnableR1_out = 1'b1;
						srfWriteSelectR0_out = 1'b1;
						srfWriteSelectR1_out = 1'b1;
					end
					`FPU_INSTR_DIV: begin
						nextState = STATE_DIV_ADD_BIAS; //default next-state
						
						//detect input-time exceptions
						if (isInfA_in && isInfB_in)  begin//both operands Inf?
								$display("Invalid operation: inf/inf");
								nextState = STATE_EMIT_NAN;			
								invalidOperationDetected_val = 1'b1;
						end
						if (isZeroB_in)
							if (isZeroA_in) begin // 0/0 division 
								$display("Invalid operation: 0/0");
								nextState = STATE_EMIT_NAN;
							end else begin //division-by-zero
								$display("Invalid operation: division by zero");
								resultSign_val = signA_in ^ signB_in;
								nextState = STATE_EMIT_INF;			
								divisionByZeroDetected_val = 1'b1;
							end
							
						//read new inputs exponents
						erfWriteEnableR0_out = 1'b1;
						erfWriteEnableR1_out = 1'b1;
						erfWriteSelectR0_out = 1'b1;
						erfWriteSelectR1_out = 1'b1;
						//read new significands
						srfWriteEnableR0_out = 1'b1;
						srfWriteEnableR1_out = 1'b1;
						srfWriteSelectR0_out = 1'b1;
						srfWriteSelectR1_out = 1'b1;
					end
					//`FPU_INSTR_SQRT: nextState = ;
					`FPU_INSTR_UI2FP: begin
						nextState = STATE_I2FP_CLZ;
						//read integer into s.R0	
						readFPInput_out = 1'b0;
						srfWriteEnableR0_out = 1'b1;
						srfWriteSelectR0_out = 1'b1;
					end
					`FPU_INSTR_SI2FP: begin
						nextState = STATE_I2FP_TEST_SIGN;
						//read integer into s.R0	
						readFPInput_out = 1'b0;
						srfWriteEnableR0_out = 1'b1;
						srfWriteSelectR0_out = 1'b1;
					end
					`FPU_INSTR_FP2SI: begin
						nextState = STATE_FP2SI_UNBIAS;
						
						erfWriteEnableR0_out = 1'b1;
						erfWriteSelectR0_out = 1'b1;
						srfWriteEnableR0_out = 1'b1;
						srfWriteSelectR0_out = 1'b1;
					end
					default: begin
						$display("Invalid instruction or not yet implemented");
						nextState = STATE_IDLE;
					end
				endcase
			end				
//--------PRE-PROCESS STATES END

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//--------MUL STATES BEGIN
			STATE_MUL_M1: begin	
				nextState = STATE_MUL_M2;						
				
				erfWriteEnableR0_out = 1'b1;	//store addition result in R0	
				expAluOp_out = `EXP_ALU_OP_ADD; //add exponents	
				
				maskAndShiftOp_out = `MASK_AND_SHIFT_A8C8;
				mulEnable_out = 1'b1;	
				
				resultSign_val = signA ^ signB;
			end
			STATE_MUL_M2: begin
				nextState = STATE_MUL_M3;						 
				
				erfWriteEnableR0_out = 1'b1; //write back exponent to exp.R0
				erfReadSelectB_out = `ERF_REG_BIAS; //'d127
				expAluOp_out = `EXP_ALU_OP_SUB; //subtract bias
				
				maskAndShiftOp_out = `MASK_AND_SHIFT_A8D16;
				mulEnable_out = 1'b1;  
				sigAluRegOrMul_out = 1'b1;
			end	
			STATE_MUL_M3: begin
				nextState = STATE_MUL_M4;
				
				srfWriteEnableR0_out = 1'b1;
				sigAluRegOrMul_out = 1'b1;			//read partial product
				sigAluOp_out = `SIG_ALU_OP_MOVA;	//accumulate first partial product
				
				maskAndShiftOp_out = `MASK_AND_SHIFT_B16C8;
				mulEnable_out = 1'b1;	
			end	
			STATE_MUL_M4: begin
				nextState = STATE_MUL_M5;
				
				srfWriteEnableR0_out = 1'b1;
				srfReadSelectB_out = 3'b000;	//read B from R0
				sigAluRegOrMul_out = 1'b1;		//read partial product
				sigAluOp_out = `SIG_ALU_OP_ADD; //accumulate second partial product
				
				maskAndShiftOp_out = `MASK_AND_SHIFT_B16D16;
				mulEnable_out = 1'b1;	
				shiftAndExtendOp_out = `SHIFT_0_BIT_AND_EXTEND;
			end	
			STATE_MUL_M5: begin
				nextState = STATE_MUL_M6;
				
				srfWriteEnableR0_out = 1'b1;  
				srfReadSelectB_out = `ERF_REG_R0;		//read B from R0
				sigAluRegOrMul_out = 1'b1; 		//read partial product
				sigAluOp_out = `SIG_ALU_OP_ADD; //accumulate third partial product
				
				mulEnable_out = 1'b1; 							
				shiftAndExtendOp_out = `SHIFT_0_BIT_AND_EXTEND;
			end	
			STATE_MUL_M6: begin			
				nextState = (sigAluNegFlag_in == 1'b1) ? STATE_MUL_NORM0 : STATE_MUL_NORM1;
				
				mulEnable_out = 1'b1; 							
				shiftAndExtendOp_out = `SHIFT_TRUNC_AND_EXTEND;	
				
				stickyBit_val = stickyBitData_in;
				
				srfWriteEnableR0_out = 1'b1; //write back final product to R0
				srfReadSelectB_out = `SRF_REG_R0;	//read B from R0
				sigAluRegOrMul_out = 1'b1; 		//read partial product
				sigAluOp_out = `SIG_ALU_OP_ADD; //accumulate fourth partial product
			end	
	//--------MUL STATES END

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//--------ADDSUB STATES BEGIN
			STATE_ADDSUB_EXPSUB: begin
				//do we need to negate fraction A?
				if (signA == 1'b1) begin			
					srfReadSelectB_out = `SRF_REG_R0; //read fractionA from s.R0
					sigAluOp_out = `SIG_ALU_OP_NEGB;
					srfWriteEnableR0_out = 1'b1; //store negated fraction in s.R0
				end
					
				if (expAluNegFlag_in == 1'b1) begin
					nextState = STATE_ADDSUB_DIFFNEG;	
					erfWriteEnableR0_out = 1'b1;	   	//write back subtraction result to R0
				end	else begin
					nextState = STATE_ADDSUB_DIFFPOS;
					erfWriteEnableR1_out = 1'b1;	   	//write back subtraction result to R1
				end
							
				expAluOp_out = `EXP_ALU_OP_SUB;	  		//perform E_A - E_B			
			end
			STATE_ADDSUB_DIFFNEG: begin
				nextState = STATE_ADDSUB_SHIFTFRACA;							 
				
				erfReadSelectB_out = `ERF_REG_R0; 	 //output R0 on port B 
				expAluOp_out = `EXP_ALU_OP_NEGB; //negate exponent difference, to find it's absolute
				errWriteEnable_out = 1'b1;	   	 //write the absolute exp.diff to ERR
			end
			STATE_ADDSUB_DIFFPOS: begin
				nextState = STATE_ADDSUB_SHIFTFRACB;
				
				erfReadSelectA_out = `ERF_REG_R1; 	//output R1 on port A
				expAluOp_out = `EXP_ALU_OP_MOVA;//positive exponent difference, move
				errWriteEnable_out = 1'b1;		//move the exp.diff to ERR
			end
			STATE_ADDSUB_SHIFTFRACA: begin
				nextState = STATE_ADDSUB_ADDSUBFRACS;
								
				erfReadSelectA_out = `ERF_REG_R1;		//read E_B from e.R1
				expAluOp_out = `EXP_ALU_OP_MOVA;//move E_B to e.R0
				erfWriteEnableR0_out = 1'b1;
				
				srfReadSelectA_out = `SRF_REG_R0; //read the significand from R0
				sigAluRegOrExpResult_out = 1'b1; //use the ERR value (exp.diff) as operand B to the sigALU
				sigAluOp_out = `SIG_ALU_OP_SHRA;
				srfWriteEnableR0_out = 1'b1; //write back shifted significand to R0
			end
			STATE_ADDSUB_SHIFTFRACB: begin
				nextState = STATE_ADDSUB_ADDSUBFRACS;
								
				srfReadSelectA_out = `SRF_REG_R1; //read S_B from s.R1
				sigAluRegOrExpResult_out = 1'b1; //use the ERR value (exp.diff) as operand B to the sigALU
				sigAluOp_out = `SIG_ALU_OP_SHRA;	
				srfWriteEnableR1_out = 1'b1; //write back shifted significand to s.R1
			end
			STATE_ADDSUB_ADDSUBFRACS: begin
				nextState = (sigAluNegFlag_in == 1'b1) ? STATE_ADDSUB_NEGSUM : STATE_ADDSUB_POSSUM;
							
				//determine the effective operation
				if (fpuOpCode == `FPU_INSTR_ADD) begin
					if (signB == 1'b1) sigAluOp_out = `SIG_ALU_OP_SUB;
					else sigAluOp_out = `SIG_ALU_OP_ADD;	
				end else if (fpuOpCode == `FPU_INSTR_SUB) begin
					if (((~signA)&(~signB)) | ((signA)&(~signB))) sigAluOp_out = `SIG_ALU_OP_SUB;	
					else sigAluOp_out = `SIG_ALU_OP_ADD;
				end	else
					$display("Impossible case detected!");
				
				srfWriteEnableR0_out = 1'b1; //write back addition/subtraction result to s.R0 				
			end	 
			STATE_ADDSUB_NEGSUM: begin
				nextState = STATE_CLZ;	
				
				srfReadSelectB_out = `SRF_REG_R0;  //relay s.R0 to port B
				sigAluOp_out = `SIG_ALU_OP_NEGB;				 
				srfWriteEnableR0_out = 1'b1; //write back negated sum to s.R0				  
				
				resultSign_val = 1'b1; //set the result sign bit
			end
			STATE_ADDSUB_POSSUM: begin
				nextState = STATE_CLZ;
				
				resultSign_val = 1'b0; //set the result sign bit
			end
	//--------ADDSUB STATES END

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//--------DIV STATES BEGIN
			STATE_DIV_ADD_BIAS: begin						   
				nextState = STATE_DIV_SUB_EXP;
				
				erfReadSelectB_out = `ERF_REG_BIAS;	//read 'd127 (bias) from e.C4 
				expAluOp_out = `EXP_ALU_OP_ADD; //add e.R0 to e.C4
				erfWriteEnableR0_out = 1'b1;	//store "unbiased" exponent in e.R0	  
				
				srfShiftEnableR0_out = 1'b1;
				sigAluOp_out = `SIG_ALU_OP_SUB;	//subtract the denominator from the partial remainder
				srfWriteEnableR0_out = ~sigAluNegFlag_in; //only update the partial remainder if the
														  //subtraction gave a positive result			
				srrShiftIn_out = ~sigAluNegFlag_in;
				srrShiftEnable_out = 1'b1;	
				
				firstIterSign_val = sigAluNegFlag_in; //store the sign from this iteration
				
				iterationCounter_val = iterationCounter + 5'd1; //increment the iteration counter
			end
			
			STATE_DIV_SUB_EXP: begin
				nextState = STATE_DIV_ITER;
				
				expAluOp_out = `EXP_ALU_OP_SUB; //(e.R0 - e.R1)
				erfWriteEnableR0_out = 1'b1;	//store the exponent in e.R0
				
				resultSign_val = signA ^ signB;
				
				srfShiftEnableR0_out = 1'b1;
				sigAluOp_out = `SIG_ALU_OP_SUB; //subtract the denominator from the partial remainder
				srfWriteEnableR0_out = ~sigAluNegFlag_in; //only update the partial remainder if the
														  //subtraction gave a positive result			
				srrShiftEnable_out = 1'b1;											  
				srrShiftIn_out = ~sigAluNegFlag_in;
				
				iterationCounter_val = iterationCounter + 5'd1; //increment the iteration counter
			end
			
			STATE_DIV_ITER: begin
				//determine nextState
				nextState = (iterationCounter >= 25) ? STATE_NORM_DIV_SQRT : STATE_DIV_ITER;
				
				srfShiftEnableR0_out = 1'b1;
				sigAluOp_out = `SIG_ALU_OP_SUB; //subtract the denominator from the partial remainder
				srfWriteEnableR0_out = ~sigAluNegFlag_in; //only update the partial remainder if the
														  //subtraction gave a positive result			
				srrShiftEnable_out = 1'b1;
				srrShiftIn_out = ~sigAluNegFlag_in;
				
				iterationCounter_val = iterationCounter + 5'd1; //increment the iteration counter
			end
	//--------DIV STATES END


	//--------INT2FP STATES BEGIN
			STATE_I2FP_TEST_SIGN: begin
			   nextState = (sigAluNegFlag_in) ? STATE_I2FP_NEGATE : STATE_I2FP_CLZ ;
			   
			   sigAluOp_out = `SIG_ALU_OP_MOVA; //move the integer through the significand ALU,
			   									//in order to trigger the neg.flag
			end
			STATE_I2FP_NEGATE: begin
			   nextState = STATE_I2FP_CLZ;
			   
			   srfReadSelectB_out = `SRF_REG_R0; //output srf.R0 on srf.portB
			   sigAluOp_out = `SIG_ALU_OP_NEGB; //negate the integer, in order to convert it to sign-magnitude
			   srfWriteEnableR0_out = 1'b1;		//store the negated integer in srf.R0
			   resultSign_val = 1'b1; 			//assert a negative sign bit
			end
			STATE_I2FP_CLZ: begin
				nextState = STATE_I2FP_ADJ1; 
				sigAluOp_out = `SIG_ALU_OP_CLZ; //perform CLZ on input value
				srfWriteEnableR1_out = 1'b1;	//store #LZ in srf.R1		  
				srrWriteEnable_out = 1'b1; 		//store #LZ in SRR in order to make it available to expALU
			end
			STATE_I2FP_ADJ1: begin
				nextState = STATE_I2FP_ADJ2;  
				
				erfReadSelectA_out = `ERF_REG_I2FP;	//read (bias + 31) from constant registers
				expAluRegOrSigResult_out = 1'b1;	//read #LZ from SRR
				expAluOp_out = `EXP_ALU_OP_SUB;		//(bias + 31) - #LZ
				erfWriteEnableR0_out = 1'b1;		//store exponent result in e.R0
				
				sigAluOp_out = `SIG_ALU_OP_SHLL; //s.R0 << s.R1
				srfWriteEnableR0_out = 1'b1;	//store shifted value in s.R0
			end
			STATE_I2FP_ADJ2: begin
				nextState = STATE_ROUND; 
				
				expAluOp_out = `EXP_ALU_OP_MOVA;
				erfWriteEnableR0_out = 1'b1;
				errWriteEnable_out = 1'b1;
				
				srfReadSelectB_out = `SRF_REG_ONE;	//read 'd1 from the constant registers
				sigAluOp_out = `SIG_ALU_OP_SHRL;		//right-shift the significand to the position assumed by the round stage
				srfWriteEnableR0_out = 1'b1;		//store the shifted value in s.R0
				//srrWriteEnable_out = 1'b1;
			end
	//--------INT2FP STATES END

	//--------FP2INT STATES BEGIN
			STATE_FP2SI_UNBIAS: begin
			   nextState = STATE_FP2SI_CALC_ADJ;
			   
			   erfReadSelectB_out = `ERF_REG_BIAS;	//fetch the exponent bias from the constant registers
			   expAluOp_out = `EXP_ALU_OP_SUB;		//subtract the bias from the input exponent
			   erfWriteEnableR0_out = 1'b1; 		//store the unbiased exponent in erf.R0
			   
			   //left-shift the input significand 2 digits, in order to place it 
			   //to the far left of the register
			   srfReadSelectB_out = `SRF_REG_TWO;
			   sigAluOp_out = `SIG_ALU_OP_SHLL;
			   srfWriteEnableR0_out = 1'b1;	//store the shifted significand in srf.R0
			end
			STATE_FP2SI_CALC_ADJ: begin
			   nextState = STATE_FP2SI_PREROUND_RSH;								 
			   
			   //perform (31-true exponent)
			   erfReadSelectA_out = `ERF_REG_RPP;
			   erfReadSelectB_out = `ERF_REG_R0;
			   expAluOp_out = `EXP_ALU_OP_SUB;
			   errWriteEnable_out = 1'b1; //store the adjustment amount in ERR
			   
			end
			STATE_FP2SI_PREROUND_RSH: begin
			   //nextState = STATE_FP2SI_PREROUND_RSH;						  
			   
			   //right-shift the significand
			   sigAluRegOrExpResult_out = 1'b1; //fetch the shift amount from the ERR
			   sigAluOp_out = `SIG_ALU_OP_SHRL; 
			   srfWriteEnableR0_out = 1'b1;										  
			   
			   //TEMP!
			   nextState = STATE_FP2SI_NEGATE; //no rounding yet...
			   
			end
			STATE_FP2SI_ROUND: begin
				nextState = STATE_FP2SI_POSTROUND_RSH;
				
			end
			STATE_FP2SI_POSTROUND_RSH: begin
				nextState = STATE_FP2SI_NEGATE;
				
			end	   
			STATE_FP2SI_NEGATE: begin
			    nextState = STATE_EMIT_RESULT;
				
				srfReadSelectA_out = `SRF_REG_R0; //read the integer from srf.R0
				srfReadSelectB_out = `SRF_REG_R0; //read the integer from srf.R0
				sigAluOp_out = (signA) ?  `SIG_ALU_OP_NEGB : `SIG_ALU_OP_MOVA; //either move or negate the integer 
				srrWriteEnable_out = 1'b1; //write the final integer to SRR
			end
	//--------FP2INT STATES END
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//--------POST-PROCESS STATES BEGIN	
			STATE_CLZ: begin
				nextState = STATE_NORMALIZE_CALC_ADJ; 
				
				//add one to the exponent, in order to maintain the correct value
				expAluOp_out = `EXP_ALU_OP_ADD;
				erfReadSelectB_out = `ERF_REG_ONE; 	//read 'd1 from ERF
				erfWriteEnableR0_out = 1'b1;//write back addition result to e.R0
				
				sigAluOp_out = `SIG_ALU_OP_CLZ;
				srfWriteEnableR1_out = 1'b1; //write back CLZ result to s.R1
			end	 
			STATE_NORMALIZE_CALC_ADJ: begin
				nextState = STATE_NORMALIZE_GENERIC;   
				
				//calculate the required significand shift amount
				srfWriteEnableR1_out = 1'b1; //store #LZ-1 result in s.R1
				srfReadSelectA_out = `SRF_REG_R1; //read #LZ from s.R1
				srfReadSelectB_out = `SRF_REG_ONE; //read 'd1 from constant registers
				sigAluOp_out = `SIG_ALU_OP_SUB;
				srrWriteEnable_out = 1'b1;	 //store #LZ-1 result in SRR
		    end 
	 		STATE_NORMALIZE_GENERIC: begin
				nextState = STATE_ROUND;  
				
				expAluRegOrSigResult_out = 1'b1; //read #LZ-1 from SRR
				expAluOp_out = `EXP_ALU_OP_SUB;	 //subtract (#LZ-1) from the current exponent
				erfWriteEnableR0_out = 1'b1;	//write back normalized exponent to e.R0
				
				sigAluOp_out = `SIG_ALU_OP_SHLL; //left-shift the significand, in order to normalize it				
				srfWriteEnableR0_out = 1'b1;	//write back normalized significand to s.R0
			end
			STATE_MUL_NORM0: begin
				nextState = STATE_ROUND;
				
				//the significand is already normalized, but the exponent must be incremented by one 
				erfWriteEnableR0_out = 1'b1; //write back normalized exp to e.R0
				erfReadSelectB_out = `ERF_REG_ONE; //read 'd1 from the constant registers
				expAluOp_out = `EXP_ALU_OP_ADD;
				
				srfWriteEnableR0_out = 1'b1; //write back normalized frac to s.R0	
				srfReadSelectB_out = `SRF_REG_ONE; //read 'd1 from the constant registers
				sigAluOp_out = `SIG_ALU_OP_SHRL;
				
			end				  
			STATE_MUL_NORM1: begin
				nextState = STATE_ROUND;
				//do nothing
			end
			STATE_NORM_DIV_SQRT: begin
				if (firstIterSign) begin //answer is 0.5xxxx...
					erfWriteEnableR0_out = 1'b1;
					erfReadSelectB_out = `ERF_REG_ONE; //read 'd1 from constant register
					expAluOp_out = `EXP_ALU_OP_SUB;								 
					
					srfReadSelectB_out = `SRF_REG_SIX; //read 'd2 from the constant registers
					sigAluSrr_out = 1'b1; //feed SRR back to the sigALU
					sigAluOp_out = `SIG_ALU_OP_SHLL; //shift the leading one to the place expected by the round unit
					srfWriteEnableR0_out = 1'b1; //store the normalized fraction in s.R0
				end else begin				  
					expAluOp_out = `EXP_ALU_OP_MOVA; //keep the current exponent, no need to adjust
				
					srfReadSelectB_out = `SRF_REG_FIVE; //read 'd1 from the constant registers
					sigAluSrr_out = 1'b1; //feed SRR back to the sigALU
					sigAluOp_out = `SIG_ALU_OP_SHLL; //shift the leading one to the place expected by the round unit
					srfWriteEnableR0_out = 1'b1; //store the normalized fraction in s.R0
				end
				
				nextState = STATE_ROUND;			
			end					  
			STATE_ROUND: begin
				nextState = STATE_EMIT_RESULT;	//default next state, might be different... 
				
				//no rounding
				/*expAluOp_out = `EXP_ALU_OP_MOVA;
				sigAluOp_out = `SIG_ALU_OP_MOVA;
				errWriteEnable_out = 1'b1;
				srrWriteEnable_out = 1'b1;*/
				
				
				case (roundingMode)
					`ROUNDING_MODE_NEAREST_EVEN: begin
						$display("Round towards nearest even: not yet implemented");	
					end
					`ROUNDING_MODE_POS_INF: begin
						//$display("(g,r,s): (%b,%b,%b)", guardBit_in, roundBit_in, stickyBit);
						if ((~resultSign) & (guardBit_in | roundBit_in | stickyBit)) begin	
							//$display("->+Inf:Adding ULP");
							expAluOp_out = `EXP_ALU_OP_MOVA;
							srfReadSelectB_out = `SRF_REG_ULP_ROUND; //read ULP ('d128) from constant registers
							sigAluOp_out = `SIG_ALU_OP_ADD;
						end else begin
							//No rounding needed, just forward
							expAluOp_out = `EXP_ALU_OP_MOVA;
							sigAluOp_out = `SIG_ALU_OP_MOVA;
						end
					end
					`ROUNDING_MODE_NEG_INF: begin
						if ((resultSign) & (guardBit_in | roundBit_in | stickyBit)) begin
							//rounding needed, add ULP	
							expAluOp_out = `EXP_ALU_OP_MOVA;
							srfReadSelectB_out = `SRF_REG_ULP_ROUND; //read ULP ('d128) from constant registers
							sigAluOp_out = `SIG_ALU_OP_ADD;
						end else begin
							//No rounding needed, just forward
							expAluOp_out = `EXP_ALU_OP_MOVA;
							sigAluOp_out = `SIG_ALU_OP_MOVA;
						end
					end
					`ROUNDING_MODE_TRUNCATE: begin
						expAluOp_out = `EXP_ALU_OP_MOVA;
						sigAluOp_out = `SIG_ALU_OP_MOVA;
					end
				endcase	   
				
				//generate next state, based on the MSB of the significand calculation
				if (sigAluNegFlag_in == 1'b1) begin
					nextState = STATE_POST_ROUND_NORM;
					srfWriteEnableR0_out = 1'b1; //write rounded significand back to s.R0
				end else begin
					nextState = STATE_EMIT_RESULT;	 
					errWriteEnable_out = 1'b1;
					srrWriteEnable_out = 1'b1;
				end	
			end		
			STATE_POST_ROUND_NORM: begin
				nextState = STATE_EMIT_RESULT;	
				
				//TODO
				expAluOp_out = `EXP_ALU_OP_MOVA;
				errWriteEnable_out = 1'b1;
				sigAluOp_out = `SIG_ALU_OP_MOVA;
				srrWriteEnable_out = 1'b1;
			end
		//output states
			STATE_EMIT_RESULT: begin   			 			
				//operation finished, flag result ready
				resultReady_out = 1'b1;
				nextState = STATE_IDLE;	
				
				outputFPResult_out = ~(fpuOpCode == `FPU_INSTR_FP2SI);
			end	  			 
			STATE_EMIT_ZERO: begin
				erfReadSelectA_out = `ERF_REG_ZERO; //move 'd0 through the ALU
				expAluOp_out = `EXP_ALU_OP_MOVA;  
				errWriteEnable_out = 1'b1; //update the result register
				
				srfReadSelectA_out = `SRF_REG_ZERO; //move 'd0 through the ALU
				sigAluOp_out = `SIG_ALU_OP_MOVA;
				srrWriteEnable_out = 1'b1; //update the result register
				
				nextState = STATE_IDLE;
			end
			STATE_EMIT_INF: begin
				//$display("Emitting Inf");
				erfReadSelectA_out = `ERF_REG_ONES; //move 'b11111111 through the ALU
				expAluOp_out = `EXP_ALU_OP_MOVA;  
				errWriteEnable_out = 1'b1; //update the result register
				
				srfReadSelectA_out = `SRF_REG_ZERO; //move 'd
				sigAluOp_out = `SIG_ALU_OP_MOVA;
				srrWriteEnable_out = 1'b1; //update the result register
				
				nextState = STATE_IDLE;
			end
			STATE_EMIT_NAN: begin	
				//$display("Emitting NaN");
				erfReadSelectA_out = `ERF_REG_ONES; //move 'b11111111 through the ALU
				expAluOp_out = `EXP_ALU_OP_MOVA;  
				errWriteEnable_out = 1'b1; //update the result register
				
				srfReadSelectA_out = `SRF_REG_NANSIG; //move 'd
				sigAluOp_out = `SIG_ALU_OP_MOVA;
				srrWriteEnable_out = 1'b1; //update the result register
				
				nextState = STATE_IDLE;
			end
			
			
//--------POST PROCESS STATES END

			default: begin
				//$display("Control Unit: illegal state reached!");
				nextState = STATE_IDLE;	
			end
		endcase		
	end
	
	

//synchronous block
	always @(posedge clk_in) begin
		if (reset_in == 1'b1) begin //synchronous reset
			//reset state register
			currentState = STATE_IDLE; 
			
			//reset registers
			fpuOpCode	= 4'bx;
			roundingMode= 2'bx;
			signA		= 1'bx;
			signB		= 1'bx;
			isZeroA		= 1'bx;
			isZeroB	 	= 1'bx;
			isInfA		= 1'bx;
			isInfB		= 1'bx;
			isNanA		= 1'bx;
			isNanB		= 1'bx;
			isDenormA	= 1'bx;
			isDenormB	= 1'bx;
			stickyBit	= 1'b0;
			resultSign  = 1'b0;
			iterationCounter		= 5'd0;	
			firstIterSign			= 1'b0;	
			invalidOperationDetected= 1'b0;
			divisionByZeroDetected	= 1'b0;
			overflowDetected		= 1'b0;
			underflowDetected		= 1'b0;
			inexactDetected 		= 1'b0;
			
		end else begin					
			//update state register
			currentState = nextState;	  
			
			//update internal registers
			fpuOpCode	= fpuOpCode_val;
			roundingMode= roundingMode_val;
			signA		= signA_val;
			signB		= signB_val;
			isZeroA		= isZeroA_val;
			isZeroB	 	= isZeroB_val;
			isInfA		= isInfA_val;
			isInfB		= isInfB_val;
			isNanA		= isNanA_val;
			isNanB		= isNanB_val;
			isDenormA	= isDenormA_val;
			isDenormB	= isDenormB_val;	
			stickyBit	= stickyBit_val;	
			resultSign  = resultSign_val;
			iterationCounter		= iterationCounter_val;  
			firstIterSign	 		= firstIterSign_val;
			invalidOperationDetected= invalidOperationDetected_val;
			divisionByZeroDetected	= divisionByZeroDetected_val;
			overflowDetected		= overflowDetected_val;
			underflowDetected		= underflowDetected_val;
			inexactDetected 		= inexactDetected_val;
		end
	end	
endmodule 

