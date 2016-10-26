
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

