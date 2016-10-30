`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/29/2016 05:57:16 AM
// Design Name:
// Module Name: Testbench_FPU_Add_Subt
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

module Testbench_FPU_mult();

parameter PERIOD = 10;

`ifdef SINGLE
    parameter W = 32;
    parameter EW = 8;
    parameter SW = 23;
    parameter SWR = 26;
    parameter EWR = 5;//
`endif

`ifdef DOUBLE
    parameter W = 64;
    parameter EW = 11;
    parameter SW = 52;
    parameter SWR = 55;
    parameter EWR = 6;
`endif
        reg clk;

        //INPUT signals
		reg rst;
		reg beg_FSM;
		reg ack_FSM;

		//Oper_Start_in signals
		reg [W-1:0] Data_X;
		reg [W-1:0] Data_Y;
		//reg add_subt;

		//Round signals signals
		reg [1:0] r_mode;

		//OUTPUT SIGNALS
		wire overflow_flag;
		wire underflow_flag;
		wire ready;
		wire [W-1:0] final_result_ieee;

    FPU_Multiplication_Function #(
            .W(W),
            .EW(EW),
            .SW(SW)
        ) inst_FPU_Multiplication_Function (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (beg_FSM),
            .ack_FSM           (ack_FSM),
            .Data_MX           (Data_X),
            .Data_MY           (Data_Y),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (ready),
            .final_result_ieee (final_result_ieee)
        );



        reg [W-1:0] Array_IN_1 [0:((2**PERIOD)-1)];
        reg [W-1:0] Array_IN_2 [0:((2**PERIOD)-1)];
        integer contador;
        integer FileSaveData;


                initial begin
                    // Initialize Inputs
                    clk = 0;
                    rst = 1;
                    beg_FSM = 0;
                    ack_FSM = 0;
                    Data_X = 0;
                    Data_Y = 0;
                    r_mode = 2'b00;



                    //Abre el archivo testbench
                    // FileSaveData = $fopen("vector/add_single/ResultadoXilinxFLM.txt","w");
                    // $readmemh("vector/add_single/Hexadecimal_A.txt", Array_IN_1);
                    // $readmemh("vector/add_single/Hexadecimal_B.txt", Array_IN_2);

                    add_subt = 0;
                    FileSaveData = $fopen("ResultadoXilinxFLM_MULT.txt","w");
                    $readmemh("Hexadecimal_A.txt", Array_IN_1);
                    $readmemh("Hexadecimal_B.txt", Array_IN_2);
                    run_Arch2(FileSaveData,2**PERIOD);



                    #100 rst = 0;
                    $finish;
                    //Add stimulus here
                end


             //******************************* Se ejecuta el CLK ************************

                initial forever #5 clk = ~clk;

                task run_Arch2;
                    input integer FDataO;
                    input integer Vector_size;
                begin

                    rst = 0;
                    #15 rst = 1;
                    #15 rst = 0;
                    beg_FSM = 0;
                    ack_FSM = 0;
                    contador = 0;
                    repeat(Vector_size) @(negedge clk) begin

                            //input the new values inside the operator
                            Data_X = Array_IN_1[contador];
                            Data_Y = Array_IN_2[contador];
                            #(PERIOD/4) beg_FSM = 1;

                            //Wait for the operation ready
                            @(posedge ready) begin
                                #(PERIOD+2);
                                ack_FSM = 1;
                                #4;
                                $fwrite(FDataO,"%h\n",final_result_ieee);
                            end
                            @(negedge clk) begin
                                ack_FSM = 0;
                            end
                            contador = contador + 1;

                    end
                    $fclose(FDataO);
                end



                endtask
endmodule
