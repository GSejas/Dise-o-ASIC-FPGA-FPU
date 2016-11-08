`include "hrfp_defs.vh"


// This module is not used anymore and may not function
// correctly. This is kept here for historical reasons as I may want
// to refer back to this module when implementing double precision
// HRFP_16 numbers.
module hrfp_normalize
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
		      input wire [`MSBBIT:0] result_4,
		      input wire [30:0]      mantissa_4,
		      input wire [7:0] zeroesmask_4,
		      output reg [30:0]      mantissa_5,
		      output reg [`MSBBIT:0] result_5);

   (* KEEP = "SOFT" *) reg [7:0] 				     zeroes;
   (* KEEP = "SOFT" *) reg [2:0] 				     expdiff;
   (* KEEP = "SOFT" *) reg [1:0] 				     expdiff_mux0;
   (* KEEP = "SOFT" *) reg [1:0] 				     expdiff_mux1;

   reg expdiff_carryin;

   (* KEEP = "SOFT" *) wire rounding_will_overflow_tmp0 = (mantissa_4[30:25] == 6'b011111);
   (* KEEP = "SOFT" *) wire rounding_will_overflow_tmp1 = (mantissa_4[24:19] == 6'b111111);
   (* KEEP = "SOFT" *) wire rounding_will_overflow_tmp2 = (mantissa_4[18:13] == 6'b111111);
   (* KEEP = "SOFT" *) wire rounding_will_overflow_tmp3 = (mantissa_4[12:7] == 6'b111111);
   (* KEEP = "SOFT" *) wire rounding_will_overflow_tmp4 = (mantissa_4[6:1] == 6'b111111);
                       wire rounding_will_overflow_tmp5 = (mantissa_4[0] == 1'b1);
   (* KEEP = "SOFT" *) wire rounding_will_overflow = rounding_will_overflow_tmp0 &&
                                                     rounding_will_overflow_tmp1 &&
                                                     rounding_will_overflow_tmp2 &&
                                                     rounding_will_overflow_tmp3 &&
                                                     rounding_will_overflow_tmp4 &&
                                                     rounding_will_overflow_tmp5;

   wire 		    overflow_bit = mantissa_4[30];

   initial begin
      $display("ERROR ERROR ERROR: This file is deprecated and only kept for historical reasons.");
      $stop;
   end


	/*
      rounding_will_overflow = 0;
      if(mantissa_4[30:5] == 26'h1ffffff) begin
	 rounding_will_overflow = 1;
      end
	 */
   
//   (* KEEP = "SOFT" *) reg 					     iszero;
   (* KEEP = "SOFT" *) wire 		    iszero = (mantissa_4 == 0);
   always @* begin
      zeroes[0] = ~|mantissa_4[1:0] && zeroesmask_4[0];
      zeroes[1] = ~|mantissa_4[5:2] && zeroesmask_4[1];
      zeroes[2] = ~|mantissa_4[9:6] && zeroesmask_4[2];
      zeroes[3] = ~|mantissa_4[13:10] && zeroesmask_4[3];
      zeroes[4] = ~|mantissa_4[17:14] && zeroesmask_4[4];
      zeroes[5] = ~|mantissa_4[21:18] && zeroesmask_4[5];
      zeroes[6] = ~|mantissa_4[25:22] && zeroesmask_4[6];
      zeroes[7] = ~|mantissa_4[29:26] && zeroesmask_4[7];   // 8 LUTs    (confirmed!)

//      iszero = 0;
      expdiff = 0;
//      if(zeroes == 8'b11111111) begin
//	 iszero = 1;
//      end
      casez(zeroes)
	8'b1111111?: expdiff = 3'b111; // No need to check for 8'b11111111 since iszero is one in that case!
	8'b1111110?: expdiff = 3'b110;
	8'b111110??: expdiff = 3'b101;
	8'b11110???: expdiff = 3'b100;
	8'b1110????: expdiff = 3'b011;
	8'b110?????: expdiff = 3'b010;
	8'b10??????: expdiff = 3'b001;
	8'b0???????: expdiff = 3'b000;
      endcase // casez (zeroes)      // 4 LUTs (?)

      casez({overflow_bit,zeroes[3:0]})
	5'b1????: expdiff_mux1 = 3; 
	5'b0111?: expdiff_mux1 = 3; 
	5'b0110?: expdiff_mux1 = 2;
	5'b010??: expdiff_mux1 = 1;
	5'b00???: expdiff_mux1 = 0;
      endcase // casez (zeroes)      // 4 LUTs (?)
      
      casez(zeroes[7:4])
	4'b111?: expdiff_mux0 = 3;
	4'b110?: expdiff_mux0 = 2;
	4'b10??: expdiff_mux0 = 1;
	4'b0???: expdiff_mux0 = 0;
      endcase // casez (zeroes)      // 4 LUTs (?)


      
      expdiff_carryin = overflow_bit;
//      if(mantissa_4[30] ) begin
//          expdiff = 0; // In this case, expdiff will be ignored.
//      end

      // In the code below, 30:5 is used to check for rounded
      // overflow.  expdiff_carryin will be of course be set in this
      // case as well.  (Both because mantissa_4[30] is set
      // (c.f. above) and because the following condition is true.
      if(mantissa_4[29:5] == 25'h1ffffff) begin
         //          expdiff = 0; // Expdiff value doesn't matter in this case!
          expdiff_carryin = 1;
      end

   end // always @ *

   (* KEEP = "SOFT" *) reg [30:0] mantissa_mux_0,mantissa_mux_1;
   wire [30:0] mantissa_shifted;
   wire [30:0] overflow_mantissa = {3'b000, mantissa_4[30:5], |mantissa_4[4:0]};
   wire [30:0] overflow_or_normal_mantissa = overflow_bit ?  overflow_mantissa : {mantissa_4[1:0],  28'b0};
   
   
   always @* begin
      case(expdiff_mux1[1:0])
 	3: mantissa_mux_1 = overflow_mantissa;  // Corresponds to expdiff = 7
 	2: mantissa_mux_1 = {mantissa_4[5:0],  24'b0};   // Corresponds to expdiff = 6
 	1: mantissa_mux_1 = {mantissa_4[9:0],  20'b0};  // Corresponds to expdiff = 5
 	0: mantissa_mux_1 = {mantissa_4[13:0], 16'b0};  // Corresponds to expdiff = 4
      endcase // case (expdiff[1:0])

      case(expdiff_mux0[1:0])
 	3: mantissa_mux_0 = {mantissa_4[17:0], 12'b0};  // Corresponds to expdiff = 3
 	2: mantissa_mux_0 = {mantissa_4[21:0], 8'b0};   // Corresponds to expdiff = 2
 	1: mantissa_mux_0 = {mantissa_4[25:0], 4'b0};   // Corresponds to expdiff = 1
 	0: mantissa_mux_0 = {mantissa_4[29:0]};         // Corresponds to expdiff = 0
      endcase // casez (expdiff[1:0])

   end // always @ *


/*   
   // FIXME - very wasteful since this mux is only needed in a few
   // cases due to the large number of zeroes in the expression above.
   generate
      genvar i;
      for(i=0; i <= 30; i = i + 1) begin : f7mux
	 MUXF7 f7(.I0(mantissa_mux_0[i]),
		  .I1(mantissa_mux_1[i]),
		  .S(expdiff[2]),
		  .O(mantissa_shifted[i]));
      end
      
   endgenerate
*/
   assign mantissa_shifted = (expdiff[2] || overflow_bit) ? mantissa_mux_1 : mantissa_mux_0;
   
   wire [`EXPONENTBITS:0] expdiff_tmp = expdiff_carryin ? 8'b11111111 : expdiff;


   always @(posedge clk) begin
      result_5 <= result_4;
      // $display("Zeroes is %x", zeroes);

      // Note: the case where zeroes == 8'b11111111 is handled implicitly since
      // the mantissa is all zero in this case. (That is, mantissa_5 will be set to 0,
      // regardless of the setting of expdiff!)
