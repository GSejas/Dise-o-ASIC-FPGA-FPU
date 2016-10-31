//==================================================================================================
//  Filename      : FPU_Interface.v
//  Created On    : 2016-10-29 12:45:25
//  Last Modified : 2016-10-30 15:01:39
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

module FPU_Interface2 #(parameter W = 64, EW = 11, SW = 52, SWR = 55, EWR = 6)
    (
        //Input Signals
        input wire clk,
        input wire rst,
        input wire begin_operation,
        input wire ack_operation,
        input wire [2:0] operation,
        input wire [1:0] region_flag,
        input wire [W-1:0] Data_1,
        input wire [W-1:0] Data_2,
        input wire [1:0] r_mode,
        //Output Signals
        output wire overflow_flag,
        output wire underflow_flag,
        output wire NaN_flag,
        output wire operation_ready,
        output wire [W-1:0] op_result,
        output wire busy
    );
//Signal declaration
    wire beg_fsm_mult;
    wire beg_fsm_addsubt;
    wire beg_fsm_cordic;
    wire beg_add_subt_cordic;
    wire beg_add_subt;
    wire ack_fsm_mult;
    wire ack_fsm_addsubt;
    wire ack_fsm_cordic;
    wire ack_add_subt_cordic;
    wire ack_add_subt;
    wire op_mod_add_subt;
    wire op_mod_cordic;
    wire op_addsubt_cordic;
    wire op_addsubt;
    wire [W-1:0] add_subt_dataA;
    wire [W-1:0] add_subt_dataB;
    wire [W-1:0] add_subt_data1;
    wire [W-1:0] add_subt_data2;
    wire [W-1:0] result_add_subt;
    wire ready_add_subt;
    wire ready_cordic;
    wire ready_mult;
    wire overflow_flag_addsubt;
    wire underflow_flag_addsubt;
    wire overflow_flag_mult;
    wire underflow_flag_mult;
    wire [W-1:0] cordic_result;
    wire [W-1:0] mult_result;
    wire [1:0] operation_reg;
    wire [W-1:0] dataA, dataB;
    wire NaN_reg;
