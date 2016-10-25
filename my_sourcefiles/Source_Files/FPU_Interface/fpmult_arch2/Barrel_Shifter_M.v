`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/26/2016 06:19:33 AM
// Design Name:
// Module Name: Barrel_Shifter_M
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module Barrel_Shifter_M
	#(parameter SW=26)
    (
    input wire clk,
    input wire rst,
    input wire load_i,
    input wire Shift_Value_i,
    input wire [SW-1:0] Shift_Data_i,
    /////////////////////////////////////////////7
    output wire [SW-1:0] N_mant_o
    );
    wire [SW-1:0] Data_Reg;


    ////////////////////////////////////////////////////7


    shift_mux_array #(.SWR(SW), .LEVEL(0)) shift_mux_array(
		.Data_i(Shift_Data_i),
		.select_i(Shift_Value_i),
		.bit_shift_i(1'b1),
		.Data_o(Data_Reg)
		);

    RegisterMult #(.W(SW)) Output_Reg(
        .clk(clk),
        .rst(rst),
        .load(load_i),
        .D(Data_Reg),
        .Q(N_mant_o)
        );

endmodule
