
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

//
// Verilog Library For: stdcells_swift
// revision:"8.0.0"
// date : "Apr-22-1993, 17:36"
//
//
//


//      *********************************
//      *       VERILOG LIBRARY PROLOG  *
//      *********************************
//
//      April 92, created
//	03-05-93, modified most ff's to match with sunrise lib
//	03-10-93, removed all "p-arcs" for flip-flops
//	03-31-93, renamed all fj_xxx flops to xxx,
//	04-20-93, moved all flops back to fj_xxx again
//



//	*********************************
//	*	NON-SCAN FLIP-FLOPS	*
//	*  (Referenced by "gen_ver")	*
//	*********************************

// D Flip-Flop



// D Flip-Flop, with async clear



// D Flip-Flop, with async set



// D Flip-Flop, with async clear & set







//	*********************************
//	*	SCAN FLIP-FLOPS		*
//	*  (Referenced by "gen_ver")	*
//	*********************************

// scan D Flip-Flop 



// scan D Flip-Flop, with async clear



// scan D Flip-Flop, with async set



// scan D Flip-Flop, with async clear & set






//	*********************************
//	*	LATCH MODELS		*
//	*  (Referenced by "gen_ver")	*
//	*********************************





//	*********************************
//	*	STRANGE CONTROL GATES	*
//	*  (Referenced by "gen_ver")	*
//	*********************************

// merge dual-polarity control to single (for transmission gate)





//	*********************************
//	*	MISC GATES		*
//	* (Used in hand-written models) *
//	*********************************

















// ******************************************

//
//	Power Clip Cells
//

module N1Z000( O );     /* 0 Clip */
    output  O;
assign O = 1'b0;
endmodule


module N1Z001( O );     /* 1 Clip */
    output  O;
assign O = 1'b1;
endmodule


//	*********************************
//	*	END-OF-PROLOG		*
//	*********************************


