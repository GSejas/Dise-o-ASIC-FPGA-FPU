`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N8_R1_P2 
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
module GeAr_N8_R1_P2(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [3:0] temp1,temp2,temp3,temp4,temp5,temp6;

assign temp1[3:0] = in1[2:0] + in2[2:0];
assign temp2[3:0] = in1[3:1] + in2[3:1];
assign temp3[3:0] = in1[4:2] + in2[4:2];
assign temp4[3:0] = in1[5:3] + in2[5:3];
assign temp5[3:0] = in1[6:4] + in2[6:4];
assign temp6[3:0] = in1[7:5] + in2[7:5];

assign res[8:0] = {temp6[3:2],temp5[2],temp4[2],temp3[2],temp2[2],temp1[2:0]};

endmodule
