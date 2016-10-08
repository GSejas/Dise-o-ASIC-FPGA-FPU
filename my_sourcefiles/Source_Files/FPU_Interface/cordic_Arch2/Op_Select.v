//==================================================================================================
//  Filename      : Op_Select.v
//  Created On    : 2016-10-04 11:16:40
//  Last Modified : 2016-10-04 11:16:41
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

module Op_Select
(
input wire variable, //Variable X or Y
input wire sign,
output reg operation
);
always @*
begin
    operation = ~(variable ^ sign);
end
endmodule
