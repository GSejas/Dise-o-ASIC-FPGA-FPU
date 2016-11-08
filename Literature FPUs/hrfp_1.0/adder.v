// Interesting paper:  Large multipliers with less DSP blocks

//// Compare (16 LUTs)
//// Swap  (32 LUTs)
//// Align - 64 LUTs? (possibly 32)
//// Adder (32 LUTs) (including mux for swap!)
//// Normalize (64 LUTs?)
//// Round? (32 LUTs)
//// Normalize (32 LUTs)


//// testsynthdir-hrfp_add.v/hrfp_add_map.mrp:  Number of Slice LUTs:                         32 out of  41,000    1%
//// testsynthdir-hrfp_align.v/hrfp_align_map.mrp:  Number of Slice LUTs:                         41 out of  41,000    1%
//// testsynthdir-hrfp_compare.v/hrfp_compare_map.mrp:  Number of Slice LUTs:                         35 out of  41,000    1%
//// testsynthdir-hrfp_round.v/hrfp_round_map.mrp:  Number of Slice LUTs:                         50 out of  41,000    1%
//// testsynthdir-hrfp_swap.v/hrfp_swap_map.mrp:  Number of Slice LUTs:                         48 out of  41,000    1%
//// testsynthdir-hrfp_xilinx_normalize.v/hrfp_xilinx_normalize_map.mrp:  Number of Slice LUTs:                         90 out of  41,000    1%

// Known difference from IEEE754-semantics:
// * The mantissa of a NaN doesn't propagate as expected (same as Xilinx FPU)
// * No exceptions
// See also - Reproducible floating-point results in IEEE Std 754-2008

