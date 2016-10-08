`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jorge Sequeira
// 
// Create Date: 08/31/2016 03:34:58 PM
// Design Name: 
// Module Name: KOA_c
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Recursive Karasuba Parameterized Algorithm
// 
// Dependencies: 
// 
// Revision:
// Revision 0.03 - File Created
// Additional Comments: La primera version de este modulo se puede encontrar en la misma carpeta madre.
// The reason for a second version is the way the numbers with lenght lower than 8 are treated. Here, we change that
// by using an at the start before the case, so a multiplier below l = 7 is never instatiated.
// 
// Revision 0.04 
//
// 1. Width of KOA multipliers in the even case was fixed from the original version
// 2. Zero padding in the adders was fixed.
// 3. Changed the adder-sub description
//////////////////////////////////////////////////////////////////////////////////


module KOA_c_2

    
  //#(parameter SW = 24, parameter precision = 0, parameter depth = 4)
 
    #(parameter SW = 54, parameter precision = 1, parameter depth = 4)
	(
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output wire [2*SW-1:0] sgf_result_o
    );
    

    wire [SW/2+1:0] result_A_adder;
    wire [SW/2+1:0] result_B_adder;


    wire [2*(SW/2)-1:0] Q_left;
    wire [2*(SW/2+1)-1:0] Q_right;
    wire [2*(SW/2+2)-1:0] Q_middle;

    wire [2*(SW/2+2)-1:0] S_A;
    wire [2*(SW/2+2)-1:0] S_B;

    wire [4*(SW/2)+2:0] Result;
    ///////////////////////////////////////////////////////////
    wire [1:0] zero1;
    wire [3:0] zero2;
    assign zero1 =2'b00;
    assign zero2 =4'b0000;
    ///////////////////////////////////////////////////////////
    wire [SW/2-1:0] rightside1;
    wire [SW/2:0] rightside2;
    //Modificacion: Leftside signals are added. They are created as zero fillings as preparation for the final adder.
    wire [SW/2-3:0] leftside1;
    wire [SW/2-4:0] leftside2;


    wire [4*(SW/2)-1:0] sgf_r; 
    
    assign rightside1 = (SW/2) *1'b0;
    assign rightside2 = (SW/2+1)*1'b0;

    assign leftside1 = (SW/2-2) *1'b0; //Se le quitan dos bits con respecto al right side, esto porque al sumar, se agregan bits, esos hacen que sea diferente
    assign leftside2 = (SW/2-3)*1'b0;

    localparam half = SW/2;
    localparam next_level = depth - 1;
    //localparam level1=4;
    //localparam level2=5;
            
    ////////////////////////////////////
generate
    
    if (depth == 1) begin : K1

       assign sgf_result_o = Data_A_i * Data_B_i;

    end else begin  : K3
        
    case (SW%2)


        0:begin  : K4
        //////////////////////////////////even//////////////////////////////////
       //Multiplier for left side and right side

            KOA_c_2 #(.SW(SW/2), .precision(precision), .depth(next_level) /*,.level(level1)*/) left(
                
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                .sgf_result_o(/*result_left_mult*/Q_left)
            );

            KOA_c_2 #(.SW(SW/2), .precision(precision), .depth(next_level)/*,.level(level1)*/) right(
                
                .Data_A_i(Data_A_i[SW-SW/2-1:0]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .sgf_result_o(/*result_right_mult[2*(SW/2)-1:0]*/Q_right[2*(SW/2)-1:0])
            );          

           //Adders for middle 
        
            adder #(.W(SW/2)) A_operation (
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_A_i[SW-SW/2-1:0]),
                .Data_S_o(result_A_adder[SW/2:0])
            );
        
            adder #(.W(SW/2)) B_operation (
                .Data_A_i(Data_B_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(result_B_adder[SW/2:0])
            );
  

             KOA_c_2        #(.SW(SW/2+1), .precision(precision), .depth(next_level)/*,.level(level1)*/) middle (

                .Data_A_i(/*Q_result_A_adder[SW/2:0]*/result_A_adder[SW/2:0]),
                .Data_B_i(/*Q_result_B_adder[SW/2:0]*/result_B_adder[SW/2:0]),
                .sgf_result_o(/*result_middle_mult[2*(SW/2)+1:0]*/Q_middle[2*(SW/2)+1:0])
            );


          assign Result[4*(SW/2):0] = {Q_left,Q_right}                                     +  /*result_left_mult,result_right_mult*/
                                    {leftside1,                 //zero padding
                                    Q_middle[2*(SW/2)+1:0]                 - 
                                    {zero1, /*result_left_mult//*/Q_left}  - 
                                    {zero1, /*result_right_mult//*/Q_right[2*(SW/2)-1:0]},
                                    rightside1};                 //zero padding

         //Final assignation
          assign sgf_result_o = Result[2*SW-1:0];
           
            
        end
`ifdef PRESTO
    always $display("Instanciacion Par, SW: %d",SW);
`endif
    1:begin  : K5
        

        //////////////////////////////////odd//////////////////////////////////
        //Multiplier for left side and right side
           
           KOA_c_2      #(.SW(SW/2), .precision(precision), .depth(next_level)/*,.level(level2)*/) left_high(

                        .Data_A_i(Data_A_i[SW-1:SW/2+1]),
                        .Data_B_i(Data_B_i[SW-1:SW/2+1]),
                        .sgf_result_o(/*result_left_mult*/Q_left)
            );
            
    
            KOA_c_2 #(.SW((SW/2)+1), .precision(precision), .depth(next_level)/*,.level(level2)*/) right_lower(
            /// Modificacion: Tamaño de puerto cambia de SW/2+1 a SW/2+2. El compilador lo pide por alguna razon.

                .Data_A_i(Data_A_i[SW/2:0]),
                .Data_B_i(Data_B_i[SW/2:0]),
                .sgf_result_o(/*result_right_mult*/Q_right)
            );       

           //Adders for middle 
        
            adder #(.W(SW/2+1)) A_operation (
                .Data_A_i({1'b0,Data_A_i[SW-1:SW-SW/2]}),
                .Data_B_i(Data_A_i[SW-SW/2-1:0]),
                .Data_S_o(result_A_adder)
            );
        
            adder #(.W(SW/2+1)) B_operation (
                .Data_A_i({1'b0,Data_B_i[SW-1:SW-SW/2]}),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(result_B_adder)
            );
            

           //multiplication for middle

            KOA_c_2 #(.SW(SW/2+2), .precision(precision), .depth(next_level)/*,.level(level2)*/) middle (

                .Data_A_i(/*Q_result_A_adder*/result_A_adder),
                .Data_B_i(/*Q_result_B_adder*/result_B_adder),
                .sgf_result_o(/*result_middle_mult*/Q_middle)
            );
            
        
           //segmentation registers array
        
          
          assign Result[4*(SW/2)+2:0] = {/*result_left_mult,result_right_mult*/Q_left,Q_right} + 
                                        
                                        {leftside2, Q_middle                                  - 
                                                    {zero2, /*result_left_mult//*/Q_left}     -
                                                    {zero1, /*result_right_mult//*/Q_right} ,
                                        rightside2};
      
             //Final assignation
          assign sgf_result_o = Result[2*SW-1:0];
           
`ifdef PRESTO
    always $display("Instanciacion Impar, SW: %d, nivel = ",SW);
`endif
            
        end
    endcase

end
    


endgenerate

endmodule

