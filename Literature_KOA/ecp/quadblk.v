`ifndef __POW4BLK_V__
`define __POW4BLK_V__
//`include "ff/pow4.v"

module quadblk(a, sel, d);
input wire [232:0] a;
input wire [3:0] sel;
output reg  [232:0] d;

wire [232:0] d1;
wire [232:0] d2;
wire [232:0] d3;
wire [232:0] d4;
wire [232:0] d5;
wire [232:0] d6;
wire [232:0] d7;
wire [232:0] d8;
wire [232:0] d9;
wire [232:0] d10;
wire [232:0] d11;
wire [232:0] d12;
wire [232:0] d13;
wire [232:0] d14;

pow4 p4_1(a, d1);
pow4 p4_2(d1, d2);
pow4 p4_3(d2, d3);
pow4 p4_4(d3, d4);
pow4 p4_5(d4, d5);
pow4 p4_6(d5, d6);
pow4 p4_7(d6, d7);
pow4 p4_8(d7, d8);
pow4 p4_9(d8, d9);
pow4 p4_10(d9, d10);
pow4 p4_11(d10, d11);
pow4 p4_12(d11, d12);
pow4 p4_13(d12, d13);
pow4 p4_14(d13, d14);

always @(sel or
d1 or d2 or d3 or d4 or d5 or d6 or d7 or d8 or d9 or d10 or d11 or d12 or d13 or d14)
case (sel)
	4'd1: d <= d1;
	4'd2: d <= d2;
	4'd3: d <= d3;
	4'd4: d <= d4;
	4'd5: d <= d5;
	4'd6: d <= d6;
	4'd7: d <= d7;
	4'd8: d <= d8;
	4'd9: d <= d9;
	4'd10: d <= d10;
	4'd11: d <= d11;
	4'd12: d <= d12;
	4'd13: d <= d13;
	4'd14: d <= d14;
	default: d<= 233'hx;
endcase
endmodule
`endif
