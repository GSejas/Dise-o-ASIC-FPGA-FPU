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

module Testbench_FPU_Mark2();

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
        reg add_subt;
        //OUTPUT SIGNALS
        wire overflow_flag;
        wire underflow_flag;
        wire operation_ready;
        wire zero_flag;
        wire NaN_flag;
        wire [W-1:0] op_result;
        wire busy;
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

`ifdef FPUv2_behav
    FPU_Interface2 #(
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
            .op_result       (op_result),
            .busy            (busy)
        );
`endif

 `ifdef DW1_SINGLE
integer PIPE=0;
    FPU_Multiplication_Function_W32_EW8_SW23 uut       (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );
 `endif


 `ifdef DW1_DOUBLE
integer PIPE=0;
    FPU_Multiplication_Function_W64_EW11_SW52 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );

 `endif


 `ifdef KOA2_SINGLE
integer PIPE=0;
    FPU_Multiplication_Function_W32_EW8_SW23 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );
 `endif


 `ifdef KOA2_DOUBLE
integer PIPE=0;
    FPU_Multiplication_Function_W64_EW11_SW52 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );

 `endif

 `ifdef KOA2_SINGLE
integer PIPE=0;
    FPU_Multiplication_Function_W32_EW8_SW23 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );
 `endif


 `ifdef KOA2_DOUBLE
integer PIPE=0;
    FPU_Multiplication_Function_W64_EW11_SW52 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );

 `endif

  `ifdef RKOA1_SINGLE
integer PIPE=0;
    FPU_Multiplication_Function_W32_EW8_SW23 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );
 `endif


 `ifdef RKOA1_DOUBLE
integer PIPE=0;
    FPU_Multiplication_Function_W64_EW11_SW52 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );

 `endif


 `ifdef RKOA2_SINGLE
integer PIPE=0;
    FPU_Multiplication_Function_W32_EW8_SW23 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );
 `endif


 `ifdef RKOA2_DOUBLE
integer PIPE=0;
    FPU_Multiplication_Function_W64_EW11_SW52 uut  (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (begin_operation),
            .ack_FSM           (ack_operation),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .ready             (operation_ready),
            .final_result_ieee (op_result)
        );

 `endif


`ifdef FPADD1_SINGLE
integer PIPE=0;
        FPU_Add_Subtract_Function_W32_EW8_SW23_SWR26_EWR5 uut(
            .clk(clk),
            .rst(rst),
            .beg_FSM(begin_operation),
            .ack_FSM(ack_operation),
            .Data_X(Data_1),
            .Data_Y(Data_2),
            .add_subt(add_subt),
            .r_mode(r_mode),
            .overflow_flag(overflow_flag),
            .underflow_flag(underflow_flag),
            .ready(operation_ready),
            .final_result_ieee(op_result)
            );
`endif


`ifdef FPADD1_DOUBLE
integer PIPE=0;
        FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6 uut(
            .clk(clk),
            .rst(rst),
            .beg_FSM(begin_operation),
            .ack_FSM(ack_operation),
            .Data_X(Data_1),
            .Data_Y(Data_2),
            .add_subt(add_subt),
            .r_mode(r_mode),
            .overflow_flag(overflow_flag),
            .underflow_flag(underflow_flag),
            .ready(operation_ready),
            .final_result_ieee(op_result)
            );
`endif


`ifdef FPADD2_SINGLE
integer PIPE=1;
        FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 inst_uut (
      .clk               (clk),
      .rst               (rst),
      .beg_OP            (begin_operation),
      .Data_X            (Data_1),
      .Data_Y            (Data_2),
      .add_subt          (add_subt),
      .busy              (busy),
      .overflow_flag     (overflow_flag),
      .underflow_flag    (underflow_flag),
      .zero_flag         (zero_flag),
      .ready             (operation_ready),
      .final_result_ieee (op_result)
    );
`endif


`ifdef FPADD2_DOUBLE
integer PIPE=1;
        FPU_PIPELINED_FPADDSUB_W64_EW11_SW52_SWR55_EWR6 inst_uut (
      .clk               (clk),
      .rst               (rst),
      .beg_OP            (begin_operation),
      .Data_X            (Data_1),
      .Data_Y            (Data_2),
      .add_subt          (add_subt),
      .busy              (busy),
      .overflow_flag     (overflow_flag),
      .underflow_flag    (underflow_flag),
      .zero_flag         (zero_flag),
      .ready             (operation_ready),
      .final_result_ieee (op_result)
    );
`endif

`ifdef CORDIC1_SINGLE
integer PIPE=0;
    CORDIC_Arch2_W32_EW8_SW23_SWR26_EWR5 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_fsm_cordic    (begin_operation),
            .ack_cordic        (ack_operation),
            .operation         (1'b1),
            .data_in           (Data_1),
            .shift_region_flag (region_flag),
            .r_mode            (r_mode),
            .ready_cordic      (operation_ready),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .data_output       (op_result)
        );
`endif

`ifdef CORDIC1_DOUBLE
integer PIPE=0;
    CORDIC_Arch2_W64_EW11_SW52_SWR55_EWR6  uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_fsm_cordic    (begin_operation),
            .ack_cordic        (ack_operation),
            .operation         (1'b1),
            .data_in           (Data_1),
            .shift_region_flag (region_flag),
            .r_mode            (r_mode),
            .ready_cordic      (operation_ready),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .data_output       (op_result)
        );
`endif


