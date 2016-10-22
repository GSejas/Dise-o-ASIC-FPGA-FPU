`timescale 1ns/1ps

`include "global.v"

module fpu_top(clk_in, reset_in, fpuOpCode_in, roundingMode_in, operandA_in, operandB_in, resultReady_out, result_out,
			   invalidOperation_out, divisionByZero_out, overflow_out, underflow_out, inexact_out);
	// I/O PORTS
	input clk_in, reset_in;	 
	input [3:0] fpuOpCode_in;
	input [1:0] roundingMode_in;
	input [31:0] operandA_in, operandB_in;
	output resultReady_out;
	output [31:0] result_out;																	 
	//exception flags
	output invalidOperation_out, divisionByZero_out, overflow_out, underflow_out, inexact_out;
	
	// INTERNAL REGISTERS		
	reg [8:0] expAluResultRegister; //9 bit
	reg [31:0] sigAluResultRegister; //31 bit													
	
	//WIRES	  	
		//input control
		wire readFPInput; //mux between integer and floating-point input
		wire [31:0] trueInputA;
		
		//SVD output
			//to control unit
			wire signA, signB, isZeroA, isZeroB, isInfA, isInfB, isNanA, isNanB, isDenormA, isDenormB;
			//data
			wire [32:0] operandAExpanded, operandBExpanded;
	
		//exp ALU register file		  
			//control
			wire erfWriteSelectR0, erfWriteSelectR1;
			wire erfWriteEnableR0, erfWriteEnableR1;
			wire [2:0] erfReadSelectA, erfReadSelectB;
			//data
			wire [8:0] erfWriteValueR0, erfWriteValueR1; // 9 bit
			wire [8:0] erfReadValueA, erfReadValueB; // 9 bit
			
		//exp ALU connections	  
			//control	 
			wire expAluRegOrSigResult;
			wire [2:0] expAluOpCode; 
			wire errWriteEnable;
			//data					
			wire expAluNegFlag, expAluZeroFlag;
			wire [8:0] expAluOpA, expAluOpB;
			wire [8:0] expAluResult;
	
		//large ALU register file
			//control
			wire srfWriteSelectR0, srfWriteSelectR1;
			wire srfWriteEnableR0, srfWriteEnableR1;
			wire srfShiftEnableR0;
			wire [3:0] srfReadSelectA, srfReadSelectB;										 
			//data
			wire [31:0] srfWriteValueR0, srfWriteValueR1; // 32 bit
			wire [31:0] srfReadValueA, srfReadValueB; // 32 bit
			
		//significand ALU connections	   	 
		//control 	
			wire sigAluRegOrMul, sigAluSrr, sigAluRegOrExpResult;
			wire [3:0] sigAluOpCode;
			wire srrWriteEnable, srrShiftEnable;
			//data
			wire [31:0] sigAluOpA, sigAluOpB, sigAluOpA_tmp;
			wire sigAluNegFlag, sigAluZeroFlag;
			wire [31:0] sigAluResult;  			
			wire srrShiftIn;
			
		// multiplier chain
			//control
			wire [1:0] maskAndShiftOp;	
			wire mulEnable;
			wire [1:0] shiftAndExtendOp;  
			//data
			wire [15:0] mulInputMaskedShiftedA, mulInputMaskedShiftedB;
			wire [31:0] mulResult;				 
			wire [31:0] mulResultShiftedExtended; 
			wire stickyBitData;	
			
			
		//output control
			wire outputFPResult; //mux between outputting a FP-result or an integer result
			wire resultSign;
		
	// ASSIGNMENTS																								
		assign result_out[31:0] = (outputFPResult) ? {resultSign, expAluResultRegister[7:0], sigAluResultRegister[29:7]} : 
														 	  sigAluResultRegister[31:0];
		
		//mux between input exponent and exp ALU result
		assign erfWriteValueR0 = (erfWriteSelectR0 == 1'b0) ? expAluResult : operandAExpanded[31:24];
		//mux between input exponent and exp ALU result
		assign erfWriteValueR1 = (erfWriteSelectR1 == 1'b0) ? expAluResult : operandBExpanded[31:24];
		
		//connect small register file with the small ALU
		assign expAluOpA = erfReadValueA;
		assign expAluOpB = (expAluRegOrSigResult == 1'b0) ? erfReadValueB : sigAluResultRegister[8:0];	   	
		
		//mux between integer input and floating-point input
		assign trueInputA = (readFPInput) ?  {2'b0, operandAExpanded[23:0], 6'b0} : operandA_in[31:0];
		
		//mux between input A and large ALU result
		assign srfWriteValueR0 = (srfWriteSelectR0 == 1'b0) ? sigAluResult : trueInputA; 
		//mux between input B and large ALU result
		assign srfWriteValueR1 = (srfWriteSelectR1 == 1'b0) ? sigAluResult : {2'b0, operandBExpanded[23:0], 6'b0}; 
		
		//connect large register file with the large ALU
		assign sigAluOpA_tmp = (sigAluRegOrMul) ? mulResultShiftedExtended : srfReadValueA;
		assign sigAluOpA = (sigAluSrr) ? sigAluResultRegister : sigAluOpA_tmp; 
		assign sigAluOpB = (sigAluRegOrExpResult)? expAluResultRegister		: srfReadValueB;  
		
		
	//INSTANTIATIONS	
		SVDUnit svdUnitA(operandA_in, signA, isZeroA, isInfA, isNanA, isDenormA, operandAExpanded);
		SVDUnit svdUnitB(operandB_in, signB, isZeroB, isInfB, isNanB, isDenormB, operandBExpanded);
				
		FpuControlUnit controlUnit(.clk_in(clk_in), .reset_in(reset_in), .fpuOpCode_in(fpuOpCode_in),
				.roundingMode_in(roundingMode_in), 
			.signA_in(signA), .signB_in(signB), .isZeroA_in(isZeroA), .isZeroB_in(isZeroB),
				.isInfA_in(isInfA), .isInfB_in(isInfB), .isNanA_in(isNanA), .isNanB_in(isNanB),
				.isDenormA_in(isDenormA), .isDenormB_in(isDenormB),	
			.readFPInput_out(readFPInput),
			.expAluNegFlag_in(expAluNegFlag), .expAluZeroFlag_in(expAluZeroFlag), 
			.sigAluNegFlag_in(sigAluNegFlag), .sigAluZeroFlag_in(sigAluZeroFlag),
			.guardBit_in(srfReadValueA[6]), .roundBit_in(srfReadValueA[5]), .stickyBitData_in(stickyBitData),
			.erfWriteSelectR0_out(erfWriteSelectR0), .erfWriteSelectR1_out(erfWriteSelectR1), 
				.erfWriteEnableR0_out(erfWriteEnableR0), .erfWriteEnableR1_out(erfWriteEnableR1), 
				.erfReadSelectA_out(erfReadSelectA), .erfReadSelectB_out(erfReadSelectB),
			.srfWriteSelectR0_out(srfWriteSelectR0), .srfWriteSelectR1_out(srfWriteSelectR1), 
				.srfWriteEnableR0_out(srfWriteEnableR0), .srfWriteEnableR1_out(srfWriteEnableR1), 
				.srfShiftEnableR0_out(srfShiftEnableR0), .srfReadSelectA_out(srfReadSelectA),
				.srfReadSelectB_out(srfReadSelectB),
			.expAluRegOrSigResult_out(expAluRegOrSigResult),
			.expAluOp_out(expAluOpCode), 
			.errWriteEnable_out(errWriteEnable), 
			.sigAluRegOrMul_out(sigAluRegOrMul), .sigAluSrr_out(sigAluSrr), .sigAluRegOrExpResult_out(sigAluRegOrExpResult),
			.sigAluOp_out(sigAluOpCode),
			.srrWriteEnable_out(srrWriteEnable),
			.srrShiftEnable_out(srrShiftEnable),
			.srrShiftIn_out(srrShiftIn),
			.maskAndShiftOp_out(maskAndShiftOp),
			.mulEnable_out(mulEnable),
			.shiftAndExtendOp_out(shiftAndExtendOp),
			.outputFPResult_out(outputFPResult),
			.resultSign_out(resultSign),
			.resultReady_out(resultReady_out),
			.invalidOperationDetected_out(invalidOperation_out), .divisionByZeroDetected_out(divisionByZero_out), 
			.overflowDetected_out(overflow_out), .underflowDetected_out(underflow_out), .inexactDetected_out(inexact_out)
			);
		
		ExpRegisterFile expRegisterFile(clk_in, reset_in, erfWriteEnableR0, erfWriteEnableR1, erfWriteValueR0, erfWriteValueR1,
									   erfReadSelectA, erfReadSelectB, erfReadValueA, erfReadValueB);
		
		ExponentALU expALU(expAluOpCode, expAluOpA, expAluOpB, expAluNegFlag, expAluZeroFlag, expAluResult);	  
		
		SigRegisterFile sigRegisterFile(clk_in, reset_in, srfWriteEnableR0, srfWriteEnableR1, srfWriteValueR0, srfWriteValueR1,
								   		srfShiftEnableR0, srfReadSelectA, srfReadSelectB, srfReadValueA, srfReadValueB);
		
		SignificandALU sigALU(sigAluOpCode, sigAluOpA, sigAluOpB, sigAluNegFlag, sigAluZeroFlag, sigAluResult);
		
		
		//MULTIPLIER CHAIN
		MaskAndShift maskAndShift(maskAndShiftOp, operandAExpanded[23:0], operandBExpanded[23:0],
								  mulInputMaskedShiftedA, mulInputMaskedShiftedB);
		ExternalMul16x16 externalMul(clk_in, reset_in, mulEnable, mulInputMaskedShiftedA, 
									 mulInputMaskedShiftedB, mulResult);
		ShiftAndExtend shiftAndExtend(shiftAndExtendOp, mulResult, mulResultShiftedExtended, stickyBitData);
		
		
	// SYNCHRONOUS BLOCK - <TODO: replace with register modules?>																	 
		always @(posedge clk_in) begin
			if (reset_in) begin	 
				expAluResultRegister = 0;
				sigAluResultRegister = 0; 
			end else begin										
				//update exponent result register
				if (errWriteEnable) expAluResultRegister = expAluResult; 
					
				//update significand result register
				if (srrShiftEnable) 
					sigAluResultRegister = {sigAluResultRegister[30:0], srrShiftIn}; //shift a bit into SRR
				else begin				  
					if (srrWriteEnable) sigAluResultRegister = sigAluResult;  //write ALU result into SRR
				end
			end
		end	   	
endmodule
