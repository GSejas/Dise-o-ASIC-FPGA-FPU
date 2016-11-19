`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N16_R2_P4 
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
module GeAr_N16_R2_P4(
    input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [6:0] temp1,temp2,temp3,temp4,temp5,temp6;

assign temp1[6:0] = in1[5:0] + in2[5:0];
assign temp2[6:0] = in1[7:2] + in2[7:2];
assign temp3[6:0] = in1[9:4] + in2[9:4];
assign temp4[6:0] = in1[11:6] + in2[11:6];
assign temp5[6:0] = in1[13:8] + in2[13:8];
assign temp6[6:0] = in1[15:10] + in2[15:10];

assign res[16:0] = {temp6[6:4],temp5[5:4],temp4[5:4],temp3[5:4],temp2[5:4],temp1[5:0]};

endmodule

