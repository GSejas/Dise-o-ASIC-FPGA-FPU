/******************************************************************************
 * File	Name			: ks14.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 1/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : Automatically generated code for karatsuba 14 bit
 ******************************************************************************/


`ifndef __KS_14_V__
`define __KS_14_V__

module ks14(a, b, d);

input wire [0:13] a;
input wire [0:13] b;
output wire [0:26] d;

wire m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13;
wire m0_1, m0_2, m0_3, m0_4, m0_5, m0_6, m0_7, m0_8, m0_9, m0_10, m0_11, m0_12, m0_13;
wire m1_2, m1_3, m1_4, m1_5, m1_6, m1_7, m1_8, m1_9, m1_10, m1_11, m1_12, m1_13;
wire m2_3, m2_4, m2_5, m2_6, m2_7, m2_8, m2_9, m2_10, m2_11, m2_12, m2_13;
wire m3_4, m3_5, m3_6, m3_7, m3_8, m3_9, m3_10, m3_11, m3_12, m3_13;
wire m4_5, m4_6, m4_7, m4_8, m4_9, m4_10, m4_11, m4_12, m4_13;
wire m5_6, m5_7, m5_8, m5_9, m5_10, m5_11, m5_12, m5_13;
wire m6_7, m6_8, m6_9, m6_10, m6_11, m6_12, m6_13;
wire m7_8, m7_9, m7_10, m7_11, m7_12, m7_13;
wire m8_9, m8_10, m8_11, m8_12, m8_13;
wire m9_10, m9_11, m9_12, m9_13;
wire m10_11, m10_12, m10_13;
wire m11_12, m11_13;
wire m12_13;
assign m0 = a[0] & b[0];
assign m1 = a[1] & b[1];
assign m2 = a[2] & b[2];
assign m3 = a[3] & b[3];
assign m4 = a[4] & b[4];
assign m5 = a[5] & b[5];
assign m6 = a[6] & b[6];
assign m7 = a[7] & b[7];
assign m8 = a[8] & b[8];
assign m9 = a[9] & b[9];
assign m10 = a[10] & b[10];
assign m11 = a[11] & b[11];
assign m12 = a[12] & b[12];
assign m13 = a[13] & b[13];
assign m0_1 = (a[0] ^ a[1]) & (b[0] ^ b[1]);
assign m0_2 = (a[0] ^ a[2]) & (b[0] ^ b[2]);
assign m0_3 = (a[0] ^ a[3]) & (b[0] ^ b[3]);
assign m0_4 = (a[0] ^ a[4]) & (b[0] ^ b[4]);
assign m0_5 = (a[0] ^ a[5]) & (b[0] ^ b[5]);
assign m0_6 = (a[0] ^ a[6]) & (b[0] ^ b[6]);
assign m0_7 = (a[0] ^ a[7]) & (b[0] ^ b[7]);
assign m0_8 = (a[0] ^ a[8]) & (b[0] ^ b[8]);
assign m0_9 = (a[0] ^ a[9]) & (b[0] ^ b[9]);
assign m0_10 = (a[0] ^ a[10]) & (b[0] ^ b[10]);
assign m0_11 = (a[0] ^ a[11]) & (b[0] ^ b[11]);
assign m0_12 = (a[0] ^ a[12]) & (b[0] ^ b[12]);
assign m0_13 = (a[0] ^ a[13]) & (b[0] ^ b[13]);
assign m1_2 = (a[1] ^ a[2]) & (b[1] ^ b[2]);
assign m1_3 = (a[1] ^ a[3]) & (b[1] ^ b[3]);
assign m1_4 = (a[1] ^ a[4]) & (b[1] ^ b[4]);
assign m1_5 = (a[1] ^ a[5]) & (b[1] ^ b[5]);
assign m1_6 = (a[1] ^ a[6]) & (b[1] ^ b[6]);
assign m1_7 = (a[1] ^ a[7]) & (b[1] ^ b[7]);
assign m1_8 = (a[1] ^ a[8]) & (b[1] ^ b[8]);
assign m1_9 = (a[1] ^ a[9]) & (b[1] ^ b[9]);
assign m1_10 = (a[1] ^ a[10]) & (b[1] ^ b[10]);
assign m1_11 = (a[1] ^ a[11]) & (b[1] ^ b[11]);
assign m1_12 = (a[1] ^ a[12]) & (b[1] ^ b[12]);
assign m1_13 = (a[1] ^ a[13]) & (b[1] ^ b[13]);
assign m2_3 = (a[2] ^ a[3]) & (b[2] ^ b[3]);
assign m2_4 = (a[2] ^ a[4]) & (b[2] ^ b[4]);
assign m2_5 = (a[2] ^ a[5]) & (b[2] ^ b[5]);
assign m2_6 = (a[2] ^ a[6]) & (b[2] ^ b[6]);
assign m2_7 = (a[2] ^ a[7]) & (b[2] ^ b[7]);
assign m2_8 = (a[2] ^ a[8]) & (b[2] ^ b[8]);
assign m2_9 = (a[2] ^ a[9]) & (b[2] ^ b[9]);
assign m2_10 = (a[2] ^ a[10]) & (b[2] ^ b[10]);
assign m2_11 = (a[2] ^ a[11]) & (b[2] ^ b[11]);
assign m2_12 = (a[2] ^ a[12]) & (b[2] ^ b[12]);
assign m2_13 = (a[2] ^ a[13]) & (b[2] ^ b[13]);
assign m3_4 = (a[3] ^ a[4]) & (b[3] ^ b[4]);
assign m3_5 = (a[3] ^ a[5]) & (b[3] ^ b[5]);
assign m3_6 = (a[3] ^ a[6]) & (b[3] ^ b[6]);
assign m3_7 = (a[3] ^ a[7]) & (b[3] ^ b[7]);
assign m3_8 = (a[3] ^ a[8]) & (b[3] ^ b[8]);
assign m3_9 = (a[3] ^ a[9]) & (b[3] ^ b[9]);
assign m3_10 = (a[3] ^ a[10]) & (b[3] ^ b[10]);
assign m3_11 = (a[3] ^ a[11]) & (b[3] ^ b[11]);
assign m3_12 = (a[3] ^ a[12]) & (b[3] ^ b[12]);
assign m3_13 = (a[3] ^ a[13]) & (b[3] ^ b[13]);
assign m4_5 = (a[4] ^ a[5]) & (b[4] ^ b[5]);
assign m4_6 = (a[4] ^ a[6]) & (b[4] ^ b[6]);
assign m4_7 = (a[4] ^ a[7]) & (b[4] ^ b[7]);
assign m4_8 = (a[4] ^ a[8]) & (b[4] ^ b[8]);
assign m4_9 = (a[4] ^ a[9]) & (b[4] ^ b[9]);
assign m4_10 = (a[4] ^ a[10]) & (b[4] ^ b[10]);
assign m4_11 = (a[4] ^ a[11]) & (b[4] ^ b[11]);
assign m4_12 = (a[4] ^ a[12]) & (b[4] ^ b[12]);
assign m4_13 = (a[4] ^ a[13]) & (b[4] ^ b[13]);
assign m5_6 = (a[5] ^ a[6]) & (b[5] ^ b[6]);
assign m5_7 = (a[5] ^ a[7]) & (b[5] ^ b[7]);
assign m5_8 = (a[5] ^ a[8]) & (b[5] ^ b[8]);
assign m5_9 = (a[5] ^ a[9]) & (b[5] ^ b[9]);
assign m5_10 = (a[5] ^ a[10]) & (b[5] ^ b[10]);
assign m5_11 = (a[5] ^ a[11]) & (b[5] ^ b[11]);
assign m5_12 = (a[5] ^ a[12]) & (b[5] ^ b[12]);
assign m5_13 = (a[5] ^ a[13]) & (b[5] ^ b[13]);
assign m6_7 = (a[6] ^ a[7]) & (b[6] ^ b[7]);
assign m6_8 = (a[6] ^ a[8]) & (b[6] ^ b[8]);
assign m6_9 = (a[6] ^ a[9]) & (b[6] ^ b[9]);
assign m6_10 = (a[6] ^ a[10]) & (b[6] ^ b[10]);
assign m6_11 = (a[6] ^ a[11]) & (b[6] ^ b[11]);
assign m6_12 = (a[6] ^ a[12]) & (b[6] ^ b[12]);
assign m6_13 = (a[6] ^ a[13]) & (b[6] ^ b[13]);
assign m7_8 = (a[7] ^ a[8]) & (b[7] ^ b[8]);
assign m7_9 = (a[7] ^ a[9]) & (b[7] ^ b[9]);
assign m7_10 = (a[7] ^ a[10]) & (b[7] ^ b[10]);
assign m7_11 = (a[7] ^ a[11]) & (b[7] ^ b[11]);
assign m7_12 = (a[7] ^ a[12]) & (b[7] ^ b[12]);
assign m7_13 = (a[7] ^ a[13]) & (b[7] ^ b[13]);
assign m8_9 = (a[8] ^ a[9]) & (b[8] ^ b[9]);
assign m8_10 = (a[8] ^ a[10]) & (b[8] ^ b[10]);
assign m8_11 = (a[8] ^ a[11]) & (b[8] ^ b[11]);
assign m8_12 = (a[8] ^ a[12]) & (b[8] ^ b[12]);
assign m8_13 = (a[8] ^ a[13]) & (b[8] ^ b[13]);
assign m9_10 = (a[9] ^ a[10]) & (b[9] ^ b[10]);
assign m9_11 = (a[9] ^ a[11]) & (b[9] ^ b[11]);
assign m9_12 = (a[9] ^ a[12]) & (b[9] ^ b[12]);
assign m9_13 = (a[9] ^ a[13]) & (b[9] ^ b[13]);
assign m10_11 = (a[10] ^ a[11]) & (b[10] ^ b[11]);
assign m10_12 = (a[10] ^ a[12]) & (b[10] ^ b[12]);
assign m10_13 = (a[10] ^ a[13]) & (b[10] ^ b[13]);
assign m11_12 = (a[11] ^ a[12]) & (b[11] ^ b[12]);
assign m11_13 = (a[11] ^ a[13]) & (b[11] ^ b[13]);
assign m12_13 = (a[12] ^ a[13]) & (b[12] ^ b[13]);
assign d[0] = m0;
assign d[1] = m0_1 ^ m0 ^ m1;
assign d[2] = m0_2 ^ m0 ^ m1 ^ m2;
assign d[3] = m0_3 ^ m1_2 ^ m0 ^ m1 ^ m2 ^ m3;
assign d[4] = m0_4 ^ m1_3 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4;
assign d[5] = m0_5 ^ m1_4 ^ m2_3 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5;
assign d[6] = m0_6 ^ m1_5 ^ m2_4 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6;
assign d[7] = m0_7 ^ m1_6 ^ m2_5 ^ m3_4 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7;
assign d[8] = m0_8 ^ m1_7 ^ m2_6 ^ m3_5 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8;
assign d[9] = m0_9 ^ m1_8 ^ m2_7 ^ m3_6 ^ m4_5 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9;
assign d[10] = m0_10 ^ m1_9 ^ m2_8 ^ m3_7 ^ m4_6 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10;
assign d[11] = m0_11 ^ m1_10 ^ m2_9 ^ m3_8 ^ m4_7 ^ m5_6 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11;
assign d[12] = m0_12 ^ m1_11 ^ m2_10 ^ m3_9 ^ m4_8 ^ m5_7 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12;
assign d[13] = m0_13 ^ m1_12 ^ m2_11 ^ m3_10 ^ m4_9 ^ m5_8 ^ m6_7 ^ m0 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[14] = m1_13 ^ m2_12 ^ m3_11 ^ m4_10 ^ m5_9 ^ m6_8 ^ m1 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[15] = m2_13 ^ m3_12 ^ m4_11 ^ m5_10 ^ m6_9 ^ m7_8 ^ m2 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[16] = m3_13 ^ m4_12 ^ m5_11 ^ m6_10 ^ m7_9 ^ m3 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[17] = m4_13 ^ m5_12 ^ m6_11 ^ m7_10 ^ m8_9 ^ m4 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[18] = m5_13 ^ m6_12 ^ m7_11 ^ m8_10 ^ m5 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[19] = m6_13 ^ m7_12 ^ m8_11 ^ m9_10 ^ m6 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[20] = m7_13 ^ m8_12 ^ m9_11 ^ m7 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[21] = m8_13 ^ m9_12 ^ m10_11 ^ m8 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[22] = m9_13 ^ m10_12 ^ m9 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[23] = m10_13 ^ m11_12 ^ m10 ^ m11 ^ m12 ^ m13;
assign d[24] = m11_13 ^ m11 ^ m12 ^ m13;
assign d[25] = m12_13 ^ m12 ^ m13;
assign d[26] = m13;
endmodule
`endif
