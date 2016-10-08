`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2016 11:26:28 AM
// Design Name: 
// Module Name: Sgf_Multiplication
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sgf_Multiplication

  //  #(parameter SW = 24)
 
    #(parameter SW = 54)

    (
    input wire clk,
    input wire rst,
    input wire load_b_i,
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output wire [2*SW-1:0] sgf_result_o
    );
    
    //wire [SW-1:0] Data_A_i;
    //wire [SW-1:0] Data_B_i;
    
    
    //wire [2*(SW/2)-1:0] result_left_mult;
    //wire [2*(SW/2+1)-1:0] result_right_mult;
    wire [SW/2+1:0] result_A_adder;
    //wire [SW/2+1:0] Q_result_A_adder;
    wire [SW/2+1:0] result_B_adder;
    //wire [SW/2+1:0] Q_result_B_adder;
    //wire [2*(SW/2+2)-1:0] result_middle_mult;

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
    
    wire [4*(SW/2)-1:0] sgf_r; 
    
    assign rightside1 = (SW/2) *1'b0;
    assign rightside2 = (SW/2+1)*1'b0;
    localparam half = SW/2;
    //localparam level1=4;
    //localparam level2=5;
            
    ////////////////////////////////////
generate
    case (SW%2)
        0:begin : K1
        //////////////////////////////////even//////////////////////////////////
       //Multiplier for left side and right side
        
            multiplier #(.W(SW/2)/*,.level(level1)*/) left(
                .clk(clk),
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                .Data_S_o(/*result_left_mult*/Q_left)
            );
            
            /*RegisterAdd #(.W(SW)) leftreg( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(1'b1), 
                .D(result_left_mult), 
                .Q(Q_left)
            );//*/
    
            multiplier #(.W(SW/2)/*,.level(level1)*/) right(
                .clk(clk),
                .Data_A_i(Data_A_i[SW-SW/2-1:0]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(/*result_right_mult[2*(SW/2)-1:0]*/Q_right[2*(SW/2)-1:0])
            );
        
            /*RegisterAdd #(.W(SW)) rightreg( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(1'b1), 
                .D(result_right_mult[2*(SW/2)-1:0]), 
                .Q(Q_right[2*(SW/2)-1:0])
            );//*/
        
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
        
            multiplier #(.W(SW/2+1)/*,.level(level1)*/) middle (
                .clk(clk),
                .Data_A_i(/*Q_result_A_adder[SW/2:0]*/result_A_adder[SW/2:0]),
                .Data_B_i(/*Q_result_B_adder[SW/2:0]*/result_B_adder[SW/2:0]),
                .Data_S_o(/*result_middle_mult[2*(SW/2)+1:0]*/Q_middle[2*(SW/2)+1:0])
            );
        
           //segmentation registers array
        
        
            /*RegisterAdd #(.W(SW+2)) midreg ( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(1'b1), 
                .D(result_middle_mult[2*(SW/2)+1:0]), 
                .Q(Q_middle[2*(SW/2)+1:0])
            );//*/
        
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
                .Data_B_i({S_B[2*(SW/2)+1:0],rightside1}),
                .Data_S_o(Result[4*(SW/2):0])
            );
           
           //Final Register
           
            
            
            RegisterAdd #(.W(4*(SW/2))) finalreg ( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(load_b_i), 
                .D(Result[4*(SW/2)-1:0]), 
                .Q({sgf_result_o})
            );
            
        end
    1:begin : K2
        //////////////////////////////////odd//////////////////////////////////
        //Multiplier for left side and right side
           
           multiplier #(.W(SW/2)/*,.level(level2)*/) left(
                        .clk(clk),
                        .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                        .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                        .Data_S_o(/*result_left_mult*/Q_left)
            );
            
            /*RegisterAdd #(.W(2*(SW/2))) leftreg( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(1'b1), 
                .D(result_left_mult), 
                .Q(Q_left)
            );//*/
    
            multiplier #(.W((SW/2)+1)/*,.level(level2)*/) right(
                .clk(clk),
                .Data_A_i(Data_A_i[SW-SW/2-1:0]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(/*result_right_mult*/Q_right)
            );
        
            /*RegisterAdd #(.W(2*((SW/2)+1))) rightreg( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(1'b1), 
                .D(result_right_mult), 
                .Q(Q_right)
            );//*/
        
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
        
            multiplier #(.W(SW/2+2)/*,.level(level2)*/) middle (
                .clk(clk),
                .Data_A_i(/*Q_result_A_adder*/result_A_adder),
                .Data_B_i(/*Q_result_B_adder*/result_B_adder),
                .Data_S_o(/*result_middle_mult*/Q_middle)
            );
        
           //segmentation registers array
        
        
            /*RegisterAdd #(.W(2*((SW/2)+2))) midreg ( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(1'b1), 
                .D(result_middle_mult), 
                .Q(Q_middle)
            );//*/
        
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
                .Data_B_i({S_B,rightside2}),
                .Data_S_o(Result[4*(SW/2)+2:0])
            );
           
           //Final Register
           
            
            
            RegisterAdd #(.W(4*(SW/2)+2)) finalreg ( //Data X input register
                .clk(clk), 
                .rst(rst), 
                .load(load_b_i), 
                .D(Result[2*SW-1:0]), 
                .Q({sgf_result_o})
            );
        end
    endcase
endgenerate
`ifdef PRESTO
	always $display("Instanciacion: Mult de Francis, SW: %d",SW);
`endif
endmodule

