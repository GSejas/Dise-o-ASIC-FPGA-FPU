`timescale 1ns/1ps

`include "../global.v"

module ExpRegisterFile_tb();
	
	parameter HCP = 10; //half clock period
	
	reg clk, reset;		 
	
	reg writeEnableA, writeEnableB;
	reg [8:0] writeValueA, writeValueB;	   
	
	reg [2:0] readSelectA, readSelectB;
	wire [8:0] readResultA, readResultB;
	
	
	defparam DUT.REGISTER_WIDTH = 9;
	RegisterFile DUT(clk, reset, writeEnableA, writeEnableB, writeValueA, writeValueB, readSelectA, readSelectB, readResultA, readResultB);
	
	
	initial forever begin
		#HCP clk = ~clk;	
	end	  
	
	
	initial begin
		clk = 0;
		reset = 1;	  
		
		writeEnableA = 1'b1;
		writeEnableB = 1'b0;
		writeValueA = 9'h0AA;
		writeValueB = 9'h0EE;
		
		readSelectA = 3'b000;
		readSelectB = 3'b001;
		
		#(2*HCP) reset = 0;	  
		
		#(2*HCP) writeEnableA = 1'b0;
		writeEnableB = 1'b1;   
		writeValueA = 9'h0EE;
		writeValueB = 9'h0BB;
		
		#(2*HCP) readSelectA = 3'b001;
		readSelectB = 3'b000;
		
		#(2*HCP) readSelectA = 3'b010;
		readSelectB = 3'b011;
		
		#(2*HCP) readSelectA = 3'b100;
		readSelectB = 3'b101;
		
		#(2*HCP) readSelectA = 3'b110;
		readSelectB = 3'b111;
				
	end
endmodule
