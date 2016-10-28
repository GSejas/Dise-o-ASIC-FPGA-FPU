//==================================================================================================
//  Filename      : RKOA_SUBMOD.v
//  Created On    : 2016-10-26 23:28:42
//  Last Modified : 2016-10-27 19:48:18
//  Revision      : 
//  Author        : Jorge Esteban Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira03@gmail.com
//
//  Description   : 
//
//
//==================================================================================================

`timescale 1ns / 1ps

module mult
    //#(parameter SW = 24, parameter precision = 0)
    #(parameter SW = 24)
    (
  //  input wire clk,
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output reg [2*SW-1:0] Data_S_o
    );

always @* begin
    Data_S_o = Data_A_i *Data_B_i ;
end

endmodule
