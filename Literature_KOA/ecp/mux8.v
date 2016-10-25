/******************************************************************************
 * File	Name			: mux8.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : 8:1 bit Mux
 ******************************************************************************/

`ifndef __MUX8_V__
`define __MUX8_V__

module mux8(i0, i1, i2, i3, i4, i5, i6, i7, sel, out);

input wire [232:0] i0, i1, i2, i3, i4, i5, i6, i7;
input wire [2:0] sel;
output wire [232:0] out;

assign out = (sel == 3'd0) ? i0 
           : ((sel == 3'd1) ? i1
		   : ((sel == 3'd2) ? i2
		   : ((sel == 3'd3) ? i3
		   : ((sel == 3'd4) ? i4
		   : ((sel == 3'd5) ? i5
		   : ((sel == 3'd6) ? i6
		   : i7))))));

endmodule

`endif

