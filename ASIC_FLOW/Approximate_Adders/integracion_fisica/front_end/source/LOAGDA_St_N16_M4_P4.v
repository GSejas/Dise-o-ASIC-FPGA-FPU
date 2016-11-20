`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GDA_St_N16_M4_P4 
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
module LOAGDA_St_N16_M4_P4(
    input  [15:0] in1,
    input  [15:0] in2,
    output [16:0] res
    );

wire [4:0] 	temp1, temp2, temp3, temp4;

//C4
wire 		g0,g1,g2,g3,p0,p1,p2,p3;
wire		p3g2,p3p2,p3p2g1,p3p2p1,p3p2p1g0;
wire 		res_or_1, res_or_2;
wire 		c4;

and and_3(g3,in1[3],in2[3]);
and and_2(g2,in1[2],in2[2]);
and and_1(g1,in1[1],in2[1]);
and and_0(g0,in1[0],in2[0]);

xor xor_3(p3,in1[3],in2[3]);
xor xor_2(p2,in1[2],in2[2]);
xor xor_1(p1,in1[1],in2[1]);
xor xor_0(p0,in1[0],in2[0]);

and and_4(p3g2,p3,g2);
and and_5(p3p2,p3,p2);
and and_6(p3p2g1,p3p2,g1);
and and_7(p3p2p1,p3p2,p1);
and and_8(p3p2p1g0,p3p2p1,g0);

or or_3(res_or_1,g3,p3g2);
or or_2(res_or_2,p3p2g1,p3p2p1g0);
or or_1(c4,res_or_1,res_or_2);

//C8
wire 		g4,g5,g6,g7,p4,p5,p6,p7;
wire		p7g6,p7p6,p7p6g5,p7p6p5,p7p6p5g4;
wire 		res_or_3, res_or_4;
wire 		c8;

and and_9 (g7,in1[7],in2[7]);
and and_10(g6,in1[6],in2[6]);
and and_11(g5,in1[5],in2[5]);
and and_12(g4,in1[4],in2[4]);

xor xor_7(p7,in1[7],in2[7]);
xor xor_6(p6,in1[6],in2[6]);
xor xor_5(p5,in1[5],in2[5]);
xor xor_4(p4,in1[4],in2[4]);

and and_13(p7g6,p7,g6);
and and_14(p7p6,p7,p6);
and and_15(p7p6g5,p7p6,g5);
and and_16(p7p6p5,p7p6,p5);
and and_17(p7p6p5g4,p7p6p5,g4);

or or_6(res_or_3,g7,p7g6);
or or_5(res_or_4,p7p6g5,p7p6p5g4);
or or_4(c8,res_or_3,res_or_4);

//C12
wire 		g8,g9,g10,g11,p8,p9,p10,p11;
wire		p11g10,p11p10,p11p10g9,p11p10p9;
wire 		res_or_5, res_or_6;
wire 		c12;

and and_18(g11,in1[11],in2[11]);
and and_19(g10,in1[10],in2[10]);
and and_20(g9,in1[9],in2[9]);
and and_21(g8,in1[8],in2[8]);

xor xor_11(p11,in1[11],in2[11]);
xor xor_10(p10,in1[10],in2[10]);
xor xor_9(p9,in1[9],in2[9]);
xor xor_8(p8,in1[8],in2[8]);

and and_22(p11g10,p11,g10);
and and_23(p11p10,p11,p10);
and and_24(p11p10g9,p11p10,g9);
and and_25(p11p10p9,p11p10,p9);
and and_26(p11p10p9g8,p11p10p9,g8);

or or_9(res_or_5,g11,p11g10);
or or_8(res_or_6,p11p10g9,p11p10p9g8);
or or_7(c12,res_or_5,res_or_6);					

// Results
assign temp1[4:0] = (in1[ 3: 0] | in2[ 3: 0]);
assign temp2[4:0] = (in1[ 7: 4] | in2[ 7: 4]) + c4;
assign temp3[4:0] = (in1[11: 8] + in2[11: 8]) + c8;
assign temp4[4:0] = in1[15:12] + in2[15:12] + c12;
assign res[16:0] = {temp4[4:0],temp3[3:0],temp2[3:0],temp1[3:0]};

endmodule
