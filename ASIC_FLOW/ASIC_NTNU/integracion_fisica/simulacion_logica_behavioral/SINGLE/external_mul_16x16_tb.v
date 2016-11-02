`timescale 1ns/1ps

`include "../global.v"

module ExternalMul16x16_tb();
	
	parameter HCP = 10; //half clock period
	
	reg clk, reset, mulEnable;		 
	reg [15:0] opA, opB;
	wire [31:0] product;
	
	
	ExternalMul16x16 DUT(clk, reset, mulEnable, opA, opB, product);
	
	initial forever begin
		#HCP clk = ~clk;	
	end	  
	
	initial begin
		clk = 0;
		reset = 1;	
		mulEnable = 1;
		
		opA = 16'hFFFF;
		opB = 16'h10;
		
		#(2*HCP) reset = 0;
				
		
	end
endmodule
