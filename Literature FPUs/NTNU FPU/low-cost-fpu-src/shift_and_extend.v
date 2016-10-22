`timescale 1ns/1ps

`include "global.v"

module ShiftAndExtend(shiftAndExtendSelect_in, operand_in, operand_out, stickyBit_out);
	input [1:0] shiftAndExtendSelect_in;
	input [31:0] operand_in;
	output reg [31:0] operand_out; //32 bits
	output reg stickyBit_out;
	
	always @(shiftAndExtendSelect_in, operand_in) begin
		stickyBit_out = 1'b0;
		case (shiftAndExtendSelect_in)
			`SHIFT_16_BIT_AND_EXTEND:	operand_out <= {operand_in[15:0], 16'b0};
			`SHIFT_0_BIT_AND_EXTEND:	operand_out <= {8'b0, operand_in[23:0]};
			`SHIFT_TRUNC_AND_EXTEND: begin
				operand_out <= {16'b0, operand_in[31:16]};
				stickyBit_out <= |(operand_in[15:0]);
			end
			default: begin
				operand_out <= 32'b0;
				//$display("Invalid Shift-And-Extend opcode!");
			end
		endcase		
	end	
endmodule
