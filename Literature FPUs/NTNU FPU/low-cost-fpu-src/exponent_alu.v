`timescale 1ns/1ps

`include "global.v"

module ExponentALU(aluOpCode_in, aluOpA_in, aluOpB_in, aluNegFlag_out, aluZeroFlag_out, aluResult_out);
	input [2:0] aluOpCode_in;
	input [`FORMAT_EXP_WIDTH:0] aluOpA_in, aluOpB_in; // 9 bit
	output aluNegFlag_out, aluZeroFlag_out;
	output [`FORMAT_EXP_WIDTH:0] aluResult_out; // 9 bit
	
	reg [`FORMAT_EXP_WIDTH:0] aluResult; //9 bit
	
	assign aluResult_out = aluResult;
	assign aluNegFlag_out	= (aluResult[`FORMAT_EXP_WIDTH] == 1'b1 ) ? 1'b1 : 1'b0;
	assign aluZeroFlag_out	= (aluResult == 9'b0) ? 1'b1 : 1'b0;
	
	
	always @(aluOpCode_in, aluOpA_in, aluOpB_in) begin
		//default outputs
		aluResult 	= 9'bx;	
		
		case (aluOpCode_in)
			`EXP_ALU_OP_NOP:	aluResult =	 9'b0;
			`EXP_ALU_OP_MOVA:	aluResult =  aluOpA_in;
			`EXP_ALU_OP_NEGB:	aluResult = -aluOpB_in;
			`EXP_ALU_OP_ADD:	aluResult =  aluOpA_in + aluOpB_in;
			`EXP_ALU_OP_SUB:	aluResult =  aluOpA_in - aluOpB_in;
			`EXP_ALU_OP_SHL:	aluResult =  aluOpA_in << aluOpB_in;
			default: $display("Exponent ALU: Undefined ALU OpCode!");
		endcase
	end
	
endmodule 
