`timescale 1ns/1ps

`include "global.v"

module SignificandALU(aluOpCode_in, aluOpA_in, aluOpB_in, aluNegFlag_out, aluZeroFlag_out, aluResult_out);
	input [3:0] aluOpCode_in;
	input [31:0] aluOpA_in, aluOpB_in; //32 bit
	output reg aluNegFlag_out;
	output aluZeroFlag_out;
	output [31:0] aluResult_out; //32 bit
	
	reg signed [31:0] aluResult; //32 bit
	
	assign aluResult_out = aluResult;
	assign aluZeroFlag_out	= (aluResult == 32'b0) ? 1'b1 : 1'b0;
	
	always @(aluOpCode_in, aluOpA_in, aluOpB_in) begin
		//default outputs
		aluResult 	= 32'b0;
		aluNegFlag_out = aluOpA_in[31];
		
		case (aluOpCode_in)
			`SIG_ALU_OP_NOP:	aluResult = 32'b0;
			`SIG_ALU_OP_MOVA:	aluResult =  aluOpA_in;
			`SIG_ALU_OP_NEGB:	aluResult = -aluOpB_in;
			`SIG_ALU_OP_ADD:	{aluNegFlag_out, aluResult} =  {aluOpA_in[31], aluOpA_in} + {aluOpB_in[31], aluOpB_in};
			`SIG_ALU_OP_SUB:	{aluNegFlag_out, aluResult} =  {aluOpA_in[31], aluOpA_in} - {aluOpB_in[31], aluOpB_in};
			`SIG_ALU_OP_SHRA: begin
				aluResult =  aluOpA_in;
				if (aluOpB_in[0]) aluResult = aluResult >>> 1;
				if (aluOpB_in[1]) aluResult = aluResult >>> 2;
				if (aluOpB_in[2]) aluResult = aluResult >>> 4;
				if (aluOpB_in[3]) aluResult = aluResult >>> 8;
				if (aluOpB_in[4]) aluResult = aluResult >>> 16;
			end				
			`SIG_ALU_OP_SHRL: begin
				aluResult =  aluOpA_in;
				if (aluOpB_in[0]) aluResult = aluResult >> 1;
				if (aluOpB_in[1]) aluResult = aluResult >> 2;
				if (aluOpB_in[2]) aluResult = aluResult >> 4;
				if (aluOpB_in[3]) aluResult = aluResult >> 8;
				if (aluOpB_in[4]) aluResult = aluResult >> 16;
			end			
			`SIG_ALU_OP_SHLL: begin
				aluResult = aluOpA_in;
				if (aluOpB_in[0]) aluResult = aluResult << 1;
				if (aluOpB_in[1]) aluResult = aluResult << 2;
				if (aluOpB_in[2]) aluResult = aluResult << 4;
				if (aluOpB_in[3]) aluResult = aluResult << 8;
				if (aluOpB_in[4]) aluResult = aluResult << 16;
			end
			
			`SIG_ALU_OP_CLZ:	aluResult =  {26'b0, CLZ(aluOpA_in)};
			default: begin
				//$display("Significand ALU: Undefined ALU OpCode!");
			end
		endcase
	end
	
	
	function [5:0] CLZ;
			input [31:0] val32;
			reg [15:0] val16;
			reg [7:0] val8;
			reg [3:0] val4;
			reg [1:0] val2;	   
			reg [4:0] result;
		begin
			result[4]	= (val32[31:16] == 16'b0);
			val16		= (result[4]) ? val32[15:0] : val32[31:16];
			
			result[3]	= (val16[15:8] == 8'b0);
			val8		= (result[3]) ? val16[7:0] : val16[15:8];
			
			result[2]	= (val8[7:4] == 4'b0);
			val4		= (result[2]) ? val8[3:0] : val8[7:4];
			
			result[1]	= (val4[3:2] == 2'b0);
			val2		= (result[1]) ? val4[1:0] : val4[3:2];
			
			result[0]	= (val2[1] == 1'b0);
			
			//handle special case of input = 0
			CLZ = ((result == 5'd31) && (val2[0] == 1'b0)) ? 6'd32 : {1'b0, result};		
		end
	endfunction
	
endmodule
