`timescale 1ns/1ps

`include "../global.v"

module FPU_top_tb();
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
	integer mulVectorCount = 100;
	integer addVectorCount = 100;
	integer subVectorCount = 100; 
	integer divVectorCount = 200;
  
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
		
		$display("---------------- Mul automated testbench ----------------");
		opCode = `FPU_INSTR_MUL;
		$display("Round towards zero");
		roundingMode = `ROUNDING_MODE_TRUNCATE;
			file = $fopen("test/mul/trunc/mul-vectors-p-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/trunc/mul-vectors-p-n.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/trunc/mul-vectors-n-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/trunc/mul-vectors-n-n.txt", "r"); runSingleFile(file, mulVectorCount);
		$display("Round towards +Inf");
		roundingMode = `ROUNDING_MODE_POS_INF;
			file = $fopen("test/mul/pinf/mul-vectors-p-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/pinf/mul-vectors-p-n.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/pinf/mul-vectors-n-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/pinf/mul-vectors-n-n.txt", "r"); runSingleFile(file, mulVectorCount);
		$display("Round towards -Inf");
		roundingMode = `ROUNDING_MODE_NEG_INF;
			file = $fopen("test/mul/ninf/mul-vectors-p-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/ninf/mul-vectors-p-n.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/ninf/mul-vectors-n-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/ninf/mul-vectors-n-n.txt", "r"); runSingleFile(file, mulVectorCount);
		/*$display("Round towards nearest event");
		roundingMode = `ROUNDING_MODE_NEAREST_EVEN;
			file = $fopen("test/mul/nearest/mul-vectors-p-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/nearest/mul-vectors-p-n.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/nearest/mul-vectors-n-p.txt", "r"); runSingleFile(file, mulVectorCount);
			file = $fopen("test/mul/nearest/mul-vectors-n-n.txt", "r"); runSingleFile(file, mulVectorCount);*/
			
			 
		
		$display("---------------- Add/Sub automatic testbench ----------------");		
		$display("Add:");
		opCode = `FPU_INSTR_ADD;
			$display("Round towards zero");
			roundingMode = `ROUNDING_MODE_TRUNCATE;
				file = $fopen("test/add/trunc/add-vectors-p-p.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/trunc/add-vectors-p-n.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/trunc/add-vectors-n-p.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/trunc/add-vectors-n-n.txt", "r"); runSingleFile(file, addVectorCount);
			$display("Round towards +Inf");
			roundingMode = `ROUNDING_MODE_POS_INF;
				file = $fopen("test/add/pinf/add-vectors-p-p.txt", "r");	runSingleFile(file, addVectorCount);
				file = $fopen("test/add/pinf/add-vectors-p-n.txt", "r");	runSingleFile(file, addVectorCount);
				file = $fopen("test/add/pinf/add-vectors-n-p.txt", "r");	runSingleFile(file, addVectorCount);
				file = $fopen("test/add/pinf/add-vectors-n-n.txt", "r");	runSingleFile(file, addVectorCount);
			$display("Round towards -Inf");
			roundingMode = `ROUNDING_MODE_NEG_INF;
				file = $fopen("test/add/ninf/add-vectors-p-p.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/ninf/add-vectors-p-n.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/ninf/add-vectors-n-p.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/ninf/add-vectors-n-n.txt", "r"); runSingleFile(file, addVectorCount); 
			/*$display("Round towards nearest even");
			roundingMode = `ROUNDING_MODE_NEAREST_EVEN;
				file = $fopen("test/add/nearest/add-vectors-p-p.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/nearest/add-vectors-p-n.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/nearest/add-vectors-n-p.txt", "r"); runSingleFile(file, addVectorCount);
				file = $fopen("test/add/nearest/add-vectors-n-n.txt", "r"); runSingleFile(file, addVectorCount);
			*/
		$display("----------------");
		$display("Sub:");
		opCode = `FPU_INSTR_SUB;
			$display("Round towards zero");
		    roundingMode = `ROUNDING_MODE_TRUNCATE;
				file = $fopen("test/sub/trunc/sub-vectors-p-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/trunc/sub-vectors-p-n.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/trunc/sub-vectors-n-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/trunc/sub-vectors-n-n.txt", "r"); runSingleFile(file, subVectorCount);
			$display("Round towards +Inf");
			roundingMode = `ROUNDING_MODE_POS_INF;
				file = $fopen("test/sub/pinf/sub-vectors-p-p.txt", "r");	runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/pinf/sub-vectors-p-n.txt", "r");	runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/pinf/sub-vectors-n-p.txt", "r");	runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/pinf/sub-vectors-n-n.txt", "r");	runSingleFile(file, subVectorCount);
			$display("Round towards -Inf");
			roundingMode = `ROUNDING_MODE_NEG_INF;
				file = $fopen("test/sub/ninf/sub-vectors-p-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/ninf/sub-vectors-p-n.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/ninf/sub-vectors-n-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/ninf/sub-vectors-n-n.txt", "r"); runSingleFile(file, subVectorCount); 
			/*$display("Round towards nearest event");
			roundingMode = `ROUNDING_MODE_NEAREST_EVEN;
				file = $fopen("test/sub/nearest/sub-vectors-p-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/nearest/sub-vectors-p-n.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/nearest/sub-vectors-n-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/sub/nearest/sub-vectors-n-n.txt", "r"); runSingleFile(file, subVectorCount);
			*/						  
			
		$display("---------------- DIV automatic testbench ----------------");
		opCode = `FPU_INSTR_DIV;
		$display("Round towards zero");
		roundingMode = `ROUNDING_MODE_TRUNCATE;
			file = $fopen("test/div/trunc/div-vectors-p-p.txt", "r"); runSingleFile(file, 1);
			file = $fopen("test/div/trunc/div-vectors-p-n.txt", "r"); runSingleFile(file, divVectorCount);
			file = $fopen("test/div/trunc/div-vectors-n-p.txt", "r"); runSingleFile(file, divVectorCount);
			file = $fopen("test/div/trunc/div-vectors-n-n.txt", "r"); runSingleFile(file, divVectorCount);
		/*$display("Round towards +Inf");
			roundingMode = `ROUNDING_MODE_POS_INF;
				file = $fopen("test/div/pinf/div-vectors-p-p.txt", "r");	runSingleFile(file, divVectorCount);
				file = $fopen("test/div/pinf/div-vectors-p-n.txt", "r");	runSingleFile(file, divVectorCount);
				file = $fopen("test/div/pinf/div-vectors-n-p.txt", "r");	runSingleFile(file, divVectorCount);
				file = $fopen("test/div/pinf/div-vectors-n-n.txt", "r");	runSingleFile(file, divVectorCount);
			$display("Round towards -Inf");
			roundingMode = `ROUNDING_MODE_NEG_INF;
				file = $fopen("test/div/ninf/div-vectors-p-p.txt", "r"); runSingleFile(file, divVectorCount);
				file = $fopen("test/div/ninf/div-vectors-p-n.txt", "r"); runSingleFile(file, divVectorCount);
				file = $fopen("test/div/ninf/div-vectors-n-p.txt", "r"); runSingleFile(file, divVectorCount);
				file = $fopen("test/div/ninf/div-vectors-n-n.txt", "r"); runSingleFile(file, divVectorCount); */
			/*$display("Round towards nearest event");
			roundingMode = `ROUNDING_MODE_NEAREST_EVEN;
				file = $fopen("test/div/nearest/div-vectors-p-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/div/nearest/div-vectors-p-n.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/div/nearest/div-vectors-n-p.txt", "r"); runSingleFile(file, subVectorCount);
				file = $fopen("test/div/nearest/div-vectors-n-n.txt", "r"); runSingleFile(file, subVectorCount);
			*/
			
			
		$display("----------------"); 
		#20
		$finish;
	end
	
	
	task runSingleFile;
		input integer file;
		input integer vectorCount;
  		integer status, cnt, errorCount;
	begin
		cnt = 0;
		errorCount = 0;
		while (cnt < vectorCount) begin
			status = $fscanf(file, "%x\t%x\t%x\n", A[31:0], B[31:0], ER[31:0]);
	      	#(2*HCP) reset = 1'b0;
	      	@(posedge resultReady) #1;
			if (ER !== result) begin	 
				$display("Vector %d: Wrong result!", cnt);
				$display("A:  %b\t%x\t%b\n", A[31], A[30:23], A[22:0]);	  
				$display("B:  %b\t%x\t%b\n", B[31], B[30:23], B[22:0]);
				$display("ER: %b\t%x\t%b\n", ER[31], ER[30:23], ER[22:0]);
				$display("R:  %b\t%x\t%b\n", result[31], result[30:23], result[22:0]);
				errorCount = errorCount + 1;
			end else begin
				/*$display("Vector %d: Correct result", cnt);						  
				$display("A:  %b\t%x\t%b\n", A[31], A[30:23], A[22:0]);	  
				$display("B:  %b\t%x\t%b\n", B[31], B[30:23], B[22:0]);
				$display("ER: %b\t%x\t%b\n", ER[31], ER[30:23], ER[22:0]);
				$display("R:  %b\t%x\t%b\n", result[31], result[30:23], result[22:0]);*/
			end											
			reset = 1'b1; 
			cnt = cnt + 1;
	  	end		   
	  	$display("Finished, %d vectors simulated, %d error(s)", cnt, errorCount);
	    $fclose(file);
	  end
  endtask
endmodule
