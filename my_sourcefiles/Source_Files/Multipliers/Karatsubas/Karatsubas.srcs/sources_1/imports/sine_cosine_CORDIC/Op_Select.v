`timescale 1ns / 1ps

module Op_Select
(
input wire variable,
input wire sign,
output reg operation
);
always @*
begin
    operation = ~(variable ^ sign);
end  
endmodule
