`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   
// Design Name: 
// Module Name:    GeAr_N8_R1_P6
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
module GeAr_N8_R1_P6(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [7:0] temp1,temp2;

assign temp1[7:0] = in1[6:0] + in2[6:0];
assign temp2[7:0] = in1[7:1] + in2[7:1];

assign res[8:0] = {temp2[7:6],temp1[6:0]};

endmodule
