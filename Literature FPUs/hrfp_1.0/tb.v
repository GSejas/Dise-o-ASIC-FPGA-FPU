`include "hrfp_defs.vh"


  
module tb;
   // Valid options: 5/0,  8/1
   parameter PIPELINESTAGES = 8;
   parameter ISMULT = 1;
   

   parameter datafile = "input.txt";
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [`MSBBIT:0]	result;			// From dut of adder.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg			clk;			// To dut of adder.v
   reg [`MSBBIT:0]	op_a;			// To dut of adder.v
   reg [`MSBBIT:0]	op_b;			// To dut of adder.v
   // End of automatics


   generate
      if (ISMULT) begin : dutmult
	 mult #(.MULT_LATENCY(PIPELINESTAGES-2))
	 dut (/*AUTOINST*/
		   // Outputs
		   .result			(result[`MSBBIT:0]),
		   // Inputs
		   .clk			(clk),
		   .op_a			(op_a[`MSBBIT:0]),
		   .op_b			(op_b[`MSBBIT:0]));
      end else begin : dutadd
	 adder dut (/*AUTOINST*/
		   // Outputs
		   .result			(result[`MSBBIT:0]),
		   // Inputs
		   .clk			(clk),
		   .op_a			(op_a[`MSBBIT:0]),
		   .op_b			(op_b[`MSBBIT:0]));
      end
   endgenerate
   
	 
   reg 			isrunning = 1;
   initial begin
      clk = 0;
      while(isrunning) begin
	 #10;
	 clk = 1;
	 #10;
	 clk = 0;
      end
   end

   reg nocheck = 1;
   integer fd;
   integer exponent, grr;
   reg 	   sign;
   reg [26:0] mantissa;
   integer num1, num2, num_expected;
   integer expected_result;
   integer numiterations = 0;

   reg [`MSBBIT:0] delayed_result;
   reg [31:0] delayed_expected = 0;

   reg [31:0] delayed_ieeeopa, delayed_ieeeopb;

   task report_failure;
      input integer iterations;
   begin
      $display("Expected result: %x (ieeeopa: %x, ieeeopb: %x), got the result %x", delayed_expected, delayed_ieeeopa, delayed_ieeeopb, {sign, exponent[7:0], mantissa[22:0]});
      // The exact number of iterations will differ slightly due to the pipeline of the operators
      $display("Rough number of iterations: %d", iterations);
      
      $finish_and_return(1);
      $stop;
   end
   endtask

   // Convert the mantissa of an IEEE754 based float to the HRFP_16 format
   function [26:0] conv_mant_to_hr;
      input [31:0] ieee754_float;
      integer 	   tmpexp;
      begin
	 if(!ieee754_float[30:0]) begin
	    conv_mant_to_hr = 0;
	 end else begin
	    tmpexp = ieee754_float[30:23] + 1; // Add a bias to ensure nice alignment 
	    if(ieee754_float[30:23] > 0) begin
	       conv_mant_to_hr = (ieee754_float & 32'h7fffff) + 32'h800000;
	    end else begin
                // Handle subnormals here

	       conv_mant_to_hr = (ieee754_float & 32'h7fffff) << 1; // Shift left by one since we now have an explicit one!
	       // Use 25:22 here to compensate for the bias above!

	       while(!conv_mant_to_hr[25:22]) conv_mant_to_hr = conv_mant_to_hr << 4;
	       
	    end
	    conv_mant_to_hr = conv_mant_to_hr << tmpexp[1:0];
	 end
      end
   endfunction

   // Convert the exponent of an IEEE754 based float to the HRFP_16 format
   function [`EXPONENTBITS-1:0] conv_exp_to_hr;
      input [31:0] ieee754_float;
      integer 	   tmpexp;
      reg [26:0]   tmp;
      begin
	 if(!ieee754_float[30:0]) begin // Handle +/- zero
	    conv_exp_to_hr = 0;
	 end else begin
	    tmpexp = ieee754_float[30:23] + 1; // Add a bias to ensure nice alignment 
	    conv_exp_to_hr = tmpexp[7:2] + 8'b01000000;

	    // Handle subnormals here
	    if(ieee754_float[30:23] == 0) begin
	       tmp = (ieee754_float & 32'h7fffff) << 1;
	       // Use 25:22 here to compensate for the bias above
	       while(!tmp[25:22]) begin
		  tmp = tmp << 4;
		  conv_exp_to_hr = conv_exp_to_hr - 1;
		  if(!tmp) begin
		     $display("INTERNAL FAILURE"); // +/- zero is handled above
		     $stop;
		  end
	       end
	    end
	    if (ieee754_float[30:23] == 255) begin
	       if (ieee754_float[22:0]) begin
		  conv_exp_to_hr = 8'b11000000;  // NaN
	       end else begin
		  conv_exp_to_hr = 8'b10000000; // Inf
	       end
	    end
	 end
      end
   endfunction

   
      


   initial begin : TESTER
      integer i;
      
      op_a = 0;
      op_b = 0;
      num1 = 0;
      num2 = 0;
      num_expected = 0;
      repeat(26) @(posedge clk);
      fd=$fopen(datafile,"r");
      nocheck = 0;

      for(i=1; i < 64; i = i * 2) begin
	 $display("Converting 0x%08x to HRFP: %b %b", i, conv_exp_to_hr(i), conv_mant_to_hr(i));
      end
      
      
      while($fscanf(fd, "%x %x %x",num1, num2, num_expected) == 3) begin
`ifdef DEBUG      
	 $display("**********************************************************************");
	 $display("       Adding %08x to %08x", num1, num2);
	 $display("       %b %b %b", num1[31], num1[30:23], num1[22:0]);
	 $display("       %b %b %b", num2[31], num2[30:23], num2[22:0]);
	 $display("       Expdiff is %d", num1[30:23] - num2[30:23]);
	 $display("**********************************************************************");

	 $display("IEEE: mantissa: %b, exp: %d",num1[22:0], num1[30:23]);
`endif



	 sign = num1[31];
	 op_a`MANTISSA <= conv_mant_to_hr(num1);
	 op_a`EXPONENT <= conv_exp_to_hr(num1);
	 op_a`SIGN <= sign;
	 if(num1[30:23] == 8'hff) begin
	    op_a`IS_NAN_OR_INF <= 1;
	    op_a`HRFP_IS_NAN <= 0;
	    
	    
	    if(num1[22:0]) begin
	       op_a`HRFP_IS_NAN <= 1;
	    end
	 end
	 
	 #1;
`ifdef DEBUG
	 $display("opa %x (mantissa is %b, exponent is %x, sign is %x)", op_a, mantissa, exponent, sign);
	 
	 
	 $display("IEEE2: mantissa: %b, exp: %d",num2[22:0], num2[30:23]);
`endif

	 sign = num2[31];
	 op_b`MANTISSA <= conv_mant_to_hr(num2);
	 op_b`EXPONENT <= conv_exp_to_hr(num2);
	 op_b`SIGN <= sign;
	 if(num2[30:23] == 8'hff) begin
	    op_b`IS_NAN_OR_INF <= 1;
	    
	    op_b`HRFP_IS_NAN <= 0;
	    
	    if(num2[22:0]) begin
	       op_b`HRFP_IS_NAN <= 1;
	    end
	 end
	 #1;
`ifdef DEBUG
	 $display("opb %x (mantissa is %b, exponent is %x, sign is %x)", op_b, mantissa, exponent, sign);
`endif
	 delayed_expected <= repeat(PIPELINESTAGES) @(posedge clk) num_expected;
	 delayed_ieeeopa <= repeat(PIPELINESTAGES) @(posedge clk) num1;
	 delayed_ieeeopb <= repeat(PIPELINESTAGES) @(posedge clk) num2;
	 @(posedge clk);
	 
	 numiterations = numiterations + 1;
      end

   
      
      isrunning = 0;
      #5000; // Make sure we can detect an error in the last couple of cycles...
      $display("No errors detected during roughly %d iterations!",numiterations);
   end // initial begin
   

   // This always block is responsible for converting a HRFP_16 number to IEEE-754 format and then
   // checking that the number is equal to the expected IEEE_754 value.
   always @(posedge clk) begin
      while(nocheck) begin // Wait here until the testbench releases us by deactivating nocheck
	 @(posedge clk);
      end
      
      mantissa = result`MANTISSA;
      exponent = result`EXPONENT;
      sign = result`SIGN;
`ifdef DEBUG
      $display("    Result is %x (mantissa is %b, exponent is %x, sign is %x)", result, result[26:0], result[32:27], result[33]);
      
      
      $display("Expected pattern is %x (mantissa %b)", delayed_expected, delayed_expected[22:0]);
`endif

      // 
      exponent = exponent << 2;
      casez(mantissa[26:23])
	4'b1???: begin mantissa = mantissa; exponent = exponent+3; end
	4'b01??: begin mantissa = mantissa << 1; exponent = exponent + 2; end
	4'b001?: begin mantissa = mantissa << 2; exponent = exponent + 1; end
	4'b0001: begin mantissa = mantissa << 3; exponent = exponent + 0; end
	4'b0000: begin mantissa = mantissa << 3; end
      endcase // casez (mantissa[26:23])
      if(exponent) begin
	 exponent = exponent - 1; // Adjust for bias added above.
	 // Unless exponent is zero in which case we shouldn't wrap around.
      end
      if(mantissa[2:0] !== 0) begin
	 $display("ERROR (iteration %d): Some bits were not masked out as needed!", numiterations);
	 report_failure(numiterations);
	 $stop;
      end

      if(exponent == 10'b0100000000) begin // subnormals!
	 mantissa = mantissa >> 4;
      end else if(exponent < 58) begin // This is a zero...
	 mantissa = 0;
	 exponent = 10'b0100000000;
      end else if(exponent < 10'b0100000000) begin

	 mantissa = mantissa >> 4;
	 mantissa = mantissa >> ((10'b0100000000 - exponent));
	 exponent = 10'b0100000000; // Normalized...
	 
      end else begin
	 mantissa = mantissa >> 3;
	 mantissa = mantissa & 23'h7fffff; // Remove explicit one!
      end

      exponent = exponent - 10'b0100000000; // Bias
      
      
`ifdef DEBUG
      $display("Result is 0x%08x (raw result is %x)",{sign,exponent[7:0],mantissa[22:0]}, result);
`endif
      if(delayed_expected[30:23] == 255) begin
	 if(delayed_expected[22:0] != 0) begin

`ifdef DEBUG
	    $display("      This is not a number!");
`endif
	    if(! (result`IS_NAN_OR_INF && result`HRFP_IS_NAN)) begin
	       $display("ERROR: Expected a NaN but didn't receive it!");
	       report_failure(numiterations);
	       $stop;
	    end
	 end else begin
	    if(! (result`IS_NAN_OR_INF && !result`HRFP_IS_NAN)) begin
	       $display("Expected an inf but didn't receive it!");
	       report_failure(numiterations);
	       $stop;
	    end
	    if (sign !== delayed_expected[31]) begin
	       $display("Got wrong inf sign!");
	       report_failure(numiterations);
	       $stop;
	    end
	 end
      end else if({sign,exponent[7:0],mantissa[22:0]} !== delayed_expected) begin
	 if(result`IS_NAN_OR_INF) begin
	    $display("ERROR: IS_NAN_OR_INF was set even though expected number is not NaN or inf!");
	    report_failure(numiterations);
	    $stop;
	 end
	 
	 $display("ERROR: gotten pattern (%08x) is not identical to expected pattern (%08x) (iteration is %d)", 
		  {sign,exponent[7:0],mantissa[22:0]}, delayed_expected, numiterations);
	 report_failure(numiterations);
	 $stop;
      end // if ({sign,exponent[7:0],mantissa[22:0]} !== delayed_expected)

   end
   
   
   
      
endmodule // tb_adder


