// Top module for the HRFP_16 multiplier.


// Interesting paper: Large multipliers with less DSP blocks. Could be
// very useful for a double precision version of HRFP_16.

`include "hrfp_defs.vh"

  
module mult(input wire clk,
	    input wire [`MSBBIT:0]  op_a, op_b,
	    output wire [`MSBBIT:0] result);
   // These are the only supported parameters as of now, but the file
   // contains some experimental support for other kinds of
   // implementation choices that may or may not be up to date. (I
   // haven't tested these options in some time but I will retain them
   // here for a while if someone is interested in continuing this
   // work.)
   parameter MULT_LATENCY = 6;
   parameter EARLY_EXPDIFF = 1;
   parameter EARLY_NORMALIZE = 0;
   parameter PARALLELL_ROUNDING = 0;
   parameter PARALLELL_ROUNDMASK = 0;
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			expdiff;		// From norm of hrfp_mult_normalize.v
   wire [53:0]		normalized_mantissa;	// From norm of hrfp_mult_normalize.v
   // End of automatics
 

   // The IDDR_HACK_FOR_AREA define is used to place flip-flops in the
   // IDDR pins. This would never be used when using the core in a
   // normal FPGA design. However, it is quite useful when you are
   // trying to figure out the area for a design in a 7-series FPGA as
   // the Xilinx CAD tools will (unless suitable timing constraints
   // are given) place a lot of LUTs used as delay elements which will
   // contribute to the total LUT/SLICE count in the MAP/PAR reports,
   // even though they aren't really a part of the design under test.
   //
   // 
   wire [`MSBBIT:0] 	op0_a, op0_b;
