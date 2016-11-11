`include "hrfp_defs.vh"


// Very Xilinx optimized normalization module for the HRFP_16 adder.
module hrfp_xilinx_normalize
	#(parameter PIPELINESTAGES=5)
	(input wire clk,
		      input wire [`MSBBIT:0] 	     result_4,
		      input wire [30:0] 	     mantissa_4,
		      input wire [7:0] 		     zeroesmask_4,
		      output reg [`EXPONENTBITS-1:0] expdiff_5,
		      output reg 		     expdiff_addone_5,expdiff_nochange_5,
		      output reg [30:0] 	     mantissa_5,
		      output reg [30:0] 	     overflow_mantissa_5,
		      output reg 		     overflow_roundvector_5,
		      output reg [`MSBBIT:0] 	     result_5,
		      output reg 		     overflow_bit_5,
		      output reg 		     iszero_5);

   reg [2:0] expdiff_behav;

   reg expdiff_carryin_behav, expdiff_nochange_behav;


   

   
   wire 		    overflow_bit = mantissa_4[30];
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [2:0]		expdiff;		// From kludge of xilinx_stuff.v
   wire			expdiff_carryin;	// From kludge of xilinx_stuff.v
   wire [1:0]		expdiff_mux0;		// From kludge of xilinx_stuff.v
   wire [1:0]		expdiff_mux1;		// From kludge of xilinx_stuff.v
   wire			expdiff_nochange;	// From kludge of xilinx_stuff.v
   wire			rounding_will_overflow;	// From kludge of xilinx_stuff.v
   wire [7:0]		zeroes;			// From kludge of xilinx_stuff.v
   // End of automatics


   // NOTE: expdiff output from this module has expdiff[2] inverted to
   // save a little area.
   xilinx_stuff kludge(/*AUTOINST*/
		       // Outputs
		       .expdiff_mux1	(expdiff_mux1[1:0]),
		       .expdiff_mux0	(expdiff_mux0[1:0]),
		       .expdiff		(expdiff[2:0]),
		       .expdiff_carryin	(expdiff_carryin),
		       .expdiff_nochange(expdiff_nochange),
		       .rounding_will_overflow(rounding_will_overflow),
		       .zeroes		(zeroes[7:0]),
		       // Inputs
		       .mantissa_4	(mantissa_4),
		       .overflow_bit	(overflow_bit),
		       .clk		(clk));                   
   




   
