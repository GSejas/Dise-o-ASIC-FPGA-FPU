/******************************************************************************
 * File	Name			: mux4.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : 4:1 bit Mux
 ******************************************************************************/
`ifndef __MUX4_V__
`define __MUX4_V__

module mux4(i0, i1, i2, i3, sel, out);

input wire [232:0] i0, i1, i2, i3;
input wire [1:0] sel;
output wire [232:0] out;

assign out = (sel == 3'd0) ? i0 
           : ((sel == 3'd1) ? i1
		   : ((sel == 3'd2) ? i2
		   : i3));

endmodule

`endif

