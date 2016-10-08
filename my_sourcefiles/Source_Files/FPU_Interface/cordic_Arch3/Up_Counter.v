//==================================================================================================
//  Filename      : Up_Counter.v
//  Created On    : 2016-10-03 14:44:10
//  Last Modified : 2016-10-03 16:29:50
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

module Up_counter #(parameter COUNTER_WIDTH = 3) (
   input wire clk,
   input wire rst,
   input wire enable,
   output wire [COUNTER_WIDTH-1:0] c_output_W
      );

   reg [COUNTER_WIDTH-1:0] temp = {COUNTER_WIDTH{1'b0}};

   always @(posedge clk) begin

      if (rst)
         temp <= {COUNTER_WIDTH{1'b0}};
      else if (enable)
         begin
         temp <= temp + 1'b1;
         end
   end

   assign c_output_W = temp;

endmodule
