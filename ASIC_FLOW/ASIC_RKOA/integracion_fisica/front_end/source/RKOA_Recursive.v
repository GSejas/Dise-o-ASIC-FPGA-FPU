//==================================================================================================
//  Filename      : RKOA_Recursive.v
//  Created On    : 2016-10-25 00:58:20
//  Last Modified : 2016-10-25 02:17:13
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



module Recursive_KOA
    //#(parameter SW = 24, parameter precision = 0)
    #(parameter SW = 23)
    (
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output reg [2*SW-1:0] sgf_result_o
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


    reg [4*(SW/2)-1:0] sgf_r = 0;

    assign rightside1 = (SW/2) *1'b0;
    assign rightside2 = (SW/2+1)*1'b0;

    assign leftside1 = (SW/2-2) *1'b0; //Se le quitan dos bits con respecto al right side, esto porque al sumar, se agregan bits, esos hacen que sea diferente
    assign leftside2 = (SW/2-1)*1'b0;

    localparam half = SW/2;


        `define STOP_SW1 3
        `define STOP_SW2 4


generate

    //assign i = Stop_I;
    if (SW <=`STOP_SW1 || SW <=`STOP_SW2) begin
        always @* begin
             sgf_result_o <= Data_A_i * Data_B_i;
        end
    end else begin


    case (SW%2)
        0:begin : EVEN1
            wire [SW-1:0] Q_left;
            wire [SW-1:0] Q_right;
            wire [SW+1:0] Q_middle;
            reg [SW-1:0]   Q_left_temp = 0;
            reg [SW-1:0] Q_right_temp = 0;
            reg [SW+1:0] Q_middle_temp = 0;
            reg [SW/2:0] result_A_adder = 0;
            reg [SW/2:0] result_B_adder = 0;
            reg [2*(SW/2+2)-1:0] S_A = 0;
            reg [2*(SW/2+2)-1:0] S_B = 0;

        //////////////////////////////////even//////////////////////////////////

                Recursive_KOA #(.SW(SW/2))   left_high (
                    .Data_A_i      (Data_A_i[(SW-1) -: SW/2]),
                    .Data_B_i      (Data_B_i[(SW-1) -: SW/2]),
                    .sgf_result_o  (Q_left[SW-1:0]));

                Recursive_KOA #(.SW(SW/2))   right_lower (
                    .Data_A_i      (Data_A_i[((SW/2)-1):0]),
                    .Data_B_i      (Data_B_i[((SW/2)-1):0]),
                    .sgf_result_o  (Q_right [SW-1:0])
                    );

                Recursive_KOA #(.SW((SW/2)+1)) middle (
                    .Data_A_i      (result_A_adder),
                    .Data_B_i      (result_B_adder),
                    .sgf_result_o  (Q_middle)
                    );

           always @* begin : EVEN

                 Q_left_temp <= Q_left;

                 Q_right_temp <= Q_right;

                 Q_middle_temp <= Q_middle;

                 result_A_adder <= (Data_A_i[((SW/2)-1):0] + Data_A_i[(SW-1) -: SW/2]);

                 result_B_adder <= (Data_B_i[((SW/2)-1):0] + Data_B_i[(SW-1) -: SW/2]);

                 S_B <= ((Q_middle_temp - Q_left_temp) - {zero1,Q_right_temp});

                 sgf_result_o[2*SW-1:0] <= {S_B[2*(SW/2)+1:0],rightside1} + {Q_left_temp,Q_right_temp[2*(SW/2)-1:0]};

           end

        end
    1:begin : ODD1

                wire [2*(SW/2)-1:0]   Q_left;
                wire [2*(SW/2+1)-1:0] Q_right;
                wire [2*(SW/2+2)-1:0] Q_middle;
                reg [2*(SW/2)-1:0]   Q_left_temp;
                reg [2*(SW/2+1)-1:0] Q_right_temp;
                reg [2*(SW/2+2)-1:0] Q_middle_temp;
                reg [SW/2+1:0] result_A_adder;
                reg [SW/2+1:0] result_B_adder;
                reg [2*(SW/2+2)-1:0] S_A;
                reg [2*(SW/2+2)-1:0] S_B;

                Recursive_KOA #(.SW(SW/2))     left_high (
                    .Data_A_i      (Data_A_i[SW-1:SW/2+1]),
                    .Data_B_i      (Data_B_i[SW-1:SW/2+1]),
                    .sgf_result_o  (Q_left)
                    );

                Recursive_KOA #(.SW((SW/2)+1)) right_lower (
                    .Data_A_i      (Data_A_i[SW/2:0]),
                    .Data_B_i      (Data_B_i[SW/2:0]),
                    .sgf_result_o  (Q_right)
                    );

                Recursive_KOA #(.SW((SW/2)+2)) middle (
                    .Data_A_i      (result_A_adder),
                    .Data_B_i      (result_B_adder),
                    .sgf_result_o  (Q_middle)
                    );

            always @* begin : ODD

                Q_left_temp <= Q_left;

                Q_right_temp <= Q_right;

                Q_middle_temp <= Q_middle;

                 result_A_adder <= (Data_A_i[SW-SW/2-1:0] + Data_A_i[SW-1:SW-SW/2]);

                 result_B_adder <= Data_B_i[SW-SW/2-1:0] + Data_B_i[SW-1:SW-SW/2];

                 S_B <= (Q_middle_temp - (Q_left_temp + Q_right_temp));

                 sgf_result_o<= {S_B,rightside2} + {Q_left_temp,Q_right_temp};
                 //sgf_result_o <= Result[2*SW-1:0];
           end


            //assign sgf_result_o = Result[2*SW-1:0];

        end
    endcase

end



endgenerate

endmodule
