`timescale 1ns/1ps

// Behavioral model of a 16x16 integer multiplier, two-stage pipeline, 32 bit result
module ExternalMul16x16(clk_in, reset_in, mulEnable, operandA_in, operandB_in, product_out);
	input clk_in, reset_in, mulEnable;
	input [15:0] operandA_in, operandB_in;
	output[31:0] product_out;
	
	reg [31:0] delay_reg, product_reg;
	
	assign product_out = product_reg;
	
	always @(posedge clk_in) begin
		if (reset_in == 1'b1) begin
			delay_reg	<= 32'b0;
			product_reg <= 32'b0;
		end else begin
			if (mulEnable) begin
				delay_reg	<= operandA_in * operandB_in;
				product_reg	<= delay_reg;
			end	else begin
				delay_reg <= delay_reg;
				product_reg <= product_reg;
			end
		end
	end
	
endmodule 
