
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
