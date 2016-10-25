/******************************************************************************
 * File	Name			: ec_alu.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : This file contains the module for ALU of the
 * elliptic curve processor for the curve
 *              y^2 + xy = x^3 + a.x^2 + b
 * where a = 1
 ******************************************************************************/
`timescale 1ns / 1ps
`ifndef __ECALU_V__
`define __ECALU_V__

//`include "ff/multiplier.v"
//`include "ff/sqr.v"
//`include "mux8.v"
//`include "mux4.v"

/*---------------------------------------------------------------------------
* Module Name	: ec_alu
* Synopsis		: Elliptic Curve ALU
*          Finite field elements are instantiated over here
*          1. Multiplier
*          2. Squarers
*--------------------------------------------------------------------------*/
module ec_alu(cw, a0, a1, a2, a3, c0, c1);
input wire [232:0] a0, a1, a2, a3;            /* the inputs to the alu */
input wire [9:0] cw;                          /* the control word */
output wire [232:0] c0, c1;                   /* the alu outputs */

/* Temporary results */
wire [232:0] a0sq, a0qu;
wire [232:0] a1sq, a1qu;
wire [232:0] a2sq, a2qu;
wire [232:0] sa2, sa4, sa5, sa7, sa8, sa8_1;
wire [232:0] sc1;
wire [232:0] sd2, sd2_1;

/* Multiplier inputs and output */
wire [232:0] minA, minB, mout;

multiplier mul(minA, minB, mout);
squarer     sq1_p0(a0, a0sq);
squarer     sq_p1(a1, a1sq);
squarer     sq_p2(a2, a2sq);

squarer     sq2_p2(a2sq, a2qu);
squarer     sq2_p1(a1sq, a1qu);
squarer     sq2_p3(a0sq, a0qu);

/* Choose the inputs to the Multiplier */
mux8       muxA(a0,   a0sq, a2, sa7, sd2, a1, a1qu, 233'd0, cw[2:0], minA);
mux8       muxB(a1,   a1sq, sa4, sa8, sd2_1, a3, a2qu,a1qu, cw[5:3], minB);

/* Choose the outputs of the ALU */
mux4       muxC(mout,  sa2, a1sq, sc1, cw[7:6], c0);  
mux4       muxD(sa8_1,  sa5, a1qu, sd2, cw[9:8], c1);  

assign sa2 = mout ^ a2;
assign sa4 = a1sq ^ a2;
assign sa5 = mout ^ a2sq ^ a0;
assign sa7 = a0 ^ a2;
assign sa8 = a1 ^ a3;
assign sa8_1 = mout ^ a0;

assign sc1 = mout ^ a3;

assign sd2 = a0qu ^ a1;
assign sd2_1 = a2sq ^ a3 ^ a1;


endmodule
`endif

