//==================================================================================================
//  Filename      : DECO_CORDIC_OP2.v
//  Created On    : 2016-11-02 00:31:21
//  Last Modified : 2016-11-02 00:35:38
//  Revision      : 
//  Author        : Jorge Esteban Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira03@gmail.com
//
//  Description   : 
//
//
//==================================================================================================

`timescale 1ns / 1ps


module DECO_CORDIC_EXT2 (
   input wire         data_i,
   input wire         operation,
   input wire [1:0]   shift_region_flag,
   output reg         sel_mux_3,
   output reg         data_out_CORDECO
 ); 


   always @(*) begin
     if(operation == 1'b0)
        begin  //COSENO
          case (shift_region_flag)
            2'b00  : begin
                        sel_mux_3 = 1'b0;
                        data_out_CORDECO = data_i;
                     end
            2'b01  : begin
                        sel_mux_3 = 1'b1;
                        data_out_CORDECO = ~data_i;
                     end
            2'b10  : begin
                        sel_mux_3 = 1'b1;
                        data_out_CORDECO = data_i;
                     end
            2'b11  : begin
                        sel_mux_3 = 1'b0;
                        data_out_CORDECO = data_i;
                     end
          endcase
        end
      else begin  ///SENO
          case (shift_region_flag)
            2'b00  : begin
                        sel_mux_3 = 1'b1;
                        data_out_CORDECO = data_i;
                     end
            2'b01  : begin
                        sel_mux_3 = 1'b0;
                        data_out_CORDECO = data_i;
                     end
            2'b10  : begin
                        sel_mux_3 = 1'b0;
                        data_out_CORDECO = ~data_i;
                     end
            2'b11  : begin
                        sel_mux_3 = 1'b1;
                        data_out_CORDECO = data_i;
                     end 
          endcase
      end
   end


endmodule
