`timescale 1ns/1ps

`include "global.v"

module MaskAndShift(maskAndShiftSelect_in, operandA_in, operandB_in, operandA_out, operandB_out);
	input [1:0] maskAndShiftSelect_in;
	input [`FORMAT_FRAC_WIDTH:0] operandA_in, operandB_in; //23:0
	output reg [15:0] operandA_out, operandB_out; //15:0
	
	always @(maskAndShiftSelect_in, operandA_in, operandB_in) begin
		case (maskAndShiftSelect_in)
			`MASK_AND_SHIFT_A8C8: begin
				operandA_out <= {8'b0, operandA_in[23:16]};
				operandB_out <=	{8'b0, operandB_in[23:16]};
			end
			
			`MASK_AND_SHIFT_A8D16: begin
				operandA_out <= {8'b0, operandA_in[23:16]};
				operandB_out <=	operandB_in[15:0];
			end
			
			`MASK_AND_SHIFT_B16C8: begin
				operandA_out <= {operandA_in[15:0]};	
				operandB_out <= {8'b0, operandB_in[23:16]};
			end
			
			`MASK_AND_SHIFT_B16D16: begin
				operandA_out <= operandA_in[15:0];
				operandB_out <=	operandB_in[15:0];
			end
		endcase
	end
endmodule
