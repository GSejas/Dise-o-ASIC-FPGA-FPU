//==================================================================================================
//  Filename      : Testbench_FPUv1_Interface.v
//  Created On    : 2016-10-30 18:45:24
//  Last Modified : 2016-10-30 18:45:27
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
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/29/2016 05:57:16 AM
// Design Name:
// Module Name: Testbench_FPU
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

module Testbench_FPU_Mark1();

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
        reg begin_operation;
        reg ack_operation;
        reg [2:0] operation;
        //Oper_Start_in signals
        reg [W-1:0] Data_1;
        reg [W-1:0] Data_2;
        reg [1:0] region_flag;
        //reg add_subt;

        //Round signals signals
        reg [1:0] r_mode;

        //OUTPUT SIGNALS
        wire overflow_flag;
        wire underflow_flag;
        wire operation_ready;

        wire NaN_flag;
        wire [W-1:0] op_result;

// LOS CODIGOS PARA LAS OPERACIONES
       localparam [2:0]  FPADD = 3'b000,
                         FPSUB = 3'b001,
                         FPCOS = 3'b010,
                         FPSEN = 3'b011,
                        FPMULT = 3'b100;
// LAS REGIONES DEL ANGULO
       localparam [1:0]  IoIV1 = 2'b00,
                            II = 2'b01,
                           III = 2'b10,
                         IoIV2 = 2'b11;

       localparam [1:0]  ROUNDING_MODE_TRUNCT   = 2'b00,
                         ROUNDING_MODE_NEG_INF  = 2'b01,
                         ROUNDING_MODE_POS_INF  = 2'b10;


    FPU_Interface #(
            .W(W),
            .EW(EW),
            .SW(SW),
            .SWR(SWR),
            .EWR(EWR)
        ) inst_FPU_Interface (
            .clk             (clk),
            .rst             (rst),
            .begin_operation (begin_operation),
            .ack_operation   (ack_operation),
            .operation       (operation),
            .region_flag     (region_flag),
            .Data_1          (Data_1),
            .Data_2          (Data_2),
            .r_mode          (r_mode),
            .overflow_flag   (overflow_flag),
            .underflow_flag  (underflow_flag),
            .NaN_flag        (NaN_flag),
            .operation_ready (operation_ready),
            .op_result       (op_result)
        );




        reg [W-1:0] Array_IN_1 [0:((2**PERIOD)-1)];
        reg [W-1:0] Array_IN_2 [0:((2**PERIOD)-1)];
        integer contador;
        integer FileSaveData;


                initial begin
                    // Initialize Inputs
                    clk = 0;
                    rst = 1;
                    begin_operation = 0;
                    ack_operation = 0;
                    Data_1 = 0;
                    Data_2 = 0;

`ifdef SINGLE
            $display("------------------------SUMA--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------SUMA--------------------------");

                    operation = FPADD;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("ADD/SINGLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("ADD/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("ADD/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("ADD/SINGLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("ADD/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("ADD/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("ADD/SINGLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("ADD/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("ADD/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

            $display("------------------------RSTA--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------RSTA--------------------------");

                    operation = FPSUB;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("SUB/SINGLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("SUB/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("SUB/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("SUB/SINGLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SUB/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("SUB/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("SUB/SINGLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SUB/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("SUB/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);


            $display("------------------------MULT--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------MULT--------------------------");

                    operation = FPMULT;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("MULT/SINGLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("MULT/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("MULT/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("MULT/SINGLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("MULT/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("MULT/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("MULT/SINGLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("MULT/SINGLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("MULT/SINGLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);


            $display("---------------------REGION I or IV--------------------------");
            $display("------------------------    --------------------------");
            $display("---------------------REGION I or IV-------------------");

                region_flag = IoIV1;

            $display("------------------------SENO--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------SENO--------------------------");

                    operation = FPSEN;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("SIN/SINGLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("SIN/SINGLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("SIN/SINGLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SIN/SINGLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("SIN/SINGLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SIN/SINGLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

            $display("------------------------COS--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------COS--------------------------");

                    operation = FPCOS;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("COS/SINGLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("COS/SINGLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("COS/SINGLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("COS/SINGLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("COS/SINGLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("COS/SINGLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);
`endif
`ifdef DOUBLE
            $display("------------------------SUMA--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------SUMA--------------------------");

                    operation = FPADD;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("ADD/DOUBLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("ADD/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("ADD/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("ADD/DOUBLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("ADD/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("ADD/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("ADD/DOUBLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("ADD/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("ADD/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

            $display("------------------------RSTA--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------RSTA--------------------------");

                    operation = FPSUB;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("SUB/DOUBLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("SUB/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("SUB/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("SUB/DOUBLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SUB/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("SUB/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("SUB/DOUBLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SUB/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("SUB/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);


            $display("------------------------MULT--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------MULT--------------------------");

                    operation = FPMULT;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("MULT/DOUBLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("MULT/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("MULT/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("MULT/DOUBLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("MULT/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("MULT/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("MULT/DOUBLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("MULT/DOUBLE/Hexadecimal_A.txt", Array_IN_1);
                        $readmemh("MULT/DOUBLE/Hexadecimal_B.txt", Array_IN_2);
                        run_Arch2(FileSaveData,2**PERIOD);


            $display("---------------------REGION I or IV--------------------------");
            $display("------------------------    --------------------------");
            $display("---------------------REGION I or IV-------------------");

                region_flag = IoIV1;

            $display("------------------------SENO--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------SENO--------------------------");

                    operation = FPSEN;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("SIN/DOUBLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("SIN/DOUBLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("SIN/DOUBLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SIN/DOUBLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("SIN/DOUBLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("SIN/DOUBLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

            $display("------------------------COS--------------------------");
            $display("------------------------    --------------------------");
            $display("------------------------COS--------------------------");

                    operation = FPCOS;

                    r_mode = ROUNDING_MODE_TRUNCT;
                        FileSaveData = $fopen("COS/DOUBLE/RMODE_TRUNCATE/ResultadoXilinxFLM.txt","w");
                        $readmemh("COS/DOUBLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_NEG_INF;
                        FileSaveData = $fopen("COS/DOUBLE/RMODE_NEGINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("COS/DOUBLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);

                    r_mode = ROUNDING_MODE_POS_INF;
                        FileSaveData = $fopen("COS/DOUBLE/RMODE_POSINF/ResultadoXilinxFLM.txt","w");
                        $readmemh("COS/DOUBLE/input_angles_hex.txt", Array_IN_1);
                        run_Arch2(FileSaveData,2**PERIOD);
`endif

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
                    begin_operation = 0;
                    ack_operation = 0;
                    contador = 0;
                    repeat(Vector_size) @(negedge clk) begin

                            //input the new values inside the operator
                            Data_1 = Array_IN_1[contador];
                            Data_2 = Array_IN_2[contador];
                            #(PERIOD/4) begin_operation = 1;

                            //Wait for the operation operation_ready
                            @(posedge operation_ready) begin
                                #(PERIOD+2);
                                ack_operation = 1;
                                #4;
                                $fwrite(FDataO,"%h\n",op_result);
                            end
                            @(negedge clk) begin
                                ack_operation = 0;
                            end
                            contador = contador + 1;

                    end
                    $fclose(FDataO);
                end



                endtask
endmodule
