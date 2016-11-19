`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N8_R1_P1 
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
module GeAr_N8_R1_P1(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [2:0] temp1,temp2,temp3,temp4,temp5,temp6,temp7;

assign temp1[2:0] = in1[1:0] + in2[1:0];
assign temp2[2:0] = in1[2:1] + in2[2:1];
assign temp3[2:0] = in1[3:2] + in2[3:2];
assign temp4[2:0] = in1[4:3] + in2[4:3];
assign temp5[2:0] = in1[5:4] + in2[5:4];
assign temp6[2:0] = in1[6:5] + in2[6:5];
assign temp7[2:0] = in1[7:6] + in2[7:6];

assign res[8:0] = {temp7[2:1],temp6[1],temp5[1],temp4[1],temp3[1],temp2[1],temp1[1:0]};

endmodule
