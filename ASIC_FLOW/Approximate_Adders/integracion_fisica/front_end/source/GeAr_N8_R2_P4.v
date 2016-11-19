`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N8_R2_P4 
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
module GeAr_N8_R2_P4(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [6:0] temp1,temp2;

assign temp1[6:0] = in1[5:0] + in2[5:0];
assign temp2[6:0] = in1[7:2] + in2[7:2];

assign res[8:0] = {temp2[6:4],temp1[5:0]};

endmodule
