`timescale 1ns/1ps

`include "global.v"

module ExpRegisterFile(clk_in, reset_in, writeEnableR0_in, writeEnableR1_in, writeValueR0_in, writeValueR1_in,
						 readSelectA_in, readSelectB_in,  readResultA_out, readResultB_out); 

	//default register width						 	
	parameter REGISTER_WIDTH = 'd9; 
	
	//default constant register contents
	parameter CONST0_VALUE = 9'd0;	 //zero
	parameter CONST1_VALUE = 9'd1;	 //one
	parameter CONST2_VALUE = 9'd31;	 //radix point position
	parameter CONST3_VALUE = 9'd158; //exponent const used by int2fp
	parameter CONST4_VALUE = 9'd127; //BIAS
	parameter CONST5_VALUE = 9'd511; //all ones

//PORTS
	input clk_in, reset_in;
	input writeEnableR0_in, writeEnableR1_in;
	input [REGISTER_WIDTH-1:0] writeValueR0_in, writeValueR1_in;
	input [2:0] readSelectA_in, readSelectB_in;
	output reg [REGISTER_WIDTH-1:0] readResultA_out, readResultB_out;

//INTERNAL REGISTERS		  
	//GPR
	reg [REGISTER_WIDTH-1:0] reg0, reg1;
			
	always @(readSelectA_in, readSelectB_in, reg0, reg1) begin
		case (readSelectA_in)
			3'b000: readResultA_out = reg0;
			3'b001: readResultA_out = reg1;
			3'b010: readResultA_out = CONST0_VALUE;
			3'b011: readResultA_out = CONST1_VALUE;
			3'b100: readResultA_out = CONST2_VALUE;
			3'b101: readResultA_out = CONST3_VALUE;
			3'b110: readResultA_out = CONST4_VALUE;
			3'b111: readResultA_out = CONST5_VALUE;
		endcase
		
		case (readSelectB_in)
			3'b000: readResultB_out = reg0;
			3'b001: readResultB_out = reg1;
			3'b010: readResultB_out = CONST0_VALUE;
			3'b011: readResultB_out = CONST1_VALUE;
			3'b100: readResultB_out = CONST2_VALUE;
			3'b101: readResultB_out = CONST3_VALUE;
			3'b110: readResultB_out = CONST4_VALUE;
			3'b111: readResultB_out = CONST5_VALUE;
		endcase
	end
	
	
	always @(posedge clk_in) begin
		if (reset_in) begin // reset registers?
			reg0 <= 0;
			reg1 <= 0;
		end else begin 						   
			//update reg0?
			if (writeEnableR0_in) reg0 <= writeValueR0_in;
		
			 //update reg1?
			if (writeEnableR1_in) reg1 <= writeValueR1_in;
		end		
	end
endmodule
