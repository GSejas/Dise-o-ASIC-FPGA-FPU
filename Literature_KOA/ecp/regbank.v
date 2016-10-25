/******************************************************************************
 * File	Name			: regbank.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : The register bank for storing results and
 * intermediate results for the eliptic curve.
 *              y^2 + xy = x^3 + a.x^2 + b
 * where a = 1
 ******************************************************************************/
`timescale 1ns / 1ps

`ifndef __REGFILES_V__
`define __REGFILES_V__

//`include "xc3s_ram16x233_d.v"
//`include "bquadblk.v"

/*---------------------------------------------------------------------------
* Module Name	: regbank
* Synopsis		: Register bank for the EC Processor.
*		Distributed RAM of Xilinx is used for the purpose of storage.
*		Instance of Quadblock also made here.
*--------------------------------------------------------------------------*/
module regbank(clk, cwh, c0, c1, a0, a1, a2, a3);
input wire clk;                       
input wire [22:0] cwh;                 /* control word */
input wire [232:0] c0, c1;             /* Inputs to regbank from ALU */
output wire [232:0] a0, a1, a2, a3;    /* Output from regbank to ALU */

wire rb1_we;
wire [3:0] rb1_addr1, rb2_addr1, rb3_addr1;
wire [3:0] rb1_addr2, rb2_addr2, rb3_addr2;
wire [232:0] rb1_din, rb2_din, rb3_din;
wire [232:0] rb1_dout1, rb2_dout1, rb3_dout1;
wire [232:0] rb1_dout2, rb2_dout2, rb3_dout2;
wire [232:0] qin, qout;

/* Instances of distributed memory */
XC3S_RAM16X233_D	regbank1(rb1_din, rb1_addr1, rb1_addr2, rb1_we, clk, rb1_dout1, rb1_dout2);
XC3S_RAM16X233_D	regbank2(rb2_din, rb2_addr1, rb2_addr2, rb2_we, clk, rb2_dout1, rb2_dout2);
XC3S_RAM16X233_D	regbank3(rb3_din, rb3_addr1, rb3_addr2, rb3_we, clk, rb3_dout1, rb3_dout2);
/* Quadblock instance */
bquadblk           bqb(cwh[20], qin, cwh[19:16], qout);

assign qin = (cwh[21] == 1'b1) ? a1 : a2;

assign rb1_addr1 = {3'b0, cwh[0]};
assign rb1_addr2 = {3'b0, cwh[1]};
assign rb2_addr1 = {2'b0, cwh[4:3]};
assign rb2_addr2 = {2'b0, cwh[6:5]};
assign rb3_addr1 = {3'b0, cwh[8]};
assign rb3_addr2 = {3'b0, cwh[9]};


/* a0 to a3 are fed to the ALU */
assign a0 = (cwh[11] == 1'b0) ? rb1_dout1 : rb2_dout2;
assign a2 = (cwh[12] == 1'b0) ? rb2_dout1 : rb1_dout2;
assign a1 = (cwh[13] == 1'b0) ? rb3_dout1 : rb2_dout2;
assign a3 = rb3_dout2;

/* Select what get written into RAM */
assign rb1_we = cwh[2];
assign rb1_din = (cwh[22] == 1'b1) ? c0
					: ((cwh[14] == 1'b0) ? c0 : c1);

assign rb2_we = cwh[7];
assign rb2_din = (cwh[22] == 1'b1) ? c1
				: ((cwh[15] == 1'b0) ? c0 : c1);


assign rb3_we = cwh[10];
assign rb3_din = (cwh[22] == 1'b1) ?  233'h1
				: (cwh[20] == 1'b1) ? qout
				: c0;


endmodule
`endif