// Note: Not sure if it works with icarus any longer, but I will keep this here for now.
`ifdef ICARUS 
   wire 		iszero_comb = (mantissa_4 == 0);
`else
   wire 		iszero_behav = (mantissa_4 == 0);
   wire 		iszero_comb = (expdiff == 3'b011) && !mantissa_4[30];
`endif
   always @* begin

      // expdiff_behav is only used for sanity checking further down
      // and shouldn't actually be synthesized.
      expdiff_behav = 0;

      casez(zeroes)
	8'b1111111?: expdiff_behav = 3'b111; // No need to check for 8'b11111111 since iszero is one in that case!
	8'b1111110?: expdiff_behav = 3'b110;
	8'b111110??: expdiff_behav = 3'b101;
	8'b11110???: expdiff_behav = 3'b100;
	8'b1110????: expdiff_behav = 3'b011;
	8'b110?????: expdiff_behav = 3'b010;
	8'b10??????: expdiff_behav = 3'b001;
	8'b0???????: expdiff_behav = 3'b000;
      endcase // casez (zeroes)      // 5 LUTs at most

      


      
      expdiff_nochange_behav = 0;
      expdiff_carryin_behav = overflow_bit;

      // In the code below, 30:5 is used to check for rounded
      // overflow.  expdiff_carryin will be of course be set in this
      // case as well.  (Both because mantissa_4[30] is set
      // (c.f. above) and because the following condition is true.
      if((mantissa_4[29:5] == 25'h1ffffff)) begin   // Maximum of 6 LUTs
          expdiff_carryin_behav = 1; // Rounding will overflow in this case...
      end
      // In this case we will round up and end up in a situation where the original
      // exponent is kept.
      if((mantissa_4[29:1] == 29'h01ffffff)) begin   // Reuses some of the LUTs from above
	 expdiff_nochange_behav = 1;
      end

   end // always @ *

   (* KEEP = "SOFT" *) reg [30:0] mantissa_mux_0,mantissa_mux_1;
   wire [30:0] mantissa_shifted;
   wire [30:0] overflow_mantissa = {3'b000, mantissa_4[30:5], |mantissa_4[4:0]};



   // synopsys translate_off 
   // Some sanity checks for simulation.
  initial begin
      @(posedge clk); // Ensure we get some don't cares out of the system during simulation.
      @(posedge clk);
      @(posedge clk);
      while(1) begin
	 @(posedge clk);
	 if(expdiff_behav !== (expdiff ^ 8'b100)) begin
	    $display("DIFFERENT! (%b %b %b)", zeroes, expdiff, expdiff_behav);
	 end
	 if(iszero_behav !== (iszero_comb)) begin
	    $display("DIFFERENT! (%b %b %b %b)", zeroes, mantissa_4, iszero_comb, iszero_behav);
	 end

	 if(expdiff_nochange_behav !== expdiff_nochange) begin
	   $display("expdiff_nochange is different (%b %b %b)", mantissa_4, expdiff_nochange, expdiff_nochange_behav);
	 end

	 if(expdiff_carryin_behav !== expdiff_carryin) begin
	   $display("expdiff_carryin is different (%b %b %b)", mantissa_4, expdiff_carryin, expdiff_carryin_behav);
	 end
      end
   end
   // synopsys translate_on
   
   always @* begin
      
      case(expdiff_mux1[1:0])
 	3: mantissa_mux_1 = {mantissa_4[1:0],  28'b0};  // Corresponds to expdiff = 7
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


   // Note the inverted meaning of expdiff[2]
   assign mantissa_shifted = (!expdiff[2] || overflow_bit) ? mantissa_mux_1 : mantissa_mux_0;
   


   always @(posedge clk) begin
      expdiff_addone_5 <= expdiff_carryin;
      expdiff_nochange_5 <= expdiff_nochange;
      expdiff_5 <= expdiff;
      overflow_bit_5 <= overflow_bit || rounding_will_overflow;
      overflow_mantissa_5 <= overflow_mantissa;
      overflow_roundvector_5 <= overflow_mantissa[3] || overflow_mantissa[1:0];
      
      result_5 <= result_4;

      mantissa_5 <= mantissa_shifted;
      


      iszero_5 <= iszero_comb;
      


      // Detect if rounding operation will overflow!
      // Note: Since this is an odd number there is no need to check/generate sticky bit (e.g. |mantissa_4[4:0]
      if(rounding_will_overflow) begin // SR input of FF (no LUTs used)
`ifdef DEBUG
	 $display("Rounding will overflow: mantissa_4 is %b, mantissa_5 is %b, overflow_bit_5 is %b",mantissa_4, mantissa_5, overflow_bit_5);
`endif
      end
      
      // OVERFLOW handling
      if(result_4`EXPONENT == 63 + 10'b0100000000) begin
	 // Bit 30 should probably not need to be checked (unless we care about non-legal values sent to the unit)
	 if(mantissa_4[29] && !result_4`IS_NAN_OR_INF) begin
	    result_5`IS_NAN_OR_INF <= 1;
	    // This should hopefully use the set/reset input of the FF
	    result_5`HRFP_IS_NAN <= 0;
	 end
      end

   end // always @ (posedge clk)



endmodule

// This module contains hand instantiated LUTs. The reason for the
// hand instantiated LUTs are to enable floorplanning using RLOC
// constraints. (The synthesis tool was actually pretty good about
// generating a low-area solution, but the CAD tools were not so good
// about placing the generated logic in a good way, hence the RLOC
// constraints.)
(* KEEP_HIERARCHY="SOFT" *) module xilinx_stuff(input wire [30:0] mantissa_4,
						input wire 	  overflow_bit,
						output wire [1:0] expdiff_mux1,expdiff_mux0,
						output wire [2:0] expdiff,
						output wire 	  expdiff_carryin, expdiff_nochange,
						output wire 	  rounding_will_overflow,
						output wire [7:0] zeroes,
						input wire 	  clk);

   wire [7:0] detect_ones;

   wire [4:0] rounding_will_overflow_tmp;
   
	
   (* HU_SET = "round", RLOC = "X0Y0" *) LUT6 #(.INIT(64'h0000000080000000)) round_overflow_detect0 (.O(rounding_will_overflow_tmp[0]),.I0(mantissa_4[25]),.I1(mantissa_4[26]),.I2(mantissa_4[27]),.I3(mantissa_4[28]),.I4(mantissa_4[29]),.I5(mantissa_4[30]));
   (* HU_SET = "round", RLOC = "X0Y0" *)    LUT6 #(.INIT(64'h8000000000000000)) round_overflow_detect1 (.O(rounding_will_overflow_tmp[1]),.I0(mantissa_4[19]),.I1(mantissa_4[20]),.I2(mantissa_4[21]),.I3(mantissa_4[22]),.I4(mantissa_4[23]),.I5(mantissa_4[24]));
   (* HU_SET = "round", RLOC = "X0Y0" *)    LUT6 #(.INIT(64'h8000000000000000)) round_overflow_detect2 (.O(rounding_will_overflow_tmp[2]),.I0(mantissa_4[13]),.I1(mantissa_4[14]),.I2(mantissa_4[15]),.I3(mantissa_4[16]),.I4(mantissa_4[17]),.I5(mantissa_4[18]));
   (* HU_SET = "round", RLOC = "X0Y0" *)    LUT6 #(.INIT(64'h8000000000000000)) round_overflow_detect3 (.O(rounding_will_overflow_tmp[3]),.I0(mantissa_4[7]),.I1(mantissa_4[8]),.I2(mantissa_4[9]),.I3(mantissa_4[10]),.I4(mantissa_4[11]),.I5(mantissa_4[12]));
   (* HU_SET = "round", RLOC = "X0Y1" *)    LUT6 #(.INIT(64'h8000000000000000)) round_overflow_detect4 (.O(rounding_will_overflow_tmp[4]),.I0(mantissa_4[1]),.I1(mantissa_4[2]),.I2(mantissa_4[3]),.I3(mantissa_4[4]),.I4(mantissa_4[5]),.I5(mantissa_4[6]));

   wire       rounding_will_overflow_old;
   
   (* HU_SET = "round", RLOC = "X0Y1" *)    LUT6 #(.INIT(64'h8000000000000000)) round_overflow_detect (.O(rounding_will_overflow_old),.I0(rounding_will_overflow_tmp[0]),.I1(rounding_will_overflow_tmp[1]),.I2(rounding_will_overflow_tmp[2]),.I3(rounding_will_overflow_tmp[3]),.I4(rounding_will_overflow_tmp[4]),.I5(mantissa_4[0]));

   assign rounding_will_overflow = (&detect_ones[7:4] && &mantissa_4[13:0] && !mantissa_4[30]);
   assign expdiff_carryin = (&detect_ones[7:4] && &mantissa_4[13:5]) || mantissa_4[30];
   assign expdiff_nochange =  (&detect_ones[6:4] && zeroes[7] && &mantissa_4[13:1]);

   
   


   
   (* HU_SET = "zerodetect", RLOC = "X0Y2" *)LUT6_2 #(.INIT(64'h0000800000000001)) zerodetect7(.O5(zeroes[7]),.O6(detect_ones[7]),.I0(mantissa_4[26]),.I1(mantissa_4[27]),.I2(mantissa_4[28]),.I3(mantissa_4[29]),.I4(1'b0), .I5(1'b1));
   (* HU_SET = "zerodetect", RLOC = "X0Y2" *)LUT6_2 #(.INIT(64'h0000800000000001)) zerodetect6(.O5(zeroes[6]),.O6(detect_ones[6]),.I0(mantissa_4[22]),.I1(mantissa_4[23]),.I2(mantissa_4[24]),.I3(mantissa_4[25]),.I4(1'b0),.I5(1'b1));
   (* HU_SET = "zerodetect", RLOC = "X0Y2" *)LUT6_2 #(.INIT(64'h0000800000000001)) zerodetect5(.O5(zeroes[5]),.O6(detect_ones[5]),.I0(mantissa_4[18]),.I1(mantissa_4[19]),.I2(mantissa_4[20]),.I3(mantissa_4[21]),.I4(1'b0),.I5(1'b1));
   (* HU_SET = "zerodetect", RLOC = "X0Y2" *)LUT6_2 #(.INIT(64'h0000800000000001)) zerodetect4(.O5(zeroes[4]),.O6(detect_ones[4]),.I0(mantissa_4[14]),.I1(mantissa_4[15]),.I2(mantissa_4[16]),.I3(mantissa_4[17]),.I4(1'b0),.I5(1'b1));
   

   wire       msb_part_is_nonzero;
   
   (* HU_SET = "zerodetect", RLOC = "X0Y1" *) LUT4 #(.INIT(16'h7fff)) zero_msb(.O(msb_part_is_nonzero),.I0(zeroes[7]),.I1(zeroes[6]),.I2(zeroes[5]),.I3(zeroes[4]));
   
   

   // These will most likely be merged into one LUT6 by later optimization in the synthesis tools
   (* HU_SET = "zerodetect", RLOC = "X1Y2" *) LUT5 #(.INIT(32'b00000000000000001111000000000000 )) expdiffmux0_1(.O(expdiff_mux0[1]),.I0(zeroes[4]),.I1(zeroes[5]),.I2(zeroes[6]),.I3(zeroes[7]),.I4(1'b0));
   (* HU_SET = "zerodetect", RLOC = "X1Y2" *) LUT5 #(.INIT(32'b00000000000000001100111100000000 )) expdiffmux0_0(.O(expdiff_mux0[0]),.I0(zeroes[4]),.I1(zeroes[5]),.I2(zeroes[6]),.I3(zeroes[7]),.I4(1'b0));


   wire [3:0] combined_zeroes;


   (* HU_SET = "zerodetect", RLOC = "X1Y0" *) LUT6_2 #(.INIT(64'hffff000000010001)) zerodetect3(.O6(combined_zeroes[3]),.O5(zeroes[3]),.I0(mantissa_4[10]),.I1(mantissa_4[11]),.I2(mantissa_4[12]),.I3(mantissa_4[13]),.I4(zeroes[7]),.I5(msb_part_is_nonzero));
   (* HU_SET = "zerodetect", RLOC = "X1Y0" *) LUT6_2 #(.INIT(64'hffff000000010001)) zerodetect2(.O6(combined_zeroes[2]),.O5(zeroes[2]),.I0(mantissa_4[6]), .I1(mantissa_4[7]), .I2(mantissa_4[8]), .I3(mantissa_4[9]), .I4(zeroes[6]),.I5(msb_part_is_nonzero));
   (* HU_SET = "zerodetect", RLOC = "X1Y0" *) LUT6_2 #(.INIT(64'hffff000000010001)) zerodetect1(.O6(combined_zeroes[1]),.O5(zeroes[1]),.I0(mantissa_4[2]), .I1(mantissa_4[3]), .I2(mantissa_4[4]), .I3(mantissa_4[5]), .I4(zeroes[5]),.I5(msb_part_is_nonzero));
   (* HU_SET = "zerodetect", RLOC = "X1Y0" *) LUT6_2 #(.INIT(64'hffff000000010001)) zerodetect0(.O6(combined_zeroes[0]),.O5(zeroes[0]),.I0(1'b0),          .I1(1'b0),          .I2(mantissa_4[0]), .I3(mantissa_4[1]), .I4(zeroes[4]),.I5(msb_part_is_nonzero));


   // These will most likely be merged into one LUT6 by later optimization of the synthesis tools
   (* HU_SET = "zerodetect", RLOC = "X0Y0" *) LUT5 #(.INIT(32'b11111111111111111111000000000000 )) expdiffmux1_1(.O(expdiff_mux1[1]),.I0(zeroes[0]),.I1(zeroes[1]),.I2(zeroes[2]),.I3(zeroes[3]),.I4(1'b0));
   (* HU_SET = "zerodetect", RLOC = "X0Y0" *) LUT5 #(.INIT(32'b11111111111111111100111100000000 )) expdiffmux1_0(.O(expdiff_mux1[0]),.I0(zeroes[0]),.I1(zeroes[1]),.I2(zeroes[2]),.I3(zeroes[3]),.I4(1'b0));

   (* HU_SET = "zerodetect", RLOC = "X1Y0" *) LUT5 #(.INIT(32'b11111111111111111111000000000000 )) combinedexpdiffmux1_1(.O(expdiff[1]),.I0(combined_zeroes[0]),.I1(combined_zeroes[1]),.I2(combined_zeroes[2]),.I3(combined_zeroes[3]),.I4(1'b0));
   (* HU_SET = "zerodetect", RLOC = "X1Y0" *) LUT5 #(.INIT(32'b11111111111111111100111100000000 )) combinedexpdiffmux1_0(.O(expdiff[0]),.I0(combined_zeroes[0]),.I1(combined_zeroes[1]),.I2(combined_zeroes[2]),.I3(combined_zeroes[3]),.I4(1'b0));

   
   assign expdiff[2] = msb_part_is_nonzero; // Reuse this signal as the inverted version of expdiff[2]

   // FIXME: It might make more sense to rename msb_part_is_nonzero to
   // msb_part_is_zero to avoid the inverted meaning of
   // expdiff[2]... (why didn't I think of this in the first place?)
endmodule
