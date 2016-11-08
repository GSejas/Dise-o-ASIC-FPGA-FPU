`include "hrfp_defs.vh"

module hrfp_mult_normalize
  (output reg expdiff,
   output reg [53:0] normalized_mantissa,
   input wire 	     clk,
   input wire [53:0] mantissa4, mantissa5);
   

   parameter EARLY_EXPDIFF = 1;
   parameter EARLY_NORMALIZE = 0;
   

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

   
endmodule