//----------------------------------------------------------------------------------------------------------------------------
d_ff_en # (.W(2)) operation_dff
    (
        .clk   (clk),//system clock
        .rst   (rst), //system reset
        .enable(1'b1), //load signal
        .D     (operation[2:1]), //input signal
        .Q     (operation_reg) //output signal
    );

d_ff_en # (.W(W)) reg_dataA
    (
        .clk   (clk),//system clock
        .rst   (rst), //system reset
        .enable(1'b1), //load signal
        .D     (Data_1), //input signal
        .Q     (dataA) //output signal
    );

d_ff_en # (.W(W)) reg_dataB
    (
        .clk   (clk),//system clock
        .rst   (rst), //system reset
        .enable(1'b1), //load signal
        .D     (Data_2), //input signal
        .Q     (dataB) //output signal
    );

generate
    case(W)
    32:
    begin : BLKNaN1
        NaN_mod_32 NaN_flag_32
    (
        .operation(operation_reg),
        .data1    (dataA),
        .data2    (dataB),
        .NaN_flag (NaN_reg)
     );
     end
     64:
     begin : BLKNaN2
        NaN_mod_64 NaN_flag_64
    (
        .operation(operation_reg),
        .data1    (dataA),
        .data2    (dataB),
        .NaN_flag (NaN_reg)
     );
     end
     default:
     begin : BLKNaN3
         NaN_mod_32 NaN_flag_32
     (
         .operation(operation_reg),
         .data1    (dataA),
         .data2    (dataB),
         .NaN_flag (NaN_reg)
      );

     end
     endcase
endgenerate

    d_ff_en # (.W(1)) NaN_dff
    (
        .clk   (clk),//system clock
        .rst   (rst), //system reset
        .enable(1'b1), //load signal
        .D     (NaN_reg), //input signal
        .Q     (NaN_flag) //output signal
    );

//----------------------------------------------------------------------------------------------------------------------------
demux_1x3 demux_beg_op
    (
        .data  (begin_operation),
        .select(operation[2:1]),
        .ch1   (beg_fsm_addsubt),
        .ch2   (beg_fsm_cordic),
        .ch3   (beg_fsm_mult)
    );

demux_1x3 demux_ack_op
    (
        .data  (ack_operation),
        .select(operation[2:1]),
        .ch1   (ack_fsm_addsubt),
        .ch2   (ack_fsm_cordic),
        .ch3   (ack_fsm_mult)
    );

deco_op deco_operation
    (
        .operation      (operation[1:0]),
        .op_mod_add_subt(op_mod_add_subt),
        .op_mod_cordic  (op_mod_cordic)
    );


///******************MUXES TO HANDLE THE INTERFACE BETWEEN ADD-SUB AND CORDIC***************

    Mux_2x1 #(.W(1)) mux_beg_addsubt
        (
            .select  (operation[1]),
            .ch_0    (beg_fsm_addsubt),
            .ch_1    (beg_add_subt_cordic),
            .data_out(beg_add_subt)
        );

    // Mux_2x1 #(.W(1)) mux_ack_addsubt
    //     (
    //         .select  (operation[1]),
    //         .ch_0    (ack_fsm_addsubt),
    //         .ch_1    (ack_add_subt_cordic),
    //         .data_out(ack_add_subt)
    //     );

    Mux_2x1 #(.W(1)) mux_operation_add_cordic
        (
            .select  (operation[1]),
            .ch_0    (op_mod_add_subt),
            .ch_1    (op_addsubt_cordic),
            .data_out(op_addsubt)
        );

    Mux_2x1 #(.W(W)) mux_data_in1
        (
            .select  (operation[1]),
            .ch_0    (Data_1),
            .ch_1    (add_subt_dataA),
            .data_out(add_subt_data1)
        );

    Mux_2x1 #(.W(W)) mux_data_in2
        (
            .select  (operation[1]),
            .ch_0    (Data_2),
            .ch_1    (add_subt_dataB),
            .data_out(add_subt_data2)
        );


///////////////******************************************************************************


    // CORDIC_Arch3v1 #(.W(W),.EW(EW),.SW(SW),.SWR(SWR)) FPSENCOS  (
    //         .clk               (clk),              //global clk
    //         .rst               (rst),               //glbl rst signal
    //         .beg_fsm_cordic    (beg_fsm_cordic),    //init signal
    //         .ack_cordic        (ack_fsm_cordic),    //ackleg signal from extrnl module
    //         .operation         (op_mod_cordic),     //sine or cosine
    //         .data_in           (Data_1),            //input angle in radians
    //         .shift_region_flag (region_flag),       // region of the Signal
    //         .ready_cordic      (ready_cordic),      //output signal as a ready
    //         .data_output       (cordic_result),     //ouput date in single or double precision
    //         .beg_add_subt      (beg_add_subt_cordic),      //
    //         .ack_add_subt      (ack_add_subt_cordic),
    //         .add_subt_dataA    (add_subt_dataA),
    //         .add_subt_dataB    (add_subt_dataB),
    //         .result_add_subt   (result_add_subt),
    //         .op_add_subt       (op_addsubt_cordic),
    //         .ready_add_subt    (ready_add_subt)
    //     );

wire enab_cont_iter;

    CORDIC_Arch3v1 #(.W(W),.EW(EW),.SW(SW),.SWR(SWR)) FPSENCOS
        (
            .clk               (clk),
            .rst               (rst),
            .beg_fsm_cordic    (beg_fsm_cordic),
            .ack_cordic        (ack_fsm_cordic),
            .operation         (op_mod_cordic),
            .data_in           (Data_1),
            .shift_region_flag (region_flag),
            .ready_cordic      (ready_cordic),
            .data_output       (cordic_result),
            .beg_add_subt      (beg_add_subt_cordic),
            .add_subt_dataA    (add_subt_dataA),
            .add_subt_dataB    (add_subt_dataB),
            .result_add_subt   (result_add_subt),
            .op_add_subt       (op_addsubt_cordic),
            .ready_add_subt    (ready_add_subt),
            .enab_cont_iter    (enab_cont_iter)
        );


    FPU_Multiplication_Function #(.W(W),.EW(EW),.SW(SW)) FPMULT (
            .clk               (clk),
            .rst               (rst),
            .beg_FSM           (beg_fsm_mult),
            .ack_FSM           (ack_fsm_mult),
            .Data_MX           (Data_1),
            .Data_MY           (Data_2),
            .round_mode        (r_mode),
            .overflow_flag     (overflow_flag_mult),
            .underflow_flag    (underflow_flag_mult),
            .ready             (ready_mult),
            .final_result_ieee (mult_result)
        );


    // FPU_PIPELINED_FPADDSUB #(.W(W),.EW(EW),.SW(SW),.SWR(SWR),.EWR(EWR)) FPADDSUB (
    //         .clk               (clk),
    //         .rst               (rst),
    //         .beg_FSM           (beg_add_subt),
    //         .ack_FSM           (ack_add_subt),
    //         .Data_X            (add_subt_data1),
    //         .Data_Y            (add_subt_data2),
    //         .add_subt          (op_addsubt),
    //         .r_mode            (r_mode),
    //         .overflow_flag     (overflow_flag_addsubt),
    //         .underflow_flag    (underflow_flag_addsubt),
    //         .ready             (ready_add_subt),
    //         .final_result_ieee (result_add_subt)
    //     );

    FPU_PIPELINED_FPADDSUB #(.W(W),.EW(EW),.SW(SW),.SWR(SWR),.EWR(EWR)) FPADDSUB (
            .clk               (clk),
            .rst               (rst|enab_cont_iter),
            .beg_OP            (beg_add_subt),
            .Data_X            (add_subt_data1),
            .Data_Y            (add_subt_data2),
            .add_subt          (op_addsubt),
            .busy              (busy),
            .overflow_flag     (overflow_flag_addsubt),
            .underflow_flag    (underflow_flag_addsubt),
            .zero_flag         (zero_flag),
            .ready             (ready_add_subt),
            .final_result_ieee (result_add_subt)
        );

//----------------------------------------------------------------------------------------------------------------------------
Mux_2x1 #(.W(1)) overflow_flag_mux
    (
        .select  (operation[2]),
        .ch_0    (overflow_flag_addsubt),
        .ch_1    (overflow_flag_mult),
        .data_out(overflow_flag)
    );

Mux_2x1 #(.W(1)) underflow_flag_mux
    (
        .select  (operation[2]),
        .ch_0    (underflow_flag_addsubt),
        .ch_1    (underflow_flag_mult),
        .data_out(underflow_flag)
    );

Mux_3x1_b #(.W(1)) mux_ready_op
    (
        .select  (operation[2:1]),
        .ch_0    (ready_add_subt),
        .ch_1    (ready_cordic),
        .ch_2    (ready_mult),
        .data_out(operation_ready)
    );

Mux_3x1_b #(.W(W)) mux_result_op
    (
        .select  (operation[2:1]),
        .ch_0    (result_add_subt),
        .ch_1    (cordic_result),
        .ch_2    (mult_result),
        .data_out(op_result)
    );

endmodule
