//==================================================================================================
//  Filename      : DECO_CORDIC_OP.v
//  Created On    : 2016-10-03 13:00:49
//  Last Modified : 2016-10-03 14:44:53
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : DECODER TO TO SELECT THE THIRD MUX AND INVERT SIGN
//
//
//==================================================================================================
`timescale 1ns / 1ps


module DECO_CORDIC_EXT #(parameter W = 32)(
   input wire [W-1:0] data_i,
   input wire         operation,
   input wire [1:0]   shift_region_flag,
   output reg         sel_mux_3,
   output reg [W-1:0] data_out
   );


   always @(*) begin
     if(operation == 1'b0)
        begin  //COSENO
          case (shift_region_flag)
            2'b00  : begin
                        sel_mux_3 = 1'b0;
                        data_out = data_i;
                     end
            2'b01  : begin
                        sel_mux_3 = 1'b1;
                        data_out = {~data_i[W-1],data_i[W-2:0]};
                     end
            2'b10  : begin
                        sel_mux_3 = 1'b1;
                        data_out = data_i;
                     end
            2'b11  : begin
                        sel_mux_3 = 1'b0;
                        data_out = data_i;
                     end
            default: begin
                        sel_mux_3 = 1'b0;
                        data_out = data_i;
                     end
          endcase
        end
      else begin  ///SENO
          case (shift_region_flag)
            2'b00  : begin
                        sel_mux_3 = 1'b1;
                        data_out = data_i;
                     end
            2'b01  : begin
                        sel_mux_3 = 1'b0;
                        data_out = data_i;
                     end
            2'b10  : begin
                        sel_mux_3 = 1'b0;
                        data_out = {~data_i[W-1],data_i[W-2:0]};;
                     end
            2'b11  : begin
                        sel_mux_3 = 1'b1;
                        data_out = data_i;
                     end
            default: begin
                        sel_mux_3 = 1'b1;
                        data_out = data_i;
                     end
          endcase
      end
   end


endmodule




