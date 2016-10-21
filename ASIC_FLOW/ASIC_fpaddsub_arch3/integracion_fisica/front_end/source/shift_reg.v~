//==================================================================================================
//  Filename      : shift_reg.v
//  Created On    : 2016-09-25 00:24:05
//  Last Modified : 2016-09-25 09:23:28
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : This is a parameterized shift register.
//
//
//==================================================================================================
`timescale 1ns / 1ps

module ShiftRegister
  # (parameter W = 16)
  (
    input wire clk, //system clock
    input wire rst, //system reset
    input wire load, //load signal
    input wire in_bit, //input signal
    output reg [W-1:0] Q //output signal
    );

  always @(posedge clk, posedge rst)
    if(rst)
      Q <= 0;
    else if(load)
      Q <= {in_bit, Q[W-1:1]};
    else
      Q <= Q;

endmodule
