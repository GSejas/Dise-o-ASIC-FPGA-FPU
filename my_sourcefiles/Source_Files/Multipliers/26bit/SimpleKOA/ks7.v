/*******************************************************
* File Name     : hdl/ks7.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time :

* Comment       : Automatically generated from ks.c
********************************************************/

module Sks7(a, b, d);

input wire [6:0] a;
input wire [6:0] b;
output wire [12:0] d;

wire [4:0] m1;
wire [6:0] m2;
wire [6:0] m3;
wire [3:0] ahl;
wire [3:0] bhl;

Sks4 ksm1(a[3:0], b[3:0], m2);
//Sks3 ksm2(a[6:4], b[6:4], m1);

assign m1 = a[6:4] * b[6:4];

assign ahl[2:0] = a[6:4] ^ a[2:0];
assign ahl[3] = a[3];
assign bhl[2:0] = b[6:4] ^ b[2:0];
assign bhl[3] = b[3];
Sks4 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];
assign  d[01] = m2[01];
assign  d[02] = m2[02];
assign  d[03] = m2[03];
assign  d[04] = m2[04] ^ m1[00] ^ m2[00] ^ m3[00];
assign  d[05] = m2[05] ^ m1[01] ^ m2[01] ^ m3[01];
assign  d[06] = m2[06] ^ m1[02] ^ m2[02] ^ m3[02];
assign  d[07] = m1[03] ^ m2[03] ^ m3[03];
assign  d[08] = m1[04] ^ m2[04] ^ m3[04] ^ m1[00];
assign  d[09] = m2[05] ^ m3[05] ^ m1[01];
assign  d[10] = m2[06] ^ m3[06] ^ m1[02];
assign  d[11] = m1[03];
assign  d[12] = m1[04];

endmodule