// FIXME - should probably be exponents
`include "hrfp_defs.vh"

// Två färre exponentbitar
// Fyra till mantissabitar!
module adder
	#(parameter PIPELINESTAGES = 5) 
	(input wire clk,
	     input wire [`MSBBIT:0] op_a, op_b,
	     output wire [`MSBBIT:0] result);


   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			b_is_bigger;		// From cmp of hrfp_compare.v
   wire [2:0]		expdiff_2;		// From swap of hrfp_swap.v
   wire [`EXPONENTBITS-1:0] expdiff_5;		// From normalize of hrfp_xilinx_normalize.v
   wire			expdiff_addone_5;	// From normalize of hrfp_xilinx_normalize.v
   wire			expdiff_msb_3;		// From align of hrfp_align.v
   wire			expdiff_nochange_5;	// From normalize of hrfp_xilinx_normalize.v
   wire			expdiff_saturated_2;	// From swap of hrfp_swap.v
   wire			iszero_5;		// From normalize of hrfp_xilinx_normalize.v
   wire [30:0]		mantissa_3_align0;	// From align of hrfp_align.v
   wire [30:0]		mantissa_3_align1;	// From align of hrfp_align.v
   wire [30:0]		mantissa_4;		// From add of hrfp_add.v
   wire [30:0]		mantissa_5;		// From normalize of hrfp_xilinx_normalize.v
   wire [`MSBBIT:0]	op1_a;			// From cmp of hrfp_compare.v
   wire [`MSBBIT:0]	op1_b;			// From cmp of hrfp_compare.v
   wire [`MSBBIT:0]	op2_a;			// From swap of hrfp_swap.v
   wire [`MSBBIT:0]	op2_b;			// From swap of hrfp_swap.v
   wire [`MSBBIT:0]	op3_a;			// From align of hrfp_align.v
   wire [`MSBBIT:0]	op3_b;			// From align of hrfp_align.v
   wire			overflow_bit_5;		// From normalize of hrfp_xilinx_normalize.v
   wire [30:0]		overflow_mantissa_5;	// From normalize of hrfp_xilinx_normalize.v
   wire			overflow_roundvector_5;	// From normalize of hrfp_xilinx_normalize.v
   wire [`MSBBIT:0]	result_4;		// From add of hrfp_add.v
   wire [`MSBBIT:0]	result_5;		// From normalize of hrfp_xilinx_normalize.v
   wire [7:0]		zeroesmask_4;		// From add of hrfp_add.v
   // End of automatics

   wire [`MSBBIT:0] 	op0_a, op0_b;
`ifdef IDDR_HACK_FOR_AREA
   // FIXME - Ugly hack to get area stuff to synthesize!
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
   assign op0_a = op_a;
   assign op0_b = op_b;
`endif
   
   
   
   hrfp_compare cmp(
		    .op_a (op0_a),
		    .op_b (op0_b),
		    /*AUTOINST*/
		    // Outputs
		    .b_is_bigger	(b_is_bigger),
		    .op1_a		(op1_a[`MSBBIT:0]),
		    .op1_b		(op1_b[`MSBBIT:0]),
		    // Inputs
		    .clk		(clk));

   hrfp_swap swap(/*AUTOINST*/
		  // Outputs
		  .op2_a		(op2_a[`MSBBIT:0]),
		  .op2_b		(op2_b[`MSBBIT:0]),
		  .expdiff_2		(expdiff_2[2:0]),
		  .expdiff_saturated_2	(expdiff_saturated_2),
		  // Inputs
		  .clk			(clk),
		  .op1_a		(op1_a[`MSBBIT:0]),
		  .op1_b		(op1_b[`MSBBIT:0]),
		  .b_is_bigger		(b_is_bigger));
   

   hrfp_align align(/*AUTOINST*/
		    // Outputs
		    .expdiff_msb_3	(expdiff_msb_3),
		    .op3_a		(op3_a[`MSBBIT:0]),
		    .op3_b		(op3_b[`MSBBIT:0]),
		    .mantissa_3_align0	(mantissa_3_align0[30:0]),
		    .mantissa_3_align1	(mantissa_3_align1[30:0]),
		    // Inputs
		    .clk		(clk),
		    .expdiff_2		(expdiff_2[2:0]),
		    .expdiff_saturated_2(expdiff_saturated_2),
		    .op2_a		(op2_a[`MSBBIT:0]),
		    .op2_b		(op2_b[`MSBBIT:0]));
   

   hrfp_add add (/*AUTOINST*/
		 // Outputs
		 .result_4		(result_4[`MSBBIT:0]),
		 .mantissa_4		(mantissa_4[30:0]),
		 .zeroesmask_4		(zeroesmask_4[7:0]),
		 // Inputs
		 .clk			(clk),
		 .op3_a			(op3_a[`MSBBIT:0]),
		 .op3_b			(op3_b[`MSBBIT:0]),
		 .mantissa_3_align0	(mantissa_3_align0[30:0]),
		 .mantissa_3_align1	(mantissa_3_align1[30:0]),
		 .expdiff_msb_3		(expdiff_msb_3));

   
   hrfp_xilinx_normalize normalize(/*AUTOINST*/
				   // Outputs
				   .expdiff_5		(expdiff_5[`EXPONENTBITS-1:0]),
				   .expdiff_addone_5	(expdiff_addone_5),
				   .expdiff_nochange_5	(expdiff_nochange_5),
				   .mantissa_5		(mantissa_5[30:0]),
				   .overflow_mantissa_5	(overflow_mantissa_5[30:0]),
				   .overflow_roundvector_5(overflow_roundvector_5),
				   .result_5		(result_5[`MSBBIT:0]),
				   .overflow_bit_5	(overflow_bit_5),
				   .iszero_5		(iszero_5),
				   // Inputs
				   .clk			(clk),
				   .result_4		(result_4[`MSBBIT:0]),
				   .mantissa_4		(mantissa_4[30:0]),
				   .zeroesmask_4	(zeroesmask_4[7:0]));
   

   
   hrfp_round round(/*AUTOINST*/
		    // Outputs
		    .result		(result),
		    // Inputs
		    .clk		(clk),
		    .overflow_bit_5	(overflow_bit_5),
		    .iszero_5		(iszero_5),
		    .overflow_roundvector_5(overflow_roundvector_5),
		    .mantissa_5		(mantissa_5[30:0]),
		    .overflow_mantissa_5(overflow_mantissa_5[30:0]),
		    .expdiff_5		(expdiff_5[`EXPONENTBITS-1:0]),
		    .expdiff_addone_5	(expdiff_addone_5),
		    .expdiff_nochange_5	(expdiff_nochange_5),
		    .result_5		(result_5[`MSBBIT:0]));

// `define DEBUG   
`ifdef DEBUG
   always @(posedge clk) begin
      $display("----------------------------------------------------------------------");
      $display("     Stage 0: op_a is %x (mantissa is %b, exp is %d), op_b is %x (mantissa is %b, exp is %d)", op_a, op_a`MANTISSA, op_a`EXPONENT, op_b, op_b`MANTISSA, op_b`EXPONENT);
      $display("     Stage 1: op_a is %x, op_b is %x", op1_a, op1_b);
      $display("              b_is_bigger: %d", b_is_bigger);
      $display("     Stage 2: op_a is %x, op_b is %x, expdiff is %d", op2_a, op2_b, expdiff_2);
      $display("              GRR:opa_special/expspec is %b/%b", op2_a`IS_NAN_OR_INF, op2_a`HRFP_IS_NAN);
      $display("              GRR:opb_special/expspec is %b/%b", op2_b`IS_NAN_OR_INF, op2_b`HRFP_IS_NAN);
      $display("     Stage 3: op_a is %x, op_b is %x", op3_a, op3_b);


      $display("     Stage 4: result is %x, mantissa is %b (= %b +/- (%b or %b))", result_4,mantissa_4,{op3_a`MANTISSA,3'b0},mantissa_3_align0, mantissa_3_align1);
      $display("               %b", {op3_a`MANTISSA,3'b0});
      $display("          +/- %b", add.aligned_mantissa);
      $display("              %b", mantissa_4);
      
      $display("              zeroesmask is %b", zeroesmask_4);
      $display("              Basis for normalization/rounding overflow: %b", mantissa_4[29:5]);
      $display("     Stage 5: result is %x (mantissa before mask is %b, after mask is %b (mask is %b))", result_5, mantissa_5, result`MANTISSA, round.mask);
      $display("              Overflow bit: %b, overflow_roundvector: %b, overflow_mantissa: %b", overflow_bit_5, overflow_roundvector_5, overflow_mantissa_5);
      $display("              exponent is %d", result_5`EXPONENT);
      $display("              iszero: %b", normalize.iszero);
      $display("     Stage 6 (comb): Roundvector is %b, roundmask is %b, roundvector & roundmask is %b, mantissa_6 is %b", round.roundvector, round.roundmask, round.roundvector & round.roundmask, round.mantissa_6);
      $display("                     exp is %d (%b)", result`EXPONENT, result`EXPONENT);
      $display("                     addone: %b, nochange: %b, expdiff_tmp: %b", round.expdiff_addone_5, round.expdiff_nochange_5, round.expdiff_tmp);
      
   end
`endif
   
endmodule // adder
