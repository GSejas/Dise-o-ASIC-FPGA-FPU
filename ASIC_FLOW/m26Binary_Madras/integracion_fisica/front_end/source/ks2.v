/*******************************************************
* File Name     : hdl/ks2.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time : 

* Comment       : Automatically generated from ks.c
********************************************************/
`ifndef __KS_2_V__
`define __KS_2_V__
module ks2(a, b, d);

input wire [1:0] a;
input wire [1:0] b;
output wire [2:0] d;

wire [0:0] m1;
wire [0:0] m2;
wire [0:0] m3;
wire [0:0] ahl;
wire [0:0] bhl;

ks1 ksm1(a[0:0], b[0:0], m2);
ks1 ksm2(a[1:1], b[1:1], m1);
assign ahl[0:0] = a[1:1] ^ a[0:0];
assign bhl[0:0] = b[1:1] ^ b[0:0];
ks1 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];   
assign  d[01] = m1[00] ^ m2[00] ^ m3[00];   
assign  d[02] = m1[00];   
endmodule
`endif
