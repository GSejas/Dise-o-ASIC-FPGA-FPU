/*******************************************************
* File Name     : hdl/ks10.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time :

* Comment       : Automatically generated from ks.c
********************************************************/
`ifndef __KS_10_V__
`define __KS_10_V__

module Bks10(a, b, d);

input wire [9:0] a;
input wire [9:0] b;
output wire [18:0] d;

wire [2:0] m1;
wire [14:0] m2;
wire [14:0] m3;
wire [7:0] ahl;
wire [7:0] bhl;

Bks8 ksm1(a[7:0], b[7:0], m2);
Bks2 ksm2(a[9:8], b[9:8], m1);
assign ahl[1:0] = a[9:8] ^ a[1:0];
assign ahl[7:2] = a[7:2];
assign bhl[1:0] = b[9:8] ^ b[1:0];
assign bhl[7:2] = b[7:2];
Bks8 ksm3(ahl, bhl, m3);

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
assign  d[11] = m2[11] ^ m2[03] ^ m3[03];
assign  d[12] = m2[12] ^ m2[04] ^ m3[04];
assign  d[13] = m2[13] ^ m2[05] ^ m3[05];
assign  d[14] = m2[14] ^ m2[06] ^ m3[06];
assign  d[15] = m2[07] ^ m3[07];
assign  d[16] = m2[08] ^ m3[08] ^ m1[00];
assign  d[17] = m2[09] ^ m3[09] ^ m1[01];
assign  d[18] = m2[10] ^ m3[10] ^ m1[02];
endmodule
`endif
