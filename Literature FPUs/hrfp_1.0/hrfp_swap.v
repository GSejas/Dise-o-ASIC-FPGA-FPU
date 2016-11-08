`include "hrfp_defs.vh"
module hrfp_swap
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
		 input wire [`MSBBIT:0] op1_a, op1_b,
		 input wire 		b_is_bigger,
		 output reg [`MSBBIT:0] op2_a, op2_b,
		 output reg [2:0] 	expdiff_2,
		 output reg 		expdiff_saturated_2
		 );

   // Hmm, it may be possible to skip the swap stage in case exponents are equal
   // by allowing mantissas to be two's complement represented (with separate signbit?)
   // (In that case we only need to compare the exponents in the previous stage.)


   reg [`EXPONENTBITS + 1:0] expdiff_tmp;
   reg [`EXPONENTBITS + 1:0] expdiff_tmp_op1;
   reg [`EXPONENTBITS + 1:0] expdiff_tmp_op2;
   always @* begin
      // Original code:
      //        expdiff_tmp = op1_a`EXPONENT - op1_b`EXPONENT;
      //        if(b_is_bigger) begin
      //  	 expdiff_tmp = op1_b`EXPONENT - op1_a`EXPONENT;
      //        end
      
      // Rewritten version of the above which uses 10 less LUTs:
        expdiff_tmp_op1 = b_is_bigger ? ~{2'b00, op1_a`EXPONENT}  : {2'b00, op1_a`EXPONENT};
        expdiff_tmp_op2 = b_is_bigger ? {2'b00, op1_b`EXPONENT}  : ~{2'b00, op1_b`EXPONENT};
        expdiff_tmp = expdiff_tmp_op1 + expdiff_tmp_op2 + 1;
   end

   //      Equivalent to the following condition: if(expdiff_tmp >= 8)
   (* KEEP = "SOFT" *) wire expdiff_too_large = |expdiff_tmp[`EXPONENTBITS+1:3];
   

   always @(posedge clk) begin
      expdiff_saturated_2 <= 0;
      op2_a <= op1_a;
      op2_b <= op1_b;

      if(b_is_bigger) begin
	 op2_a <= op1_b;
	 op2_b <= op1_a;
      end


      expdiff_2 <= expdiff_tmp[2:0];
      if(expdiff_too_large) begin
	 expdiff_2 <= 7;
	 expdiff_saturated_2 <= 1;
      end

      if(op1_a`IS_NAN_OR_INF || op1_b`IS_NAN_OR_INF) begin

	 // In this case the following must happen:
	 op2_b <= 0;
	 op2_a`IS_NAN_OR_INF <= 1;
	 
	 // If op2_a and op2_b is Inf and signs are opposite, the result is NaN
	 if( (op1_a`IS_NAN_OR_INF && !op1_a`HRFP_IS_NAN) &&
	     (op1_b`IS_NAN_OR_INF && !op1_b`HRFP_IS_NAN)) begin
	    if(op1_a`SIGN != op1_b`SIGN) begin
	       op2_a`HRFP_IS_NAN <= 1;
	    end
	 end

	 // We don't need to set the sign bit here for inf due to the
	 // following reasons:
	 // * If both numbers are Inf and sign bits are equal: Sign bit is already correct
	 // * If both numbers are Inf and sign bits are opposite: Sign bit is don't care
	 // * If (at least) one numbers is NaN: Sign bit shouldn't matter here
	 // * If only one number is Inf and other number is not NaN or Inf: Biggest number will be written to op2_a => Sign bit will be correct
	 // 

	 if((op1_b`IS_NAN_OR_INF && op1_b`HRFP_IS_NAN) ||
	    (op1_a`IS_NAN_OR_INF && op1_a`HRFP_IS_NAN) ) begin
	    op2_a`IS_NAN_OR_INF <= 1;
	 end
	 // Rest of op2_a should be don't care in this case...
	 
      end
      
   end // always @ (posedge clk)


endmodule
