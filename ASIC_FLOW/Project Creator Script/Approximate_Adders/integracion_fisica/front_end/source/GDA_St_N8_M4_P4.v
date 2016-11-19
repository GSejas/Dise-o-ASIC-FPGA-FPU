`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GDA_St_N8_M4_P4 
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
module GDA_St_N8_M4_P4(
    input  [7:0] in1,
    input  [7:0] in2,
    output [8:0] res
    );

wire [2:0] 	temp1, temp2, temp3, temp4;
wire 			carry_pred_1,carry_pred_2;

//C2
wire 			g0,g1,p0,p1;
wire			p1g0;
wire 			c2;

and and_0(g0,in1[0],in2[0]);
and and_1(g1,in1[1],in2[1]);
xor xor_0(p0,in1[0],in2[0]);
xor xor_1(p1,in1[1],in2[1]);

and and_2(p1g0,p1,g0);
or  or_1 (c2,g1,p1g0);

//C4
wire 			g2,g3,p2,p3;
wire			p3g2;
wire 			c4,p3p2,p3p2c2;

and and_3(g2,in1[2],in2[2]);
and and_4(g3,in1[3],in2[3]);
xor xor_2(p2,in1[2],in2[2]);
xor xor_3(p3,in1[3],in2[3]);

and and_5(p3g2,p3,g2);
or  or_2 (c4,g3,p3g2);

and and_6(p3p2,p3,p2);
and and_7(p3p2c2,p3p2,c2);
or  or_3 (carry_pred_1,c4,p3p2c2);

//C8
wire 			g4,g5,p4,p5;
wire			p5g4;
wire 			c6,p5p4,p5p4c4;

and and_8(g4,in1[4],in2[4]);
and and_9(g5,in1[5],in2[5]);
xor xor_4(p4,in1[4],in2[4]);
xor xor_5(p5,in1[5],in2[5]);

and and_10(p5g4,p5,g4);
or  or_4  (c6,g5,p5g4);

and and_11(p5p4,p5,p4);
and and_12(p5p4c4,p5p4,c4);
or  or_5 (carry_pred_2,c6,p5p4c4);

// Results

assign temp1[2:0] = in1[1:0] + in2[1:0];
assign temp2[2:0] = in1[3:2] + in2[3:2] + c2;
assign temp3[2:0] = in1[5:4] + in2[5:4] + carry_pred_1;
assign temp4[2:0] = in1[7:6] + in2[7:6] + carry_pred_2;
assign res[8:0] = {temp4[2:0],temp3[1:0],temp2[1:0],temp1[1:0]};

endmodule
