`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  
// Design Name: 
// Module Name:    GeAr_N8_R1_P5
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
module GeAr_N8_R1_P5(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [6:0] temp1,temp2,temp3;

assign temp1[6:0] = in1[5:0] + in2[5:0];
assign temp2[6:0] = in1[6:1] + in2[6:1];
assign temp3[6:0] = in1[7:2] + in2[7:2];

assign res[8:0] = {temp3[6:5],temp2[5],temp1[5:0]};

endmodule
