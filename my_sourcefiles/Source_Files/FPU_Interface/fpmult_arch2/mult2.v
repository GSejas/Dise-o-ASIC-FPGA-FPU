//==================================================================================================
//  Filename      : RKOA_SUBMOD.v
//  Created On    : 2016-10-26 23:28:42
//  Last Modified : 2016-10-31 11:09:25
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

module mult2
    //#(parameter SW = 24, parameter precision = 0)
    #(parameter SW = 24)
    (
    input wire clk,
    input wire [SW-1:0] DatA,
    input wire [SW-1:0] DatB,
    output reg [2*SW-1:0] DatO
    );

always @(posedge clk) begin
    DatO = DatA *DatB ;
end

endmodule
