
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

