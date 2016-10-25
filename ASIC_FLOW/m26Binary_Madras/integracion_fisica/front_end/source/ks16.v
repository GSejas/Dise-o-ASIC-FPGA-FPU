/*******************************************************
* File Name     : hdl/ks16.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time : 

* Comment       : Automatically generated from ks.c
********************************************************/
`ifndef __KS_16_V__
`define __KS_16_V__
`include "ks8.v"
module ks16(a, b, d);

input wire [15:0] a;
input wire [15:0] b;
output wire [30:0] d;

wire [14:0] m1;
wire [14:0] m2;
wire [14:0] m3;
wire [7:0] ahl;
wire [7:0] bhl;

ks8 ksm1(a[7:0], b[7:0], m2);
ks8 ksm2(a[15:8], b[15:8], m1);
assign ahl[7:0] = a[15:8] ^ a[7:0];
assign bhl[7:0] = b[15:8] ^ b[7:0];
ks8 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];   
assign  d[01] = m2[01];   
assign  d[02] = m2[02];   
assign  d[03] = m2[03];   
assign  d[04] = m2[04];   
assign  d[05] = m2[05];   
assign  d[06] = m2[06];   
assign  d[07] = m2[07];   
assign  d[08] = m2[08] ^ m1[00] ^ m2[00] ^ m3[00];   
assign  d[09] = m2[09] ^ m1[01] ^ m2[01] ^ m3[01];   
assign  d[10] = m2[10] ^ m1[02] ^ m2[02] ^ m3[02];   
assign  d[11] = m2[11] ^ m1[03] ^ m2[03] ^ m3[03];   
assign  d[12] = m2[12] ^ m1[04] ^ m2[04] ^ m3[04];   
assign  d[13] = m2[13] ^ m1[05] ^ m2[05] ^ m3[05];   
assign  d[14] = m2[14] ^ m1[06] ^ m2[06] ^ m3[06];   
assign  d[15] = m1[07] ^ m2[07] ^ m3[07];   
assign  d[16] = m1[08] ^ m2[08] ^ m3[08] ^ m1[00];   
assign  d[17] = m1[09] ^ m2[09] ^ m3[09] ^ m1[01];   
assign  d[18] = m1[10] ^ m2[10] ^ m3[10] ^ m1[02];   
assign  d[19] = m1[11] ^ m2[11] ^ m3[11] ^ m1[03];   
assign  d[20] = m1[12] ^ m2[12] ^ m3[12] ^ m1[04];   
assign  d[21] = m1[13] ^ m2[13] ^ m3[13] ^ m1[05];   
assign  d[22] = m1[14] ^ m2[14] ^ m3[14] ^ m1[06];   
assign  d[23] = m1[07];   
assign  d[24] = m1[08];   
assign  d[25] = m1[09];   
assign  d[26] = m1[10];   
assign  d[27] = m1[11];   
assign  d[28] = m1[12];   
assign  d[29] = m1[13];   
assign  d[30] = m1[14];   
endmodule
`endif
