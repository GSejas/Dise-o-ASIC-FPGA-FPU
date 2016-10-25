/*******************************************************
* File Name     : hdl/ks26.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time :

* Comment       : Automatically generated from ks.c
********************************************************/

//`include "ks13.v"
module Sks26(a, b, d);

input wire [25:0] a;
input wire [25:0] b;
output wire [50:0] d;

wire [24:0] m1;
wire [24:0] m2;
wire [24:0] m3;
wire [12:0] ahl;
wire [12:0] bhl;

Sks13 ksm1(a[12:0], b[12:0], m2);
Sks13 ksm2(a[25:13], b[25:13], m1);
assign ahl[12:0] = a[25:13] ^ a[12:0];
assign bhl[12:0] = b[25:13] ^ b[12:0];
Sks13 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];
assign  d[01] = m2[01];
assign  d[02] = m2[02];
assign  d[03] = m2[03];
assign  d[04] = m2[04];
assign  d[05] = m2[05];
assign  d[06] = m2[06];
assign  d[07] = m2[07];
assign  d[08] = m2[08];
assign  d[09] = m2[09];
assign  d[10] = m2[10];
assign  d[11] = m2[11];
assign  d[12] = m2[12];
assign  d[13] = m2[13] ^ m1[00] ^ m2[00] ^ m3[00];
assign  d[14] = m2[14] ^ m1[01] ^ m2[01] ^ m3[01];
assign  d[15] = m2[15] ^ m1[02] ^ m2[02] ^ m3[02];
assign  d[16] = m2[16] ^ m1[03] ^ m2[03] ^ m3[03];
assign  d[17] = m2[17] ^ m1[04] ^ m2[04] ^ m3[04];
assign  d[18] = m2[18] ^ m1[05] ^ m2[05] ^ m3[05];
assign  d[19] = m2[19] ^ m1[06] ^ m2[06] ^ m3[06];
assign  d[20] = m2[20] ^ m1[07] ^ m2[07] ^ m3[07];
assign  d[21] = m2[21] ^ m1[08] ^ m2[08] ^ m3[08];
assign  d[22] = m2[22] ^ m1[09] ^ m2[09] ^ m3[09];
assign  d[23] = m2[23] ^ m1[10] ^ m2[10] ^ m3[10];
assign  d[24] = m2[24] ^ m1[11] ^ m2[11] ^ m3[11];
assign  d[25] = m1[12] ^ m2[12] ^ m3[12];
assign  d[26] = m1[13] ^ m2[13] ^ m3[13] ^ m1[00];
assign  d[27] = m1[14] ^ m2[14] ^ m3[14] ^ m1[01];
assign  d[28] = m1[15] ^ m2[15] ^ m3[15] ^ m1[02];
assign  d[29] = m1[16] ^ m2[16] ^ m3[16] ^ m1[03];
assign  d[30] = m1[17] ^ m2[17] ^ m3[17] ^ m1[04];
assign  d[31] = m1[18] ^ m2[18] ^ m3[18] ^ m1[05];
assign  d[32] = m1[19] ^ m2[19] ^ m3[19] ^ m1[06];
assign  d[33] = m1[20] ^ m2[20] ^ m3[20] ^ m1[07];
assign  d[34] = m1[21] ^ m2[21] ^ m3[21] ^ m1[08];
assign  d[35] = m1[22] ^ m2[22] ^ m3[22] ^ m1[09];
assign  d[36] = m1[23] ^ m2[23] ^ m3[23] ^ m1[10];
assign  d[37] = m1[24] ^ m2[24] ^ m3[24] ^ m1[11];
assign  d[38] = m1[12];
assign  d[39] = m1[13];
assign  d[40] = m1[14];
assign  d[41] = m1[15];
assign  d[42] = m1[16];
assign  d[43] = m1[17];
assign  d[44] = m1[18];
assign  d[45] = m1[19];
assign  d[46] = m1[20];
assign  d[47] = m1[21];
assign  d[48] = m1[22];
assign  d[49] = m1[23];
assign  d[50] = m1[24];

endmodule
