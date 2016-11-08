`include "hrfp_defs.vh"
module hrfp_mult_createroundvectors(input wire clk,
				    input wire [53:0] 		   normalized_mantissa,
				    input wire [`EXPONENTBITS-1+1:0] exponent4, 
				    output reg [53:0] 		   final_roundvector, final_roundvector2, hrfp_round_mask);


   reg [53:0] 							   precalculated_roundvector4;
   reg [53:0] 							   precalculated_roundvector2_4;
   reg [53:0] 							   precalculated_hrfp_round_mask4;
   reg 								   do_override4;
   reg 								   specialcase;
   

   always @(posedge clk) begin
      precalculated_roundvector4 <= 54'b000000000000000000000000001111111111111111111111111111;
      precalculated_roundvector2_4 <= 54'b000000000000000000000000001000000000000000000000000000;
//      precalculated_roundvector4 <= 0;
//      precalculated_roundvector2_4 <= 0;
      do_override4 <= 0;
      specialcase <= 0;

`ifdef MULT_SUBNORMALS
      if(exponent4 == 64) begin
	 specialcase <= 1;
      end
      case(exponent4)
	63: do_override4 <= 1;
	62: do_override4 <= 1;
	61: do_override4 <= 1;
	60: do_override4 <= 1;
	59: do_override4 <= 1;
	58: do_override4 <= 1;
      endcase


                                              
//           4'b1???: final_roundvector = 54'b000000000000000000000000011111111111111111111111111111;
//   	     4'b01??: final_roundvector = 54'b000000000000000000000000001111111111111111111111111111;
//   	     4'b001?: final_roundvector = 54'b000000000000000000000000000111111111111111111111111111;
//   	     4'b000?: final_roundvector = 54'b000000000000000000000000000011111111111111111111111111;
//                                                 xxxxxxxxxxxxxxxxxxxxxxxx
      case(exponent4)
	64: precalculated_roundvector4 <= 54'b000000000000000000000000001111111111111111111111111111;
	63: precalculated_roundvector4 <= 54'b000000000000000000000011111111111111111111111111111111;
	62: precalculated_roundvector4 <= 54'b000000000000000000111111111111111111111111111111111111;
	61: precalculated_roundvector4 <= 54'b000000000000001111111111111111111111111111111111111111;
	60: precalculated_roundvector4 <= 54'b000000000011111111111111111111111111111111111111111111;
	59: precalculated_roundvector4 <= 54'b000000111111111111111111111111111111111111111111111111;
	58: precalculated_roundvector4 <= 54'b001111111111111111111111111111111111111111111111111111;
      endcase

      
      case(exponent4)
	64: precalculated_roundvector2_4 <= 54'b000000000000000000000000001000000000000000000000000000;
	63: precalculated_roundvector2_4 <= 54'b000000000000000000000010000000000000000000000000000000;
	62: precalculated_roundvector2_4 <= 54'b000000000000000000100000000000000000000000000000000000;
	61: precalculated_roundvector2_4 <= 54'b000000000000001000000000000000000000000000000000000000;
	60: precalculated_roundvector2_4 <= 54'b000000000010000000000000000000000000000000000000000000;
	59: precalculated_roundvector2_4 <= 54'b000000100000000000000000000000000000000000000000000000;
	58: precalculated_roundvector2_4 <= 54'b001000000000000000000000000000000000000000000000000000;
      endcase

      // Some default value for this... (fixme - should perhaps be 54'bxxxxxx...)
      precalculated_hrfp_round_mask4 <= 54'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      precalculated_hrfp_round_mask4 <= 54'b111111111111111111111111100000000000000000000000000000;
      case(exponent4)
	64: precalculated_hrfp_round_mask4 <= 54'b111111111111111111111111100000000000000000000000000000;
	63: precalculated_hrfp_round_mask4 <= 54'b111111111111111111111000000000000000000000000000000000;
	62: precalculated_hrfp_round_mask4 <= 54'b111111111111111110000000000000000000000000000000000000;
	61: precalculated_hrfp_round_mask4 <= 54'b111111111111100000000000000000000000000000000000000000;
	60: precalculated_hrfp_round_mask4 <= 54'b111111111000000000000000000000000000000000000000000000;
	59: precalculated_hrfp_round_mask4 <= 54'b111110000000000000000000000000000000000000000000000000;
	58: precalculated_hrfp_round_mask4 <= 54'b100000000000000000000000000000000000000000000000000000;
      endcase

      if(exponent4 < 58) begin
	 do_override4 <= 1;
	 precalculated_hrfp_round_mask4 <= 54'd0;
      end
`endif
   end

   always @* begin
      casez(normalized_mantissa[53:50])
	4'b1???: final_roundvector = 54'b000000000000000000000000011111111111111111111111111111;
	4'b01??: final_roundvector = 54'b000000000000000000000000001111111111111111111111111111;
	4'b001?: final_roundvector = 54'b000000000000000000000000000111111111111111111111111111;
	4'b000?: final_roundvector = 54'b000000000000000000000000000011111111111111111111111111;
      endcase

//       casez(normalized_mantissa[52:49])
// 	4'b1???: final_roundvector2 = normalized_mantissa[31] << 29;
// 	4'b01??: final_roundvector2 = normalized_mantissa[30] << 28;
// 	4'b001?: final_roundvector2 = normalized_mantissa[29] << 27;
// 	4'b000?: final_roundvector2 = normalized_mantissa[28] << 26;
//       endcase

      casez(normalized_mantissa[53:50])
	4'b1???: final_roundvector2 = 1'b1 << 28;
	4'b01??: final_roundvector2 = 1'b1 << 27;
	4'b001?: final_roundvector2 = 1'b1 << 26;
	4'b000?: final_roundvector2 = 1'b1 << 25;
      endcase
//      final_roundvector2 = final_roundvector2 & normalized_mantissa >> 3;

      hrfp_round_mask[53:27] = -1;
      hrfp_round_mask[26:0] = 0;
      casez(normalized_mantissa[53:50])
	4'b1???: hrfp_round_mask[29:27] = 3'b000;
	4'b01??: hrfp_round_mask[29:27] = 3'b100;
	4'b001?: hrfp_round_mask[29:27] = 3'b110;
	4'b000?: hrfp_round_mask[29:27] = 3'b111;
      endcase

      if(do_override4 || (specialcase && (normalized_mantissa[53:52] == 2'b00))) begin
	 final_roundvector = precalculated_roundvector4;
	 final_roundvector2 = precalculated_roundvector2_4;
	 // Alternative: final_roundvector = final_roundvector | precalculated_roundvector4;
	 hrfp_round_mask = precalculated_hrfp_round_mask4;
      end

      // FIXME - this doesn't seem to be needed any longer, think a
      // bit more about this before removing the code...
//       if(specialcase && (normalized_mantissa[53:52] == 2'b00)) begin
//	  63: precalculated_hrfp_round_mask4 <= 54'b111111111111111111111100000000000000000000000000000000;
//	  
//       end



   end
   

endmodule
