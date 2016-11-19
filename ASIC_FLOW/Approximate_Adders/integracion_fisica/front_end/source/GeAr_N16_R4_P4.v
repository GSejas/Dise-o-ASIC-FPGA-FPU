`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N16_R4_P4 
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
module GeAr_N16_R4_P4(
    input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [8:0] temp1,temp2,temp3;

assign temp1[8:0] = in1[7:0] + in2[7:0];
assign temp2[8:0] = in1[11:4] + in2[11:4];
assign temp3[8:0] = in1[15:8] + in2[15:8];

assign res[16:0] = {temp3[8:4],temp2[7:4],temp1[7:0]};

endmodule

