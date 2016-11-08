`include "hrfp_defs.vh"
module hrfp_compare
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
	       input wire [`MSBBIT:0] op_a, op_b,
	       output reg 	      b_is_bigger,
	       output reg [`MSBBIT:0] op1_a, op1_b);

   
   genvar 			      i;
   wire [35:0] 			      propagate;
   wire [35:0] 			      newcarry;
   wire [35:0] 			      carrychain;
   wire [35:0] 			      A = {1'b0,op_a[34:0]};
   wire [35:0] 			      B = {1'b0,op_b[34:0]};


   // This was necessary to create a comparator using 1 LUT per 2 bits
   // which can be configured to either compare for either "less than
   // or equal" or "less than" (selected by op_a`SIGN as input to
   // carry chain)
   generate
       for(i=0; i <= 35; i = i + 2) begin : COMP
	  // Ok: If identical, we should propagate carry
	  // If A is less than B, we should generate carry 
	  // if A larger than B, we should kill carry
 	 LUT6_2 #(.INIT({32'b00000000000000001000010000100001,
			 32'b00000000000000000111001100010000}))
                  lut(.I0(A[i]),.I1(A[i+1]),.I2(B[i]),.I3(B[i+1]),.I4(1'b0),.I5(1'b1),.O6(propagate[i/2]),.O5(newcarry[i/2]));
 	 if((i & 3) == 0) begin
 	    CARRY4 chain(.CO(carrychain[i+3:i]),
			 .O(),
			 .DI(newcarry[i+3:i]),
			 .S(propagate[i+3:i]),
			 .CYINIT(i==0 ? op_a`SIGN : 1'b0),
			 .CI(i != 0 ? carrychain[i-1] : 1'b0));
 	 end
       end
    endgenerate

   


   
   // Move rounding here?
   always @(posedge clk) begin
`ifdef DEBUG
      $display("\n\n*************************** CARRYSTUFF *****************************");
      $display("    A: %b",A);
      $display("    B: %b",B);
      $display("    propagate:  %b",propagate);
      $display("    newcarry:   %b",newcarry);
      $display("    carrychain: %b",carrychain);
      
      $display("********************************************************************\n\n");
`endif
      op1_a <= op_a;
      op1_b <= op_b;
      b_is_bigger <= carrychain[17];

      // This test ensures that we handle plus/minus 0 correctly in such a way that
      // -0 + +0 = +0 and +0 + -0 = +0
      // FIXME - how to handle x-x = +0? (note: probably handled already...)

      // Code present before hand instantiation above:
      //      if(op_a`SIGN) begin
      //         if(op_a[34:0] <= op_b[34:0]) begin
      //   	    b_is_bigger <= 1;
      //         end
      //      end else begin
      //         if(op_a[34:0] < op_b[34:0]) begin
      //   	    b_is_bigger <= 1;
      //         end
      //      end
      
      // Note: If we write the above as this the synthesis tool fits everything into
      // one LUT / 2 bits instead of two such structures followed by a mux


      if(op_a[34:0] < op_b[34:0]+ op_a`SIGN ) begin
	 // Commented out because b_is_bigger is generated above in
	 // hand instantiated code instead. This if statement is now
	 // only used as a sanity check of the hand instantiated code
	 // instead.
	 //	b_is_bigger <= 1; 
	 if(carrychain[17] !== 1'b1) begin
	    $display("%m: Carrychain 17 is not correct (val is %b, should be 1)",carrychain[17]);
	    $stop;
	 end
      end else begin
	 if(carrychain[17] !== 1'b0) begin
	    $display("%m: Carrychain 17 is not correct (val is %b, should be 0)",carrychain[17]);
	 end
      end
   end


endmodule

