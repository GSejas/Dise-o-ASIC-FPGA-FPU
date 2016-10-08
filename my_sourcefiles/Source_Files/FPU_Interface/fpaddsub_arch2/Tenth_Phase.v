`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:08 08/27/2015 
// Design Name: 
// Module Name:    Tenth_Phase 
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
module Tenth_Phase 
//Module Parameters
/***SINGLE PRECISION***/
// W = 32 
// EW = 8
// SW = 23 

/***DOUBLE PRECISION***/
// W = 64 
// EW = 11
// SW = 52

	# (parameter W = 32, parameter EW = 8, parameter SW = 23)
//	# (parameter W = 64, parameter EW = 11, parameter SW = 52)
	
	(
		//INPUTS
		input wire clk, //Clock Signal
		input wire rst, //Reset Signal
        input wire load_i,
		input wire sel_a_i, //Overflow/add/subt result's mux's selector
		input wire sel_b_i, //underflow/add/subt result's mux's selector
		input wire sign_i, //Sign of the largest Operand
		input wire [EW-1:0] exp_ieee_i, //Final Exponent
		input wire [SW-1:0] sgf_ieee_i,//Final Significand
		//OUTPUTS
		output wire [W-1:0] final_result_ieee_o //Final Result
    );

//Wire Connection signals
wire [SW-1:0] Sgf_S_mux;
wire [EW-1:0] Exp_S_mux;
wire Sign_S_mux;
wire [W-1:0] final_result_reg;
wire overunder;
wire [EW-1:0] exp_mux_D1;
wire [SW-1:0] sgf_mux_D1;

//////////////////////////////////////////////////////////

assign overunder = sel_a_i | sel_b_i;

Mux_3x1 #(.W(1)) Sign_Mux (
    .ctrl({sel_a_i,sel_b_i}),
    .D0(sign_i),
    .D1(1'b1),
    .D2(1'b0),
    .S(Sign_S_mux)
    );

Multiplexer_AC #(.W(EW)) Exp_Mux (
    .ctrl(overunder), 
    .D0(exp_ieee_i), 
    .D1(exp_mux_D1), 
    .S(Exp_S_mux)
    );
    
Multiplexer_AC #(.W(SW)) Sgf_Mux (
        .ctrl(overunder), 
        .D0(sgf_ieee_i), 
        .D1(sgf_mux_D1), 
        .S(Sgf_S_mux)
        );
/////////////////////////////////////////////////////////
generate
if(W == 32) begin
    assign exp_mux_D1 =8'hff;
    assign sgf_mux_D1 =23'd0;
end
else begin

    assign exp_mux_D1 =11'hfff;
    assign sgf_mux_D1 =52'd0;

end
endgenerate
////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////
RegisterAdd #(.W(W)) Final_Result_IEEE (
    .clk(clk), 
    .rst(rst), 
    .load(load_i), 
    .D({Sign_S_mux,Exp_S_mux,Sgf_S_mux}), 
    .Q(final_result_ieee_o)
    );	 


endmodule
