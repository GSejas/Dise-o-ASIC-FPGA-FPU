//==================================================================================================
//  Filename      : Testbench_FPU_multiplication.v
//  Created On    : 2016-09-15 17:53:59
//  Last Modified : 2016-10-23 11:48:21
//  Revision      :
//
//  Description   :
//
//
//==================================================================================================
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/28/2016 08:42:24 AM
// Design Name:
// Module Name: Testbench_FPU_multiplication
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

module Testbench_FPU_multiplication();

	parameter PERIOD = 10;


	/*parameter W = 32;
	parameter EW = 8;
	parameter SW = 23;//*/

	parameter W = 64;
	parameter EW = 11;
	parameter SW = 52;// */

	reg clk;

    //INPUT signals
	reg rst;
	reg beg_FSM;
	reg ack_FSM;

	//Oper_Start_in signals
	reg [W-1:0] Data_MX;
	reg [W-1:0] Data_MY;

	//Round signals signals
	reg [1:0] round_mode;

	//OUTPUT SIGNALS
	wire overflow_flag;
	wire underflow_flag;
	wire ready;
	wire [W-1:0] final_result_ieee;



        FPU_Multiplication_Function_v2 #(.W(W),.EW(EW),.SW(SW)) uut(
        .clk(clk),
        .rst(rst),
        .beg_FSM(beg_FSM),
        .ack_FSM(ack_FSM),
        .Data_MX(Data_MX),
        .Data_MY(Data_MY),
        .round_mode(round_mode),
        .overflow_flag(overflow_flag),
        .underflow_flag(underflow_flag),
        .ready(ready),
        .final_result_ieee(final_result_ieee)
        );


	reg [W-1:0] Array_IN [0:((2**PERIOD)-1)];
    reg [W-1:0] Array_IN_2 [0:((2**PERIOD)-1)];
    integer contador;
    integer FileSaveData;
    integer Cont_CLK;
    integer Recept;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        beg_FSM = 0;
        ack_FSM = 0;
        Data_MX = 0;
        Data_MY = 0;
        round_mode = 2'b00;

        //Abre el archivo testbench
        FileSaveData = $fopen("ResultadoXilinxFLM.txt","w");

        //Inicializa las variables del testbench
        contador = 0;
        Cont_CLK = 0;
        Recept = 1;

        // Wait 100 ns for global reset to finish

        #100 rst = 0;



    end

    //**************************** Se lee el archivo txt y se almacena en un arrays***************************************************//

    initial begin
        $readmemh("Hexadecimal_A.txt", Array_IN);
        $readmemh("Hexadecimal_B.txt", Array_IN_2);
    end


    always @(posedge clk) begin
        if(rst) begin
            contador = 0;
            Cont_CLK = 0;
        end
        else begin
            if (contador == (2**PERIOD)) begin
                $fclose(FileSaveData);
                $finish;
            end
            else begin
                if(Cont_CLK ==1) begin
                    contador = contador + 1;
                    beg_FSM = 0;
                    Data_MX = Array_IN[contador];
                    Data_MY = Array_IN_2[contador];
                    Cont_CLK = Cont_CLK + 1;
                    ack_FSM = 0;
                end
                else if(Cont_CLK ==2) begin
                    ack_FSM = 0;
                    beg_FSM = 1;
                    Cont_CLK = Cont_CLK +1 ;
                end
                else begin
                    ack_FSM = 0;
                    Cont_CLK = Cont_CLK + 1;
                    beg_FSM = 0;
                end
                if(ready==1) begin
                    ack_FSM = 1;
                    Cont_CLK = 0;
                end

                if(ready==1 && ack_FSM) begin
                    Cont_CLK = 0;
                end
            end
        end
    end

    // Recepción de datos y almacenamiento en archivo*************
    always @(posedge clk) begin
        if(ready) begin
            if(Recept == 1) begin
                $fwrite(FileSaveData,"%h\n",final_result_ieee);
                Recept = 0;
            end
        end
        else begin
            Recept = 1;
        end
    end

    //******************************* Se ejecuta el CLK ************************

                initial forever #5 clk = ~clk;

endmodule
