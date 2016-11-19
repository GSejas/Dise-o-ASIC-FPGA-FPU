`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    ACA_I_N32_Q8 
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
module ACA_I_N32_Q8(
    input [31:0] in1,
    input [31:0] in2,
    output [32:0] res
    );

wire [8:0] temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10;
wire [8:0] temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19;
wire [8:0] temp20,temp21,temp22,temp23,temp24,temp25;

assign temp1[8:0] = in1[7:0] + in2[7:0];
assign temp2[8:0] = in1[8:1] + in2[8:1];
assign temp3[8:0] = in1[9:2] + in2[9:2];
assign temp4[8:0] = in1[10:3] + in2[10:3];
assign temp5[8:0] = in1[11:4] + in2[11:4];
assign temp6[8:0] = in1[12:5] + in2[12:5];
assign temp7[8:0] = in1[13:6] + in2[13:6];
assign temp8[8:0] = in1[14:7] + in2[14:7];
assign temp9[8:0] = in1[15:8] + in2[15:8];
assign temp10[8:0] = in1[16:9] + in2[16:9];
assign temp11[8:0] = in1[17:10] + in2[17:10];
assign temp12[8:0] = in1[18:11] + in2[18:11];
assign temp13[8:0] = in1[19:12] + in2[19:12];
assign temp14[8:0] = in1[20:13] + in2[20:13];
assign temp15[8:0] = in1[21:14] + in2[21:14];
assign temp16[8:0] = in1[22:15] + in2[22:15];
assign temp17[8:0] = in1[23:16] + in2[23:16];
assign temp18[8:0] = in1[24:17] + in2[24:17];
assign temp19[8:0] = in1[25:18] + in2[25:18];
assign temp20[8:0] = in1[26:19] + in2[26:19];
assign temp21[8:0] = in1[27:20] + in2[27:20];
assign temp22[8:0] = in1[28:21] + in2[28:21];
assign temp23[8:0] = in1[29:22] + in2[29:22];
assign temp24[8:0] = in1[30:23] + in2[30:23];
assign temp25[8:0] = in1[31:24] + in2[31:24];

assign res[32:0] = {temp25[8:7],temp24[7],temp23[7],temp22[7],temp21[7],temp20[7],temp19[7],temp18[7],temp17[7],temp16[7],temp15[7],temp14[7],temp13[7],temp12[7],temp11[7],temp10[7],temp9[7],temp8[7],temp7[7],temp6[7],temp5[7],temp4[7],temp3[7],temp2[7],temp1[7:0]};

endmodule
