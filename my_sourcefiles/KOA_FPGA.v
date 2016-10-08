`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jorge Sequeira
// 
// Create Date: 09/01/2016 06:29:42 PM
// Design Name: 
// Module Name: KOA_FPGA
// Project Name: Recursive Karatsuba Offman Multiplication
// Target Devices: 
// Tool Versions: 
// Description: RKOA optimization for DSP
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KOA_FPGA
   //#(parameter SW = 24)
    #(parameter SW = 54)
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
    //localparam level1=4;
    //localparam level2=5;
            
    ////////////////////////////////////
generate
    
    if (SW<=18) begin  : K1
        multiplier_C #(.W(SW)/*,.level(level1)*/) main(
            
            .Data_A_i(Data_A_i),
            .Data_B_i(Data_B_i),
            .Data_S_o(sgf_result_o)
        );

    end else begin : K2
        
    case (SW%2)
        0:begin  : K3
        //////////////////////////////////even//////////////////////////////////
       //Multiplier for left side and right side

            KOA_FPGA #(.SW(SW/2)/*,.level(level1)*/) left(
                
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                .sgf_result_o(/*result_left_mult*/Q_left)
            );

            KOA_FPGA #(.SW(SW/2)/*,.level(level1)*/) right(
                
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
            //segmentation registers for 64 bits
            
            /*RegisterAdd #(.W(SW/2+1)) preAreg ( //Data X input register
                            .clk(clk), 
                            .rst(rst), 
                            .load(1'b1), 
                            .D(result_A_adder[SW/2:0]), 
                            .Q(Q_result_A_adder[SW/2:0])
                        );//
                        
            RegisterAdd #(.W(SW/2+1)) preBreg ( //Data X input register
                            .clk(clk), 
                            .rst(rst), 
                            .load(1'b1), 
                            .D(result_B_adder[SW/2:0]), 
                            .Q(Q_result_B_adder[SW/2:0])
                        );//*/
           //multiplication for middle

             KOA_FPGA        #(.SW(SW/2+1)/*,.level(level1)*/) middle (

                .Data_A_i(/*Q_result_A_adder[SW/2:0]*/result_A_adder[SW/2:0]),
                .Data_B_i(/*Q_result_B_adder[SW/2:0]*/result_B_adder[SW/2:0]),
                .sgf_result_o(/*result_middle_mult[2*(SW/2)+1:0]*/Q_middle[2*(SW/2)+1:0])
            );
           
        
        
           ///Subtractors for middle
            
            substractor #(.W(SW+2)) Subtr_1 (
                .Data_A_i(/*result_middle_mult//*/Q_middle[2*(SW/2)+1:0]),
                .Data_B_i({zero1, /*result_left_mult//*/Q_left}),
                .Data_S_o(S_A[2*(SW/2)+1:0])
            );
        
            substractor #(.W(SW+2)) Subtr_2 (
                .Data_A_i(S_A[2*(SW/2)+1:0]),
                .Data_B_i({zero1, /*result_right_mult//*/Q_right[2*(SW/2)-1:0]}),
                .Data_S_o(S_B[2*(SW/2)+1:0])
            );
        
           //Final adder
            adder #(.W(4*(SW/2))) Final(
                .Data_A_i({/*result_left_mult,result_right_mult*/Q_left,Q_right[2*(SW/2)-1:0]}),
                .Data_B_i({leftside1,S_B[2*(SW/2)+1:0],rightside1}),
                .Data_S_o(Result[4*(SW/2):0])
            );

         //Final assignation
          assign sgf_result_o = Result[2*SW-1:0];
           
            
        end
    1:begin  : K4
        

        //////////////////////////////////odd//////////////////////////////////
        //Multiplier for left side and right side
           
           KOA_FPGA      #(.SW(SW/2)/*,.level(level2)*/) left_high(

                        .Data_A_i(Data_A_i[SW-1:SW/2+1]),
                        .Data_B_i(Data_B_i[SW-1:SW/2+1]),
                        .sgf_result_o(/*result_left_mult*/Q_left)
            );
            
    
            KOA_FPGA #(.SW((SW/2)+1)/*,.level(level2)*/) right_lower(
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
            
            //segmentation registers for 64 bits
                        
            /*RegisterAdd #(.W(SW/2+2)) preAreg ( //Data X input register
                            .clk(clk), 
                            .rst(rst), 
                            .load(1'b1), 
                            .D(result_A_adder), 
                            .Q(Q_result_A_adder)
                        );//
                        
            RegisterAdd #(.W(SW/2+2)) preBreg ( //Data X input register
                            .clk(clk), 
                            .rst(rst), 
                            .load(1'b1), 
                            .D(result_B_adder), 
                            .Q(Q_result_B_adder)
                        );//*/
           //multiplication for middle

            KOA_FPGA #(.SW(SW/2+2)/*,.level(level2)*/) middle (

                .Data_A_i(/*Q_result_A_adder*/result_A_adder),
                .Data_B_i(/*Q_result_B_adder*/result_B_adder),
                .sgf_result_o(/*result_middle_mult*/Q_middle)
            );
            
        
           //segmentation registers array
        
        
        
           ///Subtractors for middle
            
            substractor #(.W(2*(SW/2+2))) Subtr_1 (
                .Data_A_i(/*result_middle_mult//*/Q_middle),
                .Data_B_i({zero2, /*result_left_mult//*/Q_left}),
                .Data_S_o(S_A)
            );
        
            substractor #(.W(2*(SW/2+2))) Subtr_2 (
                .Data_A_i(S_A),
                .Data_B_i({zero1, /*result_right_mult//*/Q_right}),
                .Data_S_o(S_B)
            );
        
           //Final adder
            
            adder #(.W(4*(SW/2)+2)) Final(
                .Data_A_i({/*result_left_mult,result_right_mult*/Q_left,Q_right}),
                .Data_B_i({leftside2,S_B,rightside2}),
                .Data_S_o(Result[4*(SW/2)+2:0])
            );
           
      
             //Final assignation
          assign sgf_result_o = Result[2*SW-1:0];
           

            
        end
    endcase

end
    


endgenerate

endmodule

