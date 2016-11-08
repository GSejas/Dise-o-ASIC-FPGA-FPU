// Add a few registers on the inputs/outputs to ensure that F_max is
// not restricted due to I/O timing.

`include "hrfp_defs.vh"

module mult_wrapper(input wire clk,
		     input wire [`MSBBIT:0]  op_a, op_b,
		     output reg [`MSBBIT:0] result);

   wire [`MSBBIT:0] 			     res0;
   reg [`MSBBIT:0] 			     res1, res2, res3, res4, a1,a2,b1,b2;

   always @(posedge clk) begin
      res1 <= res0;
      res2 <= res1;
      res3 <= res2;
      res4 <= res3;
      result <= res4;
      a1 <= op_a;
      a2 <= a1;
      b1 <= op_b;
      b2 <= b1;
   end
   

   
   mult add(
	     // Outputs
	     .result			(res0),
	     // Inputs
	     .clk			(clk),
	     .op_a			(a2),
	     .op_b			(b2));
   
   

endmodule
