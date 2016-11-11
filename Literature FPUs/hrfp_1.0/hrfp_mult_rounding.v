`include "hrfp_defs.vh"


module hrfp_mult_rounding(input wire clk,
			  input wire [53:0] 			final_roundvector,
								final_roundvector2,
								normalized_mantissa,
			  input wire [`EXPONENTBITS -1 + 1 : 0] exponent_post_norm,
			  input wire [53:0] hrfp_round_mask,
			  output reg [53:0] 			rounded_mantissa,
			  output reg [`EXPONENTBITS -1 + 1 : 0] exponent_post_round,
			  output reg [53:0] 			final_hrfp_round_mask);


   
   always @* begin : DOROUND
      reg carry;
      // Round to nearest even...
      rounded_mantissa = (normalized_mantissa | (final_roundvector2 & normalized_mantissa >> 2)) + final_roundvector;
      final_hrfp_round_mask = hrfp_round_mask;
      
      exponent_post_round = exponent_post_norm;
      

   end

   
endmodule
