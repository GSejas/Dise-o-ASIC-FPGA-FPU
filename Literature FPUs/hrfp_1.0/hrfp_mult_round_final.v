`include "hrfp_defs.vh"
module hrfp_mult_round_final(
			     input wire 			clk,
			     input wire expdiff,
			     input wire sign5, 
			     input wire 			rounding_overflowed,answer_is_zero, res_is_inf, res_is_nan, 
			     input wire [53:0] 			rounded_mantissa_expdiff0, rounded_mantissa_expdiff1,
			     input wire [`MANTISSABITS-1:0] 	roundoverflow_mantissa,
			     input wire [`EXPONENTBITS-1:0] 	roundoverflow_exponent,
			     

			     input wire [53:0] 			final_hrfp_round_mask_expdiff0,final_hrfp_round_mask_expdiff1,
			     input wire [`EXPONENTBITS-1+1:0] 	exponent_post_round_expdiff0, exponent_post_round_expdiff1,
			     output wire [`MSBBIT:0] 		result);


   parameter PARALLELL_ROUNDING = 0;
   reg [53:0] final_rounded_mantissa, final_hrfp_round_mask;
   reg [`EXPONENTBITS-1+1:0] final_exponent_post_round;

   always @* begin
      // Default behavior: (expdiff == 0)
      final_rounded_mantissa = rounded_mantissa_expdiff0;
      final_hrfp_round_mask  = final_hrfp_round_mask_expdiff0;
      final_exponent_post_round = exponent_post_round_expdiff0;
      if(PARALLELL_ROUNDING && (expdiff == 1)) begin
	 final_rounded_mantissa = rounded_mantissa_expdiff1;
	 final_hrfp_round_mask  = final_hrfp_round_mask_expdiff1;
	 final_exponent_post_round = exponent_post_round_expdiff1;
      end
      
   end

   reg [`MSBBIT:0] theresult;

   
   
   always @* begin
      theresult`SIGN <= sign5;

      // Conversion between decimal, ieee754 and HRFP
      // Decimal: 1.0
      // IEEE754: 0x3f800000 (0 01111111 00000000000000000000000) 
      // HRFP: 8.0*16^(31 - bias)/8  1000.0000000000000000000 * 16^(31 - bias)
      // Hence bias should be 31 and the mantissa shifted accordingly

      theresult`EXPONENT <= final_exponent_post_round;
      
      // Normalization:
      theresult`MANTISSA <= final_rounded_mantissa[53:27] & final_hrfp_round_mask[53:27];

      // FIXME - Precalculate this difference for each expdiff case to simplify this expression...

      // Actually, we might not need to do this, as we might be able to precalculate hrfp_round_mask
      // so that at least the mantissa is always zero.      
//       if(final_exponent_post_round < 58) begin
// 	 theresult`EXPONENT <= 0;
//	 theresult`MANTISSA <= 0;
//      end


      
      if(rounding_overflowed) begin
	 theresult`EXPONENT <= roundoverflow_exponent;
      end

       if(answer_is_zero) begin

	  // The following is not needed here as it is handled below (using the RESET input of flip-flops)
	  //  	 theresult`EXPONENT <= 0;
	  //  	 theresult`MANTISSA <= 0;
	  
	  // However, these bits of the exponent are not reset below using answer_is_zero,
	  // zero them here instead!
 	  theresult`IS_NAN_OR_INF <= 0;
	  theresult`HRFP_IS_NAN <= 0;
       end

      if(res_is_inf) begin
	 theresult`IS_NAN_OR_INF <= 1;
	 theresult`HRFP_IS_NAN <= 0;
      end

      if(res_is_nan) begin
	 theresult`IS_NAN_OR_INF <= 1;
	 theresult`HRFP_IS_NAN <= 1;
      end

      if(rounding_overflowed) begin
         // Handled using reset inputs below!
         //	 theresult`MANTISSA <= 27'b000100000000000000000000000;
	 // Except this one which isn't!
	 theresult[23] <= 1;
      end
   end

   initial begin
      if(`MSBBIT != 35)  $stop;
      if(`EXPONENTBITS != 8) $stop;
      if(`MANTISSABITS != 27) $stop;
   end

   // Instantiate the flip-flops manually to ensure that a suitable
   // signal is used for the D and R input of the flip-flops. (As the
   // synthesis tool will often make a fairly suboptimal choice here.)
   
   FDRE ff35(.C(clk), .Q(result[35]), .CE(1'b1), .R(1'b0), .D(theresult[35]));
   FDRE ff34(.C(clk), .Q(result[34]), .CE(1'b1), .R(1'b0), .D(theresult[34]));
   FDRE ff33(.C(clk), .Q(result[33]), .CE(1'b1), .R(1'b0), .D(theresult[33])); // These bits also contain IS_NAN_OR_INF and HRFP_IS_NAN
   FDRE ff32(.C(clk), .Q(result[32]), .CE(1'b1), .R(answer_is_zero), .D(theresult[32]));
   FDRE ff31(.C(clk), .Q(result[31]), .CE(1'b1), .R(answer_is_zero), .D(theresult[31]));
   FDRE ff30(.C(clk), .Q(result[30]), .CE(1'b1), .R(answer_is_zero), .D(theresult[30]));
   FDRE ff29(.C(clk), .Q(result[29]), .CE(1'b1), .R(answer_is_zero), .D(theresult[29]));
   FDRE ff28(.C(clk), .Q(result[28]), .CE(1'b1), .R(answer_is_zero), .D(theresult[28]));
   FDRE ff27(.C(clk), .Q(result[27]), .CE(1'b1), .R(answer_is_zero), .D(theresult[27]));
   FDRE ff26(.C(clk), .Q(result[26]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[26]));
   FDRE ff25(.C(clk), .Q(result[25]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[25]));
   FDRE ff24(.C(clk), .Q(result[24]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[24]));
   FDRE ff23(.C(clk), .Q(result[23]), .CE(1'b1), .R(answer_is_zero), .D(theresult[23]));
   FDRE ff22(.C(clk), .Q(result[22]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[22]));
   FDRE ff21(.C(clk), .Q(result[21]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[21]));
   FDRE ff20(.C(clk), .Q(result[20]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[20]));
   FDRE ff19(.C(clk), .Q(result[19]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[19]));
   FDRE ff18(.C(clk), .Q(result[18]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[18]));
   FDRE ff17(.C(clk), .Q(result[17]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[17]));
   FDRE ff16(.C(clk), .Q(result[16]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[16]));
   FDRE ff15(.C(clk), .Q(result[15]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[15]));
   FDRE ff14(.C(clk), .Q(result[14]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[14]));
   FDRE ff13(.C(clk), .Q(result[13]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[13]));
   FDRE ff12(.C(clk), .Q(result[12]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[12]));
   FDRE ff11(.C(clk), .Q(result[11]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[11]));
   FDRE ff10(.C(clk), .Q(result[10]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[10]));
   FDRE ff9(.C(clk), .Q(result[9]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[9]));
   FDRE ff8(.C(clk), .Q(result[8]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[8]));
   FDRE ff7(.C(clk), .Q(result[7]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[7]));
   FDRE ff6(.C(clk), .Q(result[6]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[6]));
   FDRE ff5(.C(clk), .Q(result[5]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[5]));
   FDRE ff4(.C(clk), .Q(result[4]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[4]));
   FDRE ff3(.C(clk), .Q(result[3]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[3]));
   FDRE ff2(.C(clk), .Q(result[2]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[2]));
   FDRE ff1(.C(clk), .Q(result[1]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[1]));
   FDRE ff0(.C(clk), .Q(result[0]), .CE(1'b1), .R(answer_is_zero || rounding_overflowed), .D(theresult[0]));

endmodule

   





			     