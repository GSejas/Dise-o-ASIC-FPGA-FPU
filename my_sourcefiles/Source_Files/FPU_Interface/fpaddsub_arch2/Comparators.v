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
module Comparators
//Module Parameter
//W_Exp = 9 ; Single Precision Format
//W_Exp = 11; Double Precision Format

	# (parameter W_Exp = 9)
/*	# (parameter W_Exp = 12)*/
	(
		input wire [W_Exp-1:0] exp, //exponent of the fifth phase
		output wire overflow, //overflow flag
		output wire underflow //underflow flag
		
    );

wire [W_Exp-1:0] U_limit; //Max Normal value of the standar ieee 754
wire [W_Exp-1:0] L_limit; //Min Normal value of the standar ieee 754


//Compares the exponent with the Max Normal Value, if the exponent is
//larger than U_limit then exist overflow
Greater_Comparator #(.W(W_Exp)) GTComparator ( 
    .Data_A(exp), 
    .Data_B(U_limit), 
    .gthan(overflow)
    );

//Compares the exponent with the Min Normal Value, if the exponent is
//smaller than L_limit then exist underflow	 
Comparator_Less #(.W(W_Exp)) LTComparator (
    .Data_A(exp),  
    .Data_B(L_limit), 
    .less(underflow)
    );



//This generate sentence creates the limit values based on the 
//precision format

generate
	if(W_Exp == 9) begin
		assign U_limit = 9'hfe;
		assign L_limit = 9'h01;
	end
	else begin
		assign U_limit = 12'b111111111110;
		assign L_limit = 12'b000000000001;
	end
endgenerate

endmodule
 
