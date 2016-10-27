`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    11:05:40 09/06/2015
// Design Name:
// Module Name:    Deco_Round_Mult
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
module Deco_Round_Mult(
	input wire [1:0] round_mode,
	input wire or_info, //23 less significant bits from the product of significands
	input wire xor_info, //Brings information about the sign of the operation
	output reg ctrl //control signal mux --- control of the rounded significand
    );

wire round_ok;

always @*
  case ({xor_info,or_info,round_mode})
 // Round to infinity - (Round down)
//1'b0: Let pass the significand without rounding
//1'b1: Let pass the rounded significand

//Round towards - infinity
//0: positive number ; 01: Round towards - inifnity ; XX rounding bits

	//Positive Number
	//xor, or, round
	4'b0101: ctrl <= 1'b0;

	//Negative Number

	4'b1101: ctrl <= 1'b1;

//Round towards + infinity

	//Positive Number

	4'b0110: ctrl <= 1'b1;

	//Negative Number

	4'b1110: ctrl <= 1'b0;

   default: ctrl <= 1'b0; //Truncation
   endcase

endmodule
