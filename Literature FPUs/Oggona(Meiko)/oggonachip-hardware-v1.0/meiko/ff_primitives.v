
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
 
