`include "hrfp_defs.vh"
module hrfp_align
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
		  input wire [2:0] 	 expdiff_2,
		  input wire 		 expdiff_saturated_2,
		  output reg 		 expdiff_msb_3,
		  input wire [`MSBBIT:0] op2_a, op2_b,
		  output reg [`MSBBIT:0] op3_a, op3_b,
		  output reg [30:0] 	 mantissa_3_align0, mantissa_3_align1
		  );



   always @(posedge clk)  begin
      expdiff_msb_3 <= expdiff_2[2];
      // We divide this 8-1 mux into two 4-1 muxes. The final 2-1 mux
      // is in the next stage where it will be merged into the same
      // LUTs used for the adder.
      case(expdiff_2[1:0])
         0: mantissa_3_align0 <= {1'b0, op2_b`MANTISSA, 3'b0};
	 1: mantissa_3_align0 <= {5'b0,  op2_b[26:2] , |op2_b[1:0]};
	 2: mantissa_3_align0 <= {9'b0,  op2_b[26:6] , |op2_b[5:0]};
	 3: mantissa_3_align0 <= {13'b0, op2_b[26:10], |op2_b[9:0]};
      endcase // case (expdiff_2[1:0])
      case(expdiff_2[1:0])
	 0: mantissa_3_align1 <= {17'b0, op2_b[26:14], |op2_b[13:0]};
	 1: mantissa_3_align1 <= {21'b0, op2_b[26:18], |op2_b[17:0]};
	 2: mantissa_3_align1 <= {25'b0, op2_b[26:22], |op2_b[21:0]};
	 3: mantissa_3_align1 <= {28'b0, op2_b[26], |op2_b[25:0]};
      endcase // case (expdiff_2[1:0])

      // Note: This may be a bit pessimistic, there may be other ways
      // to solve this particular case.
      if(expdiff_saturated_2) begin
	 mantissa_3_align1 <= |op2_b[26:0];
      end
   end

   always @(posedge clk) begin
      op3_a <= op2_a;
      op3_b <= op2_b;

      
   end // always @ (posedge clk)


endmodule