`ifdef CORDIC2_SINGLE
    CORDIC_Arch3_W32_EW8_SW23_SWR26_EWR5 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_fsm_cordic    (begin_operation),
            .ack_cordic        (ack_operation),
            .operation         (1'b1),
            .data_in           (Data_1),
            .shift_region_flag (region_flag),
            .ready_cordic      (operation_ready),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .zero_flag         (zero_flag),
            .busy              (busy),
            .data_output       (op_result)
        );
`endif


`ifdef CORDIC2_DOUBLE
    CORDIC_Arch3_W64_EW11_SW52_SWR55_EWR6 uut        (
            .clk               (clk),
            .rst               (rst),
            .beg_fsm_cordic    (begin_operation),
            .ack_cordic        (ack_operation),
            .operation         (1'b1),
            .data_in           (Data_1),
            .shift_region_flag (region_flag),
            .ready_cordic      (operation_ready),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .zero_flag         (zero_flag),
            .busy              (busy),
            .data_output       (op_result)
        );
`endif

        reg [W-1:0] Array_IN_1 [0:(((2**PERIOD))-1)];
        reg [W-1:0] Array_IN_2 [0:(((2**PERIOD))-1)];
        integer contador;
        integer FileSaveData;
        integer FileSaveData_FLOAT;


                initial begin
                    // Initialize Inputs
                     $vcdpluson;
                    clk = 0;
                    rst = 1;
                    r_mode=ROUNDING_MODE_TRUNCT;
                    begin_operation = 0;
                    ack_operation = 0;
                    Data_1 = 0;
                    Data_2 = 0;
                    region_flag = IoIV1;
                    add_subt =1'b0;
                    $display("------------------------OP--------------------------");
                    $display("------------------------    --------------------------");
                    $display("------------------------OP--------------------------");
		        #100;
		        rst = 0;
                    $readmemh("Hexadecimal_A.txt", Array_IN_1);
                    $readmemh("Hexadecimal_B.txt", Array_IN_2);

                    FileSaveData = $fopen("ResultadoXilinxFLMv2.txt","w");
                    FileSaveData_FLOAT = $fopen("ResultadoXilinxFLMv2F.txt","w");

                   if (PIPE) begin
                     run_PIPE(FileSaveData,FileSaveData_FLOAT,(2**PERIOD));
                   end else begin
                     run_Arch2(FileSaveData,FileSaveData_FLOAT,(2**PERIOD));
                   end



                    #100 rst = 0;
                    $finish;
                    $vcdplusclose;
                    //Add stimulus here
                end


             //******************************* Se ejecuta el CLK ************************

                initial forever #10 clk = ~clk;

                task run_Arch2;
                    input integer FDataO;
                    input integer FData1;
                    input integer Vector_size;
                begin
                    begin_operation = 0;
                    rst = 0;
                    #15 rst = 1;
                    #25 rst = 0;
                  //  begin_operation = 0;
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
                                $display("%h\n",op_result);
                                $fwrite(FDataO,"%h\n",op_result);
                                $display("%f\n",$bitstoshortreal(op_result));
                                    `ifdef SINGLE
                                    $fwrite(FData1,"%f\n",$bitstoshortreal(op_result));
                                    `else
                                    $fwrite(FData1,"%f\n",$bitstoreal(op_result));
                                    `endif
                            end
                            @(negedge clk) begin
                                ack_operation = 0;
                            end
                            contador = contador + 1;

                    end
                    $fclose(FDataO);
                    $fclose(FData1);
                end
            endtask
////////////////////////////TASK FOR THE PIPE ADDER/////////////////
////We need to read in a non-linear fashion, therefore
// we are going to write first the 3 first input operands,
// then, the normal running operation,
// and then the final procedure.

                task run_PIPE;
                    input integer FData1;
                    input integer FData2;
                    input integer Vector_size2;
                begin
                    begin_operation = 0;
                    rst = 0;
                    #15 rst = 1;
                    #25 rst = 0;
                    //begin_operation = 0;
                    contador = 0;
                    @(posedge clk)
                    begin_operation = 1;
                    @(posedge clk)
                    Data_1 = Array_IN_1[contador];
                    Data_2 = Array_IN_2[contador];
                    contador = contador + 1;
                    repeat(Vector_size2*2+6) @(posedge clk) begin
                    #(PERIOD/3);
                            if(~busy & ~rst) begin
                                Data_1 = Array_IN_1[contador];
                                Data_2 = Array_IN_2[contador];
                                contador = contador + 1;
                            end
                            if (operation_ready) begin
                                    $fwrite(FData1,"%h\n",op_result);
                                    `ifdef SINGLE
                                    $fwrite(FData2,"%f\n",$bitstoshortreal(op_result));
                                    `else
                                    $fwrite(FData2,"%f\n",$bitstoreal(op_result));
                                    `endif
                            end
                    end
                    begin_operation = 0;
                    $fclose(FData1);
                    $fclose(FData2);
                end

                endtask
endmodule
