/******************************************************************************
 * File	Name			: smul.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : This file contains the module for scalar 
 * multiplication on the curve
 *              y^2 + xy = x^3 + a.x^2 + b
 * where a = 1
 ******************************************************************************/

`timescale 1ns / 1ps
`ifndef __ECSMUL_V__
`define __ECSMUL_V__

//`include "regbank.v"
//`include "ec_alu.v"
//`include "counter.v"

/* Basepoint for the curve, taken from FIPS 186-2 */
`define BASEPOINT_X		233'h0fac9dfcbac8313bb2139f1bb755fef65bc391f8b36f8f8eb7371fd558b
`define BASEPOINT_Y		233'h1006a08a41903350678e58528bebf8a0beff867a7ca36716f7e01f81052
/* The constant b for the curve, from FIPS 186-2 again */
`define CURVECONSTANT_B 233'h066647ede6c332c7f8c0923bb58213b333b20e9ce4281fe115f7d8f90ad
`define KEYMSB 31

/*---------------------------------------------------------------------------
* Module Name	: ecsmul
* Synopsis		: Elliptic Curve scalar multiplier. This is the top module.
* 		Instances of the following are made here
*		1. regfile -> used for registers
*		2. ecalu   -> the ec alu
*		3. counter -> used to find the number of interations to be done
*--------------------------------------------------------------------------*/
module ecsmul(clk, nrst, key,  sx, sy, done);
input  wire  clk;
input  wire  nrst;              /* asynchronous active low reset */
input  wire [`KEYMSB:0] key;    /* The secret key */
output wire [232:0] sx, sy;     /* Contains final result after multiplication */
output wire done;               /* Sets to one when multiplication is complete */

reg  [22:0] cwh;               /* Control Word for Registers*/
reg  [9:0]  cwl;               /* Control word for ALU  */
reg  [`KEYMSB:0] k;            /* The copy of the secret key */
reg  [5:0] state, nextstate;   /* state and next state registers */
reg        start;              /* set when the first 1 is detected in the key */

wire [232:0] a0, a1, a2, a3;    /* ALU Inputs   */
wire [232:0] c0r, c1r;          /* Register File inputs  */
wire [232:0] c0a, c1a;          /* ALU Outputs  */
wire [232:0] yconstants;        /* Could be either basepoint_y or curveconstant_b */
wire         tstart;      		/* see start */

/* Counter variables */
reg   cck;     /* Clock for the counter, toggles every time the state is 1*/
wire  mainclk; /* Takes either the cck or the clk depending on start */
wire  ef;      /* Goes low for one cck clock cycle when counter reaches 0 */


/* Instantiantions */
regbank      regs(clk, cwh, c0r, c1r, a0, a1, a2, a3);
ec_alu       alu(cwl, a0, a1, a2, a3, c0a, c1a);
counter      iterations(mainclk, nrst, ef);

