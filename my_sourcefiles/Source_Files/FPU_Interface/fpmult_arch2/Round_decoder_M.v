`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/25/2016 10:25:01 AM
// Design Name:
// Module Name: Round_decoder_M
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


module Round_decoder_M
    #(parameter SW=23)
    (
    input wire [SW-1:0] Round_Bits_i,
    input wire [1:0] Round_Mode_i,
    input wire Sign_Result_i,
    output wire Round_Flag_o
    );
 wire round_ok;
    OR_Module #(.W(SW)) OR_info_reg (
        .Sgf_Round_Part(Round_Bits_i),
        .round_ok(round_ok)
    );

    Deco_Round_Mult Rounding_Deco (
        .round_mode(Round_Mode_i),
        .or_info(round_ok),
        .xor_info(Sign_Result_i),
        .ctrl(Round_Flag_o)
        );
endmodule
