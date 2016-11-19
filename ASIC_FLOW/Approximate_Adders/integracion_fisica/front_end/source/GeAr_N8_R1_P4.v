`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N8_R1_P4 
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
module GeAr_N8_R1_P4(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [5:0] temp1,temp2,temp3,temp4;

assign temp1[5:0] = in1[4:0] + in2[4:0];
assign temp2[5:0] = in1[5:1] + in2[5:1];
assign temp3[5:0] = in1[6:2] + in2[6:2];
assign temp4[5:0] = in1[7:3] + in2[7:3];

assign res[8:0] = {temp4[5:4],temp3[4],temp2[4],temp1[4:0]};

endmodule