/* The input to regbank is either constants or the results from ALU */
assign c0r = (cwh[22] == 1'b0) ? c0a : `BASEPOINT_X;
assign c1r = (cwh[22] == 1'b0) ? c1a : yconstants;
assign yconstants = (state != 6'd2) ? `BASEPOINT_Y : `CURVECONSTANT_B; 

/* Store the results after converting back into affine coordinates */
assign sx = (key != 233'b1) ? a0 : `BASEPOINT_X;
assign sy = (key != 233'b1) ? a2 : `BASEPOINT_Y;
assign done = (state == 6'd38) ? 1 : 0;      /* Set done to 1 if multiplication is complete */

/* the next state logic */
always @(state) begin
	case(state)
	/* Init states */
	6'd0:  nextstate <= 6'd1;
	6'd1:  nextstate <= 6'd2;
	6'd2:  nextstate <= 6'd3;
	/* Double States */
	6'd3:  nextstate <= 6'd4;
	6'd4:  nextstate <= 6'd5;
	6'd5:  nextstate <= 6'd6;
	6'd6: begin
		if(k[`KEYMSB] == 1'b1)
			nextstate <= 6'd7;   /* Do Addition and doubling if K0 is 1 */
		else if (ef == 1'b0)
			nextstate <= 6'd15;  /* k[0]=0 and we are in the last iteration, goto end */
		else
			nextstate <= 6'd3;   /* Skip addition and do next doubling */
	end
	/* Addition States */
	6'd7:  nextstate <= 6'd8;
	6'd8:  nextstate <= 6'd9;
	6'd9:  nextstate <= 6'd10;
	6'd10:  nextstate <= 6'd11;
	6'd11:  nextstate <= 6'd12;
	6'd12:  nextstate <= 6'd13;
	6'd13:  nextstate <= 6'd14;
	6'd14: begin
		if(ef == 1'b1)
			nextstate <= 6'd3;
		else
			nextstate <= 6'd15;
	end
	/* The Itoh Tsujii States */
	6'd15: nextstate <= 6'd16;
	6'd16: nextstate <= 6'd17;
	6'd17: nextstate <= 6'd18;
	6'd18: nextstate <= 6'd19;
	6'd19: nextstate <= 6'd20;
	6'd20: nextstate <= 6'd21;
	6'd21: nextstate <= 6'd22;
	6'd22: nextstate <= 6'd23;
	6'd23: nextstate <= 6'd24;
	6'd24: nextstate <= 6'd25;
	6'd25: nextstate <= 6'd26;
	6'd26: nextstate <= 6'd27;
	6'd27: nextstate <= 6'd28;
	6'd28: nextstate <= 6'd29;
	6'd29: nextstate <= 6'd30;
	6'd30: nextstate <= 6'd31;
	6'd31: nextstate <= 6'd32;
	6'd32: nextstate <= 6'd33;
	6'd33: nextstate <= 6'd34;
	6'd34: nextstate <= 6'd35;
	6'd35: nextstate <= 6'd36;
	6'd36: nextstate <= 6'd37;
	6'd37: nextstate <= 6'd38;
	6'd38: nextstate <= 6'd38;
	default:  nextstate <= 6'bx;
	endcase
end

/* FSM */
always @(posedge clk) begin
	if(nrst == 1'b0) 
		state <= 6'd0;
	else if(start == 1'b0)
		state <= 6'd1;
	else
		state <= nextstate;
end

/* Output Logic */
always @(state) begin
	case(state)		
	6'd0: begin                     
		cwl <= 10'h000;            /* Init L2R Step 1 */
		cwh <= 23'h4x8484;
	end
	6'd1: begin
		cwl <= 10'h000;
		cwh <= 23'h4x808D;         /* Init L2R Step 2 */
	end
	6'd2: begin
		cwl <= 10'hx;              /* Init L2R Step 3 */
		cwh <= 23'h4xx098;
	end
	/* The Doubling*/
	6'd3: begin                    /* Double Step 1 */
		cwl <= 10'h209;
		cwh <= 23'h0x8490;
	end
	6'd4: begin                    /* Double Step 1a */
		cwl <= 10'h002;
		cwh <= 23'h0x20F0;
	end
	6'd5: begin                    /* Double Step 2 */
		cwl <= 10'h324;
		cwh <= 23'h0x6544;
	end
	6'd6: begin                    /* Double Step 3 */
		cwl <= 10'hxC0;
		cwh <= 23'h0x0ac0;
	end

	/* The Addition States */
	6'd7: begin                    /* Addition Step 1 */
		cwl <= 10'h048;
		cwh <= 23'h0x08a0;
	end
	6'd8: begin                    /* Addition Step 2 */
		cwl <= 10'h002;
		cwh <= 23'h0x5006;
	end
	6'd9: begin                    /* Addition Step 3 */
		cwl <= 10'h028;
		cwh <= 23'h0x0090;
	end
	6'd10: begin                    /* Addition Step 4 */
		cwl <= 10'h011;
		cwh <= 23'h0x0214;
	end
	6'd11: begin                    /* Addition Step 5 */
		cwl <= 10'h102;
		cwh <= 23'h0x6544;
	end
	6'd12: begin                   /* Addition Step 6 */
		cwl <= 10'h08A;
		cwh <= 23'h0xB4D2;
	end
	6'd13: begin                   /* Addition Step 7 */ 
		cwl <= 10'h00B;
		cwh <= 23'h0x18A2;
	end
	6'd14: begin                   /* Addition Step 8 */
		cwl <= 10'h058;
		cwh <= 23'h0x0ac0;
	end

	/* The final Inverse : Starting the Itoh Tsujii here*/
	6'd15: begin                   /* Inv 1 */
		cwl <= 10'hx0D;        
		cwh <= 23'h0x04x0;         /* The first a=a^3 */
	end
	6'd16: begin                   /* Inv 2 */ 
		cwl <= 10'hx06;
		cwh <= 23'h0x0090;
	end
	6'd17: begin                   /* Inv 3 */
		cwl <= 10'hx35;
		cwh <= 23'h0x0090;
	end
	6'd18: begin                   /* Inv 4-1 */ 
		cwl <= 10'hx;
		cwh <= 23'h130510;
	end
	6'd19: begin                   /* Inv 4-2 */
		cwl <= 10'hx02;	
		cwh <= 23'h0x0190;
	end
	6'd20: begin                   /* Inv 5 */
		cwl <= 10'hx35;
		cwh <= 23'h0x0090;
	end
	6'd21: begin                   /* Inv 6-1 */
		cwl <= 10'hx;
		cwh <= 23'h170510;
	end
	6'd22: begin                   /* Inv 6-2 */
		cwl <= 10'hx02;
		cwh <= 23'h0x0190;
	end
	6'd23: begin                   /* Inv 7-1 */
		cwl <= 10'hx;
		cwh <= 23'h1E0510;
	end
	6'd24: begin                   /* Inv 7-2 */
		cwl <= 10'hx02;
		cwh <= 23'h0x0190;
	end
	6'd25: begin                   /* Inv 8 */ 
		cwl <= 10'hx35;
		cwh <= 23'h0x0090;
	end
	6'd26: begin                   /* Inv 9-1 */
		cwl <= 10'hx;
		cwh <= 23'h1E0510; 
	end
	6'd27: begin                  /* Inv 9-2 */
		cwl <= 10'hx;
		cwh <= 23'h3E0500;
	end
	6'd28: begin
		cwl <= 10'hx3A;           /* Inv 9-3 */
		cwh <= 23'h0x0190;
	end
	6'd29: begin                  /* Inv 10-1 */
		cwl <= 10'hx;
		cwh <= 23'h1E0510; 
	end
	6'd30: begin                  /* Inv 10-2 */
		cwl <= 10'hx;
		cwh <= 23'h3E0500; 
	end
	6'd31: begin                  /* Inv 10-3 */
		cwl <= 10'hx;
		cwh <= 23'h3E0500; 
	end
	6'd32: begin                  /* Inv 10-4 */
		cwl <= 10'hx;
		cwh <= 23'h3E0500; 
	end
	6'd33: begin                  /* Inv 10-5 */
		cwl <= 10'hx;
		cwh <= 23'h320500; 
	end
	6'd34: begin                  /* Inv 10-6 */
		cwl <= 10'hx02;
		cwh <= 23'h0x0190;
	end
	6'd35: begin                  /* Final Square */
		cwl <= 10'hx8x;
		cwh <= 23'h0x2440;
	end
	6'd36: begin                   /* Convert to affine (x/z) */
		cwl <= 10'hx00;
		cwh <= 23'h0x0004;
	end
	6'd37: begin                   /* Convert to affine (x/z^2) */
		cwl <= 10'hx08;
		cwh <= 23'h0x0880;
	end
	6'd38: begin				   /* Completion State */
		cwl <= 10'hx;
		cwh <= 23'h0x0000;
	end
	default: begin
		cwl <= 10'bx;
		cwh <= 23'hx;
	end
	endcase
end


/* Shift register for the key. The current bit is always the MSB */
always @(posedge clk) begin
	if (nrst == 1'b0)
		k <= key;
	else if (start == 1'b0)        /* if start=0, shift every clock cycle */
		k[`KEYMSB:0] <= {k[(`KEYMSB-1):0], 1'b0};
	else if (state == 6'd4)        /* if start=1, shift once very iteration of multiplier */
		k[`KEYMSB:0] <= {k[(`KEYMSB-1):0], 1'b0};
	else                           /* else, don't shift */
		k[`KEYMSB:0] <= k[`KEYMSB:0];
end

/* Detect the first 1 */
assign tstart = start;

/* The counter clock is either a fast clock (clk) used during
*  leading 1 detection, or a slow clock used during multiplication
*/
assign mainclk = (start == 1'b0) ? clk : cck;      

always @(posedge clk) begin
	if (nrst == 1'b0)
		start <= key[`KEYMSB];
	else
		start <= tstart | k[(`KEYMSB - 1)];
end

/* Generate clock signal for counter */
always @(posedge clk) begin

	if (nrst == 1'b0) begin
		cck <= 1'b0;
	end
	else begin
		case(state) 
		6'd3: cck <= ~cck;
		6'd4: cck <= ~cck;
		default:   cck <= cck;
		endcase
	end
end


endmodule


`endif
