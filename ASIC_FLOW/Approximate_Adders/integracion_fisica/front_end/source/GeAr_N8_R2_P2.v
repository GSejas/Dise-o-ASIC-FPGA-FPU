`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N8_R2_P2 
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
module GeAr_N8_R2_P2(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [4:0] temp1,temp2,temp3;

assign temp1[4:0] = in1[3:0] + in2[3:0];
assign temp2[4:0] = in1[5:2] + in2[5:2];
assign temp3[4:0] = in1[7:4] + in2[7:4];

assign res[8:0] = {temp3[4:2],temp2[3:2],temp1[3:0]};

endmodule