//      casez (expdiff)
// 	 7: mantissa_5 <= {mantissa_4[1:0],  28'b0};
// 	 6: mantissa_5 <= {mantissa_4[5:0],  24'b0};
// 	 5: mantissa_5 <= {mantissa_4[9:0],  20'b0};
// 	 4: mantissa_5 <= {mantissa_4[13:0], 16'b0};
// 	 3: mantissa_5 <= {mantissa_4[17:0], 12'b0};
// 	 2: mantissa_5 <= {mantissa_4[21:0], 8'b0};
// 	 1: mantissa_5 <= {mantissa_4[25:0], 4'b0};
// 	 0: mantissa_5 <= {mantissa_4[29:0]};
//      endcase // casez (zeroes)
      mantissa_5 <= mantissa_shifted;
      
      // 4-1 mux: 1 LUT
      // 8-1 mux: 2 LUT
      // 31 bit 8-1 mux: 62 LUTs (less due to use of reset input!)


      // This is the same as the statement above but tweaked so that we hopefully get only one adder.
      result_5`EXPONENT <= result_4`EXPONENT - expdiff_tmp;
	

//      if(iszero) result_5`EXPSPEC <= 0;

      
//      if(overflow_bit) begin
//	 result_5`EXPONENT <= result_4`EXPONENT + 1;    // This might also overflow but is also handled below during overflow check.

//	 mantissa_5 <=  {3'b000, mantissa_4[30:5], |mantissa_4[4:0] }; // Oops, a 9-1 mux!
//      end

      // Detect if rounding operation will overflow!
      // Note: Since this is an odd number there is no need to check/generate sticky bit (e.g. |mantissa_4[4:0]
      if(rounding_will_overflow) begin
	 mantissa_5 <= {4'b0001, 26'h0};  // Reset/Set input could be used for this...
//	 result_5`EXPONENT <= result_4`EXPONENT + 1;	// Might overflow but this is handled below during the overflow check where the INF bit will be set.
      end
      
      // OVERFLOW!
      if(result_4`EXPONENT == 63+8'b01000000) begin
	 // A thorough testing is needed to determine if this works correctly or not.
	 if(mantissa_4[29] && !result_4`SPECIAL) begin
	    result_5`IS_INF_OR_NAN <= 1;
	    result_5`HRFP_IS_NAN <= 0;
	 end
      end

   end // always @ (posedge clk)



endmodule
