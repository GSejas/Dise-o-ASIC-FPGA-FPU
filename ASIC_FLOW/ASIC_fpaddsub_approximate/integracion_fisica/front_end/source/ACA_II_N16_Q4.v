`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    ACA_II_N16_Q4 
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
module ACA_II_N16_Q4(
    input [15:0] in1,
    input [15:0] in2,
    output [16:0] res
    );

wire [4:0] temp1,temp2,temp3,temp4,temp5,temp6,temp7;

assign temp1[4:0] = in1[ 3: 0] + in2[ 3: 0];
assign temp2[4:0] = in1[ 5: 2] + in2[ 5: 2];
assign temp3[4:0] = in1[ 7: 4] + in2[ 7: 4];
assign temp4[4:0] = in1[ 9: 6] + in2[ 9: 6];
assign temp5[4:0] = in1[11: 8] + in2[11: 8];
assign temp6[4:0] = in1[13:10] + in2[13:10];
assign temp7[4:0] = in1[15:12] + in2[15:12];

assign res[16:0] = {temp7[4:2],temp6[3:2],temp5[3:2],temp4[3:2],temp3[3:2],temp2[3:2],temp1[3:0]};

endmodule