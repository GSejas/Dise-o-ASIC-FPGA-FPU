
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



