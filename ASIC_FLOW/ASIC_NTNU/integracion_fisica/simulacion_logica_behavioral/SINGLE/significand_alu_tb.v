`timescale 1ns/1ps

`include "../global.v"

module SignificanALU_tb();
	reg clk;
	reg [31:9] aluOp;
	reg [31:0] opA, opB;
	wire negFlag, zeroFlag;
	wire [31:0] result;		
	
	SignificandALU DUT(aluOp, opA, opB, negFlag, zeroFlag, result);
	
	initial forever begin
		#10 clk = ~clk;
	end				   
	
	initial begin
		clk = 0;
		aluOp =	`SIG_ALU_OP_NEGB;
		opA = 32'h00AABBCC;
		opB = 32'h00000002;	
		
		@(posedge clk) aluOp = `SIG_ALU_OP_ADD;
			
		@(posedge clk) aluOp = `SIG_ALU_OP_SUB;
			
		@(posedge clk) aluOp = `SIG_ALU_OP_SHRA;
		
		@(posedge clk) aluOp = `SIG_ALU_OP_SHRL;
		
		@(posedge clk) aluOp = `SIG_ALU_OP_SHLL;
			
		@(posedge clk) aluOp = `SIG_ALU_OP_CLZ;	
		
		#20 $finish;
		
	end
endmodule
