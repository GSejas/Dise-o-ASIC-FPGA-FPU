`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    ACA_II_N32_Q16 
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
module ACA_II_N32_Q16(
    input [31:0] in1,
    input [31:0] in2,
    output [32:0] res
    );

wire [16:0] temp1, temp2, temp3;

assign temp1[16:0] = in1[15:0] + in2[15:0];
assign temp2[16:0] = in1[23:8] + in2[23:8];
assign temp3[16:0] = in1[31:16] + in2[31:16];

assign res[32:0] = {temp3[16:8],temp2[15:8],temp1[15:0]};

endmodule

