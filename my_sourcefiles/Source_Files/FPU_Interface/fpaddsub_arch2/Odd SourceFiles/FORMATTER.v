//==================================================================================================
//  Filename      : Comparators.v
//  Created On    : 2016-09-22 10:07:30
//  Last Modified : 2016-09-22 14:51:38
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   :
//
//
//==================================================================================================
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:11:30 08/20/2015
// Design Name:
// Module Name:    Sixth_Phase
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
// `include "Comparator_Less.v"
// `include "Greater_Comparator.v"

module FORMATTER
//Module Parameter
//EW = 9 ; Single Precision Format
//EW = 11; Double Precision Format

	# (parameter EW = 9)
/*	# (parameter EW = 12)*/
	(
		input wire [EW-1:0] exp, //exponent of the fifth phase
		output wire overflow, //overflow flag
		output wire underflow //underflow flag

    );

wire [EW-1:0] U_limit; //Max Normal value of the standar ieee 754
wire [EW-1:0] L_limit; //Min Normal value of the standar ieee 754


//Compares the exponent with the Max Normal Value, if the exponent is
//larger than U_limit then exist overflow
Greater_Comparator #(.W(EW)) GTComparator (
    .Data_A(exp),
    .Data_B(U_limit),
    .gthan(overflow)
    );

//Compares the exponent with the Min Normal Value, if the exponent is
//smaller than L_limit then exist underflow
Comparator_Less #(.W(EW)) LTComparator (
    .Data_A(exp),
    .Data_B(L_limit),
    .less(underflow)
    );



//This generate sentence creates the limit values based on the
//precision format

  generate
  	if(EW == 9) begin
  		assign U_limit = 9'hfe;
  		assign L_limit = 9'h01;
  	end
  	else begin
  		assign U_limit = 12'b111111111110;
  		assign L_limit = 12'b000000000001;
  	end
  endgenerate

endmodule

