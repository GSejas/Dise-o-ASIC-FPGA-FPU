/******************************************************************************
 * File	Name			: bquadblk.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : Buffered Quadblock. Returns (in)^(2^sel), 
 ******************************************************************************/
 `timescale 1ns / 1ps
 `ifndef __BQUADBLK_V__
`define __BQUADBLK_V__
//`include "quadblk.v"


/* Buffered quadblk */
module bquadblk(en, in, sel, out); 
input wire en;		     /* If 1 enable data into the quad block */
input wire [232:0] in;   /* Input to quadblk */
input wire [3:0] sel;    /* What power is needed */
output wire [232:0] out; /* Output from quadblk */

wire [232:0] lin;

quadblk bp4blk(lin, sel, out);

assign lin = (en == 1'b1) ? in : 233'b0;

endmodule
`endif