`ifdef IDDR_HACK_FOR_AREA
   // FIXME: This should really be moved to a wrapper file instead.
   generate
      genvar 		i;
      for(i=0; i <= `MSBBIT; i = i + 1) begin : iobuffers
	    IDDR ia(.D(op_a[i]), .Q1(op0_a[i]), .C(clk), .CE(1'b1),
		   .S(1'b0), .R(1'b0),.Q2());
	    IDDR ib(.D(op_b[i]), .Q1(op0_b[i]), .C(clk), .CE(1'b1),
		   .S(1'b0), .R(1'b0),.Q2());
      end
   endgenerate
`else
   // Normal mode: 
   assign op0_a = op_a;
   assign op0_b = op_b;
`endif
  
   initial begin
      if (PARALLELL_ROUNDING && !PARALLELL_ROUNDMASK) begin
	 $display("%m: FAILURE: PARALLELL_ROUNDING set but PARALLELL_ROUNDMASK not set!");
	 $stop;
      end
   end
   

   // IDEA (not actually implemented).

   // Don't use mult35x35 in standard configuration, use it in
   // non-pipelined fashion and add in a tree-like structure in the
   // fabric. By this approach we can start to do preprocessing for
   // rounding somewhat earlier. (E.g., check for possible rounding
   // overflow, etc.)

   // Note to self: These are the locationsof the least significant
   // one in an emualted subnormal number depending on what the value
   // of the mantissa is.Note that one of the bits marked as y must be
   // a one for each of these numbers.
   //   yyyyxxxxxxxxxxxxxxxxxxxxx10   64
   //   yyyyxxxxxxxxxxxxxxxxx100000   63
   //   yyyyxxxxxxxxxxxxx1000000000   62
   //   yyyyxxxxxxxxx10000000000000   61
   //   yyyyxxxxx100000000000000000   60
   //   yyyyx1000000000000000000000   59
   //   y10000000000000000000000000   58   <-- Smallest nonzero mantissa/exponent!

   // Current pipelinesteps:
   // 1-6: Inside  mult
   // 7: Just after mult to avoid routing delay (mantissa5)
   // 8: Final register
   

   reg 	      carry, tmpcarry;
   
   reg [`EXPONENTBITS-1+1:0] exponent_pre_norm4, exponent_pre_norm5;
   reg [`EXPONENTBITS-1+1:0] exponent_pre_norm4_plus1, exponent_pre_norm5_plus1;
   reg [`EXPONENTBITS-1+1:0] exponent_post_norm;

   reg 			     res_is_nan;
   reg 			     res_is_inf;

   reg [`MSBBIT:0] 	     opx_a, opx_b, opy_a, opy_b, opz_a, opz_b, opw_a, opw_b, op1_a, op2_a, op1_b, op2_b,
			     op3_a, op3_b, op4_a, op4_b, op5_a, op5_b;

   wire [53:0] 		     mantissa4;
   (* KEEP = "TRUE" *) reg [53:0] 		     mantissa5;

`ifdef MULT_35x35   
   // Ugly hack to get to 35 bits for opa and opb...
   mult_35x35 #(.LATENCY(MULT_LATENCY))
              themult(.clk(clk),
		      .opa(35'b0 | op0_a`MANTISSA),
		      .opb(35'b0 | op0_b`MANTISSA),
		      .res(mantissa4));
`else
   initial begin
      $display("NOTICE: USING 27x27 mult for 7 series FPGA!");
   end

   mult_27x27 #(.LATENCY(MULT_LATENCY))
              themult(.clk(clk),
		      .opa(op0_a`MANTISSA),
		      .opb(op0_b`MANTISSA),
		      .res(mantissa4));
`endif
   reg 			     answer_is_zero_expdiff0, answer_is_zero_expdiff1, answer_is_zero_expdiffminus1;

   reg 			     sign5;
   
   
   always @(posedge clk) begin : DSP_MULT_PIPE
      mantissa5 <= mantissa4;

      // The pattern detection logic in the DSP48E1 block could implement part of this...
      mantissa5[21:0] <= 0;
      if(mantissa4[21:0]) begin
	 mantissa5[21] <= 1;  // With luck the synthesis tool will realize that some logic can be removed...
      end

//      $display("%x x %x, %x",op0_a,op0_b, result);
      
      if(MULT_LATENCY == 8) begin
	 opx_a <= op0_a;
	 opx_b <= op0_b;

	 opy_a <= opx_a;
	 opy_b <= opx_b;
	 
	 opz_a <= opy_a;
	 opz_b <= opy_b;
      end else if(MULT_LATENCY == 6) begin
	 opz_a <= op0_a;
	 opz_b <= op0_b;

	 opw_a <= opz_a;
	 opw_b <= opz_b;
      
	 op1_a <= opw_a;
	 op1_b <= opw_b;
      end else if(MULT_LATENCY == 4) begin
	 op1_a <= op0_a;
	 op1_b <= op0_b;
      end
      

      op2_a <= op1_a;
      op2_b <= op1_b;

      op3_a <= op2_a;
      op3_b <= op2_b;

      op4_a <= op3_a;
      op4_b <= op3_b;

      sign5 <= op4_a`SIGN ^ op4_b`SIGN;

      // FIXME - could save a few LUTs by moving addition earlier and
      // thus needing only to register the new exponent instead of the
      // exponent of both opa and opb. (But since we calculate two
      // values anyway we won't save very much unless we calculate one
      // value very early and then calculating value + 1 as late as
      // possible.)
      exponent_pre_norm4 <= op3_a`EXPONENT + op3_b`EXPONENT - 8'b01100000;
      exponent_pre_norm4_plus1 <= op3_a`EXPONENT + op3_b`EXPONENT - 8'b01100000 + 1;
      exponent_pre_norm5 <= exponent_pre_norm4;
      exponent_pre_norm5_plus1 <= exponent_pre_norm4_plus1;
   end

   reg 				    a_is_zero4, b_is_zero4;
   reg 				    a_is_zero5, b_is_zero5;

   // Detect whether any of the operands are zero.
   always @* begin
      a_is_zero4 = 0;
      if(op4_a`EXPONENT < 58) begin
	 a_is_zero4 = 1;
      end
      b_is_zero4 = 0;
      if(op4_b`EXPONENT < 58) begin
	 b_is_zero4 = 1;
      end
   end

   reg answer_is_zero;
   always @(posedge clk) begin
      answer_is_zero <= a_is_zero4 || b_is_zero4;
   end
      


   // NAN/INF handling.
   always @(posedge clk) begin
      res_is_nan <= 0;
      res_is_inf <= 0;
      if(op4_a`IS_NAN_OR_INF && !op4_a`HRFP_IS_NAN) begin
	 res_is_inf <= 1;
      end
      if(op4_b`IS_NAN_OR_INF && !op4_b`HRFP_IS_NAN) begin
	 res_is_inf <= 1;
      end

      if(op4_a`IS_NAN_OR_INF && op4_a`HRFP_IS_NAN) begin
	 res_is_nan <= 1;
      end
      if(op4_b`IS_NAN_OR_INF && op4_b`HRFP_IS_NAN) begin
	 res_is_nan <= 1;
      end

      if(op4_a`IS_NAN_OR_INF && op4_a`HRFP_IS_NAN) begin
	 res_is_nan <= 1;
      end
      if(op4_b`IS_NAN_OR_INF && op4_b`HRFP_IS_NAN) begin
	 res_is_nan <= 1;
      end
      if(op4_a`IS_NAN_OR_INF && b_is_zero4) begin
	 res_is_nan <= 1;
      end

      if(op4_b`IS_NAN_OR_INF && a_is_zero4) begin
	 res_is_nan <= 1;
      end

   end

`ifdef OLD_NORMALIZE   
//   reg [`EXPONENTBITS-1 + 1:0] expdiff;
//   reg [53:0] normalized_mantissa;
   generate
      // IDEA: In case of emergency: Can check only one bit of expdiff
      // here and the remaining bits beforehand!
      if(EARLY_EXPDIFF) begin : CHECK_EXPDIFF_EARLY
	 always @(posedge clk) begin
	    expdiff <= 1;
	    if(!mantissa4[53:50]) begin
	       expdiff <= 0;
	    end
	 end
      end else begin : CHECK_EXPDIFF_LATE
	 always @* begin
	    expdiff = 1;
	    if(!mantissa5[53:50]) begin
	       expdiff = 0;
	    end
	 end
      end
   endgenerate
   
	 
   generate // Needed for non parallell rounding
      if(EARLY_NORMALIZE) begin : CHECK_NORMALIZATION_EARLY
	 always @(posedge clk) begin
            normalized_mantissa <= mantissa4[53:0];
            if(!mantissa4[53:50]) begin
    	       normalized_mantissa <= {mantissa4[49:0], 4'b0000};
            end
	 end
      end else begin : CHECK_NORMALIZATION_LATE
	 always @* begin
            normalized_mantissa = mantissa5[53:0];
            if(!expdiff) begin
    	       normalized_mantissa = {mantissa5[49:0], 4'b0000};
            end
	 end
      end
   endgenerate
`else

   hrfp_mult_normalize #(.EARLY_NORMALIZE(EARLY_NORMALIZE),
			 .EARLY_EXPDIFF(EARLY_EXPDIFF))
   norm(/*AUTOINST*/
	// Outputs
	.expdiff			(expdiff),
	.normalized_mantissa		(normalized_mantissa[53:0]),
	// Inputs
	.clk				(clk),
	.mantissa4			(mantissa4),
	.mantissa5			(mantissa5));
`endif

   wire [`EXPONENTBITS-1+1:0] exponent_post_round_expdiff0, exponent_post_round_expdiff1;
   wire [53:0] 		      rounded_mantissa_expdiff0, rounded_mantissa_expdiff1;	
   wire [53:0] 		      final_roundvector_expdiff0, final_roundvector2_expdiff0;
   wire [53:0] 		      final_roundvector_expdiff1, final_roundvector2_expdiff1;
   wire [53:0] 		      final_roundvector_expdiffminus1, final_roundvector2_expdiffminus1;
   wire [53:0] 		      hrfp_round_mask_expdiff0, hrfp_round_mask_expdiff1, hrfp_round_mask_expdiffminus1;
   wire [53:0] 		      final_hrfp_round_mask_expdiff0,final_hrfp_round_mask_expdiff1;
   

	 wire [`MANTISSABITS-1:0]   roundoverflow_mantissa;
	 wire [`EXPONENTBITS-1:0]   roundoverflow_exponent;
	 wire 			    rounding_overflowed;
	 
   generate
      if(PARALLELL_ROUNDING) begin : PAR_ROUND

	 hrfp_mult_createroundvectors roundvectors0(.clk(clk),
						    .normalized_mantissa({mantissa5[49:0], 4'b0000}),
						    .exponent4(exponent_pre_norm4),
						    .exponent5(exponent_pre_norm5),
						    .final_roundvector(final_roundvector_expdiff0),
						    .final_roundvector2(final_roundvector2_expdiff0),
						    .hrfp_round_mask(hrfp_round_mask_expdiff0));

	 hrfp_mult_createroundvectors roundvectors1(.clk(clk),
						    .normalized_mantissa(mantissa5[53:0]),
						    .exponent4(exponent_pre_norm4_plus1),
						    .exponent5(exponent_pre_norm5_plus1),
						    .final_roundvector(final_roundvector_expdiff1),
						    .final_roundvector2(final_roundvector2_expdiff1),
						    .hrfp_round_mask(hrfp_round_mask_expdiff1));
	 
	 hrfp_mult_rounding rounding0(
				      // Outputs
				      .rounded_mantissa	(rounded_mantissa_expdiff0),
				      .exponent_post_round(exponent_post_round_expdiff0),
				      .final_hrfp_round_mask(final_hrfp_round_mask_expdiff0),
				      // Inputs
				      .clk		(clk),
				      .final_roundvector	(final_roundvector_expdiff0),
				      .final_roundvector2(final_roundvector2_expdiff0),
				      .normalized_mantissa({mantissa5[49:0],4'b0000}),
				      .exponent_post_norm(exponent_pre_norm5),
				      .hrfp_round_mask	(hrfp_round_mask_expdiff0));


	 hrfp_mult_rounding rounding1(
				      // Outputs
				      .rounded_mantissa	(rounded_mantissa_expdiff1),
				      .exponent_post_round(exponent_post_round_expdiff1),
				      .final_hrfp_round_mask(final_hrfp_round_mask_expdiff1),
				      // Inputs
				      .clk		(clk),
				      .final_roundvector	(final_roundvector_expdiff1),
				      .final_roundvector2(final_roundvector2_expdiff1),
				      .normalized_mantissa(mantissa5[53:0]),
				      .exponent_post_norm(exponent_pre_norm5_plus1),
				      .hrfp_round_mask	(hrfp_round_mask_expdiff1));

	 hrfp_mult_detect_round_overflow detect_ovf(.clk(clk),
						    .mantissa(mantissa5),
						    .precalculated_exponent4(exponent_pre_norm4),
						    .new_mantissa(roundoverflow_mantissa),
						    .new_exponent(roundoverflow_exponent),
						    .rounding_overflowed(rounding_overflowed));
      end else begin : SEQUENTIAL_ROUNDING

	 if(PARALLELL_ROUNDMASK) begin : DO_PAR_ROUNDING
	    hrfp_mult_createroundvectors roundvectors0(.clk(clk),
						       .normalized_mantissa({mantissa5[49:0], 4'b0000}),
						       .exponent4(exponent_pre_norm4),
						       .exponent5(exponent_pre_norm5),
						       .final_roundvector(final_roundvector_expdiff0),
						       .final_roundvector2(final_roundvector2_expdiff0),
						       .hrfp_round_mask(hrfp_round_mask_expdiff0));

	    hrfp_mult_createroundvectors roundvectors1(.clk(clk),
						       .normalized_mantissa(mantissa5[53:0]),
						       .exponent4(exponent_pre_norm4_plus1),
						       .exponent5(exponent_pre_norm5_plus1),
						       .final_roundvector(final_roundvector_expdiff1),
						       .final_roundvector2(final_roundvector2_expdiff1),
						       .hrfp_round_mask(hrfp_round_mask_expdiff1));

	 hrfp_mult_rounding rounding0(
				      // Outputs
				      .rounded_mantissa	(rounded_mantissa_expdiff0),
				      .exponent_post_round(exponent_post_round_expdiff0),
				      .final_hrfp_round_mask(final_hrfp_round_mask_expdiff0),
				      // Inputs
				      .clk		(clk),
				      .final_roundvector	(expdiff ? final_roundvector_expdiff1 : final_roundvector_expdiff0),
				      .final_roundvector2(expdiff ? final_roundvector2_expdiff1 : final_roundvector2_expdiff0),
				      .normalized_mantissa(normalized_mantissa),
				      .exponent_post_norm(expdiff ? exponent_pre_norm5_plus1 : exponent_pre_norm5),
				      .hrfp_round_mask	(expdiff ? hrfp_round_mask_expdiff1 : hrfp_round_mask_expdiff0));
	 

	 end else begin : DO_SEQ_ROUNDING

	    // This is the preferred configuration for small area!
	    
	    reg [`EXPONENTBITS-1+1:0] exponent_post_norm4, exponent_post_norm5;
	    always @* begin
	       exponent_post_norm4 = exponent_pre_norm4_plus1;
	       if(!mantissa4[53:50]) begin
		  exponent_post_norm4 = exponent_pre_norm4;
	       end
	    end

	    always @(posedge clk) begin
	       exponent_post_norm5 <= exponent_post_norm4;
	    end

	    hrfp_mult_createroundvectors roundvectors0(.clk(clk),
						       .normalized_mantissa(normalized_mantissa),
						       .exponent4(exponent_post_norm4),
						       .final_roundvector(final_roundvector_expdiff0),
						       .final_roundvector2(final_roundvector2_expdiff0),
						       .hrfp_round_mask(hrfp_round_mask_expdiff0));

	 hrfp_mult_rounding rounding0(
				      // Outputs
				      .rounded_mantissa	(rounded_mantissa_expdiff0),
				      .exponent_post_round(exponent_post_round_expdiff0),
				      .final_hrfp_round_mask(final_hrfp_round_mask_expdiff0),
				      // Inputs
				      .clk		(clk),
				      .final_roundvector	(final_roundvector_expdiff0),
				      .final_roundvector2(final_roundvector2_expdiff0),
				      .normalized_mantissa(normalized_mantissa),
				      .exponent_post_norm(exponent_post_norm5),
				      .hrfp_round_mask	(hrfp_round_mask_expdiff0));
	 
	    
	 end
	 
	 
	 hrfp_mult_detect_round_overflow detect_ovf(.clk(clk),
						    .mantissa(mantissa5),
						    .precalculated_exponent4(exponent_pre_norm4),
						    .new_mantissa(roundoverflow_mantissa),
						    .new_exponent(roundoverflow_exponent),
						    .rounding_overflowed(rounding_overflowed));
	 
      end
   endgenerate
   

   hrfp_mult_round_final #(/*AUTOINSTPARAM*/
			   // Parameters
			   .PARALLELL_ROUNDING	(PARALLELL_ROUNDING)) 
   finalround(/*AUTOINST*/
	      // Outputs
	      .result			(result),
	      // Inputs
	      .clk			(clk),
	      .expdiff			(expdiff),
	      .sign5			(sign5),
	      .rounding_overflowed	(rounding_overflowed),
	      .answer_is_zero		(answer_is_zero),
	      .res_is_inf		(res_is_inf),
	      .res_is_nan		(res_is_nan),
	      .rounded_mantissa_expdiff0(rounded_mantissa_expdiff0),
	      .rounded_mantissa_expdiff1(rounded_mantissa_expdiff1),
	      .roundoverflow_mantissa	(roundoverflow_mantissa),
	      .roundoverflow_exponent	(roundoverflow_exponent),
	      .final_hrfp_round_mask_expdiff0(final_hrfp_round_mask_expdiff0),
	      .final_hrfp_round_mask_expdiff1(final_hrfp_round_mask_expdiff1),
	      .exponent_post_round_expdiff0(exponent_post_round_expdiff0),
	      .exponent_post_round_expdiff1(exponent_post_round_expdiff1));
   

`ifdef DEBUG
   always @(posedge clk) begin
      $display("************ MULT MODULE ************");
      $display("op0_a: %b %b %b", op0_a`SIGN, op0_a`EXPONENT, op0_a`MANTISSA);
      $display("op0_b: %b %b %b", op0_b`SIGN, op0_b`EXPONENT, op0_b`MANTISSA);
      $display("     res_is_nan: %b", res_is_nan);
      $display("     res_is_inf: %b", res_is_inf);
      $display("     ");
      $display("                                %b",op0_a`MANTISSA);
      $display("                              * %b",op0_b`MANTISSA);
      $display("     ------------------------------------------------------");
      $display("     %b",mantissa5);
      $display("     AAAA    CCCC    EEEE    GGGG    IIII    KKKK    MMMM    O");
      $display("         BBBB    DDDD    FFFF    HHHH    JJJJ    LLLL    NNNN ");
      $display("                            ABBBBCCCCDDDDEEEEFFFFGGGGHHHHII");


      $display("     %b",rounded_mantissa_expdiff0);
      $display("     %b",rounded_mantissa_expdiff1);
      $display("");

      $display("     %b (expdiff)", expdiff);
      

      $display("     %b (Normalized_mantissa)",normalized_mantissa);
      $display("     %b (final roundvector_expdiff0)", final_roundvector_expdiff0);
      $display("     %b (final roundvector2_expdiff0)", final_roundvector2_expdiff0);
      $display("     %b (final roundvector_expdiff1)", final_roundvector_expdiff1);
      $display("     %b (final roundvector2_expdiff1)", final_roundvector2_expdiff1);
      $display("     %b (normalized_mantissa >> 2", normalized_mantissa >> 2);
      $display("     %b (final mask)", final_hrfp_round_mask);

      $display("     %b (final rounded mantissa)", final_rounded_mantissa);
      $display("     %b                                                           (rounded mantissa carry)", carry);

      $display("      %b (%d) (prenorm exponent)", exponent_pre_norm5, exponent_pre_norm5);
      $display("      %b (%d) (prenorm exponent+1)", exponent_pre_norm5 + 9'b1, exponent_pre_norm5 + 9'b1);
      $display("      %b (%d) (postnorm exponent)", exponent_post_norm5, exponent_post_norm5);

      $display("");

      $display("RESULT:");
      $display("   result: %b %b %b", result`SIGN, result`EXPONENT, result`MANTISSA);
   end
`endif

endmodule
