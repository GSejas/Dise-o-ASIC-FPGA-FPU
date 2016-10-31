`timescale 1ns / 1ps

module demux_1x3
(
input wire data,
input wire [1:0] select,
output reg ch1,
output reg ch2,
output reg ch3
);
always @*
    begin
        case(select)
            2'b00:
            begin
                ch1 = data;
                ch2 = 1'b0;
                ch3 = 1'b0;
            end
            2'b01:
            begin
                ch1 = 1'b0;
                ch2 = data;
                ch3 = 1'b0;
            end
            2'b10:
            begin
                ch1 = 1'b0;
                ch2 = 1'b0;
                ch3 = data;
            end
            default:
            begin
                ch1 = 1'b0;
                ch2 = data;
                ch3 = 1'b0;
            end
        endcase
    end
endmodule
