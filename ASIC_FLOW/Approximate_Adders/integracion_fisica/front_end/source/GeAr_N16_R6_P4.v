`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N16_R6_P4 
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
module GeAr_N16_R6_P4(
    input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [10:0] temp1,temp2;

assign temp1[10:0] = in1[9:0] + in2[9:0];
assign temp2[10:0] = in1[15:6] + in2[15:6];

assign res[16:0] = {temp2[10:4],temp1[9:0]};

endmodule

