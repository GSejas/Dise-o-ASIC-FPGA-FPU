`timescale 1ns/1ps

`include "../global.v"

module FPU_top_exception_tb();
	reg clk, reset; 	  
	reg [3:0] opCode;
	reg [1:0] roundingMode;
	reg [31:0] A;
	reg [31:0] B;	   
	reg [31:0] ER; //expected result
  
	wire resultReady;
	wire [31:0] result; 
	wire invalidOperation, divisionByZero, overflow, underflow, inexact;
	
	reg [31:0] PINF;
	reg [31:0] NINF;
	reg [31:0] NAN;
	reg [31:0] PZERO;
	reg [31:0] NZERO;
  
	//instantiate DUT
	FPU_top DUT(clk, reset, opCode, roundingMode, A, B, resultReady, result, 
				invalidOperation, divisionByZero, overflow, underflow, inexact);
  
  
	//clock
	parameter HCP = 10;
	initial forever begin
	  #HCP clk =  ~clk; 
	end		
	
	
	
	initial begin  
		PINF = 32'h7F800000;
		NINF = 32'hFF800000;
		NAN = 32'h7FC00000;
		PZERO = 32'h00000000;
		NZERO = 32'h80000000;
		
	    clk = 1'b0;
	    reset = 1'b1; 
		roundingMode = `ROUNDING_MODE_TRUNCATE;
		
		$display("---------------- Exception testbench ----------------");
		$display("\tTesting Invalid Operations.....");
		$display("\t\t 0*Inf"); runSingleTest(`FPU_INSTR_MUL, PZERO, PINF, NAN);
		$display("\t\t Inf*0"); runSingleTest(`FPU_INSTR_MUL, PINF, PZERO, NAN);	  
		$display("\t\t +Inf + -Inf"); runSingleTest(`FPU_INSTR_ADD, PINF, NINF, NAN);
		$display("\t\t -Inf + +Inf"); runSingleTest(`FPU_INSTR_ADD, NINF, PINF, NAN);
		$display("\t\t +Inf - +Inf"); runSingleTest(`FPU_INSTR_SUB, PINF, PINF, NAN);
		$display("\t\t -Inf - -Inf"); runSingleTest(`FPU_INSTR_SUB, NINF, NINF, NAN);
		$display("\t\t 0 / 0"); runSingleTest(`FPU_INSTR_DIV, PZERO, PZERO, NAN);
		$display("\t\t Inf / Inf"); runSingleTest(`FPU_INSTR_DIV, PINF, PINF, NAN);
		
		$display("----------------");
		$display("\tTesting Division-by-Zero.....");
		$display("\t\t  5.0f / +0"); runSingleTest(`FPU_INSTR_DIV, 32'h40A00000, PZERO, PINF);
		$display("\t\t -5.0f / +0"); runSingleTest(`FPU_INSTR_DIV, 32'hC0A00000, PZERO, NINF);
		$display("\t\t  5.0f / -0"); runSingleTest(`FPU_INSTR_DIV, 32'h40A00000, NZERO, NINF);
		$display("\t\t -5.0f / -0"); runSingleTest(`FPU_INSTR_DIV, 32'hC0A00000, NZERO, PINF);

		$display("----------------"); 
		#20
		$finish;
	end
	
	
	task runSingleTest;
		input [3:0] operation;
		input [31:0] A_in, B_in, ER_in;
	begin		
			opCode = operation;
			A = A_in;
			B = B_in;
			ER = ER_in;
	      	#(2*HCP) reset = 1'b0;
	      	@(posedge resultReady) #5;
			if (ER !== result) begin	 
				$display("Wrong result!");
				$display("A:  %b\t%x\t%b\n", A[31], A[30:23], A[22:0]);	  
				$display("B:  %b\t%x\t%b\n", B[31], B[30:23], B[22:0]);
				$display("ER: %b\t%x\t%b (%x)\n", ER[31], ER[30:23], ER[22:0], ER);
				$display("R:  %b\t%x\t%b (%x)\n", result[31], result[30:23], result[22:0], result);
			end else begin
				/*$display("Vector %d: Correct result", cnt);						  
				$display("A:  %b\t%x\t%b\n", A[31], A[30:23], A[22:0]);	  
				$display("B:  %b\t%x\t%b\n", B[31], B[30:23], B[22:0]);
				$display("ER: %b\t%x\t%b\n", ER[31], ER[30:23], ER[22:0]);
				$display("R:  %b\t%x\t%b\n", result[31], result[30:23], result[22:0]);*/
			end											
			reset = 1'b1; 	  	
	  end
  endtask
endmodule
