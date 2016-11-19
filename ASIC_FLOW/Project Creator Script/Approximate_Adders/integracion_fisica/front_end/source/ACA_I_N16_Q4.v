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
module ACA_I_N16_Q4(
    input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [4:0] temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13;

assign temp1[4:0] = in1[3:0] + in2[3:0];
assign temp2[4:0] = in1[4:1] + in2[4:1];
assign temp3[4:0] = in1[5:2] + in2[5:2];
assign temp4[4:0] = in1[6:3] + in2[6:3];
assign temp5[4:0] = in1[7:4] + in2[7:4];
assign temp6[4:0] = in1[8:5] + in2[8:5];
assign temp7[4:0] = in1[9:6] + in2[9:6];
assign temp8[4:0] = in1[10:7] + in2[10:7];
assign temp9[4:0] = in1[11:8] + in2[11:8];
assign temp10[4:0] = in1[12:9] + in2[12:9];
assign temp11[4:0] = in1[13:10] + in2[13:10];
assign temp12[4:0] = in1[14:11] + in2[14:11];
assign temp13[4:0] = in1[15:12] + in2[15:12];

assign res[16:0] = {temp13[4:3],temp12[3],temp11[3],temp10[3],temp9[3],temp8[3],temp7[3],temp6[3],temp5[3],temp4[3],temp3[3],temp2[3],temp1[3:0]};

endmodule
