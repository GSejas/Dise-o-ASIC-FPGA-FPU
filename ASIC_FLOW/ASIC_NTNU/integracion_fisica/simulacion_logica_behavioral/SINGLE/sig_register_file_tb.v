`timescale 1ns/1ps

`include "../global.v"

module SigRegisterFile_tb();
	reg clk;
	reg reset;						
	reg writeEnableR0, writeEnableR1;
	reg [31:0] writeValueR0, writeValueR1;
	reg	shiftEnableR0;
	reg [3:0] readSelectA, readSelectB;
	wire [31:0] readResultA, readResultB;
	
	
	
	SigRegisterFile DUT(clk, reset, writeEnableR0, writeEnableR1, writeValueR0, writeValueR1,
						shiftEnableR0, readSelectA, readSelectB, readResultA, readResultB);
	
	initial forever begin
		#10 clk = ~clk;
	end				   
	
	initial begin
		clk = 0;   
		reset = 1;
			
		writeEnableR0 = 1'b1;
		writeEnableR1 = 1'b1;
		
		writeValueR0 = 32'h0000aaaa;
		writeValueR1 = 32'h0000bbbb;
		
		shiftEnableR0 = 1'b0;
		
		readSelectA = 3'b000;
		readSelectB = 3'b001;
		
		#20 reset = 0;
		
		@(posedge clk);
		@(posedge clk);
		writeEnableR0 = 1'b0;
		writeEnableR1 = 1'b0;
		
		shiftEnableR0 = 1'b1;
		
		@(posedge clk);
		writeEnableR0 = 1'b0;
		writeEnableR1 = 1'b0;
		
		shiftEnableR0 = 1'b0;
		
		readSelectA = 3'b010;
		readSelectB = 3'b011;
		
		#20 $finish;
		
	end
endmodule
