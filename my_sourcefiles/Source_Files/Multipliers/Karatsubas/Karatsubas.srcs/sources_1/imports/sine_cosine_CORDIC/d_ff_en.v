`timescale 1ns / 1ps

module d_ff_en	# (parameter W = 32)
(
input wire clk, //system clock
input wire rst, //system reset
input wire enable, //load signal
input wire [W-1:0] D, //input signal
output reg [W-1:0] Q //output signal
);
always @(posedge clk,posedge rst)
begin
    if(rst)
        Q <= 0;
    else if(enable)
        Q <= D;
    else
        Q <= Q;
end
endmodule
