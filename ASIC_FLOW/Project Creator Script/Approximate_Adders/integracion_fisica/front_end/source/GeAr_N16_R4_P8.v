`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N16_R4_P8 
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
module GeAr_N16_R4_P8(
   input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [12:0] temp1,temp2;

assign temp1[12:0] = in1[11:0] + in2[11:0];
assign temp2[12:0] = in1[15:4] + in2[15:4];

assign res[16:0] = {temp2[12:8],temp1[11:0]};

endmodule

