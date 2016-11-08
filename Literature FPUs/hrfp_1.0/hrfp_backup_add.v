module hrfp_add
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
		input wire [`MSBBIT:0] op3_a, op3_b,
		input wire [30:0]      mantissa_3_align0, mantissa_3_align1,
		input wire expdiff_msb_3,
		output reg [`MSBBIT:0] result_4,
		output reg [30:0]      mantissa_4,
		output reg [7:0]       zeroesmask_4);

    reg [`MSBBIT:0] result_4_comb;
    reg [30:0]      mantissa_4_comb;
    reg [7:0]       zeroesmask_4_comb;

   reg [30:0] 			 aligned_mantissa;
   always @* begin
      if(expdiff_msb_3) begin
 	 aligned_mantissa <= mantissa_3_align1;
      end else begin
 	 aligned_mantissa <= mantissa_3_align0;
      end
      
   end
   
   always @* begin
      result_4_comb = op3_a; // Exponent and sign
      
      if(op3_b`SIGN == op3_a`SIGN) begin
	 mantissa_4_comb = ({op3_a`MANTISSA,3'b0} + aligned_mantissa);
      end else begin
	 mantissa_4_comb = ({op3_a`MANTISSA,3'b0} - aligned_mantissa); 
      end

      zeroesmask_4_comb = 8'hff;
      case(op3_a`EXPONENT)
	0: zeroesmask_4_comb[7:0] = 0;
	1: zeroesmask_4_comb[6:0] = 0;
	2: zeroesmask_4_comb[5:0] = 0;
	3: zeroesmask_4_comb[4:0] = 0;
	4: zeroesmask_4_comb[3:0] = 0;
	5: zeroesmask_4_comb[2:0] = 0;
	6: zeroesmask_4_comb[1:0] = 0;
	7: zeroesmask_4_comb[0] = 0;         // 8 LUTs :(
      endcase
   end

   generate
	if (PIPELINESTAGES==5) begin : ADDREG
	    always @(posedge clk) begin
	       result_4 <= result_4_comb;
	       mantissa_4 <= mantissa_4_comb;
	       zeroesmask_4 <= zeroesmask_4_comb;
            end
	       
        end else begin // FIXME - check number of pipeline stages!
	   always @* begin
	      result_4 <= result_4_comb;
	      mantissa_4 <= mantissa_4_comb;
	      zeroesmask_4 <= zeroesmask_4_comb;
	   end // else: !if(PIPELINESTAGES==5)
	end // else: !if(PIPELINESTAGES==5)
   endgenerate


endmodule
