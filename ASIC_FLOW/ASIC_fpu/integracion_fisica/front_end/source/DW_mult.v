//==================================================================================================
//  Filename      : RKOA_OPCHANGE.v
//  Created On    : 2016-10-26 23:25:59
//  Last Modified : 2016-11-01 17:10:58
//  Revision      : 
//  Author        : Jorge Esteban Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira03@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
//=========================================================================================
//==================================================================================================
//  Filename      : RKOA_OPCHANGE.v
//  Created On    : 2016-10-24 22:49:36
//  Last Modified : 2016-10-26 23:25:21
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

`include "global.v"

module DW_mult
    //#(parameter SW = 24, parameter precision = 0)
    #(parameter SW = 24)
    (
    input wire clk,
    input wire rst,
    input wire load_b_i,
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output wire [2*SW-1:0] sgf_result_o
    );

 reg [2*SW-1:0] Result;

always @* begin
    Result = Data_A_i *Data_B_i ;
end
       RegisterAdd #(.W(2*SW)) finalreg ( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(load_b_i), 
                .D(Result), 
                .Q(sgf_result_o)
            );

endmodule