// Standard Inverter
module ACINVA(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Power Clock Inverter
module ACINVB(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Clock Inverter
module ACINVC(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Clock Inverter
module ACINVD(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Tripple Power Clock Inverter
module ACINVE(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Tripple Power Clock Inverter
module ACINVF(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module ACINVG(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module ACINVH(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// 1-bit Full Adder
module ADD2(A, B, CIN, S, C);
input   A;
input   B;
input   CIN;
output  S;
output  C;
xor g0(S, A, B, CIN);
and g1(w3, A, B);
or g2(w8, A, B);
and g3(w6, CIN, w8);
or g4(C, w3, w6);
endmodule

// 3 input Full Adder
module ADD3(X1, X2, X3, CIN, S, C, COUT);
input   X1;
input   X2;
input   X3;
input   CIN;
output  S;
output  C;
output  COUT;
xor g0(S, X1, X2, X3, CIN);
not g1(w9, X3);
or g2(w7, CIN, w9);
and g3(w4, X1, X2, w7);
not g4(w12, X1);
xor g5(w13, X2, X3);
and g6(w10, CIN, w12, w13);
not g7(w19, X3);
and g8(w16, CIN, X1, w19);
or g9(C, w4, w10, w16);
or g10(w20, X1, X2);
and g11(COUT, w20, X3);
endmodule

// 4 input Full Adder
module ADD4(X1, X2, X3, X4, CIN, S, C, COUT);
input   X1;
input   X2;
input   X3;
input   X4;
input   CIN;
output  S;
output  C;
output  COUT;
xor g0(S, X1, X2, X3, X4, CIN);
and g1(w8, X1, X2);
and g2(w11, X3, X4);
or g3(w7, w8, w11);
and g4(w5, CIN, w7);
xor g5(w15, CIN, X1);
not g6(w19, X3);
not g7(w20, X4);
and g8(w14, w15, X2, w19, w20);
not g9(w23, X1);
not g10(w24, X2);
xor g11(w25, X3, X4);
and g12(w21, CIN, w23, w24, w25);
not g13(w29, CIN);
xnor g14(w32, X1, X2);
and g15(w28, w29, X3, X4, w32);
not g16(w38, X3);
not g17(w39, X4);
and g18(w35, CIN, X1, w38, w39);
or g19(C, w5, w14, w21, w28, w35);
or g20(w40, X1, X2);
or g21(w43, X3, X4);
and g22(COUT, w40, w43);
endmodule

// 2-Input NOR Gate
module PP1(X, Y, P);
input   X;
input   Y;
output  P;
nor g0(P, X, Y);
endmodule

// 2-Input NOR Gate
module PP2(X0, X1, Y2, Y3, P0, P1);
input   X0;
input   X1;
input   Y2;
input   Y3;
output  P0;
output  P1;
nor g0(P0, X0, Y3);
nor g1(P1, X1, Y2);
endmodule

// 2-Input NOR Gate
module PP3(X0, X1, X2, Y1, Y2, Y3, P0, P1, P2);
input   X0;
input   X1;
input   X2;
input   Y1;
input   Y2;
input   Y3;
output  P0;
output  P1;
output  P2;
nor g0(P0, X0, Y3);
nor g1(P1, X1, Y2);
nor g2(P2, X2, Y1);
endmodule

// 2-Input NOR Gate
module PP4(X0, X1, X2, X3, Y0, Y1, Y2, Y3, P0, P1, P2, 
        P3);
input   X0;
input   X1;
input   X2;
input   X3;
input   Y0;
input   Y1;
input   Y2;
input   Y3;
output  P0;
output  P1;
output  P2;
output  P3;
nor g0(P0, X0, Y3);
nor g1(P1, X1, Y2);
nor g2(P2, X2, Y1);
nor g3(P3, X3, Y0);
endmodule

// mux - nor
module PP21(X0, X1, Y2, Y3, S, C, PASS, P0, P1, P2, P3);
input   X0;
input   X1;
input   Y2;
input   Y3;
input   S;
input   C;
input   PASS;
output  P0;
output  P1;
output  P2;
output  P3;
nor g0(P0, X0, Y3);
nor g1(P1, X1, Y2);
and g2(P2, S, PASS);
and g3(P3, C, PASS);
endmodule

// GND or input mux
module PP23(S, C, PASS, P0, P1);
input   S;
input   C;
input   PASS;
output  P0;
output  P1;
and g0(P0, S, PASS);
and g1(P1, C, PASS);
endmodule

// mux - nor
module PP24(X, Y, S, C, PASS, P0, P1, P2);
input   X;
input   Y;
input   S;
input   C;
input   PASS;
output  P0;
output  P1;
output  P2;
nor g0(P0, X, Y);
and g1(P1, S, PASS);
and g2(P2, C, PASS);
endmodule

// mux - nor
module PP25(X0, X1, Y2, Y3, S, C, PASS, P0, P1, P2);
input   X0;
input   X1;
input   Y2;
input   Y3;
input   S;
input   C;
input   PASS;
output  P0;
output  P1;
output  P2;
nor g0(P0, X1, Y2);
nor g1(w3, X0, Y3);
not g2(w6, PASS);
and g3(w2, w3, w6);
and g4(w7, S, PASS);
or g5(P1, w2, w7);
and g6(P2, C, PASS);
endmodule

// mux - nor
module PP26(X0, X1, X2, Y1, Y2, Y3, S, C, PASS, P0, P1, 
        P2);
input   X0;
input   X1;
input   X2;
input   Y1;
input   Y2;
input   Y3;
input   S;
input   C;
input   PASS;
output  P0;
output  P1;
output  P2;
nor g0(P0, X2, Y1);
nor g1(w3, X1, Y2);
not g2(w6, PASS);
and g3(w2, w3, w6);
and g4(w7, S, PASS);
or g5(P1, w2, w7);
nor g6(w11, X0, Y3);
not g7(w14, PASS);
and g8(w10, w11, w14);
and g9(w15, C, PASS);
or g10(P2, w10, w15);
endmodule

// mux - nor
module PP52_27(X0, X1, X2, X3, Y0, Y1, Y2, Y3, S, C, PASS, 
        P0, P1, P2, P3);
input   X0;
input   X1;
input   X2;
input   X3;
input   Y0;
input   Y1;
input   Y2;
input   Y3;
input   S;
input   C;
input   PASS;
output  P0;
output  P1;
output  P2;
output  P3;
nor g0(P0, X3, Y0);
nor g1(w3, X2, Y1);
not g2(w6, PASS);
and g3(w2, w3, w6);
and g4(w7, S, PASS);
or g5(P1, w2, w7);
nor g6(w11, X1, Y2);
not g7(w14, PASS);
and g8(w10, w11, w14);
and g9(w15, C, PASS);
or g10(P2, w10, w15);
nor g11(P3, X0, Y3, PASS);
endmodule

// Standard Inverter
module MACINVA(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Power Clock Inverter
module MACINVB(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Clock Inverter
module MACINVC(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Clock Inverter
module MACINVD(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Tripple Power Clock Inverter
module MACINVE(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Tripple Power Clock Inverter
module MACINVF(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module MACINVG(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module MACINVH(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// ALL CLOCK BUFFERS
//module ACALLBUF(SS_CLK, RFR_CLK, RFR_LATE, RCC_CLK, SBUS_CLK, 
module ACALLBUF(SS_CLK, RFR_CLK, RFR_LATE, RCC_CLK,
        SBOCLK, PCI_CLK, GCLK, SS_CLK_T, SS_CLK_L, SS_CLK_B, 
        SS_CLK_R, RFR_CLK_D, RFR_LATE_D, GCLK_I, REF_CLK_I, 
        //SBOCLK_S, SBUS_CLK_I, PCI_CLK_I, RCC_CLK_M);
	SBOCLK_S, PCI_CLK_I, RCC_CLK_M);
input   SS_CLK;
input   RFR_CLK;
input   RFR_LATE;
input   RCC_CLK;
//input   SBUS_CLK;
input   SBOCLK;
input	PCI_CLK;
input   GCLK;
output  SS_CLK_T;
output  SS_CLK_L;
output  SS_CLK_B;
output  SS_CLK_R;
output  RFR_CLK_D;
output  RFR_LATE_D;
output  GCLK_I;
output  REF_CLK_I;
output  SBOCLK_S;
//output  SBUS_CLK_I;
output	PCI_CLK_I;
output  RCC_CLK_M;
buf g0(SS_CLK_T, SS_CLK);
buf g1(SS_CLK_L, SS_CLK);
buf g2(SS_CLK_B, SS_CLK);
buf g3(SS_CLK_R, SS_CLK);
buf g4(RFR_CLK_D, RFR_CLK);
buf g5(RFR_LATE_D, RFR_LATE);
buf g6(GCLK_I, GCLK);
buf g7(REF_CLK_I, SS_CLK);
buf g8(SBOCLK_S, SBOCLK);
//buf g9(SBUS_CLK_I, SBUS_CLK);
buf g10(PCI_CLK_I, PCI_CLK);
buf g11(RCC_CLK_M, RCC_CLK);
endmodule

// 8 SS_CLK Buffers
module ACSSBUF(SS_CLK_UNBUF, SS_CLK_BUF1, SS_CLK_BUF2, SS_CLK_BUF3, 
        SS_CLK_BUF4, SS_CLK_BUF5, SS_CLK_BUF6, SS_CLK_BUF7, 
        SS_CLK_BUF8);
input   SS_CLK_UNBUF;
output  SS_CLK_BUF1;
output  SS_CLK_BUF2;
output  SS_CLK_BUF3;
output  SS_CLK_BUF4;
output  SS_CLK_BUF5;
output  SS_CLK_BUF6;
output  SS_CLK_BUF7;
output  SS_CLK_BUF8;
buf g0(SS_CLK_BUF1, SS_CLK_UNBUF);
buf g1(SS_CLK_BUF2, SS_CLK_UNBUF);
buf g2(SS_CLK_BUF3, SS_CLK_UNBUF);
buf g3(SS_CLK_BUF4, SS_CLK_UNBUF);
buf g4(SS_CLK_BUF5, SS_CLK_UNBUF);
buf g5(SS_CLK_BUF6, SS_CLK_UNBUF);
buf g6(SS_CLK_BUF7, SS_CLK_UNBUF);
buf g7(SS_CLK_BUF8, SS_CLK_UNBUF);
endmodule

// 8 SS_CLK Buffers and RFR_CLK and RFR_LATE buffers
module ACSS2MEM(SS_CLK_UNBUF, RFR_CLK_UNBUF, RFR_LATE_UNBUF, 
        SS_CLK_BUF1, SS_CLK_BUF2, SS_CLK_BUF3, SS_CLK_BUF4, 
        SS_CLK_BUF5, SS_CLK_BUF6, SS_CLK_BUF7, SS_CLK_BUF8, 
        RFR_CLK, RFR_LATE);
input   SS_CLK_UNBUF;
input   RFR_CLK_UNBUF;
input   RFR_LATE_UNBUF;
output  SS_CLK_BUF1;
output  SS_CLK_BUF2;
output  SS_CLK_BUF3;
output  SS_CLK_BUF4;
output  SS_CLK_BUF5;
output  SS_CLK_BUF6;
output  SS_CLK_BUF7;
output  SS_CLK_BUF8;
output  RFR_CLK;
output  RFR_LATE;
buf g0(SS_CLK_BUF1, SS_CLK_UNBUF);
buf g1(SS_CLK_BUF2, SS_CLK_UNBUF);
buf g2(SS_CLK_BUF3, SS_CLK_UNBUF);
buf g3(SS_CLK_BUF4, SS_CLK_UNBUF);
buf g4(SS_CLK_BUF5, SS_CLK_UNBUF);
buf g5(SS_CLK_BUF6, SS_CLK_UNBUF);
buf g6(SS_CLK_BUF7, SS_CLK_UNBUF);
buf g7(SS_CLK_BUF8, SS_CLK_UNBUF);
buf g8(RFR_CLK, RFR_CLK_UNBUF);
buf g9(RFR_LATE, RFR_LATE_UNBUF);
endmodule

// 8 SS_CLK Buffers and RCC_CLK buffer
module ACSS2MISC(SS_CLK_UNBUF, RCC_CLK_UNBUF, SS_CLK_BUF1, 
        SS_CLK_BUF2, SS_CLK_BUF3, SS_CLK_BUF4, SS_CLK_BUF5, 
        SS_CLK_BUF6, SS_CLK_BUF7, SS_CLK_BUF8, RCC_CLK);
input   SS_CLK_UNBUF;
input   RCC_CLK_UNBUF;
output  SS_CLK_BUF1;
output  SS_CLK_BUF2;
output  SS_CLK_BUF3;
output  SS_CLK_BUF4;
output  SS_CLK_BUF5;
output  SS_CLK_BUF6;
output  SS_CLK_BUF7;
output  SS_CLK_BUF8;
output  RCC_CLK;
buf g0(SS_CLK_BUF1, SS_CLK_UNBUF);
buf g1(SS_CLK_BUF2, SS_CLK_UNBUF);
buf g2(SS_CLK_BUF3, SS_CLK_UNBUF);
buf g3(SS_CLK_BUF4, SS_CLK_UNBUF);
buf g4(SS_CLK_BUF5, SS_CLK_UNBUF);
buf g5(SS_CLK_BUF6, SS_CLK_UNBUF);
buf g6(SS_CLK_BUF7, SS_CLK_UNBUF);
buf g7(SS_CLK_BUF8, SS_CLK_UNBUF);
buf g8(RCC_CLK, RCC_CLK_UNBUF);
endmodule

// 8 SS_CLK Buffers and SBO_CLK buffer
module ACSS2SBC(SS_CLK_UNBUF, SBO_CLK_UNBUF, SS_CLK_BUF1, 
        SS_CLK_BUF2, SS_CLK_BUF3, SS_CLK_BUF4, SS_CLK_BUF5, 
        SS_CLK_BUF6, SS_CLK_BUF7, SS_CLK_BUF8, SBO_CLK);
input   SS_CLK_UNBUF;
input   SBO_CLK_UNBUF;
output  SS_CLK_BUF1;
output  SS_CLK_BUF2;
output  SS_CLK_BUF3;
output  SS_CLK_BUF4;
output  SS_CLK_BUF5;
output  SS_CLK_BUF6;
output  SS_CLK_BUF7;
output  SS_CLK_BUF8;
output  SBO_CLK;
buf g0(SS_CLK_BUF1, SS_CLK_UNBUF);
buf g1(SS_CLK_BUF2, SS_CLK_UNBUF);
buf g2(SS_CLK_BUF3, SS_CLK_UNBUF);
buf g3(SS_CLK_BUF4, SS_CLK_UNBUF);
buf g4(SS_CLK_BUF5, SS_CLK_UNBUF);
buf g5(SS_CLK_BUF6, SS_CLK_UNBUF);
buf g6(SS_CLK_BUF7, SS_CLK_UNBUF);
buf g7(SS_CLK_BUF8, SS_CLK_UNBUF);
buf g8(SBO_CLK, SBO_CLK_UNBUF);
endmodule

// end of stdcells_swiftsp library 

// 1-bit Half Adder
module JHAD1A(A, B, S, CO);
input   A;
input   B;
output  S;
output  CO;
xor g0(S, A, B);
and g1(CO, A, B);
endmodule

// Hi-speed 1-bit Full Adder
module JFAD1B(A, B, CI, S, CO);
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

// 1-bit Full Adder
module JFAD1C(A, B, CI, S, CO);
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

// Hi-speed 1-bit Full Adder
module JFAD1D(A, B, CI, S, CO);
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

// 2-bit Full Adder
module JFAD2A(A1, A2, B1, B2, CI, S1, S2, CO);
input   A1;
input   A2;
input   B1;
input   B2;
input   CI;
output  S1;
output  S2;
output  CO;
xor g0(S1, A1, B1, CI);
or g1(w6, A1, B1);
and g2(w4, CI, w6);
and g3(w9, A1, B1);
or g4(w3, w4, w9);
xor g5(S2, w3, A2, B2);
and g6(w14, A2, B2);
or g7(w18, A2, B2);
and g8(w22, A1, B1);
and g9(w25, A1, CI);
and g10(w28, B1, CI);
or g11(w21, w22, w25, w28);
and g12(w17, w18, w21);
or g13(CO, w14, w17);
endmodule

// 2-bit Full Adder
module JFAD2C(A1, A2, B1, B2, CI, S1, S2, CO);
input   A1;
input   A2;
input   B1;
input   B2;
input   CI;
output  S1;
output  S2;
output  CO;
xor g0(S1, A1, B1, CI);
or g1(w6, A1, B1);
and g2(w4, CI, w6);
and g3(w9, A1, B1);
or g4(w3, w4, w9);
xor g5(S2, w3, A2, B2);
and g6(w16, A1, B1);
and g7(w19, A2, B2);
or g8(w15, w16, w19);
or g9(w22, A2, B2);
and g10(w14, w15, w22);
or g11(w27, A1, B1);
or g12(w30, A2, B2);
and g13(w25, CI, w27, w30);
or g14(CO, w14, w25);
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

// Quadruple Power Buffer
module JBUFE(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Delay Buffer
module JBUFDA(A, O);
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

// Quadruple Power Inverter
module JINVE(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// 2-1 AOI
module JD21A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
and g0(w0, A1, A2);
nor g1(O, w0, B);
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

// 2-1-1 AOI
module JD211A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
nor g1(O, w0, B1, B2);
endmodule

// 2&1-1 AOI
module JD121A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
or g0(w1, A1, A2);
and g1(w0, w1, B);
nor g2(O, w0, C);
endmodule

// 3-1 AOI
module JD31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
and g0(w0, A1, A2, A3);
nor g1(O, w0, B);
endmodule

// 2-3 AOI
module JD23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2, B3);
nor g2(O, w0, w3);
endmodule

// 2-2-1 AOI
module JD122A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
nor g2(O, w0, w3, C);
endmodule

// 2-1-1-1 AOI
module JD2111A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
nor g1(O, w0, B1, B2, B3);
endmodule

// 3-3 AOI
module JD33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
nor g2(O, w0, w4);
endmodule

// Power 3-3 AOI
module JD33B(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
nor g2(O, w0, w4);
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

// Power 4-4 AOI
module JD44B(A1, A2, A3, A4, B1, B2, B3, B4, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   B1;
input   B2;
input   B3;
input   B4;
output  O;
and g0(w0, A1, A2, A3, A4);
and g1(w5, B1, B2, B3, B4);
nor g2(O, w0, w5);
endmodule

// Power 2-2-2-2 AOI
module JD2X4B(A1, A2, B1, B2, C1, C2, D1, D2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
nor g4(O, w0, w3, w6, w9);
endmodule

// Power 4-2-3-2 AOI
module JD4232A(A1, A2, A3, A4, B1, B2, C1, C2, C3, D1, D2, 
        O);
input   A1;
input   A2;
input   A3;
input   A4;
input   B1;
input   B2;
input   C1;
input   C2;
input   C3;
input   D1;
input   D2;
output  O;
and g0(w0, A1, A2, A3, A4);
and g1(w5, B1, B2);
and g2(w8, C1, C2, C3);
and g3(w12, D1, D2);
nor g4(O, w0, w5, w8, w12);
endmodule

// Power 4-4-4 AOI
module JD444A(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, 
        C4, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   B1;
input   B2;
input   B3;
input   B4;
input   C1;
input   C2;
input   C3;
input   C4;
output  O;
and g0(w0, A1, A2, A3, A4);
and g1(w5, B1, B2, B3, B4);
and g2(w10, C1, C2, C3, C4);
nor g3(O, w0, w5, w10);
endmodule

// Power 3-3-3-3 AOI
module JD3X4A(A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, 
        D3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
input   C1;
input   C2;
input   C3;
input   D1;
input   D2;
input   D3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
and g2(w8, C1, C2, C3);
and g3(w12, D1, D2, D3);
nor g4(O, w0, w4, w8, w12);
endmodule

// Power 2-2-2-2-2-2 AOI
module JD2X6A(A1, A2, B1, B2, C1, C2, D1, D2, E1, E2, F1, 
        F2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
input   E1;
input   E2;
input   F1;
input   F2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
and g4(w12, E1, E2);
and g5(w15, F1, F2);
nor g6(O, w0, w3, w6, w9, w12, w15);
endmodule

// Power 4-4-4-4 AOI
module JD4X4A(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, 
        C4, D1, D2, D3, D4, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   B1;
input   B2;
input   B3;
input   B4;
input   C1;
input   C2;
input   C3;
input   C4;
input   D1;
input   D2;
input   D3;
input   D4;
output  O;
and g0(w0, A1, A2, A3, A4);
and g1(w5, B1, B2, B3, B4);
and g2(w10, C1, C2, C3, C4);
and g3(w15, D1, D2, D3, D4);
nor g4(O, w0, w5, w10, w15);
endmodule

// Power 2-2-2-2-2-2-2-2 AOI
module JD2X8A(A1, A2, B1, B2, C1, C2, D1, D2, E1, E2, F1, 
        F2, G1, G2, H1, H2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
input   E1;
input   E2;
input   F1;
input   F2;
input   G1;
input   G2;
input   H1;
input   H2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
and g4(w12, E1, E2);
and g5(w15, F1, F2);
and g6(w18, G1, G2);
and g7(w21, H1, H2);
nor g8(O, w0, w3, w6, w9, w12, w15, w18, w21);
endmodule

// 2-1 AO
module JDB21A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B);
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

// 2-1-1 AO
module JDB211A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B1, B2);
endmodule

// 2&1-1 AO
module JDB121A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
or g0(w1, A1, A2);
and g1(w0, w1, B);
or g2(O, w0, C);
endmodule

// 3-1 AO
module JDB31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
and g0(w0, A1, A2, A3);
or g1(O, w0, B);
endmodule

// 2-3 AO
module JDB23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2, B3);
or g2(O, w0, w3);
endmodule

// 2-2-1 AO
module JDB122A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
or g2(O, w0, w3, C);
endmodule

// 2-1-1-1 AO
module JDB21X3A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B1, B2, B3);
endmodule

// 3-3 AO
module JDB33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
or g2(O, w0, w4);
endmodule

// 2-2-2 AO
module JDB222A(A1, A2, B1, B2, C1, C2, O);
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
or g3(O, w0, w3, w6);
endmodule

// 2-2-2 AO
module JDB222B(A1, A2, B1, B2, C1, C2, O);
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
or g3(O, w0, w3, w6);
endmodule

// 2-2-2-2 AO
module JDB2X4B(A1, A2, B1, B2, C1, C2, D1, D2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
or g4(O, w0, w3, w6, w9);
endmodule

// 2-1 AO with 1 inverted-input
module ADBI21C(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
not g0(w2, A2);
and g1(w0, A1, w2);
or g2(O, w0, B);
endmodule

// 2-1 AO with 1 inverted-input
module ADBI21D(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
not g0(w2, A2);
and g1(w0, A1, w2);
or g2(O, w0, B);
endmodule

// 2-2-1 AO with 1-inverting input
module ADBI122C(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
not g0(w2, A2);
and g1(w0, A1, w2);
and g2(w3, B1, B2);
or g3(O, w0, w3, C);
endmodule

// 2-2-1 AO with 1-inverting input
module ADBI122D(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
not g0(w2, A2);
and g1(w0, A1, w2);
and g2(w3, B1, B2);
or g3(O, w0, w3, C);
endmodule

// 2-1 AO
module ADB21D(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B);
endmodule

// 2-2-1 AO
module ADB122D(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
or g2(O, w0, w3, C);
endmodule

// 2-2 AO
module ADB22D(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
or g2(O, w0, w3);
endmodule

// 2-1-1 AO
module ADB211D(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B1, B2);
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

// set-reset flipflop
module JSRFFA(D, CL, PR, CK, Q, XQ);
input   D;
input   CL;          // clear, active low
input   PR;          // preset, active low
input   CK;
output  Q;
output  XQ;
not g0(w2, CL);
not g1(w3, PR);
fj_dff_ecs    g2(IQ, D, CK, w2, w3);
buf g3(Q, IQ);
not g4(XQ, IQ);
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

// 2-2 OAI
module JG22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
nand g2(O, w0, w3);
endmodule

// 1-1-2 OAI
module JG112A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
nand g1(O, w0, B1, B2);
endmodule

//  2-1-1 OAI
module JG211A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
and g0(w1, A1, A2);
or g1(w0, w1, B);
nand g2(O, w0, C);
endmodule

// 3-1 OAI
module JG31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
or g0(w0, A1, A2, A3);
nand g1(O, w0, B);
endmodule

// 2-3 OAI
module JG23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2, B3);
nand g2(O, w0, w3);
endmodule

// 2-2-1 OAI
module JG221A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
nand g2(O, w0, w3, C);
endmodule

// 2-1-1-1 OAI
module JG2111A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
nand g1(O, w0, B1, B2, B3);
endmodule

// 3-3 OAI
module JG33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2, A3);
or g1(w4, B1, B2, B3);
nand g2(O, w0, w4);
endmodule

// 2-2-2 OAI
module JG222A(A1, A2, B1, B2, C1, C2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
or g2(w6, C1, C2);
nand g3(O, w0, w3, w6);
endmodule

// 2-2-2-2 OAI
module AG2222A(A1, A2, B1, B2, C1, C2, D1, D2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
or g2(w6, C1, C2);
or g3(w9, D1, D2);
nand g4(O, w0, w3, w6, w9);
endmodule

// 1-2 OA
module JGB12A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
or g0(w0, A1, A2);
and g1(O, w0, B);
endmodule

// 2-2 OA
module JGB22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
and g2(O, w0, w3);
endmodule

// 1-1-2 OA
module JGB112A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
and g1(O, w0, B1, B2);
endmodule

//  2-1-1 OA
module JGB211A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
and g0(w1, A1, A2);
or g1(w0, w1, B);
and g2(O, w0, C);
endmodule

// 3-1 OA
module JGB31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
or g0(w0, A1, A2, A3);
and g1(O, w0, B);
endmodule

// 2-3 OA
module JGB23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2, B3);
and g2(O, w0, w3);
endmodule

// 2-2-1 OA
module JGB221A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
and g2(O, w0, w3, C);
endmodule

// 2-1-1-1 OA
module JGB2111A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
and g1(O, w0, B1, B2, B3);
endmodule

// 3-3 OA
module JGB33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2, A3);
or g1(w4, B1, B2, B3);
and g2(O, w0, w4);
endmodule

// 2-2-2 OA
module JGB222A(A1, A2, B1, B2, C1, C2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
or g2(w6, C1, C2);
and g3(O, w0, w3, w6);
endmodule

// 1-2 OA
module AGB12D(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
or g0(w0, A1, A2);
and g1(O, w0, B);
endmodule

// 2-2 OA
module AGB22D(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
and g2(O, w0, w3);
endmodule

// Power gate Clock  AND Buffer
module JCAND2B(A1, A2, O);
input   A1;
input   A2;
output  O;
and g0(O, A1, A2);
endmodule

// True Clock Buffer
module JCBUFB(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Power Clock Buffer
module JCBUFC(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Power Clock Multiplexer
module JCMUX2B(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
nor g2(O, w0, w3);
endmodule

// Clock Inverter
module JCINVA(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Power Clock Inverter
module JCINVB(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Clock Inverter
module JCINVC(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Tripple Power Clock Inverter
module JCINVD(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module JCINVE(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Power Gated Clock NAND Buffer
module JCNAN2B(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Double Power Gated Clock NAND Buffer
module JCNAN2C(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Power Gated Clock OR Buffer
module JCOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
or g0(O, A1, A2);
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

// Power 6-Input AND Gate
module JAND6B(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
and g0(O, A1, A2, A3, A4, A5, A6);
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

// Power 4-Input NAND Gate
module JNAND4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nand g0(O, A1, A2, A3, A4);
endmodule

// Double Power 2-Input NAND Gate
module JNAND2C(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Double Power 3-Input NAND Gate
module JNAND3C(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nand g0(O, A1, A2, A3);
endmodule

// Double Power 4-Input NAND Gate
module JNAND4C(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nand g0(O, A1, A2, A3, A4);
endmodule

// Power 5-Input NAND Gate
module ANAND5C(A1, A2, A3, A4, A5, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
output  O;
nand g0(O, A1, A2, A3, A4, A5);
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

// 2-Input NAND Gate with 1-inverting input
module ANANDI2C(A1, A2, O);
input   A1;
input   A2;
output  O;
not g0(w1, A2);
nand g1(O, A1, w1);
endmodule

// 2-Input NAND Gate with 1-inverting input
module ANANDI2D(A1, A2, O);
input   A1;
input   A2;
output  O;
not g0(w1, A2);
nand g1(O, A1, w1);
endmodule

// 2-Input NAND Gate
module ANAND2D(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
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

// Double Power 6-Input OR Gate
module JOR6B(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
or g0(O, A1, A2, A3, A4, A5, A6);
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

// Power 3-Input NOR Gate
module JNOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// 4-Input NOR Gate
module JNOR4A(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
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

// Tripple Power 2-Input NOR Gate
module JNOR2D(A1, A2, O);
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

// Tripple Power 3-Input NOR Gate
module JNOR3D(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Double Power 4-Input NOR Gate
module JNOR4C(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Tripple Power 4-Input NOR Gate
module JNOR4D(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Quadruple Power 4-Input NOR Gate
module JNOR4E(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Double Power 6-Input NOR Gate
module JNOR6C(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
nor g0(O, A1, A2, A3, A4, A5, A6);
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

// 2-Input NOR Gate with 1 inverting-input
module ANORI2C(A1, A2, O);
input   A1;
input   A2;
output  O;
not g0(w1, A2);
nor g1(O, A1, w1);
endmodule

// 2-Input NOR Gate with 1 inverting-input
module ANORI2D(A1, A2, O);
input   A1;
input   A2;
output  O;
not g0(w1, A2);
nor g1(O, A1, w1);
endmodule

// Double Power 6-Input NOR Gate
module ANOR6D(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
nor g0(O, A1, A2, A3, A4, A5, A6);
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

// 3:1 Selector
module AMUX3A(I0, I1, I2, S0, S1, O);
input   I0;
input   I1;
input   I2;
input   S0;
input   S1;
output  O;
not g0(w2, S0);
not g1(w3, S1);
and g2(w0, I0, w2, w3);
not g3(w7, S1);
and g4(w4, I1, S0, w7);
and g5(w8, I2, S1);
or g6(O, w0, w4, w8);
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

// Power 3-input Exclusive OR
module JXOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xor g0(O, A1, A2, A3);
endmodule

// 2-input Exclusive NOR
module JXNOR2A(A1, A2, O);
input   A1;
input   A2;
output  O;
xnor g0(O, A1, A2);
endmodule

// Power 2-input Exclusive NOR
module JXNOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
xnor g0(O, A1, A2);
endmodule

// 3-input Exclusive NOR
module JXNOR3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xnor g0(O, A1, A2, A3);
endmodule

// Power 3-input Exclusive NOR
module JXNOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xnor g0(O, A1, A2, A3);
endmodule

// 1-bit D Flip-Flop  with reset and hold
module ADFFRHA(D, CK, R, H, Q, XQ);
input   D;
input   CK;
input   R;           // active low
input   H;
output  Q;
output  XQ;
not g0(w3, H);
and g1(w1, R, w3, D);
and g2(w5, R, H, IQ);
or g3(w0, w1, w5);
fj_dff_e    g4(IQ, w0, CK);
buf g5(Q, IQ);
not g6(XQ, IQ);
endmodule

// 1-bit D Flip-Flop with reset
module ADFFRA(D, CK, R, Q, XQ);
input   D;
input   CK;
input   R;           // active low
output  Q;
output  XQ;
and g0(w0, R, D);
fj_dff_e    g1(IQ, w0, CK);
buf g2(Q, IQ);
not g3(XQ, IQ);
endmodule

// 1-bit D Flip-Flop  with scan 
module ASFFA(D, CK, SM, SI, Q, XQ, SO);
input   D;
input   CK;
input   SM;
input   SI;
output  Q;
output  XQ;
output  SO;
fj_dff_e_muxscan    g0(IQ, D, SI, SM, CK);
buf g1(Q, IQ);
not g2(XQ, IQ);
buf g3(SO, IQ);
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

// 1-bit D Flip-Flop  with scan and reset and hold
module ASFFRHA(D, CK, R, H, SM, SI, Q, XQ, SO);
input   D;
input   CK;
input   R;           // active low
input   H;
input   SM;
input   SI;
output  Q;
output  XQ;
output  SO;
not g0(w4, H);
and g1(w3, w4, D);
and g2(w6, H, IQ);
or g3(w2, w3, w6);
and g4(w0, R, w2);
fj_dff_e_muxscan    g5(IQ, w0, SI, SM, CK);
buf g6(Q, IQ);
not g7(XQ, IQ);
buf g8(SO, IQ);
endmodule

// 1-bit D Flip-Flop  with scan and reset
module ASFFRA(D, CK, R, SM, SI, Q, XQ, SO);
input   D;
input   CK;
input   R;           // active low
input   SM;
input   SI;
output  Q;
output  XQ;
output  SO;
and g0(w0, R, D);
fj_dff_e_muxscan    g1(IQ, w0, SI, SM, CK);
buf g2(Q, IQ);
not g3(XQ, IQ);
buf g4(SO, IQ);
endmodule

// 4-bit 2-input mux Flip-Flop  with scan and hold
module AMUXFFA(DA0, DA1, DA2, DA3, DB0, DB1, DB2, DB3, CK, 
        HLD, SM, SI, S, DO0, DO1, DO2, DO3, SO);
input   DA0;
input   DA1;
input   DA2;
input   DA3;
input   DB0;
input   DB1;
input   DB2;
input   DB3;
input   CK;
input   HLD;         // hold data, active high
input   SM;          // scan mode, active high
input   SI;          // scan data in
input   S;           // select, 0-DAx, 1-DBx
output  DO0;
output  DO1;
output  DO2;
output  DO3;
output  SO;
and g0(w1, HLD, IQ3);
not g1(w5, HLD);
and g2(w7, S, DB3);
not g3(w11, S);
and g4(w10, w11, DA3);
or g5(w6, w7, w10);
and g6(w4, w5, w6);
or g7(w0, w1, w4);
fj_dff_e_muxscan    g8(IQ3, w0, IQ2, SM, CK);
and g9(w17, HLD, IQ2);
not g10(w21, HLD);
and g11(w23, S, DB2);
not g12(w27, S);
and g13(w26, w27, DA2);
or g14(w22, w23, w26);
and g15(w20, w21, w22);
or g16(w16, w17, w20);
fj_dff_e_muxscan    g17(IQ2, w16, IQ1, SM, CK);
and g18(w33, HLD, IQ1);
not g19(w37, HLD);
and g20(w39, S, DB1);
not g21(w43, S);
and g22(w42, w43, DA1);
or g23(w38, w39, w42);
and g24(w36, w37, w38);
or g25(w32, w33, w36);
fj_dff_e_muxscan    g26(IQ1, w32, IQ0, SM, CK);
and g27(w49, HLD, IQ0);
not g28(w53, HLD);
and g29(w55, S, DB0);
not g30(w59, S);
and g31(w58, w59, DA0);
or g32(w54, w55, w58);
and g33(w52, w53, w54);
or g34(w48, w49, w52);
fj_dff_e_muxscan    g35(IQ0, w48, SI, SM, CK);
buf g36(DO0, IQ0);
buf g37(DO1, IQ1);
buf g38(DO2, IQ2);
buf g39(DO3, IQ3);
buf g40(SO, IQ3);
endmodule

// 8-input Comparator
module ACOMP8A(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, 
        B3, B4, B5, B6, B7, O);
input   A0;
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
input   A7;
input   B0;
input   B1;
input   B2;
input   B3;
input   B4;
input   B5;
input   B6;
input   B7;
output  O;
xor g0(w0, A0, B0);
xor g1(w3, A1, B1);
xor g2(w6, A2, B2);
xor g3(w9, A3, B3);
xor g4(w12, A4, B4);
xor g5(w15, A5, B5);
xor g6(w18, A6, B6);
xor g7(w21, A7, B7);
nor g8(O, w0, w3, w6, w9, w12, w15, w18, w21);
endmodule

// 3-input Comparator
module ACOMP3A(A0, A1, A2, B0, B1, B2, O);
input   A0;
input   A1;
input   A2;
input   B0;
input   B1;
input   B2;
output  O;
xor g0(w0, A0, B0);
xor g1(w3, A1, B1);
xor g2(w6, A2, B2);
nor g3(O, w0, w3, w6);
endmodule

// 4-input Comparator
module ACOMP4A(A0, A1, A2, A3, B0, B1, B2, B3, O);
input   A0;
input   A1;
input   A2;
input   A3;
input   B0;
input   B1;
input   B2;
input   B3;
output  O;
xor g0(w0, A0, B0);
xor g1(w3, A1, B1);
xor g2(w6, A2, B2);
xor g3(w9, A3, B3);
nor g4(O, w0, w3, w6, w9);
endmodule

// 5-input Comparator
module ACOMP5A(A0, A1, A2, A3, A4, B0, B1, B2, B3, B4, O);
input   A0;
input   A1;
input   A2;
input   A3;
input   A4;
input   B0;
input   B1;
input   B2;
input   B3;
input   B4;
output  O;
xor g0(w0, A0, B0);
xor g1(w3, A1, B1);
xor g2(w6, A2, B2);
xor g3(w9, A3, B3);
xor g4(w12, A4, B4);
nor g5(O, w0, w3, w6, w9, w12);
endmodule

// Tri-state buffer
module ATSBUFD(I1, I2, I3, I4, I5, I6, I7, I8, CK, SI, SM, 
        OE_, RESET, O1, O2, O3, O4, O5, O6, O7, O8, 
        SO);
input   I1;
input   I2;
input   I3;
input   I4;
input   I5;
input   I6;
input   I7;
input   I8;
input   CK;
input   SI;
input   SM;
input   OE_;
input   RESET;
output  O1;
output  O2;
output  O3;
output  O4;
output  O5;
output  O6;
output  O7;
output  O8;
output  SO;
not g0(w5, SM);
not g1(w6, RESET);
and g2(w4, w5, w6);
fj_dff_es_muxscan    g3(IQ, OE_, SI, SM, CK, w4);
or g4(w8, IQ, SM);
bufif0 g5(O1, I1, w8);
or g6(w12, IQ, SM);
bufif0 g7(O2, I2, w12);
or g8(w16, IQ, SM);
bufif0 g9(O3, I3, w16);
or g10(w20, IQ, SM);
bufif0 g11(O4, I4, w20);
or g12(w24, IQ, SM);
bufif0 g13(O5, I5, w24);
or g14(w28, IQ, SM);
bufif0 g15(O6, I6, w28);
or g16(w32, IQ, SM);
bufif0 g17(O7, I7, w32);
or g18(w36, IQ, SM);
bufif0 g19(O8, I8, w36);
buf g20(SO, IQ);
endmodule

// Power Clock Buffer
module JCBUFB1(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Power Clock Buffer
module JCBUFC1(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Power Clock Multiplexer
module JCMUX2B1(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
nor g2(O, w0, w3);
endmodule

// Power Clock Inverter
module JCINVA1(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Clock Inverter
module JCINVB1(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module JCINVC1(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Tripple Power Clock Inverter
module JCINVD1(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Clock Inverter
module JCINVE1(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Gated Clock NAND Buffer
module JCNAN2B1(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Double Power Gated Clock NAND Buffer
module JCNAN2C1(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Power Gated Clock OR Buffer
module JCOR2B1(A1, A2, O);
input   A1;
input   A2;
output  O;
or g0(O, A1, A2);
endmodule

// 2-Input NOR Gate
module JNOR2A1(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Power 2-Input NOR Gate
module JNOR2B1(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// 3-Input NOR Gate
module JNOR3A1(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Power 3-Input NOR Gate
module JNOR3B1(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// 4-Input NOR Gate
module JNOR4A1(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Power 4-Input NOR Gate
module JNOR4B1(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// JTAG Output Enable Control Cell
module JJOED(XSM_, EN, SI, CK, UP, ACK, XBCK, MD1, ENC_,
        ENO, SO);
input   XSM_;        // scan-mode
input   EN;          // bidir i/o jtag_ff: 1-sel_OT_data, 0-sel_PAD_data
input   SI;          // scan-data in
input   CK;          // clk for normal operation, hold high
input   UP;          // xfer reg. data to latch
input   ACK;         // scan data-in strobe, active high
input   XBCK;        // enb. slave latch
input   MD1;         // 0-normal operation, 1-use scanned state
output  ENC_;        // tri-state enable, 1-tristate, 0-bistate
output  ENO;         // bidir i/o jtag_ff: 1-sel_OT_data, 0-sel_PAD_data
output  SO;          // scan-data out
// Verilog body for JJOED
 
wire    bck ;
wire    xack ;
wire    clk ;
wire    xclk ;
wire    upd ;
wire    xupd ;
wire    si_ ;
wire    en_ ;
wire    jtag_latch1_out ;
wire    jtag_latch2_out ;
wire    jtag_latch3_out ;
wire    x ;
wire    y ;
 
  not           g1(bck, XBCK) ;
  not           g2(xack, ACK) ;
  not           g3(xclk, CK) ;
  not           g4(clk, xclk) ;
  not           g5(xupd, UP) ;
  not           g6(upd, xupd) ;
  not           g7(si_, SI) ;
  not           g8(en_, EN) ;
  UDP_LATCH1    g9(jtag_latch1_out, xclk, ACK, en_, si_) ;
  UDP_LATCH2    g10(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  not           g11(SO, jtag_latch2_out) ;
  UDP_LATCH     g12(jtag_latch3_out, xupd, jtag_latch2_out) ;
  UDP_MUX21     g13(x, en_, jtag_latch3_out, MD1) ;
  buf           g14(ENO, x) ;
  nand          g15(y, XSM_, x) ;
  buf           g16(ENC_, y) ;
endmodule


// AB Clock Generator
module ACABGEN(CLK, ENB, CLK_A, CLK_B);
input   CLK;
input   ENB;         // typically SM, assert while CLK=1!
output  CLK_A;       // A strobe
output  CLK_B;       // B strobe
wire pulse, dly_pulse;

not	g1(enb_, ENB);
nor    	g2(pulse, enb_,CLK);
buf  #5 g3(dly_pulse, pulse);

nand    g5(clka_, pulse,dly_pulse);
not     g6(CLK_A, clka_);

nor     g8(clkb_, pulse,dly_pulse);
not     g9(CLK_B, clkb_);

endmodule

// JTAG Bidirectional Cell
module JBS11SN(ENC_, OT, ENO, SI, CK, UP, ACK, XBCK, MD1, 
        MD2, SO, IT, X);
input   ENC_;        // tri-state enable, 0-tristate, 1-bistate
input   OT;          // outgoing data from core
input   ENO;         // jtag_ff: 1-sel_OT_data, 0-sel_PAD_data
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD1;         // 0-sel_pad_data, 1-sel_jtag_ff
input   MD2;         // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // incomming data to core
inout   X;
// Verilog body for JBS11SN

wire	MD1_ ;
wire	MD2_ ;
wire	OT_ ;
wire	ENO_ ;
wire	tmg1m1_out ;
wire	jtag_q ;
wire	tmg2m1_b ;
wire	ENC ;
wire	tmg1m1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD1_, MD1) ;
  not		g2(MD2_, MD2) ;
  not		g3(OT_,  OT)  ;
  not		g4(ENO_, ENO) ;
  UDP_MUX21	g5(tmg1m1_out, jtag_q, OT_, MD1_) ;
  not		g6(ENC, ENC_) ;
  not		g7(tmg1m1_out_, tmg1m1_out) ;
  and		g8(bscn_xd0, ENC, tmg1m1_out) ;
  or		g9(bscn_d0, ENC_, tmg1m1_out_) ;
  or		g10(bscn_xd1, ENC_, tmg1m1_out) ;
  and		g11(bscn_d1, ENC, tmg1m1_out_) ;
  not		g12(tmg2m1_b, X) ;
  UDP_MUX21	g13(IT, jtag_q, tmg2m1_b, MD2_) ;
  not		g14(bck, XBCK) ;
  not		g15(xack, ACK) ;
  not		g16(xclk, CK) ;
  not		g17(clk, xclk) ;
  not		g18(xupd, UP) ;
  not		g19(upd, xupd) ;
  and		g20(jtag_x1, OT_, ENO) ;
  and		g21(jtag_x2, ENO_, tmg2m1_b) ;
  nor		g22(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g23(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g24(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g25(SO, jtag_latch2_out) ;
  UDP_LATCH    	g26(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g27(jtag_q, jtag_latch3_out) ;
  not		g28(out_buf_a, bscn_xd0) ;
  not		g29(out_buf_b, bscn_xd1) ;
  xor		g30(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g31(X, out_buf_a, out_buf_en) ;
endmodule

// JTAG Bidirectional Cell
module JBS13SN(ENC_, OT, ENO, SI, CK, UP, ACK, XBCK, MD1, 
        MD2, SO, IT, X);
input   ENC_;        // tri-state enable, 0-tristate, 1-bistate
input   OT;          // outgoing data from core
input   ENO;         // jtag_ff: 1-sel_OT_data, 0-sel_PAD_data
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD1;         // 0-sel_pad_data, 1-sel_jtag_ff
input   MD2;         // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // incomming data to core
inout   X;
// Verilog body for JBS13SN

wire	MD1_ ;
wire	MD2_ ;
wire	OT_ ;
wire	ENO_ ;
wire	tmg1m1_out ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	tmg1m1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD1_, MD1) ;
  not		g2(MD2_, MD2) ;
  not		g3(OT_,  OT)  ;
  not		g4(ENO_, ENO) ;
  UDP_MUX21	g5(tmg1m1_out, jtag_q, OT_, MD1_) ;
  not		g6(ENC, ENC_) ;
  not		g7(tmg1m1_out_, tmg1m1_out) ;
  and		g8(bscn_xd0, ENC, tmg1m1_out) ;
  or		g9(bscn_d0, ENC_, tmg1m1_out_) ;
  or		g10(bscn_xd1, ENC_, tmg1m1_out) ;
  and		g11(bscn_d1, ENC, tmg1m1_out_) ;
  not		g12(tmg2m3_b, X) ;
  UDP_MUX21	g13(IT, jtag_q, tmg2m3_b, MD2_) ;
  not		g14(bck, XBCK) ;
  not		g15(xack, ACK) ;
  not		g16(xclk, CK) ;
  not		g17(clk, xclk) ;
  not		g18(xupd, UP) ;
  not		g19(upd, xupd) ;
  and		g20(jtag_x1, OT_, ENO) ;
  and		g21(jtag_x2, ENO_, tmg2m3_b) ;
  nor		g22(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g23(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g24(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g25(SO, jtag_latch2_out) ;
  UDP_LATCH    	g26(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g27(jtag_q, jtag_latch3_out) ;
  not		g28(out_buf_a, bscn_xd0) ;
  not		g29(out_buf_b, bscn_xd1) ;
  xor		g30(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g31(X, out_buf_a, out_buf_en) ;
endmodule

// JTAG Bidirectional cell
module JBD11SN(ENC_, OT, ENO, SI, CK, UP, ACK, XBCK, MD1, 
        MD2, SO, IT, X);
input   ENC_;        // tri-state enable, 0-tristate, 1-bistate
input   OT;          // outgoing data from core
input   ENO;         // jtag_ff: 1-sel_OT_data, 0-sel_PAD_data
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD1;         // 0-sel_pad_data, 1-sel_jtag_ff
input   MD2;         // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // incomming data to core
inout   X;
// Verilog body for JBD11SN

wire	MD1_ ;
wire	MD2_ ;
wire	OT_ ;
wire	ENO_ ;
wire	tmg1m_d_out ;
wire	jtag_q ;
wire	tmg2m1_b ;
wire	ENC ;
wire	tmg1m_d_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_d_a ;
wire	out_buf_d_b ;
wire	out_buf_d_en ;

  not		g1(MD1_, MD1) ;
  not		g2(MD2_, MD2) ;
  not		g3(OT_,  OT)  ;
  not		g4(ENO_, ENO) ;
  UDP_MUX21	g5(tmg1m_d_out, jtag_q, OT_, MD1_) ;
  not		g6(ENC, ENC_) ;
  not		g7(tmg1m_d_out_, tmg1m_d_out) ;
  and		g8(bscn_xd0, ENC, tmg1m_d_out) ;
  or		g9(bscn_d0, ENC_, tmg1m_d_out_) ;
  or		g10(bscn_xd1, ENC_, tmg1m_d_out) ;
  and		g11(bscn_d1, ENC, tmg1m_d_out_) ;
  not		g12(tmg2m1_b, X) ;
  UDP_MUX21	g13(IT, jtag_q, tmg2m1_b, MD2_) ;
  not		g14(bck, XBCK) ;
  not		g15(xack, ACK) ;
  not		g16(xclk, CK) ;
  not		g17(clk, xclk) ;
  not		g18(xupd, UP) ;
  not		g19(upd, xupd) ;
  and		g20(jtag_x1, OT_, ENO) ;
  and		g21(jtag_x2, ENO_, tmg2m1_b) ;
  nor		g22(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g23(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g24(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g25(SO, jtag_latch2_out) ;
  UDP_LATCH    	g26(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g27(jtag_q, jtag_latch3_out) ;
  not		g28(out_buf_d_a, bscn_xd0) ;
  not		g29(out_buf_d_b, bscn_xd1) ;
  xor		g30(out_buf_d_en, out_buf_d_a, out_buf_d_b) ;
  notif0	g31(X, out_buf_d_a, out_buf_d_en) ;
endmodule

// JTAG Bidirectional Cell
module JBD12SN(ENC_, OT, ENO, SI, CK, UP, ACK, XBCK, MD1, 
        MD2, SO, IT, X);
input   ENC_;        // tri-state enable, 0-tristate, 1-bistate
input   OT;          // outgoing data from core
input   ENO;         // jtag_ff: 1-sel_OT_data, 0-sel_PAD_data
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD1;         // 0-sel_pad_data, 1-sel_jtag_ff
input   MD2;         // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // incomming data to core
inout   X;
// Verilog body for JBD12SN

wire	MD1_ ;
wire	MD2_ ;
wire	OT_ ;
wire	ENO_ ;
wire	tmg1m_d_out ;
wire	jtag_q ;
wire	tmg2m2_b ;
wire	ENC ;
wire	tmg1m_d_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_d_a ;
wire	out_buf_d_b ;
wire	out_buf_d_en ;

  not		g1(MD1_, MD1) ;
  not		g2(MD2_, MD2) ;
  not		g3(OT_,  OT)  ;
  not		g4(ENO_, ENO) ;
  UDP_MUX21	g5(tmg1m_d_out, jtag_q, OT_, MD1_) ;
  not		g6(ENC, ENC_) ;
  not		g7(tmg1m_d_out_, tmg1m_d_out) ;
  and		g8(bscn_xd0, ENC, tmg1m_d_out) ;
  or		g9(bscn_d0, ENC_, tmg1m_d_out_) ;
  or		g10(bscn_xd1, ENC_, tmg1m_d_out) ;
  and		g11(bscn_d1, ENC, tmg1m_d_out_) ;
  not		g12(tmg2m2_b, X) ;
  UDP_MUX21	g13(IT, jtag_q, tmg2m2_b, MD2_) ;
  not		g14(bck, XBCK) ;
  not		g15(xack, ACK) ;
  not		g16(xclk, CK) ;
  not		g17(clk, xclk) ;
  not		g18(xupd, UP) ;
  not		g19(upd, xupd) ;
  and		g20(jtag_x1, OT_, ENO) ;
  and		g21(jtag_x2, ENO_, tmg2m2_b) ;
  nor		g22(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g23(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g24(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g25(SO, jtag_latch2_out) ;
  UDP_LATCH    	g26(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g27(jtag_q, jtag_latch3_out) ;
  not		g28(out_buf_d_a, bscn_xd0) ;
  not		g29(out_buf_d_b, bscn_xd1) ;
  xor		g30(out_buf_d_en, out_buf_d_a, out_buf_d_b) ;
  notif0	g31(X, out_buf_d_a, out_buf_d_en) ;
endmodule

// Output Buffer Cell, no scan
module JOS13NN(OT, X);
input   OT;
output  X;
// Verilog body for JOS13NN

wire	OT_ ;
wire	tmg1m1n_out ;
wire	tmg1m1n_out_ ;
wire	ENC ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(OT_, OT) ;
  not		g2(tmg1m1n_out, OT_) ;
  not		g3(ENC, 1'b0) ;
  not		g4(tmg1m1n_out_, tmg1m1n_out) ;
  and		g5(bscn_xd0, ENC, tmg1m1n_out) ;
  or		g6(bscn_d0, 1'b0, tmg1m1n_out_) ;
  or		g7(bscn_xd1, 1'b0, tmg1m1n_out) ;
  and		g8(bscn_d1, ENC, tmg1m1n_out_) ;
  not		g9(out_buf_a, bscn_xd0) ;
  not		g10(out_buf_b, bscn_xd1) ;
  xor		g11(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g12(X, out_buf_a, out_buf_en) ;
endmodule

// Output Buffer Cell, no scan
module JOA13NN(OT, X);
input   OT;
output  X;
// Verilog body for JOA13NN

wire	OT_ ;
wire	tmg1m1n_out ;
wire	tmg1m1n_out_ ;
wire	ENC ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(OT_, OT) ;
  not		g2(tmg1m1n_out, OT_) ;
  not		g3(ENC, 1'b0) ;
  not		g4(tmg1m1n_out_, tmg1m1n_out) ;
  and		g5(bscn_xd0, ENC, tmg1m1n_out) ;
  or		g6(bscn_d0, 1'b0, tmg1m1n_out_) ;
  or		g7(bscn_xd1, 1'b0, tmg1m1n_out) ;
  and		g8(bscn_d1, ENC, tmg1m1n_out_) ;
  not		g9(out_buf_a, bscn_xd0) ;
  not		g10(out_buf_b, bscn_xd1) ;
  xor		g11(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g12(X, out_buf_a, out_buf_en) ;
endmodule

// JTAG Output with Tri-state Cell
module JTS13SN(OT, SI, CK, UP, ACK, XBCK, MD, SO, X);
input   OT;          // core data out
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  X;
// Verilog body for JTS13SN

wire	MD_ ;
wire	OT_ ;
wire	tmg1m1_out ;
wire	tmg1m1_out_ ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD_, MD) ;
  not		g2(OT_,  OT)  ;
  UDP_MUX21	g3(tmg1m1_out, jtag_q, OT_, MD_) ;
  not		g4(ENC, 1'b0) ;
  not		g5(tmg1m1_out_, tmg1m1_out) ;
  and		g6(bscn_xd0, ENC, tmg1m1_out) ;
  or		g7(bscn_d0, 1'b0, tmg1m1_out_) ;
  or		g8(bscn_xd1, 1'b0, tmg1m1_out) ;
  and		g9(bscn_d1, ENC, tmg1m1_out_) ;
  not		g10(tmg2m3_b, X) ;
  not		g12(bck, XBCK) ;
  not		g13(xack, ACK) ;
  not		g14(xclk, CK) ;
  not		g15(clk, xclk) ;
  not		g16(xupd, UP) ;
  not		g17(upd, xupd) ;
  and		g18(jtag_x1, OT_, 1'b1) ;
  and		g19(jtag_x2, 1'b0, tmg2m3_b) ;
  nor		g20(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g21(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2    g22(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g23(SO, jtag_latch2_out) ;
  UDP_LATCH     g24(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g25(jtag_q, jtag_latch3_out) ;
  not		g26(out_buf_a, bscn_xd0) ;
  not		g27(out_buf_b, bscn_xd1) ;
  xor		g28(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g29(X, out_buf_a, out_buf_en) ;


endmodule

// JTAG Output with tri-state Cell
module JTA13SN(OT, SI, CK, UP, ACK, XBCK, MD, SO, X);
input   OT;          // core data out
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  X;
// Verilog body for JTA13SN

wire	MD_ ;
wire	OT_ ;
wire	tmg1m_d_out ;
wire	tmg1m_d_out_ ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	bscn_d_xd0 ;
wire	bscn_d_d0 ;
wire	bscn_d_xd1 ;
wire	bscn_d_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a1_a ;
wire	out_buf_a1_b ;
wire	out_buf_a1_en ;

  not		g1(MD_, MD) ;
  not		g2(OT_,  OT)  ;
  UDP_MUX21	g3(tmg1m_d_out, jtag_q, OT_, MD_) ;
  not		g4(ENC, 1'b0) ;
  not		g5(tmg1m_d_out_, tmg1m_d_out) ;
  and		g6(bscn_d_xd0, ENC, tmg1m_d_out) ;
  or		g7(bscn_d_d0, 1'b0, tmg1m_d_out_) ;
  or		g8(bscn_d_xd1, 1'b0, tmg1m_d_out) ;
  and		g9(bscn_d_d1, ENC, tmg1m_d_out_) ;
  not		g10(tmg2m3_b, X) ;
  not		g12(bck, XBCK) ;
  not		g13(xack, ACK) ;
  not		g14(xclk, CK) ;
  not		g15(clk, xclk) ;
  not		g16(xupd, UP) ;
  not		g17(upd, xupd) ;
  and		g18(jtag_x1, OT_, 1'b1) ;
  and		g19(jtag_x2, 1'b0, tmg2m3_b) ;
  nor		g20(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g21(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g22(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g23(SO, jtag_latch2_out) ;
  UDP_LATCH    	g24(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g25(jtag_q, jtag_latch3_out) ;
  not		g26(out_buf_a1_a, bscn_d_xd0) ;
  not		g27(out_buf_a1_b, bscn_d_xd1) ;
  xor		g28(out_buf_a1_en, out_buf_a1_a, out_buf_a1_b) ;
  notif0	g29(X, out_buf_a1_a, out_buf_a1_en) ;
endmodule

// JTAG Output with tri-state Cell
module JTA23SN(OT, SI, CK, UP, ACK, XBCK, MD, SO, X);
input   OT;          // core data out
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  X;
// Verilog body for JTA23SN

wire	MD_ ;
wire	OT_ ;
wire	tmg1m_d_out ;
wire	tmg1m_d_out_ ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	bscn_a2_xd0 ;
wire	bscn_a2_d0 ;
wire	bscn_a2_xd1 ;
wire	bscn_a2_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a2_a ;
wire	out_buf_a2_b ;
wire	out_buf_a2_en ;

  not		g1(MD_, MD) ;
  not		g2(OT_,  OT)  ;
  UDP_MUX21	g3(tmg1m_d_out, jtag_q, OT_, MD_) ;
  not		g4(ENC, 1'b0) ;
  not		g5(tmg1m_d_out_, tmg1m_d_out) ;
  and		g6(bscn_a2_xd0, ENC, tmg1m_d_out) ;
  or		g7(bscn_a2_d0, 1'b0, tmg1m_d_out_) ;
  or		g8(bscn_a2_xd1, 1'b0, tmg1m_d_out) ;
  and		g9(bscn_a2_d1, ENC, tmg1m_d_out_) ;
  not		g10(tmg2m3_b, X) ;
  not		g12(bck, XBCK) ;
  not		g13(xack, ACK) ;
  not		g14(xclk, CK) ;
  not		g15(clk, xclk) ;
  not		g16(xupd, UP) ;
  not		g17(upd, xupd) ;
  and		g18(jtag_x1, OT_, 1'b1) ;
  and		g19(jtag_x2, 1'b0, tmg2m3_b) ;
  nor		g20(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g21(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g22(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g23(SO, jtag_latch2_out) ;
  UDP_LATCH    	g24(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g25(jtag_q, jtag_latch3_out) ;
  not		g26(out_buf_a2_a, bscn_a2_xd0) ;
  not		g27(out_buf_a2_b, bscn_a2_xd1) ;
  xor		g28(out_buf_a2_en, out_buf_a2_a, out_buf_a2_b) ;
  notif0	g29(X, out_buf_a2_a, out_buf_a2_en) ;
endmodule

// Output with tri-state Cell
module JTA23NN(ENC_, OT, X);
input   ENC_;
input   OT;
output  X;
// Verilog body for JTA23NN

wire	OT_ ;
wire	tmg1m1_out ;
wire	tmg1m1_out_ ;
wire	ENC ;
wire	bscn_d_xd0 ;
wire	bscn_d_d0 ;
wire	bscn_d_xd1 ;
wire	bscn_d_d1 ;
wire	out_buf_o_a ;
wire	out_buf_o_b ;
wire	out_buf_o_en ;

  not		g1(OT_,  OT)  ;
  not		g2(tmg1m1_out, OT_) ;
  not		g3(ENC, ENC_) ;
  not		g4(tmg1m1_out_, tmg1m1_out) ;
  and		g5(bscn_d_xd0, ENC, tmg1m1_out) ;
  or		g6(bscn_d_d0, ENC_, tmg1m1_out_) ;
  or		g7(bscn_d_xd1, ENC_, tmg1m1_out) ;
  and		g8(bscn_d_d1, ENC, tmg1m1_out_) ;
  not		g9(out_buf_o_a, bscn_d_xd0) ;
  not		g10(out_buf_o_b, bscn_d_xd1) ;
  xor		g11(out_buf_o_en, out_buf_o_a, out_buf_o_b) ;
  notif0	g12(X, out_buf_o_a, out_buf_o_en) ;
endmodule

// JTAG Output with tri-state Cell
module JTD03SN(OT, SI, CK, UP, ACK, XBCK, MD, SO, X);
input   OT;          // core data out
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  X;
// Verilog body for JTD03SN

wire	MD_ ;
wire	OT_ ;
wire	tmg1m1_out ;
wire	tmg1m1_out_ ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a2_a ;
wire	out_buf_a2_b ;
wire	out_buf_a2_en ;

  not		g1(MD_, MD) ;
  not		g2(OT_,  OT)  ;
  UDP_MUX21	g3(tmg1m1_out, jtag_q, OT_, MD_) ;
  not		g4(ENC, 1'b0) ;
  not		g5(tmg1m1_out_, tmg1m1_out) ;
  and		g6(bscn_xd0, ENC, tmg1m1_out) ;
  or		g7(bscn_d0, 1'b0, tmg1m1_out_) ;
  or		g8(bscn_xd1, 1'b0, tmg1m1_out) ;
  and		g9(bscn_d1, ENC, tmg1m1_out_) ;
  not		g10(tmg2m3_b, X) ;
  not		g12(bck, XBCK) ;
  not		g13(xack, ACK) ;
  not		g14(xclk, CK) ;
  not		g15(clk, xclk) ;
  not		g16(xupd, UP) ;
  not		g17(upd, xupd) ;
  and		g18(jtag_x1, OT_, 1'b1) ;
  and		g19(jtag_x2, 1'b0, tmg2m3_b) ;
  nor		g20(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g21(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g22(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g23(SO, jtag_latch2_out) ;
  UDP_LATCH    	g24(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g25(jtag_q, jtag_latch3_out) ;
  not		g26(out_buf_a2_a, bscn_xd0) ;
  not		g27(out_buf_a2_b, bscn_xd1) ;
  xor		g28(out_buf_a2_en, out_buf_a2_a, out_buf_a2_b) ;
  notif0	g29(X, out_buf_a2_a, out_buf_a2_en) ;
endmodule

// JTAG Input Buffer Cell
module JIS13SN(X, SI, CK, UP, ACK, XBCK, MD, SO, IT);
input   X;
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // core data in
// Verilog body for JIS13SN

wire	MD_ ;
wire	tmg1m1_out ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	tmg1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD_, MD) ;
  UDP_MUX21	g2(tmg1m1_out, jtag_q, 1'b1, 1'b1) ;
  not		g3(ENC, 1'b1) ;
  not		g4(tmg1m1_out_, tmg1m1_out) ;
  and		g5(bscn_xd0, ENC, tmg1m1_out) ;
  or		g6(bscn_d0, 1'b1, tmg1m1_out_) ;
  or		g7(bscn_xd1, 1'b1, tmg1m1_out) ;
  and		g8(bscn_d1, ENC, tmg1m1_out_) ;
  not		g9(tmg2m3_b, X) ;
  UDP_MUX21	g10(IT, jtag_q, tmg2m3_b, MD_) ;
  not		g11(bck, XBCK) ;
  not		g12(xack, ACK) ;
  not		g13(xclk, CK) ;
  not		g14(clk, xclk) ;
  not		g15(xupd, UP) ;
  not		g16(upd, xupd) ;
  and		g17(jtag_x1, 1'b1, 1'b0) ;
  and		g18(jtag_x2, 1'b1, tmg2m3_b) ;
  nor		g19(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g20(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g21(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g22(SO, jtag_latch2_out) ;
  UDP_LATCH    	g23(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g24(jtag_q, jtag_latch3_out) ;
  not		g25(out_buf_a, bscn_xd0) ;
  not		g26(out_buf_b, bscn_xd1) ;
  xor		g27(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g28(X, out_buf_a, out_buf_en) ;
endmodule

// JTAG Input Buffer Cell
module JIS11SN(X, SI, CK, UP, ACK, XBCK, MD, SO, IT);
input   X;
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // core data in
// Verilog body for JIS11SN

wire	MD_ ;
wire	tmg1m1_out ;
wire	jtag_q ;
wire	tmg2m1_b ;
wire	ENC ;
wire	tmg1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD_, MD) ;
  UDP_MUX21	g2(tmg1m1_out, jtag_q, 1'b1, 1'b1) ;
  not		g3(ENC, 1'b1) ;
  not		g4(tmg1m1_out_, tmg1m1_out) ;
  and		g5(bscn_xd0, ENC, tmg1m1_out) ;
  or		g6(bscn_d0, 1'b1, tmg1m1_out_) ;
  or		g7(bscn_xd1, 1'b1, tmg1m1_out) ;
  and		g8(bscn_d1, ENC, tmg1m1_out_) ;
  not		g9(tmg2m1_b, X) ;
  UDP_MUX21	g10(IT, jtag_q, tmg2m1_b, MD_) ;
  not		g11(bck, XBCK) ;
  not		g12(xack, ACK) ;
  not		g13(xclk, CK) ;
  not		g14(clk, xclk) ;
  not		g15(xupd, UP) ;
  not		g16(upd, xupd) ;
  and		g17(jtag_x1, 1'b1, 1'b0) ;
  and		g18(jtag_x2, 1'b1, tmg2m1_b) ;
  nor		g19(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g20(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g21(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g22(SO, jtag_latch2_out) ;
  UDP_LATCH    	g23(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g24(jtag_q, jtag_latch3_out) ;
  not		g25(out_buf_a, bscn_xd0) ;
  not		g26(out_buf_b, bscn_xd1) ;
  xor		g27(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g28(X, out_buf_a, out_buf_en) ;
endmodule

// JTAG Input Buffer with Pull-up Cell
module JIS11SP(X, SI, CK, UP, ACK, XBCK, MD, SO, IT);
input   X;
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // core data in
// Verilog body for JIS11SP

wire	MD_ ;
wire	tmg1m1_out ;
wire	jtag_q ;
wire	tmg2m1_b ;
wire	ENC ;
wire	tmg1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD_, MD) ;
  UDP_MUX21	g2(tmg1m1_out, jtag_q, 1'b1, 1'b1) ;
  not		g3(ENC, 1'b1) ;
  not		g4(tmg1m1_out_, tmg1m1_out) ;
  and		g5(bscn_xd0, ENC, tmg1m1_out) ;
  or		g6(bscn_d0, 1'b1, tmg1m1_out_) ;
  or		g7(bscn_xd1, 1'b1, tmg1m1_out) ;
  and		g8(bscn_d1, ENC, tmg1m1_out_) ;
  not		g9(tmg2m1_b, X) ;
  UDP_MUX21	g10(IT, jtag_q, tmg2m1_b, MD_) ;
  not		g11(bck, XBCK) ;
  not		g12(xack, ACK) ;
  not		g13(xclk, CK) ;
  not		g14(clk, xclk) ;
  not		g15(xupd, UP) ;
  not		g16(upd, xupd) ;
  and		g17(jtag_x1, 1'b1, 1'b0) ;
  and		g18(jtag_x2, 1'b1, tmg2m1_b) ;
  nor		g19(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g20(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g21(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g22(SO, jtag_latch2_out) ;
  UDP_LATCH    	g23(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g24(jtag_q, jtag_latch3_out) ;
  not		g25(out_buf_a, bscn_xd0) ;
  not		g26(out_buf_b, bscn_xd1) ;
  xor		g27(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g28(X, out_buf_a, out_buf_en) ;
endmodule

// JTAG Input Buffer with pull-up Cell
module JIS13SP(X, SI, CK, UP, ACK, XBCK, MD, SO, IT);
input   X;
input   SI;          // scan-in data
input   CK;          // register pad-data on rising edge
input   UP;          // latch data from jtag ff
input   ACK;         // enb. master latch for scan-in data
input   XBCK;        // enb. slave latch
input   MD;          // 0-sel_pad_data, 1-sel_jtag_ff
output  SO;          // scan-out data
output  IT;          // core data in
// Verilog body for JIS13SP

wire	MD_ ;
wire	tmg1m1_out ;
wire	jtag_q ;
wire	tmg2m3_b ;
wire	ENC ;
wire	tmg1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	bck ;
wire	xack ;
wire	clk ;
wire	xclk ;
wire	upd ;
wire	xupd ;
wire	jtag_x1 ;
wire	jtag_x2 ;
wire	jtag_x ;
wire	jtag_latch1_out ;
wire	jtag_latch2_out ;
wire	jtag_latch3_out ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(MD_, MD) ;
  UDP_MUX21	g2(tmg1m1_out, jtag_q, 1'b1, 1'b1) ;
  not		g3(ENC, 1'b1) ;
  not		g4(tmg1m1_out_, tmg1m1_out) ;
  and		g5(bscn_xd0, ENC, tmg1m1_out) ;
  or		g6(bscn_d0, 1'b1, tmg1m1_out_) ;
  or		g7(bscn_xd1, 1'b1, tmg1m1_out) ;
  and		g8(bscn_d1, ENC, tmg1m1_out_) ;
  not		g9(tmg2m3_b, X) ;
  UDP_MUX21	g10(IT, jtag_q, tmg2m3_b, MD_) ;
  not		g11(bck, XBCK) ;
  not		g12(xack, ACK) ;
  not		g13(xclk, CK) ;
  not		g14(clk, xclk) ;
  not		g15(xupd, UP) ;
  not		g16(upd, xupd) ;
  and		g17(jtag_x1, 1'b1, 1'b0) ;
  and		g18(jtag_x2, 1'b1, tmg2m3_b) ;
  nor		g19(jtag_x, jtag_x1, jtag_x2) ;
  UDP_LATCH1   	g20(jtag_latch1_out, xclk, ACK, jtag_x, SI) ;
  UDP_LATCH2   	g21(jtag_latch2_out, bck, clk, jtag_latch1_out) ;
  buf		g22(SO, jtag_latch2_out) ;
  UDP_LATCH    	g23(jtag_latch3_out, xupd, jtag_latch2_out) ;
  not		g24(jtag_q, jtag_latch3_out) ;
  not		g25(out_buf_a, bscn_xd0) ;
  not		g26(out_buf_b, bscn_xd1) ;
  xor		g27(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g28(X, out_buf_a, out_buf_en) ;
endmodule

// Input Buffer Cell
module JIS13NN(X, IT);
input   X;
output  IT;
// Verilog body for JIS13NN

wire	ENC ;
wire	tmg1m1n_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	tmg2m3n_x ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(ENC, 1'b1) ;
  not		g2(tmg1m1n_out_, 1'b0) ;
  and		g3(bscn_xd0, ENC, 1'b0) ;
  or		g4(bscn_d0, 1'b1, tmg1m1n_out_) ;
  or		g5(bscn_xd1, 1'b1, 1'b0) ;
  and		g6(bscn_d1, ENC, tmg1m1n_out_) ;
  not		g7(tmg2m3n_x, X) ;
  not		g8(IT, tmg2m3n_x) ;
  not		g9(out_buf_a, bscn_xd0) ;
  not		g10(out_buf_b, bscn_xd1) ;
  xor		g11(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g12(X, out_buf_a, out_buf_en) ;
endmodule

// Input Buffer Cell
module JIS11NP(X, IT);
input   X;
output  IT;
// Verilog body for JIS13NN

wire	ENC ;
wire	tmg1m1_out_ ;
wire	bscn_xd0 ;
wire	bscn_d0 ;
wire	bscn_xd1 ;
wire	bscn_d1 ;
wire	tmg2m1_x ;
wire	out_buf_a ;
wire	out_buf_b ;
wire	out_buf_en ;

  not		g1(ENC, 1'b1) ;
  not		g2(tmg1m1_out_, 1'b0) ;
  and		g3(bscn_xd0, ENC, 1'b0) ;
  or		g4(bscn_d0, 1'b1, tmg1m1_out_) ;
  or		g5(bscn_xd1, 1'b1, 1'b0) ;
  and		g6(bscn_d1, ENC, tmg1m1_out_) ;
  not		g7(tmg2m1_x, X) ;
  not		g8(IT, tmg2m1_x) ;
  not		g9(out_buf_a, bscn_xd0) ;
  not		g10(out_buf_b, bscn_xd1) ;
  xor		g11(out_buf_en, out_buf_a, out_buf_b) ;
  notif0	g12(X, out_buf_a, out_buf_en) ;
endmodule

// Test Cell
module JTST1(X);
output  X;
// Verilog body for JTST1

endmodule

// Test Cell
module JTST2(X);
output  X;
// Verilog body for JTST2

endmodule

// Power 2-Input AND Gate
module MJAND2B(A1, A2, O);
input   A1;
input   A2;
output  O;
and g0(O, A1, A2);
endmodule

// Power 3-Input AND Gate
module MJAND3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
and g0(O, A1, A2, A3);
endmodule

// Power 4-Input AND Gate
module MJAND4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
and g0(O, A1, A2, A3, A4);
endmodule

// Power 6-Input AND Gate
module MJAND6B(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
and g0(O, A1, A2, A3, A4, A5, A6);
endmodule

// Power 8-Input AND Gate
module MJAND8B(A1, A2, A3, A4, A5, A6, A7, A8, O);
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

// Power Buffer
module MJBUFC(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Double Power Buffer
module MJBUFD(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Delay Buffer
module MJBUFDA(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// Quadruple Power Buffer
module MJBUFE(A, O);
input   A;
output  O;
buf g0(O, A);
endmodule

// 2-1 AOI
module MJD21A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
and g0(w0, A1, A2);
nor g1(O, w0, B);
endmodule

// 2-2 AOI
module MJD22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
nor g2(O, w0, w3);
endmodule

// 2-3 AOI
module MJD23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2, B3);
nor g2(O, w0, w3);
endmodule

// Power 2-2-2-2 AOI
module MJD2X4B(A1, A2, B1, B2, C1, C2, D1, D2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
nor g4(O, w0, w3, w6, w9);
endmodule

// Power 2-2-2-2-2-2 AOI
module MJD2X6A(A1, A2, B1, B2, C1, C2, D1, D2, E1, E2, F1, 
        F2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
input   E1;
input   E2;
input   F1;
input   F2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
and g4(w12, E1, E2);
and g5(w15, F1, F2);
nor g6(O, w0, w3, w6, w9, w12, w15);
endmodule

// Power 2-2-2-2-2-2-2-2 AOI
module MJD2X8A(A1, A2, B1, B2, C1, C2, D1, D2, E1, E2, F1, 
        F2, G1, G2, H1, H2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
input   E1;
input   E2;
input   F1;
input   F2;
input   G1;
input   G2;
input   H1;
input   H2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
and g4(w12, E1, E2);
and g5(w15, F1, F2);
and g6(w18, G1, G2);
and g7(w21, H1, H2);
nor g8(O, w0, w3, w6, w9, w12, w15, w18, w21);
endmodule

// 3-1 AOI
module MJD31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
and g0(w0, A1, A2, A3);
nor g1(O, w0, B);
endmodule

// 3-3 AOI
module MJD33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
nor g2(O, w0, w4);
endmodule

// Power 3-3 AOI
module MJD33B(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
nor g2(O, w0, w4);
endmodule

// Power 3-3-3-3 AOI
module MJD3X4A(A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, 
        D3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
input   C1;
input   C2;
input   C3;
input   D1;
input   D2;
input   D3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
and g2(w8, C1, C2, C3);
and g3(w12, D1, D2, D3);
nor g4(O, w0, w4, w8, w12);
endmodule

// 2&1-1 AO
module MJDB121A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
or g0(w1, A1, A2);
and g1(w0, w1, B);
or g2(O, w0, C);
endmodule

// 2-2-1 AO
module MJDB122A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
or g2(O, w0, w3, C);
endmodule

// 2-1-1 AO
module MJDB211A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B1, B2);
endmodule

// 2-1 AO
module MJDB21A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B);
endmodule

// 2-1-1-1 AO
module MJDB21X3A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
or g1(O, w0, B1, B2, B3);
endmodule

// 2-2-2 AO
module MJDB222A(A1, A2, B1, B2, C1, C2, O);
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
or g3(O, w0, w3, w6);
endmodule

// 2-2-2 AO
module MJDB222B(A1, A2, B1, B2, C1, C2, O);
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
or g3(O, w0, w3, w6);
endmodule

// 2-2 AO
module MJDB22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
or g2(O, w0, w3);
endmodule

// 2-3 AO
module MJDB23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2, B3);
or g2(O, w0, w3);
endmodule

// 2-2-2-2 AO
module MJDB2X4B(A1, A2, B1, B2, C1, C2, D1, D2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
input   D1;
input   D2;
output  O;
and g0(w0, A1, A2);
and g1(w3, B1, B2);
and g2(w6, C1, C2);
and g3(w9, D1, D2);
or g4(O, w0, w3, w6, w9);
endmodule

// 3-1 AO
module MJDB31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
and g0(w0, A1, A2, A3);
or g1(O, w0, B);
endmodule

// 3-3 AO
module MJDB33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
and g0(w0, A1, A2, A3);
and g1(w4, B1, B2, B3);
or g2(O, w0, w4);
endmodule

// 1-bit Full Adder
module MJFAD1A(A, B, CI, S, CO);
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

// 1-1-2 OAI
module MJG112A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
nand g1(O, w0, B1, B2);
endmodule

// 1-2 OAI
module MJG12A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
or g0(w0, A1, A2);
nand g1(O, w0, B);
endmodule

// 2-1-1-1 OAI
module MJG2111A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
nand g1(O, w0, B1, B2, B3);
endmodule

//  2-1-1 OAI
module MJG211A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
and g0(w1, A1, A2);
or g1(w0, w1, B);
nand g2(O, w0, C);
endmodule

// 2-2-1 OAI
module MJG221A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
nand g2(O, w0, w3, C);
endmodule

// 2-2-2 OAI
module MJG222A(A1, A2, B1, B2, C1, C2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
or g2(w6, C1, C2);
nand g3(O, w0, w3, w6);
endmodule

// 2-2 OAI
module MJG22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
nand g2(O, w0, w3);
endmodule

// 2-3 OAI
module MJG23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2, B3);
nand g2(O, w0, w3);
endmodule

// 3-1 OAI
module MJG31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
or g0(w0, A1, A2, A3);
nand g1(O, w0, B);
endmodule

// 3-3 OAI
module MJG33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2, A3);
or g1(w4, B1, B2, B3);
nand g2(O, w0, w4);
endmodule

// 1-1-2 OA
module MJGB112A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
and g1(O, w0, B1, B2);
endmodule

// 1-2 OA
module MJGB12A(A1, A2, B, O);
input   A1;
input   A2;
input   B;
output  O;
or g0(w0, A1, A2);
and g1(O, w0, B);
endmodule

//  2-1-1 OA
module MJGB211A(A1, A2, B, C, O);
input   A1;
input   A2;
input   B;
input   C;
output  O;
and g0(w1, A1, A2);
or g1(w0, w1, B);
and g2(O, w0, C);
endmodule

// 2-2-1 OA
module MJGB221A(A1, A2, B1, B2, C, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
and g2(O, w0, w3, C);
endmodule

// 2-2-2 OA
module MJGB222A(A1, A2, B1, B2, C1, C2, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   C1;
input   C2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
or g2(w6, C1, C2);
and g3(O, w0, w3, w6);
endmodule

// 2-2 OA
module MJGB22A(A1, A2, B1, B2, O);
input   A1;
input   A2;
input   B1;
input   B2;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2);
and g2(O, w0, w3);
endmodule

// 2-3 OA
module MJGB23A(A1, A2, B1, B2, B3, O);
input   A1;
input   A2;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2);
or g1(w3, B1, B2, B3);
and g2(O, w0, w3);
endmodule

// 3-1 OA
module MJGB31A(A1, A2, A3, B, O);
input   A1;
input   A2;
input   A3;
input   B;
output  O;
or g0(w0, A1, A2, A3);
and g1(O, w0, B);
endmodule

// 3-3 OA
module MJGB33A(A1, A2, A3, B1, B2, B3, O);
input   A1;
input   A2;
input   A3;
input   B1;
input   B2;
input   B3;
output  O;
or g0(w0, A1, A2, A3);
or g1(w4, B1, B2, B3);
and g2(O, w0, w4);
endmodule

// 1-bit Half Adder
module MJHAD1A(A, B, S, CO);
input   A;
input   B;
output  S;
output  CO;
xor g0(S, A, B);
and g1(CO, A, B);
endmodule

// Standard Inverter
module MJINVA(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Power Inverter
module MJINVB(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Double Power Inverter
module MJINVC(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Triple Power Inverter
module MJINVD(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// Quadruple Power Inverter
module MJINVE(A, O);
input   A;
output  O;
not g0(O, A);
endmodule

// 2:1 Selector
module MJMUX2A(A, B, S, O);
input   A;
input   B;
input   S;
output  O;
UDP_MUX21 udp_mux(O, A,B, S);

endmodule

// 2-Input NAND Gate
module MJNAND2A(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Power 2-Input NAND Gate
module MJNAND2B(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// Double Power 2-Input NAND Gate
module MJNAND2C(A1, A2, O);
input   A1;
input   A2;
output  O;
nand g0(O, A1, A2);
endmodule

// 3-Input NAND Gate
module MJNAND3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nand g0(O, A1, A2, A3);
endmodule

// Power 3-Input NAND Gate
module MJNAND3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nand g0(O, A1, A2, A3);
endmodule

// Double Power 3-Input NAND Gate
module MJNAND3C(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nand g0(O, A1, A2, A3);
endmodule

// 4-Input NAND Gate
module MJNAND4A(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nand g0(O, A1, A2, A3, A4);
endmodule

// Power 4-Input NAND Gate
module MJNAND4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nand g0(O, A1, A2, A3, A4);
endmodule

// Double Power 4-Input NAND Gate
module MJNAND4C(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nand g0(O, A1, A2, A3, A4);
endmodule

// Double Power 6-Input NAND Gate
module MJNAND6C(A1, A2, A3, A4, A5, A6, O);
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
module MJNAND8C(A1, A2, A3, A4, A5, A6, A7, A8, O);
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

// 2-Input NOR Gate
module MJNOR2A(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// 2-Input NOR Gate
module MJNOR2A1(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Power 2-Input NOR Gate
module MJNOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Power 2-Input NOR Gate
module MJNOR2B1(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Double Power 2-Input NOR Gate
module MJNOR2C(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// Tripple Power 2-Input NOR Gate
module MJNOR2D(A1, A2, O);
input   A1;
input   A2;
output  O;
nor g0(O, A1, A2);
endmodule

// 3-Input NOR Gate
module MJNOR3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// 3-Input NOR Gate
module MJNOR3A1(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Power 3-Input NOR Gate
module MJNOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Power 3-Input NOR Gate
module MJNOR3B1(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Double Power 3-Input NOR Gate
module MJNOR3C(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// Tripple Power 3-Input NOR Gate
module MJNOR3D(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
nor g0(O, A1, A2, A3);
endmodule

// 4-Input NOR Gate
module MJNOR4A1(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Power 4-Input NOR Gate
module MJNOR4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Power 4-Input NOR Gate
module MJNOR4B1(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Double Power 4-Input NOR Gate
module MJNOR4C(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Tripple Power 4-Input NOR Gate
module MJNOR4D(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Quadruple Power 4-Input NOR Gate
module MJNOR4E(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
nor g0(O, A1, A2, A3, A4);
endmodule

// Double Power 6-Input NOR Gate
module MJNOR6C(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
nor g0(O, A1, A2, A3, A4, A5, A6);
endmodule

// Double Power 8-Input NOR Gate
module MJNOR8C(A1, A2, A3, A4, A5, A6, A7, A8, O);
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

// Power 2-Input OR Gate
module MJOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
or g0(O, A1, A2);
endmodule

// Power 3-Input OR Gate
module MJOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
or g0(O, A1, A2, A3);
endmodule

// Power 4-Input OR Gate
module MJOR4B(A1, A2, A3, A4, O);
input   A1;
input   A2;
input   A3;
input   A4;
output  O;
or g0(O, A1, A2, A3, A4);
endmodule

// Double Power 6-Input OR Gate
module MJOR6B(A1, A2, A3, A4, A5, A6, O);
input   A1;
input   A2;
input   A3;
input   A4;
input   A5;
input   A6;
output  O;
or g0(O, A1, A2, A3, A4, A5, A6);
endmodule

// Double Power 8-Input OR Gate
module MJOR8B(A1, A2, A3, A4, A5, A6, A7, A8, O);
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

// 2-input Exclusive NOR
module MJXNOR2A(A1, A2, O);
input   A1;
input   A2;
output  O;
xnor g0(O, A1, A2);
endmodule

// Power 2-input Exclusive NOR
module MJXNOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
xnor g0(O, A1, A2);
endmodule

// 3-input Exclusive NOR
module MJXNOR3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xnor g0(O, A1, A2, A3);
endmodule

// Power 3-input Exclusive NOR
module MJXNOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xnor g0(O, A1, A2, A3);
endmodule

// 2-input Exclusive OR
module MJXOR2A(A1, A2, O);
input   A1;
input   A2;
output  O;
xor g0(O, A1, A2);
endmodule

// Power 2-input Exclusive OR
module MJXOR2B(A1, A2, O);
input   A1;
input   A2;
output  O;
xor g0(O, A1, A2);
endmodule

// 3-input Exclusive OR
module MJXOR3A(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xor g0(O, A1, A2, A3);
endmodule

// Power 3-input Exclusive OR
module MJXOR3B(A1, A2, A3, O);
input   A1;
input   A2;
input   A3;
output  O;
xor g0(O, A1, A2, A3);
endmodule

// 1-bit D Flip-Flop  with scan and hold
module MSFFHA(D, CK, H, SM, SI, Q, XQ, SO);
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

// 1-bit D Flip-Flop  with scan and reset
module MSFFRA(D, CK, R, SM, SI, Q, XQ, SO);
input   D;
input   CK;
input   R;           // active low
input   SM;
input   SI;
output  Q;
output  XQ;
output  SO;
and g0(w0, R, D);
fj_dff_e_muxscan    g1(IQ, w0, SI, SM, CK);
buf g2(Q, IQ);
not g3(XQ, IQ);
buf g4(SO, IQ);
endmodule

// 1-bit D Flip-Flop  with scan and reset and hold
module MSFFRHA(D, CK, R, H, SM, SI, Q, XQ, SO);
input   D;
input   CK;
input   R;           // active low
input   H;
input   SM;
input   SI;
output  Q;
output  XQ;
output  SO;
not g0(w4, H);
and g1(w3, w4, D);
and g2(w6, H, IQ);
or g3(w2, w3, w6);
and g4(w0, R, w2);
fj_dff_e_muxscan    g5(IQ, w0, SI, SM, CK);
buf g6(Q, IQ);
not g7(XQ, IQ);
buf g8(SO, IQ);
endmodule

// end of stdcells_swift library 

module MSCINVD1 (O,A);
    output O;
    input A;


        not             U_1     ( O , A);

endmodule
module MSCINVD3 (O,A);
    output O;
    input A;


        not             U_1     ( O , A);

endmodule
module MSCINVD5 (O,A);
    output O;
    input A;


        not             U_1     ( O , A);

endmodule
module MSCINVD7 (O,A);
    output O;
    input A;


        not             U_1     ( O , A);

endmodule
module MSCINVD9 (O,A);
    output O;
    input A;


        not             U_1     ( O , A);

endmodule

// Buffer in IO Frame 
module io3inv(in, out1, out2);
input   in;
output  out1;
output  out2;
buf g0(out1, in);
buf g1(out2, in);
endmodule

// Double Power Buffer
module JBUFCD(B, A, O);
input   B;
input   A;
output  O;
buf g0(O, B);
endmodule

// Double Power Buffer
module JBUFNAD(B, A, O);
input   B;
input   A;
output  O;
buf g0(O, B);
endmodule

// Double Power Buffer
module JBUFNOD(B, A, O);
input   B;
input   A;
output  O;
buf g0(O, B);
endmodule

