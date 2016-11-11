`include "hrfp_defs.vh"

module hrfp_mult_detect_round_overflow(input wire clk,
				       input wire [53:0] 		mantissa,
				       input wire [`EXPONENTBITS-1+1:0] precalculated_exponent4,
				       output reg [`MANTISSABITS-1:0] new_mantissa,
				       output reg [`EXPONENTBITS-1:0] new_exponent,
				       output reg rounding_overflowed);


   reg [53:0] 								mask;
   reg 									true_overflow_happened;
   reg 									overflow_to_msb_part_happened;

   // Note: For this variant we don't need to take into account anything larger than 63,
   // as we can never get an overflow in that case.
   // Proof:
   // Maximum mantissa in radix 16 is 111111111111111111111111000.
   // 111111111111111111111111000 * 111111111111111111111111000 =
   // 111111111111111111111110000000000000000000000001000000 (mantissa before rounding)
   // 111111111111111111111110  (mantissa after rounding)
   // However, for the case where the result is 00001111111111111111111111111xxxxxxx
   // an overflow _can_ happen. (See below)
////    reg [53:0] 								mask1;
////    always @* begin : CHECK_TRUE_OVERFLOW
////       // FIXME - figure out how many ones are needed in mask1...
////       // The mask is set so that overflow can never happen for this case...
////       mask1 <= 54'b111111111111111111111111111110000000000000000000000000;
////       casez(precalculated_exponent+1)
//// 	63: mask1 <= 54'b111111111111111111111100000000000000000000000000000000;
//// 	62: mask1 <= 54'b111111111111111111000000000000000000000000000000000000;
//// 	61: mask1 <= 54'b111111111111110000000000000000000000000000000000000000;
//// 	60: mask1 <= 54'b111111111100000000000000000000000000000000000000000000;
//// 	59: mask1 <= 54'b111111000000000000000000000000000000000000000000000000;
//// 	58: mask1 <= 54'b110000000000000000000000000000000000000000000000000000;
////       endcase
////    end

   reg [53:0] 								mask3;
   always @(posedge clk) begin : CHECK_TRUE_OVERFLOW_PIPED
      // FIXME - figure out how many ones are needed in mask1...
      // The mask is set so that overflow can never happen for this case...
      mask3 <= 54'b111111111111111111111111111110000000000000000000000000;
`ifdef MULT_SUBNORMALS
      casez(precalculated_exponent4+1)
	63: mask3 <= 54'b111111111111111111111100000000000000000000000000000000;
	62: mask3 <= 54'b111111111111111111000000000000000000000000000000000000;
	61: mask3 <= 54'b111111111111110000000000000000000000000000000000000000;
	60: mask3 <= 54'b111111111100000000000000000000000000000000000000000000;
	59: mask3 <= 54'b111111000000000000000000000000000000000000000000000000;
	58: mask3 <= 54'b110000000000000000000000000000000000000000000000000000;
      endcase
`endif
   end
   

   always @* begin
      true_overflow_happened = 0;
      if(mask3 == (mantissa & mask3)) begin
	 true_overflow_happened = 1;
      end
   end


//    reg [53:0] mask2;
//    always @* begin : CHECK_OVERFLOW_TO_MSB_PART
//       
//       mask2 <= 54'b000011111111111111111111111110000000000000000000000000;
//       casez(precalculated_exponent)
// 	63: mask2 <= 54'b000011111111111111111111110000000000000000000000000000;
// 	62: mask2 <= 54'b000011111111111111111100000000000000000000000000000000;
// 	61: mask2 <= 54'b000011111111111111000000000000000000000000000000000000;
// 	60: mask2 <= 54'b000011111111110000000000000000000000000000000000000000;
// 	59: mask2 <= 54'b000011111100000000000000000000000000000000000000000000;
// 	58: mask2 <= 54'b000011000000000000000000000000000000000000000000000000;
//       endcase
//    end

   reg [53:0] mask4;
   always @(posedge clk) begin : CHECK_OVERFLOW_TO_MSB_PART_PIPED
      
      mask4 <= 54'b000011111111111111111111111110000000000000000000000000;
`ifdef MULT_SUBNORMALS
      casez(precalculated_exponent4)
	63: mask4 <= 54'b000011111111111111111111110000000000000000000000000000;
	62: mask4 <= 54'b000011111111111111111100000000000000000000000000000000;
	61: mask4 <= 54'b000011111111111111000000000000000000000000000000000000;
	60: mask4 <= 54'b000011111111110000000000000000000000000000000000000000;
	59: mask4 <= 54'b000011111100000000000000000000000000000000000000000000;
	58: mask4 <= 54'b000011000000000000000000000000000000000000000000000000;
      endcase
`endif
   end
   
   always @* begin
      overflow_to_msb_part_happened = 0;
      if(mask4 == (mantissa & mask4)) begin
	 if(!mantissa[53:50]) begin
	   overflow_to_msb_part_happened = 1;
	 end
      end
   end

   reg [`EXPONENTBITS -1:0] precalculated_exponent_plus1,precalculated_exponent_plus2;
   always @(posedge clk) begin
      precalculated_exponent_plus1 <= precalculated_exponent4 + 1;
      precalculated_exponent_plus2 <= precalculated_exponent4 + 2;
      
   end

   always @* begin
      new_mantissa = 27'b0;
      new_exponent = 0;
      rounding_overflowed = 0;
      
      if(true_overflow_happened) begin
	 new_mantissa = 27'b000100000000000000000000000;
	 new_exponent = precalculated_exponent_plus2;
	 rounding_overflowed = 1;
      end
      if(overflow_to_msb_part_happened) begin
	 new_mantissa = 27'b000100000000000000000000000;
	 new_exponent = precalculated_exponent_plus1;
	 rounding_overflowed = 1;
      end
   end


`ifdef DEBUG
   integer first = 10;
   always @(posedge clk) begin
//      $display("Mask 1:   %b", mask1);
//      $display("Mask 2:   %b", mask2);
      $display("Mask 3:   %b", mask3);
      $display("Mask 4:   %b", mask4);
      $display("Mantissa: %b", mantissa);
      $display("mantissa & mask1: %b", mantissa & mask3);
      $display("mantissa & mask2: %b", mantissa & mask4);
      
      
      $display("OVERFLOW %b %b", true_overflow_happened, overflow_to_msb_part_happened);

//      if(!first) begin
//	 if(mask1 !== mask3) begin
//	    $display("mask1 !== mask3!!! %b %b", mask1, mask3);
//	    $stop;
//	 end
//	 if(mask2 !== mask4) begin
//	    $display("mask2 !== mask4!!! %b %b", mask2, mask4);
//	    $stop;
//	 end
//      end
//      if(first)  first = first - 1;
      
//      if(true_overflow_happened || overflow_to_msb_part_happened) begin
//	 $stop;
//      end
   end
`endif   

endmodule

  