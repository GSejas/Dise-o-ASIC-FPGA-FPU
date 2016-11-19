`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:27 03/02/2015 
// Design Name: 
// Module Name:    ETAII_N16_Q8 
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
module ETAII_N16_Q8(
    input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [4:0] temp1;
wire [8:0] temp2,temp3,temp4;

assign temp1[4:0] = in1[ 3:0] + in2[ 3:0];
assign temp2[8:0] = in1[ 7:0] + in2[ 7:0];
assign temp3[8:0] = in1[11:4] + in2[11:4];
assign temp4[8:0] = in1[15:8] + in2[15:8];

assign res[16:0] = {temp4[8:4],temp3[7:4],temp2[7:4],temp1[3:0]};

endmodule
