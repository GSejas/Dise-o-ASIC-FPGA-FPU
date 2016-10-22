`timescale 1ns/1ps

`include "../global.v"

module FPU_top_fp2si_tb();
	reg clk, reset; 	  
	reg [3:0] opCode;
	reg [1:0] roundingMode;
	reg [31:0] A;
	reg [31:0] B;	   
	reg [31:0] ER; //expected result
  
	wire resultReady;
	wire [31:0] result;  	
	wire invalidOperation, divisionByZero, overflow, underflow, inexact;
	
	integer file;
	
	//instantiate DUT
	FPU_top DUT(clk, reset, opCode, roundingMode, A, B, resultReady, result,
				invalidOperation, divisionByZero, overflow, underflow, inexact);
   
	//clock
	parameter HCP = 10;
	initial forever begin
	  #HCP clk =  ~clk; 
	end		
	
	initial begin  	
	    clk = 1'b0;
	    reset = 1'b1;
					
		$display("---------------- Float->Signed Int automatic testbench ----------------");
		opCode = `FPU_INSTR_FP2SI;
		roundingMode = `ROUNDING_MODE_TRUNCATE;
		
		file = $fopen("test/fp2si/trunc/fp2si-vectors.txt", "r"); runSingleFile(file, 2);
		
		#10 $finish;
	end	

	task runSingleFile;
		input integer file;
		input integer vectorCount;
  		integer status, cnt, errorCount;
	begin
		cnt = 0;
		errorCount = 0;
		while (cnt < vectorCount) begin
			status = $fscanf(file, "%x\t%x\n", A[31:0], ER[31:0]);
	      	#(2*HCP) reset = 1'b0;
	      	@(posedge resultReady) #1;
			if (ER !== result) begin	 
				$display("Vector %d: Wrong result!", cnt);
				$display("A:  %b\t%x\t%b\n", A[31], A[30:23], A[22:0]);	  
				$display("ER: %d\n", ER);
				$display("R:  %d\n", result);
				errorCount = errorCount + 1;
			end else begin
				$display("Vector %d: Correct result", cnt);						  
				$display("A:  %b\t%x\t%b\n", A[31], A[30:23], A[22:0]);	  
				$display("ER: %d\n", ER);
				$display("R:  %d\n", result);
			end											
			reset = 1'b1; 
			cnt = cnt + 1;
	  	end		   
	  	$display("Finished, %d vectors simulated, %d error(s)", cnt, errorCount);
	    $fclose(file);
	  end
  endtask

endmodule
