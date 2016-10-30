`timescale 1ns / 1ps

module Mux_2x1 #(parameter W=32)
(
//Input Signals
input wire select,
input wire [W-1:0] ch_0,
input wire [W-1:0] ch_1,
//Output Signals
output reg [W-1:0] data_out
);
    always @*
        begin
            case(select)
                1'b0: data_out = ch_0;
                1'b1: data_out = ch_1;
                default : data_out = ch_0;
            endcase
        end
endmodule
