//==================================================================================================
//  Filename      : Mux_3x1_b.v
//  Created On    : 2016-10-03 16:53:16
//  Last Modified : 2016-10-04 10:26:18
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

module Mux_3x1_bv2 #(parameter W=32)
(
//Input Signals
input wire [1:0] select,
input wire [W-1:0] ch_0,
input wire [W-1:0] ch_1,
input wire [W-1:0] ch_2,
//Output Signals
output reg [W-1:0] data_out
);
    always @*
        begin
            case(select)
                2'b00: data_out <= {W{1'b0}};
                2'b01: data_out <= ch_0;
                2'b10: data_out <= ch_1;
                2'b11: data_out <= ch_2;
                default : data_out <= ch_0;
            endcase
        end
endmodule
