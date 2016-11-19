`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N8_R1_P3 
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
module GeAr_N8_R1_P3(
    input [7:0] in1,
    input [7:0] in2,
    output [8:0] res
    );

wire [4:0] temp1,temp2,temp3,temp4,temp5;

assign temp1[4:0] = in1[3:0] + in2[3:0];
assign temp2[4:0] = in1[4:1] + in2[4:1];
assign temp3[4:0] = in1[5:2] + in2[5:2];
assign temp4[4:0] = in1[6:3] + in2[6:3];
assign temp5[4:0] = in1[7:4] + in2[7:4];

assign res[8:0] = {temp5[4:3],temp4[3],temp3[3],temp2[3],temp1[3:0]};

endmodule
