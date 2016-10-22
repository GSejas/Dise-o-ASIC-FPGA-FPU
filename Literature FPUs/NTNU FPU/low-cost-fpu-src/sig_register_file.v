`timescale 1ns/1ps

`include "global.v"

module SigRegisterFile(clk_in, reset_in, writeEnableR0_in, writeEnableR1_in, writeValueR0_in, writeValueR1_in,
						 shiftEnableR0_in, 
						 readSelectA_in, readSelectB_in,  readResultA_out, readResultB_out); 

	//default register width						 	
	parameter REGISTER_WIDTH = 'd32; 
	
	//default constant register contents
	parameter CONST0_VALUE = 32'd0;	 //zero - required for exception handling
	parameter CONST1_VALUE = 32'd1;	 //one - required!
	parameter CONST2_VALUE = 32'd2;	 //two - required!
	parameter CONST3_VALUE = 32'd128;//ULP for rounding - required!
	parameter CONST4_VALUE = 32'd127;//BIAS - required!
	parameter CONST5_VALUE = 32'd5;	 //used for normalization of div/sqrt	
	parameter CONST6_VALUE = 32'd6;	 //used for normalization of div/sqrt
	parameter CONST7_VALUE = 32'h20000000; //significand value corresponding to a NaN result
	parameter CONST8_VALUE = 32'hffffffff; //all ones

//PORTS
	input clk_in, reset_in;
	input writeEnableR0_in, writeEnableR1_in;
	input [REGISTER_WIDTH-1:0] writeValueR0_in, writeValueR1_in;
	input shiftEnableR0_in;
	input [3:0] readSelectA_in, readSelectB_in;
	output reg [REGISTER_WIDTH-1:0] readResultA_out, readResultB_out;

//INTERNAL REGISTERS		  
	//GPR
	reg [REGISTER_WIDTH-1:0] reg0, reg1;	
	
	always @(readSelectA_in, readSelectB_in, reg0, reg1) begin
		case (readSelectA_in)
			4'b0000: readResultA_out = reg0;
			4'b0001: readResultA_out = reg1;
			4'b0010: readResultA_out = CONST0_VALUE;
			4'b0011: readResultA_out = CONST1_VALUE;
			4'b0100: readResultA_out = CONST2_VALUE;
			4'b0101: readResultA_out = CONST3_VALUE;
			4'b0110: readResultA_out = CONST4_VALUE;
			4'b0111: readResultA_out = CONST5_VALUE;
			4'b1000: readResultA_out = CONST6_VALUE; 
			4'b1001: readResultA_out = CONST7_VALUE; 
			4'b1111: readResultA_out = CONST8_VALUE; 
			default: begin
				$display("SRF: Undefined register port");
				readResultA_out = 0;
			end
		endcase
		
		case (readSelectB_in)
			4'b0000: readResultB_out = reg0;
			4'b0001: readResultB_out = reg1;
			4'b0010: readResultB_out = CONST0_VALUE;
			4'b0011: readResultB_out = CONST1_VALUE;
			4'b0100: readResultB_out = CONST2_VALUE;
			4'b0101: readResultB_out = CONST3_VALUE;
			4'b0110: readResultB_out = CONST4_VALUE;
			4'b0111: readResultB_out = CONST5_VALUE;
			4'b1000: readResultB_out = CONST6_VALUE;
			4'b1001: readResultB_out = CONST7_VALUE; 
			4'b1111: readResultB_out = CONST8_VALUE; 
			default: begin
				$display("SRF: Undefined register port");
				readResultB_out = 0;
			end
		endcase
	end
	
	
	always @(posedge clk_in) begin
		if (reset_in == 1'b1) begin // reset registers?
			reg0 <= 0;
			reg1 <= 0;			
		end else begin 						   
			//update reg0?
			if (writeEnableR0_in) reg0 = writeValueR0_in;
				
			if (shiftEnableR0_in) reg0 = reg0 << 1;
				
			 //update reg1?
			if (writeEnableR1_in == 1'b1) reg1 <= writeValueR1_in;
		end		
	end

endmodule
