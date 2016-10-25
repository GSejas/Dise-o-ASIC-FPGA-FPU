`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    12:13:54 09/04/2015
// Design Name:
// Module Name:    OR_Module
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module OR_Module
	//SINGLE PRECISION PARAMETERS
	# (parameter W = 23)
	//DOUBLE PRECISION PARAMETERS
/*	# (parameter W = 52) */
	(
		input wire [W-1:0] Sgf_Round_Part,
		output wire round_ok
    );

wire [W-1:0] zero_q;
assign zero_q = 0;
///////////////////////////////////////////////////////////////////
assign round_ok = ~(Sgf_Round_Part == zero_q) ? 1'b1 : 1'b0;

endmodule
