
`include "hrfp_defs.vh"

// Rounding in the HRFP_16 adder
module hrfp_round
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
		  output reg [`MSBBIT:0] result,
		  input wire 		 overflow_bit_5, iszero_5,
		  input wire 		 overflow_roundvector_5, 
		  input wire [30:0] 	 mantissa_5,
		  input wire [30:0] 	 overflow_mantissa_5,
		  input wire [`EXPONENTBITS-1:0] 	 expdiff_5,
		  input wire 		 expdiff_addone_5,expdiff_nochange_5,
		  input wire [`MSBBIT:0] result_5);


   // What bits should we keep of the LSB part of the mantissa?
   reg [2:0] mask;

   (* KEEP = "SOFT" *)    reg [3:0] roundmask;
   (* KEEP = "SOFT" *) reg [3:0] roundvector;
   reg [30:0] final_mantissa_from_normalize;

   always @* begin
      if(overflow_bit_5) begin
	 final_mantissa_from_normalize = overflow_mantissa_5;
      end else begin
	 final_mantissa_from_normalize = mantissa_5;
      end
   end

   reg [30:0] final_roundvector;
   reg [30:0] final_roundvector2;

   // We need to emulate IEEE-754 style round to nearest even by
   // rounding at the correct bit position depending on where the
   // explicit one is located in the HRFP_16 number.
   
   always @* begin
      casez(mantissa_5[29:26])
//                                       xxxxxxxxxxxxxxxxxxxxxxxx
	4'b1???: final_roundvector = 30'b000000000000000000000000011111;
	4'b01??: final_roundvector = 30'b000000000000000000000000001111;
	4'b001?: final_roundvector = 30'b000000000000000000000000000111;
	4'b000?: final_roundvector = 30'b000000000000000000000000000011;
//                                          xxxxxxxxxxxxxxxxxxxxxxxx
      endcase

      casez(mantissa_5[29:26])
	4'b1???: final_roundvector2 =  (mantissa_5[6] << 4);
	4'b01??: final_roundvector2 =  (mantissa_5[5] << 3);
	4'b001?: final_roundvector2 =  (mantissa_5[4] << 2);
	4'b000?: final_roundvector2 =  (mantissa_5[3] << 1);
      endcase
      
      casez(mantissa_5[29:26])
	4'b1???: mask = 3'b000;
	4'b01??: mask = 3'b100;
	4'b001?: mask = 3'b110;
	4'b000?: mask = 3'b111; // Note: 0000 will not happen except for subnormal HRFP_16 numbers
	                        // which we should never get! (Not to be confused with emulated
	                        // IEEE-754 style sub normal numbers in HRFP_16 which are actually
	                        // normalized (but with a varying number of MSB bits forced to 0
	                        // depending on the value of the exponent).)
      endcase
      casez(mantissa_5[29:26])
	4'b1???: roundmask = 4'b1000;
	4'b01??: roundmask = 4'b0100;
	4'b001?: roundmask = 4'b0010;
	4'b000?: roundmask = 4'b0001; // Note: 0000 will not happen except for denormalized numbers.
      endcase // casez (mantissa_5[29:26])

      roundvector[3] = mantissa_5[6] || |mantissa_5[4:0]; // Could probably be done in some other way...
      roundvector[2] = mantissa_5[5] || |mantissa_5[3:0];
      roundvector[1] = mantissa_5[4] || |mantissa_5[2:0];
      roundvector[0] = mantissa_5[3] || |mantissa_5[1:0];

      // Override the output of this block during overflow handling.
      if(overflow_bit_5) begin
	 roundvector[0] = overflow_roundvector_5;
	 final_roundvector = 30'b000000000000000000000000000011;
	 final_roundvector2 = overflow_mantissa_5[3] << 1;
	 
	 mask = 3'b111;
	 roundmask = 4'b0001;
      end
   end


   // Special case where we would add one to the exponent is handled
   // specially in normalize stage instead!
   reg [30:0] mantissa_6;


   // This should be mergable into the LUTs used for the subtracter below.
   wire [`EXPONENTBITS-1:0] expdiff_tmp = iszero_5 ? result_5`EXPONENT :
			                  expdiff_nochange_5 ? 8'b00000000 : 
 	                                  expdiff_addone_5 ? 8'b11111111 : 
                                               (expdiff_5 ^ 8'b00000100); // Else 

   always @* begin
      result = result_5;
      mantissa_6 = (final_mantissa_from_normalize[30:2] + (roundvector & roundmask));
`ifdef DEBUG
      $display("******************************************************************************");
      $display("  STATUS: Overflow_bit_5 is %b", overflow_bit_5);
      
      $display("final_mantissa_from_normalize: %b", final_mantissa_from_normalize);
      $display("                              +                         %b (roundvector & roundmask)", roundvector & roundmask);
      $display("                               -----------------------------");
      $display("                               %b", mantissa_6[30:2]);
      
      $display(" Roundvector:                 +                         %b", roundvector);
      $display(" Roundmask                                              %b", roundvector & roundmask);
`endif
      mantissa_6 = (final_mantissa_from_normalize | final_roundvector2) + final_roundvector;
`ifdef DEBUG
      $display("final_mantissa_from_normalize: %b", final_mantissa_from_normalize);
      $display("final_roundvector2:          | %b", final_roundvector2);
      $display("final_roundvector:           + %b", final_roundvector);
      $display("                               ------------------------------");
      $display("                               %b", mantissa_6[30:2]);
`endif
      
      mantissa_6 = mantissa_6 >> 2;
      result`MANTISSA = mantissa_6[28:1]; // FIXME: 28? Shouldn't it be 27?
      result[2:0]     = mantissa_6[3:1] & mask;
      result`EXPONENT = result_5`EXPONENT - expdiff_tmp; // 6 LUTs



   end

endmodule
