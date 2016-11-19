`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    ACA_I_N16_Q4
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module LOA #(parameter LPL=10, parameter W=16)(
    input wire [W - 1:0] in1,
    input wire [W - 1:0] in2,
    output wire [W:0] res
    );

wire [LPL-1:0] in1LowerPart;
wire [LPL-1:0] in2LowerPart;
wire [W-LPL-1:0] in1UpperPart;
wire [W-LPL-1:0] in2UpperPart;
wire [W-LPL:0] midRes;
wire [LPL-1:0] ORLowerPart;
wire ANDN;

//assign  in1LowerPart= in1[LPL-1:0];
//assign  in2LowerPart= in2[LPL-1:0];
//assign  in1UpperPart= in1[W-LPL-1:LPL];
//assign  in2UpperPart= in2[W-LPL-1:LPL];
assign ORLowerPart = ((in1[LPL-1:0]) |( in2[LPL-1:0]));
and and_1(ANDN,in1[LPL-1],in2[LPL-1]);
assign  midRes= in1[W-1:LPL] + in2[W-1:LPL] + ANDN;
assign res = {midRes, ORLowerPart};

endmodule
