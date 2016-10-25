/*******************************************************
* File Name     : hdl/ks4.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time :

* Comment       : Automatically generated from ks.c
********************************************************/
`ifndef __KS_4_V__
`define __KS_4_V__
//`include "ks2.v"
module Bks4(a, b, d);

input wire [3:0] a;
input wire [3:0] b;
output wire [6:0] d;

wire [2:0] m1;
wire [2:0] m2;
wire [2:0] m3;
wire [1:0] ahl;
wire [1:0] bhl;

Bks2 ksm1(a[1:0], b[1:0], m2);
Bks2 ksm2(a[3:2], b[3:2], m1);
assign ahl[1:0] = a[3:2] ^ a[1:0];
assign bhl[1:0] = b[3:2] ^ b[1:0];
Bks2 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];
assign  d[01] = m2[01];
assign  d[02] = m2[02] ^ m1[00] ^ m2[00] ^ m3[00];
assign  d[03] = m1[01] ^ m2[01] ^ m3[01];
assign  d[04] = m1[02] ^ m2[02] ^ m3[02] ^ m1[00];
assign  d[05] = m1[01];
assign  d[06] = m1[02];
endmodule
`endif
