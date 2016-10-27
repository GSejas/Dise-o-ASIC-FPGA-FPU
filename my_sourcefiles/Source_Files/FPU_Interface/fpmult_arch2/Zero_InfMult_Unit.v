`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:39:29 10/01/2015
// Design Name:
// Module Name:    Zero_InfMult_Unit
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
module Zero_InfMult_Unit

//SINGLE PRECISION PARAMETERS
	# (parameter W = 32)

//DOUBLE PRECISION PARAMETERS
/* # (parameter W = 64) */
	(
		input wire clk,
		input wire rst,
		input wire load,
		input wire [W-2:0] Data_A,
		input wire [W-2:0] Data_B,

		output wire zero_m_flag
    );


//Wires/////////////////////
wire or_1, or_2;
wire [W-2:0] zero_comp;
wire zero_reg;
////////////////////////////


Comparator_Equal #(.S(W-1)) Data_A_Comp  (
    .Data_A(Data_A),
    .Data_B(zero_comp),
    .equal_sgn(or_1)
    );

Comparator_Equal #(.S(W-1)) Data_B_Comp  (
    .Data_A(zero_comp),
    .Data_B(Data_B),
    .equal_sgn(or_2)
    );


RegisterAdd #(.W(1)) Zero_Info_Mult ( //Data X input register
    .clk(clk),
    .rst(rst),
    .load(load),
    .D(zero_reg),
    .Q(zero_m_flag)
    );


assign zero_reg = or_1 || or_2;
assign zero_comp = {(W-1){1'd0}};

//generate
//		if (W == 32) 
//			assign zero_comp = 31'd0;
//		else
//			assign zero_comp = 63'd0;
//endgenerate

endmodule
