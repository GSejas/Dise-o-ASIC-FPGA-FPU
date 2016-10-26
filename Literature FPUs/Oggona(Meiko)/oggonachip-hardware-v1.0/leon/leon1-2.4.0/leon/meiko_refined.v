
/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)cells.v
***
****************************************************************************
****************************************************************************/
//
// BASIC ENABLED REGISTER
// synopsys translate_off

`timescale 1 ns / 1 ns
// synopsys translate_on

module Mflipflop (out, in, clock, enable_l);
output out;
input in;
input clock;
input enable_l; // must be low to allow master to open

	wire logic_0 = 1'b0 ;
	wire logic_1 = 1'b1 ;
	ASFFHA dff (.H(enable_l),.D(in),.Q(out),.CK(clock),.SM(logic_0),.SI(logic_0));

endmodule

//-----------------------------------------------------------------------------
// BASIC 1-BIT RESETABLE FLIP FLOP

module MflipflopR (out, in, clock, enable_l,reset);
output out;
input in;
input clock;
input enable_l; // must be low to allow master to open
input reset;

	wire logic_0 = 1'b0 ;
	wire logic_1 = 1'b1 ;
	wire resetn = ~reset ;
	ASFFRHA dff (.H(enable_l),.D(in),.Q(out),.CK(clock),.SM(logic_0),.SI(logic_0),.R(resetn));

endmodule

//-----------------------------------------------------------------------------
// BASIC 1-BIT SCANNABLE, RESETABLE FLIP FLOP

module Mflipflop_srh (out, in, scanen,sin, enable_l, reset_l, clock);
output out;
input in;
input scanen, sin ;
input clock;
input enable_l; // must be low to allow master to open
input reset_l;

	ASFFRHA dff (
	    .Q(out),
	    .D(in),
	    .SM(scanen),
	    .SI(sin),
	    .H(enable_l),
	    .R(reset_l),
	    .CK(clock)
	);

endmodule

//-----------------------------------------------------------------------------
// ASYNC RESETABLE FLIP FLOP
module Mflipflop_ar(out, in, async_reset_l, clock) ;
	output out ;
	input in ;
	input async_reset_l ;
	input clock ;

	JSRFFA dff(.D(in), .CK(clock), .CL(async_reset_l), .PR(1'b1), .Q(out)) ;
endmodule

//-----------------------------------------------------------------------------
module Mflipflop_sh (out, in, scanen,sin, enable_l, clock);
output out;
input in;
input scanen, sin ;
input clock;
input enable_l; // must be low to allow master to open


	ASFFHA dff (
	    .Q(out),
	    .D(in),
	    .SM(scanen),
	    .SI(sin),
	    .H(enable_l),
	    .CK(clock)
	);

endmodule
//-----------------------------------------------------------------------------
//module S1dffrh (q,q_n,din,hold,reset_n,clk);
module Mflipflop_rh (out, in, enable_l, reset_l, clock);
output out;
input in;
input clock;
input enable_l; // must be low to allow master to open
input reset_l;

	ADFFRHA dff (
	    .Q(out),
	    .D(in),
	    .H(enable_l),
	    .R(reset_l),
	    .CK(clock)
	);

endmodule
//---------------------------------------------------------------------------
//module S1dffsr (q,din,hold,reset_n,clk);
module Mflipflop_sr (out, in, scanen, sin, reset_l, clock);
output out;
input in;
input clock;
input reset_l;
input scanen,sin ;

	ASFFRA dff (
	    .Q(out),
	    .D(in),
	    .R(reset_l),
	    .SM(scanen),
	    .SI(sin),
	    .CK(clock)
	);

endmodule

//---------------------------------------------------------------------------
//module S1dffs_d (q,din,hold,reset_n,clk);
module Mflipflop_s (out, in, scanen, sin, clock);
output out ;
input in ;
input clock ;
input sin ;
input scanen ;


	ASFFA dff (
	    .Q(out),
	    .D(in),
	    .SM(scanen),
	    .SI(sin),
	    .CK(clock)
	);

endmodule
//-----------------------------------------------------------------------------
//module S1dffr (q,din,hold,reset_n,clk);
module Mflipflop_r (out, in, reset_l, clock);
output out ;
input in ;
input clock ;
input reset_l ; // must be low to allow master to open


	ADFFRA dff (
	    .Q(out),
	    .D(in),
	    .R(reset_l),
	    .CK(clock)
	);

endmodule
//-----------------------------------------------------------------------------
//module S1dffr (q,din,hold,reset_n,clk);
module Mflipflop_h (out, in, enable_l, clock);
output out ;
input in ;
input clock ;
input enable_l ; // must be low to allow master to open

	ASFFA dff (
	    .Q(out),
	    .D(in),
	    .SM(enable_l),	// use the scan mux to implement hold function
	    .SI(out),
	    .CK(clock)
	);

endmodule
//-----------------------------------------------------------------------------


//module S1dff (q,din,clk);
module Mflipflop_noop (out, in, clock);
output out ;
input in ;
input clock ;

	JDFFA dff (
	    .Q(out),
	    .D(in),
	    .CK(clock)
	);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)ff_primitives.v
***
****************************************************************************
****************************************************************************/

module fj_dff_e(q, d, clk);
output	q; 
input   d, clk;


        reg q;

         always @(posedge (clk)) begin
            	q <= #1 d;
        end

endmodule
 
module fj_dff_ec(q, d, clk, c);
output q; 
input  d, clk, c;

       reg  q;

	always @(posedge clk or posedge c) begin
		if (c)
	          	q <= #1 1'b0;
		else
                  	q <= #1 d;
        end
endmodule
 
module fj_dff_es(q, d, clk, s);
output q;
input  d, clk, s;
 
       reg q;

	always @(posedge clk or posedge s) begin
		if (s)
	           	q <= #1 1'b1;
		else
                   	q <= #1 d;
        end
endmodule
 
module fj_dff_ecs(q, d, clk, c, s);
output  q; 
input   d, clk, c, s;
 
        reg q;
	always @(posedge clk or posedge s or posedge c) begin
		if (c)
		  	q <= #1 1'b0;
		else if (s)
		  	q <= #1 1'b1;
		else
                   	q <= #1 d;
        end
endmodule
 
 

module fj_dff_e_muxscan(q, d, si, sm, clk);
output q;
input d, si, sm, clk;

        reg q;

        always @(posedge clk) begin
                if (sm==1'b0) 
		  	q <= #1 d;
                else if (sm==1'b1)
		  	q <= #1 si;
                else    q <= #1 1'bx;
        end

endmodule


module fj_dff_ec_muxscan(q, d, si, sm, clk, c);
output q; 
input  d, si, sm, clk, c;

       reg q;

        always @(posedge clk or posedge c) begin
		if (c)
		  	q <= #1 1'b0;	
                else if (sm==1'b0) 
		  	q <= #1 d;
                else if (sm==1'b1)
		  	q <= #1 si;
                else    q <= #1 1'bx;
        end


endmodule
 
module fj_dff_es_muxscan(q, d, si, sm, clk, s);
output q; 
input  d, si, sm, clk, s;

       reg q;

        always @(posedge clk or posedge s) begin
		if (s)
		  	q <= #1 1'b1;	
                else if (sm==1'b0) 
		  	q <= #1 d;
                else if (sm==1'b1)
		  	q <= #1 si;
                else    q <= #1 1'bx;
        end

endmodule
 
module fj_dff_ecs_muxscan(q, d, si, sm, clk, c, s);
output  q; 
input   d, si, sm, clk, c, s;

        reg q;

        always @(posedge clk or posedge c or posedge s) begin
		if (s)
		   	q <= #1 1'b1;	
		else if (c)
		   	q <= #1 1'b0;
                else if (sm==1'b0) 
		   	q <= #1 d;
                else if (sm==1'b1)
		   	q <= #1 si;
                else    q <= #1 1'bx;
        end


endmodule
 
module fj_latch_e(Q, G, D);
output Q; 
input  G, D;

       reg Q;

always @ (G or D) begin

       if (G==1)     Q <= #1 D;

end

endmodule
 
module fj_xctrl(oe, en,en_);
output oe;
input  en, en_;

 assign oe = (en && (~en_));

endmodule

 
module UDP_MUX21(O_, A,B, S);
output	O_;
input	A, B, S;



  assign O_ = ((~A && ~S) || (~B && S));


endmodule
 
module UDP_LATCH(Q, G_,D);
output Q; 
input  G_, D;

       reg Q;
 
always @ (G_ or D) begin

       if (G_==0)    Q <= #1 D;
 
end

endmodule
 
module UDP_LATCH1(Q_, G1,G2, D1,D2);
output Q_; 
input  G1, G2, D1, D2;

       reg Q_;
 
always @ (G1 or G2 or D1 or D2) begin

       if ((G1==1) & (G2==0))     Q_ <= #1 D1;
 
       else if ((G1==0) & (G2==1))     Q_ <= #1 D2;
         
end

endmodule
 
module UDP_LATCH2(Q_, G1A,G1B, D);
output Q_; 
input  G1A, G1B, D;

       reg Q_;

always @ (G1A or G1B or D) begin

       if ((G1A==1) & (G1B==1))    Q_ <= #1 ~D;

end

endmodule
 

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)macros.v
***
****************************************************************************
****************************************************************************/

module Mflipflop_8 (out, din, clock, enable_l) ;
output [7:0] out ;
input [7:0]  din ;
input   clock ;
input   enable_l ;

	Mflipflop Mflipflop_7_0 (out[0], din[0], clock, enable_l);
	Mflipflop Mflipflop_7_1 (out[1], din[1], clock, enable_l);
	Mflipflop Mflipflop_7_2 (out[2], din[2], clock, enable_l);
	Mflipflop Mflipflop_7_3 (out[3], din[3], clock, enable_l);
	Mflipflop Mflipflop_7_4 (out[4], din[4], clock, enable_l);
	Mflipflop Mflipflop_7_5 (out[5], din[5], clock, enable_l);
	Mflipflop Mflipflop_7_6 (out[6], din[6], clock, enable_l);
	Mflipflop Mflipflop_7_7 (out[7], din[7], clock, enable_l);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)me_cells.v
***
****************************************************************************
****************************************************************************/

/*
PRIMATIVES

Latches
Combinational logic gates
Multiplexors
Pads
Clock buffers

MACROS -- use seperate file macros.v

Registers
Wide multiplexors
Bus drivers

Shifters
Alus
Adders

Rams
Roms

*/

/* Latches
ME_LD1  simple d latch, active LOW clock
ME_FD1  fimple ff active on positive clock edge
ME_FD1E FD2 with a data load enable
ME_FD1E2 FD2 with two data inputs, each with is own enable.
FJK1 JK flip flop, pos edge load.
FJK2 JK flip flop, pos edge load, with active low clear.
*/

/* logic Gates
NAND{n} n input nand gate
NOR{n}  n input nor gate
AND{n}  n input and gate
OR{n}   n input or gate
ME_INVA    invertor
ME_BUFF    buffer
ME_DELBUFF buffer with approx 3ns delay
ME_TSBUFF  tristate buffer
ME_XOR2    2 input xor gate
ME_XNOR2   2 input xnor
ME_ADD2    half adder
ME_ADD3    full adder
*/

/* Matrix Gates
ME_AnOmI   And-Or-Invert gates
ME_OnAmI   Or-And-Invert gates
*/

/*  Multiplexors/selectors
MUX{n}   n input multiplexor with seperate selectors
NMUX{n}  n input inverting multiplexor with seperate selectors

MUX{n)B  binary coded selectors.
NMUX{n)B binary coded selectors, inverting

ME_NMUX2BA  as NMUX2B except you must supply true and false of control inputs
*/

/* Pads */


/* MACROS */

/* registers
DREG_{x}_{y} x bit wide register with y inputs. transparent when clock high
FREG_{x}_{y} x bit wide register with y inputs. edge trigger on posedge strobe
MUX_{x}_{y}  x bit wide multiplexor with y inputs
*/

/* function blocks
ALU_{x}      x bit wide ALU
ME_ADD_{x}      x bit wide add/subtract
*/

/* roms and roms
ME_ROM_{x}_{y}  x bit wide rom with y address bits
ME_RAM_{x}_{y}  x bit wide ram with y address bits
ME_RAM3_{x}_{y} x bit wide 3 port ram with y address bits
*/

/* Actual modules */

module ME_FD1 (cp, d, q, qn);
   input d, cp;
   output q, qn ;

//   N1Z000 gnd(GND);
//   ASFFA dff (.Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),  .CK(cp));

   Mflipflop_noop dff (.out(q), .in(d), .clock(cp) );
   assign qn = ~q;

endmodule

module ME_FD1_B (cp, d, q, qn);
   input d, cp;
   output q, qn ;

//   N1Z000 gnd(GND);
//   ASFFA dff (.Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),  .CK(cp));

   Mflipflop_noop dff (.out(q), .in(d), .clock(cp) );
   assign qn = ~q;

endmodule

module ME_FD1P (cp, d, q, qn);	// should be a high drive version of ME_FD1;
   input d, cp;			// for simulation, they are the same.
   output q, qn ;

//   N1Z000 gnd(GND);
//   ASFFA dff (.Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),  .CK(cp));

   Mflipflop_noop dff (.out(q), .in(d), .clock(cp) );
   assign qn = ~q;

endmodule

module ME_FDS2LP (d, cp, cr, ld, q, qn);
// ld is active high, cr is active low
   input d, cp, cr, ld;
   output q, qn;
   
//    N1Z000 gnd(GND);
//    wire hold;
//    JINVA i0  ( .O(hold), .A(ld) );
//    ASFFRHA dff ( .Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),
//		 .H(hold), .R(cr), .CK(cp) ) ;

   wire load_l;
   assign load_l = ~ld;
   Mflipflop_rh dff (.out(q), .in(d), .enable_l(load_l), .reset_l(cr), .clock(cp));
   assign qn = ~q;

endmodule

module ME_FD1E (cp, te, d, q, qn);
// like FD1 but with enable 
// note enable is active high
   input d, cp, te;
   output q, qn ;

//   N1Z000 gnd(GND);
//   wire hold;
//   JINVA i0  ( .O(hold), .A(te) );
//   ASFFHA  dff ( .Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),
//		.H(hold), .CK(cp)) ;

   wire load_l;
   assign load_l = ~te;
   Mflipflop dff (.out(q), .in(d), .clock(cp), .enable_l(load_l));
   assign qn = ~q;

endmodule

module ME_FD1E_B (cp, te, d, q, qn);
// like FD1 but with enable 
// note enable is active high
   input d, cp, te;
   output q, qn ;

//   N1Z000 gnd(GND);
//   wire hold;
//   JINVA i0 ( .O(hold), .A(te) );
//   ASFFHA dff ( .Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),
//		.H(hold), .CK(cp)) ;

   wire load_l;
   assign load_l = ~te;
   Mflipflop dff (.out(q), .in(d), .clock(cp), .enable_l(load_l));
   assign qn = ~q;

endmodule

module ME_FD1R (d, cp, cr, q, qn);
// CR (reset) is active low
   input d, cp, cr;
   output q, qn;
   
//    N1Z000 gnd(GND);
//    ASFFRA dff  ( .Q(q), .XQ(qn), .D(d), .SM(GND), .SI(GND),
//		 .R(cr), .CK(cp) ) ;

   Mflipflop_r dff (.out(q), .in(d), .reset_l(cr), .clock(cp));
   assign qn = ~q;

endmodule

// Logic Gates
module ME_INV_A (a, x); // Meanest gate
   input a;
   output x;
   JINVA i (.O(x), .A(a) );
endmodule

module ME_INVA (a, x);
   input a;
   output x;
   JINVA i (.O(x), .A(a) );
endmodule

module ME_INV_B (a, x);
   input a;
   output x;
   JINVB i (.O(x), .A(a) );
endmodule

module ME_INV_C (a, x);
   input a;
   output x;
   JINVC i (.O(x), .A(a) );
endmodule

module ME_INV_D (a, x);
   input a;
   output x;
   JINVD i (.O(x), .A(a) );
endmodule

module ME_INV_A_10 (A, Z);
   input [9:0] A;
   output [9:0] Z;

JINVA g0 (.O(Z[0]), .A(A[0]) );
JINVA g1 (.O(Z[1]), .A(A[1]) );
JINVA g2 (.O(Z[2]), .A(A[2]) );
JINVA g3 (.O(Z[3]), .A(A[3]) );
JINVA g4 (.O(Z[4]), .A(A[4]) );
JINVA g5 (.O(Z[5]), .A(A[5]) );
JINVA g6 (.O(Z[6]), .A(A[6]) );
JINVA g7 (.O(Z[7]), .A(A[7]) );
JINVA g8 (.O(Z[8]), .A(A[8]) );
JINVA g9 (.O(Z[9]), .A(A[9]) );

endmodule

module ME_INV_A_58 (A, Z);
   input [57:0] A;
   output [57:0] Z;

   ME_INV_A_10 h0 (A[9:0], Z[9:0]);
   ME_INV_A_10 h2 (A[19:10], Z[19:10]);
   ME_INV_A_10 h3 (A[29:20], Z[29:20]);
   ME_INV_A_10 h4 (A[39:30], Z[39:30]);
   ME_INV_A_10 h5 (A[49:40], Z[49:40]);
   ME_INV_A    g0 (A[50], Z[50]);
   ME_INV_A    g1 (A[51], Z[51]);
   ME_INV_A    g2 (A[52], Z[52]);
   ME_INV_A    g3 (A[53], Z[53]);
   ME_INV_A    g4 (A[54], Z[54]);
   ME_INV_A    g5 (A[55], Z[55]);
   ME_INV_A    g6 (A[56], Z[56]);
   ME_INV_A    g7 (A[57], Z[57]);

endmodule

module ME_BUFF (a, x);
   input a;
   output x;
   JBUFC i (.O(x), .A(a) );
endmodule

module ME_BUF_B (a, x); // Same as ME_BUFF
   input a;
   output x;
   JBUFD i (.O(x), .A(a) );
endmodule

module ME_BUF_C (a, x); // Same as ME_BUFF
   input a;
   output x;
   JBUFD i (.O(x), .A(a) );
endmodule

module ME_BUF_D (a, x); // Same as ME_BUFF
   input a;
   output x;
   JBUFE i (.O(x), .A(a) );
endmodule

module ME_BUF3_4 ( a, x );
   input [3:0] a;
   output [3:0] x;

   ME_BUF_C i0 (a[0], x[0]);
   ME_BUF_C i1 (a[1], x[1]);
   ME_BUF_C i2 (a[2], x[2]);
   ME_BUF_C i3 (a[3], x[3]);
endmodule

module ME_BUF32_C ( a, x );
   input  [31:0] a;
   output [31:0] x;
   JBUFC i0  (.O(x[0]), .A(a[0]) );
   JBUFC i1  (.O(x[1]), .A(a[1]) );
   JBUFC i2  (.O(x[2]), .A(a[2]) );
   JBUFC i3  (.O(x[3]), .A(a[3]) );
   JBUFC i4  (.O(x[4]), .A(a[4]) );
   JBUFC i5  (.O(x[5]), .A(a[5]) );
   JBUFC i6  (.O(x[6]), .A(a[6]) );
   JBUFC i7  (.O(x[7]), .A(a[7]) );
   JBUFC i8  (.O(x[8]), .A(a[8]) );
   JBUFC i9  (.O(x[9]), .A(a[9]) );
   JBUFC i10 (.O(x[10]), .A(a[10]) );
   JBUFC i11 (.O(x[11]), .A(a[11]) );
   JBUFC i12 (.O(x[12]), .A(a[12]) );
   JBUFC i13 (.O(x[13]), .A(a[13]) );
   JBUFC i14 (.O(x[14]), .A(a[14]) );
   JBUFC i15 (.O(x[15]), .A(a[15]) );
   JBUFC i16 (.O(x[16]), .A(a[16]) );
   JBUFC i17 (.O(x[17]), .A(a[17]) );
   JBUFC i18 (.O(x[18]), .A(a[18]) );
   JBUFC i19 (.O(x[19]), .A(a[19]) );
   JBUFC i20 (.O(x[20]), .A(a[20]) );
   JBUFC i21 (.O(x[21]), .A(a[21]) );
   JBUFC i22 (.O(x[22]), .A(a[22]) );
   JBUFC i23 (.O(x[23]), .A(a[23]) );
   JBUFC i24 (.O(x[24]), .A(a[24]) );
   JBUFC i25 (.O(x[25]), .A(a[25]) );
   JBUFC i26 (.O(x[26]), .A(a[26]) );
   JBUFC i27 (.O(x[27]), .A(a[27]) );
   JBUFC i28 (.O(x[28]), .A(a[28]) );
   JBUFC i29 (.O(x[29]), .A(a[29]) );
   JBUFC i30 (.O(x[30]), .A(a[30]) );
   JBUFC i31 (.O(x[31]), .A(a[31]) );
endmodule

module ME_NAND2 (a, b, z);
   input a, b;
   output z;
   JNAND2A i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_NAND2_B (a, b, z);
   input a, b;
   output z;
   JNAND2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_NAND3 (a, b, c, z);
   input a, b, c;
   output z ;
   JNAND3A i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_NAND3_B (a, b, c, z);
   input a, b, c;
   output z ;
   JNAND3B i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_NAND4 (a, b, c, d, z);
   input a, b, c, d;
   output z ;
   JNAND4A i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d) );
endmodule

module ME_NAND5 (a, b, c, d, e, z);
   input a, b, c, d, e;
   output z ;
   ANAND5C i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e) );
endmodule

module ME_NAND6_B (a, b, c, d, e, f, z);
   input a, b, c, d, e, f;
   output z ;
   JNAND6C i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f) );
endmodule

module ME_NAND8 (a, b, c, d, e, f, g, h, z);
   input a, b, c, d, e, f, g, h ;
   output z ;
   JNAND8C i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f),
		.A7(g), .A8(h) );
endmodule

module ME_NAND8_B (a, b, c, d, e, f, g, h, z);
   input a, b, c, d, e, f, g, h ;
   output z ;
   JNAND8C i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f),
		.A7(g), .A8(h) );
endmodule

// AND gates
module ME_AND2 (a, b, z);
   input a, b;
   output z;
   JAND2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_AND2_B (a, b, z);
   input a, b;
   output z;
   JAND2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_AND3 (a, b, c, z);
   input a, b, c;
   output z;
   JAND3B i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_AND3_B (a, b, c, z);
   input a, b, c;
   output z;
   JAND3B i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_AND4 (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JAND4B i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d) );
endmodule

module ME_AND4_B (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JAND4B i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d) );
endmodule

module ME_AND7 ( a1, a2, a3, a4, a5, a6, a7, z );
   input a1, a2, a3, a4, a5, a6, a7 ;
   output z ;
   wire x1, x2;
   JNAND3A i0 (.O(x1), .A1(a1), .A2(a2), .A3(a3) );
   JNAND4A i1 (.O(x2), .A1(a4), .A2(a5), .A3(a6), .A4(a7) );
   JNOR2A i2 (.O(z), .A1(x1), .A2(x2) );
endmodule

module ME_AND8 (a, b, c, d, e, f, g, h, z);
   input a, b, c, d, e, f, g, h ;
   output z ;
   JAND8B i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f),
		.A7(g), .A8(h) );
endmodule

// nor gates
module ME_NOR2 (a, b, z);
   input a, b ;
   output z;
   JNOR2A i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_NOR2_B (a, b, z);
   input a, b ;
   output z;
   JNOR2C i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_NOR2_D (a, b, z);
   input a, b ;
   output z;
   JNOR2D i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_NOR3 (a, b, c, z);
   input a, b, c ;
   output z;
   JNOR3C i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_NOR4 (a, b, c, d, z);
   input a, b, c, d ;
   output z;
   JNOR4B i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d) );
endmodule

module ME_NOR6_B (a, b, c, d, e, f, z);
   input a, b, c, d, e, f ;
   output z;
   JNOR6C i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f) );
endmodule

module ME_OR2 (a, b, z);
   input a, b ;
   output z;
   JOR2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_OR2_B (a, b, z);
   input a, b ;
   output z;
   JOR2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_OR3 (a, b, c, z);
   input a, b, c ;
   output z;
   JOR3B i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_OR3_B (a, b, c, z);
   input a, b, c ;
   output z;
   JOR3B i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

module ME_OR4 (a, b, c, d, z);
   input a, b, c, d ;
   output z;
   JOR4B i (.O(z), .A1(a), .A2(b), .A3(c), .A4(d) );
endmodule

module ME_OR6 (a, b, c, d, e, f, X);
   input a, b, c, d, e, f ;
   output X ;
   JOR6B i (.O(X), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f) );
endmodule

module ME_OR8 (a, b, c, d, e, f, g, h, X);
   input a, b, c, d, e, f, g, h ;
   output X ;
   JOR8B i (.O(X), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f),
		.A7(g), .A8(h) );
endmodule

module ME_OR11 (a, b, c, d, e, f, g, h, i, j, k, X);
   input a, b, c, d, e, f, g, h, i, j, k;
   output X ;
   wire x0, x1;
   JNOR8C u0 (.O(x0), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f),
		.A7(g), .A8(h) );
   JNOR3A u1 (.O(x1), .A1(i), .A2(j), .A3(k) );
   JNAND2A u2 (.O(X), .A1(x0), .A2(x1) );
endmodule

module ME_OR12 (a, b, c, d, e, f, g, h, i, j, k, l, X);
   input a, b, c, d, e, f, g, h, i, j, k, l;
   output X ;
   wire x0, x1;
   JNOR8C u0 (.O(x0), .A1(a), .A2(b), .A3(c), .A4(d), .A5(e), .A6(f),
		.A7(g), .A8(h) );
   JNOR4B u1 (.O(x1), .A1(i), .A2(j), .A3(k), .A4(l) );
   JNAND2A u2 (.O(X), .A1(x0), .A2(x1) );
endmodule

module ME_XNOR2 (a, b, z);
   input a, b;
   output z;
   JXNOR2A i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_XNOR2_B (a, b, z);
   input a, b;
   output z;
   JXNOR2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_XOR2 (a, b, z);
   input a, b;
   output z;
   JXOR2A i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_XOR2_B (a, b, z);
   input a, b;
   output z;
   JXOR2B i (.O(z), .A1(a), .A2(b) );
endmodule

module ME_XOR3_B (a, b, c, z);
   input a, b, c;
   output z;
   JXOR3A i (.O(z), .A1(a), .A2(b), .A3(c) );
endmodule

// Matrix gates

module ME_A2O1_B (a, b, c, z);			// z = (a&b) | c
   input a, b, c;
   output z;
   JDB21A i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_AI2O1_C (a, b, c, z);			// z = (a & ~b) | c
   input a, b, c;
   output z;
   ADBI21C i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_AI2O1_D (a, b, c, z);			// z = (a & ~b) | c
   input a, b, c;
   output z;
   ADBI21D i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_A22O1_B (a1, a2, b1, b2, c, z);	// z = (a1&a2) | (b1&b2) | c;
   input a1, a2, b1, b2, c;
   output z;
   JDB122A i (.O(z), .A1(a1), .A2(a2), .B1(b1), .B2(b2), .C(c) );
endmodule

module ME_AI22O1_C (a1, a2, b1, b2, c, z);	// z= (a1 & ~a2) | (b1&b2) | c;
   input a1, a2, b1, b2, c;
   output z;
   ADBI122C i (.O(z), .A1(a1), .A2(a2), .B1(b1), .B2(b2), .C(c) );
endmodule

module ME_AI22O1_D (a1, a2, b1, b2, c, z);	// z= (a1 & ~a2) | (b1&b2) | c;
   input a1, a2, b1, b2, c;
   output z;
   ADBI122D i (.O(z), .A1(a1), .A2(a2), .B1(b1), .B2(b2), .C(c) );
endmodule

module ME_AI22O1_C_2 (a1, a2, b1, b2, c, z);
input [1:0] a1, a2, b1, b2, c;
output [1:0] z;

   ADBI122C u0 (.O(z[0]), .A1(a1[0]), .A2(a2[0]), .B1(b1[0]), .B2(b2[0]),
		.C(c[0]) );
   ADBI122C u1 (.O(z[1]), .A1(a1[1]), .A2(a2[1]), .B1(b1[1]), .B2(b2[1]),
		.C(c[1]) );
endmodule

module ME_AI22O1_C_5 (a1, a2, b1, b2, c, z);
input [4:0] a1, a2, b1, b2, c;
output [4:0] z;

   ADBI122C u0 (.O(z[0]), .A1(a1[0]), .A2(a2[0]), .B1(b1[0]), .B2(b2[0]),
		.C(c[0]) );
   ADBI122C u1 (.O(z[1]), .A1(a1[1]), .A2(a2[1]), .B1(b1[1]), .B2(b2[1]),
		.C(c[1]) );
   ADBI122C u2 (.O(z[2]), .A1(a1[2]), .A2(a2[2]), .B1(b1[2]), .B2(b2[2]),
		.C(c[2]) );
   ADBI122C u3 (.O(z[3]), .A1(a1[3]), .A2(a2[3]), .B1(b1[3]), .B2(b2[3]),
		.C(c[3]) );
   ADBI122C u4 (.O(z[4]), .A1(a1[4]), .A2(a2[4]), .B1(b1[4]), .B2(b2[4]),
		.C(c[4]) );
endmodule

module ME_A2O2I (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JD211A u1 (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_A2O2I_B (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JD211A u1 (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_A22OI (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JD22A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_A22OI_B (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JD22A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_O2A2I (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JG112A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_O2A2I_B (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JG112A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_O22AI (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JG22A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_O22AI_B (a, b, c, d, z);
   input a, b, c, d;
   output z;
   JG22A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d) );
endmodule

module ME_A2O1I (a, b, c, z);
   input a, b, c;
   output z;
   JD21A i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_A2O1I_B (a, b, c, z);
   input a, b, c;
   output z;
   JD21A i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_O2A1 (a, b, c, z);
   input a, b, c;
   output z;				// z = (a|b)&c
   JGB12A i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_O2A1_D (a, b, c, z);
   input a, b, c;
   output z;				// z = (a|b)&c
   AGB12D i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_O22A1 (a1, a2, b1, b2, c, z);
   input a1, a2, b1, b2, c;
   output z;				// z = (a1 | a2) & (b1 | b2) & c
   JGB221A i (.O(z), .A1(a1), .A2(a2), .B1(b1), .B2(b2), .C(c) );
endmodule

module ME_O2A1I (a, b, c, z);
   input a, b, c;
   output z;
   JG12A i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_O2A1I_B (a, b, c, z);
   input a, b, c;
   output z;
   JG12A i (.O(z), .A1(a), .A2(b), .B(c) );
endmodule

module ME_A222OI (a, b, c, d, e, f, z);
   input a, b, c, d, e, f;
   output z;
   JD222A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d), .C1(e), .C2(f) );
endmodule

module ME_A222OI_B (a, b, c, d, e, f, z);
   input a, b, c, d, e, f;
   output z;
   JD222A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d), .C1(e), .C2(f) );
endmodule

module ME_O2222AI (a, b, c, d, e, f, g, h, z);
   input a, b, c, d, e, f, g, h;
   output z;
   AG2222A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d), .C1(e), .C2(f),
		.D1(g), .D2(h) );
endmodule

module ME_O2222AI_B (a, b, c, d, e, f, g, h, z);
   input a, b, c, d, e, f, g, h;
   output z;
   AG2222A i (.O(z), .A1(a), .A2(b), .B1(c), .B2(d), .C1(e), .C2(f),
		.D1(g), .D2(h) );
endmodule

module ME_ADD2 (a, b, s, c);
   input a, b;
   output s,c;
   JHAD1A u0 (.CO(c), .S(s), .A(a), .B(b) );
endmodule

module ME_ADD3 (a, b, ci, s, co);
   input a, b, ci ;
   output  s, co ;
   JFAD1A u0 (.CO(co), .S(s), .A(a), .B(b), .CI(ci) );
endmodule

module ME_ADD3_B (a, b, ci, s, co);
   input a, b, ci ;
   output  s, co ;
   JFAD1A u0 (.CO(co), .S(s), .A(a), .B(b), .CI(ci) );
endmodule

// comparators

module ME_COMP3 (a, b, z);
   input [2:0] a, b;
   output z;
   ACOMP3A u0 (.A0(a[0]), .A1(a[1]), .A2(a[2]),
		.B0(b[0]), .B1(b[1]), .B2(b[2]), .O(z) );
endmodule

module ME_COMP4 (a, b, z);
   input [3:0] a, b;
   output z;
   ACOMP4A u0 (.A0(a[0]), .A1(a[1]), .A2(a[2]), .A3(a[3]),
		.B0(b[0]), .B1(b[1]), .B2(b[2]), .B3(b[3]), .O(z) );
endmodule

module ME_COMP5 (a, b, z);
   input [4:0] a, b;
   output z;
   ACOMP5A u0 (.A0(a[0]), .A1(a[1]), .A2(a[2]), .A3(a[3]), .A4(a[4]),
		.B0(b[0]), .B1(b[1]), .B2(b[2]), .B3(b[3]), .B4(b[4]), .O(z) );
endmodule


// multiplexors

// Binary encoded muxes
module ME_MUX2B (s, a, b, z);
   input s, a, b ;
   output z ;

   AMUX2A u0 (.O(z), .A(a), .B(b), .S(s) );
endmodule

module ME_MUX2B_B (s, a, b, z);
   input s, a, b ;
   output z ;

   AMUX2A u0 (.O(z), .A(a), .B(b), .S(s) );
endmodule

module ME_NMUX2B (s, a, b, z);		// inverting mux
   input s, a, b ;
   output z ;

   JMUX2A u0 (.O(z), .A(a), .B(b), .S(s) );
endmodule

module ME_NMUX2B_B (s, a, b, z);	// inverting mux
   input s, a, b ;
   output z ;

   JMUX2A u0 (.O(z), .A(a), .B(b), .S(s) );
endmodule

module ME_NMUX2BA (nota, a, d0, d1, notX);
// A very important special case 
// use with care as A being on at the same time as notA burns power.
// note the order of the inputs which is choosen so that this is compatable
// with an NMUX2  although the behaviour is only the same if both a driven
// from true and inverse of a signal
   input a, nota, d0, d1 ;
   output notX ;
   JD22A i (.O(notX), .A1(nota), .A2(d0), .B1(a), .B2(d1) );
endmodule

module ME_NMUX2BA_B (nota, a, d0, d1, notX);
// A very important special case 
// use with care as A being on at the same time as notA burns power.
// note the order of the inputs which is choosen so that this is compatable
// with an NMUX2  although the behaviour is only the same if both a driven
// from true and inverse of a signal
   input a, nota, d0, d1 ;
   output notX ;
   JD22A i (.O(notX), .A1(nota), .A2(d0), .B1(a), .B2(d1) );
endmodule

module ME_MUX4B (a, b, d0, d1, d2, d3, z);
   input a, b, d0, d1, d2, d3 ;
   output z ;
   // note A is least significant select line.
   //  A B   Selected
   //  00     d0
   //  10     d1
   //  01     d2
   //  11     d3

   AMUX4A m0 (.S0(a), .S1(b), .I1(d0), .I2(d1), .I3(d2), .I4(d3), .O(z) );
endmodule

module ME_MUX4B_B (a, b, d0, d1, d2, d3, z);
   input a, b, d0, d1, d2, d3 ;
   output z ;
   // note A is least significant select line.
   //  A B   Selected
   //  00     d0
   //  10     d1
   //  01     d2
   //  11     d3
   AMUX4A m0 (.S0(a), .S1(b), .I1(d0), .I2(d1), .I3(d2), .I4(d3), .O(z) );
endmodule

module ME_NMUX5B (A, B, C, D0, D1, D2, D3, D4, notXout);
   input A, B, C, D0, D1, D2, D3, D4 ;
   output notXout ;
   // note A is least significant select line.
   //  A B C  Selected
   //  000    d0
   //  100    d1
   //  010    d2
   //  110    d3
   //  ??1    d4

   ME_MUX4B   m2 (A, B, D0, D1, D2, D3, T0);
   ME_NMUX2B  m1 (C, T0, D4, notXout) ;
endmodule

module ME_MUX8B (a, b, c, d0, d1, d2, d3, d4, d5, d6, d7, f);
   input a, b, c, d0, d1, d2, d3, d4, d5, d6, d7 ;
   output f ;
   // note A is least significant select line.

   ME_MUX4B m0 (a, b, d0, d1, d2, d3, z0);
   ME_MUX4B m1 (a, b, d4, d5, d6, d7, z1);
   ME_MUX2B m2 (c, z0, z1, f);
endmodule

module ME_MUX8B_B (a, b, c, d0, d1, d2, d3, d4, d5, d6, d7, f);
   input a, b, c, d0, d1, d2, d3, d4, d5, d6, d7 ;
   output f ;
   // note A is least significant select line.
   ME_MUX4B_B m0 (a, b, d0, d1, d2, d3, z0);
   ME_MUX4B_B m1 (a, b, d4, d5, d6, d7, z1);
   ME_MUX2B_B m2 (c, z0, z1, f);
endmodule


module ME_MUX_2Bbit  ( notA, A, D0, D1, Xout ) ;
   input notA, A;
   input D0, D1;
   output Xout;
   JDB22A g0 ( .A1(notA), .A2(D0), .B1(A), .B2(D1), .O(Xout) );
endmodule


module ME_MUX_2B_Bbit  ( notA, A, D0, D1, Xout ) ;
   input notA, A;
   input D0, D1;
   output Xout;
   JDB22A g0 ( .A1(notA), .A2(D0), .B1(A), .B2(D1), .O(Xout) );
endmodule


module ME_NMUX_2Bbit  ( notA, A, D0, D1, Xout ) ;
   input notA, A;
   input D0, D1;
   output Xout;
   ME_NMUX2BA_B g0 ( .nota(notA), .a(A), .d0(D0), .d1(D1), .notX(Xout) );
endmodule


module ME_MUX_2B_Bbyte ( notA, A, D0, D1, Xout ) ;
   input notA, A;
   input  [7:0] D0, D1;
   output [7:0] Xout;
   ME_MUX_2B_Bbit g10 ( notA, A, D0[0], D1[0], Xout[0] );
   ME_MUX_2B_Bbit g11 ( notA, A, D0[1], D1[1], Xout[1] );
   ME_MUX_2B_Bbit g12 ( notA, A, D0[2], D1[2], Xout[2] );
   ME_MUX_2B_Bbit g13 ( notA, A, D0[3], D1[3], Xout[3] );
   ME_MUX_2B_Bbit g14 ( notA, A, D0[4], D1[4], Xout[4] );
   ME_MUX_2B_Bbit g15 ( notA, A, D0[5], D1[5], Xout[5] );
   ME_MUX_2B_Bbit g16 ( notA, A, D0[6], D1[6], Xout[6] );
   ME_MUX_2B_Bbit g17 ( notA, A, D0[7], D1[7], Xout[7] );
endmodule
 

module ME_MUX_2Bbyte ( notA, A, D0, D1, Xout ) ;
   input notA, A;
   input  [7:0] D0, D1;
   output [7:0] Xout;
   ME_MUX_2Bbit g10 ( notA, A, D0[0], D1[0], Xout[0] );
   ME_MUX_2Bbit g11 ( notA, A, D0[1], D1[1], Xout[1] );
   ME_MUX_2Bbit g12 ( notA, A, D0[2], D1[2], Xout[2] );
   ME_MUX_2Bbit g13 ( notA, A, D0[3], D1[3], Xout[3] );
   ME_MUX_2Bbit g14 ( notA, A, D0[4], D1[4], Xout[4] );
   ME_MUX_2Bbit g15 ( notA, A, D0[5], D1[5], Xout[5] );
   ME_MUX_2Bbit g16 ( notA, A, D0[6], D1[6], Xout[6] );
   ME_MUX_2Bbit g17 ( notA, A, D0[7], D1[7], Xout[7] );
endmodule


module ME_NMUX_2Bbyte ( notA, A, D0, D1, Xout ) ;
   input notA, A;
   input  [7:0] D0, D1;
   output [7:0] Xout;
   ME_NMUX_2Bbit g10 ( notA, A, D0[0], D1[0], Xout[0] );
   ME_NMUX_2Bbit g11 ( notA, A, D0[1], D1[1], Xout[1] );
   ME_NMUX_2Bbit g12 ( notA, A, D0[2], D1[2], Xout[2] );
   ME_NMUX_2Bbit g13 ( notA, A, D0[3], D1[3], Xout[3] );
   ME_NMUX_2Bbit g14 ( notA, A, D0[4], D1[4], Xout[4] );
   ME_NMUX_2Bbit g15 ( notA, A, D0[5], D1[5], Xout[5] );
   ME_NMUX_2Bbit g16 ( notA, A, D0[6], D1[6], Xout[6] );
   ME_NMUX_2Bbit g17 ( notA, A, D0[7], D1[7], Xout[7] );
endmodule


module ME_NMUX_2B_8 (A, D0, D1, Xout);
   input  A ;
   input  [7:0] D0, D1 ;
   output [7:0] Xout ;

   ME_INV_B g10 ( A, notA1 ) ;
   ME_INV_B g11 ( notA1, Abuf ) ;
   ME_INV_B g12 ( A, notAbuf ) ;
   ME_NMUX_2Bbyte m13 ( notAbuf, Abuf, D0[7:0], D1[7:0], Xout[7:0] ) ;
endmodule
 

module ME_MUX_2B_32 ( A, D0, D1, Xout );
   input  A ;
   input  [31:0] D0, D1 ;
   output [31:0] Xout ;

   ME_INV_B g10 ( A, _A ) ;
   ME_INV_C g11 ( _A, buffA ) ;
   ME_INV_C g12 ( A, notA ) ;
   ME_MUX_2Bbyte m10 ( notA, buffA, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbyte m11 ( notA, buffA, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_MUX_2Bbyte m12 ( notA, buffA, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_MUX_2Bbyte m13 ( notA, buffA, D0[31:24], D1[31:24], Xout[31:24] ) ;
endmodule

module ME_MUX_2B_52 ( A, D0, D1, Xout );
   input  A ;
   input  [51:0] D0, D1 ;
   output [51:0] Xout ;
 
   ME_INV_B g10 ( A, _A ) ;
   ME_INV_C g11 ( _A, buffA ) ;
   ME_INV_C g12 ( A, notA ) ;
   ME_MUX_2Bbyte m10 ( notA, buffA, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbyte m11 ( notA, buffA, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_MUX_2Bbyte m12 ( notA, buffA, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_MUX_2Bbyte m13 ( notA, buffA, D0[31:24], D1[31:24], Xout[31:24] ) ;
   ME_MUX_2Bbyte m14 ( notA, buffA, D0[39:32], D1[39:32], Xout[39:32] ) ;
   ME_MUX_2Bbyte m15 ( notA, buffA, D0[47:40], D1[47:40], Xout[47:40] ) ;
   ME_MUX_2Bbit  m16 ( notA, buffA, D0[48], D1[48], Xout[48] ) ;
   ME_MUX_2Bbit  m17 ( notA, buffA, D0[49], D1[49], Xout[49] ) ;
   ME_MUX_2Bbit  m18 ( notA, buffA, D0[50], D1[50], Xout[50] ) ;
   ME_MUX_2Bbit  m19 ( notA, buffA, D0[51], D1[51], Xout[51] ) ;
endmodule
 
module ME_MUX_2B_4 ( A, D0, D1, Xout );
   input  A ;
   input  [3:0] D0, D1 ;
   output [3:0] Xout ;

   ME_BUFF g10 ( A, buffA ) ;
   ME_INV_B g11 ( A, notA ) ;
   ME_MUX_2Bbit  m10 ( notA, buffA, D0[0], D1[0], Xout[0] ) ;
   ME_MUX_2Bbit  m11 ( notA, buffA, D0[1], D1[1], Xout[1] ) ;
   ME_MUX_2Bbit  m12 ( notA, buffA, D0[2], D1[2], Xout[2] ) ;
   ME_MUX_2Bbit  m13 ( notA, buffA, D0[3], D1[3], Xout[3] ) ;
endmodule

module ME_MUX_2B_3 ( A, D0, D1, Xout );
   input  A ;
   input  [2:0] D0, D1 ;
   output [2:0] Xout ;

   ME_BUFF g10 ( A, buffA ) ;
   ME_INV_B g11 ( A, notA ) ;
   ME_MUX_2Bbit  m10 ( notA, buffA, D0[0], D1[0], Xout[0] ) ;
   ME_MUX_2Bbit  m11 ( notA, buffA, D0[1], D1[1], Xout[1] ) ;
   ME_MUX_2Bbit  m12 ( notA, buffA, D0[2], D1[2], Xout[2] ) ;
endmodule

module ME_MUX_2B_2 ( A, D0, D1, Xout );
   input  A ;
   input  [1:0] D0, D1 ;
   output [1:0] Xout ;

   ME_BUFF g10 ( A, buffA ) ;
   ME_INV_B g11 ( A, notA ) ;
   ME_MUX_2Bbit  m10 ( notA, buffA, D0[0], D1[0], Xout[0] ) ;
   ME_MUX_2Bbit  m11 ( notA, buffA, D0[1], D1[1], Xout[1] ) ;
endmodule

module ME_MUX_2B_B_58 ( A, D0, D1, Xout );
   input  A ;
   input  [57:0] D0, D1 ;
   output [57:0] Xout ;
 
   ME_INV_B g10 ( A, _A ) ;
   ME_INV_C g11 ( _A, buffA1 ) ;
   ME_INV_C g12 ( _A, buffA2 ) ;
   ME_INV_C g13 ( A, notA ) ;
    
   ME_MUX_2B_Bbyte m10 ( notA, buffA1, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2B_Bbyte m11 ( notA, buffA1, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_MUX_2B_Bbyte m12 ( notA, buffA1, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_MUX_2B_Bbyte m13 ( notA, buffA1, D0[31:24], D1[31:24], Xout[31:24] ) ;
   ME_MUX_2B_Bbyte m14 ( notA, buffA2, D0[39:32], D1[39:32], Xout[39:32] ) ;
   ME_MUX_2B_Bbyte m15 ( notA, buffA2, D0[47:40], D1[47:40], Xout[47:40] ) ;
   ME_MUX_2B_Bbyte m16 ( notA, buffA2, D0[55:48], D1[55:48], Xout[55:48] ) ;
   ME_MUX_2B_Bbit  m17 ( notA, buffA2, D0[56], D1[56], Xout[56] ) ;
   ME_MUX_2B_Bbit  m18 ( notA, buffA2, D0[57], D1[57], Xout[57] ) ;
endmodule
 
module ME_MUX_2B_58 ( A, D0, D1, Xout );
   input  A ;
   input  [57:0] D0, D1 ;
   output [57:0] Xout ;
 
   ME_INV_B g10 ( A, _A ) ;
   ME_INV_C g11 ( _A, buffA1 ) ;
   ME_INV_C g12 ( _A, buffA2 ) ;
   ME_INV_C g13 ( A, notA ) ;
    
   ME_MUX_2Bbyte m10 ( notA, buffA1, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbyte m11 ( notA, buffA1, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_MUX_2Bbyte m12 ( notA, buffA1, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_MUX_2Bbyte m13 ( notA, buffA1, D0[31:24], D1[31:24], Xout[31:24] ) ;
   ME_MUX_2Bbyte m14 ( notA, buffA2, D0[39:32], D1[39:32], Xout[39:32] ) ;
   ME_MUX_2Bbyte m15 ( notA, buffA2, D0[47:40], D1[47:40], Xout[47:40] ) ;
   ME_MUX_2Bbyte m16 ( notA, buffA2, D0[55:48], D1[55:48], Xout[55:48] ) ;
   ME_MUX_2Bbit  m17 ( notA, buffA2, D0[56], D1[56], Xout[56] ) ;
   ME_MUX_2Bbit  m18 ( notA, buffA2, D0[57], D1[57], Xout[57] ) ;
endmodule

module ME_NMUX_2B_57 ( A, D0, D1, Xout );
   input  A ;
   input  [56:0] D0, D1 ;
   output [56:0] Xout ;
 
   ME_INV_B g10 ( A, _A ) ;
   ME_INV_C g11 ( _A, buffA1 ) ;
   ME_INV_C g12 ( _A, buffA2 ) ;
   ME_INV_C g13 ( A, notA ) ;
   ME_INV_C g14 ( A, notA2 ) ;
   ME_NMUX_2Bbyte m10 ( notA, buffA1, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_NMUX_2Bbyte m11 ( notA, buffA1, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_NMUX_2Bbyte m12 ( notA, buffA1, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_NMUX_2Bbyte m13 ( notA, buffA1, D0[31:24], D1[31:24], Xout[31:24] ) ;
   ME_NMUX_2Bbyte m14 ( notA2, buffA2, D0[39:32], D1[39:32], Xout[39:32] ) ;
   ME_NMUX_2Bbyte m15 ( notA2, buffA2, D0[47:40], D1[47:40], Xout[47:40] ) ;
   ME_NMUX_2Bbyte m16 ( notA2, buffA2, D0[55:48], D1[55:48], Xout[55:48] ) ;
   ME_NMUX_2Bbit  m17 ( notA2, buffA2, D0[56], D1[56], Xout[56] ) ;
endmodule
 
module ME_NMUX_2B_58 ( A, D0, D1, Xout );
   input  A ;
   input  [57:0] D0, D1 ;
   output [57:0] Xout ;

   ME_INV_B g10 ( A, _A ) ;
   ME_INV_C g11 ( _A, buffA1 ) ;
   ME_INV_C g12 ( _A, buffA2 ) ;
   ME_INV_C g13 ( A, notA ) ;
   ME_INV_C g14 ( A, notA2 ) ;
   ME_NMUX_2Bbyte m10 ( notA, buffA1, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_NMUX_2Bbyte m11 ( notA, buffA1, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_NMUX_2Bbyte m12 ( notA, buffA1, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_NMUX_2Bbyte m13 ( notA, buffA1, D0[31:24], D1[31:24], Xout[31:24] ) ;
   ME_NMUX_2Bbyte m14 ( notA2, buffA2, D0[39:32], D1[39:32], Xout[39:32] ) ;
   ME_NMUX_2Bbyte m15 ( notA2, buffA2, D0[47:40], D1[47:40], Xout[47:40] ) ;
   ME_NMUX_2Bbyte m16 ( notA2, buffA2, D0[55:48], D1[55:48], Xout[55:48] ) ;
   ME_NMUX_2Bbit  m17 ( notA2, buffA2, D0[56], D1[56], Xout[56] ) ;
   ME_NMUX_2Bbit  m18 ( notA2, buffA2, D0[57], D1[57], Xout[57] ) ;
endmodule
 
module ME_MUX_2B_64 ( A, D0, D1, Xout );
   input  A ;
   input  [63:0] D0, D1 ;
   output [63:0] Xout ;
 
   ME_BUF_B g10 ( A, _A ) ;
   ME_BUF_C g11 ( _A, buffA1 ) ;
   ME_BUF_C g12 ( _A, buffA2 ) ;
   ME_INV_C g13 ( A, notA ) ;

   ME_MUX_2Bbyte m10 ( notA, buffA1, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbyte m11 ( notA, buffA1, D0[15:8], D1[15:8], Xout[15:8] ) ;
   ME_MUX_2Bbyte m12 ( notA, buffA1, D0[23:16], D1[23:16], Xout[23:16] ) ;
   ME_MUX_2Bbyte m13 ( notA, buffA1, D0[31:24], D1[31:24], Xout[31:24] ) ;
   ME_MUX_2Bbyte m14 ( notA, buffA2, D0[39:32], D1[39:32], Xout[39:32] ) ;
   ME_MUX_2Bbyte m15 ( notA, buffA2, D0[47:40], D1[47:40], Xout[47:40] ) ;
   ME_MUX_2Bbyte m16 ( notA, buffA2, D0[55:48], D1[55:48], Xout[55:48] ) ;
   ME_MUX_2Bbyte m17 ( notA, buffA2, D0[63:56], D1[63:56], Xout[63:56] ) ;
endmodule
 

module ME_MUX_2B_B_13 ( A, D0, D1, Xout );
   input  A ;
   input  [12:0] D0, D1 ;
   output [12:0] Xout ;
 
   ME_BUFF  g10 ( A, buffA ) ;
   ME_INV_B g12 ( A, notA ) ;
   ME_MUX_2B_Bbyte m10 ( notA, buffA, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2B_Bbit  m11 ( notA, buffA, D0[8], D1[8], Xout[8] ) ;
   ME_MUX_2B_Bbit  m12 ( notA, buffA, D0[9], D1[9], Xout[9] ) ;
   ME_MUX_2B_Bbit  m13 ( notA, buffA, D0[10], D1[10], Xout[10] ) ;
   ME_MUX_2B_Bbit  m14 ( notA, buffA, D0[11], D1[11], Xout[11] ) ;
   ME_MUX_2B_Bbit  m15 ( notA, buffA, D0[12], D1[12], Xout[12] ) ;
endmodule

module ME_MUX_2B_13 ( A, D0, D1, Xout );
   input  A ;
   input  [12:0] D0, D1 ;
   output [12:0] Xout ;
 
   ME_BUFF  g10 ( A, buffA ) ;
   ME_INV_B g12 ( A, notA ) ;
   ME_MUX_2Bbyte m10 ( notA, buffA, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbit  m11 ( notA, buffA, D0[8], D1[8], Xout[8] ) ;
   ME_MUX_2Bbit  m12 ( notA, buffA, D0[9], D1[9], Xout[9] ) ;
   ME_MUX_2Bbit  m13 ( notA, buffA, D0[10], D1[10], Xout[10] ) ;
   ME_MUX_2Bbit  m14 ( notA, buffA, D0[11], D1[11], Xout[11] ) ;
   ME_MUX_2Bbit  m15 ( notA, buffA, D0[12], D1[12], Xout[12] ) ;

endmodule

module ME_MUX_2B_11 ( A, D0, D1, Xout );
   input  A ;
   input  [10:0] D0, D1 ;
   output [10:0] Xout ;
 
   ME_INVA i0 ( A, notA ) ;
   ME_BUFF b1 ( A, buffA ) ;
   ME_BUFF b2 ( notA, buffnotA ) ;
   ME_MUX_2Bbyte m10 ( buffnotA, buffA, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbit  m11 ( buffnotA, buffA, D0[8], D1[8], Xout[8] ) ;
   ME_MUX_2Bbit  m12 ( buffnotA, buffA, D0[9], D1[9], Xout[9] ) ;
   ME_MUX_2Bbit  m13 ( buffnotA, buffA, D0[10], D1[10], Xout[10] ) ;
endmodule
 
module ME_MUX_2B_8 ( A, D0, D1, Xout );
   input  A ;
   input  [7:0] D0, D1 ;
   output [7:0] Xout ;
 
   ME_INV_B g11 ( A, notA ) ;
    
   ME_MUX_2Bbyte m10 ( notA, A, D0[7:0], D1[7:0], Xout[7:0] ) ;
 
endmodule

module ME_MUX_2B_9 ( A, D0, D1, Xout );
   input  A ;
   input  [8:0] D0, D1 ;
   output [8:0] Xout ;
 
   ME_BUFF g10 ( A, buffA ) ;
   ME_INV_B g11 ( A, notA ) ;
   ME_MUX_2Bbyte m10 ( notA, buffA, D0[7:0], D1[7:0], Xout[7:0] ) ;
   ME_MUX_2Bbit  m11 ( notA, buffA, D0[8], D1[8], Xout[8] ) ;
endmodule
 
module ME_MUX_2B_5 ( A, D0, D1, Xout );
   input  A ;
   input  [4:0] D0, D1 ;
   output [4:0] Xout ;
 
   ME_BUFF g10 ( A, buffA ) ;
   ME_INV_B g11 ( A, notA ) ;
   ME_MUX_2Bbit  m10 ( notA, buffA, D0[0], D1[0], Xout[0] ) ;
   ME_MUX_2Bbit  m11 ( notA, buffA, D0[1], D1[1], Xout[1] ) ;
   ME_MUX_2Bbit  m12 ( notA, buffA, D0[2], D1[2], Xout[2] ) ;
   ME_MUX_2Bbit  m13 ( notA, buffA, D0[3], D1[3], Xout[3] ) ;
   ME_MUX_2Bbit  m14 ( notA, buffA, D0[4], D1[4], Xout[4] ) ;
endmodule

module ME_MUX_4Bbyte ( A, B, D0, D1, D2, D3, Xout ) ;
   input A, B;
   input  [7:0] D0, D1, D2, D3;
   output [7:0] Xout;
 
   ME_MUX4B m0 (.a(A), .b(B), .d0(D0[0]), .d1(D1[0]), .d2(D2[0]), .d3(D3[0]), .z(Xout[0]));
   ME_MUX4B m1 (.a(A), .b(B), .d0(D0[1]), .d1(D1[1]), .d2(D2[1]), .d3(D3[1]), .z(Xout[1]));
   ME_MUX4B m2 (.a(A), .b(B), .d0(D0[2]), .d1(D1[2]), .d2(D2[2]), .d3(D3[2]), .z(Xout[2]));
   ME_MUX4B m3 (.a(A), .b(B), .d0(D0[3]), .d1(D1[3]), .d2(D2[3]), .d3(D3[3]), .z(Xout[3]));
   ME_MUX4B m4 (.a(A), .b(B), .d0(D0[4]), .d1(D1[4]), .d2(D2[4]), .d3(D3[4]), .z(Xout[4]));
   ME_MUX4B m5 (.a(A), .b(B), .d0(D0[5]), .d1(D1[5]), .d2(D2[5]), .d3(D3[5]), .z(Xout[5]));
   ME_MUX4B m6 (.a(A), .b(B), .d0(D0[6]), .d1(D1[6]), .d2(D2[6]), .d3(D3[6]), .z(Xout[6]));
   ME_MUX4B m7 (.a(A), .b(B), .d0(D0[7]), .d1(D1[7]), .d2(D2[7]), .d3(D3[7]), .z(Xout[7]));
endmodule
 
module ME_MUX_4B_4 ( A, B, D0, D1, D2, D3, X );
   input  A, B ;
   input  [3:0] D0, D1, D2, D3 ;
   output [3:0] X ;
 
   ME_MUX4B  m0 ( A, B, D0[0],  D1[0],  D2[0],  D3[0],  X[0] ) ;
   ME_MUX4B  m1 ( A, B, D0[1],  D1[1],  D2[1],  D3[1],  X[1] ) ;
   ME_MUX4B  m2 ( A, B, D0[2],  D1[2],  D2[2],  D3[2],  X[2] ) ;
   ME_MUX4B  m3 ( A, B, D0[3],  D1[3],  D2[3],  D3[3],  X[3] ) ;
endmodule

module ME_MUX_4B_10 ( A, B, D0, D1, D2, D3, X );
   input  A, B ;
   input  [9:0] D0, D1, D2, D3 ;
   output [9:0] X ;
 
   ME_BUF_C g10 ( A, buffA ) ;
   ME_BUF_B g11 ( B, buffB ) ;
 
   ME_MUX_4Bbyte m10 ( buffA, buffB, D0[7:0], D1[7:0], D2[7:0], D3[7:0], X[7:0] ) ;
   ME_MUX4B  m16 ( buffA, buffB, D0[8],   D1[8],   D2[8],   D3[8],   X[8]  ) ;
   ME_MUX4B  m15 ( buffA, buffB, D0[9],   D1[9],   D2[9],   D3[9],   X[9]  ) ;
endmodule

module ME_MUX_4B_13 ( A, B, D0, D1, D2, D3, X );
   input  A, B ;
   input  [12:0] D0, D1, D2, D3 ;
   output [12:0] X ;
 
   ME_BUF_C g10 ( A, buffA ) ;
   ME_BUF_B g11 ( B, buffB ) ;
 
   ME_MUX_4Bbyte m10 ( buffA, buffB, D0[7:0], D1[7:0], D2[7:0], D3[7:0], X[7:0] ) ;
   ME_MUX4B  m16 ( buffA, buffB, D0[8],   D1[8],   D2[8],   D3[8],   X[8]  ) ;
   ME_MUX4B  m15 ( buffA, buffB, D0[9],   D1[9],   D2[9],   D3[9],   X[9]  ) ;
   ME_MUX4B  m17 ( buffA, buffB, D0[10],  D1[10],  D2[10],  D3[10],  X[10] ) ;
   ME_MUX4B  m18 ( buffA, buffB, D0[11],  D1[11],  D2[11],  D3[11],  X[11] ) ;
   ME_MUX4B  m19 ( buffA, buffB, D0[12],  D1[12],  D2[12],  D3[12],  X[12] ) ;
endmodule
 

module ME_TIEOFF (VDD, GND);
   output VDD, GND;

   N1Z001 vdd(VDD);
   N1Z000 gnd(GND);
endmodule

module cn1 (out, in1);
input in1 ;
output out ;
   assign out = in1;
	//NULL_WIRE u1 (in1, out);
endmodule

module con1 (con_in, con_out);
input con_in;
output con_out;
//	buf z0 (con_out, con_in);
	cn1 z0 (con_out, con_in);
endmodule

//   Meiko macros
//
module ME_FD1P2 ( Q, QN, CP, D );
   input [1:0] D;
   input CP;
   output [1:0] Q, QN ;

   ME_FD1P f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .d(D[0]));
   ME_FD1P f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .d(D[1]));
endmodule

module ME_FD1P_6 ( Q, QN, CP, D );
   input CP;
   input [5:0] D;
   output [5:0] Q, QN ;

   ME_FD1P f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .d(D[0]) );
   ME_FD1P f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .d(D[1]) );
   ME_FD1P f2(.q(Q[2]), .qn(QN[2]), .cp(CP), .d(D[2]) );
   ME_FD1P f3(.q(Q[3]), .qn(QN[3]), .cp(CP), .d(D[3]) );
   ME_FD1P f4(.q(Q[4]), .qn(QN[4]), .cp(CP), .d(D[4]) );
   ME_FD1P f5(.q(Q[5]), .qn(QN[5]), .cp(CP), .d(D[5]) );
endmodule

module ME_FDS2LP2 ( Q, QN, CP, CR, D, LD );
   input [1:0] D; 
   input CP, LD, CR;
   output [1:0] Q, QN ;

   ME_FDS2LP f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .cr(CR), .d(D[0]), .ld(LD));
   ME_FDS2LP f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .cr(CR), .d(D[1]), .ld(LD));
endmodule

module ME_FDS2LP3 ( Q, QN, CP, CR, D, LD );
   input [2:0] D; 
   input CP, LD, CR;
   output [2:0] Q, QN;

   ME_FDS2LP f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .cr(CR), .d(D[0]), .ld(LD));
   ME_FDS2LP f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .cr(CR), .d(D[1]), .ld(LD));
   ME_FDS2LP f2(.q(Q[2]), .qn(QN[2]), .cp(CP), .cr(CR), .d(D[2]), .ld(LD));
endmodule

module ME_FDS2LP4 ( Q, QN, CP, CR, D, LD );
   input [3:0] D; 
   input CP, LD, CR;
   output [3:0] Q, QN;

   ME_FDS2LP f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .cr(CR), .d(D[0]), .ld(LD));
   ME_FDS2LP f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .cr(CR), .d(D[1]), .ld(LD));
   ME_FDS2LP f2(.q(Q[2]), .qn(QN[2]), .cp(CP), .cr(CR), .d(D[2]), .ld(LD));
   ME_FDS2LP f3(.q(Q[3]), .qn(QN[3]), .cp(CP), .cr(CR), .d(D[3]), .ld(LD));
endmodule

module ME_FDS2LP5 ( Q, QN, CP, CR, D, LD );
   input [4:0] D; 
   input CP, LD, CR;
   output [4:0] Q, QN;

   ME_FDS2LP f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .cr(CR), .d(D[0]), .ld(LD));
   ME_FDS2LP f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .cr(CR), .d(D[1]), .ld(LD));
   ME_FDS2LP f2(.q(Q[2]), .qn(QN[2]), .cp(CP), .cr(CR), .d(D[2]), .ld(LD));
   ME_FDS2LP f3(.q(Q[3]), .qn(QN[3]), .cp(CP), .cr(CR), .d(D[3]), .ld(LD));
   ME_FDS2LP f4(.q(Q[4]), .qn(QN[4]), .cp(CP), .cr(CR), .d(D[4]), .ld(LD));
endmodule

module ME_FDS2LP8 ( Q, QN, CP, CR, D, LD );
   input [7:0] D; 
   input CP, LD, CR;
   output [7:0] Q, QN;

   ME_FDS2LP f0(.q(Q[0]), .qn(QN[0]), .cp(CP), .cr(CR), .d(D[0]), .ld(LD));
   ME_FDS2LP f1(.q(Q[1]), .qn(QN[1]), .cp(CP), .cr(CR), .d(D[1]), .ld(LD));
   ME_FDS2LP f2(.q(Q[2]), .qn(QN[2]), .cp(CP), .cr(CR), .d(D[2]), .ld(LD));
   ME_FDS2LP f3(.q(Q[3]), .qn(QN[3]), .cp(CP), .cr(CR), .d(D[3]), .ld(LD));
   ME_FDS2LP f4(.q(Q[4]), .qn(QN[4]), .cp(CP), .cr(CR), .d(D[4]), .ld(LD));
   ME_FDS2LP f5(.q(Q[5]), .qn(QN[5]), .cp(CP), .cr(CR), .d(D[5]), .ld(LD));
   ME_FDS2LP f6(.q(Q[6]), .qn(QN[6]), .cp(CP), .cr(CR), .d(D[6]), .ld(LD));
   ME_FDS2LP f7(.q(Q[7]), .qn(QN[7]), .cp(CP), .cr(CR), .d(D[7]), .ld(LD));
endmodule


module ME_MUX2_2 (Z, A, B, S);
input [1:0] A, B;
input S;
output [1:0] Z;

   AMUX2A u0 (.O(Z[0]), .A(A[0]), .B(B[0]), .S(S) );
   AMUX2A u1 (.O(Z[1]), .A(A[1]), .B(B[1]), .S(S) );
endmodule


module ME_MUX2_5 (Z, A, B, S);
input [4:0] A, B;
input S;
output [4:0] Z;

   AMUX2A u0 (.O(Z[0]), .A(A[0]), .B(B[0]), .S(S) );
   AMUX2A u1 (.O(Z[1]), .A(A[1]), .B(B[1]), .S(S) );
   AMUX2A u2 (.O(Z[2]), .A(A[2]), .B(B[2]), .S(S) );
   AMUX2A u3 (.O(Z[3]), .A(A[3]), .B(B[3]), .S(S) );
   AMUX2A u4 (.O(Z[4]), .A(A[4]), .B(B[4]), .S(S) );
endmodule


module ME_MUX21H23 (Z, A, B, S);
input [22:0] A, B;
input S;
output [22:0] Z;

   ME_BUF_D b10 ( S, buffS ) ;
   ME_INV_C b11 ( S, notS ) ;
   ME_MUX_2Bbyte m10 ( notS, buffS, A[ 7: 0], B[ 7: 0], Z[ 7: 0] ) ;
   ME_MUX_2Bbyte m11 ( notS, buffS, A[15: 8], B[15: 8], Z[15: 8] ) ;
   ME_MUX_2Bbit m0 ( notS, buffS, A[16], B[16], Z[16] );
   ME_MUX_2Bbit m1 ( notS, buffS, A[17], B[17], Z[17] );
   ME_MUX_2Bbit m2 ( notS, buffS, A[18], B[18], Z[18] );
   ME_MUX_2Bbit m3 ( notS, buffS, A[19], B[19], Z[19] );
   ME_MUX_2Bbit m4 ( notS, buffS, A[20], B[20], Z[20] );
   ME_MUX_2Bbit m5 ( notS, buffS, A[21], B[21], Z[21] );
   ME_MUX_2Bbit m6 ( notS, buffS, A[22], B[22], Z[22] );
endmodule

module ME_MUX21H25 (Z, A, B, S);
input [24:0] A, B;
input S;
output [24:0] Z;

   ME_BUF_D b10 ( S, buffS ) ;
   ME_INV_C b11 ( S, notS ) ;
   ME_MUX_2Bbyte m10 ( notS, buffS, A[ 7: 0], B[ 7: 0], Z[ 7: 0] ) ;
   ME_MUX_2Bbyte m11 ( notS, buffS, A[15: 8], B[15: 8], Z[15: 8] ) ;
   ME_MUX_2Bbyte m12 ( notS, buffS, A[23:16], B[23:16], Z[23:16] ) ;
   ME_MUX_2Bbit m0 ( notS, buffS, A[24], B[24], Z[24] );
endmodule

module ME_MUX21H28 (Z, A, B, S, notS);
input [27:0] A, B;
input S, notS;
output [27:0] Z;

   ME_INV_C b10 ( S, buffnotS_1 ) ;
   ME_INV_C b11 ( notS, buffS_1 ) ;
   ME_INV_C b12 ( S, buffnotS_2 ) ;
   ME_INV_C b13 ( notS, buffS_2 ) ;
   ME_MUX_2Bbyte m10 ( buffnotS_1, buffS_1, A[ 7: 0], B[ 7: 0], Z[ 7: 0] ) ;
   ME_MUX_2Bbyte m11 ( buffnotS_1, buffS_1, A[15: 8], B[15: 8], Z[15: 8] ) ;
   ME_MUX_2Bbyte m12 ( buffnotS_2, buffS_2, A[23:16], B[23:16], Z[23:16] ) ;
   ME_MUX_2Bbit m0 ( buffnotS_2, buffS_2, A[24], B[24], Z[24] );
   ME_MUX_2Bbit m1 ( buffnotS_2, buffS_2, A[25], B[25], Z[25] );
   ME_MUX_2Bbit m2 ( buffnotS_2, buffS_2, A[26], B[26], Z[26] );
   ME_MUX_2Bbit m3 ( buffnotS_2, buffS_2, A[27], B[27], Z[27] );
endmodule

module ME_MUX21H30 (Z, A, B, S);
input [29:0] A, B;
input S;
output [29:0] Z;

   ME_BUF_D b10 ( S, buffS ) ;
   ME_INV_C b11 ( S, notS ) ;
   ME_MUX_2Bbyte m10 ( notS, buffS, A[ 7: 0], B[ 7: 0], Z[ 7: 0] ) ;
   ME_MUX_2Bbyte m11 ( notS, buffS, A[15: 8], B[15: 8], Z[15: 8] ) ;
   ME_MUX_2Bbyte m12 ( notS, buffS, A[23:16], B[23:16], Z[23:16] ) ;
   ME_MUX_2Bbit m0 ( notS, buffS, A[24], B[24], Z[24] );
   ME_MUX_2Bbit m1 ( notS, buffS, A[25], B[25], Z[25] );
   ME_MUX_2Bbit m2 ( notS, buffS, A[26], B[26], Z[26] );
   ME_MUX_2Bbit m3 ( notS, buffS, A[27], B[27], Z[27] );
   ME_MUX_2Bbit m4 ( notS, buffS, A[28], B[28], Z[28] );
   ME_MUX_2Bbit m5 ( notS, buffS, A[29], B[29], Z[29] );
endmodule

module ME_MUX21H32 (Z, A, B, S);
input [31:0] A, B;
input S;
output [31:0] Z;

   ME_BUF_D b10 ( S, buffS ) ;
   ME_INV_C b11 ( S, notS ) ;
   ME_MUX_2Bbyte m10 ( notS, buffS, A[ 7: 0], B[ 7: 0], Z[ 7: 0] ) ;
   ME_MUX_2Bbyte m11 ( notS, buffS, A[15: 8], B[15: 8], Z[15: 8] ) ;
   ME_MUX_2Bbyte m12 ( notS, buffS, A[23:16], B[23:16], Z[23:16] ) ;
   ME_MUX_2Bbyte m13 ( notS, buffS, A[31:24], B[31:24], Z[31:24] ) ;
endmodule

module ME_MUX21H53 (Z, A, B, S);
input [52:0] A, B;
input S;
output [52:0] Z;

   ME_BUF_D b10 ( S, buffS ) ;
   ME_INV_C b11 ( S, notS ) ;
   ME_MUX_2Bbyte m10 ( notS, buffS, A[ 7: 0], B[ 7: 0], Z[ 7: 0] ) ;
   ME_MUX_2Bbyte m11 ( notS, buffS, A[15: 8], B[15: 8], Z[15: 8] ) ;
   ME_MUX_2Bbyte m12 ( notS, buffS, A[23:16], B[23:16], Z[23:16] ) ;
   ME_MUX_2Bbyte m13 ( notS, buffS, A[31:24], B[31:24], Z[31:24] ) ;
   ME_MUX_2Bbyte m14 ( notS, buffS, A[39:32], B[39:32], Z[39:32] ) ;
   ME_MUX_2Bbyte m15 ( notS, buffS, A[47:40], B[47:40], Z[47:40] ) ;
   ME_MUX_2Bbit m0 ( notS, buffS, A[48], B[48], Z[48] );
   ME_MUX_2Bbit m1 ( notS, buffS, A[49], B[49], Z[49] );
   ME_MUX_2Bbit m2 ( notS, buffS, A[50], B[50], Z[50] );
   ME_MUX_2Bbit m3 ( notS, buffS, A[51], B[51], Z[51] );
   ME_MUX_2Bbit m4 ( notS, buffS, A[52], B[52], Z[52] );
endmodule

module ME_MUX_3bit ( s0, s1, d0, d1, d2, Q ) ;
   input s0, s1, d0, d1, d2;
   output Q ;
	// s1 s0 :  Q
	//  0  0 : d0
	//  0  1 : d1
	//  1  0 : d2
	//  1  1 : d2
   AMUX3A g0 (d0, d1, d2, s0, s1, Q);
endmodule

module ME_MUX_3byte ( s0, s1, d0, d1, d2, Q ) ;
   input s0, s1;
   input [7:0] d0, d1, d2;
   output [7:0] Q ;
   ME_MUX_3bit f0 ( s0, s1, d0[0], d1[0], d2[0], Q [0]) ;
   ME_MUX_3bit f1 ( s0, s1, d0[1], d1[1], d2[1], Q [1]) ;
   ME_MUX_3bit f2 ( s0, s1, d0[2], d1[2], d2[2], Q [2]) ;
   ME_MUX_3bit f3 ( s0, s1, d0[3], d1[3], d2[3], Q [3]) ;
   ME_MUX_3bit f4 ( s0, s1, d0[4], d1[4], d2[4], Q [4]) ;
   ME_MUX_3bit f5 ( s0, s1, d0[5], d1[5], d2[5], Q [5]) ;
   ME_MUX_3bit f6 ( s0, s1, d0[6], d1[6], d2[6], Q [6]) ;
   ME_MUX_3bit f7 ( s0, s1, d0[7], d1[7], d2[7], Q [7]) ;
endmodule

 
/* real instances start here */

module ME_MUX3_25 ( Q, s0, s1, d0, d1, d2 ) ;
input s0, s1;
input  [24:0] d0, d1, d2;
output [24:0] Q;

   ME_BUF_C b0 (s0, buff1_s0);
   ME_BUF_C b1 (s0, buff2_s0);
   ME_BUF_C b2 (s1, buff1_s1);
   ME_BUF_C b3 (s1, buff2_s1);
   ME_MUX_3byte m0
	(buff1_s0, buff1_s1, d0[ 7: 0], d1[ 7: 0], d2[ 7: 0], Q[ 7: 0] );
   ME_MUX_3byte m1
	(buff1_s0, buff1_s1, d0[15: 8], d1[15: 8], d2[15: 8], Q[15: 8] );
   ME_MUX_3byte m2
	(buff2_s0, buff2_s1, d0[23:16], d1[23:16], d2[23:16], Q[23:16] );
   ME_MUX_3bit  m3_0 (buff2_s0, buff2_s1, d0[24], d1[24], d2[24], Q[24] );
endmodule


module ME_MUX3_53 ( Q, s0, s1, d0, d1, d2 ) ;
input s0, s1;
input  [52:0] d0, d1, d2;
output [52:0] Q;

   ME_BUF_C b0 (s0, buff1_s0);
   ME_BUF_C b1 (s0, buff2_s0);
   ME_BUF_C b2 (s0, buff3_s0);
   ME_BUF_C b3 (s0, buff4_s0);
   ME_BUF_C b4 (s1, buff1_s1);
   ME_BUF_C b5 (s1, buff2_s1);
   ME_BUF_C b6 (s1, buff3_s1);
   ME_BUF_C b7 (s1, buff4_s1);
   ME_MUX_3byte m0
	(buff1_s0, buff1_s1, d0[ 7: 0], d1[ 7: 0], d2[ 7: 0], Q[ 7: 0] );
   ME_MUX_3byte m1
	(buff1_s0, buff1_s1, d0[15: 8], d1[15: 8], d2[15: 8], Q[15: 8] );
   ME_MUX_3byte m2
	(buff2_s0, buff2_s1, d0[23:16], d1[23:16], d2[23:16], Q[23:16] );
   ME_MUX_3byte m3
	(buff2_s0, buff2_s1, d0[31:24], d1[31:24], d2[31:24], Q[31:24] );
   ME_MUX_3byte m4
	(buff3_s0, buff3_s1, d0[39:32], d1[39:32], d2[39:32], Q[39:32] );
   ME_MUX_3byte m5
	(buff3_s0, buff3_s1, d0[47:40], d1[47:40], d2[47:40], Q[47:40] );
   ME_MUX_3bit  m6_0 (buff4_s0, buff4_s1, d0[48], d1[48], d2[48], Q[48] );
   ME_MUX_3bit  m6_1 (buff4_s0, buff4_s1, d0[49], d1[49], d2[49], Q[49] );
   ME_MUX_3bit  m6_2 (buff4_s0, buff4_s1, d0[50], d1[50], d2[50], Q[50] );
   ME_MUX_3bit  m6_3 (buff4_s0, buff4_s1, d0[51], d1[51], d2[51], Q[51] );
   ME_MUX_3bit  m6_4 (buff4_s0, buff4_s1, d0[52], d1[52], d2[52], Q[52] );
endmodule


module ME_MUX41H28 ( Q, d0, d1, d2, d3, A, B ) ;
   input A, B;
   input  [27:0] d0, d1, d2, d3;
   output [27:0] Q ;
 
   ME_BUF_C b0 ( A, buffA1 ) ;
   ME_BUF_C b1 ( A, buffA2 ) ;
   ME_BUF_C b2 ( B, buffB1 ) ;
   ME_BUF_C b3 ( B, buffB2 ) ;
 
   ME_MUX_4Bbyte m10 ( buffA1, buffB1,
                   d0[ 7: 0], d1[ 7: 0], d2[ 7: 0], d3[ 7: 0], Q[ 7: 0] ) ;
   ME_MUX_4Bbyte m11 ( buffA1, buffB1,
                   d0[15: 8], d1[15: 8], d2[15: 8], d3[15: 8], Q[15: 8] );
   ME_MUX_4Bbyte m12 ( buffA2, buffB2,
                   d0[23:16], d1[23:16], d2[23:16], d3[23:16], Q[23:16] ) ;
   ME_MUX4B m13_0 ( buffA2, buffB2, d0[24], d1[24], d2[24], d3[24], Q[24] );
   ME_MUX4B m13_1 ( buffA2, buffB2, d0[25], d1[25], d2[25], d3[25], Q[25] );
   ME_MUX4B m13_2 ( buffA2, buffB2, d0[26], d1[26], d2[26], d3[26], Q[26] );
   ME_MUX4B m13_3 ( buffA2, buffB2, d0[27], d1[27], d2[27], d3[27], Q[27] );
endmodule


module ME_MUX41H32 ( Q, d0, d1, d2, d3, A, B ) ;
   input A, B;
   input  [31:0] d0, d1, d2, d3;
   output [31:0] Q ;
 
   ME_BUF_C b0 ( A, buffA1 ) ;
   ME_BUF_C b1 ( A, buffA2 ) ;
   ME_BUF_C b2 ( B, buffB1 ) ;
   ME_BUF_C b3 ( B, buffB2 ) ;
 
   ME_MUX_4Bbyte m10 ( buffA1, buffB1,
                   d0[ 7: 0], d1[ 7: 0], d2[ 7: 0], d3[ 7: 0], Q[ 7: 0] ) ;
   ME_MUX_4Bbyte m11 ( buffA1, buffB1,
                   d0[15: 8], d1[15: 8], d2[15: 8], d3[15: 8], Q[15: 8] );
   ME_MUX_4Bbyte m12 ( buffA2, buffB2,
                   d0[23:16], d1[23:16], d2[23:16], d3[23:16], Q[23:16] ) ;
   ME_MUX_4Bbyte m13 ( buffA2, buffB2,
                   d0[31:24], d1[31:24], d2[31:24], d3[31:24], Q[31:24] ) ;
endmodule


module ME_MUX41H53 ( Q, d0, d1, d2, d3, sel ) ;
   input  [1:0] sel ;
   input  [52:0] d0, d1, d2, d3;
   output [52:0] Q ;
 
   ME_BUF_C b0 ( sel[0], buffA1 ) ;
   ME_BUF_C b1 ( sel[0], buffA2 ) ;
   ME_BUF_C b2 ( sel[0], buffA3 ) ;
   ME_BUF_C b3 ( sel[0], buffA4 ) ;
   ME_BUF_C b4 ( sel[1], buffB1 ) ;
   ME_BUF_C b5 ( sel[1], buffB2 ) ;
   ME_BUF_C b6 ( sel[1], buffB3 ) ;
   ME_BUF_C b7 ( sel[1], buffB4 ) ;

   ME_MUX_4Bbyte m10 ( buffA1, buffB1,
                   d0[7:0], d1[7:0], d2[7:0], d3[7:0], Q[7:0] ) ;
   ME_MUX_4Bbyte m11 ( buffA1, buffB1,
                   d0[15:8], d1[15:8], d2[15:8], d3[15:8], Q[15:8] );
   ME_MUX_4Bbyte m12 ( buffA2, buffB2,
                   d0[23:16], d1[23:16], d2[23:16], d3[23:16], Q[23:16] ) ;
   ME_MUX_4Bbyte m13 ( buffA2, buffB2,
                   d0[31:24], d1[31:24], d2[31:24], d3[31:24], Q[31:24] ) ;
   ME_MUX_4Bbyte m14 ( buffA3, buffB3,
                   d0[39:32], d1[39:32], d2[39:32], d3[39:32], Q[39:32] ) ;
   ME_MUX_4Bbyte m15 ( buffA3, buffB3,
                   d0[47:40], d1[47:40], d2[47:40], d3[47:40], Q[47:40] ) ;
   ME_MUX4B m16_0 ( buffA4, buffB4, d0[48], d1[48], d2[48], d3[48], Q[48] );
   ME_MUX4B m16_1 ( buffA4, buffB4, d0[49], d1[49], d2[49], d3[49], Q[49] );
   ME_MUX4B m16_2 ( buffA4, buffB4, d0[50], d1[50], d2[50], d3[50], Q[50] );
   ME_MUX4B m16_3 ( buffA4, buffB4, d0[51], d1[51], d2[51], d3[51], Q[51] );
   ME_MUX4B m16_4 ( buffA4, buffB4, d0[52], d1[52], d2[52], d3[52], Q[52] );

endmodule



//  Meiko adder macros
//

module ME_ADD_13 ( sub, CarryIn, x, y, z, zbuf, Eqv ) ;
   input sub, CarryIn;
   input  [12:0] x, y ;
   output [12:0] zbuf, z ;
   output Eqv ;

   adder13 add ( sub, CarryIn, x, y, z, Eqv ) ;
   assign zbuf = z ;

endmodule

module ME_SUB_13 ( sub, CarryIn, x, y, z );
   input sub, CarryIn;
   input  [12:0] x, y ;
   output [12:0] z ;

   adder13 sub13 ( sub, CarryIn, x, y, z, ) ;

endmodule

module subtract13 ( x, y, z) ;

input  [12:0] x, y ;
output [12:0] z ;

	// special 1's comp. subtractor
   adder13 sub13 ( 1'b1, 1'b0, x, y, z, ) ;

endmodule


module dual_adder13 ( x, y, sum_0, sum_1 ) ;

input  [12:0] x, y ;
output [12:0] sum_0 ;			// x+y
output [12:0] sum_1 ;			// x+y+1

    adder13
	expadd0 (.z( sum_0[12:0] ),		// x+y
		 .x( x[12:0] ),
		 .y( y[12:0]),
		 .sub(1'b0),
		 .CarryIn(1'b0)
		);

    adder13
	expadd1 (.z( sum_1[12:0] ),		// x+y+1
		 .x( x[12:0] ),
		 .y( y[12:0]),
		 .sub(1'b0),
		 .CarryIn(1'b1)
		);

endmodule


module adder13 ( sub, CarryIn, x, y, z, Eqv ) ;

   input sub, CarryIn;
   input  [12:0] x, y ;
   output [12:0] z ;
   output Eqv ;

   wire [12:0] zbuf;

   ME_INVA  s1 (sub, notsub);
   ME_INV_C s0 (notsub, Bsub);

   acell4 bit0to3  ( x[3:0],  y[3:0],  Bsub, CarryIn, z[3:0], zbuf[3:0], p0, g0 ) ;
   acell4 bit4to7  ( x[7:4],  y[7:4],  Bsub, Cin1, z[7:4], zbuf[7:4], p1, g1 ) ;
   acell4 bit8to11 ( x[11:8], y[11:8], Bsub, Cin2, z[11:8], zbuf[11:8], p2, g2 ) ;
   acell1 bit11    ( x[12],   y[12],   Bsub, Cin3, z[12], zbuf[12], p3, notp3, p3buf);

   ME_NMUX2B   g10 ( p1, g1, g0, notg7to0 ) ; 
   ME_INV_A    g11 ( CarryIn, notCin ) ;
   ME_INV_A    g12 ( g0, notg0 ) ;
   ME_NMUX2B_B g13 ( p0, notg0, notCin, Cin1 ) ; 
   ME_NAND2_B  g14 ( p0, p1, notplo );
   ME_NMUX2B_B g15 ( notplo, notCin, notg7to0, Cin2 ) ; 
   ME_NAND2_B  g16 ( notplo, p2, notUseG7to0 );
   ME_NMUX2B   g17 ( p2, g2, CarryIn, notCinOrg11to8) ; 
   ME_NMUX2B_B g18 ( notUseG7to0, notg7to0, notCinOrg11to8, Cin3 ) ; 
   ME_INV_A    g19 ( notplo, plo ) ;
   ME_AND2     g20 ( p2, p3, phi );
   ME_AND2     g21 ( phi, plo, Eqv ) ;

endmodule


module adder29 ( CarryIn, x, y, z ) ;

   input CarryIn;
   input  [27:0] x, y ;
   output [28:0] z ;

   assign z = x[27:0] + y[27:0] + CarryIn ;

endmodule


module ME_ADD_58 ( notsub, CarryIn, x, y, z, zbuf, Eqv ) ;

   input notsub, CarryIn ;
   input  [57:0] x, y ;
   output [57:0] zbuf, z ;
   output Eqv ;

   adder58 adr ( notsub, notsub, CarryIn, x, y, z, Eqv ) ;
   assign zbuf = z;

endmodule


module adder52 ( x, y, sum_0, sum_1 ) ;

input  [51:0] x, y ;
output [51:0] sum_0 ;			// x+y
output [51:0] sum_1 ;			// x+y+1

wire [57:0] sumout_0, sumout_1 ;

    adder58
	add52_0 (			// only use 52 bits
		 .z( sumout_0[57:0] ),
		 .x( {6'b0, x[51:0]} ),
		 .y( {6'b0, y[51:0]} ),
		 .CarryIn(1'b0),
		 .notsub_0(1'b1),
		 .notsub_1(1'b1)
		 );

    assign sum_0[51:0] = sumout_0[51:0] ;

    adder58
	add52_1 (			// only use 52 bits
		 .z( sumout_1[57:0] ),
		 .x( {6'b0, x[51:0]} ),
		 .y( {6'b0, y[51:0]} ),
		 .CarryIn(1'b1),
		 .notsub_0(1'b1),
		 .notsub_1(1'b1)
		 );

    assign sum_1[51:0] = sumout_1[51:0] ;

endmodule


module adder58 ( notsub_0, notsub_1, CarryIn, x, y, z, Eqv ) ;

   input notsub_0, notsub_1, CarryIn ;
   input  [57:0] x, y ;
   output [57:0] z ;
   output Eqv ;

   wire [57:0] zbuf;

   ME_INV_C s1 (notsub_0, Bsub1);
   ME_INV_C s2 (notsub_1, Bsub2);

   acell16 bit0to15  ( x[15:0],  y[15:0],  Bsub1, CarryIn, z[15:0], zbuf[15:0], p0, g0 ) ;
   acell16 bit16to31 ( x[31:16], y[31:16], Bsub1, Cin1, z[31:16], zbuf[31:16], p1, g1 ) ;
   acell16 bit32to47 ( x[47:32], y[47:32], Bsub2, Cin2, z[47:32], zbuf[47:32], p2, g2 ) ;
   // acell10 bit47to57 ( x[57:48], y[57:48], Bnotsub2, Cin3, z[57:48], zbuf[57:48], p3, g3 ) ;
   acell10 bit47to57 ( x[57:48], y[57:48], Bsub2, Cin3, z[57:48], zbuf[57:48], p3 ) ;

   ME_NMUX2B_B g10 ( p1, g1, g0, notg31to0 ) ; 
   ME_INV_A    g11 ( CarryIn, notCin ) ;
   ME_INV_A    g12 ( g0, notg0 ) ;
   ME_NMUX2B_B g13 ( p0, notg0, notCin, Cin1 ) ; 
   ME_NAND2_B  g14 ( p0, p1, notplo );
   ME_NMUX2B_B g15 ( notplo, notCin, notg31to0, Cin2 ) ; 
   ME_NAND2_B  g16 ( notplo, p2, notUseG31to0 );
   ME_NMUX2B   g17 ( p2, g2, CarryIn, notCinOrg47to32) ; 
   ME_NMUX2B_B g18 ( notUseG31to0, notg31to0, notCinOrg47to32, Cin3 ) ; 
   ME_INV_A    g19 ( notplo, plo ) ;
   ME_AND2     g20 ( p2, p3, phi );
   ME_AND2     g21 ( phi, plo, Eqv ) ;
//   ME_INV_A   g22 ( notg31to0, g31to0) ;               // Not intrested in CarryOut
//   ME_INV_A   g23 ( notCinOrg47to32, CinOrg47to32) ;   // Drove nowhere
//   ME_MUX2B   g24 ( p3, g3, g2, g57to32 ) ;             // Not intrested in CarryOut
//   ME_MUX2B   g25 ( phi, g57to32, g31to0, g57to0 ) ;    // Not intrested in CarryOut

//   ME_MUX2B   g26 ( Eqv, g57to0, CarryIn, CarryOut ) ;  // Not intrested in CarryOut

endmodule

module acell10 ( x, y, notsub, Cin, z, zbuf, p ) ;

   input [9:0] x, y ;
   input notsub, Cin ;
   output [9:0] zbuf, z ;
   // output p, g;
   output p;

   acell4a bit0 ( x[3:0], y[3:0], notsub, notCin0, z[3:0], zbuf[3:0], p0, g0) ;
   acell4a bit4 ( x[7:4], y[7:4], notsub, notCin4, z[7:4], zbuf[7:4], p4, g4) ;
   acell1a bit8 ( x[8],   y[8],   notsub, notCin8, z[8], zbuf[8], p8, notp8, pbuf8 ) ;
   acell1a bit9 ( x[9],   y[9],   notsub, notCin9, z[9], zbuf[9], p9, notp9, pbuf9 ) ;

   ME_NAND2  g10 ( p0, p4, notplo ) ;
   // ME_NAND2  g11 ( p8, p9, notphi ) ;
   ME_NMUX2B g12 ( p4, g4, g0, notglo ) ; 
   // ME_NMUX2B_B g13 ( p9, x[9], x[8], notghi ) ; 
   // ME_NMUX2B g14 ( notphi, notglo, notghi, g ) ; 
   ME_INV_B  g15 ( Cin, notCin0 );
   ME_NMUX2B_B g17 ( p0, g0, Cin, notCin4 ) ; 
   //ME_INV_A   g18 ( notglo, glo );
   ME_INV_A  g30 ( Cin, notCin);
   ME_MUX2B g19 ( notplo, notCin, notglo, notCin8 ) ; 
   ME_NAND3  g20 ( p0, p4, pbuf8, notp0to8 ) ;
   ME_INV_A  g21 ( x[8], notg8 ) ;
   ME_NMUX2B g25 ( p8, notg8, notglo, gl0to8 ) ; 
   ME_NMUX2B g26 ( notp0to8, Cin, gl0to8, notCin9 ) ; 
   ME_AND4_B g27 ( p0, p4, p8, p9, p ) ;

endmodule

module acell16  ( x, y, notsub, Cin, z, zbuf, p, g ) ;

   input [15:0] x, y ;
   input notsub, Cin ;
   output [15:0] zbuf, z ;
   output p, g;

   acell4a bit0 ( x[3:0], y[3:0], notsub, notCin0, z[3:0], zbuf[3:0], p0, g0) ;
   acell4a bit1 ( x[7:4], y[7:4], notsub, notCin1, z[7:4], zbuf[7:4], p1, g1) ;
   acell4a bit2 ( x[11:8], y[11:8], notsub, notCin2, z[11:8], zbuf[11:8], p2, g2) ;
   acell4a bit3 ( x[15:12], y[15:12], notsub, notCin3, z[15:12], zbuf[15:12], p3, g3) ;

   ME_NAND2  g10 ( p0, p1, notplo ) ;
   ME_NAND2  g11 ( p2, p3, notphi ) ;
   ME_NMUX2B g12 ( p1, g1, g0, notglo ) ; 
   ME_NMUX2B g13 ( p3, g3, g2, notghi ) ; 
   ME_NMUX2B g14 ( notphi, notglo, notghi, g ) ; 
   ME_INV_B  g15 ( Cin, notCin0 );
   ME_INV_A  g16 ( g0, notg0 ) ;
   ME_INV_A  g17 ( notg0, g0buf ) ;
   ME_NMUX2B_B g18 ( p0, g0buf, Cin, notCin1 ) ; 
   ME_INV_A  g19 ( notglo, glo );
   ME_NMUX2B_B g20 ( notplo, Cin, glo, notCin2 ) ; 
   ME_NAND3  g21 ( p0, p1, p2, notp0to2 ) ;
   ME_INV_A  g22 ( g2, notg2 ) ;
   ME_INV_A  g23 ( glo, notglobuf );
   ME_INV_A  g24 ( p2, notp2 );
   ME_NMUX2B g25 ( notp2, notglobuf, notg2, gl0to2 ) ; 
   ME_NMUX2B_B g26 ( notp0to2, Cin, gl0to2, notCin3 ) ; 
   ME_AND4_B g27 ( p0, p1, p2, p3, p ) ;

endmodule

module acell4 ( x, y, notsub, Cin, z, zbuf, p, g ) ;

   input [3:0] x, y ;
   input notsub, Cin ;
   output [3:0] z, zbuf ;
   output p, g;

   acell1a bit0 ( x[0], y[0], notsub, notCin0, z[0], zbuf[0], p0, notp0, pbuf0 ) ;
   acell1a bit1 ( x[1], y[1], notsub, notCin1, z[1], zbuf[1], p1, notp1, pbuf1 ) ;
   acell1a bit2 ( x[2], y[2], notsub, notCin2, z[2], zbuf[2], p2, notp2, pbuf2 ) ;
   acell1a bit3 ( x[3], y[3], notsub, notCin3, z[3], zbuf[3], p3, notp3, pbuf3 ) ;

   ME_NAND2  g10 ( pbuf0, pbuf1, notplo ) ;
   ME_NAND2  g11 ( p2, p3, notphi ) ;
   ME_NMUX2B_B g12 ( p1, x[1], x[0], notglo ) ; 
   ME_NMUX2B_B g13 ( p3, x[3], x[2], notghi ) ; 
   ME_NMUX2B_B g14 ( notphi, notglo, notghi, g ) ; 
   ME_INVA    g15 ( Cin, notCin0 );
   ME_INV_A   g16 ( x[0], notg0 );
   ME_INV_A   g17 ( notg0, g0 );
   ME_NMUX2B g18 ( p0, g0, Cin, notCin1 ) ; 
   ME_INV_A  g19 ( notglo, glo );
   ME_NMUX2B g20 ( notplo, Cin, glo, notCin2 ) ; 
   ME_NAND3  g21 ( pbuf0, pbuf1, pbuf2, notp0to2 ) ;
   ME_INV_A  g22 ( x[2], notg2 );
   ME_INV_A  g23 ( glo, notglobuf );
   ME_NMUX2B g24 ( notp2, notglobuf, notg2, g0to2 ) ; 
   ME_NMUX2B g25 ( notp0to2, Cin, g0to2, notCin3 ) ; 
   ME_AND4_B g26 ( p0, p1, p2, p3, p ) ;

endmodule

module acell4a ( x, y, notsub, notCin, z, zbuf, p, g ) ;

   input [3:0] x, y ;
   input notsub, notCin ;
   output [3:0] zbuf, z ;
   output p, g;

   acell1 bit0 ( x[0], y[0], notsub, Cin0, z[0], zbuf[0], p0, notp0, pbuf0 ) ;
   acell1 bit1 ( x[1], y[1], notsub, Cin1, z[1], zbuf[1], p1, notp1, pbuf1 ) ;
   acell1 bit2 ( x[2], y[2], notsub, Cin2, z[2], zbuf[2], p2, notp2, pbuf2 ) ;
   acell1 bit3 ( x[3], y[3], notsub, Cin3, z[3], zbuf[3], p3, notp3, pbuf3 ) ;

   ME_NAND2  g10 ( pbuf0, pbuf1, notplo ) ;
   ME_NAND2  g11 ( p2, p3, notphi ) ;
   ME_NMUX2B_B g12 ( p1, x[1], x[0], notglo ) ; 
   ME_NMUX2B_B g13 ( p3, x[3], x[2], notghi ) ; 
   ME_NMUX2B_B g14 ( notphi, notglo, notghi, g ) ; 
   ME_INV_A  g15 ( notCin, Cin0 );
   ME_INV_A  g16 ( x[0], notg0 );
   ME_NMUX2B g17 ( p0, notg0, notCin, Cin1 ) ; 
   ME_INV_A  g18 ( notglo, glo );
   ME_INV_A  g19 ( glo, notglobuf );
   ME_NMUX2B g20 ( notplo, notCin, notglobuf, Cin2 ) ; 
   ME_NAND3  g21 ( pbuf0, pbuf1, pbuf2, notp0to2 ) ;
   ME_INV_A  g22 ( x[2], notg2 );
   ME_INV_A  g23 ( notg2, g2 );
   ME_NMUX2B g24 ( notp2, glo, g2, notg0to2 ) ; 
   ME_NMUX2B g25 ( notp0to2, notCin, notg0to2, Cin3 ) ; 
   ME_AND4_B g26 ( p0, p1, p2, p3, p ) ;

endmodule

module acell1  ( x, y, sub, Cin, z, zbuf, p, notp, pbuf ) ;

   input x, y ;
   input sub, Cin ;
   output  z, zbuf ;
   output p, notp, pbuf;
   // g is x for first bit

   // bit 0
   ME_XOR3_B g1  ( y, x, sub, p);
//   ME_XOR2_B  g1  ( sub, x, q);
//   ME_XOR2_B  g2  ( y, q, p);
   ME_INV_A   g3  ( p, notp );
   ME_INV_A   g5  ( notp, pbuf );
   ME_NMUX2B_B g4  ( Cin, notp, pbuf, z) ;
   ME_BUF_B  g6  ( z, zbuf) ;

endmodule

module acell1a ( x, y, sub, notCin, z, zbuf, p, notp, pbuf ) ;

   input x, y ;
   input sub, notCin ;
   output  zbuf, z ;
   output p, notp, pbuf;
   // g is x for first bit

   // bit 0
   ME_XOR3_B g1  ( y, x, sub, p );
//   ME_XOR2_B  g1  ( sub, x, q);
//   ME_XOR2_B  g2  ( y, q, p);
   ME_INV_A   g3  ( p, notp );
   ME_INV_A   g5  ( notp, pbuf );
   ME_NMUX2B_B g4  ( notCin, pbuf, notp, z) ;
   ME_BUF_B  g6  ( z, zbuf) ;

endmodule



//  Meiko multiplier cells
//
module CS_bit  ( SI, CI, Mul, notSiMulSR, notShift, Neg, notZero, 
                 notSiMul, SA, CA );
   input SI, CI, Mul, notSiMulSR, notShift, Neg, notZero ;
   output notSiMul, SA, CA ;
   
   ME_XNOR2_B    g10 ( .a(Neg), .b(Mul), .z(notSiMul)) ;
   ME_NMUX2B g11 ( .s(notShift), .a(notSiMulSR), .b(notSiMul), .z(notSiMulSh)) ;
   ME_AND2_B   g12 ( .a(notZero), .b(notSiMulSh), .z(Mulbit)) ;
   ME_ADD3_B   g13 ( .ci(SI), .a(CI), .b(Mulbit), .s(SA), .co(CA)) ;

endmodule 

module CS_byte ( SI, CI, Mul, notSiMulSR, notShift, Neg, notZero, 
                 notSiMul, SA, CA );
   input [7:0] SI, CI, Mul, notSiMulSR; 
   input notShift, Neg, notZero ;
   output [7:0] notSiMul, SA, CA ;

   wire [7:0] notSiMulSh, Mulbit;

   ME_XNOR2_B    g00 ( .a(Neg), .b(Mul[0]), .z(notSiMul[0])) ;
   ME_NMUX2B g01 ( .s(notShift), .a(notSiMulSR[0]), .b(notSiMul[0]), .z(notSiMulSh[0])) ;
   ME_AND2_B   g02 ( .a(notZero), .b(notSiMulSh[0]), .z(Mulbit[0])) ;
   ME_ADD3_B   g03 ( .ci(SI[0]), .a(CI[0]), .b(Mulbit[0]), .s(SA[0]), .co(CA[0])) ;
   ME_XNOR2_B    g10 ( .a(Neg), .b(Mul[1]), .z(notSiMul[1])) ;
   ME_NMUX2B g11 ( .s(notShift), .a(notSiMulSR[1]), .b(notSiMul[1]), .z(notSiMulSh[1])) ;
   ME_AND2_B   g12 ( .a(notZero), .b(notSiMulSh[1]), .z(Mulbit[1])) ;
   ME_ADD3_B   g13 ( .ci(SI[1]), .a(CI[1]), .b(Mulbit[1]), .s(SA[1]), .co(CA[1])) ;
   ME_XNOR2_B    g20 ( .a(Neg), .b(Mul[2]), .z(notSiMul[2])) ;
   ME_NMUX2B g21 ( .s(notShift), .a(notSiMulSR[2]), .b(notSiMul[2]), .z(notSiMulSh[2])) ;
   ME_AND2_B   g22 ( .a(notZero), .b(notSiMulSh[2]), .z(Mulbit[2])) ;
   ME_ADD3_B   g23 ( .ci(SI[2]), .a(CI[2]), .b(Mulbit[2]), .s(SA[2]), .co(CA[2])) ;
   ME_XNOR2_B    g30 ( .a(Neg), .b(Mul[3]), .z(notSiMul[3])) ;
   ME_NMUX2B g31 ( .s(notShift), .a(notSiMulSR[3]), .b(notSiMul[3]), .z(notSiMulSh[3])) ;
   ME_AND2_B   g32 ( .a(notZero), .b(notSiMulSh[3]), .z(Mulbit[3])) ;
   ME_ADD3_B   g33 ( .ci(SI[3]), .a(CI[3]), .b(Mulbit[3]), .s(SA[3]), .co(CA[3])) ;
   ME_XNOR2_B    g40 ( .a(Neg), .b(Mul[4]), .z(notSiMul[4])) ;
   ME_NMUX2B g41 ( .s(notShift), .a(notSiMulSR[4]), .b(notSiMul[4]), .z(notSiMulSh[4])) ;
   ME_AND2_B   g42 ( .a(notZero), .b(notSiMulSh[4]), .z(Mulbit[4])) ;
   ME_ADD3_B   g43 ( .ci(SI[4]), .a(CI[4]), .b(Mulbit[4]), .s(SA[4]), .co(CA[4])) ;
   ME_XNOR2_B    g50 ( .a(Neg), .b(Mul[5]), .z(notSiMul[5])) ;
   ME_NMUX2B g51 ( .s(notShift), .a(notSiMulSR[5]), .b(notSiMul[5]), .z(notSiMulSh[5])) ;
   ME_AND2_B   g52 ( .a(notZero), .b(notSiMulSh[5]), .z(Mulbit[5])) ;
   ME_ADD3_B   g53 ( .ci(SI[5]), .a(CI[5]), .b(Mulbit[5]), .s(SA[5]), .co(CA[5])) ;
   ME_XNOR2_B    g60 ( .a(Neg), .b(Mul[6]), .z(notSiMul[6])) ;
   ME_NMUX2B g61 ( .s(notShift), .a(notSiMulSR[6]), .b(notSiMul[6]), .z(notSiMulSh[6])) ;
   ME_AND2_B   g62 ( .a(notZero), .b(notSiMulSh[6]), .z(Mulbit[6])) ;
   ME_ADD3_B   g63 ( .ci(SI[6]), .a(CI[6]), .b(Mulbit[6]), .s(SA[6]), .co(CA[6])) ;
   ME_XNOR2_B    g70 ( .a(Neg), .b(Mul[7]), .z(notSiMul[7])) ;
   ME_NMUX2B g71 ( .s(notShift), .a(notSiMulSR[7]), .b(notSiMul[7]), .z(notSiMulSh[7])) ;
   ME_AND2_B   g72 ( .a(notZero), .b(notSiMulSh[7]), .z(Mulbit[7])) ;
   ME_ADD3_B   g73 ( .ci(SI[7]), .a(CI[7]), .b(Mulbit[7]), .s(SA[7]), .co(CA[7])) ;
endmodule

module CS_STAGE_57 (SI, CI, D, Shift, Pos, Zero, SA, CA);

   input[56:0] SI, CI, D;
   input Shift, Pos, Zero;
   output[56:0] SA;
   output[56:0] CA;

   ME_INV_C  ls0 (.a(Shift), .x(_Sh));  
   ME_INV_B lz1 (.a(Zero), .x(_Ze));  

   ME_INV_C  bs2 (.a(Shift), .x(B_notSh1));  
   ME_INV_C  bs3 (.a(Shift), .x(B_notSh2) ) ; 

   ME_INV_B lb0 (.a(Pos), .x(Neg));  
   ME_INV_C  g11 (.a(Pos), .x(B_Neg) ) ;

   ME_INV_C  g12 (.a(Zero), .x(B_nZ) ) ;

wire [56:0] notSiMul;

// Buffer first byte seperately
CS_byte c0 (SI[7:0],  CI[7:0],   D[7:0],   notSiMul[8:1],   _Sh,      Neg,   _Ze,  notSiMul[7:0],   SA[7:0],   CA[7:0] );

CS_byte c1 (SI[15:8], CI[15:8],  D[15:8],  notSiMul[16:9],  B_notSh1, B_Neg, B_nZ, notSiMul[15:8],  SA[15:8],  CA[15:8] );
CS_byte c2 (SI[23:16],CI[23:16], D[23:16], notSiMul[24:17], B_notSh1, B_Neg, B_nZ, notSiMul[23:16], SA[23:16], CA[23:16] );
CS_byte c3 (SI[31:24],CI[31:24], D[31:24], notSiMul[32:25], B_notSh1, B_Neg, B_nZ, notSiMul[31:24], SA[31:24], CA[31:24] );
CS_byte c4 (SI[39:32],CI[39:32], D[39:32], notSiMul[40:33], B_notSh2, B_Neg, B_nZ, notSiMul[39:32], SA[39:32], CA[39:32] );
CS_byte c5 (SI[47:40],CI[47:40], D[47:40], notSiMul[48:41], B_notSh2, B_Neg, B_nZ, notSiMul[47:40], SA[47:40], CA[47:40] );
CS_byte c6 (SI[55:48],CI[55:48], D[55:48], notSiMul[56:49], B_notSh2, B_Neg, B_nZ, notSiMul[55:48], SA[55:48], CA[55:48] );
ME_INV_C g15 (B_Neg, notSiMulMSB ) ;
CS_bit  c7 (SI[56],   CI[56],    D[56],    notSiMulMSB,     B_notSh2, B_Neg, B_nZ, notSiMul[56],    SA[56], CA[56] );
endmodule

//  Meiko register macros
//
/* flip flop register library */

/* components followed by instances */
/* instances should be kept up to date with functional instances */
/* provided block of 1 2 4 8 32 cells to build registers from */
/* registers should also contain buffers to drive datapath lines */

module FDREG_1Bit ( clk, D, Q ) ;		// free-running reg
   input clk, D ;
   output Q ;
   ME_FD1 f0 ( .cp(clk), .d(D), .q(Q) ) ; 
endmodule

module FDREG_1Byte ( clk, D, Q ) ;
   input clk ; 
   input [7:0] D ;
   output [7:0] Q ;
   ME_FD1 f0 ( .cp(clk), .d(D[0]), .q(Q[0]) ) ; 
   ME_FD1 f1 ( .cp(clk), .d(D[1]), .q(Q[1]) ) ; 
   ME_FD1 f2 ( .cp(clk), .d(D[2]), .q(Q[2]) ) ; 
   ME_FD1 f3 ( .cp(clk), .d(D[3]), .q(Q[3]) ) ; 
   ME_FD1 f4 ( .cp(clk), .d(D[4]), .q(Q[4]) ) ; 
   ME_FD1 f5 ( .cp(clk), .d(D[5]), .q(Q[5]) ) ; 
   ME_FD1 f6 ( .cp(clk), .d(D[6]), .q(Q[6]) ) ; 
   ME_FD1 f7 ( .cp(clk), .d(D[7]), .q(Q[7]) ) ; 
endmodule

module FREG_1Bit ( clk, E, D, Q ) ;		// load-enable reg
   input clk, D, E ;
   output Q ;
   ME_FD1E f0 ( .cp(clk), .te(E), .d(D), .q(Q) ) ; 
endmodule

module FREG_1Byte ( clk, E, D, Q ) ;
   input clk, E ; 
   input [7:0] D ;
   output [7:0] Q ;
   ME_FD1E f0 ( .cp(clk), .te(E), .d(D[0]), .q(Q[0]) ) ; 
   ME_FD1E f1 ( .cp(clk), .te(E), .d(D[1]), .q(Q[1]) ) ; 
   ME_FD1E f2 ( .cp(clk), .te(E), .d(D[2]), .q(Q[2]) ) ; 
   ME_FD1E f3 ( .cp(clk), .te(E), .d(D[3]), .q(Q[3]) ) ; 
   ME_FD1E f4 ( .cp(clk), .te(E), .d(D[4]), .q(Q[4]) ) ; 
   ME_FD1E f5 ( .cp(clk), .te(E), .d(D[5]), .q(Q[5]) ) ; 
   ME_FD1E f6 ( .cp(clk), .te(E), .d(D[6]), .q(Q[6]) ) ; 
   ME_FD1E f7 ( .cp(clk), .te(E), .d(D[7]), .q(Q[7]) ) ; 
endmodule


/* real instances start here */

module ME_FDREG_1_57 ( clk, D, Q ) ;		// free-running reg
   input  clk ;
   input  [56:0] D;
   output [56:0] Q;
   FDREG_1Byte m0  ( clk, D[7:0],   Q[7:0] ) ;
   FDREG_1Byte m1  ( clk, D[15:8],  Q[15:8] ) ;
   FDREG_1Byte m2  ( clk, D[23:16], Q[23:16] ) ;
   FDREG_1Byte m3  ( clk, D[31:24], Q[31:24] ) ;
   FDREG_1Byte m4  ( clk, D[39:32], Q[39:32] ) ;
   FDREG_1Byte m5  ( clk, D[47:40], Q[47:40] ) ;
   FDREG_1Byte m6  ( clk, D[55:48], Q[55:48] ) ;
   FDREG_1Bit  m70 ( clk, D[56],    Q[56] ) ;
endmodule

module ME_FREGA_1_52 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [51:0] D;
   output [51:0] Q;
   ME_INV_B    m20 ( enable, _E ) ; 
   ME_INV_C    m21 ( _E, E1 ) ; 
   ME_INV_C    m22 ( _E, E2 ) ; 
   FREG_1Byte m0  ( clk, E1, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E1, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E1, D[23:16], Q[23:16] ) ;
   FREG_1Byte m3  ( clk, E1, D[31:24], Q[31:24] ) ;
   FREG_1Byte m4  ( clk, E2, D[39:32], Q[39:32] ) ;
   FREG_1Byte m5  ( clk, E2, D[47:40], Q[47:40] ) ;
   FREG_1Bit  m60 ( clk, E2, D[48],    Q[48] ) ;
   FREG_1Bit  m61 ( clk, E2, D[49],    Q[49] ) ;
   FREG_1Bit  m62 ( clk, E2, D[50],    Q[50] ) ;
   FREG_1Bit  m63 ( clk, E2, D[51],    Q[51] ) ;
endmodule

module ME_FREGA_1_54 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [53:0] D;
   output [53:0] Q;
   ME_INV_B    m20 ( enable, _E ) ; 
   ME_INV_C    m21 ( _E, E1 ) ; 
   ME_INV_C    m22 ( _E, E2 ) ; 
   FREG_1Byte m0  ( clk, E1, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E1, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E1, D[23:16], Q[23:16] ) ;
   FREG_1Byte m3  ( clk, E1, D[31:24], Q[31:24] ) ;
   FREG_1Byte m4  ( clk, E2, D[39:32], Q[39:32] ) ;
   FREG_1Byte m5  ( clk, E2, D[47:40], Q[47:40] ) ;
   FREG_1Bit  m60 ( clk, E2, D[48],    Q[48] ) ;
   FREG_1Bit  m61 ( clk, E2, D[49],    Q[49] ) ;
   FREG_1Bit  m62 ( clk, E2, D[50],    Q[50] ) ;
   FREG_1Bit  m63 ( clk, E2, D[51],    Q[51] ) ;
   FREG_1Bit  m64 ( clk, E2, D[52],    Q[52] ) ;
   FREG_1Bit  m65 ( clk, E2, D[53],    Q[53] ) ;
endmodule

module ME_FREGA_1_58 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [57:0] D;
   output [57:0] Q;
   ME_INV_B    m20 ( enable, _E ) ; 
   ME_INV_C    m21 ( _E, E1 ) ; 
   ME_INV_C    m22 ( _E, E2 ) ; 
   FREG_1Byte m0  ( clk, E1, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E1, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E1, D[23:16], Q[23:16] ) ;
   FREG_1Byte m3  ( clk, E1, D[31:24], Q[31:24] ) ;
   FREG_1Byte m12 ( clk, E2, D[39:32], Q[39:32] ) ;
   FREG_1Byte m13 ( clk, E2, D[47:40], Q[47:40] ) ;
   FREG_1Byte m14 ( clk, E2, D[55:48], Q[55:48] ) ;
   FREG_1Bit  m15 ( clk, E2, D[56],    Q[56] ) ;
   FREG_1Bit  m16 ( clk, E2, D[57],    Q[57] ) ;
endmodule

module ME_FREGA_1_2 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [1:0] D;
   output [1:0] Q;
   FREG_1Bit  m0  ( clk, enable, D[0],   Q[0] ) ;
   FREG_1Bit  m1  ( clk, enable, D[1],   Q[1] ) ;
endmodule

module ME_FREGA_1_3 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [2:0] D;
   output [2:0] Q;
   FREG_1Bit  m0  ( clk, enable, D[0],   Q[0] ) ;
   FREG_1Bit  m1  ( clk, enable, D[1],   Q[1] ) ;
   FREG_1Bit  m2  ( clk, enable, D[2],   Q[2] ) ;
endmodule

module ME_FREGA_1_8 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [7:0] D;
   output [7:0] Q;
   FREG_1Byte m0  ( clk, enable, D[7:0],   Q[7:0] ) ;
endmodule

module ME_FREGA_1_9 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [8:0] D;
   output [8:0] Q;
   FREG_1Byte m0  ( clk, enable, D[7:0], Q[7:0] ) ;
   FREG_1Bit  m1  ( clk, enable, D[8],   Q[8] ) ;
endmodule

module ME_FREGA_1_11 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [10:0] D;
   output [10:0] Q;
   ME_BUF_B   m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0], Q[7:0] ) ;
   FREG_1Bit  m1  ( clk, E, D[8],   Q[8] ) ;
   FREG_1Bit  m2  ( clk, E, D[9],   Q[9] ) ;
   FREG_1Bit  m3  ( clk, E, D[10],  Q[10] ) ;
endmodule

module ME_FREGA_1_13 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [12:0] D;
   output [12:0] Q;
   ME_BUF_B   m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0], Q[7:0] ) ;
   FREG_1Bit  m1  ( clk, E, D[8],   Q[8] ) ;
   FREG_1Bit  m2  ( clk, E, D[9],   Q[9] ) ;
   FREG_1Bit  m3  ( clk, E, D[10],  Q[10] ) ;
   FREG_1Bit  m4  ( clk, E, D[11],  Q[11] ) ;
   FREG_1Bit  m5  ( clk, E, D[12],  Q[12] ) ;
endmodule

module ME_FREGA_1_25 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [24:0] D;
   output [24:0] Q;
   ME_BUF_C    m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E, D[23:16], Q[23:16] ) ;
   FREG_1Bit  m3  ( clk, E, D[24],  Q[24] ) ;
endmodule

module ME_FREGA_1_26 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [25:0] D;
   output [25:0] Q;
   ME_BUF_C    m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E, D[23:16], Q[23:16] ) ;
   FREG_1Bit  m3  ( clk, E, D[24],  Q[24] ) ;
   FREG_1Bit  m4  ( clk, E, D[25],  Q[25] ) ;
endmodule

module ME_FREGA_1_28 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [27:0] D;
   output [27:0] Q;
   ME_BUF_C    m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E, D[23:16], Q[23:16] ) ;
   FREG_1Bit  m3  ( clk, E, D[24],  Q[24] ) ;
   FREG_1Bit  m4  ( clk, E, D[25],  Q[25] ) ;
   FREG_1Bit  m5  ( clk, E, D[26],  Q[26] ) ;
   FREG_1Bit  m6  ( clk, E, D[27],  Q[27] ) ;
endmodule

module ME_FREGA_1_30 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [29:0] D;
   output [29:0] Q;
   ME_BUF_C    m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E, D[23:16], Q[23:16] ) ;
   FREG_1Bit  m3  ( clk, E, D[24],  Q[24] ) ;
   FREG_1Bit  m4  ( clk, E, D[25],  Q[25] ) ;
   FREG_1Bit  m5  ( clk, E, D[26],  Q[26] ) ;
   FREG_1Bit  m6  ( clk, E, D[27],  Q[27] ) ;
   FREG_1Bit  m7  ( clk, E, D[28],  Q[28] ) ;
   FREG_1Bit  m8  ( clk, E, D[29],  Q[29] ) ;
endmodule

module ME_FREGA_1_32 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [31:0] D;
   output [31:0] Q;
   ME_BUF_C    m20 ( enable, E ) ; 
   FREG_1Byte m0  ( clk, E, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E, D[23:16], Q[23:16] ) ;
   FREG_1Byte m3  ( clk, E, D[31:24], Q[31:24] ) ;
endmodule

module ME_FREG_H_32 ( clk, H, D, Q ) ;
   input  clk;
   input   [3:0] H;
   input  [31:0] D;
   output [31:0] Q;

// rlee: note HOLD is active low
//   N1Z000 gnd(GND);
//   ASFFHA f00 ( .Q( Q[ 0] ), .D( D[ 0] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f01 ( .Q( Q[ 1] ), .D( D[ 1] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f02 ( .Q( Q[ 2] ), .D( D[ 2] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f03 ( .Q( Q[ 3] ), .D( D[ 3] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f04 ( .Q( Q[ 4] ), .D( D[ 4] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f05 ( .Q( Q[ 5] ), .D( D[ 5] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f06 ( .Q( Q[ 6] ), .D( D[ 6] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f07 ( .Q( Q[ 7] ), .D( D[ 7] ), .SM(GND), .SI(GND), .H( H[ 0] ),
//		.CK( clk )) ;
//   ASFFHA f08 ( .Q( Q[ 8] ), .D( D[ 8] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f09 ( .Q( Q[ 9] ), .D( D[ 9] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f10 ( .Q( Q[10] ), .D( D[10] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f11 ( .Q( Q[11] ), .D( D[11] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f12 ( .Q( Q[12] ), .D( D[12] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f13 ( .Q( Q[13] ), .D( D[13] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f14 ( .Q( Q[14] ), .D( D[14] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f15 ( .Q( Q[15] ), .D( D[15] ), .SM(GND), .SI(GND), .H( H[ 1] ),
//		.CK( clk )) ;
//   ASFFHA f16 ( .Q( Q[16] ), .D( D[16] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f17 ( .Q( Q[17] ), .D( D[17] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f18 ( .Q( Q[18] ), .D( D[18] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f19 ( .Q( Q[19] ), .D( D[19] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f20 ( .Q( Q[20] ), .D( D[20] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f21 ( .Q( Q[21] ), .D( D[21] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f22 ( .Q( Q[22] ), .D( D[22] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f23 ( .Q( Q[23] ), .D( D[23] ), .SM(GND), .SI(GND), .H( H[ 2] ),
//		.CK( clk )) ;
//   ASFFHA f24 ( .Q( Q[24] ), .D( D[24] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f25 ( .Q( Q[25] ), .D( D[25] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f26 ( .Q( Q[26] ), .D( D[26] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f27 ( .Q( Q[27] ), .D( D[27] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f28 ( .Q( Q[28] ), .D( D[28] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f29 ( .Q( Q[29] ), .D( D[29] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f30 ( .Q( Q[30] ), .D( D[30] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;
//   ASFFHA f31 ( .Q( Q[31] ), .D( D[31] ), .SM(GND), .SI(GND), .H( H[ 3] ),
//		.CK( clk )) ;


   Mflipflop f00 ( .out(Q[0]), .in(D[0]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f01 ( .out(Q[1]), .in(D[1]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f02 ( .out(Q[2]), .in(D[2]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f03 ( .out(Q[3]), .in(D[3]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f04 ( .out(Q[4]), .in(D[4]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f05 ( .out(Q[5]), .in(D[5]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f06 ( .out(Q[6]), .in(D[6]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f07 ( .out(Q[7]), .in(D[7]), .clock(clk), .enable_l(H[0]) );
   Mflipflop f08 ( .out(Q[8]), .in(D[8]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f09 ( .out(Q[9]), .in(D[9]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f10 ( .out(Q[10]), .in(D[10]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f11 ( .out(Q[11]), .in(D[11]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f12 ( .out(Q[12]), .in(D[12]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f13 ( .out(Q[13]), .in(D[13]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f14 ( .out(Q[14]), .in(D[14]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f15 ( .out(Q[15]), .in(D[15]), .clock(clk), .enable_l(H[1]) );
   Mflipflop f16 ( .out(Q[16]), .in(D[16]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f17 ( .out(Q[17]), .in(D[17]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f18 ( .out(Q[18]), .in(D[18]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f19 ( .out(Q[19]), .in(D[19]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f20 ( .out(Q[20]), .in(D[20]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f21 ( .out(Q[21]), .in(D[21]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f22 ( .out(Q[22]), .in(D[22]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f23 ( .out(Q[23]), .in(D[23]), .clock(clk), .enable_l(H[2]) );
   Mflipflop f24 ( .out(Q[24]), .in(D[24]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f25 ( .out(Q[25]), .in(D[25]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f26 ( .out(Q[26]), .in(D[26]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f27 ( .out(Q[27]), .in(D[27]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f28 ( .out(Q[28]), .in(D[28]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f29 ( .out(Q[29]), .in(D[29]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f30 ( .out(Q[30]), .in(D[30]), .clock(clk), .enable_l(H[3]) );
   Mflipflop f31 ( .out(Q[31]), .in(D[31]), .clock(clk), .enable_l(H[3]) );


endmodule

module ME_FREGA_1_64 ( clk, enable, D, Q ) ;
   input  clk, enable ;
   input  [63:0] D;
   output [63:0] Q;
   ME_INV_B    m20 ( enable, _E ) ; 
   ME_INV_C    m21 ( _E, E1 ) ; 
   ME_INV_C    m22 ( _E, E2 ) ; 

   FREG_1Byte m0  ( clk, E1, D[7:0],   Q[7:0] ) ;
   FREG_1Byte m1  ( clk, E1, D[15:8],  Q[15:8] ) ;
   FREG_1Byte m2  ( clk, E1, D[23:16], Q[23:16] ) ;
   FREG_1Byte m3  ( clk, E1, D[31:24], Q[31:24] ) ;
   FREG_1Byte m4  ( clk, E2, D[39:32], Q[39:32] ) ;
   FREG_1Byte m5  ( clk, E2, D[47:40], Q[47:40] ) ;
   FREG_1Byte m6  ( clk, E2, D[55:48], Q[55:48] ) ;
   FREG_1Byte m7  ( clk, E2, D[63:56], Q[63:56] ) ;
endmodule

//  Meiko register macros
//
/* 2 input flip flop register library */

/* components followed by instances */
/* instances should be kept up to date with functional instances */
/* provided block of 1 2 4 8 32 cells to build registers from */
/* registers should also contain buffers to drive datapath lines */

module FREG_2bit ( clk, E, notA, A, d0, d1, Q ) ;
   input clk, notA, A, d0, d1, E ;
   output Q ;

   wire x;
   ME_NMUX2BA n0 ( .nota(notA), .a(A), .d0(d0), .d1(d1), .notX(x));
   ME_FD1E f0 (.cp(clk), .te(E), .d(x), .qn(Q)) ;
endmodule


/* real instances start here */

/*					// 4-bit reg with 2:1 mux built in
module ME_FREGA_2_4 ( clk, hold, S, d0, d1, Q ) ;
   input clk, hold, S;
   input  [3:0] d0, d1;
   output [3:0] Q;

//   N1Z000 gnd (GND);
//   AMUXFFA ff ( .DA0(d0[0]), .DA1(d0[1]), .DA2(d0[2]), .DA3(d0[3]),
//		.DB0(d1[0]), .DB1(d1[1]), .DB2(d1[2]), .DB3(d1[3]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[0]),  .DO1(Q[1]),  .DO2(Q[2]),  .DO3(Q[3]) );

   reg [3:0] mux_output;
   wire enable_low;

   always @ (S or d0 or d1)
	case (S)	// synopsys parallel_case full_case
		0: mux_output = d0;
		1: mux_output = d1;
		default mux_output = 'bx;
        endcase

   assign enable_low = ~hold;
   Mflipflop_4 f0 (.out(Q[3:0]), .din(mux_output[3:0]), .clock(clk), .enable_l(enable_low) );


endmodule


module ME_FREGA_2_32 ( clk, hold, S, d0, d1, Q ) ;
   input clk, hold, S;
   input  [31:0] d0, d1;
   output [31:0] Q;

//   N1Z000 gnd (GND);
//   AMUXFFA f0 ( .DA0(d0[0]), .DA1(d0[1]), .DA2(d0[2]), .DA3(d0[3]),
//		.DB0(d1[0]), .DB1(d1[1]), .DB2(d1[2]), .DB3(d1[3]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[0]),  .DO1(Q[1]),  .DO2(Q[2]),  .DO3(Q[3]) );
//
//   AMUXFFA f1 ( .DA0(d0[4]), .DA1(d0[5]), .DA2(d0[6]), .DA3(d0[7]),
//		.DB0(d1[4]), .DB1(d1[5]), .DB2(d1[6]), .DB3(d1[7]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[4]),  .DO1(Q[5]),  .DO2(Q[6]),  .DO3(Q[7]) );
//
//   AMUXFFA f2 ( .DA0(d0[8]), .DA1(d0[9]), .DA2(d0[10]), .DA3(d0[11]),
//		.DB0(d1[8]), .DB1(d1[9]), .DB2(d1[10]), .DB3(d1[11]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[8]),  .DO1(Q[9]),  .DO2(Q[10]),  .DO3(Q[11]) );
//
//   AMUXFFA f3 ( .DA0(d0[12]), .DA1(d0[13]), .DA2(d0[14]), .DA3(d0[15]),
//		.DB0(d1[12]), .DB1(d1[13]), .DB2(d1[14]), .DB3(d1[15]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[12]),  .DO1(Q[13]),  .DO2(Q[14]),  .DO3(Q[15]) );
//
//   AMUXFFA f4 ( .DA0(d0[16]), .DA1(d0[17]), .DA2(d0[18]), .DA3(d0[19]),
//		.DB0(d1[16]), .DB1(d1[17]), .DB2(d1[18]), .DB3(d1[19]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[16]),  .DO1(Q[17]),  .DO2(Q[18]),  .DO3(Q[19]) );
//
//   AMUXFFA f5 ( .DA0(d0[20]), .DA1(d0[21]), .DA2(d0[22]), .DA3(d0[23]),
//		.DB0(d1[20]), .DB1(d1[21]), .DB2(d1[22]), .DB3(d1[23]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[20]),  .DO1(Q[21]),  .DO2(Q[22]),  .DO3(Q[23]) );
//
//   AMUXFFA f6 ( .DA0(d0[24]), .DA1(d0[25]), .DA2(d0[26]), .DA3(d0[27]),
//		.DB0(d1[24]), .DB1(d1[25]), .DB2(d1[26]), .DB3(d1[27]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[24]),  .DO1(Q[25]),  .DO2(Q[26]),  .DO3(Q[27]) );
//
//   AMUXFFA f7 ( .DA0(d0[28]), .DA1(d0[29]), .DA2(d0[30]), .DA3(d0[31]),
//		.DB0(d1[28]), .DB1(d1[29]), .DB2(d1[30]), .DB3(d1[31]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[28]),  .DO1(Q[29]),  .DO2(Q[30]),  .DO3(Q[31]) );

   reg [31:0] mux_output;
   wire enable_low;

   always @ (S or d0 or d1)
	case (S)	// synopsys parallel_case full_case
		0: mux_output[31:0] = d0[31:0];
		1: mux_output[31:0] = d1[31:0];
		default mux_output = 'bx;
        endcase

   assign enable_low = ~hold;
   Mflipflop_32 f0 (.out(Q[31:0]), .din(mux_output[31:0]), .clock(clk), .enable_l(enable_low) );


endmodule

*/
module ME_FREGA_2_58 ( clk, enable, A, d0, d1, Q ) ;
   input clk, enable, A ;
   input  [57:0] d0, d1 ;
   output [57:0] Q ;

   ME_INV_C       ia0 ( A, notA ) ;
   ME_INV_B       ia1 ( A, _A ) ;
   ME_INV_C       ba1 ( _A, Abuf1 ) ;
   ME_INV_C       ba2 ( _A, Abuf2 ) ;
   ME_INV_B       ie0 ( enable, _E ) ;
   ME_INV_C       ie1 ( _E, E1 ) ;
   ME_INV_C       ie2 ( _E, E2 ) ;

   FREG_2byte f00 ( clk, E1, notA, Abuf1, d0[7:0], d1[7:0], Q[7:0] ) ; 
   FREG_2byte f01 ( clk, E1, notA, Abuf1, d0[15:8], d1[15:8], Q[15:8] ) ; 
   FREG_2byte f02 ( clk, E1, notA, Abuf1, d0[23:16], d1[23:16], Q[23:16] ) ; 
   FREG_2byte f03 ( clk, E1, notA, Abuf1, d0[31:24], d1[31:24], Q[31:24] ) ; 
   FREG_2byte m12 ( clk, E2, notA, Abuf2, d0[39:32], d1[39:32], Q[39:32] ) ;
   FREG_2byte m13 ( clk, E2, notA, Abuf2, d0[47:40], d1[47:40], Q[47:40] ) ;
   FREG_2byte m14 ( clk, E2, notA, Abuf2, d0[55:48], d1[55:48], Q[55:48] ) ;
   FREG_2bit  m15 ( clk, E2, notA, Abuf2, d0[56], d1[56], Q[56] ) ;
   FREG_2bit  m16 ( clk, E2, notA, Abuf2, d0[57], d1[57], Q[57] ) ;

endmodule

//  Meiko register macros
//
/* 4 input flip flop register library */

/* components followed by instances */
/* instances should be kept up to date with functional instances */

/* components */
/* provided block of 1 8 cells to build registers from */
/* registers should also contain buffers to drive datapath lines */

module FREG_S_4Bit ( clk, E, A, B, d0, d1, d2, d3, Q, Qbuf ) ;
   input clk, E, A, B, d0, d1, d2, d3 ;
   output Q, Qbuf ;
   ME_MUX4B n0 ( .a(A), .b(B), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z(x) );
   ME_FD1E  f0 ( .cp(clk), .te(E), .d(x), .q(Q), .qn(QN));
   ME_INV_B b0 ( .a(QN), .x(Qbuf));
endmodule

module FREG_4Bit ( clk, E, A, B, d0, d1, d2, d3, Q ) ;
   input clk, E, A, B, d0, d1, d2, d3 ;
   output Q ;
   ME_MUX4B n0 ( .a(A), .b(B), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z(x) );
   ME_FD1E  f0 ( .cp(clk), .te(E), .d(x), .q(Q));
endmodule

module FREG_4Byte ( clk, E, A, B, d0, d1, d2, d3, Q ) ;
   input clk, E, A, B;
   input  [7:0] d0, d1, d2, d3 ;
   output [7:0] Q ;
   FREG_4Bit f0 ( clk, E, A, B, d0[0], d1[0], d2[0], d3[0], Q[0] ) ; 
   FREG_4Bit f1 ( clk, E, A, B, d0[1], d1[1], d2[1], d3[1], Q[1] ) ; 
   FREG_4Bit f2 ( clk, E, A, B, d0[2], d1[2], d2[2], d3[2], Q[2] ) ; 
   FREG_4Bit f3 ( clk, E, A, B, d0[3], d1[3], d2[3], d3[3], Q[3] ) ; 
   FREG_4Bit f4 ( clk, E, A, B, d0[4], d1[4], d2[4], d3[4], Q[4] ) ; 
   FREG_4Bit f5 ( clk, E, A, B, d0[5], d1[5], d2[5], d3[5], Q[5] ) ; 
   FREG_4Bit f6 ( clk, E, A, B, d0[6], d1[6], d2[6], d3[6], Q[6] ) ; 
   FREG_4Bit f7 ( clk, E, A, B, d0[7], d1[7], d2[7], d3[7], Q[7] ) ; 
endmodule

/* real instances start here */

module ME_FREGA_4_13 ( clk, enable, A, B, d0, d1, d2, d3, Q ) ;
   input clk, enable, A, B ;
   input  [12:0] d0, d1, d2, d3 ;
   output [12:0] Q ;

   ME_BUF_C      m20 ( enable, E ) ;
   ME_BUF_C      m21 ( A, Abuf ) ;
   ME_BUF_C      m22 ( B, Bbuf ) ;

   FREG_4Byte f1 ( clk, E, Abuf, Bbuf, 
                   d0[7:0], d1[7:0], d2[7:0], d3[7:0], Q[7:0] ) ;
   FREG_4Bit f3 ( clk, E, Abuf, Bbuf, d0[8], d1[8], d2[8], d3[8], Q[8] ) ; 
   FREG_4Bit f4 ( clk, E, Abuf, Bbuf, d0[9], d1[9], d2[9], d3[9], Q[9] ) ; 
   FREG_4Bit f5 ( clk, E, Abuf, Bbuf, d0[10], d1[10], d2[10], d3[10], Q[10] ) ; 
   FREG_4Bit f6 ( clk, E, Abuf, Bbuf, d0[11], d1[11], d2[11], d3[11], Q[11] ) ; 
   FREG_4Bit f7 ( clk, E, Abuf, Bbuf, d0[12], d1[12], d2[12], d3[12], Q[12] ) ; 

endmodule

module ME_FREGA_S_4_13 ( clk, enable, A, B, d0, d1, d2, d3, Q, Qbuf) ;
   input clk, enable, A, B ;
   input  [12:0] d0, d1, d2, d3 ;
   output [12:0] Q, Qbuf;

   ME_BUF_C      m20 ( enable, E ) ;
   ME_BUF_C      m21 ( A, Abuf ) ;
   ME_BUF_C      m22 ( B, Bbuf ) ;

   FREG_S_4Bit f0 ( clk, E, Abuf, Bbuf, d0[ 0], d1[ 0], d2[ 0], d3[ 0], Q[ 0], Qbuf[ 0] ) ; 
   FREG_S_4Bit f1 ( clk, E, Abuf, Bbuf, d0[ 1], d1[ 1], d2[ 1], d3[ 1], Q[ 1], Qbuf[ 1] ) ; 
   FREG_S_4Bit f2 ( clk, E, Abuf, Bbuf, d0[ 2], d1[ 2], d2[ 2], d3[ 2], Q[ 2], Qbuf[ 2] ) ; 
   FREG_S_4Bit f3 ( clk, E, Abuf, Bbuf, d0[ 3], d1[ 3], d2[ 3], d3[ 3], Q[ 3], Qbuf[ 3] ) ; 
   FREG_S_4Bit f4 ( clk, E, Abuf, Bbuf, d0[ 4], d1[ 4], d2[ 4], d3[ 4], Q[ 4], Qbuf[ 4] ) ; 
   FREG_S_4Bit f5 ( clk, E, Abuf, Bbuf, d0[ 5], d1[ 5], d2[ 5], d3[ 5], Q[ 5], Qbuf[ 5] ) ; 
   FREG_S_4Bit f6 ( clk, E, Abuf, Bbuf, d0[ 6], d1[ 6], d2[ 6], d3[ 6], Q[ 6], Qbuf[ 6] ) ; 
   FREG_S_4Bit f7 ( clk, E, Abuf, Bbuf, d0[ 7], d1[ 7], d2[ 7], d3[ 7], Q[ 7], Qbuf[ 7] ) ; 
   FREG_S_4Bit f8 ( clk, E, Abuf, Bbuf, d0[ 8], d1[ 8], d2[ 8], d3[ 8], Q[ 8], Qbuf[ 8] ) ; 
   FREG_S_4Bit f9 ( clk, E, Abuf, Bbuf, d0[ 9], d1[ 9], d2[ 9], d3[ 9], Q[ 9], Qbuf[ 9] ) ; 
   FREG_S_4Bit fa ( clk, E, Abuf, Bbuf, d0[10], d1[10], d2[10], d3[10], Q[10], Qbuf[10] ) ; 
   FREG_S_4Bit fb ( clk, E, Abuf, Bbuf, d0[11], d1[11], d2[11], d3[11], Q[11], Qbuf[11] ) ; 
   FREG_S_4Bit fc ( clk, E, Abuf, Bbuf, d0[12], d1[12], d2[12], d3[12], Q[12], Qbuf[12] ) ; 

endmodule

//  Meiko register macros
//
/* 5 input flip flop register library */

/* components followed by instances */
/* instances should be kept up to date with functional instances */

/* components */
/* provided block of 1 8 cells to build registers from */
/* registers should also contain buffers to drive datapath lines */

module FREG_S_5bit ( clk, E, A, B, C, d0, d1, d2, d3, d4, Q, Qbuf, QN) ;
   input clk, E, A, B, C, d0, d1, d2, d3, d4 ;
   output Q, Qbuf, QN ;
   //ME_TIEOFF toff (vdd,);

   ME_MUX4B  m0 (.a(A), .b(B), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z(T0));
   ME_NMUX2B n0 (.s(C), .a(T0), .b(d4), .z(x)) ;
   ME_FD1E   f0 (.cp(clk), .te(E), .d(x), .q(QN), .qn(Q));
   ME_INV_B  b0 (.a(QN), .x(Qbuf));
endmodule

module FREG_5bit ( clk, E, A, B, C, d0, d1, d2, d3, d4, Q, Qbuf) ;
   input clk, E, A, B, C, d0, d1, d2, d3, d4 ;
   output Q, Qbuf ;

   ME_MUX4B  m0 (.a(A), .b(B), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .z(T0));
   ME_NMUX2B n0 (.s(C), .a(T0), .b(d4), .z(x)) ;
   ME_FD1E   f0 (.cp(clk), .te(E), .d(x), .q(QN), .qn(Q));
   ME_INV_B  b0 (.a(QN), .x(Qbuf));
endmodule

module FREG_5byte ( clk, E, A, B, C, d0, d1, d2, d3, d4, Q, Qbuf) ;
   input clk, E, A, B, C;
   input  [7:0] d0, d1, d2, d3, d4 ;
   output [7:0] Q, Qbuf;
   FREG_5bit f0 ( clk, E, A, B, C, d0[0], d1[0], d2[0], d3[0], d4[0], Q[0], Qbuf[0]) ; 
   FREG_5bit f1 ( clk, E, A, B, C, d0[1], d1[1], d2[1], d3[1], d4[1], Q[1], Qbuf[1]) ; 
   FREG_5bit f2 ( clk, E, A, B, C, d0[2], d1[2], d2[2], d3[2], d4[2], Q[2], Qbuf[2]) ; 
   FREG_5bit f3 ( clk, E, A, B, C, d0[3], d1[3], d2[3], d3[3], d4[3], Q[3], Qbuf[3]) ; 
   FREG_5bit f4 ( clk, E, A, B, C, d0[4], d1[4], d2[4], d3[4], d4[4], Q[4], Qbuf[4]) ; 
   FREG_5bit f5 ( clk, E, A, B, C, d0[5], d1[5], d2[5], d3[5], d4[5], Q[5], Qbuf[5]) ; 
   FREG_5bit f6 ( clk, E, A, B, C, d0[6], d1[6], d2[6], d3[6], d4[6], Q[6], Qbuf[6]) ; 
   FREG_5bit f7 ( clk, E, A, B, C, d0[7], d1[7], d2[7], d3[7], d4[7], Q[7], Qbuf[7]) ; 
endmodule

/* real instances start here */

module ME_FREGA_5_58 ( clk, enable, A, B, C, d0, d1, d2, d3, d4, Q, Qbuf, notBSign) ;
   input clk, enable, A, B, C ;
   input  [57:0] d0, d1, d2, d3, d4 ;
   output [57:0] Q, Qbuf;
   output notBSign;

   ME_INV_B      ie1 ( enable, _E1 ) ; 
   ME_INV_C      ie2 ( _E1, E1 ) ; 
   ME_INV_C      ie3 ( _E1, E2 ) ; 
   ME_INV_B      ia0 ( A, _A ) ;
   ME_INV_C      ia1 ( _A, A1 ) ; 
   ME_INV_C      ia2 ( _A, A2 ) ; 
   ME_INV_C      ia3 ( _A, A3 ) ; 
   ME_INV_B      ib0 ( B, _B ) ;
   ME_INV_C      ib1 ( _B, B1 ) ; 
   ME_INV_C      ib2 ( _B, B2 ) ; 
   ME_INV_B      ic0 ( C, _C ) ;
   ME_INV_C      ic1 ( _C, C1 ) ; 
   ME_INV_C      ic2 ( _C, C2 ) ; 

   FREG_5byte f0 (clk, E1, A1, B1, C1, 
                  d0[7:0],  d1[7:0],  d2[7:0],  d3[7:0],  d4[7:0],  Q[7:0]  ,Qbuf[7:0]  ); 
   FREG_5byte f1 (clk, E1, A1, B1, C1, 
                  d0[15:8], d1[15:8], d2[15:8], d3[15:8], d4[15:8], Q[15:8] ,Qbuf[15:8]  ); 
   FREG_5byte f2 (clk, E1, A1, B1, C1, 
                  d0[23:16],d1[23:16],d2[23:16],d3[23:16],d4[23:16],Q[23:16],Qbuf[23:16]); 
   FREG_5byte f3 (clk, E1, A2, B1, C1, 
                  d0[31:24],d1[31:24],d2[31:24],d3[31:24],d4[31:24],Q[31:24],Qbuf[31:24]); 
   FREG_5byte f4 (clk, E2, A2, B2, C2, 
                  d0[39:32],d1[39:32],d2[39:32],d3[39:32],d4[39:32],Q[39:32],Qbuf[39:32]);
   FREG_5byte f5 (clk, E2, A2, B2, C2, 
                  d0[47:40],d1[47:40],d2[47:40],d3[47:40],d4[47:40],Q[47:40],Qbuf[47:40]);
   FREG_5byte f6 (clk, E2, A3, B2, C2, 
                  d0[55:48],d1[55:48],d2[55:48],d3[55:48],d4[55:48],Q[55:48],Qbuf[55:48]);
   FREG_5bit  f7 (clk, E2, A3, B2, C2,
                  d0[56],   d1[56],   d2[56],   d3[56],   d4[56],   Q[56]   ,Qbuf[56])   ;
   FREG_S_5bit  f8 (clk, E2, A3, B2, C2,
                  d0[57],   d1[57],   d2[57],   d3[57],   d4[57],   Q[57]   ,Qbuf[57], notBSign)   ;

endmodule

//  Meiko register macros
//
/* 8 input flip flop register library */

/* components followed by instances */
/* instances should be kept up to date with functional instances */

/* components */
/* provided block of 1 8 cells to build registers from */
/* registers should also contain buffers to drive datapath lines */

module FREG_8bit ( clk, E, _A, _B, C, d0, d1, d2, d3, d4, d5, d6, d7, Q, Qbuf ) ;
   input clk, E, _A, _B, C, d0, d1, d2, d3, d4, d5, d6, d7 ;
   output Q, Qbuf ;

   ME_INV_A     i0 ( .a(_A), .x(A));
   ME_INV_A     i1 ( .a(_B), .x(B));
   ME_MUX8B_B   n0 (.a(A), .b(B), .c(C),
		    .d0(d0), .d1(d1), .d2(d2), .d3(d3),
		    .d4(d4), .d5(d5), .d6(d6), .d7(d7), .f(x));
   ME_FD1E  f0 (.cp(clk), .te(E), .d(x), .q(Q), .qn(QN));
   ME_INV_B b0 (.a(QN), .x(Qbuf));
endmodule

module FREG_8bit_s ( clk, E, _A, _B, C, d0, d1, d2, d3, d4, d5, d6, d7, Q, Qbuf, QTs, Qs) ;
   input clk, E, _A, _B, C, d0, d1, d2, d3, d4, d5, d6, d7 ;
   output Q, Qbuf, QTs, Qs;

   // Bit 56 is critical and so contains two extra latches which
   // drive the rounding select value

   ME_INV_A   i0 ( _A, A);
   ME_INV_A   i1 ( _B, B);
   ME_MUX8B_B n0 ( A, B, C, d0, d1, d2, d3, d4, d5, d6, d7, x );
   ME_FD1E_B   f0 ( clk, E, x, Q, QN);
   ME_INV_B   b0 ( QN, Qbuf);

   ME_NMUX2B_B sm0 ( E, QNs, x, Ds );
   ME_FD1_B   sf0  ( clk, Ds, Qs, QNs);

   ME_FD1E_B   f1 ( clk, E, x, QTs, );

endmodule

module FREG_8byte ( clk, E, A, B, C, d0, d1, d2, d3, d4, d5, d6, d7, Q, Qbuf ) ;
   input clk, E, A, B, C;
   input  [7:0] d0, d1, d2, d3, d4, d5, d6, d7 ;
   output [7:0] Q, Qbuf ;

   FREG_8bit f0 ( clk, E, A, B, C, d0[0], d1[0], d2[0], d3[0], 
                                d4[0], d5[0], d6[0], d7[0], Q[0], Qbuf[0] ) ; 
   FREG_8bit f1 ( clk, E, A, B, C, d0[1], d1[1], d2[1], d3[1], 
                                d4[1], d5[1], d6[1], d7[1], Q[1], Qbuf[1]) ; 
   FREG_8bit f2 ( clk, E, A, B, C, d0[2], d1[2], d2[2], d3[2], 
                                d4[2], d5[2], d6[2], d7[2], Q[2], Qbuf[2]) ; 
   FREG_8bit f3 ( clk, E, A, B, C, d0[3], d1[3], d2[3], d3[3], 
                                d4[3], d5[3], d6[3], d7[3], Q[3], Qbuf[3]) ; 
   FREG_8bit f4 ( clk, E, A, B, C, d0[4], d1[4], d2[4], d3[4], 
                                d4[4], d5[4], d6[4], d7[4], Q[4], Qbuf[4]) ; 
   FREG_8bit f5 ( clk, E, A, B, C, d0[5], d1[5], d2[5], d3[5], 
                                d4[5], d5[5], d6[5], d7[5], Q[5], Qbuf[5]) ; 
   FREG_8bit f6 ( clk, E, A, B, C, d0[6], d1[6], d2[6], d3[6], 
                                d4[6], d5[6], d6[6], d7[6], Q[6], Qbuf[6]) ; 
   FREG_8bit f7 ( clk, E, A, B, C, d0[7], d1[7], d2[7], d3[7], 
                                d4[7], d5[7], d6[7], d7[7], Q[7], Qbuf[7]) ; 
endmodule

/* real instances start here */

module ME_FREGA_8_58 ( clk, enable, A, B, C, d0, d1, d2, d3, d4, d5, d6, d7, Q, Qbuf, QTs, Qs) ;
   input clk, enable, A, B, C ;
   input  [57:0] d0, d1, d2, d3, d4, d5, d6, d7 ;
   output [57:0] Q, Qbuf;
   output QTs, Qs ;

   ME_INV_C      ie0 ( enable, _E ) ; 
   ME_INV_C      ie1 ( _E, E1 ) ; 
   ME_INV_C      ie2 ( _E, E2 ) ; 
   ME_INV_C      ie3 ( _E, E3 ) ; 
   ME_INV_C      ie4 ( _E, E4 ) ; 
   ME_INV_C      m21 ( A, Abuf ) ;
   ME_INV_C      m22 ( B, Bbuf ) ;
   ME_INV_B      ic0 ( C, _C ) ; 
   ME_INV_C      ic1 ( _C, C1 ) ; 
   ME_INV_C      ic2 ( _C, C2 ) ; 

   FREG_8byte f00 (clk, E1, Abuf, Bbuf, C1, 
                   d0[7:0], d1[7:0], d2[7:0], d3[7:0], 
                   d4[7:0], d5[7:0], d6[7:0], d7[7:0], Q[7:0], Qbuf[7:0]) ; 
   FREG_8byte f01 (clk, E1, Abuf, Bbuf, C1, 
                   d0[15:8], d1[15:8], d2[15:8], d3[15:8], 
                   d4[15:8], d5[15:8], d6[15:8], d7[15:8], Q[15:8], Qbuf[15:8]); 
   FREG_8byte f02 (clk, E2, Abuf, Bbuf, C1, 
                   d0[23:16], d1[23:16], d2[23:16], d3[23:16], 
                   d4[23:16], d5[23:16], d6[23:16], d7[23:16], 
                   Q[23:16], Qbuf[23:16]); 
   FREG_8byte f03 (clk, E2, Abuf, Bbuf, C1, 
                   d0[31:24], d1[31:24], d2[31:24], d3[31:24], 
                   d4[31:24], d5[31:24], d6[31:24], d7[31:24], 
                   Q[31:24], Qbuf[31:24]); 
   FREG_8byte m12 (clk, E3, Abuf, Bbuf, C2, 
                   d0[39:32], d1[39:32], d2[39:32], d3[39:32], 
                   d4[39:32], d5[39:32], d6[39:32], d7[39:32], 
                   Q[39:32], Qbuf[39:32]);
   FREG_8byte m13 (clk, E3, Abuf, Bbuf, C2, 
                   d0[47:40], d1[47:40], d2[47:40], d3[47:40], 
                   d4[47:40], d5[47:40], d6[47:40], d7[47:40], 
                   Q[47:40], Qbuf[47:40]);
   FREG_8byte m14 (clk, E4, Abuf, Bbuf, C2, 
                   d0[55:48], d1[55:48], d2[55:48], d3[55:48], 
                   d4[55:48], d5[55:48], d6[55:48], d7[55:48], 
                   Q[55:48], Qbuf[55:48]);

/* This is the special round bit */

   FREG_8bit_s  m15 (clk, E4, Abuf, Bbuf, C2,
                   d0[56], d1[56], d2[56], d3[56], 
                   d4[56], d5[56], d6[56], d7[56], Q[56], Qbuf[56], QTs, Qs);
   FREG_8bit  m16 (clk, E4, Abuf, Bbuf, C2,
                   d0[57], d1[57], d2[57], d3[57], 
                   d4[57], d5[57], d6[57], d7[57], Q[57], Qbuf[57]);

endmodule

//  Meiko ymuxslice macros
//
module ME_Ymux_Bit (S1, S2, S3, D1, D2, D3, Z);
input S1, S2, S3;
input D1, D2, D3;
output Z;

ME_NAND2 d0 (.a(S1), .b(D1), .z(t0));
ME_NAND2 d1 (.a(S2), .b(D2), .z(t1));
ME_NAND2 d2 (.a(S3), .b(D3), .z(t2));
ME_NAND3 d3 (.a(t0), .b(t1), .c(t2), .z(Z));

endmodule

module ME_YmuxSlice (notS1, notS2, notS3,
/* dhn--01/10/91	notS1A, notS2A, notS3A, */
                     D1, D2, D3,
                     Z);
input notS1, notS2, notS3;
/* dhn--01/10/91	input notS1A, notS2A, notS3A; */
input [55:0] D1, D2, D3;
output [55:0] Z;

ME_INV_D b1 (.a(notS1), .x(S1));
ME_INV_D b2 (.a(notS2), .x(S2));
ME_INV_D b3 (.a(notS3), .x(S3));

/* dhn--01/10/91
ME_INV_D b7 (.a(notS1A), .x(BS1));
ME_INV_D b8 (.a(notS2A), .x(BS2));
ME_INV_D b9 (.a(notS3A), .x(BS3));
*/

ME_INV_D b7 (.a(notS1), .x(BS1));	/* dhn--01/10/91 */
ME_INV_D b8 (.a(notS2), .x(BS2));	/* dhn--01/10/91 */
ME_INV_D b9 (.a(notS3), .x(BS3));	/* dhn--01/10/91 */


ME_Ymux_Bit ym00 (S1, S2, S3, D1[00], D2[00], D3[00], Z[00]);
ME_Ymux_Bit ym01 (S1, S2, S3, D1[01], D2[01], D3[01], Z[01]);
ME_Ymux_Bit ym02 (S1, S2, S3, D1[02], D2[02], D3[02], Z[02]);
ME_Ymux_Bit ym03 (S1, S2, S3, D1[03], D2[03], D3[03], Z[03]);
ME_Ymux_Bit ym04 (S1, S2, S3, D1[04], D2[04], D3[04], Z[04]);
ME_Ymux_Bit ym05 (S1, S2, S3, D1[05], D2[05], D3[05], Z[05]);
ME_Ymux_Bit ym06 (S1, S2, S3, D1[06], D2[06], D3[06], Z[06]);
ME_Ymux_Bit ym07 (S1, S2, S3, D1[07], D2[07], D3[07], Z[07]);
ME_Ymux_Bit ym08 (S1, S2, S3, D1[08], D2[08], D3[08], Z[08]);
ME_Ymux_Bit ym09 (S1, S2, S3, D1[09], D2[09], D3[09], Z[09]);
ME_Ymux_Bit ym10 (S1, S2, S3, D1[10], D2[10], D3[10], Z[10]);
ME_Ymux_Bit ym11 (S1, S2, S3, D1[11], D2[11], D3[11], Z[11]);
ME_Ymux_Bit ym12 (S1, S2, S3, D1[12], D2[12], D3[12], Z[12]);
ME_Ymux_Bit ym13 (S1, S2, S3, D1[13], D2[13], D3[13], Z[13]);
ME_Ymux_Bit ym14 (S1, S2, S3, D1[14], D2[14], D3[14], Z[14]);
ME_Ymux_Bit ym15 (S1, S2, S3, D1[15], D2[15], D3[15], Z[15]);
ME_Ymux_Bit ym16 (S1, S2, S3, D1[16], D2[16], D3[16], Z[16]);
ME_Ymux_Bit ym17 (S1, S2, S3, D1[17], D2[17], D3[17], Z[17]);
ME_Ymux_Bit ym18 (S1, S2, S3, D1[18], D2[18], D3[18], Z[18]);
ME_Ymux_Bit ym19 (S1, S2, S3, D1[19], D2[19], D3[19], Z[19]);
ME_Ymux_Bit ym20 (S1, S2, S3, D1[20], D2[20], D3[20], Z[20]);
ME_Ymux_Bit ym21 (S1, S2, S3, D1[21], D2[21], D3[21], Z[21]);
ME_Ymux_Bit ym22 (S1, S2, S3, D1[22], D2[22], D3[22], Z[22]);
ME_Ymux_Bit ym23 (S1, S2, S3, D1[23], D2[23], D3[23], Z[23]);
ME_Ymux_Bit ym24 (S1, S2, S3, D1[24], D2[24], D3[24], Z[24]);
ME_Ymux_Bit ym25 (S1, S2, S3, D1[25], D2[25], D3[25], Z[25]);
ME_Ymux_Bit ym26 (BS1, BS2, BS3, D1[26], D2[26], D3[26], Z[26]);
ME_Ymux_Bit ym27 (BS1, BS2, BS3, D1[27], D2[27], D3[27], Z[27]);
ME_Ymux_Bit ym28 (BS1, BS2, BS3, D1[28], D2[28], D3[28], Z[28]);
ME_Ymux_Bit ym29 (S1, S2, S3, D1[29], D2[29], D3[29], Z[29]);
ME_Ymux_Bit ym30 (BS1, BS2, BS3, D1[30], D2[30], D3[30], Z[30]);
ME_Ymux_Bit ym31 (BS1, BS2, BS3, D1[31], D2[31], D3[31], Z[31]);
ME_Ymux_Bit ym32 (BS1, BS2, BS3, D1[32], D2[32], D3[32], Z[32]);
ME_Ymux_Bit ym33 (BS1, BS2, BS3, D1[33], D2[33], D3[33], Z[33]);
ME_Ymux_Bit ym34 (BS1, BS2, BS3, D1[34], D2[34], D3[34], Z[34]);
ME_Ymux_Bit ym35 (BS1, BS2, BS3, D1[35], D2[35], D3[35], Z[35]);
ME_Ymux_Bit ym36 (BS1, BS2, BS3, D1[36], D2[36], D3[36], Z[36]);
ME_Ymux_Bit ym37 (BS1, BS2, BS3, D1[37], D2[37], D3[37], Z[37]);
ME_Ymux_Bit ym38 (BS1, BS2, BS3, D1[38], D2[38], D3[38], Z[38]);
ME_Ymux_Bit ym39 (BS1, BS2, BS3, D1[39], D2[39], D3[39], Z[39]);
ME_Ymux_Bit ym40 (BS1, BS2, BS3, D1[40], D2[40], D3[40], Z[40]);
ME_Ymux_Bit ym41 (BS1, BS2, BS3, D1[41], D2[41], D3[41], Z[41]);
ME_Ymux_Bit ym42 (BS1, BS2, BS3, D1[42], D2[42], D3[42], Z[42]);
ME_Ymux_Bit ym43 (BS1, BS2, BS3, D1[43], D2[43], D3[43], Z[43]);
ME_Ymux_Bit ym44 (BS1, BS2, BS3, D1[44], D2[44], D3[44], Z[44]);
ME_Ymux_Bit ym45 (BS1, BS2, BS3, D1[45], D2[45], D3[45], Z[45]);
ME_Ymux_Bit ym46 (BS1, BS2, BS3, D1[46], D2[46], D3[46], Z[46]);
ME_Ymux_Bit ym47 (BS1, BS2, BS3, D1[47], D2[47], D3[47], Z[47]);
ME_Ymux_Bit ym48 (BS1, BS2, BS3, D1[48], D2[48], D3[48], Z[48]);
ME_Ymux_Bit ym49 (BS1, BS2, BS3, D1[49], D2[49], D3[49], Z[49]);
ME_Ymux_Bit ym50 (BS1, BS2, BS3, D1[50], D2[50], D3[50], Z[50]);
ME_Ymux_Bit ym51 (BS1, BS2, BS3, D1[51], D2[51], D3[51], Z[51]);
ME_Ymux_Bit ym52 (BS1, BS2, BS3, D1[52], D2[52], D3[52], Z[52]);
ME_Ymux_Bit ym53 (BS1, BS2, BS3, D1[53], D2[53], D3[53], Z[53]);
ME_Ymux_Bit ym54 (BS1, BS2, BS3, D1[54], D2[54], D3[54], Z[54]);
ME_Ymux_Bit ym55 (BS1, BS2, BS3, D1[55], D2[55], D3[55], Z[55]);

endmodule


// special purpose register used for fpu queue

module ME_FREGA_2_55 ( clk, a, b, c, d0, d1, Q ) ;
   input clk, a, b, c;
   input  [54:0] d0, d1;
   output [54:0] Q;


   reg [54:0] mux_outputx;

   wire enable_low;
   wire hold;
   wire sel;

   ME_O2A1 iu_hold_gate_1 (.a(a), .b(b), .c(c), .z(hold) );
   ME_NOR2_D iu_hold_gate_2 (.a(a), .b(b), .z(sel) );


   always @ (sel or d0 or d1)
       case (sel)
 		1'b0: mux_outputx[54:0] = d0[54:0];
 		1'b1: mux_outputx[54:0] = d1[54:0];
		default mux_outputx = 'bx;
       endcase


//   assign enable_low = ~hold; 
   Mflipflop_32 f0 (.out(Q[31:0]),  .din(mux_outputx[31:0]),  .clock(clk), .enable_l(hold) );
   Mflipflop_8  f1 (.out(Q[39:32]), .din(mux_outputx[39:32]), .clock(clk), .enable_l(hold) );
   Mflipflop_8  f2 (.out(Q[47:40]), .din(mux_outputx[47:40]), .clock(clk), .enable_l(hold) );
   Mflipflop_4  f3 (.out(Q[51:48]), .din(mux_outputx[51:48]), .clock(clk), .enable_l(hold) );
   Mflipflop_3  f4 (.out(Q[54:52]), .din(mux_outputx[54:52]), .clock(clk), .enable_l(hold) );

endmodule

module FREG_2byte ( clk, E, notA, A, d0, d1, Q ) ;
   input clk, notA, A, E;
   input  [7:0] d0, d1;
   output [7:0] Q;


   reg [7:0] mux_output1; 
   wire enable_low;

   always @ (A or d0 or d1)
       case (A)
 		0: mux_output1 = d0;
 		1: mux_output1 = d1;
		default mux_output1 = 'bx;
       endcase
   
   assign enable_low = ~E;
   Mflipflop_8 f0 (.out(Q), .din(mux_output1), .clock(clk), .enable_l(enable_low) );


endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)sc.v
***
****************************************************************************
****************************************************************************/

// ******************************************

//
//	Power Clip Cells
//

module N1Z000( O );     // 0 Clip /
    output  O;
assign O = 1'b0;
endmodule


module N1Z001( O );     // 1 Clip /
    output  O;
assign O = 1'b1;
endmodule

// 1-bit Half Adder
module JHAD1A(A, B, S, CO);
input   A;
input   B;
output  S;
output  CO;
xor g0(S, A, B);
and g1(CO, A, B);
endmodule

// 1-bit Full Adder
module JFAD1A(A, B, CI, S, CO);
input   A;
input   B;
input   CI;
output  S;
output  CO;
xor g0(S, A, B, CI);
and g1(w3, A, B);
or g2(w8, A, B);
and g3(w6, CI, w8);
or g4(CO, w3, w6);
endmodule

// Power Buffer
module JBUFC(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Double Power Buffer
module JBUFD(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Standard Inverter
module JINVA(A, O);
input   A;           // this is the input
output  O;
not g0(O, A);
endmodule

// Power Inverter
module JINVB(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Inverter
module JINVC(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Triple Power Inverter
module JINVD(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// 2-2 AOI
module JD22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
nor g2(O, w0, w3);
endmodule

// 2-2-2 AOI
module JD222A(A1, A2, B1, B2, C1, C2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
nor g3(O, w0, w3, w6);
endmodule

// 2-2 AO
module JDB22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
or g2(O, w0, w3);
endmodule

// Non-inverting 2:1 Mux
module AMUX2A(A, B, S, O);
input   A;
input   B;
input   S;
output  O;
wire w1_;

UDP_MUX21 udp_mux(w1_, A,B, S);
not	  g1(O, w1_);
endmodule

// 2-input Exclusive OR
module JXOR2A(A1, A2, O);
input   A1;
input   A2;
output  O;
xor g0(O, A1, A2);
endmodule

// Power 2-input Exclusive OR
module JXOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
xor g0(O, A1, A2);
endmodule

// 3-input Exclusive OR
module JXOR3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xor g0(O, A1, A2, A3);
endmodule

// Power 2-input Exclusive NOR
module JXNOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
xnor g0(O, A1, A2);
endmodule

// 1-bit D Flip-Flop  with scan and hold
module ASFFHA(D, CK, H, SM, SI, Q, XQ, SO);
input   D;
input   CK;
input   H;
input   SM;
input   SI;
output  Q;
output  XQ;
output  SO;
and g0(w1, H, IQ);
not g1(w5, H);
and g2(w4, w5, D);
or g3(w0, w1, w4);
fj_dff_e_muxscan    g4(IQ, w0, SI, SM, CK);
buf g5(Q, IQ);
not g6(XQ, IQ);
buf g7(SO, IQ);
endmodule
// 2:1 Selector
module JMUX2A(A, B, S, O);
input   A;
input   B;
input   S;
output  O;
UDP_MUX21 udp_mux(O, A,B, S);

endmodule

// 4:1 Selector
module AMUX4A(I1, I2, I3, I4, S0, S1, O);
input   I1;
input   I2;
input   I3;
input   I4;
input   S0;
input   S1;
output  O;
not g0(w2, S0);
not g1(w3, S1);
and g2(w0, I1, w2, w3);
not g3(w7, S1);
and g4(w4, I2, S0, w7);
not g5(w10, S0);
and g6(w8, I3, w10, S1);
and g7(w12, I4, S0, S1);
or g8(O, w0, w4, w8, w12);
endmodule
// Double Power 8-Input NOR Gate
module JNOR8C(A1, A2, A3, A4, A5, A6, A7, A8, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
input   A7;
input   A8;
output  O;
nor g0(O, A1, A2, A3, A4, A5, A6, A7, A8);
endmodule

// 1-bit D Flip-Flop
module JDFFA(D, CK, Q, XQ);
input   D;
input   CK;
output  Q;
output  XQ;
fj_dff_e    g0(IQ, D, CK);
buf g1(Q, IQ);
not g2(XQ, IQ);
endmodule

// 1-2 OAI
module JG12A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
or g0(w0, A1, A2);
nand g1(O, w0, B);
endmodule

// Power 2-Input AND Gate
module JAND2B(A1, A2, O);
input   A1;
input   A2;
output  O;
and g0(O, A1, A2);
endmodule

// Power 3-Input AND Gate
module JAND3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
and g0(O, A1, A2, A3);
endmodule

// Power 4-Input AND Gate
module JAND4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
and g0(O, A1, A2, A3, A4);
endmodule

// Power 8-Input AND Gate
module JAND8B(A1, A2, A3, A4, A5, A6, A7, A8, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
input   A7;
input   A8;
output  O;
and g0(O, A1, A2, A3, A4, A5, A6, A7, A8);
endmodule

// 2-Input NAND Gate
module JNAND2A(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Power 2-Input NAND Gate
module JNAND2B(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// 3-Input NAND Gate
module JNAND3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nand g0(O, A1, A2, A3);
endmodule

// Power 3-Input NAND Gate
module JNAND3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nand g0(O, A1, A2, A3);
endmodule

// 4-Input NAND Gate
module JNAND4A(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nand g0(O, A1, A2, A3, A4);
endmodule

// Double Power 6-Input NAND Gate
module JNAND6C(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
nand g0(O, A1, A2, A3, A4, A5, A6);
endmodule

// Double Power 8-Input NAND Gate
module JNAND8C(A1, A2, A3, A4, A5, A6, A7, A8, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
input   A7;
input   A8;
output  O;
nand g0(O, A1, A2, A3, A4, A5, A6, A7, A8);
endmodule


// Power 2-Input OR Gate
module JOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
or g0(O, A1, A2);
endmodule

// Power 3-Input OR Gate
module JOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
or g0(O, A1, A2, A3);
endmodule

// Power 4-Input OR Gate
module JOR4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
or g0(O, A1, A2, A3, A4);
endmodule

// Double Power 8-Input OR Gate
module JOR8B(A1, A2, A3, A4, A5, A6, A7, A8, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
input   A7;
input   A8;
output  O;
or g0(O, A1, A2, A3, A4, A5, A6, A7, A8);
endmodule

// 2-Input NOR Gate
module JNOR2A(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Power 2-Input NOR Gate
module JNOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// 3-Input NOR Gate
module JNOR3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Power 4-Input NOR Gate
module JNOR4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Double Power 2-Input NOR Gate
module JNOR2C(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Double Power 3-Input NOR Gate
module JNOR3C(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule




/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)fpuassign.v	1.1  4/7/92
//
`define NoSlices      	4
`define BitsInFracSN    24
`define BitsInFracDB    53
`define FracWidth      	58         	/* `BitsInFracDB + 7 */
`define FracWidthM1     57
`define FracWidthM3     55         	/* `BitsInFracDB + 7 */
`define FracMSB         57         	/* `FracWidth - 1 */
`define FracMSBM1       56         	/* `FracWidth - 2 */
`define FracMSBM3Pos    55'h20_0000_0000_0000
`define FracMSBM3Mask   55'h100_0000_0000_0000
`define FracMSBM5Pos    53'h40_0000_0000_0000
`define ExpWidth      	13
`define ExpWidthM3      10
`define ExpWidthM4      9
`define ExpWidthM8      5
`define ExpWidthM11     2
`define ExpMSB          12      	/* ExpWidth - 1 */
`define ExpFPMSBSN      7
`define ExpFPMSBDB      10
`define NoMwords        256
`define FPMSBP1         56
`define FPMSB           55   		/* (`BitsInFracDB - 1) + 5 */
`define FPMSBM1         54   		/* (`BitsInFracDB - 1) + 5 */
`define FPLSBSN         32   		/* `FPMSB - (`BitsInFracSN - 1) */
`define FPLSBDB         3   		/* FPMSB - (`BitsInFracDB - 1) */
`define NoOfBitsAboveMSB 2
`define NormMSB         16
`define SN         	0
`define DB         	1
`define MIAddrWidth     8 		/* fb_field_width */
`define MIMSB          	7 		/* MIAddrWidth -1 */
`define MIptrWidth      8 		/* MIAddrWidth */
`define MIptrMSB      	7 		/* MIptrWidth - 1 */
`define MulCarry      	1
`define MulSticky      	0
`define NoSlices      	4
`define MultipLSBDBM1   1
`define MultipLSBDB  	0
`define MultipMSBDB     8
`define MultipLSBSN     32
`define MultipMSBSN     40

// follows define list of frac module line 2450
`define start_rom_outputs 0
`define start_control_fields 0
`define start_micontrol_field 0
`define u_MIptrFromInstructionN 0
`define u_MIptrFromInstructionB 1
`define u_NullifyOnBranchOr 2
`define end_micontrol_field 2
`define fb_field_width 8
`define start_fb_field 3
`define end_fb_field 10
`define u_start_fb_field 3
`define u_end_fb_field 10
`define condition_field_width 5
`define start_condition_field 11
`define fbandcondwidth 13
`define end_condition_field 15
`define u_Cond_LengthSingle 1
`define u_Cond_SignsDiffer 2
`define u_Cond_ExpResultNegative 3
`define u_Cond_ExpAregOdd 4
`define u_Cond_SignAregNegative 5
`define u_Cond_RoundMinus 6
`define u_Cond_MonadicException 7
`define u_Cond_notFracResultZero 8
`define u_Cond_FracResultZero 9
`define u_Cond_FracOverflow 10
`define u_Cond_FracResultNegative 11
`define u_Cond_ExpResultZero 12
`define u_Cond_notFracAregSignaling 13
`define u_Cond_TrueForSubSignsCase 14
`define u_Cond_notRoundingCondition 15
`define start_swap_control_field 16
`define u_PreventSwapIfBgtA 16
`define end_swap_control_field 16
`define start_control_field 17
`define u_OprExc 17
`define end_control_field 17
`define start_shifter_field 18
`define u_LeftnotRight 18
`define u_ShiftForInt 19
`define u_ShiftBy8 20
`define u_ShiftForAlign 21
`define end_shifter_field 21
`define end_control_fields 21
`define width_control_fields 22
`define start_status_field 22
`define u_status0 22
`define u_status1 23
`define u_status2 24
`define u_status3 25
`define u_Unimplemented 26
`define end_status_field 26
`define start_exp_field 27
`define start_exp_result_field 27
`define u_ExpALUOpSub 27
`define u_ExpALUCin 27
`define u_ExpALUCinFromRound 28
`define start_exp_xbus_field 29
`define u_ExpXbusFromFunc0 29
`define u_ExpXbusFromFunc1 30
`define end_exp_xbus_field 30
`define start_exp_ybus_field 31
`define u_ExpYbusFromFunc0 31
`define u_ExpYbusFromFunc1 32
`define end_exp_ybus_field 32
`define start_constant_field 33
`define u_ConstantFromFunc0 33
`define u_ConstantFromFunc1 34
`define end_constant_field 34
`define end_exp_result_field 34
`define start_exp_areg_field 35
`define u_ExpAregFromFunc0 35
`define u_ExpAregFromFunc1 36
`define end_exp_areg_field 36
`define start_exp_breg_field 37
`define u_ExpBregFromFunc0 37
`define u_ExpBregFromFunc1 38
`define end_exp_breg_field 38
`define start_sign_field 39
`define u_SignResultFromFunction0 39
`define u_SignResultFromFunction1 40
`define u_SignAregFromResult 41
`define u_SetRoundingModeToMinus 42
`define u_ToggleLength 43
`define end_sign_field 43
`define end_exp_field 43
`define start_frac_field 44
`define start_frac_result_field 44
`define start_frac_alu_field 44
`define u_FracALUOpSub 44
`define end_frac_alu_field 44
`define start_frac_xbus_field 45
`define u_FracXbusFromDest0 45
`define u_FracXbusFromDest1 46
`define u_FracXbusFromDest2 47
`define end_frac_xbus_field 47
`define start_frac_ybus_field 48
`define u_FracYbusOrSticky 48
`define u_FracYbusFromAregSR1 49
`define u_FracYbusFromAreg 50
`define u_FracYbusFromTreg 51
`define u_FracYbusFromFunc0 52
`define u_FracYbusFromFunc1 53
`define u_FracYbusFromFunc2 54
`define u_FracALUOpForDivOrSQRTStep 55
`define end_frac_ybus_field 55
`define end_frac_result_field 55
`define start_frac_areg_field 56
`define u_FracAregFromFunc0 56
`define u_FracAregFromFunc1 57
`define u_FracAregFromFunc2 58
`define end_frac_areg_field 58
`define start_frac_breg_field 59
`define u_FracBregFromFunc0 59
`define u_FracBregFromFunc1 60
`define end_frac_breg_field 60
`define start_frac_creg_field 61
`define u_FracCregFromFunc0 61
`define u_FracCregFromFunc1 62
`define end_frac_creg_field 62
`define start_frac_treg_field 63
`define u_FracTregFromResult 63
`define u_ResetMul 63
`define end_frac_treg_field 63
`define end_frac_field 63
`define no_of_rom_outputs 64
`define RomWidthM1 63
`define RomWidth 64


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)fpufpc_2.0.v	1.17  4/15/93
//
// **************************************************************
// High Level model of FPU/FPC
//
// This module is the top level module for the FPU/FPC.  It defines
// the interface signals and instantiates the following seven modules:
// 
// 	fp_fpc, fp_rf, fp_ctl, fp_exp, fp_frac, fp_rom
//
// **************************************************************
/* 
module  fpufpc (ss_clock, ss_reset, ld_fpu_w, inst_for_int,
		iu_epc, hld_dirreg, ext_valid_decode, fold_annul_e,
		ext_flush, ext_hold, ext_hold1, ext_fxack, ext_fhold,
		ext_fexc, ext_fcc, ext_fccv, fhold_d1, fhold_fqfull_d1,
		fload_wait_w, fp_dout_e,
		fp_fpc_scan_in, fprf_scan_out, ss_scan_mode );

input [63:0] ld_fpu_w;		// Data-cache output bus
input [31:0] inst_for_int;	// Input to D-stage instruction register
input [31:2] iu_epc;		// tap from IU E-stage pc (30-bits)
input   ss_clock;		// Floating pt. unit clock inputs
input	ss_reset,		// Floating pt. unit reset input
	hld_dirreg,		// inverted load signal for decode register
	ext_valid_decode,	// Valid instr in decode
	fold_annul_e,		// inst in E is annuled
	ext_flush;		// FPU flush (IU trap)

input [2:0] ext_hold;		// IU pipeline held (frozen) from mhold, etc.

input	ext_hold1,		// duplicate of ext_hold
	ext_fxack,		// Floating pt. exception acknowledge
	fp_fpc_scan_in,		// scan data input
	ss_scan_mode;		// scan enable

output	ext_fhold,		// Floating point hold (interlocks the IU)
	ext_fexc;		// Floating point exception signal
output [1:0] ext_fcc;		// Floating point condition codes
output	ext_fccv,		// Floating point condition codes valid
	fhold_d1,		// delayed ext_fhold used by perf counter
	fhold_fqfull_d1,	// delayed fq_full used by perf counter
	fload_wait_w;		// FPop is currently executing, and may trap
output [63:0] fp_dout_e;	// Data Out Bus
output	fprf_scan_out;	// scan data output


	// FPP Operand & Result busses, reg file input/output busses, 
wire [54:3] FracResult ;
wire [10:0] ExpResult ;
wire	SignResult, SNnotDB ;
wire [63:0] fprf_dout1, fprf_dout2, fprf_dout3, fprf_din ;

	// input data (from Data-cache) for the FSR register
wire [18:0] fsr_data_in = {ld_fpu_w[31:30], ld_fpu_w[27:23], ld_fpu_w[11:0]} ;

	// FPP status: cond. codes and exception bits
wire [1:0]  ConditionCodes;
wire [5:0]  Excep;
wire fpm_inx, fpm_unfin ;


	// Reg file read and write addresses, and control
wire [3:0]  fprf_ra1;
wire [3:0]  fprf_ra2;
wire [3:0]  fprf_ra3;
wire [3:0]  fprf_wa;
wire [5:0]  fprf_byp1, fprf_byp2, fprf_byp3;
wire [1:0]  fprf_algn1, fprf_algn2;
wire [1:0]  fprf_hold_din;
wire [1:0]  fprf_we;

	// FP instruction and rounding mode bits for Meiko core
wire [9:0] FpInst;
wire [1:0] RoundingMode;

	// exception status from Meiko core
wire [7:0]  fpstat = {ConditionCodes, Excep};


	// Datapath and FPP control signals
wire fpm_start, fpp_fop, fpp_ld, fpp_reset ;
wire [1:0] res_select, fpm_inst ;
wire rfin_select ;

wire FpBusyPhi2;	// FPP status signal (busy)

			// scan signals
wire fp_fpc_scan_in, fp_fpc_scan_out;
wire fprf_scan_out, fp_fpm_scan_out, fp_rom_scan_out;
wire fp_exp_scan_out, fp_ctl_scan_out, fp_frac_scan_out;


	// Floating Point Control unit module instance
fp_fpc fpfpc (.ss_clock(ss_clock), .ss_reset(ss_reset),
		.ext_valid_decode(ext_valid_decode),
		.fold_annul_e(fold_annul_e),
		.ext_flush(ext_flush), .ext_hold(ext_hold[2:0]),
		.ext_fxack(ext_fxack),
		.hld_dirreg(hld_dirreg), .FpBusyPhi2(FpBusyPhi2),
		.fpm_inx(fpm_inx), .fpm_unfin(fpm_unfin),
		.fpstat(fpstat), .fsr_data_in(fsr_data_in),
		.inst_for_int(inst_for_int), .iu_epc(iu_epc),
		.fprf_dout3(fprf_dout3), .fp_dout_e(fp_dout_e),
		.FpInst(FpInst), .fpm_inst(fpm_inst),
		.RoundingMode(RoundingMode),.ext_fcc(ext_fcc),
		.ext_fhold(ext_fhold), .fpm_start(fpm_start),
		.fpp_fop(fpp_fop),
		.fpp_ld(fpp_ld), .fpp_reset(fpp_reset), .ext_fexc(ext_fexc),
		.fhold_d1(fhold_d1), .fhold_fqfull_d1(fhold_fqfull_d1),
		.res_select(res_select), .rfin_select(rfin_select),
		.fprf_wa(fprf_wa), .fprf_ra1(fprf_ra1), .fprf_ra2(fprf_ra2),
		.fprf_ra3(fprf_ra3), .fprf_hold_din(fprf_hold_din),
		.fprf_we(fprf_we),
		.fprf_byp1(fprf_byp1), .fprf_byp2(fprf_byp2),
		.fprf_byp3(fprf_byp3), .fprf_algn1(fprf_algn1),
		.fprf_algn2(fprf_algn2), .ext_fccv(ext_fccv),
		.fload_wait_w(fload_wait_w),
		.ss_scan_mode(ss_scan_mode),
		.fp_fpc_scan_in(fp_fpc_scan_in),
		.fp_fpc_scan_out(fp_fpc_scan_out) );


	// FPU Register File module instance
fp_rf fprf (.ss_clock(ss_clock), .ss_scan_mode(ss_scan_mode),
	.fp_scan_in(fp_fpm_scan_out),
	.hold_din(fprf_hold_din), .fp_hold_ra3(ext_hold1),
	.fp_we(fprf_we),
	.fp_algn1(fprf_algn1), .fp_algn2(fprf_algn2),
	.fp_byp1(fprf_byp1), .fp_byp2(fprf_byp2), .fp_byp3(fprf_byp3),
	.fp_wa(fprf_wa), .fp_ra1(fprf_ra1), .fp_ra2(fprf_ra2),
	.fp_ra3(fprf_ra3),
	.fp_din(fprf_din), .fp_dout1(fprf_dout1), .fp_dout2(fprf_dout2),
	.fp_dout3(fprf_dout3), .fp_scan_out(fprf_scan_out) );


	// **********************************************************
	// all modules below this line are part of the Meiko FPU core
	// **********************************************************
//-----------------------------------------------------------------------------



wire FpOp, FpLd, Reset, FpBusy;

assign FpOp = fpp_fop ;
assign FpLd = fpp_ld ;
assign Reset = fpp_reset ;
assign FpBusyPhi2 = FpBusy ;
*/

	// This module header is used when testing the FPU core by itself.

//  Meiko FPU top-level interconnect module
//
//  This interconnect module was produced by Synopsys grouping and then edited
//  by hand () to remove hierarchy from signal names and make
//  things more readable.

// * ***********************

module FPU ( ss_clock, FpInst, FpOp, FpLd, Reset,
	     fprf_dout1, fprf_dout2, RoundingMode,
	     FpBusy, FracResult, ExpResult, SignResult, SNnotDB,
	     Excep, ConditionCodes,
	     ss_scan_mode, fp_ctl_scan_in, fp_ctl_scan_out );

input  ss_clock, FpOp, FpLd, Reset, ss_scan_mode, fp_ctl_scan_in;


input  [9:0] FpInst;
output [1:0] ConditionCodes;
input  [63:0] fprf_dout1;
input  [63:0] fprf_dout2;
output [5:0] Excep;
input  [1:0] RoundingMode;
output [54:3] FracResult;
output [10:0] ExpResult;


output FpBusy, SignResult, SNnotDB, fp_ctl_scan_out;

// ************************** */


wire FracAregLoadEn, FracBregLoadEn, FracCregLoadEn, FracCregLC,
	FracTregLoadEn, SROneMore, SRToSticky, notStickyInForSR,
	InitialMulStep, InitialCarryBit, SumCarryLoadEn, SumOut0,
	CarryOut0, CarryOut3, RomOutputs_18, RomOutputs_55, notFracYFromD1A,
	notFracYFromD2A, notFracYFromD3A, notSticky1, FracBregSign,
	BregFPMSBM1, notAM31_3, notAM2_0, StickyForSR1, AregMaster_32,
	notAregMasterFPMSBP1, CALSB, CBLSB, CCLSB, notFracZero, FracZero,
	FracAgtB, SubResultNorm, Conditionals_10, notPossibleOv, notNO_1,
	RomOutputs_20, ExpAregLoadEn, ExpAregLC0, ExpAregLC1, ExpBregLoadEn,
	ExpBregLC0, ExpBregLC1, RomOutputs_27, CarryIn, Constantb, Constantc,
	Constantd, Constante, Constantf, Constantg, Constanth, Conditionals_12,
	Conditionals_3, notAInfNAN, notAZeroDenorm, notBInfNAN, notBZeroDenorm,
	notExpUnderflow, notExpOverflow, notExpException, OprSNnotDB ;

wire [2:0] FracAregLC ;
wire [2:0] FracBregLC ;
wire [1:0] FracYbusLSBs ;
wire [1:0] InFromCregOr0 ;
wire [1:0] InForCreg ;
wire [1:0] InForCregDB ;
wire [32:29] RomOutputs_32_29 ;
wire [46:44] RomOutputs_46_44 ;
wire [4:0] FracRound ;
wire [3:0] SRControl ;
wire [3:0] SLControl ;
wire [2:0] LIB ;
wire [8:0] TopBitsIn ;
wire [3:0] Shift ;
wire [3:0] Pos ;
wire [3:0] Zero ;
wire [4:0] MulLenSel ;
wire [3:0] notSticky4 ;
wire [1:0] Sticky2 ;
wire [1:0] StickyExtra ;
wire [1:0] CregSNBits ;
wire [1:0] CregInSL2SQRT ;
wire [8:0] notMultip ;
wire [57:40] AregMaster_57_40 ;
wire [7:0] AregMaster_7_0 ;
wire [1:0] TregLSBs ;
wire [2:0] SumInLSBs ;
wire [2:0] CarryInLSBs ;
wire [1:0] SALSBs ;
wire [1:0] SBLSBs ;
wire [1:0] SCLSBs ;
wire [3:0] StepRemBits ;
wire [3:1] notsh ;
wire [7:0] ExpIn ;
wire [12:0] notExpShiftResult ;
wire [7:0] SelectedMIptr ;
wire [63:0] U_RomOutputs ;

	// Meiko FPU core control logic

    fp_ctl fpctl ( .ss_clock (ss_clock), .AregMaster_32 (AregMaster_32),
	.BregFPMSBM1 (BregFPMSBM1), .CALSB (CALSB), .CBLSB (CBLSB),
	.CCLSB (CCLSB), .Conditionals_3 (Conditionals_3),
	.Conditionals_10 (Conditionals_10), .Conditionals_12 (Conditionals_12),
	.FpLd (FpLd), .FpOp (FpOp), .FracAgtB (FracAgtB),
	.FracBregSign (FracBregSign), .FracZero (FracZero),
	.notAInfNAN (notAInfNAN), .notAM31_3 (notAM31_3),
	.notAM2_0 (notAM2_0), .notAregMasterFPMSBP1 (notAregMasterFPMSBP1),
	.notAZeroDenorm (notAZeroDenorm), .notBInfNAN (notBInfNAN),
	.notBZeroDenorm (notBZeroDenorm), .notExpUnderflow (notExpUnderflow),
	.notExpOverflow (notExpOverflow), .notExpException (notExpException),
	.notPossibleOv (notPossibleOv), .notFracZero (notFracZero),
	.notSticky1 (notSticky1), .ResetIn (Reset), .RS2_63 (fprf_dout2[63] ),
	.RS1_63 (fprf_dout1[63] ), .StickyForSR1 (StickyForSR1),
	.SubResultNorm (SubResultNorm), .AregMaster_57_40 (AregMaster_57_40),
	.AregMaster_7_0 (AregMaster_7_0), .CarryInLSBs (CarryInLSBs),
	.CregInSL2SQRT (CregInSL2SQRT), .CregSNBits (CregSNBits),
	.ExpIn (ExpIn), .FpInst (FpInst),
	.notExpShiftResult (notExpShiftResult), .notMultip (notMultip),
	.notSticky4 (notSticky4), .RoundingMode (RoundingMode),
	.SALSBs (SALSBs), .SBLSBs (SBLSBs), .SCLSBs (SCLSBs),
	.StepRemBits (StepRemBits), .Sticky2 (Sticky2),
	.StickyExtra (StickyExtra), .SumInLSBs (SumInLSBs),
	.TregLSBs (TregLSBs), .U_RomOutputs (U_RomOutputs ),
	.CarryIn (CarryIn), .CarryOut0 (CarryOut0), .CarryOut3 (CarryOut3),
	.Constantb (Constantb), .Constantc (Constantc), .Constantd (Constantd),
	.Constante (Constante), .Constantf (Constantf), .Constantg (Constantg),
	.Constanth (Constanth), .ExpAregLC0 (ExpAregLC0),
	.ExpAregLC1 (ExpAregLC1), .ExpAregLoadEn (ExpAregLoadEn),
	.ExpBregLC0 (ExpBregLC0), .ExpBregLC1 (ExpBregLC1),
	.ExpBregLoadEn (ExpBregLoadEn), .FracAregLoadEn (FracAregLoadEn),
	.FracBregLoadEn (FracBregLoadEn), .FracCregLC (FracCregLC),
	.FracCregLoadEn (FracCregLoadEn), .FracTregLoadEn (FracTregLoadEn),
	.FpBusy (FpBusy), .InitialCarryBit (InitialCarryBit),
	.InitialMulStep (InitialMulStep), .notFracYFromD1A (notFracYFromD1A),
	.notFracYFromD2A (notFracYFromD2A), .notFracYFromD3A (notFracYFromD3A),
	.notNO_1 (notNO_1), .notStickyInForSR (notStickyInForSR),
	.OprSNnotDB (OprSNnotDB), .RomOutputs_18 (RomOutputs_18),
	.RomOutputs_20 (RomOutputs_20), .RomOutputs_27 (RomOutputs_27),
	.RomOutputs_55 (RomOutputs_55), .SignResult (SignResult),
	.SNnotDB (SNnotDB), .SROneMore (SROneMore), .SRToSticky (SRToSticky),
	.SumCarryLoadEn (SumCarryLoadEn), .SumOut0 (SumOut0),
	.ConditionCodes (ConditionCodes), .Excep (Excep),
	.FracAregLC (FracAregLC), .FracBregLC (FracBregLC),
	.FracRound (FracRound), .FracYbusLSBs (FracYbusLSBs),
	.InForCreg (InForCreg), .InForCregDB (InForCregDB),
	.InFromCregOr0 (InFromCregOr0), .LIB (LIB), .MulLenSel (MulLenSel),
	.notsh (notsh), .Pos (Pos), .RomOutputs_32_29 (RomOutputs_32_29),
	.RomOutputs_46_44 (RomOutputs_46_44), .SelectedMIptr(SelectedMIptr ),
	.Shift (Shift), .SRControl (SRControl), .TopBitsIn (TopBitsIn),
	.Zero (Zero),
	.ss_scan_mode (ss_scan_mode),
	.fp_ctl_scan_in (fp_exp_scan_out),
	.fp_ctl_scan_out (fp_ctl_scan_out)  );

	// Instance of the ROM Megacell
fp_rom fprom ( .ss_clock(ss_clock),
		.rom_adr(SelectedMIptr),
		.rom_dout(U_RomOutputs),
		.rom_scan_out(fp_rom_scan_out),
		.rom_scan_in(fp_ctl_scan_out),
		.ss_scan_mode(ss_scan_mode) );

	// exponent datapath

    fp_exp fpexp  ( .ss_clock (ss_clock ), .SNnotDB (SNnotDB ),
	.OprSNnotDB (OprSNnotDB ), .RS2_exp (fprf_dout2[62:52] ),
	.RS1_exp (fprf_dout1[62:52] ), .FracAregForInt (AregMaster_57_40[54:47] ),
	.notSLFromNorm ({notNO_1, notsh[3:1]} ), .ShiftBy8 (RomOutputs_20 ),
	.ExpAregLoadEn (ExpAregLoadEn ), .ExpAregLC0 (ExpAregLC0 ),
	.ExpAregLC1 (ExpAregLC1 ), .ExpBregLoadEn (ExpBregLoadEn ),
	.ExpBregLC0 (ExpBregLC0 ), .ExpBregLC1 (ExpBregLC1 ),
	.ExpXCtl0 (RomOutputs_32_29[29] ), .ExpXCtl1 (RomOutputs_32_29[30] ),
	.ExpYCtl0 (RomOutputs_32_29[31] ), .ExpYCtl1 (RomOutputs_32_29[32] ),
	.Sub(RomOutputs_27 ), .CarryIn (CarryIn ), .Constantb (Constantb ),
	.Constantc (Constantc ), .Constantd (Constantd ),
	.Constante (Constante ), .Constantf (Constantf ),
	.Constantg (Constantg ), .Constanth (Constanth ),
	.AregMasterBufOut (ExpIn ), .ExpResultBuf (ExpResult ),
	.notExpShiftResult (notExpShiftResult[12:0] ),
	.ExpZero (Conditionals_12 ), .ExpResult_12 (Conditionals_3 ),
	.SLControl (SLControl ), .notAInfNaN (notAInfNAN ),
	.notAZeroDenorm (notAZeroDenorm ), .notBInfNaN (notBInfNAN ),
	.notBZeroDenorm (notBZeroDenorm ), .notUnderflow (notExpUnderflow ),
	.notOverflow (notExpOverflow ), .notExpException (notExpException ),
	.ss_scan_mode (ss_scan_mode),
	.fp_exp_scan_in (fp_fpc_scan_out),
	.fp_exp_scan_out (fp_exp_scan_out)  );

	// fraction datapath

    fp_frac fpfrac (.ss_clock (ss_clock ), .FracAregLoadEn (FracAregLoadEn),
	.FracAregLC (FracAregLC ), .FracBregLoadEn (FracBregLoadEn ),
	.FracBregLC (FracBregLC ), .FracCregLoadEn (FracCregLoadEn ),
	.FracCregLC (FracCregLC ), .FracTregLoadEn (FracTregLoadEn ),
	.FracYbusLSBs (FracYbusLSBs ), .InFromCregOr0 (InFromCregOr0 ),
	.InForCreg (InForCreg ), .InForCregDB (InForCregDB ),
	.Constantb (RomOutputs_46_44[45] ), .Constantd (FracRound[4] ),
	.Constante (FracRound[3] ), .Constantf (FracRound[2] ),
	.Constantg (FracRound[1] ), .Constanth (FracRound[0] ),
	.RS2_frac (fprf_dout2[54:0] ), .RS1_frac (fprf_dout1[54:0] ),
	.SNnotDB (SNnotDB ), .OprSNnotDB(OprSNnotDB), .SRControl (SRControl ),
	.SROneMore (SROneMore ), .SRToSticky (SRToSticky ),
	.SLControl (SLControl ), .LIB (LIB ), .TopBitsIn (TopBitsIn ),
	.notStickyInForSR (notStickyInForSR ), .Shift (Shift ),
	.Pos (Pos ), .Zero (Zero ), .InitialMulStep (InitialMulStep ),
        .InitialCarryBit (InitialCarryBit ),
	.SumCarryLoadEn (SumCarryLoadEn ), .MulLenSel (MulLenSel ),
	.SumOut0 (SumOut0 ), .CarryOut0 (CarryOut0 ), .CarryOut3 (CarryOut3 ),
	.LeftnotRight (RomOutputs_18 ), .FracALUOpSub (RomOutputs_46_44[44] ),
        .FracALUOpDiv (RomOutputs_55 ), .notFracYFromD1 (notFracYFromD1A ),
	.notFracYFromD2 (notFracYFromD2A ), .notFracYFromD3 (notFracYFromD3A),
	.FracXFromB (RomOutputs_46_44[46] ), .notSticky4 (notSticky4 ),
	.Sticky2 (Sticky2 ), .notSticky1 (notSticky1 ),
	.StickyExtra (StickyExtra ), .Creg_30_29 (CregSNBits ),
	.Creg_56_55 (CregInSL2SQRT ), .BregMaster_57 (FracBregSign ),
        .BregMaster_54 (BregFPMSBM1 ), .notMultip (notMultip ),
        .notAM31_3 (notAM31_3 ), .notAM2_0 (notAM2_0 ),
        .StickyForSR1 (StickyForSR1 ),
	.AregMaster_57_40 (AregMaster_57_40[57:40] ),
	.AregMaster_32 (AregMaster_32 ),
	.AregMaster_7_0 (AregMaster_7_0[7:0] ),
	.notAregMasterFPMSBP1 (notAregMasterFPMSBP1 ),
	.Treg_1_0 (TregLSBs ), .SumInLSBs (SumInLSBs ),
	.CarryInLSBs (CarryInLSBs ), .SALSBs (SALSBs ), .SBLSBs (SBLSBs ),
	.SCLSBs (SCLSBs ), .CALSB (CALSB ), .CBLSB (CBLSB ), .CCLSB (CCLSB ),
	.notFracZero (notFracZero ), .FracZero (FracZero ),
	.FracResult_57 (FracAgtB ), .SubResultNorm (SubResultNorm ),
	.FracResult_56 (Conditionals_10 ),
	.FracResult_55_52 (StepRemBits ), .notPossibleOv (notPossibleOv ),
	.FracResultBufout (FracResult ),
	.ss_scan_mode (ss_scan_mode),
	.fp_frac_scan_in (fp_rom_scan_out),
	.fp_frac_scan_out (fp_frac_scan_out)  );

/*
    fp_fpm fpfpm (.fprf_din( fprf_din[63:0] ),
	.fpm_inx(fpm_inx), .fpm_unfin(fpm_unfin),
	.fprf_dout1( fprf_dout1[63:0] ), .fprf_dout2( fprf_dout2[63:0] ),
	.ld_fpu_w( ld_fpu_w[63:0] ),
	.FracResult( FracResult[54:3] ),
	.ExpResult( ExpResult[10:0] ),
	.SignResult(SignResult),
	.fpm_inst( fpm_inst[1:0] ),
	.rnd_mode( RoundingMode[1:0] ),
	.res_select( res_select[1:0] ),
	.rfin_select(rfin_select),
	.fpm_start(fpm_start),
	.ss_clock(ss_clock),
	.ss_scan_mode (ss_scan_mode),
	.fp_fpm_scan_in(fp_frac_scan_out),
	.fp_fpm_scan_out(fp_fpm_scan_out) );

// Added spare cells 

        spares  fpufpc_spares ();
*/
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)areginexact.v	1.1  4/7/92
//
module AregInexact (RomInexactRound, SNnotDB, 
                    AMCBit, AM32, AM3, notAM31_3, notAM2_0,
                    Inexact);
input RomInexactRound;
input SNnotDB;
input AMCBit, AM32, AM3, notAM31_3, notAM2_0;
output Inexact;

//Inexact = (AM[0:2] != 0) or (SNnotDB and ((AM[32] & AMCbit) or AM[31:3]))
//                         or (DBnotSN and ((AM[3] & AMCbit)))
// InexactSN = PostNormBy1SNBit | AM31_19 | AM18_3 | AM2_0
// InexactDB = PostNormBy1DBBit | AM2_0

ME_NAND2 aig2 (AMCBit, AM32, notPostNormBy1SNBit);
ME_NAND2 aig3 (AMCBit, AM3,  notPostNormBy1DBBit);

ME_NAND2 aig12 (notPostNormBy1DBBit, notAM2_0, UInexactDB);
ME_NAND2 g_0   (UInexactDB, RomInexactRound, notInexactDB);

ME_NAND3 aig13 (notPostNormBy1SNBit, notAM2_0, notAM31_3, UInexactSN);
ME_NAND2 g_1   (UInexactSN, RomInexactRound, notInexactSN);

ME_NMUX2B aig14 (SNnotDB, notInexactDB, notInexactSN, Inexact);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)aregloadctl.v	1.1  4/7/92
//
module AregLoadCtl (ROM,
                    LoadOprs,
                    notAbortWB,
                    PreventSwap,
                    FracAregLC, FracAregLoadEn,
                    LoadFromMult,    // Export to Breg
                    SelInitRemBits);
input [`end_frac_areg_field:`start_frac_areg_field] ROM;
input  LoadOprs,
       notAbortWB,
       PreventSwap;
output [2:0] FracAregLC;
output FracAregLoadEn,
       LoadFromMult,
       SelInitRemBits;

ME_TIEOFF toff (vdd, gnd);

ME_INVA iopl (LoadOprs, notLoadOprs);
ME_AND2 alcn1 (ROM[`u_FracAregFromFunc2], notLoadOprs, 
               FracAregLC[2]);
ME_AND2 alcn2 (ROM[`u_FracAregFromFunc1], notLoadOprs, 
               FracAregLC[1]);
ME_AND2 alcn3 (ROM[`u_FracAregFromFunc0], notLoadOprs, 
               FracAregLC[0]);
ME_OR4  alcne (ROM[`u_FracAregFromFunc0],
               ROM[`u_FracAregFromFunc1],
               ROM[`u_FracAregFromFunc2],
               LoadOprs,
               LoadEn);

//ME_AND3  alcni (LoadEn, notAbortWB, notPreventSwap, FracAregLoadEn);
ME_AND2    alcni (LoadEn, notAbortWB, FracAregLoadEn_p);
ME_NMUX2B_B  alcn0 (FracAregLoadEn_p, vdd, PreventSwap, FracAregLoadEn);

ME_AND3  alcnf (ROM[`u_FracAregFromFunc0],
                ROM[`u_FracAregFromFunc1],
                ROM[`u_FracAregFromFunc2],
                LoadFromMult);      // 1 1 1

ME_INVA   alcn7 (ROM[`u_FracAregFromFunc0], notFunc0);
ME_INVA   alcn8 (ROM[`u_FracAregFromFunc2], notFunc2);
ME_AND3_B alcnh (notFunc0,
                ROM[`u_FracAregFromFunc1],
                notFunc2,
                SelInitRemBits);    // 0 1 0 ie FracAregFromFracBreg
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)bregloadctl.v	1.1  4/7/92
//
module BregLoadCtl (RomFracBregLC,
                    RomBSL2InFromC,
                    LoadOprs,
                    notAbortWB,
                    PreventSwap,
         LoadFromMult,
         CregInSL2SQRT,
         FracBregLC, FracBregLoadEn,
         InFromCregOr0);
input [`end_frac_breg_field:`start_frac_breg_field] RomFracBregLC;
input LoadFromMult;
input LoadOprs;
input RomBSL2InFromC,
      notAbortWB, PreventSwap;
input [1:0] CregInSL2SQRT;
output [2:0] FracBregLC;
output       FracBregLoadEn;
output [1:0] InFromCregOr0;

ME_TIEOFF toff (vdd, gnd); 

// SQRT Logic

ME_AND2 ssg81 (CregInSL2SQRT[1], RomBSL2InFromC, InFromCregOr0[1]);
ME_AND2 ssg80 (CregInSL2SQRT[0], RomBSL2InFromC, InFromCregOr0[0]);

// Breg Load Control

ME_INVA iopl (LoadOprs, notLoadOprs);
ME_AND2 alcn3 (LoadFromMult,                        notLoadOprs, FracBregLC[2]);
ME_AND2 alcn2 (RomFracBregLC[`u_FracBregFromFunc1], notLoadOprs, FracBregLC[1]);
ME_AND2 alcn1 (RomFracBregLC[`u_FracBregFromFunc0], notLoadOprs, FracBregLC[0]);
ME_OR4  alcne (RomFracBregLC[`u_FracBregFromFunc0],
               RomFracBregLC[`u_FracBregFromFunc1],
               LoadFromMult,
               LoadOprs,
               LoadEn);
//ME_AND3 brme (LoadEn, notAbortWB, notPreventSwap, FracBregLoadEn);
ME_AND2      alcni (LoadEn, notAbortWB, FracBregLoadEn_p);
ME_NMUX2B_B  alcn0 (FracBregLoadEn_p, vdd, PreventSwap, FracBregLoadEn);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)carrysavereglsb.v	1.1  4/7/92
//
module carrysaveregslsb (Rom_ResetMul,
                  notMultip0,
                  notAbortWB,
                  SumCarryLoadEn,
                  InitialMulStep,
/* dhn--01/10/90	notInitialSumZero, */
                  InitialCarryBit);

input  Rom_ResetMul,
       notAbortWB,
       notMultip0;

output InitialCarryBit,
       SumCarryLoadEn,
       InitialMulStep;
/*** dhn--01/10/90	output notInitialSumZero ;

//wire notInitialSumZero = InitialCarryBit;
  con1 g0 (InitialCarryBit, notInitialSumZero);

*** dhn--01/10/90 ***/

  ME_BUFF  g00 (notAbortWB,      SumCarryLoadEn);
  ME_INV_B g01 (notMultip0,      InitialCarryBit);
  ME_BUFF  g02 (Rom_ResetMul,    InitialMulStep);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)casegeneration.v	1.1  4/7/92
//
module CaseGeneration (
   Rom_Feedback,
   Rom_Condition,
   SubResultNorm,
   Cond_SignsDiffer,
   notExpUnderflow, notExpOverflow, notExpException, notPossibleOv, notFracZero,
   RCondition,
   Feedback);

input [4:0]Rom_Feedback;
input [3:0]Rom_Condition;
input SubResultNorm;
input Cond_SignsDiffer;
input notExpUnderflow, notExpOverflow, notExpException, notPossibleOv, notFracZero;
output [4:0]Feedback;
output RCondition;           // Speed critical signal


// ***************************************//
// Case Generation                        //
// ***************************************//


ME_INV_A cnsb (Rom_Condition[0], notCondSel0);
ME_AND3 cqsb  (Rom_Condition[1], Rom_Condition[2], Rom_Condition[3],
               Rom_Case);
ME_AND2 ril (Rom_Case, notCondSel0, Rom_Sub_Sign_Case);
ME_AND2_B ris (Rom_Case, Rom_Condition[0], RomRoundCase);

// ***************************************//
// Rounding Case Address Generation       //
// ***************************************//

wire [4:0] notUFeedback;


//ME_INVA  g1_0 (ExpUnderflow, notExpUnderflow);
//ME_INVA  g1_1 (ExpOverflow,  notExpOverflow);
//ME_AND2  fzfz (notExpUnderflow, notExpOverflow, notExpException);
// Note SubResultNorm and notPossibleOv are time critical

ME_NAND3_B nrc (SubResultNorm, notExpException, notPossibleOv,
            RCondition);
//ME_NAND4 nrc (SubResultNorm, notExpUnderflow, notExpOverflow, notPossibleOv,
//            RCondition);
//
// notRCondition(e)
// Ye Olde Criticale Pathe
//

// ***************************************//
// Sign Case Bits                         //
// ***************************************//


ME_NMUX2B vbxb (Rom_Sub_Sign_Case,
            Rom_Feedback[1],
            Cond_SignsDiffer,
            notUFeedback[1]);

// *********************************************************//
// Generate Feedback address including CASE logic           //
// *********************************************************//

ME_INV_A g0_0 (Rom_Feedback[0],   notUFeedback[0]);
ME_INV_A g0_2 (Rom_Feedback[2], notUFeedback[2]);
ME_INV_A g0_3 (Rom_Feedback[3], notUFeedback[3]);
ME_INV_A g0_4 (Rom_Feedback[4], notUFeedback[4]);

// Assign rounding case bits

ME_NMUX2B_B ufb0 (RomRoundCase, notUFeedback[0], notExpOverflow,  Feedback[0]);
ME_NMUX2B_B ufb1 (RomRoundCase, notUFeedback[1], notExpUnderflow, Feedback[1]);
ME_NMUX2B_B ufb2 (RomRoundCase, notUFeedback[2], SubResultNorm,   Feedback[2]);
ME_NMUX2B_B ufb3 (RomRoundCase, notUFeedback[3], notFracZero,     Feedback[3]);
ME_NMUX2B_B ufb4 (RomRoundCase, notUFeedback[4], notPossibleOv,   Feedback[4]);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)condmux.v	1.1  4/7/92
//
module CondMux (C,
                CS,
                notReset,
                notAbortNulExc,
                DyadicOprExc,
		notBrTakenMIS,
                notBrTaken);
input [15:0] C;
input [4:0] CS;
input notAbortNulExc,
      DyadicOprExc,
      notReset;
output notBrTakenMIS;
output notBrTaken;

ME_TIEOFF toff (vdd, gnd);

wire [3:0] T;
wire [4:0] CoS;

ME_INVA h_1 (DyadicOprExc, notDyadicOprExc);
ME_AND3_B h_0 (notAbortNulExc, notReset,
             notDyadicOprExc,
             notPreventBr);

ME_AND2_B c_0(CS[0], notPreventBr, CoS[0]);
ME_AND2_B c_1(CS[1], notPreventBr, CoS[1]);
ME_AND2   c_2(CS[2], notPreventBr, CoS[2]);
ME_AND2   c_3(CS[3], notPreventBr, CoS[3]);
ME_AND2   c_4(CS[4], notPreventBr, CoS[4]);

// C[15] takes different route
ME_MUX4B vx_3 (CoS[0], CoS[1], C[12],C[13],C[14],gnd,  T[3]);
ME_MUX4B vx_2 (CoS[0], CoS[1], C[8],C[9],C[10],C[11],   T[2]);
ME_MUX8B vx_0 (CoS[0], CoS[1], CoS[2], C[0],C[1],C[2],C[3],C[4],C[5],C[6],C[7],C0_7);

ME_NMUX2B vc_1 (CoS[3],  C0_7, T[3],     notC0_11);
ME_XOR2_B vd_0 (notC0_11, CoS[4], notBrTakenNoFrac);

ME_INVA vc_2 (CoS[2], notCoS2);
ME_NAND2 vc_3 (notCoS2, CoS[3], notSelFracConds);
ME_NMUX2B vc_4 (notSelFracConds, T[2], notBrTakenNoFrac,
                BrTakenSlowRC);

// Make a special case of RoundingCondition CoS = {1, 1, 1, 1, 1} ie invert not Rounding condition

ME_AND4   sp_0 (CoS[0], CoS[1], CoS[2], CoS[3], RCSelected);
ME_AND2   sp_1 (CoS[4], RCSelected, ControlForRCPos);

ME_NMUX2B_B sp_2 (ControlForRCPos, BrTakenSlowRC, C[15], notBrTaken);
ME_NMUX2B_B sp_3 (ControlForRCPos, BrTakenSlowRC, C[15], notBrTakenMIS);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)control.v	1.1  4/7/92
//
module Control (Phi, ResetIn,
                notExpAgtB,
                notAInfNan, notAZeroDenorm, notBInfNan, notBZeroDenorm,
                notExpUnderflow, notExpOverflow, notExpException,
                notWaitForShifter, notNO,
                SubResultNorm,
                notPossibleOv,
                Conditionals_14_8, Conditionals_6_0,
                FpInst, FpOp, FpLd,
                PreventSwap,
                PreventSwapExp,
                RCondition,
		SelectedMIptr,
		U_RomOutputs,
                RomOutputs, 
                YDest,
                XDest,
                CMPDecoded, CMPEDecoded,
                AregOprExc,
                notAbortWB, Reset,
                Busy, NegateOprSign,
                UnimpOut );

input Phi, ResetIn;
input notExpAgtB,
      notAInfNan, notAZeroDenorm,
      notBInfNan, notBZeroDenorm,
      notExpUnderflow, notExpOverflow, notExpException,
      notWaitForShifter;
input [1:0] notNO;
input SubResultNorm;
input notPossibleOv;
input [14:8] Conditionals_14_8;		// Conditional bits (input)
input [ 6:0] Conditionals_6_0;		// Conditional bits (input)
input [9:0] FpInst;			// FPOP field of instruction
input FpOp, FpLd;
input [`RomWidthM1:0] U_RomOutputs;


output PreventSwap, PreventSwapExp,
       RCondition;
output [`MIptrMSB:0] SelectedMIptr;
output [`RomWidthM1:0] RomOutputs;
output [6:0] YDest;
output XDest;
output CMPDecoded, CMPEDecoded;
output AregOprExc,
       notAbortWB, Reset,
       Busy, NegateOprSign,
       UnimpOut;


wire [2:0] ExMIptrLSBs;
wire AregOprExc, RCondition;

wire [15:0] Conditionals;
assign Conditionals = {RCondition, Conditionals_14_8, AregOprExc,
			Conditionals_6_0} ;


PreventSwapCtl psc (Conditionals[`u_Cond_FracResultNegative],
		    notExpAgtB, Conditionals[`u_Cond_ExpResultZero],
                    RomOutputs[`u_PreventSwapIfBgtA], FpLd,
                    PreventSwap,
                    PreventSwapExp);

SampleReset sr (Phi, ResetIn, ResetAbortInst,
                ResetImp, Reset, notReset);

NullExcepLogic nel (Phi, notReset,
                       RomOutputs[`u_NullifyOnBranchOr],
                       RomOutputs[`u_OprExc],
                       BTLatched,
                       notSampledWait,
                       FpLd,
                       notAInfNan, notAZeroDenorm,
                       notBInfNan, notBZeroDenorm,
                       ExMIptrLSBs,
                       AregOprExc,
                       DyadicOprExc,
                       notAbortNulExc,
                       notAbortWB);

wire [4:0] Feedback;
CaseGeneration cg (
           RomOutputs[`start_fb_field+4:`start_fb_field],
           RomOutputs[`start_condition_field+3:`start_condition_field],
           SubResultNorm,
           Conditionals[`u_Cond_SignsDiffer],
           notExpUnderflow, notExpOverflow, notExpException,
           notPossibleOv, Conditionals[`u_Cond_notFracResultZero],
           RCondition,
           Feedback[4:0]);

CondMux cm (Conditionals,
            RomOutputs[4+`start_condition_field:`start_condition_field],
            notReset,
            notAbortNulExc,
            DyadicOprExc,
            notBranchTakenMIS,
            notBranchTaken);

SampledWaitCtl swc (
           RomOutputs[`u_ShiftForAlign],
           RomOutputs[`u_ShiftForInt],
           RomOutputs[`u_LeftnotRight],
           notReset,
           notAbortNulExc,
           notWaitForShifter,
           notNO[1:0],
           notIdleLatched,
           UpdateOutputs,
           notSampledWait);

MISelect smi (Phi, notReset,
           notBranchTaken,
           notDecodedUnimp,
           RomOutputs[`u_MIptrFromInstructionN],
           RomOutputs[`u_MIptrFromInstructionB],
           notAbortInst, notAbortNulExc,
           notResetOrUnimp,
           DyadicOprExc, notSampledWait,
           FpOp,
           notSingleCycInst,
           BTLatched,
           Busy, notIdleLatched,
           notInstAndNoExc,
           MIptrLoadEnable);

// ***************************************//
// MIptr :- Micro Instruction Pointer     //
// ***************************************//
wire [`MIptrMSB:0] RomMIptr, notRomMIptr;

// ***************************************//
// unregistered version of RomMIptr	  //
// ***************************************//
wire [`MIptrMSB:0] SelectedMIptr;
wire [`RomWidthM1:0] U_RomOutputs;	// unbuffered output from ME_UROM

MIptr mip (Phi,
           ExMIptrLSBs,
           DyadicOprExc,
           notInstAndNoExc,
           notBranchTakenMIS,
           notResetOrUnimp,
           MIptrLoadEnable,
           {RomOutputs[`end_fb_field:`start_fb_field+5], Feedback[4:0]},
           FpInst[7:0],
	   SelectedMIptr,
           RomMIptr,
           notRomMIptr);

MicrocodeRom mrom (Phi,
                   UpdateOutputs,
		   U_RomOutputs,
                   RomOutputs,
                   XDest,
                   YDest );


EntryCheck ec (notRomMIptr, EntryPoint, notSingleCycInst);


ImplementedCheck ich (Phi, ResetImp, // Can't be Reset
           notReset,
           FpOp,
           EntryPoint, FpInst[9:4],
           notDecodedUnimp,
           notResetOrUnimp,
           notAbortInst, ResetAbortInst,
           FPOP2Map,
           UnimpOut);

DecodeCmpAndNeg dcs (Phi,
                    FpInst[2], FpInst[3], FpInst[6], FpInst[7],
                    FPOP2Map,
                    CMPDecoded, CMPEDecoded,
                    NegateOprSign);


endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)cregloadctl.v	1.1  4/7/92
//
module CregLoadCtl (
// inputs
      RomCregCtl,
      QuoBits,
      notAbortWB,
      SNnotDB, 
      CregSNBits,
// outputs
      InForCreg,
      InForCregDB,
      RomFracBSL2FromC,
      FracCregLoadCtl0,
      FracCregLoadEn);
             
input [`end_frac_creg_field:`start_frac_creg_field] RomCregCtl;
input [1:0] QuoBits;
input [1:0] CregSNBits;
input notAbortWB,
      SNnotDB;
output [1:0] InForCreg, InForCregDB;
output RomFracBSL2FromC;
output FracCregLoadCtl0,
       FracCregLoadEn;

wire [1:0] InForCregSN;

/* *********************************************************

   Control Logic For Creg

   ********************************************************* */

ME_INVA g100 (SNnotDB, DBnotSN);
ME_AND2 fg1s (QuoBits[1], RomCregCtl[`u_FracCregFromFunc0], 
              InForCregSN[1]);
ME_AND2 fg0s (QuoBits[0], RomCregCtl[`u_FracCregFromFunc0], 
              InForCregSN[0]);
ME_AND3 fg1d (QuoBits[1], DBnotSN, RomCregCtl[`u_FracCregFromFunc0], 
              InForCregDB[1]);
ME_AND3 fg0d (QuoBits[0], DBnotSN, RomCregCtl[`u_FracCregFromFunc0], 
              InForCregDB[0]);

ME_MUX2B fg1  (SNnotDB, CregSNBits[1], InForCregSN[1], InForCreg[1]);
ME_MUX2B fg0  (SNnotDB, CregSNBits[0], InForCregSN[0], InForCreg[0]);

ME_INVA fg9s (RomCregCtl[`u_FracCregFromFunc0], notResultOrQuoBits);
ME_AND2 icr9 (RomCregCtl[`u_FracCregFromFunc1], notResultOrQuoBits, 
              RomFracBSL2FromC); // 1 0 ie SQRT

ME_INVA fgg  (notAbortWB, AbortWB);
ME_NOR2  icr (RomCregCtl[`u_FracCregFromFunc0],
              RomCregCtl[`u_FracCregFromFunc1],
              notEn);
ME_NOR2 rct (notEn,
             AbortWB,
             FracCregLoadEn);

/* Feedthroughs */
ME_BUFF g00 (RomCregCtl[`u_FracCregFromFunc1], FracCregLoadCtl0);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)decodecomparesandneg.v	1.1  4/7/92
//
/* Negate sign for the following entries
     Inst 045 N
     Inst 046 N
     Inst 151  N
     Inst 152  N
     Inst 155  N
     Inst 156  N
     
    N = FPOP2Map | x 01xx 01xx 
     */
module DecodeCmpAndNeg (
       Phi,
       FpInst2, FpInst3, FpInst6, FpInst7,
       FPOP2Map,
       CMPDecoded, CMPEDecoded, NegateOprSign);

input  Phi,
       FpInst2, FpInst3, FpInst6, FpInst7, FPOP2Map;
output CMPDecoded, CMPEDecoded;
output NegateOprSign;

ME_INVA dcep1 (FpInst2, notFpInst2);
ME_NAND2 dcep2 (FPOP2Map, notFpInst2, notCMP);
ME_NAND2 dcep3 (FPOP2Map, FpInst2, notCMPE);
ME_FD1 dcep4  (Phi, notCMP, , CMPDecoded);
ME_FD1 dcep5  (Phi, notCMPE, , CMPEDecoded);

ME_INVA dcep9 (FpInst3, notFpInst3);
ME_INVA dcep6 (FpInst7, notFpInst7);
ME_AND4 dcep7 (FpInst6, notFpInst7, FpInst2, notFpInst3, DyadicSub);

ME_NOR2 decep8 (FPOP2Map, DyadicSub, s_0);
ME_FD1 iggypop (Phi, s_0, , NegateOprSign);
endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)decodestatus.v	1.1  4/7/92
//
module DecodeStatus (RomCtl[3:0], StatusControl[6:0]);
input  [3:0] RomCtl;
output [6:0] StatusControl;

// A-L are ouputs required            // Recoded into patterns
// A 010_0000                         // 1101
// B 110_0000                         // 1111
// C 000_0100                         // 1100
// D 100_0000                         // 1110
// E 000_1000                         // 1011
// F 100_1000                         // 1010
// G 001_0000                         // 1001
// H 101_0000                         // 1000
// I 010_0011                         // 0111
// J 000_0011                         // 0110
// K 000_0010                         // 0100
// L 000_0000                         // 0000

ME_INV_A i0 (RomCtl[3], notRomCtl3);
ME_INV_A i1 (RomCtl[2], notRomCtl2);
ME_INV_A i2 (RomCtl[1], notRomCtl1);
ME_INV_A i3 (RomCtl[0], notRomCtl0);

ME_AND3  b0 (notRomCtl3, RomCtl[2], RomCtl[1],             StatusControl[0]);
ME_AND2  b1 (notRomCtl3, RomCtl[2],                        StatusControl[1]);
ME_AND4  b2 (RomCtl[3], RomCtl[2], notRomCtl1, notRomCtl0, StatusControl[2]);
ME_AND3  b3 (RomCtl[3], notRomCtl2, RomCtl[1],             StatusControl[3]);
ME_AND3  b4 (RomCtl[3], notRomCtl2, notRomCtl1,            StatusControl[4]);
ME_NAND4 p0 (notRomCtl3, RomCtl[2], RomCtl[1], RomCtl[0],  t0);
ME_NAND3 p1 (RomCtl[3], RomCtl[2], RomCtl[0],              t1);
ME_NAND2 b5 (t0, t1,                                       StatusControl[5]);
ME_NAND3 p2 (RomCtl[3], RomCtl[2], RomCtl[1],              t2);
ME_NAND3 p3 (RomCtl[3], notRomCtl2, notRomCtl0,            t3);
ME_NAND2 b6 (t2, t3,                                       StatusControl[6]);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)divlog.v	1.1  4/7/92
//
/* ############################################################
   divlog.v   1.0 6th September 1989
   DivLog Generation


   ############################################################ */


/* Divlog requires generation of DivMultiple From RemBits.
   The RemBits are signed.

                   Pos                Neg
   Div Multiple    0 1 2 2 3 3 3 3    3 3 3 3 2 2 1 0  Divisor 1.1
                   0 1 2 3 3 3 3 3    3 3 3 3 3 2 1 0  Divisor 1.0

   RemBits         0 0 0 0 0 0 0 0    1 1 1 1 1 1 1 1  RemBits[3]
                   0 0 0 0 1 1 1 1    0 0 0 0 1 1 1 1  RemBits[2]
                   0 0 1 1 0 0 1 1    0 0 1 1 0 0 1 1  RemBits[1]
                   0 1 0 1 0 1 0 1    0 1 0 1 0 1 0 1  RemBits[0]

   Therfore

   DivMultiple [3] 0 0 0 0 1 1 1 1    1 1 1 1 0 0 0 0
   Divisor=1   [2] 0 0 1 1 0 0 0 0    0 0 0 0 1 1 0 0
               [1] 0 1 0 0 0 0 0 0    0 0 0 0 0 0 1 0

   DivMultiple [3] 0 0 0 1 1 1 1 1    1 1 1 1 1 0 0 0
   Divisor=0   [2] 0 0 1 0 0 0 0 0    0 0 0 0 0 1 0 0
               [1] 0 1 0 0 0 0 0 0    0 0 0 0 0 0 1 0

   Which can be expressed

   DivMultiple [1] = ~RemBit[3].~RemBit[2].~RemBit[1].RemBit[0] +
                       RemBit[3].RemBit[2].RemBit[1].~RemBit[0];
   DivMultiple [2] = ~RemBit[3].~RemBit[2].RemBit[1].~RemBit[0] +
                     ~RemBit[3].~RemBit[2].RemBit[1].DivisorBit +
                      RemBit[3]. RemBit[2].~RemBit[1].RemBit[0] +
                      RemBit[3]. RemBit[2].~RemBit[1].DivisorBit;
   DivMultiple [3] = ~RemBit[3]. RemBit[2] +
                     ~RemBit[2]. RemBit[1]. RemBit[0].~DivisorBit +
                      RemBit[3].~RemBit[2] +
                      RemBit[2].~RemBit[1].~RemBit[0].~DivisorBit;

   The Quotient selection is made based on the previous trial multiple and the sign of the result of the trial
   The div multiple is recreated from the notDivMultiple[3:1] lines

   Div Multiple            -3    -2    -1    -0     0     1     2     3
   Sign of trial result    + -   + -   + -   + -   + -   + -   + -   + -
   Quotient bits generated 1 0   2 1   3 2   x 3   0 x   1 0   2 1   3 2

   Which can be expressed

   QuotientBit[1] = OldSign.DivMultiple[1].~DivMultiple[0].~NewSign +
                    OldSign.~DivMultiple[1] +
                    ~OldSign.DivMultiple[1].DivMultiple[0] +
                    ~OldSign.DivMultiple[1].~DivMultiple[0].~NewSign;
   QuotientBit[0] = DivMultiple[0] XOR NewSign;

   By multiplexing on the new sign

   QuotientBit0[1] = OldSign.DivMultiple[1].~DivMultiple[0] +
                    OldSign.~DivMultiple[1] +
                    ~OldSign.DivMultiple[1].DivMultiple[0] +
                    ~OldSign.DivMultiple[1].~DivMultiple[0].~NewSign;
   QuotientBit0[0] = DivMultiple[0];
   QuotientBit1[1] = OldSign.~DivMultiple +
                    ~OldSign.DivMultiple[1].DivMultiple[0];
   QuotientBit[0] = ~DivMultiple[0];

*/

module DivLog (Phi,
               AregFPMSBM1,        // Divisor Bit
               BregFPMSBM1,        // On first step divisor is in B
               StepRemBits,        // RemBits used during step
               InitialRemBits,     // RemBits used on first step
               SelectInitial,      // Select First step
               FracSign,           // Sign of result after operation
               DivMultiple,        // Latched version of Divide Step Multiple
               QuotientBits);      // Quotient bits, valid on cycle after
				   // operation
//   notFracSign);       // inv FracSign  -- generate inside fdp (dhn 03/27/91)

input Phi;                   // System Clock
input AregFPMSBM1, BregFPMSBM1, FracSign;
input [3:0] StepRemBits, InitialRemBits;
input SelectInitial;
output [3:1] DivMultiple;
output [1:0] QuotientBits;
// output notFracSign;		// -- generate inside fdp (dhn 03/27/91)

// ME_INVA ifs (FracSign, notFracSign); // --generate inside fdp (dhn 03/27/91)

wire [3:1] notDivMultiple, DivMultipleU;
wire [3:0] notRemBits;
wire [3:0] RemBits;

ME_NMUX2B msld (SelectInitial, AregFPMSBM1, BregFPMSBM1, notDivisorBit);
ME_NMUX2B msl0 (SelectInitial, StepRemBits[0], InitialRemBits[0], notRemBits[0]);
ME_NMUX2B msl1 (SelectInitial, StepRemBits[1], InitialRemBits[1], notRemBits[1]);
ME_NMUX2B msl2 (SelectInitial, StepRemBits[2], InitialRemBits[2], notRemBits[2]);
ME_NMUX2B msl3 (SelectInitial, StepRemBits[3], InitialRemBits[3], notRemBits[3]);

ME_INV_B ir3 (notRemBits[3], RemBits[3]);
ME_INV_B ir2 (notRemBits[2], RemBits[2]);
ME_INV_B ir1 (notRemBits[1], RemBits[1]);
ME_INV_B ir0 (notRemBits[0], RemBits[0]);
ME_INV_B id0 (notDivisorBit, DivisorBit);
  
//   DivMultiple [1] = ~RemBit[3].~RemBit[2].~RemBit[1].RemBit[0] +
//                       RemBit[3].RemBit[2].RemBit[1].~RemBit[0];

ME_NAND4 ds10 (notRemBits[3], notRemBits[2], notRemBits[1], RemBits[0],   dm1t0);
ME_NAND4 ds11 (RemBits[3], RemBits[2], RemBits[1], notRemBits[0],         dm1t1);
ME_NAND2 ds1m (dm1t1, dm1t0, DivMultipleU[1]);

//   DivMultiple [2] = ~RemBit[3].~RemBit[2].RemBit[1].~RemBit[0] +
//                     ~RemBit[3].~RemBit[2].RemBit[1].DivisorBit +
//                      RemBit[3]. RemBit[2].~RemBit[1].RemBit[0] +
//                      RemBit[3]. RemBit[2].~RemBit[1].DivisorBit;

ME_NAND4 ds20 (notRemBits[3], notRemBits[2], RemBits[1], notRemBits[0],   dm2t0);
ME_NAND4 ds21 (notRemBits[3], notRemBits[2], RemBits[1], DivisorBit,      dm2t1);
ME_NAND4 ds22 (RemBits[3], RemBits[2], notRemBits[1], RemBits[0],         dm2t2);
ME_NAND4 ds23 (RemBits[3], RemBits[2], notRemBits[1], DivisorBit,         dm2t3);
ME_NAND4 ds2m (dm2t1, dm2t0, dm2t2, dm2t3, DivMultipleU[2]);

//   DivMultiple [3] = ~RemBit[3]. RemBit[2] +
//                     ~RemBit[2]. RemBit[1]. RemBit[0].~DivisorBit +
//                      RemBit[3].~RemBit[2] +
//                      RemBit[2].~RemBit[1].~RemBit[0].~DivisorBit;

ME_NAND2 ds30 (notRemBits[3], RemBits[2],                               dm3t0);
ME_NAND4 ds31 (notRemBits[2], RemBits[1], RemBits[0], notDivisorBit,    dm3t1);
ME_NAND2 ds32 (RemBits[3], notRemBits[2],                               dm3t2);
ME_NAND4 ds33 (RemBits[2], notRemBits[1], notRemBits[0], notDivisorBit, dm3t3);
ME_NAND4 ds3m (dm3t1, dm3t0, dm3t2, dm3t3, DivMultipleU[3]);

/* ************************************************

   Latch next Div Multiple

   ************************************************ */

ME_FD1_B dv1 (Phi, DivMultipleU[1], DivMultiple[1], notDivMultiple[1]);
ME_FD1_B dv2 (Phi, DivMultipleU[2], DivMultiple[2], notDivMultiple[2]);
ME_FD1_B dv3 (Phi, DivMultipleU[3], DivMultiple[3], notDivMultiple[3]);
ME_FD1_B dv0 (Phi, notRemBits[3],      notOldSign,        OldSign);

/* ************************************************

   Quotient bit generation
   End of Result QuoBit Generation calculation

   ************************************************ */

/* Not time critical so use buffered DivMultiple */
/* Also use the encoded version of DivMultiple ie DivMultipleC */

wire [1:0] DivMultipleC, notDivMultipleC;

ME_NAND2 dedv0 (notDivMultiple[1], notDivMultiple[3], DivMultipleC[0]);
ME_NAND2 dedv1 (notDivMultiple[2], notDivMultiple[3], DivMultipleC[1]);
ME_INV_A dmb0 (DivMultipleC[0], notDivMultipleC[0]);
ME_INV_A dmb1 (DivMultipleC[1], notDivMultipleC[1]);

//   QuotientBit0[1] = OldSign.DivMultiple[1].~DivMultiple[0] +
//                    OldSign.~DivMultiple[1] +
//                    ~OldSign.DivMultiple[1];
//   QuotientBit1[1] = OldSign.~DivMultiple[1] +
//                    ~OldSign.DivMultiple[1].DivMultiple[0];

//   QuotientBit0[0] = DivMultiple[0];
//   QuotientBit1[0] = ~DivMultiple[0];

ME_NAND3 qb1t0 (OldSign, DivMultipleC[1], notDivMultipleC[0], t0);
ME_NAND2 qb1t1 (OldSign, notDivMultipleC[1],                  t1);
ME_NAND2 qb1t2 (notOldSign, DivMultipleC[1],                  t2);
ME_NAND3 qb1t3 (t0, t1, t2,                                   t3);
ME_NAND3 qb1t4 (notOldSign, DivMultipleC[1], DivMultipleC[0], t4);
ME_NAND2 qb1t5 (t4, t1,                                       t5);
ME_MUX2B qb1m (FracSign, t3, t5,                              QuotientBits[1]);

ME_NMUX2B qb0m (FracSign, notDivMultipleC[0], DivMultipleC[0], QuotientBits[0]);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)entrycheck.v	1.1  4/7/92
//
module EntryCheck (notRomMIptr, EntryPoint, s_mov);
input [7:0] notRomMIptr;
output EntryPoint, s_mov;
wire [7:0] RomMIptr;

ME_INV_B i_0 (notRomMIptr[0], RomMIptr[0]);
ME_INV_B i_1 (notRomMIptr[1], RomMIptr[1]);
ME_INV_B i_2 (notRomMIptr[2], RomMIptr[2]);
ME_INV_B i_3 (notRomMIptr[3], RomMIptr[3]);
ME_INV_B i_4 (notRomMIptr[4], RomMIptr[4]);
ME_INV_B i_5 (notRomMIptr[5], RomMIptr[5]);
ME_INV_B i_6 (notRomMIptr[6], RomMIptr[6]);
ME_INV_B i_7 (notRomMIptr[7], RomMIptr[7]);
ME_NOR3  g_1 (RomMIptr[7], RomMIptr[1], RomMIptr[0], s_0);
ME_NOR2  g_2 (RomMIptr[4], RomMIptr[3], s_1);
ME_NAND2 g_3 (RomMIptr[6], RomMIptr[2], s_2);
ME_NAND4 g_4 (RomMIptr[5], s_0, s_1, s_2, s_mov);
ME_XOR2  g_5 (RomMIptr[4], RomMIptr[5], s_3);
ME_NAND3 g_6 (RomMIptr[3], s_0, s_3, s_dyadic);
ME_NOR4  g_7 (RomMIptr[7], RomMIptr[3], RomMIptr[2], RomMIptr[1], s_4);
ME_AND2  g_8 (RomMIptr[6], RomMIptr[0], s_5);
ME_NAND3 g_9 (s_4, s_5, s_3, s_sqrt);
ME_NOR3  g_0 (RomMIptr[7], RomMIptr[6], RomMIptr[0], s_6);
ME_AND2  h_1 (RomMIptr[3], RomMIptr[1], s_7);
ME_NAND3 h_2 (s_6, s_7, s_3, s_cmp);
ME_NOR3  h_3 (RomMIptr[6], RomMIptr[5], RomMIptr[1], s_8);
ME_NAND2 h_4 (s_8, RomMIptr[2], s_9);
ME_NOR3  h_5 (RomMIptr[4], RomMIptr[2], RomMIptr[1], s_10);
ME_NAND2 h_6 (s_10, RomMIptr[6], s_11);
ME_NOR2  h_7 (RomMIptr[6], RomMIptr[2], s_12);
ME_NAND3 h_8 (s_12, s_3, RomMIptr[1], s_13);
ME_NAND3 h_9 (s_13, s_11, s_9, s_14);
//ME_INVA  h_0 (RomMIptr[0], s_15);
ME_NAND4 j_1 (notRomMIptr[0], s_14, RomMIptr[3], RomMIptr[7], s_conv);
ME_AND4  j_2 (s_mov, s_dyadic, s_sqrt, s_cmp, s_16);
ME_NAND2 j_3 (s_conv, s_16, EntryPoint);
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)exp_ctl.v	1.1  4/7/92
//
//  Top-level interconnect module for the exponent datapath control modules.
//
//  This interconnect module was produced by Synopsys grouping and then edited
//  by hand to remove hierarchy from signal names and make
//  things more readable.

module exp_ctl ( Phi, DBnotSN, FracAregMSB1, LoadOprs, notAbortWB, PreventSwap,
		 ShiftBy8, ShiftForAl, SNnotDB, notExpShiftResult, Rom_28_27,
		 Rom_38_33,
		 CarryIn, Constantb, Constantc, Constantd, Constante,
		 Constantf, Constantg, Constanth, ExpAregLoadEn, ExpAregLC0,
		 ExpAregLC1, ExpBregLC0, ExpBregLC1, ExpBregLoadEn,
		 notSignAFromB, notSignBFromA, notWaitForShifter, SROneMore,
		 SRToSticky, SRControl );

input	Phi, DBnotSN, FracAregMSB1, LoadOprs, notAbortWB, PreventSwap,
	ShiftBy8, ShiftForAl, SNnotDB ;
input [12:0] notExpShiftResult ;
input [28:27] Rom_28_27 ;
input [38:33] Rom_38_33 ;

output	CarryIn, Constantb, Constantc, Constantd, Constante, Constantf,
	Constantg, Constanth, ExpAregLoadEn, ExpAregLC0, ExpAregLC1,
	ExpBregLC0, ExpBregLC1, ExpBregLoadEn, notSignAFromB, notSignBFromA,
	notWaitForShifter, SROneMore, SRToSticky ;
output [3:0] SRControl ;


    ExpAdderLSB alsb ( .CinFromRound(Rom_28_27[28] ), .Sub(Rom_28_27[27] ), 
	.FracAregMSB1(FracAregMSB1), .CarryIn(CarryIn) );

    ExpConstantCtl ecs ( .SNnotDB(SNnotDB), .DBnotSN(DBnotSN), .RomExpConCtl(
	Rom_38_33[34:33] ), .Constantb(Constantb), .Constantc(Constantc),
	.Constantd(Constantd), .Constante(Constante), .Constantf(Constantf),
	.Constantg(Constantg), .Constanth(Constanth) );

    ExpRegLoadCtl alc ( .RomExpBregLC( Rom_38_33[36:35] ), .LoadOprs(LoadOprs),
	.notAbortWB(notAbortWB), .PreventSwap(PreventSwap),
	.notSignBFromA(notSignAFromB), .ExpBregLC0(ExpAregLC0),
	.ExpBregLC1(ExpAregLC1), .ExpBregLoadEn(ExpAregLoadEn) );

    ExpRegLoadCtl blc ( .RomExpBregLC(Rom_38_33[38:37]), .LoadOprs(LoadOprs),
	.notAbortWB(notAbortWB), .PreventSwap(PreventSwap), .notSignBFromA(
	notSignBFromA), .ExpBregLC0(ExpBregLC0), .ExpBregLC1(ExpBregLC1),
	.ExpBregLoadEn(ExpBregLoadEn) );

    ExpShifter sr ( .Phi(Phi), .notExpResult(notExpShiftResult), .Rom_ShBy8(
	ShiftBy8), .Rom_ShiftForAl(ShiftForAl), .SRControl(SRControl),
	.SROneMore(SROneMore), .SRToSticky(SRToSticky), .notWaitForShifter(
	notWaitForShifter) );

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)expadderlsb.v	1.1  4/7/92
//
module ExpAdderLSB    (CinFromRound, Sub, FracAregMSB1,
                       CarryIn);

   input  CinFromRound,       // rom control to set carry from  Areg MSB
          Sub,                // rom control Subtract not add
          FracAregMSB1;
   output CarryIn;

   /* Notes
   // always subtracting when notCarrryInfromNorm is used
   // always adding when CinFrom Round is used
   // Carry is equivalent to notBorrow for this adder.*/

   ME_MUX2B g12 ( CinFromRound,  Sub, FracAregMSB1, 
                   CarryIn);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)expconstantctl.v	1.1  4/7/92
//
module ExpConstantCtl (SNnotDB, DBnotSN,
                       RomExpConCtl, 
             Constantb, Constantc, Constantd, Constante,
             Constantf, Constantg, Constanth);
input SNnotDB, DBnotSN ;
input [`end_constant_field:`start_constant_field] RomExpConCtl;
output Constantb, Constantc, Constantd, Constante,
       Constantf, Constantg, Constanth;

/* ************************************************************

   Length Dependant Constant Selection

   ************************************************************

               a    b    c  d     e f g h     ROMbit f1 f0   SNnotBD
   DivLoopSN   0|00 00|0 00 0 |   0 1 1 0             0  1     1
   DivLoopDB   0|00 00|0 00 0 |   1 1 0 1             0  1     0
   BiasSN      0|00 00|0 11 1 |   1 1 1 1             1  1     1
   BiasDB      0|00 11|1 11 1 |   1 1 1 1             1  1     0 
   1           0|00 00|0 00 0 |   0 0 0 1             0  0     ?
   IntToReal   0|00 00|0 00 1 |   1 1 1 1             1  0     ?

Constantb = Func1 & Func0 & DB;
Constantc = Func1 & Func0;
Constantd = Func1;
Constante = Func1 | (Func0 & DBnotSN);
Constantf = Func1 | Func0;
Constantg = Func1 | ~Constanth;
Constanth = ~(~Func1 & Func0 & SNnotDB); */

//ME_INVA   z90 (SNnotDB, DBnotSN );
ME_AND3_B z00 (RomExpConCtl[`u_ConstantFromFunc1],
             RomExpConCtl[`u_ConstantFromFunc0],
             DBnotSN, Constantb);
ME_AND2_B z01 (RomExpConCtl[`u_ConstantFromFunc1], 
             RomExpConCtl[`u_ConstantFromFunc0],
             Constantc);
ME_AND2_B z02 (RomExpConCtl[`u_ConstantFromFunc0], DBnotSN, Func0andDB);
ME_OR2_B  z03 (RomExpConCtl[`u_ConstantFromFunc1], Func0andDB, Constante);
ME_OR2_B  z04 (RomExpConCtl[`u_ConstantFromFunc1],
            RomExpConCtl[`u_ConstantFromFunc0],
            Constantf);
ME_INVA   z05 (RomExpConCtl[`u_ConstantFromFunc1], notFunc1);
ME_NAND2_B  z07 (notFunc1, Constanth, Constantg);
ME_NAND3_B  z06 (notFunc1, RomExpConCtl[`u_ConstantFromFunc0], SNnotDB, Constanth);

//wire Constantd = RomExpConCtl[`u_ConstantFromFunc1];
con1 ep (RomExpConCtl[`u_ConstantFromFunc1], Constantd);
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)expregloadctl.v	1.1  4/7/92
//
module ExpRegLoadCtl (RomExpBregLC,
                    LoadOprs,
                    notAbortWB,
                    PreventSwap,
                    notSignBFromA,
                    ExpBregLC0,
                    ExpBregLC1,
                    ExpBregLoadEn);

input  [`u_ExpBregFromFunc1:`u_ExpBregFromFunc0] RomExpBregLC;
input  notAbortWB,
       PreventSwap,
       LoadOprs;
output notSignBFromA;
output ExpBregLC0,
       ExpBregLC1,
       ExpBregLoadEn;
ME_TIEOFF toff (vdd, );

ME_INVA iopl (LoadOprs, notLoadOprs);
ME_AND2 alcn1 (RomExpBregLC[`u_ExpBregFromFunc1], notLoadOprs, ExpBregLC1);
ME_AND2 alcn2 (RomExpBregLC[`u_ExpBregFromFunc0], notLoadOprs, ExpBregLC0);
ME_OR3 alcne  (RomExpBregLC[`u_ExpBregFromFunc0],
            RomExpBregLC[`u_ExpBregFromFunc1],
            LoadOprs,
            LoadEn);

ME_NAND2 alc4 (RomExpBregLC[`u_ExpBregFromFunc0],
            RomExpBregLC[`u_ExpBregFromFunc1],
            notSignBFromA);

//ME_AND3 en (LoadEn, notAbortWB, notPreventSwap, ExpBregLoadEn);
ME_NAND2 en0 (LoadEn, notAbortWB, notExpBregLoadEn_p);
ME_NMUX2B en1 (notExpBregLoadEn_p, PreventSwap, vdd, ExpBregLoadEn);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)expshifter.v	1.1  4/7/92
//
module ShiftDec ( Phi, FS, notFS, Res,
                  notShiftCount1 );

   input Phi, FS, notFS;
   input[1:0] Res;
   output notShiftCount1 ;
   // shift count decrementer.
   // Load counter from Res on FS
   // decrement works either loading or counting

   wire [1:0] notSC, ShCnt, notShCnt ;

   ME_NMUX2BA  mu1 (FS, notFS, Res[1], ShCnt[0], notSC[1]);
   ME_NMUX2BA  mu0 (FS, notFS, Res[0], notShCnt[0], notSC[0]);

   ME_FD1     ma1 (Phi, notSC[1], notShCnt[1], ShCnt[1]);
   ME_FD1     ma0 (Phi, notSC[0], notShCnt[0], ShCnt[0]);

   ME_NAND3   g20 (notFS, notShCnt[1], ShCnt[0], notShiftCount1 );
endmodule

/* ******** main module ******************** */

module ExpShifter ( Phi,
                    notExpResult, 
                    Rom_ShBy8,
                    Rom_ShiftForAl,
                    SRControl,
                    SROneMore,
                    SRToSticky,
                    notWaitForShifter);
input Phi;                      // master clock
input [12:0] notExpResult;       // fraction add result only use 5:0
input Rom_ShBy8,             // for either int or mul
      Rom_ShiftForAl;        // alignment
output [3:0] SRControl; // Shift right size ( 0 to 15 )
                                // Delay for this is
                                // MUX2B
output SROneMore,       // extra one to give shift of 16
       SRToSticky;      // Massive shift reduce to sticky
output notWaitForShifter;       // Need to generate this quickly 
                                // delay is NOR4, NAND3, AND4
                                // Dont care unless ShiftforAl asserted
ME_TIEOFF toff (,gnd);

// generate correct shift right value. This may be either forced to 8
// for mul or INT stuff, or 0 to 16 for first step of align, or
// further shifts by 16 if required
// Generate wait if additional shift is required
// Note shift by 16 is a delayed shift wait except on first shift
// SRToSticky Being asserted means the rest of the shifter doesnt
// matter. Note since in the shifter the sticky is set to one this
// must NOT be applied to zero fraction parts.
// Wait is only valid while Rom_ShiftforAl is asserted

  ME_NAND3  g12 ( notExpResult[5], notExpResult[4], FS, notSmallShift );

  ME_NAND6_B gxz ( notExpResult[11], notExpResult[10], notExpResult[9], notExpResult[8], notExpResult[7], notExpResult[6], BigShift);
  ME_NMUX2B_B sm4 ( FS, gnd, BigShift, notSRToSticky);
  ME_INV_B   g19 ( notSRToSticky, SRToSticky );

  // Can align in 1 for BigShift or small shift 00xxxx or exact 010000
  ME_AND2   gr5  ( notSmallShift, notShiftCount1, bozoid );
  ME_NAND2  g15  ( notSRToSticky, bozoid, notWaitForShifter );

  // note shift by 8 is dominant so dont worry about FS on shift by 8
  ME_FD1    err ( Phi, Rom_ShiftForAl, , notPrevShift);
  ME_NAND2  g32 ( Rom_ShiftForAl, notPrevShift, notFS );
  ME_INVA   g33 ( notFS, FS );

  wire [5:4] ExpResult;

  // Decrement on notFS, OR ShBy16first
  ME_INV_A   g16 ( notExpResult[5], ExpResult[5] );
  ME_INV_A   g17 ( notExpResult[4], ExpResult[4] );

  ShiftDec  d  ( Phi, FS, notFS, ExpResult[5:4], notShiftCount1 );

  // Set correct shift value
  ME_NOR2    sby8 (Rom_ShBy8, Rom_ShiftForAl, notShiftBy8);
  ME_INV_A    sbfa (Rom_ShiftForAl, notRom_ShiftForAl);

  ME_NMUX2B_B  sm3 (FS, notShiftBy8,       notExpResult[3], SRControl[3]);
  ME_NMUX2B_B  sm2 (FS, notRom_ShiftForAl, notExpResult[2], SRControl[2]);
  ME_NMUX2B_B  sm1 (FS, notRom_ShiftForAl, notExpResult[1], SRControl[1]);
  ME_NMUX2B_B  sm0 (FS, notRom_ShiftForAl, notExpResult[0], SRControl[0]);

  ME_AND2_B  a90 (Rom_ShiftForAl, notFS, SROneMore);

endmodule



/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)fp_ctl.v	1.1  4/7/92
//
//  FPU core control top-level interconnect module.
//
//  This interconnect module was produced by Synopsys grouping and then edited
//  by hand to remove hierarchy from signal names and make
//  things more readable.

module fp_ctl ( ss_clock, AregMaster_32, BregFPMSBM1, CALSB, CBLSB, CCLSB,
	Conditionals_3, Conditionals_10, Conditionals_12,
	FpLd, FpOp, FracAgtB, FracBregSign, FracZero,
	notAInfNAN, notAM31_3, notAM2_0, notAregMasterFPMSBP1, notAZeroDenorm,
	notBInfNAN, notBZeroDenorm, notExpUnderflow, notExpOverflow,
	notExpException, notPossibleOv, notFracZero, notSticky1, ResetIn,
	RS2_63, RS1_63, StickyForSR1, SubResultNorm, AregMaster_57_40,
	AregMaster_7_0, CarryInLSBs, CregInSL2SQRT, CregSNBits, ExpIn,
	FpInst, notExpShiftResult, notMultip, notSticky4, RoundingMode,
	SALSBs, SBLSBs, SCLSBs, StepRemBits, Sticky2, StickyExtra, SumInLSBs,
	TregLSBs, U_RomOutputs,
	CarryIn, CarryOut0, CarryOut3, Constantb, Constantc, Constantd,
	Constante, Constantf, Constantg, Constanth, ExpAregLC0, ExpAregLC1,
	ExpAregLoadEn, ExpBregLC0, ExpBregLC1, ExpBregLoadEn, FracAregLoadEn,
	FracBregLoadEn, FracCregLC, FracCregLoadEn, FracTregLoadEn, FpBusy,
	InitialCarryBit, InitialMulStep, notFracYFromD1A, notFracYFromD2A,
	notFracYFromD3A, notNO_1, notStickyInForSR, OprSNnotDB, RomOutputs_18,
	RomOutputs_20, RomOutputs_27, RomOutputs_55, SignResult, SNnotDB,
	SROneMore, SRToSticky, SumCarryLoadEn, SumOut0, ConditionCodes, Excep,
	FracAregLC, FracBregLC, FracRound, FracYbusLSBs, InForCreg,
	InForCregDB, InFromCregOr0, LIB, MulLenSel, notsh, Pos,
	RomOutputs_32_29, RomOutputs_46_44, SelectedMIptr, Shift, SRControl,
	TopBitsIn, Zero,
	ss_scan_mode, fp_ctl_scan_in, fp_ctl_scan_out);


input	ss_clock, AregMaster_32, BregFPMSBM1, CALSB, CBLSB, CCLSB,
	Conditionals_3, Conditionals_10, Conditionals_12,
	FpLd, FpOp, FracAgtB, FracBregSign, FracZero,
	notAInfNAN, notAM31_3, notAM2_0, notAregMasterFPMSBP1, notAZeroDenorm,
	notBInfNAN, notBZeroDenorm, notExpUnderflow, notExpOverflow,
	notExpException, notPossibleOv, notFracZero, notSticky1, ResetIn,
	RS2_63, RS1_63, StickyForSR1, SubResultNorm,
	ss_scan_mode, fp_ctl_scan_in ;

input	[57:40] AregMaster_57_40 ;
input	[7:0] AregMaster_7_0 ;
input	[2:0] CarryInLSBs ;
input	[1:0] CregInSL2SQRT ;
input	[1:0] CregSNBits ;
input	[7:0] ExpIn ;
input	[9:0] FpInst ;
input	[12:0] notExpShiftResult ;
input	[8:0] notMultip ;
input	[3:0] notSticky4 ;
input	[1:0] RoundingMode ;
input	[1:0] SALSBs ;
input	[1:0] SBLSBs ;
input	[1:0] SCLSBs ;
input	[3:0] StepRemBits ;
input	[1:0] Sticky2 ;
input	[1:0] StickyExtra ;
input	[2:0] SumInLSBs ;
input	[1:0] TregLSBs ;
input	[63:0] U_RomOutputs ;		// unbuffered ROM data output

output	CarryIn, CarryOut0, CarryOut3, Constantb, Constantc, Constantd,
	Constante, Constantf, Constantg, Constanth, ExpAregLC0, ExpAregLC1,
	ExpAregLoadEn, ExpBregLC0, ExpBregLC1, ExpBregLoadEn, FracAregLoadEn,
	FracBregLoadEn, FracCregLC, FracCregLoadEn, FracTregLoadEn, FpBusy,
	InitialCarryBit, InitialMulStep, notFracYFromD1A, notFracYFromD2A,
	notFracYFromD3A, notNO_1, notStickyInForSR, OprSNnotDB, RomOutputs_18,
	RomOutputs_20, RomOutputs_27, RomOutputs_55, SignResult, SNnotDB,
	SROneMore, SRToSticky, SumCarryLoadEn, SumOut0, 
	fp_ctl_scan_out ;

output	[1:0] ConditionCodes;
output	[5:0] Excep ;
output	[2:0] FracAregLC ;
output	[2:0] FracBregLC ;
output	[4:0] FracRound ;
output	[1:0] FracYbusLSBs ;
output	[1:0] InForCreg ;
output	[1:0] InForCregDB ;
output	[1:0] InFromCregOr0 ;
output	[2:0] LIB ;
output	[4:0] MulLenSel ;
output	[3:1] notsh ;
output	[3:0] Pos ;
output	[32:29] RomOutputs_32_29 ;
output	[46:44] RomOutputs_46_44 ;
output	[7:0] SelectedMIptr ;		// unregistered ROM address
output	[3:0] Shift ;
output	[3:0] SRControl ;
output	[8:0] TopBitsIn ;
output	[3:0] Zero ;

wire	notWaitForShifter, SignAreg, PreventSwap, PreventSwapExp, XDest,
	CMPDecoded, CMPEDecoded, notAbortWB, NegateOprSign, Unimplemented,
	Status_6, notSignAFromB, notSignBFromA, DBnotSN,
	Conditionals_2, Conditionals_6, Conditionals_7, Conditionals_15 ;

wire [6:0] YDest ;
wire [1:0] notNO ;
wire [63:0] RomOutputs ;

assign notNO_1 = notNO[1] ;
assign RomOutputs_18 = RomOutputs[18] ;
assign RomOutputs_20 = RomOutputs[20] ;
assign RomOutputs_27 = RomOutputs[27] ;
assign RomOutputs_55 = RomOutputs[55] ;
assign RomOutputs_32_29 = RomOutputs[32:29] ;
assign RomOutputs_46_44 = RomOutputs[46:44] ;


    ME_TIEOFF toff (vdd, gnd);

    Control cl  ( .Phi (ss_clock ), .ResetIn (ResetIn ),
	.notExpAgtB (notExpShiftResult[12] ), 
	.notAInfNan (notAInfNAN ), .notAZeroDenorm (notAZeroDenorm ),
	.notBInfNan (notBInfNAN ), .notBZeroDenorm (notBZeroDenorm ),
	.notExpUnderflow (notExpUnderflow ), .notExpOverflow (notExpOverflow ),
	.notExpException (notExpException ),
	.notWaitForShifter (notWaitForShifter ), .notNO (notNO ),
	.SubResultNorm (SubResultNorm ), .notPossibleOv (notPossibleOv ),

	.Conditionals_14_8 ({vdd, AregMaster_57_40[54], Conditionals_12,
	FracAgtB, Conditionals_10, FracZero, notFracZero }),

	.Conditionals_6_0 ( {Conditionals_6, SignAreg, ExpIn[0], 
	Conditionals_3, Conditionals_2 , SNnotDB, gnd} ),

	.FpInst (FpInst ), .FpOp (FpOp ), .FpLd (FpLd ),
	.PreventSwap (PreventSwap ), .PreventSwapExp (PreventSwapExp ),
	.RCondition (Conditionals_15 ),
	.SelectedMIptr (SelectedMIptr ),
	.U_RomOutputs (U_RomOutputs ),
	.RomOutputs (RomOutputs[63:0] ),
	.YDest (YDest[6:0] ), .XDest (XDest ), .CMPDecoded (CMPDecoded ),
	.CMPEDecoded (CMPEDecoded ), .AregOprExc (Conditionals_7 ),
	.notAbortWB (notAbortWB ),
	.Reset (Reset ), .Busy (FpBusy ), .NegateOprSign (NegateOprSign ),
	.UnimpOut (Unimplemented )  );

    frac_ctl fracctl ( .Phi(ss_clock), .AregMaster_32 (AregMaster_32 ),
	.BregFPMSBM1 (BregFPMSBM1 ), .CALSB (CALSB), .CBLSB (CBLSB ),
	.CCLSB (CCLSB ), .FracBregSign (FracBregSign ), .FracSign (FracAgtB ),
	.LoadForInt (RomOutputs[19] ), .LoadOprs (FpLd ),
	.notAbortWB (notAbortWB ), .notAM31_3 (notAM31_3 ),
	.notAM2_0 (notAM2_0), .notAregMasterFPMSBP1 (notAregMasterFPMSBP1 ),
	.notSticky1 (notSticky1), .PreventSwap (PreventSwap ),
	.Rom_Inexact (Status_6 ), .RomShForAlign (RomOutputs[21] ),
	.SNnotDB(SNnotDB), .SROneMore (SROneMore), .SRToSticky (SRToSticky ),
	.StickyForSR1 (StickyForSR1),
	.AregMaster_57_40 ( AregMaster_57_40[57:40] ),
	.AregMaster_7_0 (AregMaster_7_0[7:0] ),
	.CarryInLSBs (CarryInLSBs ), .CregInSL2SQRT ( CregInSL2SQRT ),
	.CregSNBits (CregSNBits ), .ExpIn ({SignAreg, ExpIn}),
	.notMultip (notMultip ), .notSticky4 (notSticky4 ),
	.Rom_63_48 (RomOutputs[63:48] ), .SALSBs (SALSBs ), .SBLSBs (SBLSBs ),
	.SCLSBs (SCLSBs ), .SRControl (SRControl ), .StepRemBits (StepRemBits),
	.Sticky2 (Sticky2 ), .StickyExtra (StickyExtra ),
	.SumInLSBs (SumInLSBs ), .TregLSBs (TregLSBs ), .YDest (YDest[6:0] ),
	.CarryOut0 (CarryOut0 ), .CarryOut3 (CarryOut3 ),
	.FracAregLoadEn (FracAregLoadEn ), .FracBregLoadEn (FracBregLoadEn ),
	.FracCregLoadEn (FracCregLoadEn ), .FracCregLC (FracCregLC ),
	.FracTregLoadEn (FracTregLoadEn ), .Inexact (Excep[0] ),
	.InitialCarryBit (InitialCarryBit ), .InitialMulStep (InitialMulStep ),
	.notFracYFromD1A (notFracYFromD1A ),
	.notFracYFromD2A (notFracYFromD2A ), 
	.notFracYFromD3A (notFracYFromD3A ), 
	.notStickyInForSR (notStickyInForSR ),
	.SumCarryLoadEn (SumCarryLoadEn ), .SumOut0 (SumOut0 ),
	.FracAregLC (FracAregLC ), .FracBregLC (FracBregLC ),
	.FracYbusLSBs (FracYbusLSBs ), .InForCreg (InForCreg ),
	.InForCregDB (InForCregDB ), .InFromCregOr0 (InFromCregOr0 ),
	.LIB ( LIB ), .notNO (notNO ), .notsh (notsh ), .Pos (Pos ),
	.Shift (Shift ), .TopBitsIn (TopBitsIn ), .Zero (Zero )  );

    SignDp sdp  ( .Phi (ss_clock ), .Reset (Reset ),
	.RomSignLength ( RomOutputs[43:39] ),
	.RomStatus ( RomOutputs[26:22] ), .FracXFromRound (RomOutputs[47] ),
	.XDest (XDest ), .CMPDecoded (CMPDecoded ), 
	.CMPEDecoded (CMPEDecoded ), .SignOpA (RS2_63 ), .SignOpB (RS1_63 ),
	.notAbortWB (notAbortWB ), .PreventSwap (PreventSwap ), .FpLd (FpLd ),
	.FpOp (FpOp ), .NegateOprSign (NegateOprSign ),
	.notSignAFromB (notSignAFromB ), .notSignBFromA (notSignBFromA ),
	.OprRoundMode (RoundingMode ), .FpInst1 ( FpInst[1] ),
	.Unimplemented (Unimplemented ), .SignResult (SignResult ),
	.AregSign (SignAreg ), .AregXORBreg (Conditionals_2 ),
	.FpExc_Unimp (Excep[5] ), .Status_6_2 ({Status_6 , Excep[4:1] }),
	.ConditionCodes (ConditionCodes ), .OprSNnotDB (OprSNnotDB ),
	.SNnotDB (SNnotDB ), .DBnotSN (DBnotSN ), .MulLenSel (MulLenSel ),
	.RModeMinus (Conditionals_6 ), .FracRoundOut (FracRound )  );


    exp_ctl expctl ( .Phi (ss_clock), .DBnotSN (DBnotSN),
	.FracAregMSB1 (AregMaster_57_40[56] ), .LoadOprs (FpLd),
	.notAbortWB (notAbortWB ), .PreventSwap (PreventSwapExp ),
	.ShiftBy8 (RomOutputs[20] ), .ShiftForAl (RomOutputs[21] ),
	.SNnotDB (SNnotDB ), .notExpShiftResult (notExpShiftResult ),
	.Rom_28_27 (RomOutputs[28:27] ), .Rom_38_33 (RomOutputs[38:33] ),
	.CarryIn (CarryIn ), .Constantb (Constantb ), .Constantc (Constantc ),
	.Constantd (Constantd ), .Constante (Constante ),
	.Constantf (Constantf ), .Constantg (Constantg ),
	.Constanth (Constanth ), .ExpAregLoadEn (ExpAregLoadEn ),
	.ExpAregLC0 (ExpAregLC0 ), .ExpAregLC1 (ExpAregLC1 ),
	.ExpBregLC0 (ExpBregLC0 ), .ExpBregLC1 (ExpBregLC1 ),
	.ExpBregLoadEn (ExpBregLoadEn ), .notSignAFromB (notSignAFromB ),
	.notSignBFromA (notSignBFromA ),
	.notWaitForShifter (notWaitForShifter ), .SROneMore (SROneMore ),
	.SRToSticky (SRToSticky ), .SRControl (SRControl)  );

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)fpuromhdr.v	1.1  4/7/92
//

// original place of define list at the beginning LA 28.02.02

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)frac_ctl.v	1.1  4/7/92
//
//  Top-level interconnect module for the fraction datapath control modules.
//
//  This interconnect module was produced by Synopsys grouping and then edited
//  by hand to remove hierarchy from signal names and make
//  things more readable..

module frac_ctl ( Phi, AregMaster_32, BregFPMSBM1, CALSB, CBLSB, CCLSB,
	FracBregSign, FracSign, LoadForInt, LoadOprs, notAbortWB,
	notAM31_3, notAM2_0, notAregMasterFPMSBP1, notSticky1,
	PreventSwap, Rom_Inexact, RomShForAlign, SNnotDB, SROneMore,
	SRToSticky, StickyForSR1, AregMaster_57_40,
	AregMaster_7_0,
	CarryInLSBs, CregInSL2SQRT, CregSNBits, ExpIn, notMultip, notSticky4,
	Rom_63_48, SALSBs, SBLSBs, SCLSBs, SRControl, StepRemBits, Sticky2,
	StickyExtra, SumInLSBs, TregLSBs, YDest,
	CarryOut0, CarryOut3, FracAregLoadEn, FracBregLoadEn,
	FracCregLoadEn, FracCregLC, FracTregLoadEn, Inexact,
	InitialCarryBit, InitialMulStep, notFracYFromD1A,
	notFracYFromD2A, notFracYFromD3A, notStickyInForSR,
	SumCarryLoadEn, SumOut0, FracAregLC, FracBregLC, FracYbusLSBs,
	InForCreg, InForCregDB, InFromCregOr0, LIB, notNO, notsh, Pos, Shift,
	TopBitsIn, Zero );

input	Phi, AregMaster_32, BregFPMSBM1, CALSB, CBLSB, CCLSB,
	FracBregSign, FracSign, LoadForInt, LoadOprs, notAbortWB,
	notAM31_3, notAM2_0, notAregMasterFPMSBP1, notSticky1,
	PreventSwap, Rom_Inexact, RomShForAlign, SNnotDB, SROneMore,
	SRToSticky, StickyForSR1 ;

input	[57:40] AregMaster_57_40 ;
input	[7:0] AregMaster_7_0 ;
input	[2:0] CarryInLSBs ;
input	[1:0] CregInSL2SQRT ;
input	[1:0] CregSNBits ;
input	[8:0] ExpIn ;
input	[8:0] notMultip ;
input	[3:0] notSticky4 ;
input	[63:48] Rom_63_48 ;
input	[1:0] SALSBs ;
input	[1:0] SBLSBs ;
input	[1:0] SCLSBs ;
input	[3:0] SRControl ;
input	[3:0] StepRemBits ;
input	[1:0] Sticky2 ;
input	[1:0] StickyExtra ;
input	[2:0] SumInLSBs ;
input	[1:0] TregLSBs ;
input	[6:0] YDest ;

output	CarryOut0, CarryOut3, FracAregLoadEn, FracBregLoadEn,
	FracCregLoadEn, FracCregLC, FracTregLoadEn, Inexact,
	InitialCarryBit, InitialMulStep, notFracYFromD1A,
	notFracYFromD2A, notFracYFromD3A, notStickyInForSR,
	SumCarryLoadEn, SumOut0 ;

output	[2:0] FracAregLC ;
output	[2:0] FracBregLC ;
output	[1:0] FracYbusLSBs ;
output	[1:0] InForCreg ;
output	[1:0] InForCregDB ;
output	[1:0] InFromCregOr0 ;
output	[2:0] LIB ;
output	[1:0] notNO ;
output	[3:1] notsh ;
output	[3:0] Pos ;
output	[3:0] Shift ;
output	[8:0] TopBitsIn ;
output	[3:0] Zero ;

wire	LoadFromMult, RomFracBSL2FromC, SelInitRemBits ;
wire	[3:1] DivMultiple ;
wire	[1:0] QuoBits ;


    BregLoadCtl fblc ( .RomFracBregLC( Rom_63_48[60:59] ), .RomBSL2InFromC(
	RomFracBSL2FromC), .LoadOprs(LoadOprs), .notAbortWB(notAbortWB),
	.PreventSwap(PreventSwap), .LoadFromMult(LoadFromMult), .CregInSL2SQRT(
	CregInSL2SQRT[1:0] ), .FracBregLC( FracBregLC[2:0] ), .FracBregLoadEn(
	FracBregLoadEn), .InFromCregOr0( InFromCregOr0[1:0] ) );

    ShiftLeftCtl slc ( .NI_49_47( AregMaster_57_40[49:47] ), .LoadForInt(
	LoadForInt), .LIB( LIB[2:0] ) );

    AregLoadCtl falc ( .ROM( Rom_63_48[58:56] ), .LoadOprs(LoadOprs),
	.notAbortWB(notAbortWB), .PreventSwap(PreventSwap), .FracAregLC(
	FracAregLC[2:0] ), .FracAregLoadEn(FracAregLoadEn), .LoadFromMult(
	LoadFromMult), .SelInitRemBits(SelInitRemBits) );

    TregLoadCtl tlc ( .RomFracTFromRes(Rom_63_48[63] ),
	.notAbortWB(notAbortWB), .FracTregLoadEn(FracTregLoadEn) );

    NormCalSlice an ( .NI( AregMaster_57_40[55:40] ), .notsh( notsh[3:1] ),
	.notNO( notNO[1:0] ) );

    AregInexact aic ( .RomInexactRound(Rom_Inexact), .SNnotDB(SNnotDB),
	.AMCBit(AregMaster_57_40[56] ), .AM32(AregMaster_32), .AM3(
	AregMaster_7_0[3] ), .notAM31_3(notAM31_3), .notAM2_0(notAM2_0),
	.Inexact(Inexact) );

    MultiplierLSB mlsb ( .Rom_ResetMul(Rom_63_48[63] ), .notMultip(
	notMultip[8:0] ), .notAbortWB(notAbortWB), .SumInLSBs(SumInLSBs[2:0] ),
	.CarryInLSBs( CarryInLSBs[2:0] ), .SCLSBs( SCLSBs[1:0] ), .SBLSBs(
	SBLSBs[1:0] ), .SALSBs( SALSBs[1:0] ), .CCLSB(CCLSB), .CBLSB(CBLSB),
	.CALSB(CALSB), .Shift( Shift[3:0] ), .Pos( Pos[3:0] ), .Zero(
	Zero[3:0] ), .CarryOut0(CarryOut0), .CarryOut3(CarryOut3), .SumOut0(
	SumOut0), .SumCarryLoadEn(SumCarryLoadEn), .InitialMulStep(
	InitialMulStep), .InitialCarryBit(InitialCarryBit) );

    DivLog divl ( .Phi(Phi), .AregFPMSBM1(AregMaster_57_40[54] ),
	.BregFPMSBM1(BregFPMSBM1), .StepRemBits( StepRemBits[3:0] ),
	.InitialRemBits( AregMaster_57_40[57:54] ), .SelectInitial(
	SelInitRemBits), .FracSign(FracSign), .DivMultiple( DivMultiple[3:1] ),
	.QuotientBits( QuoBits[1:0] ) );

    CregLoadCtl fclc ( .RomCregCtl(Rom_63_48[62:61] ), .QuoBits(QuoBits[1:0] ),
	.notAbortWB(notAbortWB), .SNnotDB(SNnotDB), .CregSNBits(
	CregSNBits[1:0] ), .InForCreg( InForCreg[1:0] ), .InForCregDB(
	InForCregDB[1:0] ), .RomFracBSL2FromC(RomFracBSL2FromC),
	.FracCregLoadCtl0(FracCregLC), .FracCregLoadEn(FracCregLoadEn) );

    ShiftRightCtl src ( .LoadForInt(LoadForInt), .AregMasterBuf_57_55(
	AregMaster_57_40[57:55] ), .ExpIn( ExpIn[8:0] ), .SRControl(
	SRControl[3:0] ), .SROneMore(SROneMore), .SRToStky(SRToSticky),
	.Stky8( AregMaster_7_0[7:0] ), .notStky4( notSticky4[3:0] ),
	.Stky2( Sticky2[1:0] ), .notStky1(notSticky1), .StkyExtra(
	StickyExtra[1:0] ), .RomShForAl(RomShForAlign), .notStkyInForSR(
	notStickyInForSR), .TopBitsIn( TopBitsIn[8:0] ) );

    YMuxCtl fymc ( .RomYMuxCtl( Rom_63_48[55:48] ), .YFunc( YDest[6:0] ),
	.FracAregFPMSBP1( AregMaster_57_40[56] ), .notFracAregFPMSBP1(
	notAregMasterFPMSBP1), .FracBregSign(FracBregSign), .DivMultiple(
	DivMultiple[3:1] ), .AregLSBs( AregMaster_7_0[2:0] ),
	.StickyForSR1(StickyForSR1), .TregLSBs( TregLSBs[1:0] ),
	.notFracYFromD1A(notFracYFromD1A), .notFracYFromD2A(notFracYFromD2A),
	.notFracYFromD3A(notFracYFromD3A), .FracYLSBs( FracYbusLSBs[1:0] ) );

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)implementedcheck.v	1.1  4/7/92
//
module ImplementedCheck (Phi,
// input
                         ResetImp,
                         notReset,
                         FpOp,
                         EntryPoint,
                         FpInst,             // sparc FP inst field
// outputs
                         notDecodedUnImp,
                         notUnimpOrReset,
                         notAbortInst, ResetAbortInst,
                         FPOP2Map,
                         UnImpOut);

input Phi,
      ResetImp,  // Reset beore modification
      notReset,     // Reset After modification
      FpOp,
      EntryPoint;
input [9:4] FpInst;
output notDecodedUnImp;   // Go busy quickly
output notUnimpOrReset,
       notAbortInst,       // Aborting so remain busy for two extra cycles
       ResetAbortInst,
       FPOP2Map,
       UnImpOut;
// ***************************************//
// Imp Check                      //
// ***************************************//

ME_NAND2 idg0 (FpInst[4], FpInst[6], notFpInst4and6);
ME_OR2   idg1 (FpInst[7], notFpInst4and6, notFPOP2Map);
ME_INV_B idg2 (notFPOP2Map, FPOP2Map);
ME_XOR2  idg3 (FpInst[9], FPOP2Map, notEntryMap);
ME_OR2   idg4 (notEntryMap, FpInst[8], UnImpMap);
ME_INV_A rrr7 (notReset, Reset);
ME_OR2   ggh3 (FpOp, Reset, UnImpMapEn);
ME_FD1E  ggh1 (Phi, UnImpMapEn, UnImpMap, , ImpMap);
ME_FD1   rrr6 (Phi, FpOp, FpOpHeld, notFpOpHeld);

ME_INVA  ggh2 (ResetImp, notResetImp);

ME_NAND3 ggh4 (ImpMap, EntryPoint, notReset, notImpStart);
ME_NAND3 ddfd (notImpStart, notResetImp, FpOpHeld, notDecodedUnImp);

ME_NAND2   g_1  (notFpOpHeld, notReset, FpOpHeldOrReset);
ME_NAND2_B g_3  (FpOpHeldOrReset, notImpStart, notUnimpOrReset);

ME_OR2   icor (FpOpHeld, ResetImp, NewInsOrReset);

ME_FD1E  ni   (Phi, NewInsOrReset, notDecodedUnImp, , UnImpOut );

// ***************************************//
// Kill UnImp Inst         //
// ***************************************//

// KillUnImp is used to abort loading of MIptr
// In addition it is used to cause at least three busy cycles
// after which the FPU will accept new Insts
// The FPU is kept in reset until the last busy cycle

ME_FD1   ggh11 (Phi, notDecodedUnImp, notRemainBusy1, RemainBusy1);
ME_FD1   ggh12 (Phi, notRemainBusy1, notRemainBusy2, RemainBusy2);
ME_NAND2 ggh5  (notDecodedUnImp, notRemainBusy1,
                ResetAbortInst);
ME_AND2  ggh6  (notRemainBusy1, notRemainBusy2, notAbortInst);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)lengthlogic.v	1.1  4/7/92
//
module LengthLogic (Phi, Reset,
                    FpInst1,
                    FpLd,
                    FpOp,
                    RomToggleLength,
                    notAbortWB,
                    OprSNnotDB,
                    BuffSNnotDB,
                    U_SNnotDB,
                    DBnotSN,
                    MulLenSel);

input  Phi, Reset,
       FpInst1, FpLd, FpOp, RomToggleLength, notAbortWB;
output OprSNnotDB,
       U_SNnotDB,
       DBnotSN,
       BuffSNnotDB;
output [4:0]MulLenSel;

/* *************************************** */
/* Operand Length Logic                    */
/* *************************************** */
// MUX to FpInst if FpOp
//               else used FpInst from previous cycle  (original code)
// ME_FD1_B   crg1  (Phi, FpInst1, notOprSNnotDBL, );
// ME_MUX2B_B mlen  (FpOp, notOprSNnotDBL, FpInst1, notOprSNnotDB);

	// timing fix -- dhn 04/15/91 -- this will only work if FpLd is
	// always asserted 1 cycle after FpOp, never simultaneously
ME_FD1_B   crg1  (Phi, FpInst1, notOprSNnotDB, );
ME_INV_C   new0  (notOprSNnotDB, OprSNnotDB);

/* *************************************** */
/* Length Latch                            */
/* *************************************** */

ME_AND2    rmg3  (RomToggleLength, notAbortWB, LenFromnotLen);

ME_OR3     ell   (FpLd, LenFromnotLen, Reset, Enable);
ME_NOR2    cllr  (SNnotDB, Reset, notResetSNnotDB);
ME_NMUX2B  lm    (FpLd, notResetSNnotDB, OprSNnotDB, notMuxedLength);

ME_NMUX2B  llm   (Enable, DBnotSNb, notMuxedLength, U_SNnotDB);
ME_INVA    lli   (U_SNnotDB, U_DBnotSN);
ME_FD1_B   llf   (Phi, U_SNnotDB, SNnotDB, DBnotSNb);
ME_FD1_B   lif   (Phi, U_DBnotSN, DBnotSN, );
ME_FD1_B   lig   (Phi, U_DBnotSN, DBnotSNa, ); // goes only to
ME_INV_C   llb   (DBnotSNa, BuffSNnotDB);      // High drive version

ME_FD1_B   llf0  (Phi, U_SNnotDB, MulLenSel[0], );
ME_FD1_B   llf1  (Phi, U_SNnotDB, MulLenSel[1], );
ME_FD1_B   llf2  (Phi, U_SNnotDB, MulLenSel[2], );
ME_FD1_B   llf3  (Phi, U_SNnotDB, MulLenSel[3], );
ME_FD1_B   llf4  (Phi, U_SNnotDB, MulLenSel[4], );

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)microcoderom.v	1.1  4/7/92
//
module MicrocodeRom (Phi, int_UpdateOutputs, U_RomOutputs,
                     RomOutputs,
                     XDest,
                     YDest );

input  Phi;
input  int_UpdateOutputs;
input [`RomWidthM1:0] U_RomOutputs;	// unbuffered output from ME_UROM

output [`RomWidthM1:0]	RomOutputs;	// latched version of U_RomOutputs
output [6:0] YDest;
output XDest;


ME_TIEOFF toff (, gnd);

	// This flip-flop is only used during scan operations (to allow
	// scan testing of the rom).  It will be connected by the
	// scan-stitcher when this block is routed.  
ME_FD1 scanloadrom_ff (.cp(Phi), .d(gnd), .q(scanloadrom) );
ME_OR2 Uscanloadrom (int_UpdateOutputs, scanloadrom, UpdateOutputs);

// ***************************************//
// ROM :- ROM outputs latched             //
// ***************************************//

// Rom outputs are held while waiting, Aborting the instruction,
//                            Nullifiying and in exceptions.
// The FB and control bits are only held on abort and wait.

ME_FREGA_1_64 romor (Phi, UpdateOutputs, U_RomOutputs, RomOutputs);

ME_FD1E_B romor540 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc0], YDest[0],);
ME_FD1E_B romor551 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc1], YDest[1],);
ME_FD1E_B romor542 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc2], YDest[2],);
ME_FD1E_B romor553 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc0], YDest[3],);
ME_FD1E_B romor554 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc1], YDest[4],);
ME_FD1E_B romor555 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc2], YDest[5],);
ME_FD1E_B romor556 (Phi, UpdateOutputs, U_RomOutputs[`u_FracYbusFromFunc0], YDest[6],); // SQRT bit
ME_FD1E_B romor557 (Phi, UpdateOutputs, U_RomOutputs[`u_FracXbusFromDest2], XDest,); // Round bit

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)miptr.v	1.1  4/7/92
//
module MIptr (Phi,
              ExMIptrLSBs,
              DyadicExc,
              notInstAndNoExc,
              notBranchTakenMIS,
              notResetOrUnimp,
              MIptrLoadEnable,
              Feedback, FpInst,
	      SelectedMIptr,
              RomMIptr, notRomMIptr);

input [2:0] ExMIptrLSBs;
input [`MIptrMSB:0] Feedback;
input [7:0] FpInst;
input Phi;
input DyadicExc,
      notInstAndNoExc,
      notBranchTakenMIS,
      notResetOrUnimp,
      MIptrLoadEnable;
output [`MIptrMSB:0] SelectedMIptr, RomMIptr, notRomMIptr;

ME_TIEOFF toff (vdd, gnd);

/* ****************************************************** *
 *                                                        *
 *  1)     Enable has been removed from MIptr             *
 *                                                        *
 *                                                        *
 *                                                        *
 * ****************************************************** */

wire [`MIptrMSB:0] NextMIptr;

// ***************************************//
// Operand Exception Address Generation   //
// ***************************************//

ME_OR2 om2n6 (RomMIptr[2], notRomMIptr[6], MI2ornotMI6);
ME_NAND2 om16  (notRomMIptr[1], notRomMIptr[6], MI6orMI1);

MiptrIncrement mii (RomMIptr, NextMIptr);

MIptrMultiplexor mim
                 (Phi,
                  DyadicExc,
                  notInstAndNoExc,
                  notBranchTakenMIS,
                  notResetOrUnimp,
                  MIptrLoadEnable,
                  {FpInst[7], FpInst[3], FpInst[0], FpInst[1],
                   FpInst[6], FpInst[2], FpInst[4], FpInst[5]}, // RomEntry := SPARC code to ROM entry point mapping  //
                  NextMIptr,
                  {RomMIptr[1], MI2ornotMI6, RomMIptr[6], MI6orMI1, gnd, ExMIptrLSBs}, // ExMIptr
                  Feedback,
		  SelectedMIptr,
                  RomMIptr,
                  notRomMIptr);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)miptrincrement.v	1.1  4/7/92
//
module MiptrIncrement (RomMIptr, NextMIptr);
input  [7:0] RomMIptr;
output [7:0] NextMIptr;

// Increment of MI required (8 bits)
// always @MIptr NextMIptr = MIptr + 1;

ME_XOR2 ha_7 (RomMIptr[7], B7, NextMIptr[7] );
ME_ADD2 ha_6 (RomMIptr[6], B6, NextMIptr[6], B7);
ME_ADD2 ha_5 (RomMIptr[5], B5, NextMIptr[5], B6);
ME_ADD2 ha_4 (RomMIptr[4], B4, NextMIptr[4], B5);
ME_ADD2 ha_3 (RomMIptr[3], B3, NextMIptr[3], B4);
ME_ADD2 ha_2 (RomMIptr[2], B2, NextMIptr[2], B3);
ME_ADD2 ha_1 (RomMIptr[1], RomMIptr[0], NextMIptr[1], B2);
ME_INVA ha_0 (RomMIptr[0], NextMIptr[0]);
endmodule



/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)miptrmultiplexor.v	1.1  4/7/92
//
module MIptrMultiplexor
     (Phi,
      DyadicExc,
      notInstAndNoExc,
      notBranchTakenMIS,
      notResetOrUnimp,
      MIptrLoadEnable,
      RomEntry,
      NextMIptr,
      ExMIptr,
      Feedback,
      SelectedMIptr,	// unregistered version of RomMIptr
      RomMIptr,
      notRomMIptr);
input Phi;
input  DyadicExc,
       notInstAndNoExc,
       notBranchTakenMIS,
       notResetOrUnimp,
       MIptrLoadEnable;
input [7:0] RomEntry, NextMIptr,
            ExMIptr, Feedback;
output [7:0] SelectedMIptr, RomMIptr, notRomMIptr;

wire [7:0] Z1, Z2, Z5, Z3, notFeedbackW;

ME_INV_C ble (MIptrLoadEnable, _MIptrLoadEnable);

ME_NMUX_2B_8 g2 (DyadicExc, NextMIptr, ExMIptr, Z1);
ME_MUX_2B_8 g3 (notInstAndNoExc, RomEntry, Z5,          Z2);

ME_NMUX_2B_8 g4 (_MIptrLoadEnable, Z2, RomMIptr,       Z3);

ME_NAND2 g6_0 (notResetOrUnimp, Z1[0], Z5[0]);
ME_NAND2 g6_1 (notResetOrUnimp, Z1[1], Z5[1]);
ME_NAND2 g6_2 (notResetOrUnimp, Z1[2], Z5[2]);
ME_NAND2 g6_3 (notResetOrUnimp, Z1[3], Z5[3]);
ME_NAND2 g6_4 (notResetOrUnimp, Z1[4], Z5[4]);
ME_NAND2 g6_5 (notResetOrUnimp, Z1[5], Z5[5]);
ME_NAND2 g6_6 (notResetOrUnimp, Z1[6], Z5[6]);
ME_NAND2 g6_7 (notResetOrUnimp, Z1[7], Z5[7]);

ME_NMUX_2B_8 g5 (_MIptrLoadEnable, Feedback, RomMIptr,          notFeedbackW);

/* ********************************************************* */

// This bit should be converted into MUX and LATCH

/* ********************************************************* */

ME_NMUX2B g10 (notBranchTakenMIS, notFeedbackW[0], Z3[0], SelectedMIptr[0] );
ME_NMUX2B g11 (notBranchTakenMIS, notFeedbackW[1], Z3[1], SelectedMIptr[1] );
ME_NMUX2B g12 (notBranchTakenMIS, notFeedbackW[2], Z3[2], SelectedMIptr[2] );
ME_NMUX2B g13 (notBranchTakenMIS, notFeedbackW[3], Z3[3], SelectedMIptr[3] );
ME_NMUX2B g14 (notBranchTakenMIS, notFeedbackW[4], Z3[4], SelectedMIptr[4] );
ME_NMUX2B g15 (notBranchTakenMIS, notFeedbackW[5], Z3[5], SelectedMIptr[5] );
ME_NMUX2B g16 (notBranchTakenMIS, notFeedbackW[6], Z3[6], SelectedMIptr[6] );
ME_NMUX2B g17 (notBranchTakenMIS, notFeedbackW[7], Z3[7], SelectedMIptr[7] );

ME_FD1 mib0 (Phi, SelectedMIptr[0], RomMIptr[0], notRomMIptr[0]) ;
ME_FD1 mib1 (Phi, SelectedMIptr[1], RomMIptr[1], notRomMIptr[1]) ;
ME_FD1 mib2 (Phi, SelectedMIptr[2], RomMIptr[2], notRomMIptr[2]) ;
ME_FD1 mib3 (Phi, SelectedMIptr[3], RomMIptr[3], notRomMIptr[3]) ;
ME_FD1 mib4 (Phi, SelectedMIptr[4], RomMIptr[4], notRomMIptr[4]) ;
ME_FD1 mib5 (Phi, SelectedMIptr[5], RomMIptr[5], notRomMIptr[5]) ;
ME_FD1 mib6 (Phi, SelectedMIptr[6], RomMIptr[6], notRomMIptr[6]) ;
ME_FD1 mib7 (Phi, SelectedMIptr[7], RomMIptr[7], notRomMIptr[7]) ;

/*ME_FD2_B mib0 (Phi, notBranchTakenMIS, notFeedbackW[0], Z3[0], notRomMIptr[0], RomMIptr[0]) ;
ME_FD2_B mib1 (Phi, notBranchTakenMIS, notFeedbackW[1], Z3[1], notRomMIptr[1], RomMIptr[1]) ;
ME_FD2_B mib2 (Phi, notBranchTakenMIS, notFeedbackW[2], Z3[2], notRomMIptr[2], RomMIptr[2]) ;
ME_FD2_B mib3 (Phi, notBranchTakenMIS, notFeedbackW[3], Z3[3], notRomMIptr[3], RomMIptr[3]) ;
ME_FD2_B mib4 (Phi, notBranchTakenMIS, notFeedbackW[4], Z3[4], notRomMIptr[4], RomMIptr[4]) ;
ME_FD2_B mib5 (Phi, notBranchTakenMIS, notFeedbackW[5], Z3[5], notRomMIptr[5], RomMIptr[5]) ;
ME_FD2_B mib6 (Phi, notBranchTakenMIS, notFeedbackW[6], Z3[6], notRomMIptr[6], RomMIptr[6]) ;
ME_FD2_B mib7 (Phi, notBranchTakenMIS, notFeedbackW[7], Z3[7], notRomMIptr[7], RomMIptr[7]) ; */

/*CSL_FD1SP mib0 (notFeedbackW[0], Phi, Z3[0], notBranchTakenMIS, notRomMIptr[0], RomMIptr[0]);
CSL_FD1SP mib1 (notFeedbackW[1], Phi, Z3[1], notBranchTakenMIS, notRomMIptr[1], RomMIptr[1]);
CSL_FD1SP mib2 (notFeedbackW[2], Phi, Z3[2], notBranchTakenMIS, notRomMIptr[2], RomMIptr[2]);
CSL_FD1SP mib3 (notFeedbackW[3], Phi, Z3[3], notBranchTakenMIS, notRomMIptr[3], RomMIptr[3]);
CSL_FD1SP mib4 (notFeedbackW[4], Phi, Z3[4], notBranchTakenMIS, notRomMIptr[4], RomMIptr[4]);
CSL_FD1SP mib5 (notFeedbackW[5], Phi, Z3[5], notBranchTakenMIS, notRomMIptr[5], RomMIptr[5]);
CSL_FD1SP mib6 (notFeedbackW[6], Phi, Z3[6], notBranchTakenMIS, notRomMIptr[6], RomMIptr[6]);
CSL_FD1SP mib7 (notFeedbackW[7], Phi, Z3[7], notBranchTakenMIS, notRomMIptr[7], RomMIptr[7]);*/
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)miselect.v	1.1  4/7/92
//
module MISelect (Phi,
                 notReset,
                 notBrTaken,
                 notDecodedUnimp,
                 MIFromInstN, MIFromInstB,
                 notAbortInst, notAbortNulExc,
                 notResetOrUnimp,
                 DyadicOprExc, notSampledWait,
                 FpOp,
                 notSingleCycInst,
// outputs
                 BTHeld,
                 Busy, notIdleHeld,
                 notInstAndNoExc,
                 MILoadEnable);

input Phi, notReset;
input    notBrTaken,
         notDecodedUnimp,
         MIFromInstN, MIFromInstB,
         notAbortInst, notAbortNulExc,
         notResetOrUnimp,
         DyadicOprExc, notSampledWait,
         FpOp,
         notSingleCycInst;    // Is single cycle
output   BTHeld;
output   Busy, notIdleHeld,
         notInstAndNoExc,
         MILoadEnable;

ME_TIEOFF toff (vdd, gnd);

ME_INVA iecepl (DyadicOprExc, notDyadicOprExc);

// ***************************************//
// Decide if next is new Inst      //
// ***************************************//

// MIFromInstN  Execute Inst if Br not taken
// MIFromInstB  Execute Inst Br taken
//                        Note delay cycle

ME_NAND3 g4_0 (MIFromInstN, notAbortNulExc, notSampledWait,
               notMIFromInstNExc);
ME_NAND2 g4_1 (MIFromInstN, notAbortNulExc, // notSampledWait, Shouldnt be a function of this
               notMIFromInstNExcNS);

ME_NAND2 g4_2 (MIFromInstB, notSampledWait, notMIFromInstBW);
ME_FD1   g4_3 (Phi, notMIFromInstBW, , MIFromInstBHeld);
ME_NAND2 g4_4 (BTHeld, MIFromInstBHeld, s_0);
ME_FD1   g4_5  (Phi, notResetOrUnimp, nots_1, );
ME_AND4  g4_6 (s_0, nots_1, notSingleCycInst, notIdleHeld, notZZTop);
ME_NAND2 g4_7 (notZZTop, notMIFromInstNExc, MIFromInst);
ME_NAND2 g4_8 (notZZTop, notMIFromInstNExcNS, MIFromInstNS);

// ***************************************//
// Are we going to be idle                //
// ***************************************//

ME_INVA   g5_0 (FpOp, notFpOp);
ME_NAND2  g5_1 (MIFromInst, notFpOp, notIdleIfNotBred);

ME_FD1    g5_3 (Phi, notIdleIfNotBred, notIIfNotBredHld, );
ME_NMUX2B g5_2 (notBTHeld, vdd, notIIfNotBredHld, IdleHeldNR);

ME_NAND2  g5_4 (IdleHeldNR, notReset, notIdleHeld);

// ***************************************//
// Select next MI for ROM to decode    //
// ***************************************//

// Combine Wait Exception and Br logic into ROM control
//
ME_BUF_B mie0 (notSampledWait, MILoadEnable); // Buff over 8 bits
//
ME_NAND3_B g0_0  (MIFromInstNS, notDyadicOprExc, notResetOrUnimp,
                  notInstAndNoExc);

// ***************************************//
// Started New Inst                //
// ***************************************//

// Requirement for testing for implemented entry points.
// These need to be qualified as being the first Inst
// since garbage code may jump through an entry point
// thus setting the implemented flag.

// Optimise

// Latch BT
ME_FD1 g2_1  (Phi, notBrTaken, notBTHeld, BTHeld);

// ***************************************//
// FPU Busy                               //
// ***************************************//

// Remain busy while aborting an Unimp

ME_AND4 ggh7   (notAbortInst, notDyadicOprExc,
                MIFromInst, notSampledWait,
                notMIsBusyBT0);
ME_AND2 ggh8   (notMIsBusyBT0, notDecodedUnimp, notBusyBT0);
ME_NMUX2B_B ggh9 (notBrTaken, gnd, notBusyBT0, Busy);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)mullsblog.v	1.1  4/7/92
//
module StickyPairNC (StkIn, notCin, X, Y, StkOut, notCout);
   input  StkIn, notCin ;
   input [1:0] X, Y ;
   output StkOut, notCout ; 
   
   ME_XNOR2_B  g10 ( X[0], Y[0], notZ0 );
   ME_XNOR2_B  g11 ( X[1], Y[1], notZ1 );
   ME_OR2_B    g13 ( notZ0, notZ1, notProp );

   // generate logic
   //ME_NMUX2B g12 ( Z1, x[1], x[0], notglo ) ; 
   ME_NAND3    g20 ( X[0], Y[0], X[1], g1 );
   ME_NAND3    g21 ( X[0], Y[0], Y[1], g2 );
   ME_NAND2    g22 ( X[1], Y[1], g3 );
   ME_NAND3    g23 ( g1, g2, g3, generate );

   // local sticky 
   ME_NAND2    g14 ( X[0], Y[0], notgenlo);
   ME_XOR3_B   g26 ( notgenlo, X[1], Y[1], bit1);
   ME_NAND3    g24 ( notZ0, bit1, notCin, StkGen);
   ME_NMUX2B   g28 ( notProp, notCin, StkGen, notStk ) ;

   // bypasses
   ME_INV_A    g31 ( StkIn, notStkIn );
   ME_NAND2    g32 ( notStkIn, notStk, StkOut );
 
   ME_INVA     g27 ( notCin, Cin );
   ME_NMUX2B_B g34 ( notProp, Cin, generate, notCout );
 
endmodule


module StickyPairNCI (StkIn, notCin, X, Y, StkOut, Cout);
   input  StkIn, notCin ;
   input [1:0] X, Y ;
   output StkOut, Cout ; 
   
   ME_XNOR2_B g10 ( X[0], Y[0], notZ0 );
   ME_XNOR2_B g11 ( X[1], Y[1], notZ1 );
   ME_OR2_B   g13 ( notZ0, notZ1, notProp );

   // generate logic
   //ME_NMUX2B g12 ( Z1, x[1], x[0], notglo ) ; 
   ME_NAND3 g20 ( X[0], Y[0], X[1], g1 );
   ME_NAND3 g21 ( X[0], Y[0], Y[1], g2 );
   ME_NAND2 g22 ( X[1], Y[1], g3 );
   ME_NAND3 g23 ( g1, g2, g3, generate );

   // local sticky 
   ME_NAND2   g14 (X[0], Y[0], notgenlo);
   ME_XOR3_B  g26 ( notgenlo, X[1], Y[1], bit1);
   ME_NAND3_B g25 ( notZ0, bit1, notCin, StkGen);
   ME_NMUX2B  g28 ( notProp, notCin, StkGen, notStk ) ;

   // bypasses
   ME_INVA    g31 ( StkIn, notStkIn );
   ME_NAND2_B g32 ( notStkIn, notStk, StkOut );
 
   ME_INVA    g27 ( notCin, Cin );
   ME_MUX2B   g34 ( notProp, Cin, generate, Cout );
 
endmodule


module MulLSBlog (SIn, CIn, SInA, CInA, LSBCarryIn, StickyIn,
                  LSBCarryOut, StickyOut);

   input [1:0] SIn, CIn;
   input [5:0] SInA, CInA;
   input LSBCarryIn, StickyIn;
   output LSBCarryOut, StickyOut;

   // wire [2:0] Sticky;
   // wire [7:0] SS;
   // wire [7:1] CO;

   ME_INVA    g27 ( LSBCarryIn, notLSBCarryIn );
   StickyPairNC  m0 (StickyIn, notLSBCarryIn, CIn, SIn, SS0, notC0);
   StickyPairNC  m1 (SS0,  notC0, CInA[1:0], SInA[1:0], SS1, notC1);
   StickyPairNC  m2 (SS1,  notC1, CInA[3:2], SInA[3:2], SS2, notC2);
   StickyPairNCI m3 (SS2,  notC2, CInA[5:4], SInA[5:4], StickyOut, LSBCarryOut);

   // ME_ADD3 a0 (CIn[0], SIn[0], LSBCarryIn, SS[0], CO[1]);
   // ME_ADD3 a1 (CIn[1], SIn[1], CO[1], SS[1], CO[2]);
   // ME_OR3  o1 (SS[0],  SS[1], StickyIn, Sticky[0]);
  
   // ME_ADD3 a2 (CInA[0], SInA[0], CO[2], SS[2], CO[3]);
   // ME_ADD3 a3 (CInA[1], SInA[1], CO[3], SS[3], CO[4]);
   // ME_OR3  o2 (SS[2],   SS[3], Sticky[0], Sticky[1]);

   // ME_ADD3 a4 (CInA[2], SInA[2], CO[4], SS[4], CO[5]);
   // ME_ADD3 a5 (CInA[3], SInA[3], CO[5], SS[5], CO[6]);
   // ME_OR3  o3 (SS[4],   SS[5], Sticky[1], Sticky[2]);

   // ME_ADD3 a6 (CInA[4], SInA[4], CO[6], SS[6], CO[7]);
   // ME_ADD3 a7 (CInA[5], SInA[5], CO[7], SS[7], LSBCarryOut);
   // ME_OR3  o4 (SS[6],   SS[7], Sticky[2], StickyOut);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)mulselctl.v	1.1  4/7/92
//
module MulSelCtl (notMult, Shifted, Pos, Zero, ACI);
               
input [2:0] notMult;
output Shifted, Zero, Pos, ACI;
//
// Mult 0 0 0 
// ACI is Actual Carry In
// Shifted is 1

ME_XOR2_B xnr7 (notMult[1], notMult[0], Shifted);

/* Feedthrough */
/* wire Negative = Mult[2]; */
con1 g00 (notMult[2], Pos);

ME_INV_A g01 (notMult[2], Negative);

// assert ACI if subtracting
ME_OR2_B cz1 (notMult[0], notMult[1], notSwig);
ME_AND2  cz2  (Negative, notSwig, ACI);		// 2 gates

//ME_INV_B g02 (Negative, notMult2);
// all ones or all zeros gives zero
ME_OR3_B nzr5 (notMult[2], notMult[0], notMult[1], notPos0);
ME_NAND3 nzr6 (notMult[2], notMult[1], notMult[0], notNeg0);
ME_NAND2_B nzr8 (notNeg0, notPos0,          Zero);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)multiplierlsb.v	1.1  4/7/92
//
module MultiplierLSB (
// inputs
                      Rom_ResetMul,
                      notMultip,
                      notAbortWB,
                      SumInLSBs, CarryInLSBs,
                      SCLSBs, SBLSBs, SALSBs,
                      CCLSB, CBLSB, CALSB,
// outputs
                      Shift,
                      Pos,
                      Zero,
                      CarryOut0,
                      CarryOut3,
                      SumOut0,
                  SumCarryLoadEn,
                  InitialMulStep,
/* dhn--01/10/91	notInitialSumZero, */
                  InitialCarryBit);
input notAbortWB, Rom_ResetMul;
input [2:0] SumInLSBs, CarryInLSBs;
input [1:0] SCLSBs, SBLSBs, SALSBs;
input CCLSB, CBLSB, CALSB;
input [8:0] notMultip;
output [3:0] Shift, Pos, Zero;
output       CarryOut0,
             CarryOut3,
             SumOut0;
output            InitialCarryBit,
                  SumCarryLoadEn,
                  InitialMulStep;
/* dhn--01/10/91	notInitialSumZero; */

/* *************************************************

      Multipler Selection Decoding

   ************************************************* */

MulSelCtl m13 (notMultip[8:6], Shift[3], Pos[3], Zero[3], CarryOut3);
MulSelCtl m12 (notMultip[6:4], Shift[2], Pos[2], Zero[2], CCIn);
MulSelCtl m11 (notMultip[4:2], Shift[1], Pos[1], Zero[1], CBIn);
MulSelCtl m10 (notMultip[2:0], Shift[0], Pos[0], Zero[0], CAIn);

/* *************************************************

      Full Add over LSBs and OR result

   ************************************************* */

MulLSBlog lbg (SumInLSBs[2:1], CarryInLSBs[2:1],
            {SCLSBs, SBLSBs, SALSBs},
            {CCLSB, CCIn, CBLSB, CBIn, CALSB, CAIn},
            //ArraySStk,
            //ArrayCStk,
            CarryInLSBs[0], SumInLSBs[0],
           CarryOut0, SumOut0);

carrysaveregslsb csrl (Rom_ResetMul,
                  notMultip[0],
                  notAbortWB,
                  SumCarryLoadEn,
                  InitialMulStep,
/* dhn--01/10/91	notInitialSumZero, */
                  InitialCarryBit);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)normcalslice.v	1.1  4/7/92
//
module NormCalSlice (NI, notsh, notNO);
input [15:0] NI; 
output [3:1] notsh;
output [1:0] notNO;

wire   [3:0] notNR ;  

   twosch     m1 (NI[7:0],  sh1a, sh2a, notNR[1:0]);
   twosch_top m2 (NI[15:8], sh1b, sh2b, notNR[3:2], NR1and0);
   onesch_sp  m3 (notNR[3:0],  notsh[3], notNO[1:0]);

   // anything set on top then take s1 , s2 from top 
   ME_NMUX2B    m4 (NR1and0, sh1a, sh1b, notsh[1]); 
   ME_NMUX2B    m6 (NR1and0, sh2a, sh2b, notsh[2]); 
                                                  
endmodule

module twosch (NI[7:0],sh1,sh2,notNO[1:0] );
input [7:0] NI ;
output sh1, sh2 ;
output [1:0] notNO ; // true OR value here
wire   [3:0] notNR ;

   onesch    m1 (NI[3:0], notsh1a, notNR[1:0]);
   onesch    m2 (NI[7:4], notsh1b, notNR[3:2]);
   notonesch m3 (notNR[3:0], sh2,  notNO[1:0]);
   // anything set on top then take s1 from top 
   ME_NMUX2B    m4 (notNO[1], notsh1b, notsh1a, sh1 ); 

endmodule

module twosch_top (NI[7:0],sh1,sh2,notNO[1:0], NO1and0 );
input [7:0] NI ;
output sh1, sh2 ;
output [1:0] notNO ; // true OR value here
output NO1and0 ;
wire   [3:0] notNR ;

   onesch    m1 (NI[3:0], notsh1a, notNR[1:0]);
   onesch    m2 (NI[7:4], notsh1b, notNR[3:2]);
   notonesch m3 (notNR[3:0], sh2,  notNO[1:0]);
   // anything set on top then take s1 from top 
   ME_NMUX2B_B  m4 (notNO[1], notsh1b, notsh1a, sh1 ); 
   ME_NAND4     m5 (notNR[0], notNR[1], notNR[2], notNR[3], NO1and0);
   // Special
endmodule

module onesch (NI[3:0], notsh1, notNR[1:0]);
  input [3:0] NI;
  output notsh1;
  output [1:0] notNR ;

  ME_INV_A i1 (NI[1],             notNI1);
  ME_NOR2 i2 (NI[2], notNI1,   notBornotC);
  ME_OR2  i3 (NI[3], notBornotC, notsh1);
//  ME_INV_A  i1 (NI[1],             notNI1);
//  ME_INV_A  i2 (NI[3],             notNI3);
//  ME_O2A1I i3 (notNI1, NI[2], notNI3, notsh1);
  ME_NOR2_B r4 (NI[0], NI[1], notNR[0] );
  ME_NOR2_B r5 (NI[2], NI[3], notNR[1] );
endmodule

module notonesch (notNI[3:0], sh1, notND[1:0]);
  input [3:0] notNI;
  output sh1;
  output [1:0] notND ;

  ME_INV_A     i1 (notNI[1], NI1);
  ME_NAND2_B  i2 (NI1, notNI[2],   notBornotC);
  ME_AND2_B   i3 (notNI[3], notBornotC, sh1);
//  ME_INV_A  i1 (notNI[1], NI1);
//  ME_INV_A  i2 (notNI[3], NI3);
//  ME_A2O1I i3 (NI1, notNI[2], NI3, sh1);
  ME_AND2_B    r4 (notNI[0], notNI[1], notND[0] );
  ME_AND2_B    r5 (notNI[2], notNI[3], notND[1] );
endmodule

module onesch_sp (notNI[3:0], notsh1, notND[1:0]);
  input [3:0] notNI;
  output notsh1;
  output [1:0] notND ;

  ME_INV_A     i1 (notNI[1], NI1);
  ME_NAND2_B  i2 (NI1, notNI[2],   notBornotC);
  ME_NAND2_B  i3 (notNI[3], notBornotC, notsh1);
//  ME_INV_A  i1 (NI[2],             notNI2);
//  ME_O2A1I i2 (notNI[1], NI2, notNI[3], notsh1);
  ME_NAND2   r4 (notNI[0], notNI[1], notND[0] );
  ME_NAND2_B   r5 (notNI[2], notNI[3], notND[1] );
endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)nullifyexceptionlogic.v	1.1  4/7/92
//
module NullExcepLogic (Phi, notReset,
                       RomNullifyOnBrOr,
                       RomOprExc,
                       BTLatched, notSampledWait,
                       FpLd,
                       notAInfNan, notAZeroDenorm,
                       notBInfNan, notBZeroDenorm,
                       ExMIptrLSBs,
                       AregOprExc,
                       DyadicOprExc,
                       notAbortNulExc,
                       notAbortWB);
input  Phi, notReset,          // System Clock Reset
       RomNullifyOnBrOr,  // Nullify if we Br
       RomOprExc,   // Check for Op Exception
       BTLatched,     // We have Bring
       notSampledWait,            // Don't nullify if waiting
       FpLd,                   // FpLd Force write back
       notAInfNan, notAZeroDenorm,
       notBInfNan, notBZeroDenorm;
output [2:0] ExMIptrLSBs;
output notAbortNulExc,
       AregOprExc,
       DyadicOprExc,
       notAbortWB;

// ***************************************//
// Nullification for Br               //
// ***************************************//

// An unwaited output is used to prevent locking in the NULL state
// NullEx is fedback to prevent locking
// ie only one NULL cycle will occur.
// The signal notNullifyOnBr is therefore 'If the Br is
// taken
//

ME_AND2 rb (RomNullifyOnBrOr, notNullEx, NullifyOnBr);

// ME_INVA  sx  (SampledWait, notSampledWait);

// Optimise
// ME_NAND3 re  (notSampledWait, BrTaken, NullifyOnBr, notND);
// These ROM outputs occur on Phi and then cause write back events
// themselves.
// ME_FD1 rf   (Phi, notND, notNullEx, NullEx);

ME_NAND2 re (notSampledWait, NullifyOnBr, notNDBTMiss);
ME_FD1 rf   (Phi, notNDBTMiss, , NullExBTMiss);
ME_NAND2 g_1 (BTLatched, NullExBTMiss, notNullEx);
ME_INVA g_0 (notNullEx, NullEx);

// NullEx is used to clear the Nullify

// This is used to generate the abort for the write back of
// the nullified cycle. It is combined with the ExcCycle
// and DyadicOprExc signals and to produce AbortWB

// ***************************************//
// Check Opr Exception                //
// ***************************************//

ME_NAND2 exg1 (notAInfNan, notAZeroDenorm, AregOprExc);
ME_NAND2 exg2 (notBInfNan, notBZeroDenorm, BregOprExc);
ME_OR2_B exg3   (AregOprExc, BregOprExc, OprExc);

// ***************************************//
// Operand Exception Address Generation   //
// ***************************************//

// quick 
ME_AND2 eag1 (AregOprExc, BregOprExc, ExMIptrLSBs[2]);
ME_NAND2 eag2 (AregOprExc, notBInfNan, ExMIptrLSBs[1]);
ME_OR2 eag3  (AregOprExc, notBInfNan, notAnormandBin);
ME_NAND2 eag5 (notAnormandBin, notAInfNan, ExMIptrLSBs[0]);

// ***************************************//
// Control Operand Exception              //
// ***************************************//

// Ignore Exception if Nullified on previous
ME_AND4   ssss (RomOprExc, notNullEx, notReset, notExcCycle, OprExcEtc);
ME_AND2_B cko  (OprExc, OprExcEtc, DyadicOprExc);


ME_FD1 zrd (Phi, DyadicOprExc, ExcCycle, notExcCycle);

// ***************************************//
// Aborting                               //
// ***************************************//
// Exc and NullEx require next operation to be aborted.
// In addition Exception requires current operation to be aborted.
// Aborting is acheived by preventing results of this cycle to
// be written back.

ME_OR2     yyy (ExcCycle, NullEx, AbortNulExc);
ME_INVA    yyc (AbortNulExc, notAbortNulExc);
ME_OR2_B   yyb (DyadicOprExc, AbortNulExc, AbortWBNoLoad);
ME_NAND2_B yyd (AbortWBNoLoad, notFpLd, notAbortWB);		// Drives a few
ME_INVA    yye (FpLd, notFpLd);
endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)preventswapctl.v	1.1  4/7/92
//
module PreventSwapCtl (FracAgtB, notExpAgtB, ExpZero,
                       RomPrevIfBgtA, FpLd,
                       PreventSwap,
                       PreventSwapExp);

input FracAgtB, notExpAgtB, ExpZero,
      FpLd, RomPrevIfBgtA;
output PreventSwap;
output PreventSwapExp;

// Preventing swap on add
// Use seperate line for Exp

ME_INV_A   psg0 (FpLd, notFpLd); // On FpLd remove prevent swap
ME_INV_A   psg3 (ExpZero, notExpZero);


ME_NAND3_B psg4 (notFpLd, RomPrevIfBgtA, notExpAgtB, notPrevSwap_F0);

ME_NAND4  psg5 (notFpLd, RomPrevIfBgtA, notExpAgtB, notExpZero, notPrevSwap_F1);
ME_NMUX2B_B psg6 (FracAgtB, notPrevSwap_F0, notPrevSwap_F1, PreventSwap);

// Add seperate PreventSwap for Exp
ME_INV_B  psg7 (notPrevSwap_F0, PreventSwapExp);

//ME_XOR    psg8 (PreventSwapExp, PreventSwap, WrongSwap);
//ME_FD1    psg8 (Phi, WrongSwap, L_WrongSwap, ); // So swap back !!

/* **************************************************** /
 / We know that we've done the wrong swap. Since the
 / swap is only done at the begining of add we can be sure
 / that FracAreg is going to be loaded from the shifter on
 / the subsequent cycle. So we can force it to be loaded from
 / Breg and also force Breg to be loaded from Areg. So that
 / if a swap was prevented it can be redone
 * **************************************************** */

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)roundingmodelogic.v	1.1  4/7/92
//
module RoundModeLogic (Phi,
                  OprRoundMode,
                  LoadOprs,
                  notAbortWB,
                  CMPDecoded, CMPEDecoded,
                  RomSetRModeMinus,
                  RModeMinus,
                  U_RoundingMode);
input Phi;
input [1:0] OprRoundMode;
input LoadOprs,
      notAbortWB,
      CMPDecoded, CMPEDecoded,
      RomSetRModeMinus;

output RModeMinus;
output [1:0] U_RoundingMode;
/* *************************************** */
/* Rounding Mode Latch                     */
/* *************************************** */

/* In addition to being the rounding mode this latch is also used in
   the compares to signal between the two different types Invalid/Vailid
   on unordered. This is TACKY but saves a lot of code
   Additional inputs CMPE and CMP distinguish between the two types
   It isnt a big problem because RMode is part of the instruction not
   ME_ROM and so no timing problems will occur */
wire [1:0] notModifiedRMode, notRoundingMode, RoundingMode;

ME_INVA cmpbits  (CMPDecoded, notCMPDecoded);
ME_AND2 rmcmp1   (OprRoundMode[1], notCMPDecoded, CMPRMode1);
ME_AND2_B fgf    (RomSetRModeMinus, notAbortWB, RModeFromMinus);
ME_NOR3 rmcmpe1  (CMPRMode1, CMPEDecoded, RModeFromMinus, notModifiedRMode[1]);
ME_NOR3 rmcmpe0  (OprRoundMode[0], CMPEDecoded,    RModeFromMinus, notModifiedRMode[0]);

/* RoundingMode is latched from status register at the begining of
   a new instruction. It is transient therefore. */

ME_OR2_B fgfo (RModeFromMinus, LoadOprs, RMLatchEnable);

ME_NMUX2B rm0m (RMLatchEnable, notRoundingMode[0], notModifiedRMode[0], U_RoundingMode[0]);
ME_FD1    rm0f (Phi, U_RoundingMode[0], RoundingMode[0], notRoundingMode[0]);
ME_NMUX2B rm1m (RMLatchEnable, notRoundingMode[1], notModifiedRMode[1], U_RoundingMode[1]);
ME_FD1    rm1f (Phi, U_RoundingMode[1], RoundingMode[1], notRoundingMode[1]);

ME_AND2 rmc (RoundingMode[0], RoundingMode[1], RModeMinus); 
endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)sampledwaitctl.v	1.1  4/7/92
//
module SampledWaitCtl (
   RomShiftAlign, RomShiftForInt, RomLeftnotRight,
   notReset,
   notAbortNulExc,
   notWaitForShifter,
   notNO[1:0],
   notIdleLatched,
   UpdateOutputs,
   notSampledWait);

input  RomShiftAlign, RomShiftForInt, RomLeftnotRight;
input  notReset, notAbortNulExc;
input  notWaitForShifter;
input [1:0]  notNO;
input  notIdleLatched;
output  UpdateOutputs, notSampledWait;

// Cycle maybe nullifed ie AbortNulExc

ME_INVA swrb2 (RomLeftnotRight,    RightnotLeft);
ME_OR2_B n0 ( notNO[1], notNO[0], notWaitForNorm ) ;

ME_NMUX2B swrb3 (RomLeftnotRight, notWaitForShifter, notWaitForNorm, WaitQ);

ME_NOR2 swmzs (RomShiftForInt, RightnotLeft, RomWaitForNorm);

ME_OR2 swmis (RomShiftAlign, RomWaitForNorm, RomWaitForShifter);
ME_AND3 g1_0 (notReset, notAbortNulExc, RomWaitForShifter, notPreventWait);

// Add muxes

ME_NAND2_B sweb (WaitQ, notPreventWait, notSampledWait);
ME_AND2 wwpp2 (notSampledWait, notIdleLatched, UpdateOutputs);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)samplereset.v	1.1  4/7/92
//
module SampleReset (Phi, ResetIn, ResetAbortInst,
                    ResetImp, Reset, notReset);
input ResetIn, ResetAbortInst, Phi;
output ResetImp, Reset, notReset;

ME_FD1 rs  (Phi, ResetIn, ResetImp, );
ME_OR2 cva (ResetImp, ResetAbortInst, ResetInorAbort);
ME_FD1 rva (Phi, ResetInorAbort, Reset, notReset);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)shiftleftctl.v	1.1  4/7/92
//
//  This module provides the top bits in for the left shift (frac or const)

module ShiftLeftCtl (NI_49_47,
		     LoadForInt,
		     LIB);

input [2:0] NI_49_47;
input LoadForInt;
output [2:0] LIB;
                
ME_TIEOFF toff (vdd, gnd);

ME_MUX2B g20 (LoadForInt, NI_49_47[2], gnd, LIB[2]);
ME_MUX2B g21 (LoadForInt, NI_49_47[1], gnd, LIB[1]);
ME_MUX2B g22 (LoadForInt, NI_49_47[0], vdd, LIB[0]);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)shiftrightctl.v	1.1  4/7/92
//

module ShiftRightCtl (
		 LoadForInt,
		 AregMasterBuf_57_55,
		 ExpIn,
		 SRControl,
                 SROneMore,
                 SRToStky,
                 Stky8,
                 notStky4,
                 Stky2,
                 notStky1,
                 StkyExtra,
                 RomShForAl,
                 notStkyInForSR,
		 TopBitsIn);

input LoadForInt;
input [2:0] AregMasterBuf_57_55;
input [8:0] ExpIn;
input [7:0] Stky8;                // 8     Stky bits from 8 bit stage
input [3:0] notStky4;             // 4 inv Stky bits from 4 bit stage
input [1:0] Stky2;                // 2     Stky bits from 2 bit stage
input       notStky1;             // 1 inv Stky bits from 1 bit stage
input [1:0] StkyExtra;            // 2     Stky bits from extra 1 bit stage
                
input [3:0] SRControl;
input       SROneMore, SRToStky;
input       RomShForAl;

output notStkyInForSR;
output [8:0] TopBitsIn;


	// select TopBitsIn
ME_MUX_2B_9 g69 (LoadForInt,
                {AregMasterBuf_57_55[2], AregMasterBuf_57_55[2],
		 AregMasterBuf_57_55[2], AregMasterBuf_57_55[2],
		 AregMasterBuf_57_55[2], AregMasterBuf_57_55[2],
                 AregMasterBuf_57_55[2:0]},
                ExpIn[8:0],
                TopBitsIn);


ME_OR8   g80 (Stky8[0], Stky8[1], Stky8[2], Stky8[3], 
              Stky8[4], Stky8[5], Stky8[6], Stky8[7], StkyOR8);
ME_NAND2 g8d (StkyOR8, SRControl[3], notStkyA);

ME_NAND4 g81 (notStky4[0], notStky4[1], notStky4[2], notStky4[3], StkyOR4);
ME_NAND2 g8c (StkyOR4, SRControl[2], notStkyB);

ME_O2A1I   g82 (Stky2[0], Stky2[1], SRControl[1], notStkyC);
//ME_OR2   g82 (Stky2[0], Stky2[1], StkyOR2);
//ME_NAND2 g84 (StkyOR2, SRControl[1], notStkyC);

ME_INVA  g86 (SRControl[0], notSRC0);
ME_OR2   g85 (notStky1, notSRC0, notStkyD);

ME_INVA  g89 (RomShForAl, notRomShForAl);

ME_NAND2 gxa (StkyExtra[1], SROneMore, notStkyE);
ME_NAND2 g8x (notRomShForAl, SROneMore, notgoop);
ME_NAND2 gxx (notgoop, StkyExtra[0], notLSB);
//ME_O2A1I   g8x (StkyExtra[0], StkyExtra[1], SROneMore, notStkyE);

ME_AND2   g12 (notStkyA, notStkyB, notStkyAB);
ME_NAND3  g13 (notStkyAB, notStkyC, notStkyD, StkyABCD);

// When multiplying the last thing we want is the sticky bit getting
// set. The sticky only gets set therefore if we're shifting right
// for align or stifting right to sticky in one go

ME_INVA  g90 (SRToStky, notSRToStky);

ME_NAND2 g91 (notSRToStky, RomShForAl, notSelectStkyABCD);
ME_NMUX2B g92 (notSelectStkyABCD, StkyABCD, SRToStky, notStkyABCDS);

ME_AND3 g88 (notStkyE, notLSB, notStkyABCDS, notStkyInForSR);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)signdp.v	1.1  4/7/92
//
module SignDp ( Phi, Reset,
                RomSignLength,
                RomStatus, 
                FracXFromRound,
                XDest,
                CMPDecoded, CMPEDecoded,
                SignOpA, SignOpB,
                notAbortWB, PreventSwap,
                FpLd, FpOp,
                NegateOprSign,
                notSignAFromB, notSignBFromA,
                OprRoundMode,
                FpInst1,
                Unimplemented,
                SignResult,
                AregSign, AregXORBreg,
                FpExc_Unimp,
                Status_6_2,
                ConditionCodes,
                OprSNnotDB, SNnotDB, DBnotSN,
                MulLenSel,
                RModeMinus,
                FracRoundOut );

input Phi, Reset;
input [`end_sign_field:`start_sign_field] RomSignLength;
input [`end_status_field:`start_status_field] RomStatus;
input FracXFromRound; // Optimised signal
input XDest;
input SignOpA, SignOpB,
      notAbortWB, PreventSwap,
      FpLd, FpOp, NegateOprSign;
input notSignAFromB,
      notSignBFromA,
      FpInst1,
      Unimplemented;
input [1:0] OprRoundMode;
input CMPDecoded, CMPEDecoded;
output SignResult, AregSign, AregXORBreg;
output FpExc_Unimp;
output [1:0] ConditionCodes;
output OprSNnotDB, SNnotDB, DBnotSN;
output [4:0]MulLenSel;
output RModeMinus;
output [4:0] FracRoundOut ;
output [6:2] Status_6_2;


wire notRN ;
wire [4:1] FracRound;
assign FracRoundOut = {FracRound[4:1], notRN} ;

wire [6:0] Status;
assign Status_6_2 = Status[6:2] ;

wire [1:0] U_RoundingMode;

SignLogic sl (Phi, Reset,
              RomSignLength [`u_SignAregFromResult:`u_SignResultFromFunction0],
              RomStatus[`u_Unimplemented],
              Status[0], Status[1],
              SignOpA, SignOpB,
              NegateOprSign,
              FpLd,
              notAbortWB, PreventSwap,
              U_RoundingMode[0],
              Unimplemented,
              notSignAFromB, notSignBFromA,
              AregSign, AregXORBreg,
              U_CouldBeRI_0,  // Bent place to do but needs a lot of sign stuff
              FpExc_Unimp,
              ConditionCodes,
              SignResult);

RoundModeLogic rml (Phi,
                  OprRoundMode,
                  FpLd,
                  notAbortWB,
                  CMPDecoded, CMPEDecoded,
                  RomSignLength [`u_SetRoundingModeToMinus],
                  RModeMinus,
                  U_RoundingMode);

LengthLogic ll (Phi, Reset,
                FpInst1,
                FpLd, FpOp,
                RomSignLength[`u_ToggleLength],
                notAbortWB,
                OprSNnotDB,
                SNnotDB,
                U_SNnotDB,
                DBnotSN,
                MulLenSel);

DecodeStatus ds (RomStatus[`u_status3:`u_status0],
                 Status);

/* For the Rounding cycles make some of controls faster */

ME_AND2    v2  (U_RoundingMode[1], U_CouldBeRI_0, U_CouldBeRI);
ME_FD1_B   x1  (Phi, U_CouldBeRI, CouldBeRI, );

ME_AND3_B  s2  (U_RoundingMode[1], U_CouldBeRI_0, U_SNnotDB, U_CouldBeRISN);
ME_FD1_B   x4  (Phi, U_CouldBeRISN, CouldBeRISN, );

ME_NOR2    v3  (U_RoundingMode[1], U_RoundingMode[0], U_CouldBeRN);
ME_FD1_B   x2  (Phi, U_CouldBeRN, CouldBeRN, );

ME_AND2_B  s1  (U_CouldBeRN, U_SNnotDB, U_CouldBeRNSN);
ME_FD1_B   x3  (Phi, U_CouldBeRNSN, CouldBeRNSN, );

// FracXbus comes from Breg or a constant
// want to constuct constant as fields
// ie
//   2  1       23        1        28        1  2
//
//  00  0 000_00..00_0000 0 0000_00..00_0000 0 00 Zero
//  00  1 000_00..00_0000 0 0000_00..00_0000 0 00 One
//  00  0 000_00..00_0000 1 1111_11..11_1111 1 11 RC SN 2
//  00  0 000_00..00_0000 0 1111_11..11_1111 1 11 RC SN 1
//  00  0 000_00..00_0000 0 0000_00..00_0000 1 11 RC DB 2
//  00  0 000_00..00_0000 0 0000_00..00_0000 0 11 RC DB 1
// Field Names
//  a   b c               d e                f g
//
// a == 0
// b == FracXbusFrom1
// c == 0
// d == RI & SN
// e == (RI | RN) & SN
// f == RI | (RN & SN)
// g == RI | RN

// 00 = Round Nearest
// 01 = Round Zero ( Truncate )
// 10 = Round positive infinity
// 11 = Round negative infinity

// Round Nearest
ME_NAND2 rg4   (CouldBeRN, FracXFromRound, notRN);
ME_NAND2 rzz1s (CouldBeRNSN, FracXFromRound, notRNSN);

// Round Infinities //
ME_NAND2 rv2   (CouldBeRI, FracXFromRound, notRI);
ME_NAND2 rv3   (CouldBeRISN, FracXFromRound, notRISN);

// Constant d
ME_INV_B rlokout (notRISN, FracRound[4]);

// Constant e
ME_AND2_B  s3  (U_RoundingMode[1], U_SNnotDB, U_RMode1SN);
ME_AND2_B  s4  (U_RMode1SN, U_CouldBeRI_0, U_CouldBeRISNa);
ME_OR2 rc0 (U_CouldBeRNSN, U_CouldBeRISNa, U_constante);
ME_FD1_B rc1 (Phi, U_constante, r_constante, );

ME_NAND2_B rv03 (r_constante, XDest, notConstante);
//ME_AND2_B  rvo3  (notRNSN, notRISN, notConstante);
ME_INV_D   rvo4  (notConstante, FracRound[3]); // Has fanout of 28

// Constant f
ME_NAND2_B rvo2  (notRNSN, notRI, FracRound[2]);

// Constant g
ME_NAND2_B rvo1  (notRI, notRN, FracRound[1]);

// FracRound[4:1] Constantd, Constante, Constantf, Constantg,
// FracRound[0] = notRN

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)signlogic.v	1.1  4/7/92
//
module SignLogic (Phi, Reset,
                  RomSignLength,
                  Rom_Unimplemented,
                  Rom_StatusCCBit0, Rom_StatusCCBit1,
                  SignOpA, SignOpB,
                  NegateOprSign,
                  LoadOprs,
                  notAbortWB, PreventSwap,
                  U_RoundingMode0,
                  Unimplemented,
                  notSignAFromB, notSignBFromA,
                  AregSign, AregXORBreg,
                  U_CouldBeRI_0,
                  FpExc_Unimp,
                  ConditionCodes,
                  SignResult);
input  Phi, Reset;
input  [`u_SignAregFromResult:`u_SignResultFromFunction0]RomSignLength;
input  Rom_StatusCCBit0, Rom_StatusCCBit1, Rom_Unimplemented;
input  SignOpA, SignOpB,
       LoadOprs,
       notAbortWB,
       PreventSwap,
       U_RoundingMode0, // Unlatched rounding mode bit 0
       NegateOprSign;
input  Unimplemented;
input notSignAFromB,
      notSignBFromA;
output AregSign,
       AregXORBreg,
       U_CouldBeRI_0,   // Unlatched for next cycle
       SignResult;
output FpExc_Unimp;
output [1:0] ConditionCodes;

ME_TIEOFF toff (vdd, gnd);
          
// ***************************************//
// Sign function                          //
// ***************************************//

// Bits Function
// 0 0  Areg
// 0 1  Positive // Forced on reset
// 1 0  notAreg
// 1 1  AregXORBreg

ME_OR2 orr (Reset, RomSignLength[`u_SignResultFromFunction0],
         SignResCtl0);

ME_XOR2 xorabs (AregSign, BregSign, AregXORBreg);

ME_MUX4B msc0 (SignResCtl0, RomSignLength[`u_SignResultFromFunction1],
               AregSign, gnd, notAregSign, AregXORBreg,
               SignResult);

// ***************************************//
// Sign Registers                         //
// ***************************************//

ME_XOR2 xorop (SignOpA, NegateOprSign, SignedSignOpA);

ME_INV_A salc (notSignAFromB, SignAFromB);
ME_OR4     ggdf (RomSignLength[`u_SignAregFromResult], Reset,
              SignAFromB, LoadOprs, PosAEn);
ME_NAND2   sae1   ( PosAEn, notAbortWB, notAregLoadEn_p);

//ME_OR2_B   sae2 ( notAregLoadEn_p, PreventSwap, notSignAregLoadEn);

ME_MUX2B  saop    ( RomSignLength[`u_SignAregFromResult], BregSign, SignResult, JSign);
ME_NMUX2B saxp    ( LoadOprs, JSign, SignedSignOpA, notSignAInput);

ME_MUX2B_B  asmp  ( notAregLoadEn_p, notSignAInput, notAregSign, notSignAInput_p );
ME_NMUX2B_B asm   ( notPreventSwap, notAregSign, notSignAInput_p, U_AregSign );

ME_FD1_B    asf   ( Phi, U_AregSign, AregSign, notAregSign );  

// Added a bit of tack to see the rounding mode earlier

ME_XNOR2_B u0_v1  ( U_RoundingMode0, notSignAInput_p, U_RM0_notSAI);
ME_XNOR2_B u0_v2  ( U_RoundingMode0, notAregSign, U_RM0_notSA);

ME_NMUX2B_B asmv  ( PreventSwap, U_RM0_notSAI, U_RM0_notSA, U_CouldBeRI_0 );

ME_INV_A sblc     ( notSignBFromA, SignBFromA);
ME_OR2  gbdf      ( SignBFromA, LoadOprs, PosBEn);
ME_INV_A sbe2     ( PreventSwap, notPreventSwap);
ME_NAND3 sbe      ( PosBEn, notAbortWB, notPreventSwap, notSignBregLoadEn);
ME_NMUX2B sbxp    ( LoadOprs, AregSign, SignOpB, notSignBInput);

ME_NMUX2B bsm     ( notSignBregLoadEn, notSignBInput, notBregSign, U_BregSign );
ME_FD1    bsf     ( Phi, U_BregSign, BregSign, notBregSign );  

// ***************************************//
// Exception and Condition Code           //
// ***************************************//

ME_OR2 codie (Unimplemented, Rom_Unimplemented, FpExc_Unimp);

ME_NOR2 stg7  (Rom_StatusCCBit0, Rom_StatusCCBit1,
           Equals);
ME_NOR2 stg8  (Rom_StatusCCBit0, BregSign,    notNegative);
ME_NOR2 stg9  (Rom_StatusCCBit0, notBregSign, notPositive);
ME_NOR2 stgA (Equals, notPositive, ConditionCodes[1]); 
ME_NOR2 stgB (Equals, notNegative, ConditionCodes[0]);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)tregloadctl.v	1.1  4/7/92
//
module TregLoadCtl (RomFracTFromRes, notAbortWB,
                    FracTregLoadEn);

input  RomFracTFromRes, notAbortWB;
output FracTregLoadEn;

ME_AND2 ftlt (RomFracTFromRes, notAbortWB, FracTregLoadEn);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)ymuxctl.v	1.1  4/7/92
//
module YMuxCtl (RomYMuxCtl,
                YFunc,
                FracAregFPMSBP1,
                notFracAregFPMSBP1,
                FracBregSign,
                DivMultiple,
                AregLSBs,
                StickyForSR1,
                TregLSBs,

/* dhn--01/10/91	notFracYFromD1, notFracYFromD2, notFracYFromD3, */

		notFracYFromD1A, notFracYFromD2A, notFracYFromD3A,
                FracYLSBs);

input FracAregFPMSBP1, notFracAregFPMSBP1, FracBregSign;
input [`end_frac_ybus_field:`start_frac_ybus_field] RomYMuxCtl;
input [6:0] YFunc;
input [2:0] AregLSBs;
input StickyForSR1;
input [1:0] TregLSBs;
input [3:1] DivMultiple;
/* dhn--01/10/91  output notFracYFromD3, notFracYFromD2, notFracYFromD1; */
output notFracYFromD1A, notFracYFromD2A, notFracYFromD3A;
output [1:0] FracYLSBs;

ME_TIEOFF toff (vdd, gnd);

/* Function Coding on
Func1 Func0
0      0    ROM        Ybus From ROM
0      1    ROM SQRT   Ybus From ROM Note we dont do anything with the Ybus here
1      0    Round      Ybus from Areg or AregSR1 dependant on FracAregFPMSBP1
1      1    Div        Ybus From Div Multiple
*/

//YFunc[6] and RomYMuxCtl[`u_FracALUOpForDivOrSQRTStep] mean SQRT step
ME_AND3_B fs3 (YFunc[6], RomYMuxCtl[`u_FracALUOpForDivOrSQRTStep], FracBregSign, RomYFromSQRTBNeg);

/* *************************************************************

         YMux Drivers

   ************************************************************* */

//ME_INV_A ifp (FracAregFPMSBP1, notFracAregFPMSBP1);

/*ME_MUX4B_B ym0 (RomYMuxCtl[`u_FracYbusFromFunc0], RomYMuxCtl[`u_FracYbusFromFunc1],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              FracAregFPMSBP1,
              DivMultiple[0], FracYFromD0);

ME_MUX4B_B ym1 (RomYMuxCtl[`u_FracYbusFromFunc0], RomYMuxCtl[`u_FracYbusFromFunc1],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              notFracAregFPMSBP1,
              DivMultiple[1], FracYFromD1);*/

/*ME_MUX4B_B ym0 (YFunc[0], YFunc[1],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              RomYMuxCtl[`u_FracYbusFromRomDest0],
              FracAregFPMSBP1,
              DivMultiple[0], FracYFromD0);

ME_MUX4B_B ym1 (YFunc[2], YFunc[3],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              RomYMuxCtl[`u_FracYbusFromRomDest1],
              notFracAregFPMSBP1,
              DivMultiple[1], FracYFromD1);*/

/*** dhn--01/10/91

ME_A222OI_B ym1 (YFunc[0],
               RomYMuxCtl[`u_FracYbusFromAregSR1],
               YFunc[1],
               FracAregFPMSBP1,
               YFunc[2],
               DivMultiple[1],
               notFracYFromD1);
               
ME_A222OI_B ym2 (YFunc[3],
               RomYMuxCtl[`u_FracYbusFromAreg],
               YFunc[4],
               notFracAregFPMSBP1,
               YFunc[5],
               DivMultiple[2],
               notFracYFromD2);
               
ME_A222OI_B ym3 (RomYMuxCtl[`u_FracYbusFromFunc0],
               RomYMuxCtl[`u_FracYbusFromTreg],
               RomYMuxCtl[`u_FracYbusFromFunc1],
               gnd,
               RomYMuxCtl[`u_FracYbusFromFunc2],
               DivMultiple[3],
               notFracYFromD3);

***  dhn--01/10/91 ***/
               
ME_A222OI_B ym4 (YFunc[0],
               RomYMuxCtl[`u_FracYbusFromAregSR1],
               YFunc[1],
               FracAregFPMSBP1,
               YFunc[2],
               DivMultiple[1],
               notFracYFromD1A);
               
ME_A222OI_B ym5 (YFunc[3],
               RomYMuxCtl[`u_FracYbusFromAreg],
               YFunc[4],
               notFracAregFPMSBP1,
               YFunc[5],
               DivMultiple[2],
               notFracYFromD2A);
               
ME_A222OI_B ym6 (RomYMuxCtl[`u_FracYbusFromFunc0],
               RomYMuxCtl[`u_FracYbusFromTreg],
               RomYMuxCtl[`u_FracYbusFromFunc1],
               gnd,
               RomYMuxCtl[`u_FracYbusFromFunc2],
               DivMultiple[3],
               notFracYFromD3A);
               


/* ****************************************************************************

      Modify FracYbus LSBs for Negative SQRT step and Sticky

   **************************************************************************** */

ME_INV_A ymlb1 (notFracYFromD1A, FracYFromD1); // Minimalist light load
ME_INV_A ymlb2 (notFracYFromD2A, FracYFromD2); // Minimalist light load
ME_INV_A ymlb3 (notFracYFromD3A, FracYFromD3); // Minimalist light load

/*ME_OR2   ymd0 (FracYFromD1, FracYFromD3, FracYFromD0C);
ME_OR2   ymd1 (FracYFromD2, FracYFromD3, FracYFromD1C);*/

// Do OR before MUX

wire [1:0] OR_AregLSBsSR1, OR_AregLSBs, OR_TregLSBs;

// Bit 0

ME_INVA i00 (RomYMuxCtl[`u_FracYbusOrSticky], notRomFracYbusOrSticky);

/*ME_OR2 i00 (StickyInForSR1, RomYMuxCtl[`u_FracYbusOrSticky], OR_AregLSBsSR1[0]);
ME_OR2 i01 (AregLSBs[0], RomYMuxCtl[`u_FracYbusOrSticky], OR_AregLSBs[0]);
ME_OR2 i02 (TregLSBs[0], RomYMuxCtl[`u_FracYbusOrSticky], OR_TregLSBs[0]);*/

// Bit 1

ME_INVA i10 (RomYFromSQRTBNeg, notRomYFromSQRTBNeg);

/*ME_OR2 i10 (AregLSBs[2], RomYFromSQRTBNeg, OR_AregLSBsSR1[1]);
ME_OR2 i11 (AregLSBs[1], RomYFromSQRTBNeg, OR_AregLSBs[1]);
ME_OR2 i12 (TregLSBs[1], RomYFromSQRTBNeg, OR_TregLSBs[1]);*/

// Use buffered inverse of mux controls

ME_NAND2 ymlsbs1 (FracYFromD1, StickyForSR1,   t0);
ME_NAND2 ymlsbs2 (FracYFromD2, AregLSBs[0],    t1);
ME_NAND2 ymlsbs3 (FracYFromD3, TregLSBs[0],    t2);

ME_NAND4 ymlsbs4 (t0, t1, t2, notRomFracYbusOrSticky, FracYLSBs[0]);

ME_NAND2 ymlsbs5 (FracYFromD1, AregLSBs[2],    t3);
ME_NAND2 ymlsbs6 (FracYFromD2, AregLSBs[1],    t4);
ME_NAND2 ymlsbs7 (FracYFromD3, TregLSBs[1],    t5);

ME_NAND4 ymlsbs8 (t3, t4, t5, notRomYFromSQRTBNeg, FracYLSBs[1]);

/*ME_MUX4B yb0 (FracYFromD0C, FracYFromD1C,
              RomYMuxCtl[`u_FracYbusOrSticky],
              OR_AregLSBsSR1[0],
              OR_AregLSBs[0],
              OR_TregLSBs[0],
              FracYLSBs[0]);

ME_MUX4B yb1 (FracYFromD0C, FracYFromD1C,
              RomYFromSQRTBNeg,
              OR_AregLSBsSR1[1],
              OR_AregLSBs[1],
              OR_TregLSBs[1],
              FracYLSBs[1]);*/

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)dp.v	1.1  4/7/92
//
module fp_exp ( ss_clock, SNnotDB, OprSNnotDB,
	    RS2_exp, RS1_exp,
	    FracAregForInt,
            notSLFromNorm,
            ShiftBy8,
            ExpAregLoadEn, ExpAregLC0, ExpAregLC1,
            ExpBregLoadEn, ExpBregLC0, ExpBregLC1, 
            ExpXCtl0, ExpXCtl1, 
            ExpYCtl0, ExpYCtl1, 
            Sub, CarryIn, 
            Constantb, Constantc, Constantd, Constante,
            Constantf, Constantg, Constanth,
            // output start here 
            AregMasterBufOut,
            ExpResultBuf, notExpShiftResult,
            ExpZero, ExpResult_12,
            SLControl, 
            notAInfNaN, notAZeroDenorm,
            notBInfNaN, notBZeroDenorm,
            notUnderflow, notOverflow, notExpException,
	    ss_scan_mode, fp_exp_scan_in, fp_exp_scan_out);

input ss_clock, SNnotDB, OprSNnotDB ;
input [10:0] RS2_exp, RS1_exp ;
input [7:0]  FracAregForInt; 
input ExpAregLoadEn, ExpAregLC0, ExpAregLC1;
input ExpBregLoadEn, ExpBregLC0, ExpBregLC1; 
input ExpXCtl0, ExpXCtl1 ;
input ExpYCtl0, ExpYCtl1 ;
input Sub, CarryIn;
input Constantb, Constantc, Constantd, Constante,
      Constantf, Constantg, Constanth;
input [3:0]   notSLFromNorm ;
input ShiftBy8;
input ss_scan_mode, fp_exp_scan_in;

output [3:0]  SLControl ;
output [7:0]  AregMasterBufOut;
output [10:0] ExpResultBuf ;
output [12:0] notExpShiftResult ;
output ExpZero;
output ExpResult_12;
output notAInfNaN, notAZeroDenorm;
output notBInfNaN, notBZeroDenorm;
output notUnderflow, notOverflow, notExpException;
output fp_exp_scan_out;

ME_TIEOFF toff (vdd, gnd);

assign fp_exp_scan_out = 1'bx ;

wire [12:0] int_ExpResultBuf ;
assign ExpResultBuf = int_ExpResultBuf[10:0] ;

wire [12:0] AregMaster, AregMasterBuf, BregMaster, BregMasterBuf,
	    ExpXbus, ExpYbus, ExpResult;
wire [3:0]  ExpYbusS;

assign ExpResult_12 = ExpResult[12] ;

// extended internal format operands

wire [12:0] OprA, OprB ;
wire [10:0] ExpOpA, ExpOpB ;

// Operand select (single/double) muxes

ME_MUX_2B_11 opifaxe (OprSNnotDB,
		     RS2_exp[10:0],
		     {gnd, gnd, gnd, RS2_exp[10:3]},
		     ExpOpA[10:0]);

assign OprA = {gnd, gnd, ExpOpA};


ME_MUX_2B_11 opifbxe (OprSNnotDB,
		     RS1_exp[10:0],
		     {gnd, gnd, gnd, RS1_exp[10:3]},
		     ExpOpB[10:0]);

assign OprB = {gnd, gnd, ExpOpB};


NormCalLog nmcl    (notSLFromNorm,
                    ShiftBy8,
                    ExpYCtl0, ExpYCtl1,
                    ExpYbus[3:0],
                    ExpYbusS[3:0],
                    SLControl);

//wire [7:0] AregMasterBufOut = AregMasterBuf[7:0];
   con1 g0 (AregMasterBuf[0], AregMasterBufOut[0]);
   con1 g1 (AregMasterBuf[1], AregMasterBufOut[1]);
   con1 g2 (AregMasterBuf[2], AregMasterBufOut[2]);
   con1 g3 (AregMasterBuf[3], AregMasterBufOut[3]);
   con1 g4 (AregMasterBuf[4], AregMasterBufOut[4]);
   con1 g5 (AregMasterBuf[5], AregMasterBufOut[5]);
   con1 g6 (AregMasterBuf[6], AregMasterBufOut[6]);
   con1 g7 (AregMasterBuf[7], AregMasterBufOut[7]);


ME_FREGA_S_4_13 Areg ( ss_clock,
                    ExpAregLoadEn, ExpAregLC0, ExpAregLC1,
                    OprA,
                    {gnd, gnd, gnd, gnd, gnd, FracAregForInt[7:0]}, // AIntVal
                    int_ExpResultBuf, BregMasterBuf,
                    AregMaster, AregMasterBuf);

Exception ae       ( AregMasterBuf, SNnotDB, notAInfNaN, notAZeroDenorm);

ME_MUX_4B_13  Ymux (ExpYCtl0, ExpYCtl1,
                    {gnd, gnd, gnd, gnd, gnd,
                     gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}, // Zero
                    {gnd, gnd, gnd, gnd, gnd,
                     gnd, gnd, gnd, gnd, vdd, gnd, gnd, gnd}, // Normaliser value of 8
                    AregMasterBuf,
                    {gnd, gnd, gnd, Constantb, Constantb, Constantb, Constantc,
                     Constantc, Constantd, Constante, Constantf, Constantg, Constanth}, // Constant
                    ExpYbus );         

ME_FREGA_S_4_13 Breg (ss_clock,
                ExpBregLoadEn, ExpBregLC0, ExpBregLC1,
                OprB,
                {int_ExpResultBuf[12], int_ExpResultBuf[12:1]}, // ExpResultSR1
                int_ExpResultBuf, AregMasterBuf,
                BregMaster, BregMasterBuf);

Exception be (BregMasterBuf, SNnotDB, notBInfNaN, notBZeroDenorm);

ME_MUX_4B_13  Xmux (ExpXCtl0, ExpXCtl1,
                    {gnd, gnd, gnd, gnd, gnd,
                     gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}, // Zero
                    {gnd, gnd, gnd, Constantb, Constantb, Constantb, Constantc,
                     Constantc, Constantd, Constante, Constantf, Constantg, Constanth}, // Constant
                    AregMasterBuf, BregMasterBuf,
                    ExpXbus );         

ME_ADD_13  add    ( Sub, CarryIn, ExpXbus, {ExpYbus[12:4], ExpYbusS[3:0]}, ExpResult, int_ExpResultBuf, ExpZero);

// original Meiko code (changed 11/7/90 -- dhn):
//		shiftsub  adds   ( BregMaster, AregMaster, notExpShiftResult);
//
//ME_ADD_13  adds   ( 1'b1, 1'b0, AregMaster, BregMaster, notExpShiftResult,,);

	// just use the subtractor, don't need the condition codes, etc.
ME_SUB_13 subtract13 ( 1'b1, 1'b0, AregMaster, BregMaster, notExpShiftResult );


ResultException re (ExpResult, SNnotDB, ExpZero, notUnderflow, notOverflow, notExpException);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)exception.v	1.1  4/7/92
//
module Exception (BM, SNnotDB, notBInfNaN, notBZeroDenorm);

input [12:0] BM;
input SNnotDB;
output notBInfNaN, notBZeroDenorm;

// Check the Master for InfNan or ZeroDenorm
// Inf or nan should also be set for any overflow, either single or
// double length, as this check is also used in rounding 

  ME_OR11 g10 (BM[10], BM[9], BM[8], BM[7], BM[6], BM[5],
            BM[4], BM[3], BM[2], BM[1], BM[0], notBZeroDenorm );

  // Force bits 10 to 8 high when single and AND them
  ME_INVA  g13 ( SNnotDB, DBnotSN );
  ME_NAND3 g12 ( BM[10], BM[9], BM[8], n10 ) ;
  ME_NAND2 g11 ( DBnotSN, n10, doublebits1 ) ;
  
  ME_AND8 zxd (  BM[7], BM[6], BM[5], BM[4], 
                 BM[3], BM[2], BM[1], BM[0], All1s7to0);
  ME_OR3    zxe (  BM[10], BM[9], BM[8], Bit10Or8);
  ME_NAND2  g23 ( SNnotDB, Bit10Or8, notSNGrossOv ) ;
  ME_NAND2  g22 ( doublebits1, All1s7to0, notAll1s ) ;
  ME_INV_A  g21 ( BM[11], notBit11 ) ;
  ME_AND3_B g20 ( notSNGrossOv, notAll1s, notBit11, notBInfNaN ) ;

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)normcallog.v	1.1  4/7/92
//
module NormCalLog  (notSLFromNorm[3:0],
                    ShiftBy8,
                    ExpYCtl0, ExpYCtl1,
                    ExpYbus[3:0],
                    ExpYbusS[3:0],
                    SLControl);

input  [3:0] notSLFromNorm;
input  ShiftBy8;
input  ExpYCtl0, ExpYCtl1; 
input  [3:0] ExpYbus;
output [3:0] ExpYbusS;
output [3:0]SLControl;

wire   [3:0] notExpYbus;
wire   [3:0] notSLControl ;

  ME_INVA  i0 (ExpYCtl1, notExpYCtl1);
  ME_INVA  i1 (ShiftBy8, notShiftBy8);
  ME_NAND3 n0 (ExpYCtl0, notExpYCtl1, notShiftBy8, notUseFastNorm);

  ME_INV_B    i2 (ExpYbus[0], notExpYbus[0]);
  ME_INV_B    i3 (ExpYbus[1], notExpYbus[1]);
  ME_INV_B    i4 (ExpYbus[2], notExpYbus[2]);
  ME_INV_B    i5 (ExpYbus[3], notExpYbus[3]);
  ME_NMUX2B_B i33 (notUseFastNorm, notSLFromNorm[3], notExpYbus[3], ExpYbusS[3]);   
  ME_NMUX2B_B i32 (notUseFastNorm, notSLFromNorm[2], notExpYbus[2], ExpYbusS[2]);   
  ME_NMUX2B_B i31 (notUseFastNorm, notSLFromNorm[1], notExpYbus[1], ExpYbusS[1]);   
  ME_NMUX2B_B i30 (notUseFastNorm, notSLFromNorm[0], notExpYbus[0], ExpYbusS[0]);   
  ME_INV_A    i6 (ExpYbusS[0], notSLControl[0]);
  ME_INV_A    i7 (ExpYbusS[1], notSLControl[1]);
  ME_INV_A    i8 (ExpYbusS[2], notSLControl[2]);
  ME_INV_A    i9 (ExpYbusS[3], notSLControl[3]);
  ME_INV_A    ia (notSLControl[0], SLControl[0]);
  ME_INV_A    ib (notSLControl[1], SLControl[1]);
  ME_INV_A    ic (notSLControl[2], SLControl[2]);
  ME_INV_A    id (notSLControl[3], SLControl[3]);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)resultexception.v	1.1  4/7/92
//
module ResultException (Result, SNnotDB, ExpZero, notUnderflow, notOverflow, notExpException);
  input [`ExpMSB:0] Result;
  input ExpZero;
  input SNnotDB;
  output notUnderflow, notOverflow, notExpException;

  ME_TIEOFF toff (vdd, );

  ME_INV_B g30 ( Result[12], positive ) ;
  ME_INV_A g31 ( SNnotDB, DBnotSN ) ;

  // underflow condition is -ve or all zero.
  // Note that exp must be subtracting for zero to work !

  ME_NMUX2B zq1 (positive, vdd, ExpZero, notUnderflow );

  // overflow condition is positive and all ones with LSB dont care.
  // or positive with bit 11 set.
  // n.b all ones applies only over required length.

  // Force bits 10 to 8 high when single and AND them
  ME_NAND3 g10 (Result[10], Result[9], Result[8], n10 ) ;
  ME_NAND2 g11 (DBnotSN, n10, doublebits1 ) ;
  
  ME_AND4    zzd (Result[7], Result[6], Result[5], Result[4], All1s7to4);
  ME_AND4_B  zze (positive,  Result[3], Result[2], Result[1], PAll1s3to1);

  ME_OR3_B   zzf  ( Result[10], Result[9], Result[8], Bit10Or8);
  ME_NAND3_B g23 ( positive, SNnotDB, Bit10Or8, notSNGrossOv ) ;

  ME_NAND3_B g22 ( doublebits1, All1s7to4, PAll1s3to1, notAll1s ) ;
  ME_NAND2   g21 ( positive, Result[11], notBit11 ) ;
  ME_AND3_B  g20 ( notSNGrossOv, notAll1s, notBit11, notOverflow ) ;

  ME_AND4_B  g24 ( notUnderflow, notSNGrossOv, notAll1s, notBit11, notExpException ) ;
  
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)adderlsblog.v	1.1  4/7/92
//
module AdderLSBlog ( Rom_Sub,
                     Rom_DivStepSQRT,
                     notBregSign, Eqv,
                     notFracRNearest,
                     TrueIEEEAregLSB,
                     notSub, AdderCarryIn,
                     notFracZero, FracZero);

input  Rom_Sub,
       Rom_DivStepSQRT,
       notBregSign, Eqv;
input  notFracRNearest,
       TrueIEEEAregLSB;
output notSub, AdderCarryIn,
       notFracZero, FracZero;

ME_TIEOFF toff (vdd, gnd);

ME_NMUX2B_B g12 (Rom_DivStepSQRT, Rom_Sub, notBregSign, notSub);

ME_INV_A    g13 (notSub, Sub);

ME_MUX2B   g15 (notFracRNearest, TrueIEEEAregLSB, Sub, AdderCarryIn);

// Optimise
// ME_AND2   g14 (Eqv, Sub, notFracZero); // this is neccessary for no-zero on add

ME_NMUX2B   g16 (notSub, Eqv, gnd, notFracZero); // this is neccessary for no-zero on add

ME_INVA     g17 (notFracZero, FracZero);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)areginexactslice.v	1.1  4/7/92
//
module AregInexactSlice (AM, notAM31_3, notAM2_0);
input [31:0] AM;
output notAM31_3, notAM2_0;

wire [11:4] notAORed;

ME_NOR3 aig0 (AM[0], AM[1], AM[2], notAM2_0);

ME_NOR2 aig5 (AM[30], AM[31],                 notAORed[11]);
ME_NOR3 aig6 (AM[27], AM[28], AM[29],         notAORed[10]);
ME_NOR4 ai54 (AM[25], AM[26], AM[23], AM[24], notAORed[9]);
ME_NOR4 ai44 (AM[21], AM[22], AM[19], AM[20], notAORed[8]);
ME_NOR4 ai34 (AM[17], AM[18], AM[15], AM[16], notAORed[7]);
ME_NOR4 ai24 (AM[13], AM[14], AM[11], AM[12], notAORed[6]);
ME_NOR4 ai14 (AM[9],  AM[10], AM[7],  AM[8],  notAORed[5]);
ME_NOR4 ai04 (AM[5],  AM[6],  AM[3],  AM[4],  notAORed[4]);

ME_NAND4 ai27 (notAORed[8], notAORed[9], notAORed[10], notAORed[11], AM31_19);
ME_NAND4 ai17 (notAORed[4], notAORed[5], notAORed[6],  notAORed[7],  AM18_3);

ME_NOR2 aizz (AM31_19, AM18_3, notAM31_3);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)areglsblog.v	1.1  4/7/92
//
module AregLSBLog (AregSticky,
                   AregLSBSN,
                   AregLSBDB,
                   AregFPMSBP1,
                   SNnotDB,
                   TrueIEEEAregLSB,
                   StickyForSR1);
input [1:0] AregSticky; // Two LSBs of Areg
input [1:0] AregLSBSN;  // Two LSBs of Areg for IEEE single length
input [1:0] AregLSBDB;  // Two LSBs of Areg for IEEE double length
input AregFPMSBP1;      // Fraction overflow bit (ie 4.0 < Areg =< 2.0)
input SNnotDB;
output TrueIEEEAregLSB;
output StickyForSR1;

ME_OR2 v1 (AregSticky[1], AregSticky[0], StickyForSR1);

ME_MUX4B asdf (SNnotDB, AregFPMSBP1,
              AregLSBDB[0], AregLSBSN[0],
              AregLSBDB[1], AregLSBSN[1],
              TrueIEEEAregLSB);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)checkoverflow.v	1.1  4/7/92
//
module CheckOverflow (FracResult, notPossibleOv, SubResultNorm);
input [10:1] FracResult;
output notPossibleOv, SubResultNorm;

// PossibleOv = (AResult[8:1] == 8'hFF)
// Check that an overflow is not possible on rounding cycle
// This can only occur if a large number of ones occur in the
// unrounded result

ME_NAND8_B g10  (FracResult[8], FracResult[7], FracResult[6], FracResult[5], FracResult[4], 
                 FracResult[3], FracResult[2], FracResult[1], notPossibleOv);

ME_OR3_B  srgx (FracResult[10], FracResult[9], FracResult[8], SubResultNorm);


endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)csarray.v	1.1  4/7/92
//
/**********************/
/* Carry Save Array   */
/**********************/
module CSArray (
// ctl inputs
                Shift,
                Pos,
                Zero,
// inputs
                SumIn,
                CarryIn,
                Breg,
// ctl output
                SALSBs, SBLSBs, SCLSBs,
                CALSB,  CBLSB,  CCLSB,
// outputs
                SD,
                CD[`FracMSB:2]);
input  [3:0] Shift, Pos, Zero;
input  [`FracMSB:3] CarryIn, SumIn;
input  [`FracMSB:1] Breg;
output [2:1] SALSBs, SBLSBs, SCLSBs;
output CALSB,  CBLSB,  CCLSB;
output [`FracMSB:1] SD;
output [1+`FracMSB:2] CD;

wire [`FracMSB:1] SA, SB, SC; // For cs in line expansion
wire [1+`FracMSB:2] CA, CB, CC;

CS_STAGE_57 asdc ({SumIn[`FracMSB], SumIn[`FracMSB], SumIn[`FracMSB:3]},
                  {CarryIn[`FracMSB], CarryIn[`FracMSB], CarryIn[`FracMSB:3]},
                  Breg, Shift[0], Pos[0], Zero[0],
                  {SA[`FracMSB:3], SALSBs[2:1]}, {CA[1+`FracMSB:3], CALSB});

CS_STAGE_57 asdd ({SA[`FracMSB], SA[`FracMSB], SA[`FracMSB:3]},
                  {CA[`FracMSB], CA[`FracMSB], CA[`FracMSB:3]},
                  Breg, Shift[1], Pos[1], Zero[1],
                  {SB[`FracMSB:3], SBLSBs[2:1]}, {CB[1+`FracMSB:3], CBLSB});

CS_STAGE_57 asde ({SB[`FracMSB], SB[`FracMSB], SB[`FracMSB:3]},
                  {CB[`FracMSB], CB[`FracMSB], CB[`FracMSB:3]},
                  Breg, Shift[2], Pos[2], Zero[2],
                  {SC[`FracMSB:3], SCLSBs[2:1]}, {CC[1+`FracMSB:3], CCLSB});

CS_STAGE_57 asdf ({SC[`FracMSB], SC[`FracMSB], SC[`FracMSB:3]},
                  {CC[`FracMSB], CC[`FracMSB], CC[`FracMSB:3]},
                  Breg, Shift[3], Pos[3], Zero[3],
                  SD, CD);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)csregslice.v	1.1  4/7/92
//
module CSRegSlice    (Phi,
                      InitialMulStep,
/* 		notInitialSumZero, */
		      InitialCarryBit,
                      SumCarryLoadEn,
                      SumOut, CarryOut,
                      BregIn,
                      SumIn, CarryIn);


input  Phi;
input  InitialMulStep,
/* 	notInitialSumZero, */
       InitialCarryBit,
       SumCarryLoadEn;
input  [`FracMSB:0] SumOut, CarryOut;
input  [`FracMSB:1] BregIn;
output [`FracMSB:0] SumIn, CarryIn;

wire   [`FracMSB:0] SumReg, CarryReg, InitialSum;
ME_TIEOFF toff (vdd, gnd);

ME_FREGA_1_58 sr (Phi, SumCarryLoadEn, SumOut, SumReg);
ME_FREGA_1_58 cr (Phi, SumCarryLoadEn, CarryOut, CarryReg);

/* 	ME_NMUX_2B_58 iz (notInitialSumZero, */

ME_NMUX_2B_58 iz (InitialCarryBit,
                  {vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, 
                   vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, 
                   vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, 
                   vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, vdd, 
                   vdd, vdd}, // 58'h3FF_FFFF_FFFF_FFFF
                  {BregIn, vdd},
                  InitialSum);
ME_MUX_2B_58 si  (InitialMulStep, SumReg, InitialSum, SumIn);
ME_MUX_2B_58 ci  (InitialMulStep,
                  CarryReg,
                  {gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, // 56'h0
                   InitialCarryBit, gnd},
                  CarryIn);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)fdp.v	1.1  4/7/92
//
module fp_frac
           (ss_clock,
            FracAregLoadEn, FracAregLC, 
            FracBregLoadEn, FracBregLC, 
            FracCregLoadEn, FracCregLC,
            FracTregLoadEn,
            FracYbusLSBs,
            InFromCregOr0, InForCreg, InForCregDB,
            Constantb, Constantd, Constante, Constantf, Constantg, Constanth,
	    RS2_frac, RS1_frac,
	    SNnotDB, OprSNnotDB,
            SRControl, SROneMore, SRToSticky, 
            SLControl,
	    LIB,
            TopBitsIn,
            notStickyInForSR,                       // For  right
            Shift, Pos, Zero, InitialMulStep,
/* 	notInitialSumZero, */
	    InitialCarryBit,
            SumCarryLoadEn,
            MulLenSel,
            SumOut0, CarryOut0, CarryOut3,
            LeftnotRight, FracALUOpSub, FracALUOpDiv,
	    notFracYFromD1, notFracYFromD2, notFracYFromD3,
/*  notFracYFromD1A, notFracYFromD2A, notFracYFromD3A, */ //Copies
            FracXFromB,
        //ctl outputs
	    notSticky4, Sticky2, notSticky1, StickyExtra,
            Creg_30_29,			// CregSNBits = Creg[30:29]
            Creg_56_55,			// CregInSL2SQRT = Creg[56:55]
            BregMaster_57,		// FracBregSign
            BregMaster_54,		// BregFPMSBM1
            notMultip,
            notAM31_3, notAM2_0,	// Inexact parts
	    StickyForSR1,
	    AregMaster_57_40,		// AregMaster[57:40]
            AregMaster_32,		// AregMaster[32]
            AregMaster_7_0,		// AregMaster[7:0]
/*  duplicate port--AregMasterFPMSBP1, */  // AregMasterBuf[56]
	    notAregMasterFPMSBP1,
            Treg_1_0,			// TregLSBs
            SumInLSBs, CarryInLSBs,
            SALSBs, SBLSBs, SCLSBs,	// LSBs for cs array
            CALSB , CBLSB , CCLSB ,
	    notFracZero, FracZero,
            FracResult_57,		// FracSign
            SubResultNorm,
            FracResult_56,		// FracOverflow
            FracResult_55_52,		// StepRemBits
            notPossibleOv, 
            FracResultBufout,		// only bits [54:3] are used in result
	    ss_scan_mode, fp_frac_scan_in, fp_frac_scan_out);

input ss_clock;
input       FracAregLoadEn;
input [2:0] FracAregLC;
input       FracBregLoadEn;
input [2:0] FracBregLC; 
input [1:0]       FracYbusLSBs;
input             FracCregLoadEn, FracCregLC,
                  FracTregLoadEn;
input [54:0] RS2_frac, RS1_frac;
input       SNnotDB, OprSNnotDB;
input       Constantb, Constantd, Constante, Constantf, Constantg, Constanth;
input [1:0] InFromCregOr0;
input [1:0] InForCreg,
            InForCregDB;
input [3:0] SRControl, SLControl;
input [2:0] LIB;
input       SROneMore, SRToSticky;
input [8:0] TopBitsIn;
input       notStickyInForSR;
input [3:0] Shift, Pos, Zero;
input       InitialMulStep,
/* 	notInitialSumZero, */
	    InitialCarryBit,
            SumCarryLoadEn;
input       LeftnotRight, FracALUOpSub, FracALUOpDiv;
input [4:0] MulLenSel;
input       SumOut0, CarryOut0, CarryOut3;
input	    notFracYFromD1, notFracYFromD2, notFracYFromD3,
/*   input notFracYFromD1A, notFracYFromD2A, notFracYFromD3A, */
            FracXFromB;
input ss_scan_mode, fp_frac_scan_in;

output [3:0] notSticky4;
output [1:0] Sticky2;
output       notSticky1;
output [1:0] StickyExtra;
output [8:0] notMultip;
output [1:0] Treg_1_0;

output [1:0] Creg_30_29;
output [1:0] Creg_56_55;

output StickyForSR1;
output [17:0] AregMaster_57_40;
output        AregMaster_32;
output [ 7:0] AregMaster_7_0;
output        notAM31_3, notAM2_0;
output BregMaster_54;
output BregMaster_57;
output notFracZero, FracZero;
output [3:0] FracResult_55_52;
output FracResult_57, FracResult_56;

output	     notAregMasterFPMSBP1;
output       SubResultNorm;
output [54:3] FracResultBufout;
output [2:0] SumInLSBs,
             CarryInLSBs;
output [1:0] SALSBs, SBLSBs, SCLSBs;
output       CALSB , CBLSB , CCLSB ;
output       notPossibleOv ;
output	fp_frac_scan_out;

ME_TIEOFF toff (vdd, gnd);

// commented this out -- 
//assign fp_frac_scan_out = 1'bx ;

wire AregMasterFPMSBP1;
wire [57:0] AregMaster, AregMasterBuf;

assign AregMaster_57_40 = AregMaster[57:40] ;
assign AregMaster_32    = AregMaster[32] ;
assign AregMaster_7_0   = AregMaster[7:0] ;

wire [57:0] BregMaster;
assign BregMaster_54 = BregMaster[54] ;
assign BregMaster_57 = BregMaster[57] ;

wire [57:0] Creg;
assign Creg_30_29 = Creg[30:29] ;
assign Creg_56_55 = Creg[56:55] ;

wire [57:0] FracResult;

assign FracResult_55_52 = FracResult[55:52] ;
assign FracResult_57    = FracResult[57] ;
assign FracResult_56    = FracResult[56] ;

wire [57:0] FracResultBuf;
assign FracResultBufout = FracResultBuf[54:3] ;

wire [57:0] Treg;
assign Treg_1_0 = Treg[1:0];

// internal bus on fractions datapath

wire [57:1] SRResult;
wire [57:0] SLResult;
wire [57:0] SResult, BregMasterBuf, FracXbus;
wire [57:2] FracYbus;
wire [57-1:1] SD;
wire [57-1:2] CD;

// extended internal format operands

wire [57:0] OprA, OprB;
wire [51:0] FracOpA, FracOpB;

// note order of items is suggested order of functional units on datapath.


// Operand select (single/double) muxes

ME_MUX_2B_52 opifaxf (OprSNnotDB,
		      RS2_frac[51:0],
		      {RS2_frac[54:32],
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd},
		      FracOpA[51:0]);

assign OprA = {gnd, gnd, vdd, FracOpA, gnd, gnd, gnd};

ME_MUX_2B_52 opifbxf (OprSNnotDB,
		      RS1_frac[51:0],
		      {RS1_frac[54:32],
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd, gnd, gnd, gnd, gnd, gnd, gnd,
		      gnd},
		      FracOpB[51:0]);

assign OprB = {gnd, gnd, vdd, FracOpB, gnd, gnd, gnd};

// Breg Input stuff 

ME_FREGA_5_58 B   (ss_clock,
                   FracBregLoadEn,
                   FracBregLC[0], FracBregLC[1], FracBregLC[2],
                   OprB, AregMasterBuf,
                   FracResultBuf,
                   {FracResultBuf[57-2:0], InFromCregOr0}, // FracResultSL2
                   {CD[57-1:2], CarryOut3, CarryOut0, gnd}, // MulResCarry For Breg
                   BregMaster,
                   BregMasterBuf,
                   notBregMSB);

MultiplierSlice mu (ss_clock,
                    InitialMulStep,
// dhn--01/10/91	notInitialSumZero, //
		    InitialCarryBit,
                    SumCarryLoadEn,
                    Shift, Pos, Zero,
                    SumOut0, CarryOut0, CarryOut3,
                    BregMasterBuf[57:1], SumInLSBs, CarryInLSBs,
                    SALSBs, SBLSBs, SCLSBs,
                    CALSB,  CBLSB,  CCLSB,
                    SD[57-1:1],
                    CD[57-1:2]);

ME_FREGA_2_58 C   (ss_clock,
                   FracCregLoadEn, FracCregLC,
                   FracResultBuf,
                   {Creg[57-2:31],InForCreg, Creg[28:1], InForCregDB, gnd}, // CregSL2SQTDIV
                   Creg);

// ******** AREG  *********************************
ME_INVA ifs (FracResult_57, notFracSign);	// used to be in divlog

ME_FREGA_8_58 A   (ss_clock, 
                FracAregLoadEn,
                FracAregLC[0], FracAregLC[1], FracAregLC[2], 
                OprA,
                Creg,
                BregMasterBuf, // 2 Allow speedy swapping
                SResult,    // 3
                FracResultBuf,
                {FracResultBuf[56:0], gnd}, // FracResultSL1
                {AregMasterBuf[56:2], notFracSign, gnd, gnd},
                {SD[57-1:1], CarryOut0, SumOut0},        // MulResSum   ForAreg
                AregMaster,
                AregMasterBuf,
                AregMasterFPMSBP1,
                notAregMasterFPMSBP1);

// logic on output of areg in datapath

AregInexactSlice ax   (AregMasterBuf[31:0], notAM31_3, notAM2_0);

MulSelSlice snmultip ( MulLenSel, AregMaster[8:0], AregMaster[40:32], notMultip );

// *************** end of Areg ************************************ //

// Shifter logic
ShiftRight shr  (AregMasterBuf, SRControl, SROneMore,
                 SRToSticky,  TopBitsIn,
                 notSticky4, Sticky2, notSticky1, StickyExtra,
                 SRResult[57:1]);

ShiftLeft shl   (AregMasterBuf, SLControl, LIB,
                 SLResult);

ME_NMUX_2B_58 Smux (LeftnotRight, {SRResult[57:1], notStickyInForSR}, SLResult,
                    SResult);

ME_FREGA_1_58 T   (ss_clock, FracTregLoadEn, FracResultBuf, Treg);

// *************** end of Treg ************************************ //

/*ME_MUX_4B_56 Ymux (notFracYFromD0,
                   notFracYFromD1,
                   {gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                    gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                    gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                    gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}, // 56'h0
                   {AregMasterBuf[57], AregMasterBuf[57:3]}, // AregMasterSR1[57:2]
                   AregMasterBuf[57:2],
                   Treg[57:2],
                   FracYbus[57:2]);*/

ME_YmuxSlice Ymux (notFracYFromD1, notFracYFromD2, notFracYFromD3,
/* dhn--01/10/91	notFracYFromD1A, notFracYFromD2A, notFracYFromD3A, */
                   {AregMasterBuf[57], AregMasterBuf[57:3]}, // AregMasterSR1[57:2]
                   AregMasterBuf[57:2],
                   Treg[57:2],
                   FracYbus[57:2]);

// send bottom two bits of Y to control logic
// assign FracYbusBSLSBs = FracYbus[1:0]; // ignored taken from AregMaster[2:0] and Treg[1:0]
// insert two bits from control logic into the low end of Ybus here

// *************** end of Ymux ************************************ //

ME_MUX_2B_B_58 Xbus (FracXFromB,
                   { gnd, gnd, Constantb,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,  
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   gnd, gnd, gnd, gnd, gnd, gnd, gnd,
                   Constantd,
                   Constante, Constante, Constante, Constante,
                   Constante, Constante, Constante, Constante,
                   Constante, Constante, Constante, Constante,
                   Constante, Constante, Constante, Constante,
                   Constante, Constante, Constante, Constante,
                   Constante, Constante, Constante, Constante,
                   Constante, Constante, Constante, Constante,
                   Constantf,
                   Constantg, Constantg}, // FracXConstant
                   BregMasterBuf, FracXbus);

AregLSBLog alsb (AregMaster[1:0],	// AregLSBs[1:0]
                 AregMaster[33:32],	// AregLSBSN
                 AregMaster[4:3],	// AregLSBDB
                 AregMaster[56],	// AregFPMSBP1
                 SNnotDB,
                 TrueIEEEAregLSB,
                 StickyForSR1);

wire Eqv;

AdderLSBlog fals (FracALUOpSub,
                  FracALUOpDiv,
                  notBregMSB,		// notFracBregSign
                  Eqv,
                  Constanth,		// notFracRNearest
                  TrueIEEEAregLSB,
                  Sub, AdderCarryIn,
                  notFracZero, FracZero);

ME_ADD_58 adr (Sub, AdderCarryIn,
               FracXbus,
               {FracYbus, FracYbusLSBs},
               FracResult, FracResultBuf, Eqv);


/* ***************************** */
/* Deal with special result bits */
/* ***************************** */

CheckOverflow ov (FracResult[55+1:55-8], notPossibleOv, SubResultNorm);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)mulselslice.v	1.1  4/7/92
//
module MulSelSlice (MulLenSel, MDB, MSN, Multip);
input [4:0] MulLenSel;
input [8:0] MDB, MSN;
output [8:0] Multip;
wire [1:0] BMulLenSel;

// MulLenSel is {SNnotDB, SNnotDB, SNnotDB}
// these are buffered singly to give maximum speed for
// the multiplier select
// Note : BMulLenSel is inverse

ME_NMUX2B_B s0 ( MulLenSel[0], MDB[0], MSN[0], Multip[0]);
ME_NMUX2B_B s1 ( MulLenSel[1], MDB[1], MSN[1], Multip[1]);
ME_NMUX2B_B s2 ( MulLenSel[2], MDB[2], MSN[2], Multip[2]); 

ME_NMUX2B_B s3 ( MulLenSel[3], MDB[3], MSN[3], Multip[3]);
ME_NMUX2B_B s4 ( MulLenSel[3], MDB[4], MSN[4], Multip[4]);
ME_NMUX2B_B s5 ( MulLenSel[4], MDB[5], MSN[5], Multip[5]);
ME_NMUX2B_B s6 ( MulLenSel[3], MDB[6], MSN[6], Multip[6]);
ME_NMUX2B_B s7 ( MulLenSel[4], MDB[7], MSN[7], Multip[7]);
ME_NMUX2B_B s8 ( MulLenSel[4], MDB[8], MSN[8], Multip[8]);

endmodule


/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)multiplierslice.v	1.1  4/7/92
//

module MultiplierSlice (Phi,
// ctl inputs
                        InitialMulStep,
// 		notInitialSumZero, /
                        InitialCarryBit,
                        SumCarryLoadEn,
                        Shift,
                        Pos,
                        Zero,
                        SumOut0,
                        CarryOut0,
                        CarryOut3,
// inputs
                        Breg,
// ctl outputs
                        SumIn[2:0],
                        CarryIn[2:0],
                        SALSBs, SBLSBs, SCLSBs,
                        CALSB,  CBLSB,  CCLSB,
// outputs			    //*************************
						SD[56:1], // SumForAreg
                        CD[56:2]);
						//	SD['FracMSB-1:1], // SumForAreg
                        //	CD['FracMSB-1:2]);
						// Note that 'FracMSB=57
						// this lines causes: Range of port in module definition and body are reversed
						//**************************
input  Phi;
input
// 	notInitialSumZero, /
       InitialMulStep,
       InitialCarryBit,
       SumCarryLoadEn;
input [3:0]     Shift,
                Pos,
                Zero;
input  SumOut0,
       CarryOut0,
       CarryOut3;
input  [`FracMSB:1] Breg;
output [`FracMSB:0] SumIn, CarryIn;
output [1:0] SALSBs, SBLSBs, SCLSBs;
output       CALSB,  CBLSB,  CCLSB;

output [`FracMSB:1]SD; // original lines
output [`FracMSB:2]CD; // original lines
//output [`FracMSB:2]CD;
//output [`FracMSB:1]SD;

CSRegSlice csr       (Phi,
                      InitialMulStep,
// 		notInitialSumZero, /
                      InitialCarryBit,
                      SumCarryLoadEn,
                      {SD[`FracMSB:1], SumOut0},
                      {CD[`FracMSB:2], CarryOut3, CarryOut0},
                      Breg [`FracMSB:1],
                      SumIn[`FracMSB:0],
                      CarryIn[`FracMSB:0]);
CSArray csa   ( Shift,
                Pos,
                Zero,
                SumIn[`FracMSB:3],
                CarryIn[`FracMSB:3],
                Breg [`FracMSB:1],
                SALSBs, SBLSBs, SCLSBs,
                CALSB,  CBLSB,  CCLSB,
                SD[`FracMSB:1],
                CD[`FracMSB:2]);
endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)shiftleft.v	1.1  4/7/92
//
module ShiftLeft   (NI,
                    SLControl,
		    LIB,
                    SLResult);

input [`FracMSB:0] NI;
input [3:0] SLControl;
input [2:0] LIB;		// shifted operand for int or frac
output [`FracMSB:0] SLResult;
                
wire [`FracMSB:0] N8, N4, N2, N1;

ME_TIEOFF toff (vdd, gnd);

ME_NMUX_2B_58 g23 (SLControl[3],
                   NI,
                   {LIB[2], LIB[1], LIB[0], NI[`FracMSB-11:0],
                    gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd},
                   N8);  // False
ME_NMUX_2B_58 g24 (SLControl[2],
                   N8,
                   {N8[`FracMSB-4:0], vdd, vdd, vdd, vdd}, N4);
ME_NMUX_2B_58 g25 (SLControl[1],
                   N4,
                   {N4[`FracMSB-2:0], gnd, gnd},
                   N2);  // False
ME_NMUX_2B_58 g26 (SLControl[0],  N2, {N2[`FracMSB-1:0], vdd}, N1); // true

ME_INV_A_58   g27 (N1, SLResult); // false

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
//  @(#)shiftright.v	1.1  4/7/92
//
module ShiftRight (Areg,
                 SRControl, 
                 SROneMore,
                 SRToSticky,
		 TopBitsIn,
// outputs
                 S8_3_0,
                 S4_1_0,
                 S2_0,
                 S1_1_0,
                 notSRResult);

input [`FracMSB:0] Areg;
input [3:0] SRControl;
input            SROneMore,
                 SRToSticky;
input [8:0] TopBitsIn;

output [3:0] S8_3_0;
output [1:0] S4_1_0;
output	     S2_0;
output [1:0] S1_1_0;
output [`FracMSB:1] notSRResult;

wire [`FracMSB:0] S8, S4, S2, S1;
wire [`FracMSB:0] SE;
assign S8_3_0 = S8[3:0] ;
assign S4_1_0 = S4[1:0] ;
assign S2_0   = S2[0] ;
assign S1_1_0 = S1[1:0] ;


  ME_NMUX2B_B   g87 (SRControl[3],       // Buffer MSB seperately
                     Areg[`FracMSB],
                     TopBitsIn[8],
                     S8[`FracMSB]);     // False
  ME_NMUX_2B_57 g86 (SRControl[3],
                     Areg[`FracMSB-1:0],
                     {TopBitsIn[8], TopBitsIn[8:0], Areg[`FracMSB-3:8]},
                     S8[`FracMSB-1:0]);     // False

  ME_NMUX_2B_58 g21 (SRControl[2],
                     S8,
                     {S8[`FracMSB], S8[`FracMSB],S8[`FracMSB],S8[`FracMSB],
                      S8[`FracMSB:4]},
                     S4);           // True
  ME_NMUX_2B_58 g23 (SRControl[1],
                     S4,
                     {S4[`FracMSB], S4[`FracMSB],S4[`FracMSB:2]},
                     S2);           // False
  ME_NMUX_2B_58 g24 (SRControl[0],
                     S2,
                     {S2[`FracMSB],    S2[`FracMSB:1]},
                     S1);           // True
  ME_NMUX_2B_58 g25 (SROneMore,
                     S1,
                     {S1[`FracMSB],    S1[`FracMSB:1]},
                     SE);         // False

  ME_INV_B      g50 (SRToSticky, notSRToSticky);
  ME_INV_C      g51 (notSRToSticky, BSRToSticky);

  ME_OR2_B      h01 (BSRToSticky, SE[01], notSRResult[01]);
  ME_OR2_B      h02 (BSRToSticky, SE[02], notSRResult[02]);
  ME_OR2_B      h03 (BSRToSticky, SE[03], notSRResult[03]);
  ME_OR2_B      h04 (BSRToSticky, SE[04], notSRResult[04]);
  ME_OR2_B      h05 (BSRToSticky, SE[05], notSRResult[05]);
  ME_OR2_B      h06 (BSRToSticky, SE[06], notSRResult[06]);
  ME_OR2_B      h07 (BSRToSticky, SE[07], notSRResult[07]);
  ME_OR2_B      h08 (BSRToSticky, SE[08], notSRResult[08]);
  ME_OR2_B      h09 (BSRToSticky, SE[09], notSRResult[09]);
  ME_OR2_B      h10 (BSRToSticky, SE[10], notSRResult[10]);
  ME_OR2_B      h11 (BSRToSticky, SE[11], notSRResult[11]);
  ME_OR2_B      h12 (BSRToSticky, SE[12], notSRResult[12]);
  ME_OR2_B      h13 (BSRToSticky, SE[13], notSRResult[13]);
  ME_OR2_B      h14 (BSRToSticky, SE[14], notSRResult[14]);
  ME_OR2_B      h15 (BSRToSticky, SE[15], notSRResult[15]);
  ME_OR2_B      h16 (BSRToSticky, SE[16], notSRResult[16]);
  ME_OR2_B      h17 (BSRToSticky, SE[17], notSRResult[17]);
  ME_OR2_B      h18 (BSRToSticky, SE[18], notSRResult[18]);
  ME_OR2_B      h19 (BSRToSticky, SE[19], notSRResult[19]);
  ME_OR2_B      h20 (BSRToSticky, SE[20], notSRResult[20]);
  ME_OR2_B      h21 (BSRToSticky, SE[21], notSRResult[21]);
  ME_OR2_B      h22 (BSRToSticky, SE[22], notSRResult[22]);
  ME_OR2_B      h23 (BSRToSticky, SE[23], notSRResult[23]);
  ME_OR2_B      h24 (BSRToSticky, SE[24], notSRResult[24]);
  ME_OR2_B      h25 (BSRToSticky, SE[25], notSRResult[25]);
  ME_OR2_B      h26 (BSRToSticky, SE[26], notSRResult[26]);
  ME_OR2_B      h27 (BSRToSticky, SE[27], notSRResult[27]);
  ME_OR2_B      h28 (BSRToSticky, SE[28], notSRResult[28]);
  ME_OR2_B      h29 (BSRToSticky, SE[29], notSRResult[29]);
  ME_OR2_B      h30 (BSRToSticky, SE[30], notSRResult[30]);
  ME_OR2_B      h31 (BSRToSticky, SE[31], notSRResult[31]);
  ME_OR2_B      h32 (BSRToSticky, SE[32], notSRResult[32]);
  ME_OR2_B      h33 (BSRToSticky, SE[33], notSRResult[33]);
  ME_OR2_B      h34 (BSRToSticky, SE[34], notSRResult[34]);
  ME_OR2_B      h35 (BSRToSticky, SE[35], notSRResult[35]);
  ME_OR2_B      h36 (BSRToSticky, SE[36], notSRResult[36]);
  ME_OR2_B      h37 (BSRToSticky, SE[37], notSRResult[37]);
  ME_OR2_B      h38 (BSRToSticky, SE[38], notSRResult[38]);
  ME_OR2_B      h39 (BSRToSticky, SE[39], notSRResult[39]);
  ME_OR2_B      h40 (BSRToSticky, SE[40], notSRResult[40]);
  ME_OR2_B      h41 (BSRToSticky, SE[41], notSRResult[41]);
  ME_OR2_B      h42 (BSRToSticky, SE[42], notSRResult[42]);
  ME_OR2_B      h43 (BSRToSticky, SE[43], notSRResult[43]);
  ME_OR2_B      h44 (BSRToSticky, SE[44], notSRResult[44]);
  ME_OR2_B      h45 (BSRToSticky, SE[45], notSRResult[45]);
  ME_OR2_B      h46 (BSRToSticky, SE[46], notSRResult[46]);
  ME_OR2_B      h47 (BSRToSticky, SE[47], notSRResult[47]);
  ME_OR2_B      h48 (BSRToSticky, SE[48], notSRResult[48]);
  ME_OR2_B      h49 (BSRToSticky, SE[49], notSRResult[49]);
  ME_OR2_B      h50 (BSRToSticky, SE[50], notSRResult[50]);
  ME_OR2_B      h51 (BSRToSticky, SE[51], notSRResult[51]);
  ME_OR2_B      h52 (BSRToSticky, SE[52], notSRResult[52]);
  ME_OR2_B      h53 (BSRToSticky, SE[53], notSRResult[53]);
  ME_OR2_B      h54 (BSRToSticky, SE[54], notSRResult[54]);
  ME_OR2_B      h55 (BSRToSticky, SE[55], notSRResult[55]);
  ME_OR2_B      h56 (BSRToSticky, SE[56], notSRResult[56]);
  ME_OR2_B      h57 (BSRToSticky, SE[57], notSRResult[57]);

endmodule

/******************************************************************************/ 
/*                                                                            */ 
/* Copyright (c) 1999 Sun Microsystems, Inc. All rights reserved.             */ 
/*                                                                            */ 
/* The contents of this file are subject to the current version of the Sun    */ 
/* Community Source License, microSPARCII ("the License"). You may not use    */ 
/* this file except in compliance with the License.  You may obtain a copy    */ 
/* of the License by searching for "Sun Community Source License" on the      */ 
/* World Wide Web at http://www.sun.com. See the License for the rights,      */ 
/* obligations, and limitations governing use of the contents of this file.   */ 
/*                                                                            */ 
/* Sun Microsystems, Inc. has intellectual property rights relating to the    */ 
/* technology embodied in these files. In particular, and without limitation, */ 
/* these intellectual property rights may include one or more U.S. patents,   */ 
/* foreign patents, or pending applications.                                  */ 
/*                                                                            */ 
/* Sun, Sun Microsystems, the Sun logo, all Sun-based trademarks and logos,   */ 
/* Solaris, Java and all Java-based trademarks and logos are trademarks or    */ 
/* registered trademarks of Sun Microsystems, Inc. in the United States and   */ 
/* other countries. microSPARC is a trademark or registered trademark of      */ 
/* SPARC International, Inc. All SPARC trademarks are used under license and  */ 
/* are trademarks or registered trademarks of SPARC International, Inc. in    */ 
/* the United States and other countries. Products bearing SPARC trademarks   */ 
/* are based upon an architecture developed by Sun Microsystems, Inc.         */ 
/*                                                                            */ 
/******************************************************************************/ 
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)fp_rom.v
***
****************************************************************************
****************************************************************************/
// **************************************************************
//  @(#)fp_rom.v	1.7  1/8/93
//
//  High-level verilog model of the fpu 256x64 rom.
// **************************************************************


	// simulates a clocked ROM with an internal address register
module fp_rom ( ss_clock, rom_adr, rom_dout,
		rom_scan_out, rom_scan_in, ss_scan_mode);

input ss_clock ;
input rom_scan_in, ss_scan_mode ;
input [7:0] rom_adr ;
output rom_scan_out ;
output [63:0] rom_dout ;



wire [63:0] data ;
wire [7:0] reg_rom_adr ;	// registered version of the address

Mflipflop_noop rmad7(reg_rom_adr[7], rom_adr[7], ss_clock);
Mflipflop_noop rmad6(reg_rom_adr[6], rom_adr[6], ss_clock);
Mflipflop_noop rmad5(reg_rom_adr[5], rom_adr[5], ss_clock);
Mflipflop_noop rmad4(reg_rom_adr[4], rom_adr[4], ss_clock);
Mflipflop_noop rmad3(reg_rom_adr[3], rom_adr[3], ss_clock);
Mflipflop_noop rmad2(reg_rom_adr[2], rom_adr[2], ss_clock);
Mflipflop_noop rmad1(reg_rom_adr[1], rom_adr[1], ss_clock);
Mflipflop_noop rmad0(reg_rom_adr[0], rom_adr[0], ss_clock);

RR256X64 ROM_256x64 ( 
		.DO63(rom_dout[63]), 
		.DO62(rom_dout[62]), 
		.DO61(rom_dout[61]),
		.DO60(rom_dout[60]),
		.DO59(rom_dout[59]), 
		.DO58(rom_dout[58]), 
		.DO57(rom_dout[57]), 
		.DO56(rom_dout[56]), 
		.DO55(rom_dout[55]), 
		.DO54(rom_dout[54]), 
		.DO53(rom_dout[53]), 
		.DO52(rom_dout[52]), 
		.DO51(rom_dout[51]), 
		.DO50(rom_dout[50]), 
		.DO49(rom_dout[49]), 
		.DO48(rom_dout[48]), 
		.DO47(rom_dout[47]), 
		.DO46(rom_dout[46]),
		.DO45(rom_dout[45]), 
		.DO44(rom_dout[44]), 
		.DO43(rom_dout[43]), 
		.DO42(rom_dout[42]), 
		.DO41(rom_dout[41]), 
		.DO40(rom_dout[40]), 
		.DO39(rom_dout[39]), 
		.DO38(rom_dout[38]), 
		.DO37(rom_dout[37]), 
		.DO36(rom_dout[36]), 
		.DO35(rom_dout[35]), 
		.DO34(rom_dout[34]), 
		.DO33(rom_dout[33]), 
		.DO32(rom_dout[32]), 
		.DO31(rom_dout[31]), 
		.DO30(rom_dout[30]), 
		.DO29(rom_dout[29]), 
		.DO28(rom_dout[28]), 
		.DO27(rom_dout[27]), 
		.DO26(rom_dout[26]), 
		.DO25(rom_dout[25]),
		.DO24(rom_dout[24]), 
		.DO23(rom_dout[23]), 
		.DO22(rom_dout[22]), 
		.DO21(rom_dout[21]), 
		.DO20(rom_dout[20]), 
		.DO19(rom_dout[19]), 
		.DO18(rom_dout[18]),
		.DO17(rom_dout[17]), 
		.DO16(rom_dout[16]), 
		.DO15(rom_dout[15]), 
		.DO14(rom_dout[14]), 
		.DO13(rom_dout[13]),
		.DO12(rom_dout[12]), 
		.DO11(rom_dout[11]), 
		.DO10(rom_dout[10]), 
		.DO9(rom_dout[9]), 
		.DO8(rom_dout[8]), 
		.DO7(rom_dout[7]), 
		.DO6(rom_dout[6]), 
		.DO5(rom_dout[5]), 
		.DO4(rom_dout[4]), 
		.DO3(rom_dout[3]), 
		.DO2(rom_dout[2]), 
		.DO1(rom_dout[1]), 
		.DO0(rom_dout[0]),
		.OE(1'b1),
		.ADR7(reg_rom_adr[7]),
		.ADR6(reg_rom_adr[6]),
		.ADR5(reg_rom_adr[5]),
		.ADR4(reg_rom_adr[4]), 
		.ADR3(reg_rom_adr[3]), 
		.ADR2(reg_rom_adr[2]), 
		.ADR1(reg_rom_adr[1]), 
		.ADR0(reg_rom_adr[0])
		);

endmodule

 
module RR256X64 (
	DO63,DO62,DO61,DO60,DO59,DO58,DO57,DO56,
	DO55,DO54,DO53,DO52,DO51,DO50,DO49,DO48,
	DO47,DO46,DO45,DO44,DO43,DO42,DO41,DO40,
	DO39,DO38,DO37,DO36,DO35,DO34,DO33,DO32,
	DO31,DO30,DO29,DO28,DO27,DO26,DO25,DO24,
	DO23,DO22,DO21,DO20,DO19,DO18,DO17,DO16,
	DO15,DO14,DO13,DO12,DO11,DO10,DO9,DO8,
	DO7,DO6,DO5,DO4,DO3,DO2,DO1,DO0,
	OE,
	ADR7,ADR6,ADR5,ADR4,ADR3,ADR2,ADR1,ADR0);

input 	OE,
	ADR7,ADR6,ADR5,ADR4,ADR3,ADR2,ADR1,ADR0;

output 	DO63,DO62,DO61,DO60,DO59,DO58,DO57,DO56,
	DO55,DO54,DO53,DO52,DO51,DO50,DO49,DO48,
	DO47,DO46,DO45,DO44,DO43,DO42,DO41,DO40,
	DO39,DO38,DO37,DO36,DO35,DO34,DO33,DO32,
	DO31,DO30,DO29,DO28,DO27,DO26,DO25,DO24,
	DO23,DO22,DO21,DO20,DO19,DO18,DO17,DO16,
	DO15,DO14,DO13,DO12,DO11,DO10,DO9,DO8,
	DO7,DO6,DO5,DO4,DO3,DO2,DO1,DO0;

wire [7:0] reg_rom_adr = {
	ADR7,ADR6,ADR5,ADR4,ADR3,ADR2,ADR1,ADR0 };
reg [63:0] data;

assign 	{
	DO63,DO62,DO61,DO60,DO59,DO58,DO57,DO56,
	DO55,DO54,DO53,DO52,DO51,DO50,DO49,DO48,
	DO47,DO46,DO45,DO44,DO43,DO42,DO41,DO40,
	DO39,DO38,DO37,DO36,DO35,DO34,DO33,DO32,
	DO31,DO30,DO29,DO28,DO27,DO26,DO25,DO24,
	DO23,DO22,DO21,DO20,DO19,DO18,DO17,DO16,
	DO15,DO14,DO13,DO12,DO11,DO10,DO9,DO8,
	DO7,DO6,DO5,DO4,DO3,DO2,DO1,DO0 } = data[63:0];


  always @(reg_rom_adr) begin
    case (reg_rom_adr)
 	8'd000:  data = 64'h0000000000000000 ;
 	8'd001:  data = 64'h00000011100085c4 ;
 	8'd002:  data = 64'h00000041100085a4 ;
 	8'd003:  data = 64'h0000000000000000 ;
 	8'd004:  data = 64'h03103010c804f865 ;
 	8'd005:  data = 64'h0020800113800000 ;
 	8'd006:  data = 64'h00000000000085ac ;
 	8'd007:  data = 64'h121200000000806c ;
 	8'd008:  data = 64'h041440404800f865 ;
 	8'd009:  data = 64'h0020800113800000 ;
 	8'd010:  data = 64'h05145051c800f865 ;
 	8'd011:  data = 64'h0020800113800000 ;
 	8'd012:  data = 64'h000000100000860c ;
 	8'd013:  data = 64'h121200512000807c ;
 	8'd014:  data = 64'h000000100000860c ;
 	8'd015:  data = 64'h12120000000081dc ;
 	8'd016:  data = 64'h00000000000080a4 ;
 	8'd017:  data = 64'h00000000000087dc ;
 	8'd018:  data = 64'h0000004110000000 ;
 	8'd019:  data = 64'h00000001e8001dac ;
 	8'd020:  data = 64'h002080111000d57f ;
 	8'd021:  data = 64'h0020800123800000 ;
 	8'd022:  data = 64'h001430000000c9cd ;
 	8'd023:  data = 64'h0010300188000000 ;
 	8'd024:  data = 64'h0a14507968037040 ;
 	8'd025:  data = 64'h0300001968200000 ;
 	8'd026:  data = 64'h0a145079680371f0 ;
 	8'd027:  data = 64'h0300000168200000 ;
 	8'd028:  data = 64'h0a14507968037040 ;
 	8'd029:  data = 64'h0300001968200000 ;
 	8'd030:  data = 64'h0a145079680371f0 ;
    	8'd031:  data = 64'h0300000168200000 ;
   	8'd032:  data = 64'h0014000048000000 ;
   	8'd033:  data = 64'h0a1430000000c1cc ;
    	8'd034:  data = 64'h0a000000000069cc ;
    	8'd035:  data = 64'h0200000000008254 ;
    	8'd036:  data = 64'h0014010048000000 ;
    	8'd037:  data = 64'h0c1850518000c2f4 ;
    	8'd038:  data = 64'h0c1850000000c83c ;
    	8'd039:  data = 64'h02000018000082fe ;
    	8'd040:  data = 64'h0a14507968037040 ;
    	8'd041:  data = 64'h0300001968200000 ;
    	8'd042:  data = 64'h0a145079680371f0 ;
    	8'd043:  data = 64'h0300000168200000 ;
    	8'd044:  data = 64'h0a14507968037040 ;
    	8'd045:  data = 64'h0300001968200000 ;
    	8'd046:  data = 64'h0a145079680371f0 ;
    	8'd047:  data = 64'h0300000168200000 ;
    	8'd048:  data = 64'h8a1030000000842c ;
    	8'd049:  data = 64'h80103380000080b4 ;
    	8'd050:  data = 64'h801030780000842c ;
    	8'd051:  data = 64'h82103390680080b4 ;
    	8'd052:  data = 64'h801033800000866c ;
    	8'd053:  data = 64'h8a103380000086c4 ;
    	8'd054:  data = 64'h80103380000086c4 ;
    	8'd055:  data = 64'h0a1433800000c90c ;
    	8'd056:  data = 64'h001430000000c77e ;
    	8'd057:  data = 64'h801030000000ea55 ;
    	8'd058:  data = 64'h0014008188000000 ;
    	8'd059:  data = 64'h1212005120008624 ;
    	8'd060:  data = 64'h0000000000000001 ;
    	8'd061:  data = 64'h0000000001000000 ;
    	8'd062:  data = 64'h001450000000c737 ;
    	8'd063:  data = 64'h0000000001000000 ;
    	8'd064:  data = 64'h8a1030780000861c ;
    	8'd065:  data = 64'h80103000000080b4 ;
    	8'd066:  data = 64'h801030000000861c ;
    	8'd067:  data = 64'h82103018000080b4 ;
    	8'd068:  data = 64'h801030000000812c ;
    	8'd069:  data = 64'h00000000000080b4 ;
    	8'd070:  data = 64'h82103018000080b4 ;
    	8'd071:  data = 64'h0a1430000000c90c ;
    	8'd072:  data = 64'h001430000000c9cc ;
    	8'd073:  data = 64'h000000000000977e ;
    	8'd074:  data = 64'h04100017a0000000 ;
    	8'd075:  data = 64'h0300029188180001 ;
    	8'd076:  data = 64'h001400004b400000 ;
    	8'd077:  data = 64'h5e10001140000000 ;
    	8'd078:  data = 64'h5810501140000000 ;
   	8'd079:  data = 64'h5e95501120008470 ;
   	8'd080:  data = 64'h5e95500000000000 ;
   	8'd081:  data = 64'h80103027c8003cfc ;
   	8'd082:  data = 64'h10100047e00022a4 ;
   	8'd083:  data = 64'h0514000000000000 ;
   	8'd084:  data = 64'h0a000011a0008268 ;
   	8'd085:  data = 64'h2018501140000000 ;
   	8'd086:  data = 64'h5e10001140008470 ;
   	8'd087:  data = 64'h5810500000000000 ;
   	8'd088:  data = 64'h8300039160128350 ;
   	8'd089:  data = 64'h03000017c8100000 ;
   	8'd090:  data = 64'h0000028000000000 ;
   	8'd091:  data = 64'h0000007800008244 ;
   	8'd092:  data = 64'haa120391680283f0 ;
   	8'd093:  data = 64'hca18401720000000 ;
   	8'd094:  data = 64'h0c1850518000c605 ;
   	8'd095:  data = 64'h0020800002800000 ;
   	8'd096:  data = 64'h0014008048000000 ;
   	8'd097:  data = 64'h80103027c8003cfc ;
   	8'd098:  data = 64'h10100047e0002324 ;
   	8'd099:  data = 64'h0514000000000000 ;
   	8'd100:  data = 64'h0a000011a00082b0 ;
   	8'd101:  data = 64'h2018501140000000 ;
   	8'd102:  data = 64'h0300000000108448 ;
   	8'd103:  data = 64'h0300000000100000 ;
   	8'd104:  data = 64'h8300039160120c48 ;
   	8'd105:  data = 64'h03000017c8100000 ;
   	8'd106:  data = 64'h0300000000108330 ;
   	8'd107:  data = 64'h0300000000100000 ;
   	8'd108:  data = 64'haa120391680283f8 ;
   	8'd109:  data = 64'hca18401720000000 ;
   	8'd110:  data = 64'h001430000000c9cd ;
   	8'd111:  data = 64'h0010300003800000 ;
   	8'd112:  data = 64'h8a103380000083d4 ;
   	8'd113:  data = 64'h8010338000008374 ;
   	8'd114:  data = 64'h801033800000870c ;
   	8'd115:  data = 64'h82103380000080b4 ;
   	8'd116:  data = 64'h8a103078000086dc ;
   	8'd117:  data = 64'h8010338000008374 ;
   	8'd118:  data = 64'h82103380000080b4 ;
   	8'd119:  data = 64'h0a1433800000c90c ;
   	8'd120:  data = 64'h001430000000c254 ;
   	8'd121:  data = 64'h00000000000081cc ;
   	8'd122:  data = 64'h0c1850118000c6ee ;
   	8'd123:  data = 64'h03000010c8040000 ;
   	8'd124:  data = 64'haa12001168000bf8 ;
   	8'd125:  data = 64'hca18401720000000 ;
   	8'd126:  data = 64'h78c0400000000000 ;
   	8'd127:  data = 64'h78c0404380000000 ;
   	8'd128:  data = 64'h78c04041e800e400 ;
   	8'd129:  data = 64'h78c0400000000000 ;
   	8'd130:  data = 64'h01105011c800c454 ;
   	8'd131:  data = 64'h041500004800f865 ;
   	8'd132:  data = 64'h0020800113800000 ;
   	8'd133:  data = 64'h0c1853918000c37e ;
   	8'd134:  data = 64'h03000010c8040000 ;
   	8'd135:  data = 64'h8300001160108b4c ;
   	8'd136:  data = 64'h03000017c8100000 ;
   	8'd137:  data = 64'h0700000000000000 ;
   	8'd138:  data = 64'h041440104800f865 ;
   	8'd139:  data = 64'h0020800113800000 ;
   	8'd140:  data = 64'h0b0000158018ae4c ;
   	8'd141:  data = 64'h0414101720008654 ;
   	8'd142:  data = 64'h5e95500000002a54 ;
   	8'd143:  data = 64'h5e955011c800e470 ;
   	8'd144:  data = 64'hde95500000000000 ;
   	8'd145:  data = 64'h101800106800dc9c ;
   	8'd146:  data = 64'h1013400000000000 ;
   	8'd147:  data = 64'h03105000c804c454 ;
   	8'd148:  data = 64'h041500004800f865 ;
   	8'd149:  data = 64'h0020800113800000 ;
   	8'd150:  data = 64'h001850000000ccc4 ;
   	8'd151:  data = 64'h001430000000c736 ;
   	8'd152:  data = 64'h0a145079680171f0 ;
   	8'd153:  data = 64'h0300000168200000 ;
   	8'd154:  data = 64'h88103877c8009d5c ;
   	8'd155:  data = 64'h00000000000087b4 ;
   	8'd156:  data = 64'h8810387728003f6c ;
   	8'd157:  data = 64'h041400172800f865 ;
   	8'd158:  data = 64'h0020800113800000 ;
   	8'd159:  data = 64'h080000604800e2d4 ;
   	8'd160:  data = 64'h041850118000c37e ;
   	8'd161:  data = 64'h03000010c8040000 ;
   	8'd162:  data = 64'h00000027c8008a94 ;
   	8'd163:  data = 64'h0000000000008314 ;
   	8'd164:  data = 64'h001850000000c724 ;
   	8'd165:  data = 64'h001430000000c54c ;
   	8'd166:  data = 64'h0000000000003546 ;
   	8'd167:  data = 64'h0000000000006d4d ;
   	8'd168:  data = 64'h0000000001c00000 ;
   	8'd169:  data = 64'h020000000000858c ;
   	8'd170:  data = 64'h88103077c8001fb4 ;
   	8'd171:  data = 64'h00000015c8009f9c ;
   	8'd172:  data = 64'h0000004000000000 ;
   	8'd173:  data = 64'h0300000168202e34 ;
   	8'd174:  data = 64'h03000408c81c0001 ;
   	8'd175:  data = 64'h002080004b800000 ;
   	8'd176:  data = 64'h001430600000c1fe ;
   	8'd177:  data = 64'h0000000000003546 ;
   	8'd178:  data = 64'h000000000000ed47 ;
   	8'd179:  data = 64'h0000000001800000 ;
   	8'd180:  data = 64'h00000001e800985e ;
   	8'd181:  data = 64'h0000004180000000 ;
   	8'd182:  data = 64'h0300000168200000 ;
   	8'd183:  data = 64'h04142000000087cc ;
   	8'd184:  data = 64'h000000000000bd7e ;
   	8'd185:  data = 64'h0411101188000000 ;
   	8'd186:  data = 64'h00208011c800d73f ;
   	8'd187:  data = 64'h002080004a000000 ;
   	8'd188:  data = 64'h0c1850158000c5fe ;
   	8'd189:  data = 64'h03000010c8040000 ;
   	8'd190:  data = 64'h0200000048009fad ;
   	8'd191:  data = 64'h0014000003800000 ;
   	8'd192:  data = 64'h041030100000977e ;
   	8'd193:  data = 64'h000002800000b77e ;
   	8'd194:  data = 64'h000003000000877e ;
   	8'd195:  data = 64'h101850418000c77e ;
   	8'd196:  data = 64'h0a14507968017040 ;
   	8'd197:  data = 64'h0300001968200000 ;
   	8'd198:  data = 64'h04141400000080a0 ;
   	8'd199:  data = 64'h03000008c81c0000 ;
   	8'd200:  data = 64'h0b00081580182c6c ;
   	8'd201:  data = 64'h001410172000c37e ;
   	8'd202:  data = 64'h03000010c8040000 ;
   	8'd203:  data = 64'h001400004800f865 ;
   	8'd204:  data = 64'h0020800113800000 ;
   	8'd205:  data = 64'h021430000000c37e ;
   	8'd206:  data = 64'h001430100000c37e ;
   	8'd207:  data = 64'h04110000000085bc ;
   	8'd208:  data = 64'h00000000000081fe ;
   	8'd209:  data = 64'h8010300000008584 ;
   	8'd210:  data = 64'h00000060000081fe ;
   	8'd211:  data = 64'h8210301800008584 ;
   	8'd212:  data = 64'h80103000000084b4 ;
   	8'd213:  data = 64'h8010300000008584 ;
   	8'd214:  data = 64'h8210301800008584 ;
   	8'd215:  data = 64'h8010300000008524 ;
   	8'd216:  data = 64'h0a1850000000c9cc ;
   	8'd217:  data = 64'h001850000000c8be ;
   	8'd218:  data = 64'h0000000000008254 ;
   	8'd219:  data = 64'h0c1853800000cef4 ;
   	8'd220:  data = 64'h0c1850000000c255 ;
   	8'd221:  data = 64'h001030018b000000 ;
   	8'd222:  data = 64'h0c1850518000c37e ;
   	8'd223:  data = 64'h03000010c8040000 ;
   	8'd224:  data = 64'h0a000070680083dc ;
   	8'd225:  data = 64'h0c1850718000c37e ;
   	8'd226:  data = 64'h03000010c8040000 ;
   	8'd227:  data = 64'h0a000070680083e4 ;
   	8'd228:  data = 64'h001430000000cd8c ;
   	8'd229:  data = 64'h00000000000091ff ;
   	8'd230:  data = 64'h0000000000000000 ;
   	8'd231:  data = 64'h0020800122000000 ;
   	8'd232:  data = 64'h00000877c8003f55 ;
   	8'd233:  data = 64'h0014000723800000 ;
   	8'd234:  data = 64'h881030786800e0b4 ;
   	8'd235:  data = 64'h04185011e000c37e ;
   	8'd236:  data = 64'h0000001720008654 ;
   	8'd237:  data = 64'h801030106800e784 ;
   	8'd238:  data = 64'h001850100000ce7d ;
   	8'd239:  data = 64'h001400004b800000 ;
   	8'd240:  data = 64'h001430000000c0be ;
   	8'd241:  data = 64'h04100017a000ea54 ;
   	8'd242:  data = 64'h030002918818877e ;
   	8'd243:  data = 64'h03000468c81cafec ;
   	8'd244:  data = 64'h80103000680065e4 ;
   	8'd245:  data = 64'h0410301000008266 ;
   	8'd246:  data = 64'h000002806800e7c4 ;
   	8'd247:  data = 64'h001850100000c37e ;
   	8'd248:  data = 64'h041100100000877e ;
   	8'd249:  data = 64'h002080000000d2ff ;
   	8'd250:  data = 64'h0020800182800000 ;
   	8'd251:  data = 64'h002080111000d5c4 ;
   	8'd252:  data = 64'h00000011200085c4 ;
   	8'd253:  data = 64'h0410001188000001 ;
   	8'd254:  data = 64'h001110004bc00000 ;
   	8'd255:  data = 64'h0000000000000000 ;
       endcase
      end

endmodule

