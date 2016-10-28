//==================================================================================================
//  Filename      : submidRecursiveKOA.v
//  Created On    : 2016-10-27 23:28:55
//  Last Modified : 2016-10-28 08:59:19
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
`include "global.v"

module submidRecursiveKOA
    //#(parameter SW = 24, parameter precision = 0)
    #(parameter SW = 24)
    (
    input wire clk,
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output reg [2*SW-1:0] Data_S_o
    );

    ///////////////////////////////////////////////////////////
    wire [1:0] zero1;
    wire [3:0] zero2;
    assign zero1 = 2'b00;
    assign zero2 = 4'b0000;
    ///////////////////////////////////////////////////////////
    wire [SW/2-1:0] rightside1;
    wire [SW/2:0] rightside2;
    //Modificacion: Leftside signals are added. They are created as zero fillings as preparation for the final adder.
    wire [SW/2-3:0] leftside1;
    wire [SW/2-4:0] leftside2;

 reg [4*(SW/2)+2:0] Result;
   
    reg [4*(SW/2)-1:0] sgf_r;

    assign rightside1 = {(SW/2){1'b0}};
    assign rightside2 = {(SW/2+1){1'b0}};

    assign leftside1 = {(SW/2-4){1'b0}}; //Se le quitan dos bits con respecto al right side, esto porque al sumar, se agregan bits, esos hacen que sea diferente
    assign leftside2 = {(SW/2-5){1'b0}};

    localparam half = SW/2;

generate

    case (SW%2)
        0:begin : EVEN1

            reg [SW/2:0] result_A_adder;
            reg [SW/2:0] result_B_adder;
            reg [SW-1:0] Q_left;
            reg [SW-1:0] Q_right;
            reg [SW+1:0] Q_middle;
            reg [SW-1:0] Q_left_reg;
            reg [SW-1:0] Q_right_reg;
            reg [SW+1:0] Q_middle_reg;
            reg [2*(SW/2+2)-1:0] S_A;
            reg [SW+1:0] S_B; //SW+2

          csubRecursiveKOA #(.SW(SW/2)) left(
           //     .clk(clk),
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                .Data_S_o(Q_left)
            );
            
          csubRecursiveKOA #(.SW(SW/2)) right(
         //       .clk(clk),
                .Data_A_i(Data_A_i[SW-SW/2-1:0]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(Q_right)
            );
    
          csubRecursiveKOA #(.SW((SW/2)+1)) middle (
           //     .clk(clk),
                .Data_A_i(result_A_adder),
                .Data_B_i(result_B_adder),
                .Data_S_o(Q_middle)
            );

          always @(posedge clk) begin : SEGMENTATION
                 Q_left_reg = Q_left;
                 Q_right_reg= Q_right;
                 Q_middle_reg = Q_middle;
          end

           always @* begin : EVEN

                 result_A_adder <= (Data_A_i[((SW/2)-1):0] + Data_A_i[(SW-1) -: SW/2]);

                 result_B_adder <= (Data_B_i[((SW/2)-1):0] + Data_B_i[(SW-1) -: SW/2]);

                 S_B <= (Q_middle_reg - Q_left_reg - Q_right_reg);

                 Data_S_o <= {leftside1,S_B,rightside1} + {Q_left_reg,Q_right_reg};
                 
           end
            
        end
    1:begin : ODD1

                reg [SW/2+1:0] result_A_adder;
                reg [SW/2+1:0] result_B_adder;
                reg [2*(SW/2)-1:0]   Q_left;
                reg [2*(SW/2+1)-1:0] Q_right;
                reg [2*(SW/2+2)-1:0] Q_middle;
                reg [2*(SW/2)-1:0]   Q_left_reg;
                reg [2*(SW/2+1)-1:0] Q_right_reg;
                reg [2*(SW/2+2)-1:0] Q_middle_reg;
                reg [2*(SW/2+2)-1:0] S_A;
                reg [SW+4-1:0] S_B;

          csubRecursiveKOA #(.SW(SW/2)) left(
           //     .clk(clk),
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                .Data_S_o(Q_left)
            );
            
          csubRecursiveKOA #(.SW((SW/2)+1)) right(
           //     .clk(clk),
                .Data_A_i(Data_A_i[SW-SW/2-1:0]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(Q_right)
            );
        
          csubRecursiveKOA #(.SW(SW/2+2)) middle (
               // .clk(clk),
                .Data_A_i(result_A_adder),
                .Data_B_i(result_B_adder),
                .Data_S_o(Q_middle)
            );

          always @(posedge clk) begin : SEGMENTATION1
                 Q_left_reg = Q_left;
                 Q_right_reg = Q_right;
                 Q_middle_reg = Q_middle;
          end

            always @* begin : ODD
                 result_A_adder <= (Data_A_i[SW-SW/2-1:0] + Data_A_i[SW-1:SW-SW/2]);
                 result_B_adder <= Data_B_i[SW-SW/2-1:0] + Data_B_i[SW-1:SW-SW/2];
                 S_B <= (Q_middle_reg - Q_left_reg - Q_right_reg);
                 Data_S_o <= {leftside2,S_B,rightside2} + {Q_left_reg,Q_right_reg};
           end

        end
    endcase


endgenerate

endmodule
