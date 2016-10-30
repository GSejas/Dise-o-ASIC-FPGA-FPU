`timescale 1ns / 1ps

module Simple_Subt #(parameter W=8,N=3) /*#(W=11)*/   //tam�o del exponente en 32 y 64 bits respectivamente
(
input wire [W-1:0] A,
input wire [N-1:0] B,
output wire [W-1:0] Y
);
assign Y = A-B;
endmodule
