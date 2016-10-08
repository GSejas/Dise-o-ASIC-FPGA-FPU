// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Sat Sep 17 18:26:21 2016
// Host        : jorge-pc running 64-bit Ubuntu 16.04.1 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/jorge/Documents/Karatsuba_FPU/CORDICO/CORDICO.sim/sim_1/synth/func/testbench_CORDIC_Arch2_func_synth.v
// Design      : CORDIC_Arch2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Add_Subt
   (add_overflow_flag,
    D,
    \Q_reg[18] ,
    \Q_reg[16] ,
    \Q_reg[17] ,
    \Q_reg[15] ,
    \Q_reg[0] ,
    \Q_reg[4] ,
    E,
    CLK,
    AR,
    Q,
    DI,
    S,
    \Q_reg[7] ,
    \Q_reg[11] ,
    \Q_reg[15]_0 ,
    \Q_reg[19] ,
    \Q_reg[23] ,
    \Q_reg[31] ,
    FSM_barrel_shifter_B_S,
    \Q_reg[2] ,
    \Q_reg[1] ,
    \Q_reg[0]_0 ,
    \Q_reg[0]_1 ,
    FSM_selector_B,
    \Q_reg[0]_2 ,
    \Q_reg[0]_3 ,
    FSM_selector_C,
    \Q_reg[22] ,
    FSM_barrel_shifter_L_R,
    \Q_reg[0]_4 );
  output add_overflow_flag;
  output [20:0]D;
  output \Q_reg[18] ;
  output \Q_reg[16] ;
  output \Q_reg[17] ;
  output \Q_reg[15] ;
  output [1:0]\Q_reg[0] ;
  output [4:0]\Q_reg[4] ;
  input [0:0]E;
  input CLK;
  input [0:0]AR;
  input [22:0]Q;
  input [1:0]DI;
  input [3:0]S;
  input [3:0]\Q_reg[7] ;
  input [3:0]\Q_reg[11] ;
  input [3:0]\Q_reg[15]_0 ;
  input [3:0]\Q_reg[19] ;
  input [3:0]\Q_reg[23] ;
  input [2:0]\Q_reg[31] ;
  input FSM_barrel_shifter_B_S;
  input \Q_reg[2] ;
  input \Q_reg[1] ;
  input \Q_reg[0]_0 ;
  input [0:0]\Q_reg[0]_1 ;
  input [1:0]FSM_selector_B;
  input [0:0]\Q_reg[0]_2 ;
  input \Q_reg[0]_3 ;
  input FSM_selector_C;
  input [22:0]\Q_reg[22] ;
  input FSM_barrel_shifter_L_R;
  input [0:0]\Q_reg[0]_4 ;

  wire [0:0]AR;
  wire CLK;
  wire [20:0]D;
  wire [1:0]DI;
  wire [0:0]E;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire [1:0]FSM_selector_B;
  wire FSM_selector_C;
  wire [22:0]Q;
  wire [1:0]\Q_reg[0] ;
  wire \Q_reg[0]_0 ;
  wire [0:0]\Q_reg[0]_1 ;
  wire [0:0]\Q_reg[0]_2 ;
  wire \Q_reg[0]_3 ;
  wire [0:0]\Q_reg[0]_4 ;
  wire [3:0]\Q_reg[11] ;
  wire \Q_reg[15] ;
  wire [3:0]\Q_reg[15]_0 ;
  wire \Q_reg[16] ;
  wire \Q_reg[17] ;
  wire \Q_reg[18] ;
  wire [3:0]\Q_reg[19] ;
  wire \Q_reg[1] ;
  wire [22:0]\Q_reg[22] ;
  wire [3:0]\Q_reg[23] ;
  wire \Q_reg[2] ;
  wire [2:0]\Q_reg[31] ;
  wire [4:0]\Q_reg[4] ;
  wire [3:0]\Q_reg[7] ;
  wire [3:0]S;
  wire Sgf_AS_n_0;
  wire Sgf_AS_n_1;
  wire Sgf_AS_n_10;
  wire Sgf_AS_n_11;
  wire Sgf_AS_n_12;
  wire Sgf_AS_n_13;
  wire Sgf_AS_n_14;
  wire Sgf_AS_n_15;
  wire Sgf_AS_n_16;
  wire Sgf_AS_n_17;
  wire Sgf_AS_n_18;
  wire Sgf_AS_n_19;
  wire Sgf_AS_n_2;
  wire Sgf_AS_n_20;
  wire Sgf_AS_n_21;
  wire Sgf_AS_n_22;
  wire Sgf_AS_n_23;
  wire Sgf_AS_n_24;
  wire Sgf_AS_n_25;
  wire Sgf_AS_n_3;
  wire Sgf_AS_n_4;
  wire Sgf_AS_n_5;
  wire Sgf_AS_n_6;
  wire Sgf_AS_n_7;
  wire Sgf_AS_n_8;
  wire Sgf_AS_n_9;
  wire add_overflow_flag;

  RegisterAdd__parameterized8 Add_Subt_Result
       (.AR(AR),
        .CLK(CLK),
        .D(D),
        .E(E),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_selector_B(FSM_selector_B),
        .FSM_selector_C(FSM_selector_C),
        .Q(\Q_reg[0] ),
        .\Q_reg[0]_0 (\Q_reg[0]_0 ),
        .\Q_reg[0]_1 (\Q_reg[0]_1 ),
        .\Q_reg[0]_2 (\Q_reg[0]_2 ),
        .\Q_reg[0]_3 (\Q_reg[0]_3 ),
        .\Q_reg[15]_0 (\Q_reg[15] ),
        .\Q_reg[16]_0 (\Q_reg[16] ),
        .\Q_reg[17]_0 (\Q_reg[17] ),
        .\Q_reg[18]_0 (\Q_reg[18] ),
        .\Q_reg[1]_0 (\Q_reg[1] ),
        .\Q_reg[22]_0 (\Q_reg[22] ),
        .\Q_reg[22]_1 ({Sgf_AS_n_0,Sgf_AS_n_1,Sgf_AS_n_2,Sgf_AS_n_3,Sgf_AS_n_4,Sgf_AS_n_5,Sgf_AS_n_6,Sgf_AS_n_7,Sgf_AS_n_8,Sgf_AS_n_9,Sgf_AS_n_10,Sgf_AS_n_11,Sgf_AS_n_12,Sgf_AS_n_13,Sgf_AS_n_14,Sgf_AS_n_15,Sgf_AS_n_16,Sgf_AS_n_17,Sgf_AS_n_18,Sgf_AS_n_19,Sgf_AS_n_20,Sgf_AS_n_21,Sgf_AS_n_22,Sgf_AS_n_23,Sgf_AS_n_24,\Q_reg[0]_4 }),
        .\Q_reg[2]_0 (\Q_reg[2] ),
        .\Q_reg[4]_0 (\Q_reg[4] ));
  RegisterAdd_10 Add_overflow_Result
       (.AR(AR),
        .CLK(CLK),
        .E(E),
        .O(Sgf_AS_n_25),
        .add_overflow_flag(add_overflow_flag));
  add_sub_carry_out__parameterized0 Sgf_AS
       (.DI(DI),
        .O(Sgf_AS_n_25),
        .Q(Q),
        .\Q_reg[11] (\Q_reg[11] ),
        .\Q_reg[15] (\Q_reg[15]_0 ),
        .\Q_reg[19] (\Q_reg[19] ),
        .\Q_reg[23] (\Q_reg[23] ),
        .\Q_reg[25] ({Sgf_AS_n_0,Sgf_AS_n_1,Sgf_AS_n_2,Sgf_AS_n_3,Sgf_AS_n_4,Sgf_AS_n_5,Sgf_AS_n_6,Sgf_AS_n_7,Sgf_AS_n_8,Sgf_AS_n_9,Sgf_AS_n_10,Sgf_AS_n_11,Sgf_AS_n_12,Sgf_AS_n_13,Sgf_AS_n_14,Sgf_AS_n_15,Sgf_AS_n_16,Sgf_AS_n_17,Sgf_AS_n_18,Sgf_AS_n_19,Sgf_AS_n_20,Sgf_AS_n_21,Sgf_AS_n_22,Sgf_AS_n_23,Sgf_AS_n_24}),
        .\Q_reg[31] (\Q_reg[31] ),
        .\Q_reg[7] (\Q_reg[7] ),
        .S(S));
endmodule

module Barrel_Shifter
   (\Q_reg[16] ,
    Q,
    \Q_reg[25] ,
    \Q_reg[17] ,
    \Q_reg[24] ,
    \Q_reg[18] ,
    \Q_reg[23] ,
    \Q_reg[19] ,
    \Q_reg[22] ,
    \Q_reg[20] ,
    \Q_reg[21] ,
    S,
    \Q_reg[0] ,
    D,
    FSM_barrel_shifter_L_R,
    \Q_reg[16]_0 ,
    FSM_barrel_shifter_B_S,
    \Q_reg[4] ,
    \Q_reg[3] ,
    \Q_reg[17]_0 ,
    E,
    CLK,
    AR,
    \FSM_sequential_state_reg_reg[3] ,
    \Q_reg[2] );
  output \Q_reg[16] ;
  output [15:0]Q;
  output \Q_reg[25] ;
  output \Q_reg[17] ;
  output \Q_reg[24] ;
  output \Q_reg[18] ;
  output \Q_reg[23] ;
  output \Q_reg[19] ;
  output \Q_reg[22] ;
  output \Q_reg[20] ;
  output \Q_reg[21] ;
  output [0:0]S;
  output [25:0]\Q_reg[0] ;
  input [15:0]D;
  input FSM_barrel_shifter_L_R;
  input \Q_reg[16]_0 ;
  input FSM_barrel_shifter_B_S;
  input \Q_reg[4] ;
  input \Q_reg[3] ;
  input \Q_reg[17]_0 ;
  input [0:0]E;
  input CLK;
  input [0:0]AR;
  input [1:0]\FSM_sequential_state_reg_reg[3] ;
  input [25:0]\Q_reg[2] ;

  wire [0:0]AR;
  wire CLK;
  wire [15:0]D;
  wire [25:16]Data_Reg;
  wire [0:0]E;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire [1:0]\FSM_sequential_state_reg_reg[3] ;
  wire [15:0]Q;
  wire [25:0]\Q_reg[0] ;
  wire \Q_reg[16] ;
  wire \Q_reg[16]_0 ;
  wire \Q_reg[17] ;
  wire \Q_reg[17]_0 ;
  wire \Q_reg[18] ;
  wire \Q_reg[19] ;
  wire \Q_reg[20] ;
  wire \Q_reg[21] ;
  wire \Q_reg[22] ;
  wire \Q_reg[23] ;
  wire \Q_reg[24] ;
  wire \Q_reg[25] ;
  wire [25:0]\Q_reg[2] ;
  wire \Q_reg[3] ;
  wire \Q_reg[4] ;
  wire [0:0]S;

  Mux_Array Mux_Array
       (.CLK(CLK),
        .D(Data_Reg),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3] [1]),
        .Q(Q),
        .\Q_reg[16] (\Q_reg[16] ),
        .\Q_reg[16]_0 (\Q_reg[16]_0 ),
        .\Q_reg[17] (\Q_reg[17] ),
        .\Q_reg[17]_0 (\Q_reg[17]_0 ),
        .\Q_reg[18] (\Q_reg[18] ),
        .\Q_reg[19] (\Q_reg[19] ),
        .\Q_reg[20] (\Q_reg[20] ),
        .\Q_reg[21] (\Q_reg[21] ),
        .\Q_reg[22] (\Q_reg[22] ),
        .\Q_reg[23] (\Q_reg[23] ),
        .\Q_reg[24] (\Q_reg[24] ),
        .\Q_reg[25] (\Q_reg[25] ),
        .\Q_reg[2] (\Q_reg[2] ),
        .\Q_reg[3] (\Q_reg[3] ),
        .\Q_reg[4] (\Q_reg[4] ));
  RegisterAdd__parameterized7 Output_Reg
       (.AR({AR,\FSM_sequential_state_reg_reg[3] }),
        .CLK(CLK),
        .D({Data_Reg,D}),
        .E(E),
        .\Q_reg[0]_0 (\Q_reg[0] ),
        .S(S));
endmodule

(* EW = "8" *) (* EWR = "5" *) (* SW = "23" *) 
(* SWR = "26" *) (* W = "32" *) (* d_iter = "0" *) 
(* d_var = "0" *) (* iter_bits = "4" *) (* mode = "1'b0" *) 
(* r_mode = "2'b00" *) 
(* NotValidForBitStream *)
module CORDIC_Arch2
   (clk,
    rst,
    beg_fsm_cordic,
    ack_cordic,
    operation,
    data_in,
    shift_region_flag,
    ready_cordic,
    overflow_flag,
    underflow_flag,
    data_output);
  input clk;
  input rst;
  input beg_fsm_cordic;
  input ack_cordic;
  input operation;
  input [31:0]data_in;
  input [1:0]shift_region_flag;
  output ready_cordic;
  output overflow_flag;
  output underflow_flag;
  output [31:0]data_output;

  wire [7:0]A;
  wire [7:0]Y;
  wire ack_cordic;
  wire ack_cordic_IBUF;
  wire add_subt_module_n_10;
  wire add_subt_module_n_11;
  wire add_subt_module_n_12;
  wire add_subt_module_n_13;
  wire add_subt_module_n_14;
  wire add_subt_module_n_15;
  wire add_subt_module_n_16;
  wire add_subt_module_n_17;
  wire add_subt_module_n_18;
  wire add_subt_module_n_19;
  wire add_subt_module_n_2;
  wire add_subt_module_n_20;
  wire add_subt_module_n_21;
  wire add_subt_module_n_22;
  wire add_subt_module_n_23;
  wire add_subt_module_n_24;
  wire add_subt_module_n_25;
  wire add_subt_module_n_26;
  wire add_subt_module_n_27;
  wire add_subt_module_n_28;
  wire add_subt_module_n_29;
  wire add_subt_module_n_3;
  wire add_subt_module_n_30;
  wire add_subt_module_n_31;
  wire add_subt_module_n_32;
  wire add_subt_module_n_33;
  wire add_subt_module_n_34;
  wire add_subt_module_n_4;
  wire add_subt_module_n_5;
  wire add_subt_module_n_6;
  wire add_subt_module_n_7;
  wire add_subt_module_n_8;
  wire add_subt_module_n_9;
  wire beg_fsm_cordic;
  wire beg_fsm_cordic_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire cont_iter_n_11;
  wire cont_iter_n_12;
  wire cont_iter_n_13;
  wire cont_iter_n_22;
  wire cont_iter_n_23;
  wire cont_iter_n_25;
  wire cont_iter_n_26;
  wire cont_iter_n_27;
  wire cont_iter_n_28;
  wire cont_iter_n_8;
  wire [3:0]cont_iter_out;
  wire cont_var_n_4;
  wire cont_var_n_5;
  wire [1:0]cont_var_out;
  wire cordic_FSM_n_0;
  wire cordic_FSM_n_1;
  wire cordic_FSM_n_15;
  wire cordic_FSM_n_17;
  wire cordic_FSM_n_18;
  wire cordic_FSM_n_19;
  wire cordic_FSM_n_2;
  wire cordic_FSM_n_20;
  wire cordic_FSM_n_21;
  wire cordic_FSM_n_22;
  wire cordic_FSM_n_23;
  wire cordic_FSM_n_3;
  wire cordic_FSM_n_5;
  wire cordic_FSM_n_7;
  wire d_ff1_operation_out;
  wire [31:31]d_ff2_Y;
  wire [31:31]d_ff2_Z;
  wire d_ff3_sign_out;
  wire d_ff4_Xn_n_0;
  wire d_ff4_Xn_n_1;
  wire d_ff4_Xn_n_10;
  wire d_ff4_Xn_n_11;
  wire d_ff4_Xn_n_12;
  wire d_ff4_Xn_n_13;
  wire d_ff4_Xn_n_14;
  wire d_ff4_Xn_n_15;
  wire d_ff4_Xn_n_16;
  wire d_ff4_Xn_n_17;
  wire d_ff4_Xn_n_18;
  wire d_ff4_Xn_n_19;
  wire d_ff4_Xn_n_2;
  wire d_ff4_Xn_n_20;
  wire d_ff4_Xn_n_21;
  wire d_ff4_Xn_n_22;
  wire d_ff4_Xn_n_23;
  wire d_ff4_Xn_n_24;
  wire d_ff4_Xn_n_25;
  wire d_ff4_Xn_n_26;
  wire d_ff4_Xn_n_27;
  wire d_ff4_Xn_n_28;
  wire d_ff4_Xn_n_29;
  wire d_ff4_Xn_n_3;
  wire d_ff4_Xn_n_30;
  wire d_ff4_Xn_n_31;
  wire d_ff4_Xn_n_4;
  wire d_ff4_Xn_n_5;
  wire d_ff4_Xn_n_6;
  wire d_ff4_Xn_n_7;
  wire d_ff4_Xn_n_8;
  wire d_ff4_Xn_n_9;
  wire d_ff4_Yn_n_0;
  wire d_ff4_Yn_n_1;
  wire d_ff4_Yn_n_10;
  wire d_ff4_Yn_n_11;
  wire d_ff4_Yn_n_12;
  wire d_ff4_Yn_n_13;
  wire d_ff4_Yn_n_14;
  wire d_ff4_Yn_n_15;
  wire d_ff4_Yn_n_16;
  wire d_ff4_Yn_n_17;
  wire d_ff4_Yn_n_18;
  wire d_ff4_Yn_n_19;
  wire d_ff4_Yn_n_2;
  wire d_ff4_Yn_n_20;
  wire d_ff4_Yn_n_21;
  wire d_ff4_Yn_n_22;
  wire d_ff4_Yn_n_23;
  wire d_ff4_Yn_n_24;
  wire d_ff4_Yn_n_25;
  wire d_ff4_Yn_n_26;
  wire d_ff4_Yn_n_27;
  wire d_ff4_Yn_n_28;
  wire d_ff4_Yn_n_29;
  wire d_ff4_Yn_n_3;
  wire d_ff4_Yn_n_30;
  wire d_ff4_Yn_n_31;
  wire d_ff4_Yn_n_4;
  wire d_ff4_Yn_n_5;
  wire d_ff4_Yn_n_6;
  wire d_ff4_Yn_n_7;
  wire d_ff4_Yn_n_8;
  wire d_ff4_Yn_n_9;
  wire d_ff4_Zn_n_0;
  wire d_ff4_Zn_n_1;
  wire d_ff4_Zn_n_10;
  wire d_ff4_Zn_n_11;
  wire d_ff4_Zn_n_12;
  wire d_ff4_Zn_n_13;
  wire d_ff4_Zn_n_14;
  wire d_ff4_Zn_n_15;
  wire d_ff4_Zn_n_16;
  wire d_ff4_Zn_n_17;
  wire d_ff4_Zn_n_18;
  wire d_ff4_Zn_n_19;
  wire d_ff4_Zn_n_2;
  wire d_ff4_Zn_n_20;
  wire d_ff4_Zn_n_21;
  wire d_ff4_Zn_n_22;
  wire d_ff4_Zn_n_23;
  wire d_ff4_Zn_n_24;
  wire d_ff4_Zn_n_25;
  wire d_ff4_Zn_n_26;
  wire d_ff4_Zn_n_27;
  wire d_ff4_Zn_n_28;
  wire d_ff4_Zn_n_29;
  wire d_ff4_Zn_n_3;
  wire d_ff4_Zn_n_30;
  wire d_ff4_Zn_n_31;
  wire d_ff4_Zn_n_4;
  wire d_ff4_Zn_n_5;
  wire d_ff4_Zn_n_6;
  wire d_ff4_Zn_n_7;
  wire d_ff4_Zn_n_8;
  wire d_ff4_Zn_n_9;
  wire d_ff5_n_1;
  wire d_ff5_n_10;
  wire d_ff5_n_11;
  wire d_ff5_n_12;
  wire d_ff5_n_13;
  wire d_ff5_n_14;
  wire d_ff5_n_15;
  wire d_ff5_n_16;
  wire d_ff5_n_17;
  wire d_ff5_n_18;
  wire d_ff5_n_19;
  wire d_ff5_n_2;
  wire d_ff5_n_20;
  wire d_ff5_n_21;
  wire d_ff5_n_22;
  wire d_ff5_n_23;
  wire d_ff5_n_24;
  wire d_ff5_n_25;
  wire d_ff5_n_26;
  wire d_ff5_n_27;
  wire d_ff5_n_28;
  wire d_ff5_n_29;
  wire d_ff5_n_3;
  wire d_ff5_n_30;
  wire d_ff5_n_31;
  wire d_ff5_n_4;
  wire d_ff5_n_5;
  wire d_ff5_n_6;
  wire d_ff5_n_7;
  wire d_ff5_n_8;
  wire d_ff5_n_9;
  wire [31:0]data_in;
  wire [31:0]data_in_IBUF;
  wire [26:0]data_out_LUT;
  wire [31:0]data_output;
  wire [31:31]data_output2;
  wire [31:0]data_output_OBUF;
  wire enab_RB3;
  wire enab_cont_iter;
  wire enab_cont_var;
  wire enab_d_ff2_RB2;
  wire enab_d_ff4_Xn;
  wire enab_d_ff4_Yn;
  wire enab_d_ff4_Zn;
  wire enab_d_ff5_data_out;
  wire enab_d_ff_RB1;
  wire enab_dff_5;
  wire max_tick_iter;
  wire mux1_x0_n_0;
  wire mux1_x0_n_1;
  wire mux1_x0_n_10;
  wire mux1_x0_n_11;
  wire mux1_x0_n_12;
  wire mux1_x0_n_13;
  wire mux1_x0_n_14;
  wire mux1_x0_n_15;
  wire mux1_x0_n_16;
  wire mux1_x0_n_17;
  wire mux1_x0_n_18;
  wire mux1_x0_n_19;
  wire mux1_x0_n_2;
  wire mux1_x0_n_3;
  wire mux1_x0_n_4;
  wire mux1_x0_n_5;
  wire mux1_x0_n_6;
  wire mux1_x0_n_7;
  wire mux1_x0_n_8;
  wire mux1_x0_n_9;
  wire mux1_z0_n_0;
  wire mux1_z0_n_1;
  wire mux1_z0_n_10;
  wire mux1_z0_n_11;
  wire mux1_z0_n_12;
  wire mux1_z0_n_13;
  wire mux1_z0_n_14;
  wire mux1_z0_n_15;
  wire mux1_z0_n_16;
  wire mux1_z0_n_17;
  wire mux1_z0_n_18;
  wire mux1_z0_n_19;
  wire mux1_z0_n_2;
  wire mux1_z0_n_20;
  wire mux1_z0_n_21;
  wire mux1_z0_n_22;
  wire mux1_z0_n_23;
  wire mux1_z0_n_24;
  wire mux1_z0_n_25;
  wire mux1_z0_n_26;
  wire mux1_z0_n_27;
  wire mux1_z0_n_28;
  wire mux1_z0_n_29;
  wire mux1_z0_n_3;
  wire mux1_z0_n_30;
  wire mux1_z0_n_31;
  wire mux1_z0_n_4;
  wire mux1_z0_n_5;
  wire mux1_z0_n_6;
  wire mux1_z0_n_7;
  wire mux1_z0_n_8;
  wire mux1_z0_n_9;
  wire mux_2x1_sal_n_0;
  wire mux_2x1_sal_n_1;
  wire mux_2x1_sal_n_10;
  wire mux_2x1_sal_n_11;
  wire mux_2x1_sal_n_12;
  wire mux_2x1_sal_n_13;
  wire mux_2x1_sal_n_14;
  wire mux_2x1_sal_n_15;
  wire mux_2x1_sal_n_16;
  wire mux_2x1_sal_n_17;
  wire mux_2x1_sal_n_18;
  wire mux_2x1_sal_n_19;
  wire mux_2x1_sal_n_2;
  wire mux_2x1_sal_n_20;
  wire mux_2x1_sal_n_21;
  wire mux_2x1_sal_n_22;
  wire mux_2x1_sal_n_23;
  wire mux_2x1_sal_n_24;
  wire mux_2x1_sal_n_25;
  wire mux_2x1_sal_n_26;
  wire mux_2x1_sal_n_27;
  wire mux_2x1_sal_n_28;
  wire mux_2x1_sal_n_29;
  wire mux_2x1_sal_n_3;
  wire mux_2x1_sal_n_30;
  wire mux_2x1_sal_n_31;
  wire mux_2x1_sal_n_4;
  wire mux_2x1_sal_n_5;
  wire mux_2x1_sal_n_6;
  wire mux_2x1_sal_n_7;
  wire mux_2x1_sal_n_8;
  wire mux_2x1_sal_n_9;
  wire operation;
  wire operation_IBUF;
  wire overflow_flag;
  wire overflow_flag_OBUF;
  wire [2:2]p_1_out;
  wire ready_cordic;
  wire ready_cordic_OBUF;
  wire reg_LUT_n_0;
  wire reg_LUT_n_1;
  wire reg_LUT_n_10;
  wire reg_LUT_n_11;
  wire reg_LUT_n_12;
  wire reg_LUT_n_13;
  wire reg_LUT_n_14;
  wire reg_LUT_n_15;
  wire reg_LUT_n_16;
  wire reg_LUT_n_17;
  wire reg_LUT_n_18;
  wire reg_LUT_n_19;
  wire reg_LUT_n_2;
  wire reg_LUT_n_20;
  wire reg_LUT_n_3;
  wire reg_LUT_n_4;
  wire reg_LUT_n_5;
  wire reg_LUT_n_6;
  wire reg_LUT_n_7;
  wire reg_LUT_n_8;
  wire reg_LUT_n_9;
  wire reg_Z0_n_0;
  wire reg_Z0_n_1;
  wire reg_Z0_n_10;
  wire reg_Z0_n_11;
  wire reg_Z0_n_12;
  wire reg_Z0_n_13;
  wire reg_Z0_n_14;
  wire reg_Z0_n_15;
  wire reg_Z0_n_16;
  wire reg_Z0_n_17;
  wire reg_Z0_n_18;
  wire reg_Z0_n_19;
  wire reg_Z0_n_2;
  wire reg_Z0_n_20;
  wire reg_Z0_n_21;
  wire reg_Z0_n_22;
  wire reg_Z0_n_23;
  wire reg_Z0_n_24;
  wire reg_Z0_n_25;
  wire reg_Z0_n_26;
  wire reg_Z0_n_27;
  wire reg_Z0_n_28;
  wire reg_Z0_n_29;
  wire reg_Z0_n_3;
  wire reg_Z0_n_30;
  wire reg_Z0_n_31;
  wire reg_Z0_n_4;
  wire reg_Z0_n_5;
  wire reg_Z0_n_6;
  wire reg_Z0_n_7;
  wire reg_Z0_n_8;
  wire reg_Z0_n_9;
  wire reg_ch_mux_1_n_0;
  wire reg_ch_mux_1_n_1;
  wire reg_ch_mux_1_n_10;
  wire reg_ch_mux_1_n_11;
  wire reg_ch_mux_1_n_12;
  wire reg_ch_mux_1_n_13;
  wire reg_ch_mux_1_n_14;
  wire reg_ch_mux_1_n_15;
  wire reg_ch_mux_1_n_16;
  wire reg_ch_mux_1_n_17;
  wire reg_ch_mux_1_n_18;
  wire reg_ch_mux_1_n_19;
  wire reg_ch_mux_1_n_2;
  wire reg_ch_mux_1_n_20;
  wire reg_ch_mux_1_n_21;
  wire reg_ch_mux_1_n_22;
  wire reg_ch_mux_1_n_23;
  wire reg_ch_mux_1_n_24;
  wire reg_ch_mux_1_n_25;
  wire reg_ch_mux_1_n_26;
  wire reg_ch_mux_1_n_27;
  wire reg_ch_mux_1_n_28;
  wire reg_ch_mux_1_n_29;
  wire reg_ch_mux_1_n_3;
  wire reg_ch_mux_1_n_30;
  wire reg_ch_mux_1_n_31;
  wire reg_ch_mux_1_n_32;
  wire reg_ch_mux_1_n_33;
  wire reg_ch_mux_1_n_34;
  wire reg_ch_mux_1_n_35;
  wire reg_ch_mux_1_n_36;
  wire reg_ch_mux_1_n_37;
  wire reg_ch_mux_1_n_38;
  wire reg_ch_mux_1_n_39;
  wire reg_ch_mux_1_n_4;
  wire reg_ch_mux_1_n_40;
  wire reg_ch_mux_1_n_41;
  wire reg_ch_mux_1_n_42;
  wire reg_ch_mux_1_n_43;
  wire reg_ch_mux_1_n_44;
  wire reg_ch_mux_1_n_5;
  wire reg_ch_mux_1_n_6;
  wire reg_ch_mux_1_n_7;
  wire reg_ch_mux_1_n_8;
  wire reg_ch_mux_1_n_9;
  wire reg_ch_mux_2_n_0;
  wire reg_ch_mux_2_n_1;
  wire reg_ch_mux_2_n_10;
  wire reg_ch_mux_2_n_11;
  wire reg_ch_mux_2_n_12;
  wire reg_ch_mux_2_n_13;
  wire reg_ch_mux_2_n_14;
  wire reg_ch_mux_2_n_15;
  wire reg_ch_mux_2_n_16;
  wire reg_ch_mux_2_n_17;
  wire reg_ch_mux_2_n_18;
  wire reg_ch_mux_2_n_19;
  wire reg_ch_mux_2_n_2;
  wire reg_ch_mux_2_n_20;
  wire reg_ch_mux_2_n_21;
  wire reg_ch_mux_2_n_22;
  wire reg_ch_mux_2_n_23;
  wire reg_ch_mux_2_n_24;
  wire reg_ch_mux_2_n_25;
  wire reg_ch_mux_2_n_26;
  wire reg_ch_mux_2_n_27;
  wire reg_ch_mux_2_n_28;
  wire reg_ch_mux_2_n_29;
  wire reg_ch_mux_2_n_3;
  wire reg_ch_mux_2_n_30;
  wire reg_ch_mux_2_n_31;
  wire reg_ch_mux_2_n_32;
  wire reg_ch_mux_2_n_33;
  wire reg_ch_mux_2_n_34;
  wire reg_ch_mux_2_n_35;
  wire reg_ch_mux_2_n_36;
  wire reg_ch_mux_2_n_37;
  wire reg_ch_mux_2_n_38;
  wire reg_ch_mux_2_n_39;
  wire reg_ch_mux_2_n_4;
  wire reg_ch_mux_2_n_40;
  wire reg_ch_mux_2_n_41;
  wire reg_ch_mux_2_n_42;
  wire reg_ch_mux_2_n_43;
  wire reg_ch_mux_2_n_44;
  wire reg_ch_mux_2_n_45;
  wire reg_ch_mux_2_n_46;
  wire reg_ch_mux_2_n_47;
  wire reg_ch_mux_2_n_48;
  wire reg_ch_mux_2_n_49;
  wire reg_ch_mux_2_n_5;
  wire reg_ch_mux_2_n_50;
  wire reg_ch_mux_2_n_51;
  wire reg_ch_mux_2_n_52;
  wire reg_ch_mux_2_n_53;
  wire reg_ch_mux_2_n_54;
  wire reg_ch_mux_2_n_55;
  wire reg_ch_mux_2_n_56;
  wire reg_ch_mux_2_n_57;
  wire reg_ch_mux_2_n_58;
  wire reg_ch_mux_2_n_59;
  wire reg_ch_mux_2_n_6;
  wire reg_ch_mux_2_n_60;
  wire reg_ch_mux_2_n_61;
  wire reg_ch_mux_2_n_62;
  wire reg_ch_mux_2_n_63;
  wire reg_ch_mux_2_n_7;
  wire reg_ch_mux_2_n_8;
  wire reg_ch_mux_2_n_9;
  wire reg_ch_mux_3_n_0;
  wire reg_region_flag_n_0;
  wire reg_region_flag_n_1;
  wire reg_region_flag_n_2;
  wire reg_shift_x_n_0;
  wire reg_shift_x_n_1;
  wire reg_shift_x_n_10;
  wire reg_shift_x_n_11;
  wire reg_shift_x_n_12;
  wire reg_shift_x_n_13;
  wire reg_shift_x_n_14;
  wire reg_shift_x_n_15;
  wire reg_shift_x_n_16;
  wire reg_shift_x_n_17;
  wire reg_shift_x_n_18;
  wire reg_shift_x_n_19;
  wire reg_shift_x_n_2;
  wire reg_shift_x_n_20;
  wire reg_shift_x_n_21;
  wire reg_shift_x_n_22;
  wire reg_shift_x_n_23;
  wire reg_shift_x_n_24;
  wire reg_shift_x_n_25;
  wire reg_shift_x_n_26;
  wire reg_shift_x_n_27;
  wire reg_shift_x_n_28;
  wire reg_shift_x_n_29;
  wire reg_shift_x_n_3;
  wire reg_shift_x_n_30;
  wire reg_shift_x_n_31;
  wire reg_shift_x_n_4;
  wire reg_shift_x_n_5;
  wire reg_shift_x_n_6;
  wire reg_shift_x_n_7;
  wire reg_shift_x_n_8;
  wire reg_shift_x_n_9;
  wire reg_shift_y_n_0;
  wire reg_shift_y_n_1;
  wire reg_shift_y_n_10;
  wire reg_shift_y_n_11;
  wire reg_shift_y_n_12;
  wire reg_shift_y_n_13;
  wire reg_shift_y_n_14;
  wire reg_shift_y_n_15;
  wire reg_shift_y_n_16;
  wire reg_shift_y_n_17;
  wire reg_shift_y_n_18;
  wire reg_shift_y_n_19;
  wire reg_shift_y_n_2;
  wire reg_shift_y_n_20;
  wire reg_shift_y_n_21;
  wire reg_shift_y_n_22;
  wire reg_shift_y_n_23;
  wire reg_shift_y_n_24;
  wire reg_shift_y_n_25;
  wire reg_shift_y_n_26;
  wire reg_shift_y_n_27;
  wire reg_shift_y_n_28;
  wire reg_shift_y_n_29;
  wire reg_shift_y_n_3;
  wire reg_shift_y_n_30;
  wire reg_shift_y_n_31;
  wire reg_shift_y_n_4;
  wire reg_shift_y_n_5;
  wire reg_shift_y_n_6;
  wire reg_shift_y_n_7;
  wire reg_shift_y_n_8;
  wire reg_shift_y_n_9;
  wire reg_val_muxX_2stage_n_0;
  wire reg_val_muxX_2stage_n_1;
  wire reg_val_muxX_2stage_n_13;
  wire reg_val_muxX_2stage_n_14;
  wire reg_val_muxX_2stage_n_15;
  wire reg_val_muxX_2stage_n_16;
  wire reg_val_muxX_2stage_n_17;
  wire reg_val_muxX_2stage_n_18;
  wire reg_val_muxX_2stage_n_19;
  wire reg_val_muxX_2stage_n_2;
  wire reg_val_muxX_2stage_n_20;
  wire reg_val_muxX_2stage_n_21;
  wire reg_val_muxX_2stage_n_22;
  wire reg_val_muxX_2stage_n_23;
  wire reg_val_muxX_2stage_n_24;
  wire reg_val_muxX_2stage_n_25;
  wire reg_val_muxX_2stage_n_26;
  wire reg_val_muxX_2stage_n_27;
  wire reg_val_muxX_2stage_n_28;
  wire reg_val_muxX_2stage_n_29;
  wire reg_val_muxX_2stage_n_3;
  wire reg_val_muxX_2stage_n_30;
  wire reg_val_muxX_2stage_n_31;
  wire reg_val_muxX_2stage_n_32;
  wire reg_val_muxX_2stage_n_33;
  wire reg_val_muxX_2stage_n_34;
  wire reg_val_muxX_2stage_n_35;
  wire reg_val_muxX_2stage_n_36;
  wire reg_val_muxX_2stage_n_37;
  wire reg_val_muxX_2stage_n_38;
  wire reg_val_muxX_2stage_n_39;
  wire reg_val_muxX_2stage_n_4;
  wire reg_val_muxY_2stage_n_0;
  wire reg_val_muxY_2stage_n_1;
  wire reg_val_muxY_2stage_n_10;
  wire reg_val_muxY_2stage_n_11;
  wire reg_val_muxY_2stage_n_12;
  wire reg_val_muxY_2stage_n_13;
  wire reg_val_muxY_2stage_n_14;
  wire reg_val_muxY_2stage_n_15;
  wire reg_val_muxY_2stage_n_16;
  wire reg_val_muxY_2stage_n_17;
  wire reg_val_muxY_2stage_n_18;
  wire reg_val_muxY_2stage_n_19;
  wire reg_val_muxY_2stage_n_2;
  wire reg_val_muxY_2stage_n_20;
  wire reg_val_muxY_2stage_n_21;
  wire reg_val_muxY_2stage_n_22;
  wire reg_val_muxY_2stage_n_23;
  wire reg_val_muxY_2stage_n_24;
  wire reg_val_muxY_2stage_n_25;
  wire reg_val_muxY_2stage_n_26;
  wire reg_val_muxY_2stage_n_27;
  wire reg_val_muxY_2stage_n_28;
  wire reg_val_muxY_2stage_n_29;
  wire reg_val_muxY_2stage_n_3;
  wire reg_val_muxY_2stage_n_30;
  wire reg_val_muxY_2stage_n_31;
  wire reg_val_muxY_2stage_n_32;
  wire reg_val_muxY_2stage_n_33;
  wire reg_val_muxY_2stage_n_34;
  wire reg_val_muxY_2stage_n_35;
  wire reg_val_muxY_2stage_n_36;
  wire reg_val_muxY_2stage_n_37;
  wire reg_val_muxY_2stage_n_38;
  wire reg_val_muxY_2stage_n_39;
  wire reg_val_muxY_2stage_n_5;
  wire reg_val_muxY_2stage_n_6;
  wire reg_val_muxY_2stage_n_7;
  wire reg_val_muxY_2stage_n_8;
  wire reg_val_muxY_2stage_n_9;
  wire reg_val_muxZ_2stage_n_1;
  wire reg_val_muxZ_2stage_n_10;
  wire reg_val_muxZ_2stage_n_11;
  wire reg_val_muxZ_2stage_n_12;
  wire reg_val_muxZ_2stage_n_13;
  wire reg_val_muxZ_2stage_n_14;
  wire reg_val_muxZ_2stage_n_15;
  wire reg_val_muxZ_2stage_n_16;
  wire reg_val_muxZ_2stage_n_17;
  wire reg_val_muxZ_2stage_n_18;
  wire reg_val_muxZ_2stage_n_19;
  wire reg_val_muxZ_2stage_n_2;
  wire reg_val_muxZ_2stage_n_20;
  wire reg_val_muxZ_2stage_n_21;
  wire reg_val_muxZ_2stage_n_22;
  wire reg_val_muxZ_2stage_n_23;
  wire reg_val_muxZ_2stage_n_24;
  wire reg_val_muxZ_2stage_n_25;
  wire reg_val_muxZ_2stage_n_26;
  wire reg_val_muxZ_2stage_n_27;
  wire reg_val_muxZ_2stage_n_28;
  wire reg_val_muxZ_2stage_n_29;
  wire reg_val_muxZ_2stage_n_3;
  wire reg_val_muxZ_2stage_n_30;
  wire reg_val_muxZ_2stage_n_31;
  wire reg_val_muxZ_2stage_n_4;
  wire reg_val_muxZ_2stage_n_5;
  wire reg_val_muxZ_2stage_n_6;
  wire reg_val_muxZ_2stage_n_7;
  wire reg_val_muxZ_2stage_n_8;
  wire reg_val_muxZ_2stage_n_9;
  wire reset_reg_cordic;
  wire rst;
  wire rst_IBUF;
  wire [1:0]shift_region_flag;
  wire [1:0]shift_region_flag_IBUF;
  wire shift_y_n_0;
  wire shift_y_n_1;
  wire shift_y_n_2;
  wire shift_y_n_3;
  wire shift_y_n_4;
  wire shift_y_n_5;
  wire shift_y_n_6;
  wire shift_y_n_7;
  wire underflow_flag;
  wire underflow_flag_OBUF;

  IBUF ack_cordic_IBUF_inst
       (.I(ack_cordic),
        .O(ack_cordic_IBUF));
  FPU_Add_Subtract_Function add_subt_module
       (.AR(rst_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({reg_ch_mux_2_n_0,reg_ch_mux_2_n_1,reg_ch_mux_2_n_2,reg_ch_mux_2_n_3,reg_ch_mux_2_n_4,reg_ch_mux_2_n_5,reg_ch_mux_2_n_6,reg_ch_mux_2_n_7,reg_ch_mux_2_n_8,reg_ch_mux_2_n_9,reg_ch_mux_2_n_10,reg_ch_mux_2_n_11,reg_ch_mux_2_n_12,reg_ch_mux_2_n_13,reg_ch_mux_2_n_14,reg_ch_mux_2_n_15,reg_ch_mux_2_n_16,reg_ch_mux_2_n_17,reg_ch_mux_2_n_18,reg_ch_mux_2_n_19,reg_ch_mux_2_n_20,reg_ch_mux_2_n_21,reg_ch_mux_2_n_22,reg_ch_mux_2_n_23,reg_ch_mux_2_n_24,reg_ch_mux_2_n_25,reg_ch_mux_2_n_26,reg_ch_mux_2_n_27,reg_ch_mux_2_n_28,reg_ch_mux_2_n_29,reg_ch_mux_2_n_30,reg_ch_mux_2_n_31}),
        .\FSM_sequential_state_reg_reg[0] (add_subt_module_n_2),
        .\FSM_sequential_state_reg_reg[3] (cordic_FSM_n_7),
        .\FSM_sequential_state_reg_reg[3]_0 (cordic_FSM_n_15),
        .Q({add_subt_module_n_3,add_subt_module_n_4,add_subt_module_n_5,add_subt_module_n_6,add_subt_module_n_7,add_subt_module_n_8,add_subt_module_n_9,add_subt_module_n_10,add_subt_module_n_11,add_subt_module_n_12,add_subt_module_n_13,add_subt_module_n_14,add_subt_module_n_15,add_subt_module_n_16,add_subt_module_n_17,add_subt_module_n_18,add_subt_module_n_19,add_subt_module_n_20,add_subt_module_n_21,add_subt_module_n_22,add_subt_module_n_23,add_subt_module_n_24,add_subt_module_n_25,add_subt_module_n_26,add_subt_module_n_27,add_subt_module_n_28,add_subt_module_n_29,add_subt_module_n_30,add_subt_module_n_31,add_subt_module_n_32,add_subt_module_n_33,add_subt_module_n_34}),
        .\Q_reg[31] ({reg_ch_mux_2_n_32,reg_ch_mux_2_n_33,reg_ch_mux_2_n_34,reg_ch_mux_2_n_35,reg_ch_mux_2_n_36,reg_ch_mux_2_n_37,reg_ch_mux_2_n_38,reg_ch_mux_2_n_39,reg_ch_mux_2_n_40,reg_ch_mux_2_n_41,reg_ch_mux_2_n_42,reg_ch_mux_2_n_43,reg_ch_mux_2_n_44,reg_ch_mux_2_n_45,reg_ch_mux_2_n_46,reg_ch_mux_2_n_47,reg_ch_mux_2_n_48,reg_ch_mux_2_n_49,reg_ch_mux_2_n_50,reg_ch_mux_2_n_51,reg_ch_mux_2_n_52,reg_ch_mux_2_n_53,reg_ch_mux_2_n_54,reg_ch_mux_2_n_55,reg_ch_mux_2_n_56,reg_ch_mux_2_n_57,reg_ch_mux_2_n_58,reg_ch_mux_2_n_59,reg_ch_mux_2_n_60,reg_ch_mux_2_n_61,reg_ch_mux_2_n_62,reg_ch_mux_2_n_63}),
        .\count_reg[0] (cont_var_n_5),
        .out({cordic_FSM_n_2,cordic_FSM_n_3}),
        .overflow_flag_OBUF(overflow_flag_OBUF),
        .underflow_flag_OBUF(underflow_flag_OBUF));
  IBUF beg_fsm_cordic_IBUF_inst
       (.I(beg_fsm_cordic),
        .O(beg_fsm_cordic_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  counter_d cont_iter
       (.AR(cordic_FSM_n_18),
        .CLK(clk_IBUF_BUFG),
        .D({data_out_LUT[26:24],cont_iter_n_8,data_out_LUT[22:21],cont_iter_n_11,cont_iter_n_12,cont_iter_n_13,data_out_LUT[14],data_out_LUT[12:9],p_1_out,data_out_LUT[6],data_out_LUT[4],cont_iter_n_22,cont_iter_n_23,data_out_LUT[0]}),
        .E(enab_d_ff_RB1),
        .\FSM_sequential_state_reg_reg[0] (enab_cont_iter),
        .\FSM_sequential_state_reg_reg[2] (cont_iter_n_26),
        .Q(cont_iter_out),
        .\Q_reg[0] (cont_iter_n_28),
        .\Q_reg[1] (cont_iter_n_25),
        .cont_var_out(cont_var_out),
        .\count_reg[1]_0 ({cordic_FSM_n_21,cordic_FSM_n_22}),
        .\count_reg[3]_0 (cont_iter_n_27),
        .max_tick_iter(max_tick_iter),
        .out({cordic_FSM_n_0,cordic_FSM_n_1}));
  counter_up cont_var
       (.AR(cordic_FSM_n_18),
        .CLK(clk_IBUF_BUFG),
        .E(enab_d_ff4_Xn),
        .\FSM_sequential_state_reg_reg[1] (cordic_FSM_n_5),
        .\FSM_sequential_state_reg_reg[1]_0 (enab_RB3),
        .\FSM_sequential_state_reg_reg[3] (add_subt_module_n_2),
        .\Q_reg[0] (cont_var_n_5),
        .\Q_reg[0]_0 (reg_region_flag_n_2),
        .\Q_reg[31] (enab_d_ff4_Zn),
        .cont_var_out(cont_var_out),
        .\count_reg[0]_0 (cont_var_n_4),
        .d_ff3_sign_out(d_ff3_sign_out),
        .enab_cont_var(enab_cont_var),
        .max_tick_iter(max_tick_iter),
        .out({cordic_FSM_n_0,cordic_FSM_n_1,cordic_FSM_n_2,cordic_FSM_n_3}));
  CORDIC_FSM_v2 cordic_FSM
       (.AR(reset_reg_cordic),
        .CLK(clk_IBUF_BUFG),
        .E(enab_dff_5),
        .\FSM_sequential_state_reg_reg[0]_0 (cordic_FSM_n_7),
        .\FSM_sequential_state_reg_reg[0]_1 (cordic_FSM_n_15),
        .\FSM_sequential_state_reg_reg[2]_0 (cont_iter_n_28),
        .\FSM_sequential_state_reg_reg[3]_0 (add_subt_module_n_2),
        .Q(cont_iter_out[1:0]),
        .\Q_reg[0] (enab_RB3),
        .\Q_reg[0]_0 (cordic_FSM_n_17),
        .\Q_reg[0]_1 (cordic_FSM_n_20),
        .\Q_reg[0]_2 (cordic_FSM_n_23),
        .\Q_reg[0]_3 (reg_region_flag_n_2),
        .\Q_reg[0]_4 (reg_ch_mux_3_n_0),
        .\Q_reg[0]_5 (reg_ch_mux_1_n_0),
        .\Q_reg[1] (enab_d_ff_RB1),
        .\Q_reg[31] (cordic_FSM_n_5),
        .\Q_reg[31]_0 (enab_d_ff5_data_out),
        .\Q_reg[31]_1 (enab_d_ff2_RB2),
        .\Q_reg[31]_2 (enab_d_ff4_Yn),
        .\Q_reg[31]_3 ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .ack_cordic_IBUF(ack_cordic_IBUF),
        .beg_fsm_cordic_IBUF(beg_fsm_cordic_IBUF),
        .cont_var_out(cont_var_out[0]),
        .\count_reg[0] (cont_iter_n_27),
        .\count_reg[0]_0 (cont_iter_n_26),
        .\count_reg[1] ({cordic_FSM_n_21,cordic_FSM_n_22}),
        .\count_reg[1]_0 (cont_var_n_4),
        .\count_reg[3] (enab_cont_iter),
        .enab_cont_var(enab_cont_var),
        .max_tick_iter(max_tick_iter),
        .out({cordic_FSM_n_0,cordic_FSM_n_1,cordic_FSM_n_2,cordic_FSM_n_3}),
        .ready_cordic_OBUF(ready_cordic_OBUF),
        .rst(rst_IBUF));
  d_ff_en__parameterized9 d_ff4_Xn
       (.AR(cordic_FSM_n_17),
        .CLK(clk_IBUF_BUFG),
        .D({add_subt_module_n_3,add_subt_module_n_4,add_subt_module_n_5,add_subt_module_n_6,add_subt_module_n_7,add_subt_module_n_8,add_subt_module_n_9,add_subt_module_n_10,add_subt_module_n_11,add_subt_module_n_12,add_subt_module_n_13,add_subt_module_n_14,add_subt_module_n_15,add_subt_module_n_16,add_subt_module_n_17,add_subt_module_n_18,add_subt_module_n_19,add_subt_module_n_20,add_subt_module_n_21,add_subt_module_n_22,add_subt_module_n_23,add_subt_module_n_24,add_subt_module_n_25,add_subt_module_n_26,add_subt_module_n_27,add_subt_module_n_28,add_subt_module_n_29,add_subt_module_n_30,add_subt_module_n_31,add_subt_module_n_32,add_subt_module_n_33,add_subt_module_n_34}),
        .E(enab_d_ff4_Xn),
        .Q({d_ff4_Xn_n_0,d_ff4_Xn_n_1,d_ff4_Xn_n_2,d_ff4_Xn_n_3,d_ff4_Xn_n_4,d_ff4_Xn_n_5,d_ff4_Xn_n_6,d_ff4_Xn_n_7,d_ff4_Xn_n_8,d_ff4_Xn_n_9,d_ff4_Xn_n_10,d_ff4_Xn_n_11,d_ff4_Xn_n_12,d_ff4_Xn_n_13,d_ff4_Xn_n_14,d_ff4_Xn_n_15,d_ff4_Xn_n_16,d_ff4_Xn_n_17,d_ff4_Xn_n_18,d_ff4_Xn_n_19,d_ff4_Xn_n_20,d_ff4_Xn_n_21,d_ff4_Xn_n_22,d_ff4_Xn_n_23,d_ff4_Xn_n_24,d_ff4_Xn_n_25,d_ff4_Xn_n_26,d_ff4_Xn_n_27,d_ff4_Xn_n_28,d_ff4_Xn_n_29,d_ff4_Xn_n_30,d_ff4_Xn_n_31}));
  d_ff_en__parameterized10 d_ff4_Yn
       (.AR(cordic_FSM_n_17),
        .CLK(clk_IBUF_BUFG),
        .D({add_subt_module_n_3,add_subt_module_n_4,add_subt_module_n_5,add_subt_module_n_6,add_subt_module_n_7,add_subt_module_n_8,add_subt_module_n_9,add_subt_module_n_10,add_subt_module_n_11,add_subt_module_n_12,add_subt_module_n_13,add_subt_module_n_14,add_subt_module_n_15,add_subt_module_n_16,add_subt_module_n_17,add_subt_module_n_18,add_subt_module_n_19,add_subt_module_n_20,add_subt_module_n_21,add_subt_module_n_22,add_subt_module_n_23,add_subt_module_n_24,add_subt_module_n_25,add_subt_module_n_26,add_subt_module_n_27,add_subt_module_n_28,add_subt_module_n_29,add_subt_module_n_30,add_subt_module_n_31,add_subt_module_n_32,add_subt_module_n_33,add_subt_module_n_34}),
        .E(enab_d_ff4_Yn),
        .Q({d_ff4_Yn_n_0,d_ff4_Yn_n_1,d_ff4_Yn_n_2,d_ff4_Yn_n_3,d_ff4_Yn_n_4,d_ff4_Yn_n_5,d_ff4_Yn_n_6,d_ff4_Yn_n_7,d_ff4_Yn_n_8,d_ff4_Yn_n_9,d_ff4_Yn_n_10,d_ff4_Yn_n_11,d_ff4_Yn_n_12,d_ff4_Yn_n_13,d_ff4_Yn_n_14,d_ff4_Yn_n_15,d_ff4_Yn_n_16,d_ff4_Yn_n_17,d_ff4_Yn_n_18,d_ff4_Yn_n_19,d_ff4_Yn_n_20,d_ff4_Yn_n_21,d_ff4_Yn_n_22,d_ff4_Yn_n_23,d_ff4_Yn_n_24,d_ff4_Yn_n_25,d_ff4_Yn_n_26,d_ff4_Yn_n_27,d_ff4_Yn_n_28,d_ff4_Yn_n_29,d_ff4_Yn_n_30,d_ff4_Yn_n_31}));
  d_ff_en__parameterized11 d_ff4_Zn
       (.AR(cordic_FSM_n_17),
        .CLK(clk_IBUF_BUFG),
        .D({add_subt_module_n_3,add_subt_module_n_4,add_subt_module_n_5,add_subt_module_n_6,add_subt_module_n_7,add_subt_module_n_8,add_subt_module_n_9,add_subt_module_n_10,add_subt_module_n_11,add_subt_module_n_12,add_subt_module_n_13,add_subt_module_n_14,add_subt_module_n_15,add_subt_module_n_16,add_subt_module_n_17,add_subt_module_n_18,add_subt_module_n_19,add_subt_module_n_20,add_subt_module_n_21,add_subt_module_n_22,add_subt_module_n_23,add_subt_module_n_24,add_subt_module_n_25,add_subt_module_n_26,add_subt_module_n_27,add_subt_module_n_28,add_subt_module_n_29,add_subt_module_n_30,add_subt_module_n_31,add_subt_module_n_32,add_subt_module_n_33,add_subt_module_n_34}),
        .E(enab_d_ff4_Zn),
        .Q({d_ff4_Zn_n_0,d_ff4_Zn_n_1,d_ff4_Zn_n_2,d_ff4_Zn_n_3,d_ff4_Zn_n_4,d_ff4_Zn_n_5,d_ff4_Zn_n_6,d_ff4_Zn_n_7,d_ff4_Zn_n_8,d_ff4_Zn_n_9,d_ff4_Zn_n_10,d_ff4_Zn_n_11,d_ff4_Zn_n_12,d_ff4_Zn_n_13,d_ff4_Zn_n_14,d_ff4_Zn_n_15,d_ff4_Zn_n_16,d_ff4_Zn_n_17,d_ff4_Zn_n_18,d_ff4_Zn_n_19,d_ff4_Zn_n_20,d_ff4_Zn_n_21,d_ff4_Zn_n_22,d_ff4_Zn_n_23,d_ff4_Zn_n_24,d_ff4_Zn_n_25,d_ff4_Zn_n_26,d_ff4_Zn_n_27,d_ff4_Zn_n_28,d_ff4_Zn_n_29,d_ff4_Zn_n_30,d_ff4_Zn_n_31}));
  d_ff_en__parameterized12 d_ff5
       (.AR({cordic_FSM_n_19,reset_reg_cordic}),
        .CLK(clk_IBUF_BUFG),
        .D({mux_2x1_sal_n_0,mux_2x1_sal_n_1,mux_2x1_sal_n_2,mux_2x1_sal_n_3,mux_2x1_sal_n_4,mux_2x1_sal_n_5,mux_2x1_sal_n_6,mux_2x1_sal_n_7,mux_2x1_sal_n_8,mux_2x1_sal_n_9,mux_2x1_sal_n_10,mux_2x1_sal_n_11,mux_2x1_sal_n_12,mux_2x1_sal_n_13,mux_2x1_sal_n_14,mux_2x1_sal_n_15,mux_2x1_sal_n_16,mux_2x1_sal_n_17,mux_2x1_sal_n_18,mux_2x1_sal_n_19,mux_2x1_sal_n_20,mux_2x1_sal_n_21,mux_2x1_sal_n_22,mux_2x1_sal_n_23,mux_2x1_sal_n_24,mux_2x1_sal_n_25,mux_2x1_sal_n_26,mux_2x1_sal_n_27,mux_2x1_sal_n_28,mux_2x1_sal_n_29,mux_2x1_sal_n_30,mux_2x1_sal_n_31}),
        .E(enab_dff_5),
        .Q({data_output2,d_ff5_n_1,d_ff5_n_2,d_ff5_n_3,d_ff5_n_4,d_ff5_n_5,d_ff5_n_6,d_ff5_n_7,d_ff5_n_8,d_ff5_n_9,d_ff5_n_10,d_ff5_n_11,d_ff5_n_12,d_ff5_n_13,d_ff5_n_14,d_ff5_n_15,d_ff5_n_16,d_ff5_n_17,d_ff5_n_18,d_ff5_n_19,d_ff5_n_20,d_ff5_n_21,d_ff5_n_22,d_ff5_n_23,d_ff5_n_24,d_ff5_n_25,d_ff5_n_26,d_ff5_n_27,d_ff5_n_28,d_ff5_n_29,d_ff5_n_30,d_ff5_n_31}));
  d_ff_en__parameterized13 d_ff5_data_out
       (.AR(reset_reg_cordic),
        .CLK(clk_IBUF_BUFG),
        .D({reg_region_flag_n_0,d_ff5_n_1,d_ff5_n_2,d_ff5_n_3,d_ff5_n_4,d_ff5_n_5,d_ff5_n_6,d_ff5_n_7,d_ff5_n_8,d_ff5_n_9,d_ff5_n_10,d_ff5_n_11,d_ff5_n_12,d_ff5_n_13,d_ff5_n_14,d_ff5_n_15,d_ff5_n_16,d_ff5_n_17,d_ff5_n_18,d_ff5_n_19,d_ff5_n_20,d_ff5_n_21,d_ff5_n_22,d_ff5_n_23,d_ff5_n_24,d_ff5_n_25,d_ff5_n_26,d_ff5_n_27,d_ff5_n_28,d_ff5_n_29,d_ff5_n_30,d_ff5_n_31}),
        .E(enab_d_ff5_data_out),
        .Q(data_output_OBUF));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[10]_inst 
       (.I(data_in[10]),
        .O(data_in_IBUF[10]));
  IBUF \data_in_IBUF[11]_inst 
       (.I(data_in[11]),
        .O(data_in_IBUF[11]));
  IBUF \data_in_IBUF[12]_inst 
       (.I(data_in[12]),
        .O(data_in_IBUF[12]));
  IBUF \data_in_IBUF[13]_inst 
       (.I(data_in[13]),
        .O(data_in_IBUF[13]));
  IBUF \data_in_IBUF[14]_inst 
       (.I(data_in[14]),
        .O(data_in_IBUF[14]));
  IBUF \data_in_IBUF[15]_inst 
       (.I(data_in[15]),
        .O(data_in_IBUF[15]));
  IBUF \data_in_IBUF[16]_inst 
       (.I(data_in[16]),
        .O(data_in_IBUF[16]));
  IBUF \data_in_IBUF[17]_inst 
       (.I(data_in[17]),
        .O(data_in_IBUF[17]));
  IBUF \data_in_IBUF[18]_inst 
       (.I(data_in[18]),
        .O(data_in_IBUF[18]));
  IBUF \data_in_IBUF[19]_inst 
       (.I(data_in[19]),
        .O(data_in_IBUF[19]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[20]_inst 
       (.I(data_in[20]),
        .O(data_in_IBUF[20]));
  IBUF \data_in_IBUF[21]_inst 
       (.I(data_in[21]),
        .O(data_in_IBUF[21]));
  IBUF \data_in_IBUF[22]_inst 
       (.I(data_in[22]),
        .O(data_in_IBUF[22]));
  IBUF \data_in_IBUF[23]_inst 
       (.I(data_in[23]),
        .O(data_in_IBUF[23]));
  IBUF \data_in_IBUF[24]_inst 
       (.I(data_in[24]),
        .O(data_in_IBUF[24]));
  IBUF \data_in_IBUF[25]_inst 
       (.I(data_in[25]),
        .O(data_in_IBUF[25]));
  IBUF \data_in_IBUF[26]_inst 
       (.I(data_in[26]),
        .O(data_in_IBUF[26]));
  IBUF \data_in_IBUF[27]_inst 
       (.I(data_in[27]),
        .O(data_in_IBUF[27]));
  IBUF \data_in_IBUF[28]_inst 
       (.I(data_in[28]),
        .O(data_in_IBUF[28]));
  IBUF \data_in_IBUF[29]_inst 
       (.I(data_in[29]),
        .O(data_in_IBUF[29]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[30]_inst 
       (.I(data_in[30]),
        .O(data_in_IBUF[30]));
  IBUF \data_in_IBUF[31]_inst 
       (.I(data_in[31]),
        .O(data_in_IBUF[31]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF \data_in_IBUF[4]_inst 
       (.I(data_in[4]),
        .O(data_in_IBUF[4]));
  IBUF \data_in_IBUF[5]_inst 
       (.I(data_in[5]),
        .O(data_in_IBUF[5]));
  IBUF \data_in_IBUF[6]_inst 
       (.I(data_in[6]),
        .O(data_in_IBUF[6]));
  IBUF \data_in_IBUF[7]_inst 
       (.I(data_in[7]),
        .O(data_in_IBUF[7]));
  IBUF \data_in_IBUF[8]_inst 
       (.I(data_in[8]),
        .O(data_in_IBUF[8]));
  IBUF \data_in_IBUF[9]_inst 
       (.I(data_in[9]),
        .O(data_in_IBUF[9]));
  OBUF \data_output_OBUF[0]_inst 
       (.I(data_output_OBUF[0]),
        .O(data_output[0]));
  OBUF \data_output_OBUF[10]_inst 
       (.I(data_output_OBUF[10]),
        .O(data_output[10]));
  OBUF \data_output_OBUF[11]_inst 
       (.I(data_output_OBUF[11]),
        .O(data_output[11]));
  OBUF \data_output_OBUF[12]_inst 
       (.I(data_output_OBUF[12]),
        .O(data_output[12]));
  OBUF \data_output_OBUF[13]_inst 
       (.I(data_output_OBUF[13]),
        .O(data_output[13]));
  OBUF \data_output_OBUF[14]_inst 
       (.I(data_output_OBUF[14]),
        .O(data_output[14]));
  OBUF \data_output_OBUF[15]_inst 
       (.I(data_output_OBUF[15]),
        .O(data_output[15]));
  OBUF \data_output_OBUF[16]_inst 
       (.I(data_output_OBUF[16]),
        .O(data_output[16]));
  OBUF \data_output_OBUF[17]_inst 
       (.I(data_output_OBUF[17]),
        .O(data_output[17]));
  OBUF \data_output_OBUF[18]_inst 
       (.I(data_output_OBUF[18]),
        .O(data_output[18]));
  OBUF \data_output_OBUF[19]_inst 
       (.I(data_output_OBUF[19]),
        .O(data_output[19]));
  OBUF \data_output_OBUF[1]_inst 
       (.I(data_output_OBUF[1]),
        .O(data_output[1]));
  OBUF \data_output_OBUF[20]_inst 
       (.I(data_output_OBUF[20]),
        .O(data_output[20]));
  OBUF \data_output_OBUF[21]_inst 
       (.I(data_output_OBUF[21]),
        .O(data_output[21]));
  OBUF \data_output_OBUF[22]_inst 
       (.I(data_output_OBUF[22]),
        .O(data_output[22]));
  OBUF \data_output_OBUF[23]_inst 
       (.I(data_output_OBUF[23]),
        .O(data_output[23]));
  OBUF \data_output_OBUF[24]_inst 
       (.I(data_output_OBUF[24]),
        .O(data_output[24]));
  OBUF \data_output_OBUF[25]_inst 
       (.I(data_output_OBUF[25]),
        .O(data_output[25]));
  OBUF \data_output_OBUF[26]_inst 
       (.I(data_output_OBUF[26]),
        .O(data_output[26]));
  OBUF \data_output_OBUF[27]_inst 
       (.I(data_output_OBUF[27]),
        .O(data_output[27]));
  OBUF \data_output_OBUF[28]_inst 
       (.I(data_output_OBUF[28]),
        .O(data_output[28]));
  OBUF \data_output_OBUF[29]_inst 
       (.I(data_output_OBUF[29]),
        .O(data_output[29]));
  OBUF \data_output_OBUF[2]_inst 
       (.I(data_output_OBUF[2]),
        .O(data_output[2]));
  OBUF \data_output_OBUF[30]_inst 
       (.I(data_output_OBUF[30]),
        .O(data_output[30]));
  OBUF \data_output_OBUF[31]_inst 
       (.I(data_output_OBUF[31]),
        .O(data_output[31]));
  OBUF \data_output_OBUF[3]_inst 
       (.I(data_output_OBUF[3]),
        .O(data_output[3]));
  OBUF \data_output_OBUF[4]_inst 
       (.I(data_output_OBUF[4]),
        .O(data_output[4]));
  OBUF \data_output_OBUF[5]_inst 
       (.I(data_output_OBUF[5]),
        .O(data_output[5]));
  OBUF \data_output_OBUF[6]_inst 
       (.I(data_output_OBUF[6]),
        .O(data_output[6]));
  OBUF \data_output_OBUF[7]_inst 
       (.I(data_output_OBUF[7]),
        .O(data_output[7]));
  OBUF \data_output_OBUF[8]_inst 
       (.I(data_output_OBUF[8]),
        .O(data_output[8]));
  OBUF \data_output_OBUF[9]_inst 
       (.I(data_output_OBUF[9]),
        .O(data_output[9]));
  Mux_2x1 mux1_x0
       (.D({mux1_x0_n_0,mux1_x0_n_1,mux1_x0_n_2,mux1_x0_n_3,mux1_x0_n_4,mux1_x0_n_5,mux1_x0_n_6,mux1_x0_n_7,mux1_x0_n_8,mux1_x0_n_9,mux1_x0_n_10,mux1_x0_n_11,mux1_x0_n_12,mux1_x0_n_13,mux1_x0_n_14,mux1_x0_n_15,mux1_x0_n_16,mux1_x0_n_17,mux1_x0_n_18,mux1_x0_n_19}),
        .Q({d_ff4_Xn_n_2,d_ff4_Xn_n_3,d_ff4_Xn_n_4,d_ff4_Xn_n_5,d_ff4_Xn_n_6,d_ff4_Xn_n_7,d_ff4_Xn_n_11,d_ff4_Xn_n_12,d_ff4_Xn_n_14,d_ff4_Xn_n_15,d_ff4_Xn_n_17,d_ff4_Xn_n_18,d_ff4_Xn_n_19,d_ff4_Xn_n_21,d_ff4_Xn_n_24,d_ff4_Xn_n_25,d_ff4_Xn_n_26,d_ff4_Xn_n_28,d_ff4_Xn_n_29,d_ff4_Xn_n_30}),
        .\Q_reg[0] (reg_ch_mux_1_n_0));
  Mux_2x1_0 mux1_z0
       (.D({mux1_z0_n_0,mux1_z0_n_1,mux1_z0_n_2,mux1_z0_n_3,mux1_z0_n_4,mux1_z0_n_5,mux1_z0_n_6,mux1_z0_n_7,mux1_z0_n_8,mux1_z0_n_9,mux1_z0_n_10,mux1_z0_n_11,mux1_z0_n_12,mux1_z0_n_13,mux1_z0_n_14,mux1_z0_n_15,mux1_z0_n_16,mux1_z0_n_17,mux1_z0_n_18,mux1_z0_n_19,mux1_z0_n_20,mux1_z0_n_21,mux1_z0_n_22,mux1_z0_n_23,mux1_z0_n_24,mux1_z0_n_25,mux1_z0_n_26,mux1_z0_n_27,mux1_z0_n_28,mux1_z0_n_29,mux1_z0_n_30,mux1_z0_n_31}),
        .Q({d_ff4_Zn_n_0,d_ff4_Zn_n_1,d_ff4_Zn_n_2,d_ff4_Zn_n_3,d_ff4_Zn_n_4,d_ff4_Zn_n_5,d_ff4_Zn_n_6,d_ff4_Zn_n_7,d_ff4_Zn_n_8,d_ff4_Zn_n_9,d_ff4_Zn_n_10,d_ff4_Zn_n_11,d_ff4_Zn_n_12,d_ff4_Zn_n_13,d_ff4_Zn_n_14,d_ff4_Zn_n_15,d_ff4_Zn_n_16,d_ff4_Zn_n_17,d_ff4_Zn_n_18,d_ff4_Zn_n_19,d_ff4_Zn_n_20,d_ff4_Zn_n_21,d_ff4_Zn_n_22,d_ff4_Zn_n_23,d_ff4_Zn_n_24,d_ff4_Zn_n_25,d_ff4_Zn_n_26,d_ff4_Zn_n_27,d_ff4_Zn_n_28,d_ff4_Zn_n_29,d_ff4_Zn_n_30,d_ff4_Zn_n_31}),
        .\Q_reg[0] (reg_ch_mux_1_n_0),
        .\Q_reg[31] ({reg_Z0_n_0,reg_Z0_n_1,reg_Z0_n_2,reg_Z0_n_3,reg_Z0_n_4,reg_Z0_n_5,reg_Z0_n_6,reg_Z0_n_7,reg_Z0_n_8,reg_Z0_n_9,reg_Z0_n_10,reg_Z0_n_11,reg_Z0_n_12,reg_Z0_n_13,reg_Z0_n_14,reg_Z0_n_15,reg_Z0_n_16,reg_Z0_n_17,reg_Z0_n_18,reg_Z0_n_19,reg_Z0_n_20,reg_Z0_n_21,reg_Z0_n_22,reg_Z0_n_23,reg_Z0_n_24,reg_Z0_n_25,reg_Z0_n_26,reg_Z0_n_27,reg_Z0_n_28,reg_Z0_n_29,reg_Z0_n_30,reg_Z0_n_31}));
  Mux_2x1_1 mux_2x1_sal
       (.D({mux_2x1_sal_n_0,mux_2x1_sal_n_1,mux_2x1_sal_n_2,mux_2x1_sal_n_3,mux_2x1_sal_n_4,mux_2x1_sal_n_5,mux_2x1_sal_n_6,mux_2x1_sal_n_7,mux_2x1_sal_n_8,mux_2x1_sal_n_9,mux_2x1_sal_n_10,mux_2x1_sal_n_11,mux_2x1_sal_n_12,mux_2x1_sal_n_13,mux_2x1_sal_n_14,mux_2x1_sal_n_15,mux_2x1_sal_n_16,mux_2x1_sal_n_17,mux_2x1_sal_n_18,mux_2x1_sal_n_19,mux_2x1_sal_n_20,mux_2x1_sal_n_21,mux_2x1_sal_n_22,mux_2x1_sal_n_23,mux_2x1_sal_n_24,mux_2x1_sal_n_25,mux_2x1_sal_n_26,mux_2x1_sal_n_27,mux_2x1_sal_n_28,mux_2x1_sal_n_29,mux_2x1_sal_n_30,mux_2x1_sal_n_31}),
        .Q({d_ff4_Yn_n_0,d_ff4_Yn_n_1,d_ff4_Yn_n_2,d_ff4_Yn_n_3,d_ff4_Yn_n_4,d_ff4_Yn_n_5,d_ff4_Yn_n_6,d_ff4_Yn_n_7,d_ff4_Yn_n_8,d_ff4_Yn_n_9,d_ff4_Yn_n_10,d_ff4_Yn_n_11,d_ff4_Yn_n_12,d_ff4_Yn_n_13,d_ff4_Yn_n_14,d_ff4_Yn_n_15,d_ff4_Yn_n_16,d_ff4_Yn_n_17,d_ff4_Yn_n_18,d_ff4_Yn_n_19,d_ff4_Yn_n_20,d_ff4_Yn_n_21,d_ff4_Yn_n_22,d_ff4_Yn_n_23,d_ff4_Yn_n_24,d_ff4_Yn_n_25,d_ff4_Yn_n_26,d_ff4_Yn_n_27,d_ff4_Yn_n_28,d_ff4_Yn_n_29,d_ff4_Yn_n_30,d_ff4_Yn_n_31}),
        .\Q_reg[0] (reg_ch_mux_3_n_0),
        .\Q_reg[31] ({d_ff4_Xn_n_0,d_ff4_Xn_n_1,d_ff4_Xn_n_2,d_ff4_Xn_n_3,d_ff4_Xn_n_4,d_ff4_Xn_n_5,d_ff4_Xn_n_6,d_ff4_Xn_n_7,d_ff4_Xn_n_8,d_ff4_Xn_n_9,d_ff4_Xn_n_10,d_ff4_Xn_n_11,d_ff4_Xn_n_12,d_ff4_Xn_n_13,d_ff4_Xn_n_14,d_ff4_Xn_n_15,d_ff4_Xn_n_16,d_ff4_Xn_n_17,d_ff4_Xn_n_18,d_ff4_Xn_n_19,d_ff4_Xn_n_20,d_ff4_Xn_n_21,d_ff4_Xn_n_22,d_ff4_Xn_n_23,d_ff4_Xn_n_24,d_ff4_Xn_n_25,d_ff4_Xn_n_26,d_ff4_Xn_n_27,d_ff4_Xn_n_28,d_ff4_Xn_n_29,d_ff4_Xn_n_30,d_ff4_Xn_n_31}));
  IBUF operation_IBUF_inst
       (.I(operation),
        .O(operation_IBUF));
  OBUF overflow_flag_OBUF_inst
       (.I(overflow_flag_OBUF),
        .O(overflow_flag));
  OBUF ready_cordic_OBUF_inst
       (.I(ready_cordic_OBUF),
        .O(ready_cordic));
  d_ff_en__parameterized7 reg_LUT
       (.CLK(clk_IBUF_BUFG),
        .D({data_out_LUT[26:24],cont_iter_n_8,data_out_LUT[22:21],cont_iter_n_11,cont_iter_n_12,cont_iter_n_13,data_out_LUT[14],data_out_LUT[12:9],p_1_out,data_out_LUT[6],data_out_LUT[4],cont_iter_n_22,cont_iter_n_23,data_out_LUT[0]}),
        .E(enab_RB3),
        .\FSM_sequential_state_reg_reg[1] ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .Q({reg_LUT_n_0,reg_LUT_n_1,reg_LUT_n_2,reg_LUT_n_3,reg_LUT_n_4,reg_LUT_n_5,reg_LUT_n_6,reg_LUT_n_7,reg_LUT_n_8,reg_LUT_n_9,reg_LUT_n_10,reg_LUT_n_11,reg_LUT_n_12,reg_LUT_n_13,reg_LUT_n_14,reg_LUT_n_15,reg_LUT_n_16,reg_LUT_n_17,reg_LUT_n_18,reg_LUT_n_19,reg_LUT_n_20}));
  d_ff_en__parameterized1 reg_Z0
       (.CLK(clk_IBUF_BUFG),
        .D(data_in_IBUF),
        .E(enab_d_ff_RB1),
        .\FSM_sequential_state_reg_reg[1] (cordic_FSM_n_17),
        .Q({reg_Z0_n_0,reg_Z0_n_1,reg_Z0_n_2,reg_Z0_n_3,reg_Z0_n_4,reg_Z0_n_5,reg_Z0_n_6,reg_Z0_n_7,reg_Z0_n_8,reg_Z0_n_9,reg_Z0_n_10,reg_Z0_n_11,reg_Z0_n_12,reg_Z0_n_13,reg_Z0_n_14,reg_Z0_n_15,reg_Z0_n_16,reg_Z0_n_17,reg_Z0_n_18,reg_Z0_n_19,reg_Z0_n_20,reg_Z0_n_21,reg_Z0_n_22,reg_Z0_n_23,reg_Z0_n_24,reg_Z0_n_25,reg_Z0_n_26,reg_Z0_n_27,reg_Z0_n_28,reg_Z0_n_29,reg_Z0_n_30,reg_Z0_n_31}));
  d_ff_en reg_ch_mux_1
       (.CLK(clk_IBUF_BUFG),
        .D({reg_ch_mux_1_n_1,reg_ch_mux_1_n_2,reg_ch_mux_1_n_3,reg_ch_mux_1_n_4,reg_ch_mux_1_n_5,reg_ch_mux_1_n_6,reg_ch_mux_1_n_7,reg_ch_mux_1_n_8,reg_ch_mux_1_n_9,reg_ch_mux_1_n_10,reg_ch_mux_1_n_11,reg_ch_mux_1_n_12}),
        .\FSM_sequential_state_reg_reg[0] (cordic_FSM_n_23),
        .\FSM_sequential_state_reg_reg[1] (cordic_FSM_n_17),
        .Q({d_ff4_Xn_n_0,d_ff4_Xn_n_1,d_ff4_Xn_n_8,d_ff4_Xn_n_9,d_ff4_Xn_n_10,d_ff4_Xn_n_13,d_ff4_Xn_n_16,d_ff4_Xn_n_20,d_ff4_Xn_n_22,d_ff4_Xn_n_23,d_ff4_Xn_n_27,d_ff4_Xn_n_31}),
        .\Q_reg[0]_0 (reg_ch_mux_1_n_0),
        .\Q_reg[31] ({reg_ch_mux_1_n_13,reg_ch_mux_1_n_14,reg_ch_mux_1_n_15,reg_ch_mux_1_n_16,reg_ch_mux_1_n_17,reg_ch_mux_1_n_18,reg_ch_mux_1_n_19,reg_ch_mux_1_n_20,reg_ch_mux_1_n_21,reg_ch_mux_1_n_22,reg_ch_mux_1_n_23,reg_ch_mux_1_n_24,reg_ch_mux_1_n_25,reg_ch_mux_1_n_26,reg_ch_mux_1_n_27,reg_ch_mux_1_n_28,reg_ch_mux_1_n_29,reg_ch_mux_1_n_30,reg_ch_mux_1_n_31,reg_ch_mux_1_n_32,reg_ch_mux_1_n_33,reg_ch_mux_1_n_34,reg_ch_mux_1_n_35,reg_ch_mux_1_n_36,reg_ch_mux_1_n_37,reg_ch_mux_1_n_38,reg_ch_mux_1_n_39,reg_ch_mux_1_n_40,reg_ch_mux_1_n_41,reg_ch_mux_1_n_42,reg_ch_mux_1_n_43,reg_ch_mux_1_n_44}),
        .\Q_reg[31]_0 ({d_ff4_Yn_n_0,d_ff4_Yn_n_1,d_ff4_Yn_n_2,d_ff4_Yn_n_3,d_ff4_Yn_n_4,d_ff4_Yn_n_5,d_ff4_Yn_n_6,d_ff4_Yn_n_7,d_ff4_Yn_n_8,d_ff4_Yn_n_9,d_ff4_Yn_n_10,d_ff4_Yn_n_11,d_ff4_Yn_n_12,d_ff4_Yn_n_13,d_ff4_Yn_n_14,d_ff4_Yn_n_15,d_ff4_Yn_n_16,d_ff4_Yn_n_17,d_ff4_Yn_n_18,d_ff4_Yn_n_19,d_ff4_Yn_n_20,d_ff4_Yn_n_21,d_ff4_Yn_n_22,d_ff4_Yn_n_23,d_ff4_Yn_n_24,d_ff4_Yn_n_25,d_ff4_Yn_n_26,d_ff4_Yn_n_27,d_ff4_Yn_n_28,d_ff4_Yn_n_29,d_ff4_Yn_n_30,d_ff4_Yn_n_31}));
  d_ff_en__parameterized8 reg_ch_mux_2
       (.CLK(clk_IBUF_BUFG),
        .D({reg_ch_mux_2_n_0,reg_ch_mux_2_n_1,reg_ch_mux_2_n_2,reg_ch_mux_2_n_3,reg_ch_mux_2_n_4,reg_ch_mux_2_n_5,reg_ch_mux_2_n_6,reg_ch_mux_2_n_7,reg_ch_mux_2_n_8,reg_ch_mux_2_n_9,reg_ch_mux_2_n_10,reg_ch_mux_2_n_11,reg_ch_mux_2_n_12,reg_ch_mux_2_n_13,reg_ch_mux_2_n_14,reg_ch_mux_2_n_15,reg_ch_mux_2_n_16,reg_ch_mux_2_n_17,reg_ch_mux_2_n_18,reg_ch_mux_2_n_19,reg_ch_mux_2_n_20,reg_ch_mux_2_n_21,reg_ch_mux_2_n_22,reg_ch_mux_2_n_23,reg_ch_mux_2_n_24,reg_ch_mux_2_n_25,reg_ch_mux_2_n_26,reg_ch_mux_2_n_27,reg_ch_mux_2_n_28,reg_ch_mux_2_n_29,reg_ch_mux_2_n_30,reg_ch_mux_2_n_31}),
        .\FSM_sequential_state_reg_reg[1] (cordic_FSM_n_18),
        .Q({reg_shift_x_n_0,reg_shift_x_n_1,reg_shift_x_n_2,reg_shift_x_n_3,reg_shift_x_n_4,reg_shift_x_n_5,reg_shift_x_n_6,reg_shift_x_n_7,reg_shift_x_n_8,reg_shift_x_n_9,reg_shift_x_n_10,reg_shift_x_n_11,reg_shift_x_n_12,reg_shift_x_n_13,reg_shift_x_n_14,reg_shift_x_n_15,reg_shift_x_n_16,reg_shift_x_n_17,reg_shift_x_n_18,reg_shift_x_n_19,reg_shift_x_n_20,reg_shift_x_n_21,reg_shift_x_n_22,reg_shift_x_n_23,reg_shift_x_n_24,reg_shift_x_n_25,reg_shift_x_n_26,reg_shift_x_n_27,reg_shift_x_n_28,reg_shift_x_n_29,reg_shift_x_n_30,reg_shift_x_n_31}),
        .\Q_reg[0]_0 (reg_region_flag_n_1),
        .\Q_reg[29] ({reg_LUT_n_0,reg_LUT_n_1,reg_LUT_n_2,reg_LUT_n_3,reg_LUT_n_4,reg_LUT_n_5,reg_LUT_n_6,reg_LUT_n_7,reg_LUT_n_8,reg_LUT_n_9,reg_LUT_n_10,reg_LUT_n_11,reg_LUT_n_12,reg_LUT_n_13,reg_LUT_n_14,reg_LUT_n_15,reg_LUT_n_16,reg_LUT_n_17,reg_LUT_n_18,reg_LUT_n_19,reg_LUT_n_20}),
        .\Q_reg[31] ({reg_ch_mux_2_n_32,reg_ch_mux_2_n_33,reg_ch_mux_2_n_34,reg_ch_mux_2_n_35,reg_ch_mux_2_n_36,reg_ch_mux_2_n_37,reg_ch_mux_2_n_38,reg_ch_mux_2_n_39,reg_ch_mux_2_n_40,reg_ch_mux_2_n_41,reg_ch_mux_2_n_42,reg_ch_mux_2_n_43,reg_ch_mux_2_n_44,reg_ch_mux_2_n_45,reg_ch_mux_2_n_46,reg_ch_mux_2_n_47,reg_ch_mux_2_n_48,reg_ch_mux_2_n_49,reg_ch_mux_2_n_50,reg_ch_mux_2_n_51,reg_ch_mux_2_n_52,reg_ch_mux_2_n_53,reg_ch_mux_2_n_54,reg_ch_mux_2_n_55,reg_ch_mux_2_n_56,reg_ch_mux_2_n_57,reg_ch_mux_2_n_58,reg_ch_mux_2_n_59,reg_ch_mux_2_n_60,reg_ch_mux_2_n_61,reg_ch_mux_2_n_62,reg_ch_mux_2_n_63}),
        .\Q_reg[31]_0 ({reg_shift_y_n_0,reg_shift_y_n_1,reg_shift_y_n_2,reg_shift_y_n_3,reg_shift_y_n_4,reg_shift_y_n_5,reg_shift_y_n_6,reg_shift_y_n_7,reg_shift_y_n_8,reg_shift_y_n_9,reg_shift_y_n_10,reg_shift_y_n_11,reg_shift_y_n_12,reg_shift_y_n_13,reg_shift_y_n_14,reg_shift_y_n_15,reg_shift_y_n_16,reg_shift_y_n_17,reg_shift_y_n_18,reg_shift_y_n_19,reg_shift_y_n_20,reg_shift_y_n_21,reg_shift_y_n_22,reg_shift_y_n_23,reg_shift_y_n_24,reg_shift_y_n_25,reg_shift_y_n_26,reg_shift_y_n_27,reg_shift_y_n_28,reg_shift_y_n_29,reg_shift_y_n_30,reg_shift_y_n_31}),
        .\Q_reg[31]_1 ({d_ff2_Y,reg_val_muxY_2stage_n_5,reg_val_muxY_2stage_n_6,reg_val_muxY_2stage_n_7,reg_val_muxY_2stage_n_8,reg_val_muxY_2stage_n_9,reg_val_muxY_2stage_n_10,reg_val_muxY_2stage_n_11,reg_val_muxY_2stage_n_12,reg_val_muxY_2stage_n_13,reg_val_muxY_2stage_n_14,reg_val_muxY_2stage_n_15,reg_val_muxY_2stage_n_16,reg_val_muxY_2stage_n_17,reg_val_muxY_2stage_n_18,reg_val_muxY_2stage_n_19,reg_val_muxY_2stage_n_20,reg_val_muxY_2stage_n_21,reg_val_muxY_2stage_n_22,reg_val_muxY_2stage_n_23,reg_val_muxY_2stage_n_24,reg_val_muxY_2stage_n_25,reg_val_muxY_2stage_n_26,reg_val_muxY_2stage_n_27,reg_val_muxY_2stage_n_28,reg_val_muxY_2stage_n_29,reg_val_muxY_2stage_n_30,reg_val_muxY_2stage_n_31,reg_val_muxY_2stage_n_32,reg_val_muxY_2stage_n_33,reg_val_muxY_2stage_n_34,reg_val_muxY_2stage_n_35}),
        .\Q_reg[31]_2 ({d_ff2_Z,reg_val_muxZ_2stage_n_1,reg_val_muxZ_2stage_n_2,reg_val_muxZ_2stage_n_3,reg_val_muxZ_2stage_n_4,reg_val_muxZ_2stage_n_5,reg_val_muxZ_2stage_n_6,reg_val_muxZ_2stage_n_7,reg_val_muxZ_2stage_n_8,reg_val_muxZ_2stage_n_9,reg_val_muxZ_2stage_n_10,reg_val_muxZ_2stage_n_11,reg_val_muxZ_2stage_n_12,reg_val_muxZ_2stage_n_13,reg_val_muxZ_2stage_n_14,reg_val_muxZ_2stage_n_15,reg_val_muxZ_2stage_n_16,reg_val_muxZ_2stage_n_17,reg_val_muxZ_2stage_n_18,reg_val_muxZ_2stage_n_19,reg_val_muxZ_2stage_n_20,reg_val_muxZ_2stage_n_21,reg_val_muxZ_2stage_n_22,reg_val_muxZ_2stage_n_23,reg_val_muxZ_2stage_n_24,reg_val_muxZ_2stage_n_25,reg_val_muxZ_2stage_n_26,reg_val_muxZ_2stage_n_27,reg_val_muxZ_2stage_n_28,reg_val_muxZ_2stage_n_29,reg_val_muxZ_2stage_n_30,reg_val_muxZ_2stage_n_31}),
        .\Q_reg[31]_3 ({reg_val_muxX_2stage_n_4,A,reg_val_muxX_2stage_n_13,reg_val_muxX_2stage_n_14,reg_val_muxX_2stage_n_15,reg_val_muxX_2stage_n_16,reg_val_muxX_2stage_n_17,reg_val_muxX_2stage_n_18,reg_val_muxX_2stage_n_19,reg_val_muxX_2stage_n_20,reg_val_muxX_2stage_n_21,reg_val_muxX_2stage_n_22,reg_val_muxX_2stage_n_23,reg_val_muxX_2stage_n_24,reg_val_muxX_2stage_n_25,reg_val_muxX_2stage_n_26,reg_val_muxX_2stage_n_27,reg_val_muxX_2stage_n_28,reg_val_muxX_2stage_n_29,reg_val_muxX_2stage_n_30,reg_val_muxX_2stage_n_31,reg_val_muxX_2stage_n_32,reg_val_muxX_2stage_n_33,reg_val_muxX_2stage_n_34,reg_val_muxX_2stage_n_35}),
        .\count_reg[1] (cont_iter_n_25),
        .out({cordic_FSM_n_0,cordic_FSM_n_1,cordic_FSM_n_2,cordic_FSM_n_3}));
  d_ff_en_2 reg_ch_mux_3
       (.CLK(clk_IBUF_BUFG),
        .\FSM_sequential_state_reg_reg[1] (cordic_FSM_n_17),
        .\FSM_sequential_state_reg_reg[2] (cordic_FSM_n_20),
        .\Q_reg[0]_0 (reg_ch_mux_3_n_0));
  d_ff_en_3 reg_operation
       (.AR(cordic_FSM_n_19),
        .CLK(clk_IBUF_BUFG),
        .E(enab_d_ff_RB1),
        .d_ff1_operation_out(d_ff1_operation_out),
        .operation_IBUF(operation_IBUF));
  d_ff_en__parameterized0 reg_region_flag
       (.CLK(clk_IBUF_BUFG),
        .D(reg_region_flag_n_0),
        .\FSM_sequential_state_reg_reg[1] (enab_d_ff_RB1),
        .\FSM_sequential_state_reg_reg[1]_0 (cordic_FSM_n_19),
        .Q(data_output2),
        .\Q_reg[0]_0 (reg_region_flag_n_1),
        .\Q_reg[0]_1 (reg_region_flag_n_2),
        .cont_var_out(cont_var_out[0]),
        .d_ff1_operation_out(d_ff1_operation_out),
        .max_tick_iter(max_tick_iter),
        .\shift_region_flag[1] (shift_region_flag_IBUF));
  d_ff_en__parameterized5 reg_shift_x
       (.CLK(clk_IBUF_BUFG),
        .D({reg_val_muxX_2stage_n_4,Y,reg_val_muxX_2stage_n_13,reg_val_muxX_2stage_n_14,reg_val_muxX_2stage_n_15,reg_val_muxX_2stage_n_16,reg_val_muxX_2stage_n_17,reg_val_muxX_2stage_n_18,reg_val_muxX_2stage_n_19,reg_val_muxX_2stage_n_20,reg_val_muxX_2stage_n_21,reg_val_muxX_2stage_n_22,reg_val_muxX_2stage_n_23,reg_val_muxX_2stage_n_24,reg_val_muxX_2stage_n_25,reg_val_muxX_2stage_n_26,reg_val_muxX_2stage_n_27,reg_val_muxX_2stage_n_28,reg_val_muxX_2stage_n_29,reg_val_muxX_2stage_n_30,reg_val_muxX_2stage_n_31,reg_val_muxX_2stage_n_32,reg_val_muxX_2stage_n_33,reg_val_muxX_2stage_n_34,reg_val_muxX_2stage_n_35}),
        .\FSM_sequential_state_reg_reg[1] (enab_RB3),
        .\FSM_sequential_state_reg_reg[1]_0 ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .Q({reg_shift_x_n_0,reg_shift_x_n_1,reg_shift_x_n_2,reg_shift_x_n_3,reg_shift_x_n_4,reg_shift_x_n_5,reg_shift_x_n_6,reg_shift_x_n_7,reg_shift_x_n_8,reg_shift_x_n_9,reg_shift_x_n_10,reg_shift_x_n_11,reg_shift_x_n_12,reg_shift_x_n_13,reg_shift_x_n_14,reg_shift_x_n_15,reg_shift_x_n_16,reg_shift_x_n_17,reg_shift_x_n_18,reg_shift_x_n_19,reg_shift_x_n_20,reg_shift_x_n_21,reg_shift_x_n_22,reg_shift_x_n_23,reg_shift_x_n_24,reg_shift_x_n_25,reg_shift_x_n_26,reg_shift_x_n_27,reg_shift_x_n_28,reg_shift_x_n_29,reg_shift_x_n_30,reg_shift_x_n_31}));
  d_ff_en__parameterized6 reg_shift_y
       (.CLK(clk_IBUF_BUFG),
        .D({d_ff2_Y,shift_y_n_0,shift_y_n_1,shift_y_n_2,shift_y_n_3,shift_y_n_4,shift_y_n_5,shift_y_n_6,shift_y_n_7,reg_val_muxY_2stage_n_13,reg_val_muxY_2stage_n_14,reg_val_muxY_2stage_n_15,reg_val_muxY_2stage_n_16,reg_val_muxY_2stage_n_17,reg_val_muxY_2stage_n_18,reg_val_muxY_2stage_n_19,reg_val_muxY_2stage_n_20,reg_val_muxY_2stage_n_21,reg_val_muxY_2stage_n_22,reg_val_muxY_2stage_n_23,reg_val_muxY_2stage_n_24,reg_val_muxY_2stage_n_25,reg_val_muxY_2stage_n_26,reg_val_muxY_2stage_n_27,reg_val_muxY_2stage_n_28,reg_val_muxY_2stage_n_29,reg_val_muxY_2stage_n_30,reg_val_muxY_2stage_n_31,reg_val_muxY_2stage_n_32,reg_val_muxY_2stage_n_33,reg_val_muxY_2stage_n_34,reg_val_muxY_2stage_n_35}),
        .\FSM_sequential_state_reg_reg[1] (enab_RB3),
        .\FSM_sequential_state_reg_reg[1]_0 ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .Q({reg_shift_y_n_0,reg_shift_y_n_1,reg_shift_y_n_2,reg_shift_y_n_3,reg_shift_y_n_4,reg_shift_y_n_5,reg_shift_y_n_6,reg_shift_y_n_7,reg_shift_y_n_8,reg_shift_y_n_9,reg_shift_y_n_10,reg_shift_y_n_11,reg_shift_y_n_12,reg_shift_y_n_13,reg_shift_y_n_14,reg_shift_y_n_15,reg_shift_y_n_16,reg_shift_y_n_17,reg_shift_y_n_18,reg_shift_y_n_19,reg_shift_y_n_20,reg_shift_y_n_21,reg_shift_y_n_22,reg_shift_y_n_23,reg_shift_y_n_24,reg_shift_y_n_25,reg_shift_y_n_26,reg_shift_y_n_27,reg_shift_y_n_28,reg_shift_y_n_29,reg_shift_y_n_30,reg_shift_y_n_31}));
  d_ff_en_4 reg_sign
       (.CLK(clk_IBUF_BUFG),
        .\FSM_sequential_state_reg_reg[1] (enab_RB3),
        .\FSM_sequential_state_reg_reg[1]_0 (cordic_FSM_n_18),
        .Q(d_ff2_Z),
        .d_ff3_sign_out(d_ff3_sign_out));
  d_ff_en__parameterized2 reg_val_muxX_2stage
       (.CLK(clk_IBUF_BUFG),
        .D({reg_ch_mux_1_n_1,reg_ch_mux_1_n_2,mux1_x0_n_0,mux1_x0_n_1,mux1_x0_n_2,mux1_x0_n_3,mux1_x0_n_4,mux1_x0_n_5,reg_ch_mux_1_n_3,reg_ch_mux_1_n_4,reg_ch_mux_1_n_5,mux1_x0_n_6,mux1_x0_n_7,reg_ch_mux_1_n_6,mux1_x0_n_8,mux1_x0_n_9,reg_ch_mux_1_n_7,mux1_x0_n_10,mux1_x0_n_11,mux1_x0_n_12,reg_ch_mux_1_n_8,mux1_x0_n_13,reg_ch_mux_1_n_9,reg_ch_mux_1_n_10,mux1_x0_n_14,mux1_x0_n_15,mux1_x0_n_16,reg_ch_mux_1_n_11,mux1_x0_n_17,mux1_x0_n_18,mux1_x0_n_19,reg_ch_mux_1_n_12}),
        .E(enab_d_ff2_RB2),
        .\FSM_sequential_state_reg_reg[1] ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .Q({reg_val_muxX_2stage_n_4,A,reg_val_muxX_2stage_n_13,reg_val_muxX_2stage_n_14,reg_val_muxX_2stage_n_15,reg_val_muxX_2stage_n_16,reg_val_muxX_2stage_n_17,reg_val_muxX_2stage_n_18,reg_val_muxX_2stage_n_19,reg_val_muxX_2stage_n_20,reg_val_muxX_2stage_n_21,reg_val_muxX_2stage_n_22,reg_val_muxX_2stage_n_23,reg_val_muxX_2stage_n_24,reg_val_muxX_2stage_n_25,reg_val_muxX_2stage_n_26,reg_val_muxX_2stage_n_27,reg_val_muxX_2stage_n_28,reg_val_muxX_2stage_n_29,reg_val_muxX_2stage_n_30,reg_val_muxX_2stage_n_31,reg_val_muxX_2stage_n_32,reg_val_muxX_2stage_n_33,reg_val_muxX_2stage_n_34,reg_val_muxX_2stage_n_35}),
        .\Q_reg[26]_0 ({reg_val_muxX_2stage_n_36,reg_val_muxX_2stage_n_37,reg_val_muxX_2stage_n_38,reg_val_muxX_2stage_n_39}),
        .S({reg_val_muxX_2stage_n_0,reg_val_muxX_2stage_n_1,reg_val_muxX_2stage_n_2,reg_val_muxX_2stage_n_3}),
        .\count_reg[3] (cont_iter_out));
  d_ff_en__parameterized3 reg_val_muxY_2stage
       (.CLK(clk_IBUF_BUFG),
        .D({reg_ch_mux_1_n_13,reg_ch_mux_1_n_14,reg_ch_mux_1_n_15,reg_ch_mux_1_n_16,reg_ch_mux_1_n_17,reg_ch_mux_1_n_18,reg_ch_mux_1_n_19,reg_ch_mux_1_n_20,reg_ch_mux_1_n_21,reg_ch_mux_1_n_22,reg_ch_mux_1_n_23,reg_ch_mux_1_n_24,reg_ch_mux_1_n_25,reg_ch_mux_1_n_26,reg_ch_mux_1_n_27,reg_ch_mux_1_n_28,reg_ch_mux_1_n_29,reg_ch_mux_1_n_30,reg_ch_mux_1_n_31,reg_ch_mux_1_n_32,reg_ch_mux_1_n_33,reg_ch_mux_1_n_34,reg_ch_mux_1_n_35,reg_ch_mux_1_n_36,reg_ch_mux_1_n_37,reg_ch_mux_1_n_38,reg_ch_mux_1_n_39,reg_ch_mux_1_n_40,reg_ch_mux_1_n_41,reg_ch_mux_1_n_42,reg_ch_mux_1_n_43,reg_ch_mux_1_n_44}),
        .E(enab_d_ff2_RB2),
        .\FSM_sequential_state_reg_reg[1] ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .Q({d_ff2_Y,reg_val_muxY_2stage_n_5,reg_val_muxY_2stage_n_6,reg_val_muxY_2stage_n_7,reg_val_muxY_2stage_n_8,reg_val_muxY_2stage_n_9,reg_val_muxY_2stage_n_10,reg_val_muxY_2stage_n_11,reg_val_muxY_2stage_n_12,reg_val_muxY_2stage_n_13,reg_val_muxY_2stage_n_14,reg_val_muxY_2stage_n_15,reg_val_muxY_2stage_n_16,reg_val_muxY_2stage_n_17,reg_val_muxY_2stage_n_18,reg_val_muxY_2stage_n_19,reg_val_muxY_2stage_n_20,reg_val_muxY_2stage_n_21,reg_val_muxY_2stage_n_22,reg_val_muxY_2stage_n_23,reg_val_muxY_2stage_n_24,reg_val_muxY_2stage_n_25,reg_val_muxY_2stage_n_26,reg_val_muxY_2stage_n_27,reg_val_muxY_2stage_n_28,reg_val_muxY_2stage_n_29,reg_val_muxY_2stage_n_30,reg_val_muxY_2stage_n_31,reg_val_muxY_2stage_n_32,reg_val_muxY_2stage_n_33,reg_val_muxY_2stage_n_34,reg_val_muxY_2stage_n_35}),
        .\Q_reg[26]_0 ({reg_val_muxY_2stage_n_36,reg_val_muxY_2stage_n_37,reg_val_muxY_2stage_n_38,reg_val_muxY_2stage_n_39}),
        .S({reg_val_muxY_2stage_n_0,reg_val_muxY_2stage_n_1,reg_val_muxY_2stage_n_2,reg_val_muxY_2stage_n_3}),
        .\count_reg[3] (cont_iter_out));
  d_ff_en__parameterized4 reg_val_muxZ_2stage
       (.CLK(clk_IBUF_BUFG),
        .D({mux1_z0_n_0,mux1_z0_n_1,mux1_z0_n_2,mux1_z0_n_3,mux1_z0_n_4,mux1_z0_n_5,mux1_z0_n_6,mux1_z0_n_7,mux1_z0_n_8,mux1_z0_n_9,mux1_z0_n_10,mux1_z0_n_11,mux1_z0_n_12,mux1_z0_n_13,mux1_z0_n_14,mux1_z0_n_15,mux1_z0_n_16,mux1_z0_n_17,mux1_z0_n_18,mux1_z0_n_19,mux1_z0_n_20,mux1_z0_n_21,mux1_z0_n_22,mux1_z0_n_23,mux1_z0_n_24,mux1_z0_n_25,mux1_z0_n_26,mux1_z0_n_27,mux1_z0_n_28,mux1_z0_n_29,mux1_z0_n_30,mux1_z0_n_31}),
        .E(enab_d_ff2_RB2),
        .\FSM_sequential_state_reg_reg[1] ({cordic_FSM_n_18,cordic_FSM_n_19}),
        .Q({d_ff2_Z,reg_val_muxZ_2stage_n_1,reg_val_muxZ_2stage_n_2,reg_val_muxZ_2stage_n_3,reg_val_muxZ_2stage_n_4,reg_val_muxZ_2stage_n_5,reg_val_muxZ_2stage_n_6,reg_val_muxZ_2stage_n_7,reg_val_muxZ_2stage_n_8,reg_val_muxZ_2stage_n_9,reg_val_muxZ_2stage_n_10,reg_val_muxZ_2stage_n_11,reg_val_muxZ_2stage_n_12,reg_val_muxZ_2stage_n_13,reg_val_muxZ_2stage_n_14,reg_val_muxZ_2stage_n_15,reg_val_muxZ_2stage_n_16,reg_val_muxZ_2stage_n_17,reg_val_muxZ_2stage_n_18,reg_val_muxZ_2stage_n_19,reg_val_muxZ_2stage_n_20,reg_val_muxZ_2stage_n_21,reg_val_muxZ_2stage_n_22,reg_val_muxZ_2stage_n_23,reg_val_muxZ_2stage_n_24,reg_val_muxZ_2stage_n_25,reg_val_muxZ_2stage_n_26,reg_val_muxZ_2stage_n_27,reg_val_muxZ_2stage_n_28,reg_val_muxZ_2stage_n_29,reg_val_muxZ_2stage_n_30,reg_val_muxZ_2stage_n_31}));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF \shift_region_flag_IBUF[0]_inst 
       (.I(shift_region_flag[0]),
        .O(shift_region_flag_IBUF[0]));
  IBUF \shift_region_flag_IBUF[1]_inst 
       (.I(shift_region_flag[1]),
        .O(shift_region_flag_IBUF[1]));
  Simple_Subt shift_x
       (.D(Y),
        .Q(A[6:0]),
        .\Q_reg[26] ({reg_val_muxX_2stage_n_36,reg_val_muxX_2stage_n_37,reg_val_muxX_2stage_n_38,reg_val_muxX_2stage_n_39}),
        .S({reg_val_muxX_2stage_n_0,reg_val_muxX_2stage_n_1,reg_val_muxX_2stage_n_2,reg_val_muxX_2stage_n_3}));
  Simple_Subt_5 shift_y
       (.D({shift_y_n_0,shift_y_n_1,shift_y_n_2,shift_y_n_3,shift_y_n_4,shift_y_n_5,shift_y_n_6,shift_y_n_7}),
        .Q({reg_val_muxY_2stage_n_6,reg_val_muxY_2stage_n_7,reg_val_muxY_2stage_n_8,reg_val_muxY_2stage_n_9,reg_val_muxY_2stage_n_10,reg_val_muxY_2stage_n_11,reg_val_muxY_2stage_n_12}),
        .\Q_reg[26] ({reg_val_muxY_2stage_n_36,reg_val_muxY_2stage_n_37,reg_val_muxY_2stage_n_38,reg_val_muxY_2stage_n_39}),
        .S({reg_val_muxY_2stage_n_0,reg_val_muxY_2stage_n_1,reg_val_muxY_2stage_n_2,reg_val_muxY_2stage_n_3}));
  OBUF underflow_flag_OBUF_inst
       (.I(underflow_flag_OBUF),
        .O(underflow_flag));
endmodule

module CORDIC_FSM_v2
   (out,
    \count_reg[3] ,
    \Q_reg[31] ,
    E,
    \FSM_sequential_state_reg_reg[0]_0 ,
    enab_cont_var,
    \Q_reg[1] ,
    AR,
    ready_cordic_OBUF,
    \Q_reg[31]_0 ,
    \Q_reg[0] ,
    \Q_reg[31]_1 ,
    \FSM_sequential_state_reg_reg[0]_1 ,
    \Q_reg[31]_2 ,
    \Q_reg[0]_0 ,
    \Q_reg[31]_3 ,
    \Q_reg[0]_1 ,
    \count_reg[1] ,
    \Q_reg[0]_2 ,
    \FSM_sequential_state_reg_reg[3]_0 ,
    ack_cordic_IBUF,
    max_tick_iter,
    \count_reg[0] ,
    beg_fsm_cordic_IBUF,
    \count_reg[1]_0 ,
    \count_reg[0]_0 ,
    \Q_reg[0]_3 ,
    cont_var_out,
    \Q_reg[0]_4 ,
    Q,
    \FSM_sequential_state_reg_reg[2]_0 ,
    \Q_reg[0]_5 ,
    CLK,
    rst);
  output [3:0]out;
  output [0:0]\count_reg[3] ;
  output \Q_reg[31] ;
  output [0:0]E;
  output \FSM_sequential_state_reg_reg[0]_0 ;
  output enab_cont_var;
  output [0:0]\Q_reg[1] ;
  output [0:0]AR;
  output ready_cordic_OBUF;
  output [0:0]\Q_reg[31]_0 ;
  output [0:0]\Q_reg[0] ;
  output [0:0]\Q_reg[31]_1 ;
  output \FSM_sequential_state_reg_reg[0]_1 ;
  output [0:0]\Q_reg[31]_2 ;
  output [0:0]\Q_reg[0]_0 ;
  output [1:0]\Q_reg[31]_3 ;
  output \Q_reg[0]_1 ;
  output [1:0]\count_reg[1] ;
  output \Q_reg[0]_2 ;
  input \FSM_sequential_state_reg_reg[3]_0 ;
  input ack_cordic_IBUF;
  input max_tick_iter;
  input \count_reg[0] ;
  input beg_fsm_cordic_IBUF;
  input \count_reg[1]_0 ;
  input \count_reg[0]_0 ;
  input \Q_reg[0]_3 ;
  input [0:0]cont_var_out;
  input \Q_reg[0]_4 ;
  input [1:0]Q;
  input \FSM_sequential_state_reg_reg[2]_0 ;
  input \Q_reg[0]_5 ;
  input CLK;
  input [0:0]rst;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[0]_i_2_n_0 ;
  wire \FSM_sequential_state_reg[1]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[2]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[3]_i_1_n_0 ;
  wire \FSM_sequential_state_reg_reg[0]_0 ;
  wire \FSM_sequential_state_reg_reg[0]_1 ;
  wire \FSM_sequential_state_reg_reg[2]_0 ;
  wire \FSM_sequential_state_reg_reg[3]_0 ;
  wire [1:0]Q;
  wire [0:0]\Q_reg[0] ;
  wire [0:0]\Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire \Q_reg[0]_2 ;
  wire \Q_reg[0]_3 ;
  wire \Q_reg[0]_4 ;
  wire \Q_reg[0]_5 ;
  wire [0:0]\Q_reg[1] ;
  wire \Q_reg[31] ;
  wire [0:0]\Q_reg[31]_0 ;
  wire [0:0]\Q_reg[31]_1 ;
  wire [0:0]\Q_reg[31]_2 ;
  wire [1:0]\Q_reg[31]_3 ;
  wire ack_cordic_IBUF;
  wire beg_fsm_cordic_IBUF;
  wire [0:0]cont_var_out;
  wire \count_reg[0] ;
  wire \count_reg[0]_0 ;
  wire [1:0]\count_reg[1] ;
  wire \count_reg[1]_0 ;
  wire [0:0]\count_reg[3] ;
  wire enab_cont_var;
  wire max_tick_iter;
  (* RTL_KEEP = "yes" *) wire [3:0]out;
  wire ready_cordic_OBUF;
  wire [0:0]rst;

  LUT6 #(
    .INIT(64'h8BBBBBBB8BBBB8BB)) 
    \FSM_sequential_state_reg[0]_i_1 
       (.I0(\FSM_sequential_state_reg[0]_i_2_n_0 ),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[2]),
        .I5(\FSM_sequential_state_reg_reg[3]_0 ),
        .O(\FSM_sequential_state_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000D1CCD1)) 
    \FSM_sequential_state_reg[0]_i_2 
       (.I0(beg_fsm_cordic_IBUF),
        .I1(out[3]),
        .I2(\count_reg[0] ),
        .I3(out[2]),
        .I4(ack_cordic_IBUF),
        .I5(out[1]),
        .O(\FSM_sequential_state_reg[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h03330CC8)) 
    \FSM_sequential_state_reg[1]_i_1 
       (.I0(beg_fsm_cordic_IBUF),
        .I1(out[0]),
        .I2(out[3]),
        .I3(out[2]),
        .I4(out[1]),
        .O(\FSM_sequential_state_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000F5FFFF0F0C000)) 
    \FSM_sequential_state_reg[2]_i_1 
       (.I0(ack_cordic_IBUF),
        .I1(\count_reg[0]_0 ),
        .I2(out[0]),
        .I3(out[3]),
        .I4(out[1]),
        .I5(out[2]),
        .O(\FSM_sequential_state_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF5FCFF0000000)) 
    \FSM_sequential_state_reg[3]_i_1 
       (.I0(ack_cordic_IBUF),
        .I1(max_tick_iter),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[1]),
        .I5(out[3]),
        .O(\FSM_sequential_state_reg[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state_reg[3]_i_4 
       (.I0(out[3]),
        .I1(out[2]),
        .O(\FSM_sequential_state_reg_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \FSM_sequential_state_reg[3]_i_6 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[1]),
        .O(\FSM_sequential_state_reg_reg[0]_1 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state_reg[0]_i_1_n_0 ),
        .Q(out[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state_reg[1]_i_1_n_0 ),
        .Q(out[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state_reg[2]_i_1_n_0 ),
        .Q(out[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_sequential_state_reg[3]_i_1_n_0 ),
        .Q(out[3]));
  LUT4 #(
    .INIT(16'h0002)) 
    \Q[0]_i_1__0 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(\Q_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFEFFC00002000)) 
    \Q[0]_i_1__11 
       (.I0(\Q_reg[0]_3 ),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(\Q_reg[0]_4 ),
        .O(\Q_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hFFFBFFFC00080000)) 
    \Q[0]_i_1__12 
       (.I0(\FSM_sequential_state_reg_reg[2]_0 ),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .I4(out[1]),
        .I5(\Q_reg[0]_5 ),
        .O(\Q_reg[0]_2 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[0]_i_2 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(\Q_reg[31]_3 [0]));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[30]_i_2 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(AR));
  LUT4 #(
    .INIT(16'h0800)) 
    \Q[31]_i_1__1 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(E));
  LUT4 #(
    .INIT(16'h0040)) 
    \Q[31]_i_1__2 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(\Q_reg[31]_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \Q[31]_i_1__3 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[0]),
        .O(\Q_reg[0] ));
  LUT4 #(
    .INIT(16'h0004)) 
    \Q[31]_i_1__4 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[0]),
        .O(\Q_reg[31]_1 ));
  LUT5 #(
    .INIT(32'h80888000)) 
    \Q[31]_i_1__5 
       (.I0(\Q_reg[31] ),
        .I1(\FSM_sequential_state_reg_reg[3]_0 ),
        .I2(\Q_reg[0]_3 ),
        .I3(max_tick_iter),
        .I4(cont_var_out),
        .O(\Q_reg[31]_2 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[31]_i_2 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(\Q_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \Q[31]_i_3 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(\Q_reg[31] ));
  LUT5 #(
    .INIT(32'h55545555)) 
    \count[0]_i_1 
       (.I0(Q[0]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .I4(out[1]),
        .O(\count_reg[1] [0]));
  LUT6 #(
    .INIT(64'h6666666066666666)) 
    \count[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[3]),
        .I5(out[1]),
        .O(\count_reg[1] [1]));
  LUT4 #(
    .INIT(16'h0001)) 
    \count[1]_i_2 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(\Q_reg[31]_3 [1]));
  LUT6 #(
    .INIT(64'h0001444400000000)) 
    \count[1]_i_3 
       (.I0(out[1]),
        .I1(out[2]),
        .I2(\count_reg[1]_0 ),
        .I3(max_tick_iter),
        .I4(out[3]),
        .I5(out[0]),
        .O(enab_cont_var));
  LUT5 #(
    .INIT(32'h00030800)) 
    \count[3]_i_1 
       (.I0(\count_reg[0] ),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .I4(out[1]),
        .O(\count_reg[3] ));
  LUT4 #(
    .INIT(16'h4000)) 
    ready_cordic_OBUF_inst_i_1
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .O(ready_cordic_OBUF));
endmodule

module Comparator
   (CO,
    \Q_reg[0] ,
    DI,
    S,
    \Q_reg[15] ,
    \Q_reg[15]_0 ,
    \Q_reg[23] ,
    \Q_reg[23]_0 ,
    \Q_reg[30] ,
    \Q_reg[30]_0 ,
    \Q_reg[10] ,
    \Q_reg[22] ,
    \Q_reg[30]_1 );
  output [0:0]CO;
  output [0:0]\Q_reg[0] ;
  input [3:0]DI;
  input [3:0]S;
  input [3:0]\Q_reg[15] ;
  input [3:0]\Q_reg[15]_0 ;
  input [3:0]\Q_reg[23] ;
  input [3:0]\Q_reg[23]_0 ;
  input [3:0]\Q_reg[30] ;
  input [3:0]\Q_reg[30]_0 ;
  input [3:0]\Q_reg[10] ;
  input [3:0]\Q_reg[22] ;
  input [2:0]\Q_reg[30]_1 ;

  wire [0:0]CO;
  wire [3:0]DI;
  wire [0:0]\Q_reg[0] ;
  wire [3:0]\Q_reg[10] ;
  wire [3:0]\Q_reg[15] ;
  wire [3:0]\Q_reg[15]_0 ;
  wire [3:0]\Q_reg[22] ;
  wire [3:0]\Q_reg[23] ;
  wire [3:0]\Q_reg[23]_0 ;
  wire [3:0]\Q_reg[30] ;
  wire [3:0]\Q_reg[30]_0 ;
  wire [2:0]\Q_reg[30]_1 ;
  wire [3:0]S;
  wire eqXY_o_carry__0_n_0;
  wire eqXY_o_carry__0_n_1;
  wire eqXY_o_carry__0_n_2;
  wire eqXY_o_carry__0_n_3;
  wire eqXY_o_carry__1_n_2;
  wire eqXY_o_carry__1_n_3;
  wire eqXY_o_carry_n_0;
  wire eqXY_o_carry_n_1;
  wire eqXY_o_carry_n_2;
  wire eqXY_o_carry_n_3;
  wire gtXY_o_carry__0_n_0;
  wire gtXY_o_carry__0_n_1;
  wire gtXY_o_carry__0_n_2;
  wire gtXY_o_carry__0_n_3;
  wire gtXY_o_carry__1_n_0;
  wire gtXY_o_carry__1_n_1;
  wire gtXY_o_carry__1_n_2;
  wire gtXY_o_carry__1_n_3;
  wire gtXY_o_carry__2_n_1;
  wire gtXY_o_carry__2_n_2;
  wire gtXY_o_carry__2_n_3;
  wire gtXY_o_carry_n_0;
  wire gtXY_o_carry_n_1;
  wire gtXY_o_carry_n_2;
  wire gtXY_o_carry_n_3;
  wire [3:0]NLW_eqXY_o_carry_O_UNCONNECTED;
  wire [3:0]NLW_eqXY_o_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_eqXY_o_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_eqXY_o_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_gtXY_o_carry_O_UNCONNECTED;
  wire [3:0]NLW_gtXY_o_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_gtXY_o_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_gtXY_o_carry__2_O_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 eqXY_o_carry
       (.CI(1'b0),
        .CO({eqXY_o_carry_n_0,eqXY_o_carry_n_1,eqXY_o_carry_n_2,eqXY_o_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_eqXY_o_carry_O_UNCONNECTED[3:0]),
        .S(\Q_reg[10] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 eqXY_o_carry__0
       (.CI(eqXY_o_carry_n_0),
        .CO({eqXY_o_carry__0_n_0,eqXY_o_carry__0_n_1,eqXY_o_carry__0_n_2,eqXY_o_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_eqXY_o_carry__0_O_UNCONNECTED[3:0]),
        .S(\Q_reg[22] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 eqXY_o_carry__1
       (.CI(eqXY_o_carry__0_n_0),
        .CO({NLW_eqXY_o_carry__1_CO_UNCONNECTED[3],\Q_reg[0] ,eqXY_o_carry__1_n_2,eqXY_o_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_eqXY_o_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,\Q_reg[30]_1 }));
  CARRY4 gtXY_o_carry
       (.CI(1'b0),
        .CO({gtXY_o_carry_n_0,gtXY_o_carry_n_1,gtXY_o_carry_n_2,gtXY_o_carry_n_3}),
        .CYINIT(1'b0),
        .DI(DI),
        .O(NLW_gtXY_o_carry_O_UNCONNECTED[3:0]),
        .S(S));
  CARRY4 gtXY_o_carry__0
       (.CI(gtXY_o_carry_n_0),
        .CO({gtXY_o_carry__0_n_0,gtXY_o_carry__0_n_1,gtXY_o_carry__0_n_2,gtXY_o_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\Q_reg[15] ),
        .O(NLW_gtXY_o_carry__0_O_UNCONNECTED[3:0]),
        .S(\Q_reg[15]_0 ));
  CARRY4 gtXY_o_carry__1
       (.CI(gtXY_o_carry__0_n_0),
        .CO({gtXY_o_carry__1_n_0,gtXY_o_carry__1_n_1,gtXY_o_carry__1_n_2,gtXY_o_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(\Q_reg[23] ),
        .O(NLW_gtXY_o_carry__1_O_UNCONNECTED[3:0]),
        .S(\Q_reg[23]_0 ));
  CARRY4 gtXY_o_carry__2
       (.CI(gtXY_o_carry__1_n_0),
        .CO({CO,gtXY_o_carry__2_n_1,gtXY_o_carry__2_n_2,gtXY_o_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(\Q_reg[30] ),
        .O(NLW_gtXY_o_carry__2_O_UNCONNECTED[3:0]),
        .S(\Q_reg[30]_0 ));
endmodule

module Exp_Operation
   (\Q_reg[0] ,
    \Q_reg[31] ,
    D,
    Q,
    \Q_reg[0]_0 ,
    S,
    \Q_reg[7] ,
    E,
    CLK,
    AR,
    \Q_reg[0]_1 ,
    sign_final_result,
    \Q_reg[24] ,
    O,
    \Q_reg[30] ,
    \Q_reg[4] ,
    FSM_selector_B,
    \Q_reg[30]_0 ,
    FSM_exp_operation_A_S,
    \Q_reg[30]_1 );
  output \Q_reg[0] ;
  output \Q_reg[31] ;
  output [31:0]D;
  output [4:0]Q;
  output \Q_reg[0]_0 ;
  output [3:0]S;
  output [3:0]\Q_reg[7] ;
  input [0:0]E;
  input CLK;
  input [0:0]AR;
  input \Q_reg[0]_1 ;
  input sign_final_result;
  input [22:0]\Q_reg[24] ;
  input [0:0]O;
  input [7:0]\Q_reg[30] ;
  input [4:0]\Q_reg[4] ;
  input [1:0]FSM_selector_B;
  input [7:0]\Q_reg[30]_0 ;
  input FSM_exp_operation_A_S;
  input [6:0]\Q_reg[30]_1 ;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire FSM_exp_operation_A_S;
  wire [1:0]FSM_selector_B;
  wire [0:0]O;
  wire [4:0]Q;
  wire \Q_reg[0] ;
  wire \Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire [22:0]\Q_reg[24] ;
  wire [7:0]\Q_reg[30] ;
  wire [7:0]\Q_reg[30]_0 ;
  wire [6:0]\Q_reg[30]_1 ;
  wire \Q_reg[31] ;
  wire [4:0]\Q_reg[4] ;
  wire [3:0]\Q_reg[7] ;
  wire [3:0]S;
  wire sign_final_result;

  RegisterAdd_8 Overflow
       (.AR(AR),
        .CLK(CLK),
        .D(D[22:0]),
        .E(E),
        .O(O),
        .\Q_reg[0]_0 (\Q_reg[0] ),
        .\Q_reg[0]_1 (\Q_reg[31] ),
        .\Q_reg[24] (\Q_reg[24] ),
        .\Q_reg[30] (\Q_reg[30] ));
  RegisterAdd_9 Underflow
       (.AR(AR),
        .CLK(CLK),
        .D(D[31]),
        .O(O),
        .\Q_reg[0]_0 (\Q_reg[0]_0 ),
        .\Q_reg[0]_1 (\Q_reg[0]_1 ),
        .\Q_reg[0]_2 (\Q_reg[0] ),
        .\Q_reg[30] ({\Q_reg[30] [7],\Q_reg[30] [4],\Q_reg[30] [2:0]}),
        .\Q_reg[31] (\Q_reg[31] ),
        .sign_final_result(sign_final_result));
  add_sub_carry_out exp_add_subt
       (.FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .FSM_selector_B(FSM_selector_B),
        .\Q_reg[30] (\Q_reg[30]_0 ),
        .\Q_reg[30]_0 (\Q_reg[30]_1 ),
        .\Q_reg[4] (\Q_reg[4] ),
        .\Q_reg[7] (\Q_reg[7] ),
        .S(S));
  RegisterAdd__parameterized5 exp_result
       (.AR(AR),
        .CLK(CLK),
        .D(D[30:23]),
        .E(E),
        .Q(Q),
        .\Q_reg[0]_0 (\Q_reg[0] ),
        .\Q_reg[0]_1 (\Q_reg[31] ),
        .\Q_reg[30] (\Q_reg[30] ));
endmodule

module FPU_Add_Subtract_Function
   (overflow_flag_OBUF,
    underflow_flag_OBUF,
    \FSM_sequential_state_reg_reg[0] ,
    Q,
    CLK,
    \count_reg[0] ,
    D,
    \Q_reg[31] ,
    AR,
    out,
    \FSM_sequential_state_reg_reg[3] ,
    \FSM_sequential_state_reg_reg[3]_0 );
  output overflow_flag_OBUF;
  output underflow_flag_OBUF;
  output \FSM_sequential_state_reg_reg[0] ;
  output [31:0]Q;
  input CLK;
  input \count_reg[0] ;
  input [31:0]D;
  input [31:0]\Q_reg[31] ;
  input [0:0]AR;
  input [1:0]out;
  input \FSM_sequential_state_reg_reg[3] ;
  input \FSM_sequential_state_reg_reg[3]_0 ;

  wire [0:0]AR;
  wire Add_Subt_Sgf_module_n_22;
  wire Add_Subt_Sgf_module_n_23;
  wire Add_Subt_Sgf_module_n_24;
  wire Add_Subt_Sgf_module_n_25;
  wire Add_Subt_Sgf_module_n_26;
  wire Add_Subt_Sgf_module_n_27;
  wire Barrel_Shifter_module_n_0;
  wire Barrel_Shifter_module_n_17;
  wire Barrel_Shifter_module_n_18;
  wire Barrel_Shifter_module_n_19;
  wire Barrel_Shifter_module_n_20;
  wire Barrel_Shifter_module_n_21;
  wire Barrel_Shifter_module_n_22;
  wire Barrel_Shifter_module_n_23;
  wire Barrel_Shifter_module_n_24;
  wire Barrel_Shifter_module_n_25;
  wire Barrel_Shifter_module_n_26;
  wire Barrel_Shifter_module_n_27;
  wire Barrel_Shifter_module_n_28;
  wire Barrel_Shifter_module_n_29;
  wire Barrel_Shifter_module_n_30;
  wire Barrel_Shifter_module_n_31;
  wire Barrel_Shifter_module_n_32;
  wire Barrel_Shifter_module_n_33;
  wire Barrel_Shifter_module_n_34;
  wire Barrel_Shifter_module_n_35;
  wire Barrel_Shifter_module_n_36;
  wire Barrel_Shifter_module_n_37;
  wire Barrel_Shifter_module_n_38;
  wire Barrel_Shifter_module_n_39;
  wire Barrel_Shifter_module_n_40;
  wire Barrel_Shifter_module_n_41;
  wire Barrel_Shifter_module_n_42;
  wire Barrel_Shifter_module_n_43;
  wire Barrel_Shifter_module_n_44;
  wire Barrel_Shifter_module_n_45;
  wire Barrel_Shifter_module_n_46;
  wire Barrel_Shifter_module_n_47;
  wire Barrel_Shifter_module_n_48;
  wire Barrel_Shifter_module_n_49;
  wire Barrel_Shifter_module_n_50;
  wire CLK;
  wire [4:0]Codec_to_Reg;
  wire [31:0]D;
  wire [15:0]Data_Reg;
  wire Exp_Operation_Module_n_10;
  wire Exp_Operation_Module_n_11;
  wire Exp_Operation_Module_n_12;
  wire Exp_Operation_Module_n_13;
  wire Exp_Operation_Module_n_14;
  wire Exp_Operation_Module_n_15;
  wire Exp_Operation_Module_n_16;
  wire Exp_Operation_Module_n_17;
  wire Exp_Operation_Module_n_18;
  wire Exp_Operation_Module_n_19;
  wire Exp_Operation_Module_n_20;
  wire Exp_Operation_Module_n_21;
  wire Exp_Operation_Module_n_22;
  wire Exp_Operation_Module_n_23;
  wire Exp_Operation_Module_n_24;
  wire Exp_Operation_Module_n_25;
  wire Exp_Operation_Module_n_26;
  wire Exp_Operation_Module_n_27;
  wire Exp_Operation_Module_n_28;
  wire Exp_Operation_Module_n_29;
  wire Exp_Operation_Module_n_3;
  wire Exp_Operation_Module_n_30;
  wire Exp_Operation_Module_n_31;
  wire Exp_Operation_Module_n_32;
  wire Exp_Operation_Module_n_33;
  wire Exp_Operation_Module_n_39;
  wire Exp_Operation_Module_n_4;
  wire Exp_Operation_Module_n_40;
  wire Exp_Operation_Module_n_41;
  wire Exp_Operation_Module_n_42;
  wire Exp_Operation_Module_n_43;
  wire Exp_Operation_Module_n_44;
  wire Exp_Operation_Module_n_45;
  wire Exp_Operation_Module_n_46;
  wire Exp_Operation_Module_n_47;
  wire Exp_Operation_Module_n_5;
  wire Exp_Operation_Module_n_6;
  wire Exp_Operation_Module_n_7;
  wire Exp_Operation_Module_n_8;
  wire Exp_Operation_Module_n_9;
  wire FSM_Add_Subt_Sgf_load;
  wire FSM_LZA_load;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire FSM_barrel_shifter_load;
  wire FSM_exp_operation_A_S;
  wire FSM_exp_operation_load_diff;
  wire FSM_op_start_in_load_a;
  wire FSM_op_start_in_load_b;
  wire [1:0]FSM_selector_B;
  wire FSM_selector_C;
  wire \FSM_sequential_state_reg_reg[0] ;
  wire \FSM_sequential_state_reg_reg[3] ;
  wire \FSM_sequential_state_reg_reg[3]_0 ;
  wire FS_Module_n_0;
  wire FS_Module_n_1;
  wire FS_Module_n_10;
  wire FS_Module_n_2;
  wire FS_Module_n_21;
  wire FS_Module_n_22;
  wire FS_Module_n_23;
  wire FS_Module_n_3;
  wire FS_Module_n_4;
  wire FS_Module_n_5;
  wire FS_Module_n_7;
  wire [4:0]LZA_output;
  wire [25:0]\Mux_Array/Data_array[3]_1 ;
  wire [25:10]\Mux_Array/Data_array[4]_0 ;
  wire Oper_Start_in_module_n_10;
  wire Oper_Start_in_module_n_100;
  wire Oper_Start_in_module_n_11;
  wire Oper_Start_in_module_n_12;
  wire Oper_Start_in_module_n_13;
  wire Oper_Start_in_module_n_14;
  wire Oper_Start_in_module_n_15;
  wire Oper_Start_in_module_n_16;
  wire Oper_Start_in_module_n_17;
  wire Oper_Start_in_module_n_18;
  wire Oper_Start_in_module_n_19;
  wire Oper_Start_in_module_n_2;
  wire Oper_Start_in_module_n_20;
  wire Oper_Start_in_module_n_21;
  wire Oper_Start_in_module_n_22;
  wire Oper_Start_in_module_n_23;
  wire Oper_Start_in_module_n_24;
  wire Oper_Start_in_module_n_25;
  wire Oper_Start_in_module_n_26;
  wire Oper_Start_in_module_n_27;
  wire Oper_Start_in_module_n_28;
  wire Oper_Start_in_module_n_29;
  wire Oper_Start_in_module_n_3;
  wire Oper_Start_in_module_n_30;
  wire Oper_Start_in_module_n_31;
  wire Oper_Start_in_module_n_32;
  wire Oper_Start_in_module_n_33;
  wire Oper_Start_in_module_n_34;
  wire Oper_Start_in_module_n_35;
  wire Oper_Start_in_module_n_36;
  wire Oper_Start_in_module_n_37;
  wire Oper_Start_in_module_n_38;
  wire Oper_Start_in_module_n_39;
  wire Oper_Start_in_module_n_4;
  wire Oper_Start_in_module_n_40;
  wire Oper_Start_in_module_n_41;
  wire Oper_Start_in_module_n_42;
  wire Oper_Start_in_module_n_43;
  wire Oper_Start_in_module_n_44;
  wire Oper_Start_in_module_n_45;
  wire Oper_Start_in_module_n_46;
  wire Oper_Start_in_module_n_47;
  wire Oper_Start_in_module_n_48;
  wire Oper_Start_in_module_n_49;
  wire Oper_Start_in_module_n_5;
  wire Oper_Start_in_module_n_50;
  wire Oper_Start_in_module_n_51;
  wire Oper_Start_in_module_n_52;
  wire Oper_Start_in_module_n_53;
  wire Oper_Start_in_module_n_54;
  wire Oper_Start_in_module_n_55;
  wire Oper_Start_in_module_n_56;
  wire Oper_Start_in_module_n_57;
  wire Oper_Start_in_module_n_58;
  wire Oper_Start_in_module_n_59;
  wire Oper_Start_in_module_n_60;
  wire Oper_Start_in_module_n_61;
  wire Oper_Start_in_module_n_62;
  wire Oper_Start_in_module_n_63;
  wire Oper_Start_in_module_n_64;
  wire Oper_Start_in_module_n_65;
  wire Oper_Start_in_module_n_66;
  wire Oper_Start_in_module_n_67;
  wire Oper_Start_in_module_n_68;
  wire Oper_Start_in_module_n_69;
  wire Oper_Start_in_module_n_70;
  wire Oper_Start_in_module_n_71;
  wire Oper_Start_in_module_n_72;
  wire Oper_Start_in_module_n_73;
  wire Oper_Start_in_module_n_74;
  wire Oper_Start_in_module_n_75;
  wire Oper_Start_in_module_n_76;
  wire Oper_Start_in_module_n_77;
  wire Oper_Start_in_module_n_78;
  wire Oper_Start_in_module_n_79;
  wire Oper_Start_in_module_n_8;
  wire Oper_Start_in_module_n_80;
  wire Oper_Start_in_module_n_81;
  wire Oper_Start_in_module_n_82;
  wire Oper_Start_in_module_n_83;
  wire Oper_Start_in_module_n_84;
  wire Oper_Start_in_module_n_85;
  wire Oper_Start_in_module_n_86;
  wire Oper_Start_in_module_n_87;
  wire Oper_Start_in_module_n_88;
  wire Oper_Start_in_module_n_89;
  wire Oper_Start_in_module_n_9;
  wire Oper_Start_in_module_n_90;
  wire Oper_Start_in_module_n_91;
  wire Oper_Start_in_module_n_92;
  wire Oper_Start_in_module_n_93;
  wire Oper_Start_in_module_n_94;
  wire Oper_Start_in_module_n_95;
  wire Oper_Start_in_module_n_96;
  wire Oper_Start_in_module_n_97;
  wire Oper_Start_in_module_n_98;
  wire Oper_Start_in_module_n_99;
  wire [31:0]Q;
  wire [31:0]\Q_reg[31] ;
  wire Sel_B_n_21;
  wire Sel_B_n_22;
  wire Sel_B_n_23;
  wire Sel_B_n_24;
  wire Sel_B_n_25;
  wire Sel_B_n_3;
  wire Sel_B_n_4;
  wire [1:0]Sgf_normalized_result;
  wire Sign_S_mux;
  wire add_overflow_flag;
  wire \count_reg[0] ;
  wire eqXY;
  wire [4:0]exp_oper_result;
  wire [1:0]out;
  wire overflow_flag_OBUF;
  wire real_op;
  wire rst_int;
  wire sign_final_result;
  wire underflow_flag_OBUF;
  wire zero_flag;

  Add_Subt Add_Subt_Sgf_module
       (.AR(FS_Module_n_23),
        .CLK(CLK),
        .D(\Mux_Array/Data_array[3]_1 [20:0]),
        .DI({Oper_Start_in_module_n_5,real_op}),
        .E(FSM_Add_Subt_Sgf_load),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_selector_B(FSM_selector_B),
        .FSM_selector_C(FSM_selector_C),
        .Q({Oper_Start_in_module_n_23,Oper_Start_in_module_n_24,Oper_Start_in_module_n_25,Oper_Start_in_module_n_26,Oper_Start_in_module_n_27,Oper_Start_in_module_n_28,Oper_Start_in_module_n_29,Oper_Start_in_module_n_30,Oper_Start_in_module_n_31,Oper_Start_in_module_n_32,Oper_Start_in_module_n_33,Oper_Start_in_module_n_34,Oper_Start_in_module_n_35,Oper_Start_in_module_n_36,Oper_Start_in_module_n_37,Oper_Start_in_module_n_38,Oper_Start_in_module_n_39,Oper_Start_in_module_n_40,Oper_Start_in_module_n_41,Oper_Start_in_module_n_42,Oper_Start_in_module_n_43,Oper_Start_in_module_n_44,Oper_Start_in_module_n_45}),
        .\Q_reg[0] ({Add_Subt_Sgf_module_n_26,Add_Subt_Sgf_module_n_27}),
        .\Q_reg[0]_0 (FS_Module_n_10),
        .\Q_reg[0]_1 (LZA_output[0]),
        .\Q_reg[0]_2 (exp_oper_result[0]),
        .\Q_reg[0]_3 (Sel_B_n_25),
        .\Q_reg[0]_4 (Sgf_normalized_result[0]),
        .\Q_reg[11] ({Oper_Start_in_module_n_54,Oper_Start_in_module_n_55,Oper_Start_in_module_n_56,Oper_Start_in_module_n_57}),
        .\Q_reg[15] (Add_Subt_Sgf_module_n_25),
        .\Q_reg[15]_0 ({Oper_Start_in_module_n_58,Oper_Start_in_module_n_59,Oper_Start_in_module_n_60,Oper_Start_in_module_n_61}),
        .\Q_reg[16] (Add_Subt_Sgf_module_n_23),
        .\Q_reg[17] (Add_Subt_Sgf_module_n_24),
        .\Q_reg[18] (Add_Subt_Sgf_module_n_22),
        .\Q_reg[19] ({Oper_Start_in_module_n_62,Oper_Start_in_module_n_63,Oper_Start_in_module_n_64,Oper_Start_in_module_n_65}),
        .\Q_reg[1] (Sel_B_n_4),
        .\Q_reg[22] ({Oper_Start_in_module_n_78,Oper_Start_in_module_n_79,Oper_Start_in_module_n_80,Oper_Start_in_module_n_81,Oper_Start_in_module_n_82,Oper_Start_in_module_n_83,Oper_Start_in_module_n_84,Oper_Start_in_module_n_85,Oper_Start_in_module_n_86,Oper_Start_in_module_n_87,Oper_Start_in_module_n_88,Oper_Start_in_module_n_89,Oper_Start_in_module_n_90,Oper_Start_in_module_n_91,Oper_Start_in_module_n_92,Oper_Start_in_module_n_93,Oper_Start_in_module_n_94,Oper_Start_in_module_n_95,Oper_Start_in_module_n_96,Oper_Start_in_module_n_97,Oper_Start_in_module_n_98,Oper_Start_in_module_n_99,Oper_Start_in_module_n_100}),
        .\Q_reg[23] ({Oper_Start_in_module_n_66,Oper_Start_in_module_n_67,Oper_Start_in_module_n_68,Oper_Start_in_module_n_69}),
        .\Q_reg[2] (Sel_B_n_3),
        .\Q_reg[31] ({Oper_Start_in_module_n_2,Oper_Start_in_module_n_3,Oper_Start_in_module_n_4}),
        .\Q_reg[4] (Codec_to_Reg),
        .\Q_reg[7] ({Oper_Start_in_module_n_50,Oper_Start_in_module_n_51,Oper_Start_in_module_n_52,Oper_Start_in_module_n_53}),
        .S({Oper_Start_in_module_n_47,Oper_Start_in_module_n_48,Oper_Start_in_module_n_49,Barrel_Shifter_module_n_26}),
        .add_overflow_flag(add_overflow_flag));
  Barrel_Shifter Barrel_Shifter_module
       (.AR(rst_int),
        .CLK(CLK),
        .D(Data_Reg),
        .E(FSM_barrel_shifter_load),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .\FSM_sequential_state_reg_reg[3] ({FS_Module_n_22,FS_Module_n_23}),
        .Q(\Mux_Array/Data_array[4]_0 ),
        .\Q_reg[0] ({Barrel_Shifter_module_n_27,Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50,Sgf_normalized_result}),
        .\Q_reg[16] (Barrel_Shifter_module_n_0),
        .\Q_reg[16]_0 (Sel_B_n_21),
        .\Q_reg[17] (Barrel_Shifter_module_n_18),
        .\Q_reg[17]_0 (Sel_B_n_24),
        .\Q_reg[18] (Barrel_Shifter_module_n_20),
        .\Q_reg[19] (Barrel_Shifter_module_n_22),
        .\Q_reg[20] (Barrel_Shifter_module_n_24),
        .\Q_reg[21] (Barrel_Shifter_module_n_25),
        .\Q_reg[22] (Barrel_Shifter_module_n_23),
        .\Q_reg[23] (Barrel_Shifter_module_n_21),
        .\Q_reg[24] (Barrel_Shifter_module_n_19),
        .\Q_reg[25] (Barrel_Shifter_module_n_17),
        .\Q_reg[2] (\Mux_Array/Data_array[3]_1 ),
        .\Q_reg[3] (Sel_B_n_23),
        .\Q_reg[4] (Sel_B_n_22),
        .S(Barrel_Shifter_module_n_26));
  Exp_Operation Exp_Operation_Module
       (.AR(FS_Module_n_23),
        .CLK(CLK),
        .D({Sign_S_mux,Exp_Operation_Module_n_3,Exp_Operation_Module_n_4,Exp_Operation_Module_n_5,Exp_Operation_Module_n_6,Exp_Operation_Module_n_7,Exp_Operation_Module_n_8,Exp_Operation_Module_n_9,Exp_Operation_Module_n_10,Exp_Operation_Module_n_11,Exp_Operation_Module_n_12,Exp_Operation_Module_n_13,Exp_Operation_Module_n_14,Exp_Operation_Module_n_15,Exp_Operation_Module_n_16,Exp_Operation_Module_n_17,Exp_Operation_Module_n_18,Exp_Operation_Module_n_19,Exp_Operation_Module_n_20,Exp_Operation_Module_n_21,Exp_Operation_Module_n_22,Exp_Operation_Module_n_23,Exp_Operation_Module_n_24,Exp_Operation_Module_n_25,Exp_Operation_Module_n_26,Exp_Operation_Module_n_27,Exp_Operation_Module_n_28,Exp_Operation_Module_n_29,Exp_Operation_Module_n_30,Exp_Operation_Module_n_31,Exp_Operation_Module_n_32,Exp_Operation_Module_n_33}),
        .E(FSM_exp_operation_load_diff),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .FSM_selector_B(FSM_selector_B),
        .O(Oper_Start_in_module_n_46),
        .Q(exp_oper_result),
        .\Q_reg[0] (overflow_flag_OBUF),
        .\Q_reg[0]_0 (Exp_Operation_Module_n_39),
        .\Q_reg[0]_1 (FS_Module_n_7),
        .\Q_reg[24] ({Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50}),
        .\Q_reg[30] ({Oper_Start_in_module_n_8,Oper_Start_in_module_n_9,Oper_Start_in_module_n_10,Oper_Start_in_module_n_11,Oper_Start_in_module_n_12,Oper_Start_in_module_n_13,Oper_Start_in_module_n_14,Oper_Start_in_module_n_15}),
        .\Q_reg[30]_0 ({Oper_Start_in_module_n_70,Oper_Start_in_module_n_71,Oper_Start_in_module_n_72,Oper_Start_in_module_n_73,Oper_Start_in_module_n_74,Oper_Start_in_module_n_75,Oper_Start_in_module_n_76,Oper_Start_in_module_n_77}),
        .\Q_reg[30]_1 ({Oper_Start_in_module_n_16,Oper_Start_in_module_n_17,Oper_Start_in_module_n_18,Oper_Start_in_module_n_19,Oper_Start_in_module_n_20,Oper_Start_in_module_n_21,Oper_Start_in_module_n_22}),
        .\Q_reg[31] (underflow_flag_OBUF),
        .\Q_reg[4] (LZA_output),
        .\Q_reg[7] ({Exp_Operation_Module_n_44,Exp_Operation_Module_n_45,Exp_Operation_Module_n_46,Exp_Operation_Module_n_47}),
        .S({Exp_Operation_Module_n_40,Exp_Operation_Module_n_41,Exp_Operation_Module_n_42,Exp_Operation_Module_n_43}),
        .sign_final_result(sign_final_result));
  FSM_Add_Subtract FS_Module
       (.AR(AR),
        .CLK(CLK),
        .CO(eqXY),
        .DI(real_op),
        .E(FS_Module_n_5),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .FSM_selector_C(FSM_selector_C),
        .\FSM_sequential_state_reg_reg[0]_0 (\FSM_sequential_state_reg_reg[0] ),
        .\FSM_sequential_state_reg_reg[1]_0 (out),
        .\FSM_sequential_state_reg_reg[3]_0 (\FSM_sequential_state_reg_reg[3] ),
        .\FSM_sequential_state_reg_reg[3]_1 (\FSM_sequential_state_reg_reg[3]_0 ),
        .\Q_reg[0] (FS_Module_n_4),
        .\Q_reg[0]_0 (FS_Module_n_7),
        .\Q_reg[0]_1 (FSM_LZA_load),
        .\Q_reg[0]_10 (Add_Subt_Sgf_module_n_24),
        .\Q_reg[0]_11 (Sel_B_n_25),
        .\Q_reg[0]_2 (FSM_Add_Subt_Sgf_load),
        .\Q_reg[0]_3 (FSM_barrel_shifter_load),
        .\Q_reg[0]_4 (FSM_exp_operation_load_diff),
        .\Q_reg[0]_5 (FSM_op_start_in_load_a),
        .\Q_reg[0]_6 (FSM_op_start_in_load_b),
        .\Q_reg[0]_7 (rst_int),
        .\Q_reg[0]_8 ({FS_Module_n_22,FS_Module_n_23}),
        .\Q_reg[0]_9 (Add_Subt_Sgf_module_n_25),
        .\Q_reg[1] (Sel_B_n_4),
        .\Q_reg[21] (FS_Module_n_10),
        .\Q_reg[23] ({\Mux_Array/Data_array[3]_1 [23],\Mux_Array/Data_array[3]_1 [21]}),
        .\Q_reg[23]_0 (Exp_Operation_Module_n_39),
        .\Q_reg[25] ({Add_Subt_Sgf_module_n_26,Add_Subt_Sgf_module_n_27}),
        .\Q_reg[2] (Sel_B_n_3),
        .\Q_reg[30] ({Oper_Start_in_module_n_9,Oper_Start_in_module_n_10,Oper_Start_in_module_n_12}),
        .S(FS_Module_n_21),
        .add_overflow_flag(add_overflow_flag),
        .out({FS_Module_n_0,FS_Module_n_1,FS_Module_n_2,FS_Module_n_3}),
        .underflow_flag_OBUF(underflow_flag_OBUF),
        .zero_flag(zero_flag));
  LZD Leading_Zero_Detector_Module
       (.CLK(CLK),
        .D(Codec_to_Reg),
        .E(FSM_LZA_load),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_23),
        .Q(LZA_output));
  Oper_Start_In Oper_Start_in_module
       (.CLK(CLK),
        .CO(eqXY),
        .D(D),
        .DI({Oper_Start_in_module_n_5,real_op}),
        .E(FSM_op_start_in_load_a),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .\FSM_sequential_state_reg_reg[3] ({FS_Module_n_22,FS_Module_n_23}),
        .\FSM_sequential_state_reg_reg[3]_0 (FSM_op_start_in_load_b),
        .O(Oper_Start_in_module_n_46),
        .Q({Oper_Start_in_module_n_16,Oper_Start_in_module_n_17,Oper_Start_in_module_n_18,Oper_Start_in_module_n_19,Oper_Start_in_module_n_20,Oper_Start_in_module_n_21,Oper_Start_in_module_n_22,Oper_Start_in_module_n_23,Oper_Start_in_module_n_24,Oper_Start_in_module_n_25,Oper_Start_in_module_n_26,Oper_Start_in_module_n_27,Oper_Start_in_module_n_28,Oper_Start_in_module_n_29,Oper_Start_in_module_n_30,Oper_Start_in_module_n_31,Oper_Start_in_module_n_32,Oper_Start_in_module_n_33,Oper_Start_in_module_n_34,Oper_Start_in_module_n_35,Oper_Start_in_module_n_36,Oper_Start_in_module_n_37,Oper_Start_in_module_n_38,Oper_Start_in_module_n_39,Oper_Start_in_module_n_40,Oper_Start_in_module_n_41,Oper_Start_in_module_n_42,Oper_Start_in_module_n_43,Oper_Start_in_module_n_44,Oper_Start_in_module_n_45}),
        .\Q_reg[0] ({Oper_Start_in_module_n_2,Oper_Start_in_module_n_3,Oper_Start_in_module_n_4}),
        .\Q_reg[0]_0 (FS_Module_n_21),
        .\Q_reg[11] ({Oper_Start_in_module_n_54,Oper_Start_in_module_n_55,Oper_Start_in_module_n_56,Oper_Start_in_module_n_57}),
        .\Q_reg[15] ({Oper_Start_in_module_n_58,Oper_Start_in_module_n_59,Oper_Start_in_module_n_60,Oper_Start_in_module_n_61}),
        .\Q_reg[19] ({Oper_Start_in_module_n_62,Oper_Start_in_module_n_63,Oper_Start_in_module_n_64,Oper_Start_in_module_n_65}),
        .\Q_reg[23] ({Oper_Start_in_module_n_66,Oper_Start_in_module_n_67,Oper_Start_in_module_n_68,Oper_Start_in_module_n_69}),
        .\Q_reg[25] ({Barrel_Shifter_module_n_27,Barrel_Shifter_module_n_28,Barrel_Shifter_module_n_29,Barrel_Shifter_module_n_30,Barrel_Shifter_module_n_31,Barrel_Shifter_module_n_32,Barrel_Shifter_module_n_33,Barrel_Shifter_module_n_34,Barrel_Shifter_module_n_35,Barrel_Shifter_module_n_36,Barrel_Shifter_module_n_37,Barrel_Shifter_module_n_38,Barrel_Shifter_module_n_39,Barrel_Shifter_module_n_40,Barrel_Shifter_module_n_41,Barrel_Shifter_module_n_42,Barrel_Shifter_module_n_43,Barrel_Shifter_module_n_44,Barrel_Shifter_module_n_45,Barrel_Shifter_module_n_46,Barrel_Shifter_module_n_47,Barrel_Shifter_module_n_48,Barrel_Shifter_module_n_49,Barrel_Shifter_module_n_50,Sgf_normalized_result[1]}),
        .\Q_reg[30] ({Exp_Operation_Module_n_44,Exp_Operation_Module_n_45,Exp_Operation_Module_n_46,Exp_Operation_Module_n_47}),
        .\Q_reg[31] (\Q_reg[31] ),
        .\Q_reg[3] ({Oper_Start_in_module_n_47,Oper_Start_in_module_n_48,Oper_Start_in_module_n_49}),
        .\Q_reg[7] ({Oper_Start_in_module_n_8,Oper_Start_in_module_n_9,Oper_Start_in_module_n_10,Oper_Start_in_module_n_11,Oper_Start_in_module_n_12,Oper_Start_in_module_n_13,Oper_Start_in_module_n_14,Oper_Start_in_module_n_15}),
        .\Q_reg[7]_0 ({Oper_Start_in_module_n_50,Oper_Start_in_module_n_51,Oper_Start_in_module_n_52,Oper_Start_in_module_n_53}),
        .\Q_reg[7]_1 ({Oper_Start_in_module_n_70,Oper_Start_in_module_n_71,Oper_Start_in_module_n_72,Oper_Start_in_module_n_73,Oper_Start_in_module_n_74,Oper_Start_in_module_n_75,Oper_Start_in_module_n_76,Oper_Start_in_module_n_77,Oper_Start_in_module_n_78,Oper_Start_in_module_n_79,Oper_Start_in_module_n_80,Oper_Start_in_module_n_81,Oper_Start_in_module_n_82,Oper_Start_in_module_n_83,Oper_Start_in_module_n_84,Oper_Start_in_module_n_85,Oper_Start_in_module_n_86,Oper_Start_in_module_n_87,Oper_Start_in_module_n_88,Oper_Start_in_module_n_89,Oper_Start_in_module_n_90,Oper_Start_in_module_n_91,Oper_Start_in_module_n_92,Oper_Start_in_module_n_93,Oper_Start_in_module_n_94,Oper_Start_in_module_n_95,Oper_Start_in_module_n_96,Oper_Start_in_module_n_97,Oper_Start_in_module_n_98,Oper_Start_in_module_n_99,Oper_Start_in_module_n_100}),
        .S({Exp_Operation_Module_n_40,Exp_Operation_Module_n_41,Exp_Operation_Module_n_42,Exp_Operation_Module_n_43}),
        .\count_reg[0] (\count_reg[0] ),
        .sign_final_result(sign_final_result),
        .zero_flag(zero_flag));
  RegisterAdd__parameterized0 Sel_B
       (.CLK(CLK),
        .D(Data_Reg),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .FSM_selector_B(FSM_selector_B),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_23),
        .Q(\Mux_Array/Data_array[4]_0 ),
        .\Q_reg[0]_0 (Sel_B_n_22),
        .\Q_reg[0]_1 (Sel_B_n_23),
        .\Q_reg[0]_2 (FS_Module_n_10),
        .\Q_reg[0]_3 (Add_Subt_Sgf_module_n_22),
        .\Q_reg[0]_4 (Add_Subt_Sgf_module_n_23),
        .\Q_reg[16] (Barrel_Shifter_module_n_17),
        .\Q_reg[17] (Barrel_Shifter_module_n_19),
        .\Q_reg[18] (Barrel_Shifter_module_n_21),
        .\Q_reg[19] (Barrel_Shifter_module_n_23),
        .\Q_reg[20] (Barrel_Shifter_module_n_25),
        .\Q_reg[21] (Sel_B_n_25),
        .\Q_reg[21]_0 (Barrel_Shifter_module_n_24),
        .\Q_reg[22] (Barrel_Shifter_module_n_22),
        .\Q_reg[23] (Barrel_Shifter_module_n_20),
        .\Q_reg[24] (Barrel_Shifter_module_n_18),
        .\Q_reg[25] ({\Mux_Array/Data_array[3]_1 [25:24],\Mux_Array/Data_array[3]_1 [22]}),
        .\Q_reg[25]_0 (Sel_B_n_3),
        .\Q_reg[25]_1 (Sel_B_n_4),
        .\Q_reg[25]_2 (Barrel_Shifter_module_n_0),
        .\Q_reg[4] (LZA_output),
        .\Q_reg[4]_0 (exp_oper_result),
        .\Q_reg[8] (Sel_B_n_24),
        .\Q_reg[9] (Sel_B_n_21),
        .add_overflow_flag(add_overflow_flag),
        .out({FS_Module_n_0,FS_Module_n_1,FS_Module_n_2,FS_Module_n_3}));
  RegisterAdd Sel_C
       (.CLK(CLK),
        .FSM_selector_C(FSM_selector_C),
        .\FSM_sequential_state_reg_reg[3] (FS_Module_n_4),
        .\FSM_sequential_state_reg_reg[3]_0 (FS_Module_n_23));
  Tenth_Phase final_result_ieee_Module
       (.AR(rst_int),
        .CLK(CLK),
        .D({Sign_S_mux,Exp_Operation_Module_n_3,Exp_Operation_Module_n_4,Exp_Operation_Module_n_5,Exp_Operation_Module_n_6,Exp_Operation_Module_n_7,Exp_Operation_Module_n_8,Exp_Operation_Module_n_9,Exp_Operation_Module_n_10,Exp_Operation_Module_n_11,Exp_Operation_Module_n_12,Exp_Operation_Module_n_13,Exp_Operation_Module_n_14,Exp_Operation_Module_n_15,Exp_Operation_Module_n_16,Exp_Operation_Module_n_17,Exp_Operation_Module_n_18,Exp_Operation_Module_n_19,Exp_Operation_Module_n_20,Exp_Operation_Module_n_21,Exp_Operation_Module_n_22,Exp_Operation_Module_n_23,Exp_Operation_Module_n_24,Exp_Operation_Module_n_25,Exp_Operation_Module_n_26,Exp_Operation_Module_n_27,Exp_Operation_Module_n_28,Exp_Operation_Module_n_29,Exp_Operation_Module_n_30,Exp_Operation_Module_n_31,Exp_Operation_Module_n_32,Exp_Operation_Module_n_33}),
        .E(FS_Module_n_5),
        .Q(Q));
endmodule

module FSM_Add_Subtract
   (out,
    \Q_reg[0] ,
    E,
    \FSM_sequential_state_reg_reg[0]_0 ,
    \Q_reg[0]_0 ,
    \Q_reg[23] ,
    \Q_reg[21] ,
    FSM_barrel_shifter_B_S,
    FSM_barrel_shifter_L_R,
    \Q_reg[0]_1 ,
    \Q_reg[0]_2 ,
    \Q_reg[0]_3 ,
    FSM_exp_operation_A_S,
    \Q_reg[0]_4 ,
    \Q_reg[0]_5 ,
    \Q_reg[0]_6 ,
    \Q_reg[0]_7 ,
    S,
    \Q_reg[0]_8 ,
    FSM_selector_C,
    zero_flag,
    \Q_reg[30] ,
    \Q_reg[23]_0 ,
    underflow_flag_OBUF,
    \Q_reg[2] ,
    \Q_reg[0]_9 ,
    \Q_reg[1] ,
    \Q_reg[0]_10 ,
    \Q_reg[0]_11 ,
    \Q_reg[25] ,
    CLK,
    AR,
    \FSM_sequential_state_reg_reg[1]_0 ,
    \FSM_sequential_state_reg_reg[3]_0 ,
    \FSM_sequential_state_reg_reg[3]_1 ,
    add_overflow_flag,
    DI,
    CO);
  output [3:0]out;
  output \Q_reg[0] ;
  output [0:0]E;
  output \FSM_sequential_state_reg_reg[0]_0 ;
  output \Q_reg[0]_0 ;
  output [1:0]\Q_reg[23] ;
  output \Q_reg[21] ;
  output FSM_barrel_shifter_B_S;
  output FSM_barrel_shifter_L_R;
  output [0:0]\Q_reg[0]_1 ;
  output [0:0]\Q_reg[0]_2 ;
  output [0:0]\Q_reg[0]_3 ;
  output FSM_exp_operation_A_S;
  output [0:0]\Q_reg[0]_4 ;
  output [0:0]\Q_reg[0]_5 ;
  output [0:0]\Q_reg[0]_6 ;
  output [0:0]\Q_reg[0]_7 ;
  output [0:0]S;
  output [1:0]\Q_reg[0]_8 ;
  input FSM_selector_C;
  input zero_flag;
  input [2:0]\Q_reg[30] ;
  input \Q_reg[23]_0 ;
  input underflow_flag_OBUF;
  input \Q_reg[2] ;
  input \Q_reg[0]_9 ;
  input \Q_reg[1] ;
  input \Q_reg[0]_10 ;
  input \Q_reg[0]_11 ;
  input [1:0]\Q_reg[25] ;
  input CLK;
  input [0:0]AR;
  input [1:0]\FSM_sequential_state_reg_reg[1]_0 ;
  input \FSM_sequential_state_reg_reg[3]_0 ;
  input \FSM_sequential_state_reg_reg[3]_1 ;
  input add_overflow_flag;
  input [0:0]DI;
  input [0:0]CO;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]CO;
  wire [0:0]DI;
  wire [0:0]E;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire FSM_exp_operation_A_S;
  wire FSM_exp_operation_load_OU;
  wire FSM_selector_C;
  wire \FSM_sequential_state_reg[0]_i_1__0_n_0 ;
  wire \FSM_sequential_state_reg[1]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[2]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[3]_i_1_n_0 ;
  wire \FSM_sequential_state_reg[3]_i_2_n_0 ;
  wire \FSM_sequential_state_reg[3]_i_3_n_0 ;
  wire \FSM_sequential_state_reg_reg[0]_0 ;
  wire [1:0]\FSM_sequential_state_reg_reg[1]_0 ;
  wire \FSM_sequential_state_reg_reg[3]_0 ;
  wire \FSM_sequential_state_reg_reg[3]_1 ;
  wire \Q_reg[0] ;
  wire \Q_reg[0]_0 ;
  wire [0:0]\Q_reg[0]_1 ;
  wire \Q_reg[0]_10 ;
  wire \Q_reg[0]_11 ;
  wire [0:0]\Q_reg[0]_2 ;
  wire [0:0]\Q_reg[0]_3 ;
  wire [0:0]\Q_reg[0]_4 ;
  wire [0:0]\Q_reg[0]_5 ;
  wire [0:0]\Q_reg[0]_6 ;
  wire [0:0]\Q_reg[0]_7 ;
  wire [1:0]\Q_reg[0]_8 ;
  wire \Q_reg[0]_9 ;
  wire \Q_reg[1] ;
  wire \Q_reg[21] ;
  wire [1:0]\Q_reg[23] ;
  wire \Q_reg[23]_0 ;
  wire [1:0]\Q_reg[25] ;
  wire \Q_reg[2] ;
  wire [2:0]\Q_reg[30] ;
  wire [0:0]S;
  wire add_overflow_flag;
  (* RTL_KEEP = "yes" *) wire [3:0]out;
  wire underflow_flag_OBUF;
  wire zero_flag;

  LUT6 #(
    .INIT(64'h0000575755551155)) 
    \FSM_sequential_state_reg[0]_i_1__0 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(FSM_selector_C),
        .I3(zero_flag),
        .I4(out[3]),
        .I5(out[2]),
        .O(\FSM_sequential_state_reg[0]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \FSM_sequential_state_reg[0]_i_3 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .O(\FSM_sequential_state_reg_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000FBFB3C3F0000)) 
    \FSM_sequential_state_reg[1]_i_1 
       (.I0(FSM_selector_C),
        .I1(out[2]),
        .I2(out[3]),
        .I3(zero_flag),
        .I4(out[1]),
        .I5(out[0]),
        .O(\FSM_sequential_state_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h686868683C383838)) 
    \FSM_sequential_state_reg[2]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .I3(DI),
        .I4(CO),
        .I5(out[3]),
        .O(\FSM_sequential_state_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555FFFF75555555)) 
    \FSM_sequential_state_reg[3]_i_1 
       (.I0(\FSM_sequential_state_reg[3]_i_3_n_0 ),
        .I1(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .I2(\FSM_sequential_state_reg_reg[3]_0 ),
        .I3(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .I4(out[2]),
        .I5(out[1]),
        .O(\FSM_sequential_state_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FF5A2F00FF0A2F0)) 
    \FSM_sequential_state_reg[3]_i_2 
       (.I0(out[0]),
        .I1(FSM_selector_C),
        .I2(out[3]),
        .I3(out[2]),
        .I4(out[1]),
        .I5(zero_flag),
        .O(\FSM_sequential_state_reg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF00F000000007007)) 
    \FSM_sequential_state_reg[3]_i_3 
       (.I0(\FSM_sequential_state_reg_reg[3]_1 ),
        .I1(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .I5(out[3]),
        .O(\FSM_sequential_state_reg[3]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(\FSM_sequential_state_reg[0]_i_1__0_n_0 ),
        .Q(out[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(\FSM_sequential_state_reg[1]_i_1_n_0 ),
        .Q(out[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[2] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(\FSM_sequential_state_reg[2]_i_1_n_0 ),
        .Q(out[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg_reg[3] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(\FSM_sequential_state_reg[3]_i_2_n_0 ),
        .Q(out[3]));
  LUT5 #(
    .INIT(32'hFFFF0800)) 
    \Q[0]_i_1__13 
       (.I0(out[3]),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[2]),
        .I4(FSM_selector_C),
        .O(\Q_reg[0] ));
  LUT6 #(
    .INIT(64'h0001FFFF00010000)) 
    \Q[0]_i_1__14 
       (.I0(\Q_reg[30] [0]),
        .I1(\Q_reg[30] [2]),
        .I2(\Q_reg[30] [1]),
        .I3(\Q_reg[23]_0 ),
        .I4(FSM_exp_operation_load_OU),
        .I5(underflow_flag_OBUF),
        .O(\Q_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[21]_i_1__2 
       (.I0(\Q_reg[21] ),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[2] ),
        .I3(\Q_reg[0]_9 ),
        .I4(\Q_reg[1] ),
        .I5(\Q_reg[0]_10 ),
        .O(\Q_reg[23] [0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[23]_i_1__2 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[2] ),
        .I2(\Q_reg[0]_10 ),
        .I3(\Q_reg[1] ),
        .I4(\Q_reg[21] ),
        .O(\Q_reg[23] [1]));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[24]_i_2 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .O(\Q_reg[0]_8 [1]));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[25]_i_2 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .O(\Q_reg[0]_7 ));
  LUT6 #(
    .INIT(64'hB8BBB88888BB88BB)) 
    \Q[25]_i_3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_11 ),
        .I2(\Q_reg[25] [0]),
        .I3(FSM_barrel_shifter_L_R),
        .I4(\Q_reg[25] [1]),
        .I5(FSM_selector_C),
        .O(\Q_reg[21] ));
  LUT4 #(
    .INIT(16'h0010)) 
    \Q[30]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .O(\Q_reg[0]_6 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \Q[31]_i_1__6 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .O(\Q_reg[0]_5 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \Q[31]_i_1__8 
       (.I0(out[2]),
        .I1(out[3]),
        .I2(out[0]),
        .I3(out[1]),
        .O(E));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[3]_i_2 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .O(\Q_reg[0]_8 [0]));
  LUT4 #(
    .INIT(16'h2000)) 
    __0
       (.I0(out[2]),
        .I1(out[0]),
        .I2(out[3]),
        .I3(out[1]),
        .O(\Q_reg[0]_1 ));
  LUT4 #(
    .INIT(16'h2800)) 
    __1
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[3]),
        .I3(out[2]),
        .O(\Q_reg[0]_2 ));
  LUT6 #(
    .INIT(64'h00080C000008C000)) 
    __2
       (.I0(FSM_selector_C),
        .I1(add_overflow_flag),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[2]),
        .I5(out[0]),
        .O(FSM_barrel_shifter_B_S));
  LUT5 #(
    .INIT(32'h00001000)) 
    __3
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(FSM_selector_C),
        .I4(add_overflow_flag),
        .O(FSM_barrel_shifter_L_R));
  LUT4 #(
    .INIT(16'h0420)) 
    __4
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .O(\Q_reg[0]_3 ));
  LUT6 #(
    .INIT(64'h0FFFFF5FFFFFF7FF)) 
    __5
       (.I0(add_overflow_flag),
        .I1(FSM_selector_C),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[1]),
        .I5(out[3]),
        .O(FSM_exp_operation_A_S));
  LUT5 #(
    .INIT(32'h00300200)) 
    __6
       (.I0(FSM_selector_C),
        .I1(out[1]),
        .I2(out[3]),
        .I3(out[2]),
        .I4(out[0]),
        .O(FSM_exp_operation_load_OU));
  LUT4 #(
    .INIT(16'h0224)) 
    __7
       (.I0(out[0]),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[1]),
        .O(\Q_reg[0]_4 ));
  LUT6 #(
    .INIT(64'h0FFFFF5FFFFFF7FF)) 
    _rep
       (.I0(add_overflow_flag),
        .I1(FSM_selector_C),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[1]),
        .I5(out[3]),
        .O(S));
endmodule

module LZD
   (Q,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [4:0]Q;
  input [0:0]E;
  input [4:0]D;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [4:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [4:0]Q;

  RegisterAdd__parameterized9 Output_Reg
       (.CLK(CLK),
        .D(D),
        .E(E),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3] ),
        .Q(Q));
endmodule

module Mux_2x1
   (D,
    Q,
    \Q_reg[0] );
  output [19:0]D;
  input [19:0]Q;
  input \Q_reg[0] ;

  wire [19:0]D;
  wire [19:0]Q;
  wire \Q_reg[0] ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[10]_i_1 
       (.I0(Q[6]),
        .I1(\Q_reg[0] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[12]_i_1 
       (.I0(Q[7]),
        .I1(\Q_reg[0] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[13]_i_1 
       (.I0(Q[8]),
        .I1(\Q_reg[0] ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[14]_i_1 
       (.I0(Q[9]),
        .I1(\Q_reg[0] ),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[16]_i_1 
       (.I0(Q[10]),
        .I1(\Q_reg[0] ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[17]_i_1 
       (.I0(Q[11]),
        .I1(\Q_reg[0] ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[19]_i_1 
       (.I0(Q[12]),
        .I1(\Q_reg[0] ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[1]_i_1 
       (.I0(Q[0]),
        .I1(\Q_reg[0] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[20]_i_1 
       (.I0(Q[13]),
        .I1(\Q_reg[0] ),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[24]_i_1 
       (.I0(Q[14]),
        .I1(\Q_reg[0] ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[25]_i_1 
       (.I0(Q[15]),
        .I1(\Q_reg[0] ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[26]_i_1 
       (.I0(Q[16]),
        .I1(\Q_reg[0] ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[27]_i_1 
       (.I0(Q[17]),
        .I1(\Q_reg[0] ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[28]_i_1 
       (.I0(Q[18]),
        .I1(\Q_reg[0] ),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[29]_i_1 
       (.I0(Q[19]),
        .I1(\Q_reg[0] ),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[2]_i_1 
       (.I0(Q[1]),
        .I1(\Q_reg[0] ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[3]_i_1 
       (.I0(Q[2]),
        .I1(\Q_reg[0] ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[5]_i_1 
       (.I0(Q[3]),
        .I1(\Q_reg[0] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[6]_i_1 
       (.I0(Q[4]),
        .I1(\Q_reg[0] ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \Q[7]_i_1 
       (.I0(Q[5]),
        .I1(\Q_reg[0] ),
        .O(D[5]));
endmodule

(* ORIG_REF_NAME = "Mux_2x1" *) 
module Mux_2x1_0
   (D,
    Q,
    \Q_reg[31] ,
    \Q_reg[0] );
  output [31:0]D;
  input [31:0]Q;
  input [31:0]\Q_reg[31] ;
  input \Q_reg[0] ;

  wire [31:0]D;
  wire [31:0]Q;
  wire \Q_reg[0] ;
  wire [31:0]\Q_reg[31] ;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[0]_i_1 
       (.I0(Q[0]),
        .I1(\Q_reg[31] [0]),
        .I2(\Q_reg[0] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[10]_i_1 
       (.I0(Q[10]),
        .I1(\Q_reg[31] [10]),
        .I2(\Q_reg[0] ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[11]_i_1 
       (.I0(Q[11]),
        .I1(\Q_reg[31] [11]),
        .I2(\Q_reg[0] ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[12]_i_1 
       (.I0(Q[12]),
        .I1(\Q_reg[31] [12]),
        .I2(\Q_reg[0] ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[13]_i_1 
       (.I0(Q[13]),
        .I1(\Q_reg[31] [13]),
        .I2(\Q_reg[0] ),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[14]_i_1 
       (.I0(Q[14]),
        .I1(\Q_reg[31] [14]),
        .I2(\Q_reg[0] ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[15]_i_1 
       (.I0(Q[15]),
        .I1(\Q_reg[31] [15]),
        .I2(\Q_reg[0] ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[16]_i_1 
       (.I0(Q[16]),
        .I1(\Q_reg[31] [16]),
        .I2(\Q_reg[0] ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[17]_i_1 
       (.I0(Q[17]),
        .I1(\Q_reg[31] [17]),
        .I2(\Q_reg[0] ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[18]_i_1 
       (.I0(Q[18]),
        .I1(\Q_reg[31] [18]),
        .I2(\Q_reg[0] ),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[19]_i_1 
       (.I0(Q[19]),
        .I1(\Q_reg[31] [19]),
        .I2(\Q_reg[0] ),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[1]_i_1 
       (.I0(Q[1]),
        .I1(\Q_reg[31] [1]),
        .I2(\Q_reg[0] ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[20]_i_1 
       (.I0(Q[20]),
        .I1(\Q_reg[31] [20]),
        .I2(\Q_reg[0] ),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[21]_i_1 
       (.I0(Q[21]),
        .I1(\Q_reg[31] [21]),
        .I2(\Q_reg[0] ),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[22]_i_1 
       (.I0(Q[22]),
        .I1(\Q_reg[31] [22]),
        .I2(\Q_reg[0] ),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[23]_i_1 
       (.I0(Q[23]),
        .I1(\Q_reg[31] [23]),
        .I2(\Q_reg[0] ),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[24]_i_1 
       (.I0(Q[24]),
        .I1(\Q_reg[31] [24]),
        .I2(\Q_reg[0] ),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[25]_i_1 
       (.I0(Q[25]),
        .I1(\Q_reg[31] [25]),
        .I2(\Q_reg[0] ),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[26]_i_1 
       (.I0(Q[26]),
        .I1(\Q_reg[31] [26]),
        .I2(\Q_reg[0] ),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[27]_i_1 
       (.I0(Q[27]),
        .I1(\Q_reg[31] [27]),
        .I2(\Q_reg[0] ),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[28]_i_1 
       (.I0(Q[28]),
        .I1(\Q_reg[31] [28]),
        .I2(\Q_reg[0] ),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[29]_i_1 
       (.I0(Q[29]),
        .I1(\Q_reg[31] [29]),
        .I2(\Q_reg[0] ),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[2]_i_1 
       (.I0(Q[2]),
        .I1(\Q_reg[31] [2]),
        .I2(\Q_reg[0] ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[30]_i_1 
       (.I0(Q[30]),
        .I1(\Q_reg[31] [30]),
        .I2(\Q_reg[0] ),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[31]_i_1 
       (.I0(Q[31]),
        .I1(\Q_reg[31] [31]),
        .I2(\Q_reg[0] ),
        .O(D[31]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[3]_i_1 
       (.I0(Q[3]),
        .I1(\Q_reg[31] [3]),
        .I2(\Q_reg[0] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[4]_i_1 
       (.I0(Q[4]),
        .I1(\Q_reg[31] [4]),
        .I2(\Q_reg[0] ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[5]_i_1 
       (.I0(Q[5]),
        .I1(\Q_reg[31] [5]),
        .I2(\Q_reg[0] ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[6]_i_1 
       (.I0(Q[6]),
        .I1(\Q_reg[31] [6]),
        .I2(\Q_reg[0] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[7]_i_1 
       (.I0(Q[7]),
        .I1(\Q_reg[31] [7]),
        .I2(\Q_reg[0] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[8]_i_1 
       (.I0(Q[8]),
        .I1(\Q_reg[31] [8]),
        .I2(\Q_reg[0] ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[9]_i_1 
       (.I0(Q[9]),
        .I1(\Q_reg[31] [9]),
        .I2(\Q_reg[0] ),
        .O(D[9]));
endmodule

(* ORIG_REF_NAME = "Mux_2x1" *) 
module Mux_2x1_1
   (D,
    Q,
    \Q_reg[31] ,
    \Q_reg[0] );
  output [31:0]D;
  input [31:0]Q;
  input [31:0]\Q_reg[31] ;
  input \Q_reg[0] ;

  wire [31:0]D;
  wire [31:0]Q;
  wire \Q_reg[0] ;
  wire [31:0]\Q_reg[31] ;

  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[0]_i_1 
       (.I0(Q[0]),
        .I1(\Q_reg[31] [0]),
        .I2(\Q_reg[0] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[10]_i_1 
       (.I0(Q[10]),
        .I1(\Q_reg[31] [10]),
        .I2(\Q_reg[0] ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[11]_i_1 
       (.I0(Q[11]),
        .I1(\Q_reg[31] [11]),
        .I2(\Q_reg[0] ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[12]_i_1 
       (.I0(Q[12]),
        .I1(\Q_reg[31] [12]),
        .I2(\Q_reg[0] ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[13]_i_1 
       (.I0(Q[13]),
        .I1(\Q_reg[31] [13]),
        .I2(\Q_reg[0] ),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[14]_i_1 
       (.I0(Q[14]),
        .I1(\Q_reg[31] [14]),
        .I2(\Q_reg[0] ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[15]_i_1 
       (.I0(Q[15]),
        .I1(\Q_reg[31] [15]),
        .I2(\Q_reg[0] ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[16]_i_1 
       (.I0(Q[16]),
        .I1(\Q_reg[31] [16]),
        .I2(\Q_reg[0] ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[17]_i_1 
       (.I0(Q[17]),
        .I1(\Q_reg[31] [17]),
        .I2(\Q_reg[0] ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[18]_i_1 
       (.I0(Q[18]),
        .I1(\Q_reg[31] [18]),
        .I2(\Q_reg[0] ),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[19]_i_1 
       (.I0(Q[19]),
        .I1(\Q_reg[31] [19]),
        .I2(\Q_reg[0] ),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[1]_i_1 
       (.I0(Q[1]),
        .I1(\Q_reg[31] [1]),
        .I2(\Q_reg[0] ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[20]_i_1 
       (.I0(Q[20]),
        .I1(\Q_reg[31] [20]),
        .I2(\Q_reg[0] ),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[21]_i_1 
       (.I0(Q[21]),
        .I1(\Q_reg[31] [21]),
        .I2(\Q_reg[0] ),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[22]_i_1 
       (.I0(Q[22]),
        .I1(\Q_reg[31] [22]),
        .I2(\Q_reg[0] ),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[23]_i_1 
       (.I0(Q[23]),
        .I1(\Q_reg[31] [23]),
        .I2(\Q_reg[0] ),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[24]_i_1 
       (.I0(Q[24]),
        .I1(\Q_reg[31] [24]),
        .I2(\Q_reg[0] ),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[25]_i_1 
       (.I0(Q[25]),
        .I1(\Q_reg[31] [25]),
        .I2(\Q_reg[0] ),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[26]_i_1 
       (.I0(Q[26]),
        .I1(\Q_reg[31] [26]),
        .I2(\Q_reg[0] ),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[27]_i_1 
       (.I0(Q[27]),
        .I1(\Q_reg[31] [27]),
        .I2(\Q_reg[0] ),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[28]_i_1 
       (.I0(Q[28]),
        .I1(\Q_reg[31] [28]),
        .I2(\Q_reg[0] ),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[29]_i_1 
       (.I0(Q[29]),
        .I1(\Q_reg[31] [29]),
        .I2(\Q_reg[0] ),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[2]_i_1 
       (.I0(Q[2]),
        .I1(\Q_reg[31] [2]),
        .I2(\Q_reg[0] ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[30]_i_1 
       (.I0(Q[30]),
        .I1(\Q_reg[31] [30]),
        .I2(\Q_reg[0] ),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[31]_i_2 
       (.I0(Q[31]),
        .I1(\Q_reg[31] [31]),
        .I2(\Q_reg[0] ),
        .O(D[31]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[3]_i_1 
       (.I0(Q[3]),
        .I1(\Q_reg[31] [3]),
        .I2(\Q_reg[0] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[4]_i_1 
       (.I0(Q[4]),
        .I1(\Q_reg[31] [4]),
        .I2(\Q_reg[0] ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[5]_i_1 
       (.I0(Q[5]),
        .I1(\Q_reg[31] [5]),
        .I2(\Q_reg[0] ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[6]_i_1 
       (.I0(Q[6]),
        .I1(\Q_reg[31] [6]),
        .I2(\Q_reg[0] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[7]_i_1 
       (.I0(Q[7]),
        .I1(\Q_reg[31] [7]),
        .I2(\Q_reg[0] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[8]_i_1 
       (.I0(Q[8]),
        .I1(\Q_reg[31] [8]),
        .I2(\Q_reg[0] ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \Q[9]_i_1 
       (.I0(Q[9]),
        .I1(\Q_reg[31] [9]),
        .I2(\Q_reg[0] ),
        .O(D[9]));
endmodule

module Mux_Array
   (D,
    \Q_reg[16] ,
    Q,
    \Q_reg[25] ,
    \Q_reg[17] ,
    \Q_reg[24] ,
    \Q_reg[18] ,
    \Q_reg[23] ,
    \Q_reg[19] ,
    \Q_reg[22] ,
    \Q_reg[20] ,
    \Q_reg[21] ,
    FSM_barrel_shifter_L_R,
    \Q_reg[16]_0 ,
    FSM_barrel_shifter_B_S,
    \Q_reg[4] ,
    \Q_reg[3] ,
    \Q_reg[17]_0 ,
    \Q_reg[2] ,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [9:0]D;
  output \Q_reg[16] ;
  output [15:0]Q;
  output \Q_reg[25] ;
  output \Q_reg[17] ;
  output \Q_reg[24] ;
  output \Q_reg[18] ;
  output \Q_reg[23] ;
  output \Q_reg[19] ;
  output \Q_reg[22] ;
  output \Q_reg[20] ;
  output \Q_reg[21] ;
  input FSM_barrel_shifter_L_R;
  input \Q_reg[16]_0 ;
  input FSM_barrel_shifter_B_S;
  input \Q_reg[4] ;
  input \Q_reg[3] ;
  input \Q_reg[17]_0 ;
  input [25:0]\Q_reg[2] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [9:0]D;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [15:0]Q;
  wire \Q_reg[16] ;
  wire \Q_reg[16]_0 ;
  wire \Q_reg[17] ;
  wire \Q_reg[17]_0 ;
  wire \Q_reg[18] ;
  wire \Q_reg[19] ;
  wire \Q_reg[20] ;
  wire \Q_reg[21] ;
  wire \Q_reg[22] ;
  wire \Q_reg[23] ;
  wire \Q_reg[24] ;
  wire \Q_reg[25] ;
  wire [25:0]\Q_reg[2] ;
  wire \Q_reg[3] ;
  wire \Q_reg[4] ;

  RegisterAdd__parameterized6 Mid_Reg
       (.CLK(CLK),
        .D(D),
        .FSM_barrel_shifter_B_S(FSM_barrel_shifter_B_S),
        .FSM_barrel_shifter_L_R(FSM_barrel_shifter_L_R),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3] ),
        .Q(Q),
        .\Q_reg[16]_0 (\Q_reg[16] ),
        .\Q_reg[16]_1 (\Q_reg[16]_0 ),
        .\Q_reg[17]_0 (\Q_reg[17] ),
        .\Q_reg[17]_1 (\Q_reg[17]_0 ),
        .\Q_reg[18]_0 (\Q_reg[18] ),
        .\Q_reg[19]_0 (\Q_reg[19] ),
        .\Q_reg[20]_0 (\Q_reg[20] ),
        .\Q_reg[21]_0 (\Q_reg[21] ),
        .\Q_reg[22]_0 (\Q_reg[22] ),
        .\Q_reg[23]_0 (\Q_reg[23] ),
        .\Q_reg[24]_0 (\Q_reg[24] ),
        .\Q_reg[25]_0 (\Q_reg[25] ),
        .\Q_reg[2]_0 (\Q_reg[2] ),
        .\Q_reg[3]_0 (\Q_reg[3] ),
        .\Q_reg[4]_0 (\Q_reg[4] ));
endmodule

module Oper_Start_In
   (sign_final_result,
    CO,
    \Q_reg[0] ,
    DI,
    zero_flag,
    \Q_reg[7] ,
    Q,
    O,
    \Q_reg[3] ,
    \Q_reg[7]_0 ,
    \Q_reg[11] ,
    \Q_reg[15] ,
    \Q_reg[19] ,
    \Q_reg[23] ,
    \Q_reg[7]_1 ,
    E,
    \count_reg[0] ,
    CLK,
    \FSM_sequential_state_reg_reg[3] ,
    \FSM_sequential_state_reg_reg[3]_0 ,
    \Q_reg[25] ,
    FSM_exp_operation_A_S,
    S,
    \Q_reg[30] ,
    \Q_reg[0]_0 ,
    D,
    \Q_reg[31] );
  output sign_final_result;
  output [0:0]CO;
  output [2:0]\Q_reg[0] ;
  output [1:0]DI;
  output zero_flag;
  output [7:0]\Q_reg[7] ;
  output [29:0]Q;
  output [0:0]O;
  output [2:0]\Q_reg[3] ;
  output [3:0]\Q_reg[7]_0 ;
  output [3:0]\Q_reg[11] ;
  output [3:0]\Q_reg[15] ;
  output [3:0]\Q_reg[19] ;
  output [3:0]\Q_reg[23] ;
  output [30:0]\Q_reg[7]_1 ;
  input [0:0]E;
  input \count_reg[0] ;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[3] ;
  input [0:0]\FSM_sequential_state_reg_reg[3]_0 ;
  input [24:0]\Q_reg[25] ;
  input FSM_exp_operation_A_S;
  input [3:0]S;
  input [3:0]\Q_reg[30] ;
  input [0:0]\Q_reg[0]_0 ;
  input [31:0]D;
  input [31:0]\Q_reg[31] ;

  wire CLK;
  wire [0:0]CO;
  wire [31:0]D;
  wire [1:0]DI;
  wire [0:0]E;
  wire FSM_exp_operation_A_S;
  wire [1:0]\FSM_sequential_state_reg_reg[3] ;
  wire [0:0]\FSM_sequential_state_reg_reg[3]_0 ;
  wire [0:0]O;
  wire [29:0]Q;
  wire [2:0]\Q_reg[0] ;
  wire [0:0]\Q_reg[0]_0 ;
  wire [3:0]\Q_reg[11] ;
  wire [3:0]\Q_reg[15] ;
  wire [3:0]\Q_reg[19] ;
  wire [3:0]\Q_reg[23] ;
  wire [24:0]\Q_reg[25] ;
  wire [3:0]\Q_reg[30] ;
  wire [31:0]\Q_reg[31] ;
  wire [2:0]\Q_reg[3] ;
  wire [7:0]\Q_reg[7] ;
  wire [3:0]\Q_reg[7]_0 ;
  wire [30:0]\Q_reg[7]_1 ;
  wire [3:0]S;
  wire XRegister_n_10;
  wire XRegister_n_100;
  wire XRegister_n_101;
  wire XRegister_n_102;
  wire XRegister_n_103;
  wire XRegister_n_104;
  wire XRegister_n_105;
  wire XRegister_n_106;
  wire XRegister_n_107;
  wire XRegister_n_108;
  wire XRegister_n_109;
  wire XRegister_n_11;
  wire XRegister_n_110;
  wire XRegister_n_111;
  wire XRegister_n_112;
  wire XRegister_n_113;
  wire XRegister_n_114;
  wire XRegister_n_115;
  wire XRegister_n_116;
  wire XRegister_n_117;
  wire XRegister_n_118;
  wire XRegister_n_119;
  wire XRegister_n_12;
  wire XRegister_n_120;
  wire XRegister_n_121;
  wire XRegister_n_122;
  wire XRegister_n_123;
  wire XRegister_n_124;
  wire XRegister_n_13;
  wire XRegister_n_14;
  wire XRegister_n_15;
  wire XRegister_n_16;
  wire XRegister_n_17;
  wire XRegister_n_18;
  wire XRegister_n_19;
  wire XRegister_n_20;
  wire XRegister_n_21;
  wire XRegister_n_22;
  wire XRegister_n_23;
  wire XRegister_n_24;
  wire XRegister_n_25;
  wire XRegister_n_26;
  wire XRegister_n_27;
  wire XRegister_n_28;
  wire XRegister_n_29;
  wire XRegister_n_30;
  wire XRegister_n_31;
  wire XRegister_n_32;
  wire XRegister_n_33;
  wire XRegister_n_34;
  wire XRegister_n_35;
  wire XRegister_n_36;
  wire XRegister_n_37;
  wire XRegister_n_38;
  wire XRegister_n_39;
  wire XRegister_n_40;
  wire XRegister_n_41;
  wire XRegister_n_42;
  wire XRegister_n_43;
  wire XRegister_n_44;
  wire XRegister_n_45;
  wire XRegister_n_46;
  wire XRegister_n_47;
  wire XRegister_n_48;
  wire XRegister_n_49;
  wire XRegister_n_5;
  wire XRegister_n_50;
  wire XRegister_n_51;
  wire XRegister_n_52;
  wire XRegister_n_53;
  wire XRegister_n_54;
  wire XRegister_n_55;
  wire XRegister_n_56;
  wire XRegister_n_57;
  wire XRegister_n_58;
  wire XRegister_n_59;
  wire XRegister_n_6;
  wire XRegister_n_60;
  wire XRegister_n_61;
  wire XRegister_n_63;
  wire XRegister_n_64;
  wire XRegister_n_65;
  wire XRegister_n_66;
  wire XRegister_n_67;
  wire XRegister_n_68;
  wire XRegister_n_69;
  wire XRegister_n_7;
  wire XRegister_n_70;
  wire XRegister_n_71;
  wire XRegister_n_72;
  wire XRegister_n_73;
  wire XRegister_n_74;
  wire XRegister_n_75;
  wire XRegister_n_76;
  wire XRegister_n_77;
  wire XRegister_n_78;
  wire XRegister_n_79;
  wire XRegister_n_8;
  wire XRegister_n_80;
  wire XRegister_n_81;
  wire XRegister_n_82;
  wire XRegister_n_83;
  wire XRegister_n_84;
  wire XRegister_n_85;
  wire XRegister_n_86;
  wire XRegister_n_87;
  wire XRegister_n_88;
  wire XRegister_n_89;
  wire XRegister_n_9;
  wire XRegister_n_90;
  wire XRegister_n_91;
  wire XRegister_n_92;
  wire XRegister_n_93;
  wire XRegister_n_94;
  wire XRegister_n_95;
  wire XRegister_n_96;
  wire XRegister_n_97;
  wire XRegister_n_98;
  wire XRegister_n_99;
  wire YRegister_n_0;
  wire YRegister_n_10;
  wire YRegister_n_11;
  wire YRegister_n_12;
  wire YRegister_n_13;
  wire YRegister_n_14;
  wire YRegister_n_15;
  wire YRegister_n_16;
  wire YRegister_n_17;
  wire YRegister_n_18;
  wire YRegister_n_19;
  wire YRegister_n_2;
  wire YRegister_n_20;
  wire YRegister_n_21;
  wire YRegister_n_22;
  wire YRegister_n_23;
  wire YRegister_n_24;
  wire YRegister_n_25;
  wire YRegister_n_26;
  wire YRegister_n_27;
  wire YRegister_n_28;
  wire YRegister_n_29;
  wire YRegister_n_3;
  wire YRegister_n_30;
  wire YRegister_n_31;
  wire YRegister_n_32;
  wire YRegister_n_33;
  wire YRegister_n_34;
  wire YRegister_n_35;
  wire YRegister_n_36;
  wire YRegister_n_37;
  wire YRegister_n_38;
  wire YRegister_n_39;
  wire YRegister_n_4;
  wire YRegister_n_40;
  wire YRegister_n_41;
  wire YRegister_n_42;
  wire YRegister_n_43;
  wire YRegister_n_44;
  wire YRegister_n_45;
  wire YRegister_n_46;
  wire YRegister_n_47;
  wire YRegister_n_48;
  wire YRegister_n_5;
  wire YRegister_n_6;
  wire YRegister_n_7;
  wire YRegister_n_8;
  wire YRegister_n_9;
  wire \count_reg[0] ;
  wire gtXY;
  wire intAS;
  wire [31:31]intDY;
  wire sign_final_result;
  wire sign_result;
  wire zero_flag;

  RegisterAdd_6 ASRegister
       (.CLK(CLK),
        .E(E),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3] [1]),
        .\count_reg[0] (\count_reg[0] ),
        .intAS(intAS));
  RegisterAdd__parameterized3 MRegister
       (.CLK(CLK),
        .D({XRegister_n_63,XRegister_n_64,XRegister_n_65,XRegister_n_66,XRegister_n_67,XRegister_n_68,XRegister_n_69,XRegister_n_70,XRegister_n_71,XRegister_n_72,XRegister_n_73,XRegister_n_74,XRegister_n_75,XRegister_n_76,XRegister_n_77,XRegister_n_78,XRegister_n_79,XRegister_n_80,XRegister_n_81,XRegister_n_82,XRegister_n_83,XRegister_n_84,XRegister_n_85,XRegister_n_86,XRegister_n_87,XRegister_n_88,XRegister_n_89,XRegister_n_90,XRegister_n_91,XRegister_n_92,XRegister_n_93}),
        .FSM_exp_operation_A_S(FSM_exp_operation_A_S),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3]_0 ),
        .\FSM_sequential_state_reg_reg[3]_0 (\FSM_sequential_state_reg_reg[3] [0]),
        .O(O),
        .Q(Q),
        .\Q_reg[0]_0 (\Q_reg[0]_0 ),
        .\Q_reg[30]_0 (\Q_reg[30] ),
        .\Q_reg[7]_0 (\Q_reg[7] ),
        .S(S));
  Comparator Magnitude_Comparator
       (.CO(gtXY),
        .DI({XRegister_n_40,XRegister_n_41,XRegister_n_42,XRegister_n_43}),
        .\Q_reg[0] (CO),
        .\Q_reg[10] ({XRegister_n_5,XRegister_n_6,XRegister_n_7,XRegister_n_8}),
        .\Q_reg[15] ({XRegister_n_44,XRegister_n_45,XRegister_n_46,XRegister_n_47}),
        .\Q_reg[15]_0 ({YRegister_n_41,YRegister_n_42,YRegister_n_43,YRegister_n_44}),
        .\Q_reg[22] ({XRegister_n_48,XRegister_n_49,XRegister_n_50,XRegister_n_51}),
        .\Q_reg[23] ({XRegister_n_52,XRegister_n_53,XRegister_n_54,XRegister_n_55}),
        .\Q_reg[23]_0 ({YRegister_n_45,YRegister_n_46,YRegister_n_47,YRegister_n_48}),
        .\Q_reg[30] ({XRegister_n_58,XRegister_n_59,XRegister_n_60,XRegister_n_61}),
        .\Q_reg[30]_0 ({YRegister_n_33,YRegister_n_34,YRegister_n_35,YRegister_n_36}),
        .\Q_reg[30]_1 ({YRegister_n_0,XRegister_n_56,XRegister_n_57}),
        .S({YRegister_n_37,YRegister_n_38,YRegister_n_39,YRegister_n_40}));
  RegisterAdd_7 SignRegister
       (.CLK(CLK),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3]_0 ),
        .\FSM_sequential_state_reg_reg[3]_0 (\FSM_sequential_state_reg_reg[3] [0]),
        .sign_final_result(sign_final_result),
        .sign_result(sign_result));
  RegisterAdd__parameterized1 XRegister
       (.CLK(CLK),
        .CO(CO),
        .D({XRegister_n_63,XRegister_n_64,XRegister_n_65,XRegister_n_66,XRegister_n_67,XRegister_n_68,XRegister_n_69,XRegister_n_70,XRegister_n_71,XRegister_n_72,XRegister_n_73,XRegister_n_74,XRegister_n_75,XRegister_n_76,XRegister_n_77,XRegister_n_78,XRegister_n_79,XRegister_n_80,XRegister_n_81,XRegister_n_82,XRegister_n_83,XRegister_n_84,XRegister_n_85,XRegister_n_86,XRegister_n_87,XRegister_n_88,XRegister_n_89,XRegister_n_90,XRegister_n_91,XRegister_n_92,XRegister_n_93}),
        .DI({XRegister_n_40,XRegister_n_41,XRegister_n_42,XRegister_n_43}),
        .E(E),
        .\FSM_sequential_state_reg_reg[2] (DI[0]),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3] [1]),
        .Q({XRegister_n_9,XRegister_n_10,XRegister_n_11,XRegister_n_12,XRegister_n_13,XRegister_n_14,XRegister_n_15,XRegister_n_16,XRegister_n_17,XRegister_n_18,XRegister_n_19,XRegister_n_20,XRegister_n_21,XRegister_n_22,XRegister_n_23,XRegister_n_24,XRegister_n_25,XRegister_n_26,XRegister_n_27,XRegister_n_28,XRegister_n_29,XRegister_n_30,XRegister_n_31,XRegister_n_32,XRegister_n_33,XRegister_n_34,XRegister_n_35,XRegister_n_36,XRegister_n_37,XRegister_n_38,XRegister_n_39}),
        .\Q_reg[0]_0 (\Q_reg[0] ),
        .\Q_reg[0]_1 ({XRegister_n_5,XRegister_n_6,XRegister_n_7,XRegister_n_8}),
        .\Q_reg[0]_2 ({XRegister_n_44,XRegister_n_45,XRegister_n_46,XRegister_n_47}),
        .\Q_reg[0]_3 ({XRegister_n_48,XRegister_n_49,XRegister_n_50,XRegister_n_51}),
        .\Q_reg[0]_4 ({XRegister_n_52,XRegister_n_53,XRegister_n_54,XRegister_n_55}),
        .\Q_reg[0]_5 ({XRegister_n_56,XRegister_n_57}),
        .\Q_reg[0]_6 ({XRegister_n_58,XRegister_n_59,XRegister_n_60,XRegister_n_61}),
        .\Q_reg[11]_0 (\Q_reg[11] ),
        .\Q_reg[15]_0 (\Q_reg[15] ),
        .\Q_reg[19]_0 (\Q_reg[19] ),
        .\Q_reg[22]_0 (Q[22:0]),
        .\Q_reg[23]_0 (\Q_reg[23] ),
        .\Q_reg[25]_0 (\Q_reg[25] ),
        .\Q_reg[30]_0 ({XRegister_n_94,XRegister_n_95,XRegister_n_96,XRegister_n_97,XRegister_n_98,XRegister_n_99,XRegister_n_100,XRegister_n_101,XRegister_n_102,XRegister_n_103,XRegister_n_104,XRegister_n_105,XRegister_n_106,XRegister_n_107,XRegister_n_108,XRegister_n_109,XRegister_n_110,XRegister_n_111,XRegister_n_112,XRegister_n_113,XRegister_n_114,XRegister_n_115,XRegister_n_116,XRegister_n_117,XRegister_n_118,XRegister_n_119,XRegister_n_120,XRegister_n_121,XRegister_n_122,XRegister_n_123,XRegister_n_124}),
        .\Q_reg[30]_1 (gtXY),
        .\Q_reg[31]_0 ({intDY,YRegister_n_2,YRegister_n_3,YRegister_n_4,YRegister_n_5,YRegister_n_6,YRegister_n_7,YRegister_n_8,YRegister_n_9,YRegister_n_10,YRegister_n_11,YRegister_n_12,YRegister_n_13,YRegister_n_14,YRegister_n_15,YRegister_n_16,YRegister_n_17,YRegister_n_18,YRegister_n_19,YRegister_n_20,YRegister_n_21,YRegister_n_22,YRegister_n_23,YRegister_n_24,YRegister_n_25,YRegister_n_26,YRegister_n_27,YRegister_n_28,YRegister_n_29,YRegister_n_30,YRegister_n_31,YRegister_n_32}),
        .\Q_reg[31]_1 (\Q_reg[31] ),
        .\Q_reg[3]_0 (DI[1]),
        .\Q_reg[3]_1 (\Q_reg[3] ),
        .\Q_reg[7]_0 (\Q_reg[7]_0 ),
        .intAS(intAS),
        .sign_result(sign_result),
        .zero_flag(zero_flag));
  RegisterAdd__parameterized2 YRegister
       (.CLK(CLK),
        .D(D),
        .E(E),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3] [1]),
        .Q({intDY,YRegister_n_2,YRegister_n_3,YRegister_n_4,YRegister_n_5,YRegister_n_6,YRegister_n_7,YRegister_n_8,YRegister_n_9,YRegister_n_10,YRegister_n_11,YRegister_n_12,YRegister_n_13,YRegister_n_14,YRegister_n_15,YRegister_n_16,YRegister_n_17,YRegister_n_18,YRegister_n_19,YRegister_n_20,YRegister_n_21,YRegister_n_22,YRegister_n_23,YRegister_n_24,YRegister_n_25,YRegister_n_26,YRegister_n_27,YRegister_n_28,YRegister_n_29,YRegister_n_30,YRegister_n_31,YRegister_n_32}),
        .\Q_reg[0]_0 (YRegister_n_0),
        .\Q_reg[0]_1 ({YRegister_n_33,YRegister_n_34,YRegister_n_35,YRegister_n_36}),
        .\Q_reg[0]_2 ({YRegister_n_41,YRegister_n_42,YRegister_n_43,YRegister_n_44}),
        .\Q_reg[0]_3 ({YRegister_n_45,YRegister_n_46,YRegister_n_47,YRegister_n_48}),
        .\Q_reg[30]_0 ({XRegister_n_9,XRegister_n_10,XRegister_n_11,XRegister_n_12,XRegister_n_13,XRegister_n_14,XRegister_n_15,XRegister_n_16,XRegister_n_17,XRegister_n_18,XRegister_n_19,XRegister_n_20,XRegister_n_21,XRegister_n_22,XRegister_n_23,XRegister_n_24,XRegister_n_25,XRegister_n_26,XRegister_n_27,XRegister_n_28,XRegister_n_29,XRegister_n_30,XRegister_n_31,XRegister_n_32,XRegister_n_33,XRegister_n_34,XRegister_n_35,XRegister_n_36,XRegister_n_37,XRegister_n_38,XRegister_n_39}),
        .S({YRegister_n_37,YRegister_n_38,YRegister_n_39,YRegister_n_40}));
  RegisterAdd__parameterized4 mRegister
       (.CLK(CLK),
        .D({XRegister_n_94,XRegister_n_95,XRegister_n_96,XRegister_n_97,XRegister_n_98,XRegister_n_99,XRegister_n_100,XRegister_n_101,XRegister_n_102,XRegister_n_103,XRegister_n_104,XRegister_n_105,XRegister_n_106,XRegister_n_107,XRegister_n_108,XRegister_n_109,XRegister_n_110,XRegister_n_111,XRegister_n_112,XRegister_n_113,XRegister_n_114,XRegister_n_115,XRegister_n_116,XRegister_n_117,XRegister_n_118,XRegister_n_119,XRegister_n_120,XRegister_n_121,XRegister_n_122,XRegister_n_123,XRegister_n_124}),
        .\FSM_sequential_state_reg_reg[3] (\FSM_sequential_state_reg_reg[3]_0 ),
        .\FSM_sequential_state_reg_reg[3]_0 (\FSM_sequential_state_reg_reg[3] [0]),
        .\Q_reg[7]_0 (\Q_reg[7]_1 ));
endmodule

module RegisterAdd
   (FSM_selector_C,
    \FSM_sequential_state_reg_reg[3] ,
    CLK,
    \FSM_sequential_state_reg_reg[3]_0 );
  output FSM_selector_C;
  input \FSM_sequential_state_reg_reg[3] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3]_0 ;

  wire CLK;
  wire FSM_selector_C;
  wire \FSM_sequential_state_reg_reg[3] ;
  wire [0:0]\FSM_sequential_state_reg_reg[3]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(\FSM_sequential_state_reg_reg[3] ),
        .Q(FSM_selector_C));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd_10
   (add_overflow_flag,
    E,
    O,
    CLK,
    AR);
  output add_overflow_flag;
  input [0:0]E;
  input [0:0]O;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [0:0]O;
  wire add_overflow_flag;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(O),
        .Q(add_overflow_flag));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd_6
   (intAS,
    E,
    \count_reg[0] ,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output intAS;
  input [0:0]E;
  input \count_reg[0] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire \count_reg[0] ;
  wire intAS;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\count_reg[0] ),
        .Q(intAS));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd_7
   (sign_final_result,
    \FSM_sequential_state_reg_reg[3] ,
    sign_result,
    CLK,
    \FSM_sequential_state_reg_reg[3]_0 );
  output sign_final_result;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;
  input sign_result;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3]_0 ;

  wire CLK;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [0:0]\FSM_sequential_state_reg_reg[3]_0 ;
  wire sign_final_result;
  wire sign_result;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(sign_result),
        .Q(sign_final_result));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd_8
   (\Q_reg[0]_0 ,
    D,
    E,
    CLK,
    AR,
    \Q_reg[24] ,
    \Q_reg[0]_1 ,
    O,
    \Q_reg[30] );
  output \Q_reg[0]_0 ;
  output [22:0]D;
  input [0:0]E;
  input CLK;
  input [0:0]AR;
  input [22:0]\Q_reg[24] ;
  input \Q_reg[0]_1 ;
  input [0:0]O;
  input [7:0]\Q_reg[30] ;

  wire [0:0]AR;
  wire CLK;
  wire [22:0]D;
  wire [0:0]E;
  wire [0:0]O;
  wire \Q[0]_i_1__10_n_0 ;
  wire \Q[0]_i_3__0_n_0 ;
  wire \Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire [22:0]\Q_reg[24] ;
  wire [7:0]\Q_reg[30] ;

  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \Q[0]_i_1__10 
       (.I0(O),
        .I1(\Q[0]_i_3__0_n_0 ),
        .I2(\Q_reg[30] [6]),
        .I3(\Q_reg[30] [4]),
        .I4(\Q_reg[30] [7]),
        .I5(\Q_reg[30] [5]),
        .O(\Q[0]_i_1__10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[0]_i_1__7 
       (.I0(\Q_reg[24] [0]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \Q[0]_i_3__0 
       (.I0(\Q_reg[30] [1]),
        .I1(\Q_reg[30] [3]),
        .I2(\Q_reg[30] [2]),
        .I3(\Q_reg[30] [0]),
        .O(\Q[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[10]_i_1__4 
       (.I0(\Q_reg[24] [10]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[11]_i_1__4 
       (.I0(\Q_reg[24] [11]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[12]_i_1__4 
       (.I0(\Q_reg[24] [12]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[13]_i_1__3 
       (.I0(\Q_reg[24] [13]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[14]_i_1__4 
       (.I0(\Q_reg[24] [14]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[15]_i_1__3 
       (.I0(\Q_reg[24] [15]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[16]_i_1__3 
       (.I0(\Q_reg[24] [16]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[17]_i_1__3 
       (.I0(\Q_reg[24] [17]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[18]_i_1__3 
       (.I0(\Q_reg[24] [18]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[19]_i_1__3 
       (.I0(\Q_reg[24] [19]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[1]_i_1__4 
       (.I0(\Q_reg[24] [1]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[20]_i_1__3 
       (.I0(\Q_reg[24] [20]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[21]_i_1__4 
       (.I0(\Q_reg[24] [21]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[21]));
  LUT3 #(
    .INIT(8'h02)) 
    \Q[22]_i_1__4 
       (.I0(\Q_reg[24] [22]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[2]_i_1__4 
       (.I0(\Q_reg[24] [2]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[3]_i_1__4 
       (.I0(\Q_reg[24] [3]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[4]_i_1__5 
       (.I0(\Q_reg[24] [4]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[5]_i_1__3 
       (.I0(\Q_reg[24] [5]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[6]_i_1__4 
       (.I0(\Q_reg[24] [6]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[7]_i_1__3 
       (.I0(\Q_reg[24] [7]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[8]_i_1__4 
       (.I0(\Q_reg[24] [8]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Q[9]_i_1__4 
       (.I0(\Q_reg[24] [9]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q[0]_i_1__10_n_0 ),
        .Q(\Q_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd_9
   (\Q_reg[31] ,
    D,
    \Q_reg[0]_0 ,
    \Q_reg[0]_1 ,
    CLK,
    AR,
    sign_final_result,
    \Q_reg[0]_2 ,
    O,
    \Q_reg[30] );
  output \Q_reg[31] ;
  output [0:0]D;
  output \Q_reg[0]_0 ;
  input \Q_reg[0]_1 ;
  input CLK;
  input [0:0]AR;
  input sign_final_result;
  input \Q_reg[0]_2 ;
  input [0:0]O;
  input [4:0]\Q_reg[30] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [0:0]O;
  wire \Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire \Q_reg[0]_2 ;
  wire [4:0]\Q_reg[30] ;
  wire \Q_reg[31] ;
  wire sign_final_result;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \Q[0]_i_2__3 
       (.I0(O),
        .I1(\Q_reg[30] [1]),
        .I2(\Q_reg[30] [3]),
        .I3(\Q_reg[30] [4]),
        .I4(\Q_reg[30] [0]),
        .I5(\Q_reg[30] [2]),
        .O(\Q_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h0E)) 
    \Q[31]_i_2__2 
       (.I0(sign_final_result),
        .I1(\Q_reg[31] ),
        .I2(\Q_reg[0]_2 ),
        .O(D));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\Q_reg[0]_1 ),
        .Q(\Q_reg[31] ));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized0
   (\Q_reg[25] ,
    \Q_reg[25]_0 ,
    \Q_reg[25]_1 ,
    D,
    \Q_reg[9] ,
    \Q_reg[0]_0 ,
    \Q_reg[0]_1 ,
    \Q_reg[8] ,
    \Q_reg[21] ,
    FSM_selector_B,
    \Q_reg[0]_2 ,
    FSM_barrel_shifter_B_S,
    \Q_reg[0]_3 ,
    FSM_barrel_shifter_L_R,
    \Q_reg[25]_2 ,
    Q,
    \Q_reg[16] ,
    \Q_reg[24] ,
    \Q_reg[17] ,
    \Q_reg[23] ,
    \Q_reg[18] ,
    \Q_reg[22] ,
    \Q_reg[19] ,
    \Q_reg[21]_0 ,
    \Q_reg[20] ,
    \Q_reg[0]_4 ,
    \Q_reg[4] ,
    \Q_reg[4]_0 ,
    add_overflow_flag,
    out,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [2:0]\Q_reg[25] ;
  output \Q_reg[25]_0 ;
  output \Q_reg[25]_1 ;
  output [15:0]D;
  output \Q_reg[9] ;
  output \Q_reg[0]_0 ;
  output \Q_reg[0]_1 ;
  output \Q_reg[8] ;
  output \Q_reg[21] ;
  output [1:0]FSM_selector_B;
  input \Q_reg[0]_2 ;
  input FSM_barrel_shifter_B_S;
  input \Q_reg[0]_3 ;
  input FSM_barrel_shifter_L_R;
  input \Q_reg[25]_2 ;
  input [15:0]Q;
  input \Q_reg[16] ;
  input \Q_reg[24] ;
  input \Q_reg[17] ;
  input \Q_reg[23] ;
  input \Q_reg[18] ;
  input \Q_reg[22] ;
  input \Q_reg[19] ;
  input \Q_reg[21]_0 ;
  input \Q_reg[20] ;
  input \Q_reg[0]_4 ;
  input [4:0]\Q_reg[4] ;
  input [4:0]\Q_reg[4]_0 ;
  input add_overflow_flag;
  input [3:0]out;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [15:0]D;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire [1:0]FSM_selector_B;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [15:0]Q;
  wire \Q[0]_i_1_n_0 ;
  wire \Q[13]_i_2_n_0 ;
  wire \Q[13]_i_3_n_0 ;
  wire \Q[14]_i_2_n_0 ;
  wire \Q[14]_i_3_n_0 ;
  wire \Q[15]_i_2_n_0 ;
  wire \Q[15]_i_3_n_0 ;
  wire \Q[1]_i_1_n_0 ;
  wire \Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire \Q_reg[0]_2 ;
  wire \Q_reg[0]_3 ;
  wire \Q_reg[0]_4 ;
  wire \Q_reg[16] ;
  wire \Q_reg[17] ;
  wire \Q_reg[18] ;
  wire \Q_reg[19] ;
  wire \Q_reg[20] ;
  wire \Q_reg[21] ;
  wire \Q_reg[21]_0 ;
  wire \Q_reg[22] ;
  wire \Q_reg[23] ;
  wire \Q_reg[24] ;
  wire [2:0]\Q_reg[25] ;
  wire \Q_reg[25]_0 ;
  wire \Q_reg[25]_1 ;
  wire \Q_reg[25]_2 ;
  wire [4:0]\Q_reg[4] ;
  wire [4:0]\Q_reg[4]_0 ;
  wire \Q_reg[8] ;
  wire \Q_reg[9] ;
  wire add_overflow_flag;
  wire [3:0]out;

  LUT6 #(
    .INIT(64'hDFFFFFDF10000010)) 
    \Q[0]_i_1 
       (.I0(add_overflow_flag),
        .I1(out[0]),
        .I2(out[3]),
        .I3(out[1]),
        .I4(out[2]),
        .I5(FSM_selector_B[0]),
        .O(\Q[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[0]_i_1__3 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[15]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[16] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[10]_i_1__2 
       (.I0(\Q[15]_i_3_n_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q[15]_i_2_n_0 ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[11]_i_1__2 
       (.I0(\Q[14]_i_3_n_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q[14]_i_2_n_0 ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[12]_i_1__2 
       (.I0(\Q[13]_i_3_n_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q[13]_i_2_n_0 ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[13]_i_1__1 
       (.I0(\Q[13]_i_2_n_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q[13]_i_3_n_0 ),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[13]_i_2 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[2]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[10]),
        .O(\Q[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[13]_i_3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[3]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[11]),
        .O(\Q[13]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[14]_i_1__2 
       (.I0(\Q[14]_i_2_n_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q[14]_i_3_n_0 ),
        .O(D[14]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[14]_i_2 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[1]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[9]),
        .O(\Q[14]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[14]_i_3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[4]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[12]),
        .O(\Q[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[15]_i_1__1 
       (.I0(\Q[15]_i_2_n_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q[15]_i_3_n_0 ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[15]_i_2 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[0]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[8]),
        .O(\Q[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[15]_i_3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[5]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[13]),
        .O(\Q[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[16]_i_3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[6]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[14]),
        .O(\Q_reg[9] ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[17]_i_3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[0]_0 ),
        .I2(Q[7]),
        .I3(\Q_reg[0]_1 ),
        .I4(Q[15]),
        .O(\Q_reg[8] ));
  LUT6 #(
    .INIT(64'hEFFFFFFF20000030)) 
    \Q[1]_i_1 
       (.I0(add_overflow_flag),
        .I1(out[0]),
        .I2(out[3]),
        .I3(out[1]),
        .I4(out[2]),
        .I5(FSM_selector_B[1]),
        .O(\Q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[1]_i_1__1 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[14]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[17] ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Q[22]_i_1__3 
       (.I0(FSM_barrel_shifter_B_S),
        .I1(\Q_reg[25]_0 ),
        .I2(\Q_reg[0]_4 ),
        .I3(\Q_reg[25]_1 ),
        .I4(\Q_reg[0]_3 ),
        .O(\Q_reg[25] [0]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'hEF40)) 
    \Q[24]_i_1__2 
       (.I0(\Q_reg[25]_0 ),
        .I1(\Q_reg[0]_3 ),
        .I2(\Q_reg[25]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .O(\Q_reg[25] [1]));
  LUT4 #(
    .INIT(16'hEF40)) 
    \Q[25]_i_1__2 
       (.I0(\Q_reg[25]_0 ),
        .I1(\Q_reg[0]_2 ),
        .I2(\Q_reg[25]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .O(\Q_reg[25] [2]));
  LUT4 #(
    .INIT(16'h2320)) 
    \Q[25]_i_2__0 
       (.I0(\Q_reg[4] [2]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[4]_0 [2]),
        .O(\Q_reg[25]_0 ));
  LUT4 #(
    .INIT(16'hDCDF)) 
    \Q[25]_i_4 
       (.I0(\Q_reg[4] [1]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[4]_0 [1]),
        .O(\Q_reg[25]_1 ));
  LUT4 #(
    .INIT(16'h2320)) 
    \Q[25]_i_4__0 
       (.I0(\Q_reg[4] [4]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[4]_0 [4]),
        .O(\Q_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h3B38)) 
    \Q[25]_i_5 
       (.I0(\Q_reg[4] [0]),
        .I1(FSM_selector_B[0]),
        .I2(FSM_selector_B[1]),
        .I3(\Q_reg[4]_0 [0]),
        .O(\Q_reg[21] ));
  LUT4 #(
    .INIT(16'hDCDF)) 
    \Q[25]_i_5__0 
       (.I0(\Q_reg[4] [3]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[4]_0 [3]),
        .O(\Q_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[2]_i_1__1 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[13]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[18] ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[3]_i_1__1 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[12]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[19] ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[4]_i_1__2 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[11]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[20] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[5]_i_1__1 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[10]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[21]_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[6]_i_1__2 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[9]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[22] ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hEF40FFFFEF400000)) 
    \Q[7]_i_1__1 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[8]),
        .I2(\Q_reg[0]_1 ),
        .I3(FSM_barrel_shifter_B_S),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q_reg[23] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[8]_i_1__2 
       (.I0(\Q_reg[8] ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[24] ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[9]_i_1__2 
       (.I0(\Q_reg[9] ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[25]_2 ),
        .O(D[9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q[0]_i_1_n_0 ),
        .Q(FSM_selector_B[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q[1]_i_1_n_0 ),
        .Q(FSM_selector_B[1]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized1
   (\Q_reg[0]_0 ,
    \FSM_sequential_state_reg_reg[2] ,
    zero_flag,
    \Q_reg[0]_1 ,
    Q,
    DI,
    \Q_reg[0]_2 ,
    \Q_reg[0]_3 ,
    \Q_reg[0]_4 ,
    \Q_reg[0]_5 ,
    \Q_reg[0]_6 ,
    sign_result,
    D,
    \Q_reg[30]_0 ,
    \Q_reg[3]_0 ,
    \Q_reg[3]_1 ,
    \Q_reg[7]_0 ,
    \Q_reg[11]_0 ,
    \Q_reg[15]_0 ,
    \Q_reg[19]_0 ,
    \Q_reg[23]_0 ,
    \Q_reg[25]_0 ,
    CO,
    \Q_reg[31]_0 ,
    intAS,
    \Q_reg[30]_1 ,
    \Q_reg[22]_0 ,
    E,
    \Q_reg[31]_1 ,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [2:0]\Q_reg[0]_0 ;
  output \FSM_sequential_state_reg_reg[2] ;
  output zero_flag;
  output [3:0]\Q_reg[0]_1 ;
  output [30:0]Q;
  output [3:0]DI;
  output [3:0]\Q_reg[0]_2 ;
  output [3:0]\Q_reg[0]_3 ;
  output [3:0]\Q_reg[0]_4 ;
  output [1:0]\Q_reg[0]_5 ;
  output [3:0]\Q_reg[0]_6 ;
  output sign_result;
  output [30:0]D;
  output [30:0]\Q_reg[30]_0 ;
  output [0:0]\Q_reg[3]_0 ;
  output [2:0]\Q_reg[3]_1 ;
  output [3:0]\Q_reg[7]_0 ;
  output [3:0]\Q_reg[11]_0 ;
  output [3:0]\Q_reg[15]_0 ;
  output [3:0]\Q_reg[19]_0 ;
  output [3:0]\Q_reg[23]_0 ;
  input [24:0]\Q_reg[25]_0 ;
  input [0:0]CO;
  input [31:0]\Q_reg[31]_0 ;
  input intAS;
  input [0:0]\Q_reg[30]_1 ;
  input [22:0]\Q_reg[22]_0 ;
  input [0:0]E;
  input [31:0]\Q_reg[31]_1 ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [0:0]CO;
  wire [30:0]D;
  wire [3:0]DI;
  wire [0:0]E;
  wire \FSM_sequential_state_reg_reg[2] ;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [30:0]Q;
  wire [2:0]\^Q_reg[0]_0 ;
  wire [3:0]\Q_reg[0]_1 ;
  wire [3:0]\Q_reg[0]_2 ;
  wire [3:0]\Q_reg[0]_3 ;
  wire [3:0]\Q_reg[0]_4 ;
  wire [1:0]\Q_reg[0]_5 ;
  wire [3:0]\Q_reg[0]_6 ;
  wire [3:0]\Q_reg[11]_0 ;
  wire [3:0]\Q_reg[15]_0 ;
  wire [3:0]\Q_reg[19]_0 ;
  wire [22:0]\Q_reg[22]_0 ;
  wire [3:0]\Q_reg[23]_0 ;
  wire [24:0]\Q_reg[25]_0 ;
  wire [30:0]\Q_reg[30]_0 ;
  wire [0:0]\Q_reg[30]_1 ;
  wire [31:0]\Q_reg[31]_0 ;
  wire [31:0]\Q_reg[31]_1 ;
  wire [0:0]\Q_reg[3]_0 ;
  wire [2:0]\Q_reg[3]_1 ;
  wire [3:0]\Q_reg[7]_0 ;
  wire intAS;
  wire [31:31]intDX;
  wire sign_result;
  wire zero_flag;

  assign \Q_reg[0]_0 [2] = \FSM_sequential_state_reg_reg[2] ;
  assign \Q_reg[0]_0 [1:0] = \^Q_reg[0]_0 [1:0];
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_sequential_state_reg[3]_i_5 
       (.I0(CO),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .O(zero_flag));
  LUT5 #(
    .INIT(32'hCCCC0DD0)) 
    \Q[0]_i_1__5 
       (.I0(CO),
        .I1(intDX),
        .I2(\Q_reg[31]_0 [31]),
        .I3(intAS),
        .I4(\Q_reg[30]_1 ),
        .O(sign_result));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[0]_i_1__8 
       (.I0(Q[0]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[0]_i_1__9 
       (.I0(\Q_reg[31]_0 [0]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[0]),
        .O(\Q_reg[30]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[10]_i_1__5 
       (.I0(Q[10]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[10]_i_1__6 
       (.I0(\Q_reg[31]_0 [10]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[10]),
        .O(\Q_reg[30]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[11]_i_1__5 
       (.I0(Q[11]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[11]_i_1__6 
       (.I0(\Q_reg[31]_0 [11]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[11]),
        .O(\Q_reg[30]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[12]_i_1__5 
       (.I0(Q[12]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[12]_i_1__6 
       (.I0(\Q_reg[31]_0 [12]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[12]),
        .O(\Q_reg[30]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[13]_i_1__4 
       (.I0(Q[13]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [13]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[13]_i_1__5 
       (.I0(\Q_reg[31]_0 [13]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[13]),
        .O(\Q_reg[30]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[14]_i_1__5 
       (.I0(Q[14]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [14]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[14]_i_1__6 
       (.I0(\Q_reg[31]_0 [14]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[14]),
        .O(\Q_reg[30]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[15]_i_1__4 
       (.I0(Q[15]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [15]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[15]_i_1__5 
       (.I0(\Q_reg[31]_0 [15]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[15]),
        .O(\Q_reg[30]_0 [15]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[16]_i_1__4 
       (.I0(Q[16]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [16]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[16]_i_1__5 
       (.I0(\Q_reg[31]_0 [16]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[16]),
        .O(\Q_reg[30]_0 [16]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[17]_i_1__4 
       (.I0(Q[17]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [17]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[17]_i_1__5 
       (.I0(\Q_reg[31]_0 [17]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[17]),
        .O(\Q_reg[30]_0 [17]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[18]_i_1__4 
       (.I0(Q[18]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [18]),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[18]_i_1__5 
       (.I0(\Q_reg[31]_0 [18]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[18]),
        .O(\Q_reg[30]_0 [18]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[19]_i_1__4 
       (.I0(Q[19]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [19]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[19]_i_1__5 
       (.I0(\Q_reg[31]_0 [19]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[19]),
        .O(\Q_reg[30]_0 [19]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[1]_i_1__5 
       (.I0(Q[1]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[1]_i_1__6 
       (.I0(\Q_reg[31]_0 [1]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[1]),
        .O(\Q_reg[30]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[20]_i_1__4 
       (.I0(Q[20]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [20]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[20]_i_1__5 
       (.I0(\Q_reg[31]_0 [20]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[20]),
        .O(\Q_reg[30]_0 [20]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[21]_i_1__5 
       (.I0(Q[21]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [21]),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[21]_i_1__6 
       (.I0(\Q_reg[31]_0 [21]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[21]),
        .O(\Q_reg[30]_0 [21]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[22]_i_1__5 
       (.I0(Q[22]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [22]),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[22]_i_1__6 
       (.I0(\Q_reg[31]_0 [22]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[22]),
        .O(\Q_reg[30]_0 [22]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[23]_i_1__4 
       (.I0(Q[23]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [23]),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[23]_i_1__5 
       (.I0(\Q_reg[31]_0 [23]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[23]),
        .O(\Q_reg[30]_0 [23]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[24]_i_1__5 
       (.I0(Q[24]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [24]),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[24]_i_1__6 
       (.I0(\Q_reg[31]_0 [24]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[24]),
        .O(\Q_reg[30]_0 [24]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[25]_i_1__5 
       (.I0(Q[25]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [25]),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[25]_i_1__6 
       (.I0(\Q_reg[31]_0 [25]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[25]),
        .O(\Q_reg[30]_0 [25]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[26]_i_1__3 
       (.I0(Q[26]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [26]),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[26]_i_1__4 
       (.I0(\Q_reg[31]_0 [26]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[26]),
        .O(\Q_reg[30]_0 [26]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[27]_i_1__2 
       (.I0(Q[27]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [27]),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[27]_i_1__3 
       (.I0(\Q_reg[31]_0 [27]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[27]),
        .O(\Q_reg[30]_0 [27]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[28]_i_1__2 
       (.I0(Q[28]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [28]),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[28]_i_1__3 
       (.I0(\Q_reg[31]_0 [28]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[28]),
        .O(\Q_reg[30]_0 [28]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[29]_i_1__2 
       (.I0(Q[29]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [29]),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[29]_i_1__3 
       (.I0(\Q_reg[31]_0 [29]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[29]),
        .O(\Q_reg[30]_0 [29]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[2]_i_1__5 
       (.I0(Q[2]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[2]_i_1__6 
       (.I0(\Q_reg[31]_0 [2]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[2]),
        .O(\Q_reg[30]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[30]_i_1__3 
       (.I0(\Q_reg[31]_0 [30]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[30]),
        .O(\Q_reg[30]_0 [30]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[30]_i_2__0 
       (.I0(Q[30]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [30]),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[3]_i_1__5 
       (.I0(Q[3]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[3]_i_1__6 
       (.I0(\Q_reg[31]_0 [3]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[3]),
        .O(\Q_reg[30]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[4]_i_1__6 
       (.I0(Q[4]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[4]_i_1__7 
       (.I0(\Q_reg[31]_0 [4]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[4]),
        .O(\Q_reg[30]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[5]_i_1__4 
       (.I0(Q[5]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[5]_i_1__5 
       (.I0(\Q_reg[31]_0 [5]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[5]),
        .O(\Q_reg[30]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[6]_i_1__5 
       (.I0(Q[6]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[6]_i_1__6 
       (.I0(\Q_reg[31]_0 [6]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[6]),
        .O(\Q_reg[30]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[7]_i_1__4 
       (.I0(Q[7]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[7]_i_1__5 
       (.I0(\Q_reg[31]_0 [7]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[7]),
        .O(\Q_reg[30]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[8]_i_1__5 
       (.I0(Q[8]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [8]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[8]_i_1__6 
       (.I0(\Q_reg[31]_0 [8]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[8]),
        .O(\Q_reg[30]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[9]_i_1__5 
       (.I0(Q[9]),
        .I1(\Q_reg[30]_1 ),
        .I2(\Q_reg[31]_0 [9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[9]_i_1__6 
       (.I0(\Q_reg[31]_0 [9]),
        .I1(\Q_reg[30]_1 ),
        .I2(Q[9]),
        .O(\Q_reg[30]_0 [9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [31]),
        .Q(intDX));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[31]_1 [9]),
        .Q(Q[9]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__0_i_1
       (.I0(\Q_reg[25]_0 [6]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [5]),
        .O(\Q_reg[7]_0 [3]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__0_i_2
       (.I0(\Q_reg[25]_0 [5]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [4]),
        .O(\Q_reg[7]_0 [2]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__0_i_3
       (.I0(\Q_reg[25]_0 [4]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [3]),
        .O(\Q_reg[7]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__0_i_4
       (.I0(\Q_reg[25]_0 [3]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [2]),
        .O(\Q_reg[7]_0 [0]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__1_i_1
       (.I0(\Q_reg[25]_0 [10]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [9]),
        .O(\Q_reg[11]_0 [3]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__1_i_2
       (.I0(\Q_reg[25]_0 [9]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [8]),
        .O(\Q_reg[11]_0 [2]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__1_i_3
       (.I0(\Q_reg[25]_0 [8]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [7]),
        .O(\Q_reg[11]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__1_i_4
       (.I0(\Q_reg[25]_0 [7]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [6]),
        .O(\Q_reg[11]_0 [0]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__2_i_1
       (.I0(\Q_reg[25]_0 [14]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [13]),
        .O(\Q_reg[15]_0 [3]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__2_i_2
       (.I0(\Q_reg[25]_0 [13]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [12]),
        .O(\Q_reg[15]_0 [2]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__2_i_3
       (.I0(\Q_reg[25]_0 [12]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [11]),
        .O(\Q_reg[15]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__2_i_4
       (.I0(\Q_reg[25]_0 [11]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [10]),
        .O(\Q_reg[15]_0 [0]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__3_i_1
       (.I0(\Q_reg[25]_0 [18]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [17]),
        .O(\Q_reg[19]_0 [3]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__3_i_2
       (.I0(\Q_reg[25]_0 [17]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [16]),
        .O(\Q_reg[19]_0 [2]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__3_i_3
       (.I0(\Q_reg[25]_0 [16]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [15]),
        .O(\Q_reg[19]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__3_i_4
       (.I0(\Q_reg[25]_0 [15]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [14]),
        .O(\Q_reg[19]_0 [0]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__4_i_1
       (.I0(\Q_reg[25]_0 [22]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [21]),
        .O(\Q_reg[23]_0 [3]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__4_i_2
       (.I0(\Q_reg[25]_0 [21]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [20]),
        .O(\Q_reg[23]_0 [2]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__4_i_3
       (.I0(\Q_reg[25]_0 [20]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [19]),
        .O(\Q_reg[23]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__4_i_4
       (.I0(\Q_reg[25]_0 [19]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [18]),
        .O(\Q_reg[23]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    _inferred__0_carry__5_i_2
       (.I0(\FSM_sequential_state_reg_reg[2] ),
        .I1(\Q_reg[25]_0 [24]),
        .O(\^Q_reg[0]_0 [1]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry__5_i_3
       (.I0(\Q_reg[25]_0 [23]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [22]),
        .O(\^Q_reg[0]_0 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    _inferred__0_carry_i_1
       (.I0(\FSM_sequential_state_reg_reg[2] ),
        .I1(\Q_reg[25]_0 [0]),
        .O(\Q_reg[3]_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry_i_2
       (.I0(intDX),
        .I1(intAS),
        .I2(\Q_reg[31]_0 [31]),
        .O(\FSM_sequential_state_reg_reg[2] ));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry_i_3
       (.I0(\Q_reg[25]_0 [2]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [1]),
        .O(\Q_reg[3]_1 [2]));
  LUT3 #(
    .INIT(8'h96)) 
    _inferred__0_carry_i_4
       (.I0(\Q_reg[25]_0 [1]),
        .I1(\FSM_sequential_state_reg_reg[2] ),
        .I2(\Q_reg[22]_0 [0]),
        .O(\Q_reg[3]_1 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    _inferred__0_carry_i_5
       (.I0(\FSM_sequential_state_reg_reg[2] ),
        .I1(\Q_reg[25]_0 [0]),
        .O(\Q_reg[3]_1 [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry__0_i_1
       (.I0(Q[22]),
        .I1(\Q_reg[31]_0 [22]),
        .I2(Q[23]),
        .I3(\Q_reg[31]_0 [23]),
        .I4(\Q_reg[31]_0 [21]),
        .I5(Q[21]),
        .O(\Q_reg[0]_3 [3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry__0_i_2
       (.I0(Q[18]),
        .I1(\Q_reg[31]_0 [18]),
        .I2(Q[19]),
        .I3(\Q_reg[31]_0 [19]),
        .I4(\Q_reg[31]_0 [20]),
        .I5(Q[20]),
        .O(\Q_reg[0]_3 [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry__0_i_3
       (.I0(Q[16]),
        .I1(\Q_reg[31]_0 [16]),
        .I2(Q[17]),
        .I3(\Q_reg[31]_0 [17]),
        .I4(\Q_reg[31]_0 [15]),
        .I5(Q[15]),
        .O(\Q_reg[0]_3 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry__0_i_4
       (.I0(Q[12]),
        .I1(\Q_reg[31]_0 [12]),
        .I2(Q[13]),
        .I3(\Q_reg[31]_0 [13]),
        .I4(\Q_reg[31]_0 [14]),
        .I5(Q[14]),
        .O(\Q_reg[0]_3 [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry__1_i_2
       (.I0(Q[28]),
        .I1(\Q_reg[31]_0 [28]),
        .I2(Q[29]),
        .I3(\Q_reg[31]_0 [29]),
        .I4(\Q_reg[31]_0 [27]),
        .I5(Q[27]),
        .O(\Q_reg[0]_5 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry__1_i_3
       (.I0(Q[24]),
        .I1(\Q_reg[31]_0 [24]),
        .I2(Q[25]),
        .I3(\Q_reg[31]_0 [25]),
        .I4(\Q_reg[31]_0 [26]),
        .I5(Q[26]),
        .O(\Q_reg[0]_5 [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry_i_1
       (.I0(Q[10]),
        .I1(\Q_reg[31]_0 [10]),
        .I2(Q[11]),
        .I3(\Q_reg[31]_0 [11]),
        .I4(\Q_reg[31]_0 [9]),
        .I5(Q[9]),
        .O(\Q_reg[0]_1 [3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry_i_2
       (.I0(Q[6]),
        .I1(\Q_reg[31]_0 [6]),
        .I2(Q[7]),
        .I3(\Q_reg[31]_0 [7]),
        .I4(\Q_reg[31]_0 [8]),
        .I5(Q[8]),
        .O(\Q_reg[0]_1 [2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry_i_3
       (.I0(Q[4]),
        .I1(\Q_reg[31]_0 [4]),
        .I2(Q[5]),
        .I3(\Q_reg[31]_0 [5]),
        .I4(\Q_reg[31]_0 [3]),
        .I5(Q[3]),
        .O(\Q_reg[0]_1 [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    eqXY_o_carry_i_4
       (.I0(Q[0]),
        .I1(\Q_reg[31]_0 [0]),
        .I2(Q[1]),
        .I3(\Q_reg[31]_0 [1]),
        .I4(\Q_reg[31]_0 [2]),
        .I5(Q[2]),
        .O(\Q_reg[0]_1 [0]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__0_i_1
       (.I0(Q[15]),
        .I1(\Q_reg[31]_0 [15]),
        .I2(Q[14]),
        .I3(\Q_reg[31]_0 [14]),
        .O(\Q_reg[0]_2 [3]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__0_i_2
       (.I0(Q[13]),
        .I1(\Q_reg[31]_0 [13]),
        .I2(Q[12]),
        .I3(\Q_reg[31]_0 [12]),
        .O(\Q_reg[0]_2 [2]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__0_i_3
       (.I0(Q[11]),
        .I1(\Q_reg[31]_0 [11]),
        .I2(Q[10]),
        .I3(\Q_reg[31]_0 [10]),
        .O(\Q_reg[0]_2 [1]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__0_i_4
       (.I0(Q[9]),
        .I1(\Q_reg[31]_0 [9]),
        .I2(Q[8]),
        .I3(\Q_reg[31]_0 [8]),
        .O(\Q_reg[0]_2 [0]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__1_i_1
       (.I0(Q[23]),
        .I1(\Q_reg[31]_0 [23]),
        .I2(Q[22]),
        .I3(\Q_reg[31]_0 [22]),
        .O(\Q_reg[0]_4 [3]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__1_i_2
       (.I0(Q[21]),
        .I1(\Q_reg[31]_0 [21]),
        .I2(Q[20]),
        .I3(\Q_reg[31]_0 [20]),
        .O(\Q_reg[0]_4 [2]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__1_i_3
       (.I0(Q[19]),
        .I1(\Q_reg[31]_0 [19]),
        .I2(Q[18]),
        .I3(\Q_reg[31]_0 [18]),
        .O(\Q_reg[0]_4 [1]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__1_i_4
       (.I0(Q[17]),
        .I1(\Q_reg[31]_0 [17]),
        .I2(Q[16]),
        .I3(\Q_reg[31]_0 [16]),
        .O(\Q_reg[0]_4 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    gtXY_o_carry__2_i_1
       (.I0(Q[30]),
        .I1(\Q_reg[31]_0 [30]),
        .O(\Q_reg[0]_6 [3]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__2_i_2
       (.I0(Q[29]),
        .I1(\Q_reg[31]_0 [29]),
        .I2(Q[28]),
        .I3(\Q_reg[31]_0 [28]),
        .O(\Q_reg[0]_6 [2]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__2_i_3
       (.I0(Q[27]),
        .I1(\Q_reg[31]_0 [27]),
        .I2(Q[26]),
        .I3(\Q_reg[31]_0 [26]),
        .O(\Q_reg[0]_6 [1]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry__2_i_4
       (.I0(Q[25]),
        .I1(\Q_reg[31]_0 [25]),
        .I2(Q[24]),
        .I3(\Q_reg[31]_0 [24]),
        .O(\Q_reg[0]_6 [0]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry_i_1
       (.I0(Q[7]),
        .I1(\Q_reg[31]_0 [7]),
        .I2(Q[6]),
        .I3(\Q_reg[31]_0 [6]),
        .O(DI[3]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry_i_2
       (.I0(Q[5]),
        .I1(\Q_reg[31]_0 [5]),
        .I2(Q[4]),
        .I3(\Q_reg[31]_0 [4]),
        .O(DI[2]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry_i_3
       (.I0(Q[3]),
        .I1(\Q_reg[31]_0 [3]),
        .I2(Q[2]),
        .I3(\Q_reg[31]_0 [2]),
        .O(DI[1]));
  LUT4 #(
    .INIT(16'h22B2)) 
    gtXY_o_carry_i_4
       (.I0(Q[1]),
        .I1(\Q_reg[31]_0 [1]),
        .I2(Q[0]),
        .I3(\Q_reg[31]_0 [0]),
        .O(DI[0]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized10
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized2
   (\Q_reg[0]_0 ,
    Q,
    \Q_reg[0]_1 ,
    S,
    \Q_reg[0]_2 ,
    \Q_reg[0]_3 ,
    \Q_reg[30]_0 ,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [0:0]\Q_reg[0]_0 ;
  output [31:0]Q;
  output [3:0]\Q_reg[0]_1 ;
  output [3:0]S;
  output [3:0]\Q_reg[0]_2 ;
  output [3:0]\Q_reg[0]_3 ;
  input [30:0]\Q_reg[30]_0 ;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [31:0]Q;
  wire [0:0]\Q_reg[0]_0 ;
  wire [3:0]\Q_reg[0]_1 ;
  wire [3:0]\Q_reg[0]_2 ;
  wire [3:0]\Q_reg[0]_3 ;
  wire [30:0]\Q_reg[30]_0 ;
  wire [3:0]S;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[9]),
        .Q(Q[9]));
  LUT2 #(
    .INIT(4'h9)) 
    eqXY_o_carry__1_i_1
       (.I0(Q[30]),
        .I1(\Q_reg[30]_0 [30]),
        .O(\Q_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__0_i_5
       (.I0(Q[15]),
        .I1(\Q_reg[30]_0 [15]),
        .I2(Q[14]),
        .I3(\Q_reg[30]_0 [14]),
        .O(\Q_reg[0]_2 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__0_i_6
       (.I0(Q[13]),
        .I1(\Q_reg[30]_0 [13]),
        .I2(Q[12]),
        .I3(\Q_reg[30]_0 [12]),
        .O(\Q_reg[0]_2 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__0_i_7
       (.I0(Q[11]),
        .I1(\Q_reg[30]_0 [11]),
        .I2(Q[10]),
        .I3(\Q_reg[30]_0 [10]),
        .O(\Q_reg[0]_2 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__0_i_8
       (.I0(Q[9]),
        .I1(\Q_reg[30]_0 [9]),
        .I2(Q[8]),
        .I3(\Q_reg[30]_0 [8]),
        .O(\Q_reg[0]_2 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__1_i_5
       (.I0(Q[23]),
        .I1(\Q_reg[30]_0 [23]),
        .I2(Q[22]),
        .I3(\Q_reg[30]_0 [22]),
        .O(\Q_reg[0]_3 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__1_i_6
       (.I0(Q[21]),
        .I1(\Q_reg[30]_0 [21]),
        .I2(Q[20]),
        .I3(\Q_reg[30]_0 [20]),
        .O(\Q_reg[0]_3 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__1_i_7
       (.I0(Q[19]),
        .I1(\Q_reg[30]_0 [19]),
        .I2(Q[18]),
        .I3(\Q_reg[30]_0 [18]),
        .O(\Q_reg[0]_3 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__1_i_8
       (.I0(Q[17]),
        .I1(\Q_reg[30]_0 [17]),
        .I2(Q[16]),
        .I3(\Q_reg[30]_0 [16]),
        .O(\Q_reg[0]_3 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    gtXY_o_carry__2_i_5
       (.I0(Q[30]),
        .I1(\Q_reg[30]_0 [30]),
        .O(\Q_reg[0]_1 [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__2_i_6
       (.I0(Q[29]),
        .I1(\Q_reg[30]_0 [29]),
        .I2(Q[28]),
        .I3(\Q_reg[30]_0 [28]),
        .O(\Q_reg[0]_1 [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__2_i_7
       (.I0(Q[27]),
        .I1(\Q_reg[30]_0 [27]),
        .I2(Q[26]),
        .I3(\Q_reg[30]_0 [26]),
        .O(\Q_reg[0]_1 [1]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry__2_i_8
       (.I0(Q[25]),
        .I1(\Q_reg[30]_0 [25]),
        .I2(Q[24]),
        .I3(\Q_reg[30]_0 [24]),
        .O(\Q_reg[0]_1 [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry_i_5
       (.I0(Q[7]),
        .I1(\Q_reg[30]_0 [7]),
        .I2(Q[6]),
        .I3(\Q_reg[30]_0 [6]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry_i_6
       (.I0(Q[5]),
        .I1(\Q_reg[30]_0 [5]),
        .I2(Q[4]),
        .I3(\Q_reg[30]_0 [4]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry_i_7
       (.I0(Q[3]),
        .I1(\Q_reg[30]_0 [3]),
        .I2(Q[2]),
        .I3(\Q_reg[30]_0 [2]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    gtXY_o_carry_i_8
       (.I0(Q[1]),
        .I1(\Q_reg[30]_0 [1]),
        .I2(Q[0]),
        .I3(\Q_reg[30]_0 [0]),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized3
   (\Q_reg[7]_0 ,
    Q,
    O,
    FSM_exp_operation_A_S,
    S,
    \Q_reg[30]_0 ,
    \Q_reg[0]_0 ,
    \FSM_sequential_state_reg_reg[3] ,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[3]_0 );
  output [7:0]\Q_reg[7]_0 ;
  output [29:0]Q;
  output [0:0]O;
  input FSM_exp_operation_A_S;
  input [3:0]S;
  input [3:0]\Q_reg[30]_0 ;
  input [0:0]\Q_reg[0]_0 ;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;
  input [30:0]D;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3]_0 ;

  wire CLK;
  wire [30:0]D;
  wire FSM_exp_operation_A_S;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [0:0]\FSM_sequential_state_reg_reg[3]_0 ;
  wire [0:0]O;
  wire [29:0]Q;
  wire [0:0]\Q_reg[0]_0 ;
  wire [3:0]\Q_reg[30]_0 ;
  wire \Q_reg[3]_i_1_n_0 ;
  wire \Q_reg[3]_i_1_n_1 ;
  wire \Q_reg[3]_i_1_n_2 ;
  wire \Q_reg[3]_i_1_n_3 ;
  wire [7:0]\Q_reg[7]_0 ;
  wire \Q_reg[7]_i_1_n_0 ;
  wire \Q_reg[7]_i_1_n_1 ;
  wire \Q_reg[7]_i_1_n_2 ;
  wire \Q_reg[7]_i_1_n_3 ;
  wire \Q_reg_n_0_[23] ;
  wire [3:0]S;
  wire [3:0]\NLW_Q_reg[0]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_Q_reg[0]_i_2_O_UNCONNECTED ;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[0]),
        .Q(Q[0]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \Q_reg[0]_i_2 
       (.CI(\Q_reg[7]_i_1_n_0 ),
        .CO(\NLW_Q_reg[0]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_Q_reg[0]_i_2_O_UNCONNECTED [3:1],O}),
        .S({1'b0,1'b0,1'b0,\Q_reg[0]_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[23]),
        .Q(\Q_reg_n_0_[23] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[24]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[25]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[26]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[27]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[28]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[29]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[30]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[3]),
        .Q(Q[3]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \Q_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\Q_reg[3]_i_1_n_0 ,\Q_reg[3]_i_1_n_1 ,\Q_reg[3]_i_1_n_2 ,\Q_reg[3]_i_1_n_3 }),
        .CYINIT(\Q_reg_n_0_[23] ),
        .DI({Q[25:23],FSM_exp_operation_A_S}),
        .O(\Q_reg[7]_0 [3:0]),
        .S(S));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[7]),
        .Q(Q[7]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \Q_reg[7]_i_1 
       (.CI(\Q_reg[3]_i_1_n_0 ),
        .CO({\Q_reg[7]_i_1_n_0 ,\Q_reg[7]_i_1_n_1 ,\Q_reg[7]_i_1_n_2 ,\Q_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(Q[29:26]),
        .O(\Q_reg[7]_0 [7:4]),
        .S(\Q_reg[30]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized4
   (\Q_reg[7]_0 ,
    \FSM_sequential_state_reg_reg[3] ,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[3]_0 );
  output [30:0]\Q_reg[7]_0 ;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;
  input [30:0]D;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3]_0 ;

  wire CLK;
  wire [30:0]D;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [0:0]\FSM_sequential_state_reg_reg[3]_0 ;
  wire [30:0]\Q_reg[7]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[0]),
        .Q(\Q_reg[7]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[10]),
        .Q(\Q_reg[7]_0 [10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[11]),
        .Q(\Q_reg[7]_0 [11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[12]),
        .Q(\Q_reg[7]_0 [12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[13]),
        .Q(\Q_reg[7]_0 [13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[14]),
        .Q(\Q_reg[7]_0 [14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[15]),
        .Q(\Q_reg[7]_0 [15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[16]),
        .Q(\Q_reg[7]_0 [16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[17]),
        .Q(\Q_reg[7]_0 [17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[18]),
        .Q(\Q_reg[7]_0 [18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[19]),
        .Q(\Q_reg[7]_0 [19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[1]),
        .Q(\Q_reg[7]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[20]),
        .Q(\Q_reg[7]_0 [20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[21]),
        .Q(\Q_reg[7]_0 [21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[22]),
        .Q(\Q_reg[7]_0 [22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[23]),
        .Q(\Q_reg[7]_0 [23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[24]),
        .Q(\Q_reg[7]_0 [24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[25]),
        .Q(\Q_reg[7]_0 [25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[26]),
        .Q(\Q_reg[7]_0 [26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[27]),
        .Q(\Q_reg[7]_0 [27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[28]),
        .Q(\Q_reg[7]_0 [28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[29]),
        .Q(\Q_reg[7]_0 [29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[2]),
        .Q(\Q_reg[7]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[30]),
        .Q(\Q_reg[7]_0 [30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[3]),
        .Q(\Q_reg[7]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[4]),
        .Q(\Q_reg[7]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[5]),
        .Q(\Q_reg[7]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[6]),
        .Q(\Q_reg[7]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[7]),
        .Q(\Q_reg[7]_0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[8]),
        .Q(\Q_reg[7]_0 [8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[3] ),
        .CLR(\FSM_sequential_state_reg_reg[3]_0 ),
        .D(D[9]),
        .Q(\Q_reg[7]_0 [9]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized5
   (D,
    Q,
    \Q_reg[0]_0 ,
    \Q_reg[0]_1 ,
    E,
    \Q_reg[30] ,
    CLK,
    AR);
  output [7:0]D;
  output [4:0]Q;
  input \Q_reg[0]_0 ;
  input \Q_reg[0]_1 ;
  input [0:0]E;
  input [7:0]\Q_reg[30] ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [7:0]D;
  wire [0:0]E;
  wire [4:0]Q;
  wire \Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire [7:0]\Q_reg[30] ;
  wire \Q_reg_n_0_[5] ;
  wire \Q_reg_n_0_[6] ;
  wire \Q_reg_n_0_[7] ;

  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[23]_i_1__3 
       (.I0(Q[0]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[24]_i_1__4 
       (.I0(Q[1]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[25]_i_1__4 
       (.I0(Q[2]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[26]_i_1__2 
       (.I0(Q[3]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[27]_i_1__1 
       (.I0(Q[4]),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[28]_i_1__1 
       (.I0(\Q_reg_n_0_[5] ),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[29]_i_1__1 
       (.I0(\Q_reg_n_0_[6] ),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Q[30]_i_1__2 
       (.I0(\Q_reg_n_0_[7] ),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[0]_1 ),
        .O(D[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [5]),
        .Q(\Q_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [6]),
        .Q(\Q_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[30] [7]),
        .Q(\Q_reg_n_0_[7] ));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized6
   (D,
    \Q_reg[16]_0 ,
    Q,
    \Q_reg[25]_0 ,
    \Q_reg[17]_0 ,
    \Q_reg[24]_0 ,
    \Q_reg[18]_0 ,
    \Q_reg[23]_0 ,
    \Q_reg[19]_0 ,
    \Q_reg[22]_0 ,
    \Q_reg[20]_0 ,
    \Q_reg[21]_0 ,
    FSM_barrel_shifter_L_R,
    \Q_reg[16]_1 ,
    FSM_barrel_shifter_B_S,
    \Q_reg[4]_0 ,
    \Q_reg[3]_0 ,
    \Q_reg[17]_1 ,
    \Q_reg[2]_0 ,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [9:0]D;
  output \Q_reg[16]_0 ;
  output [15:0]Q;
  output \Q_reg[25]_0 ;
  output \Q_reg[17]_0 ;
  output \Q_reg[24]_0 ;
  output \Q_reg[18]_0 ;
  output \Q_reg[23]_0 ;
  output \Q_reg[19]_0 ;
  output \Q_reg[22]_0 ;
  output \Q_reg[20]_0 ;
  output \Q_reg[21]_0 ;
  input FSM_barrel_shifter_L_R;
  input \Q_reg[16]_1 ;
  input FSM_barrel_shifter_B_S;
  input \Q_reg[4]_0 ;
  input \Q_reg[3]_0 ;
  input \Q_reg[17]_1 ;
  input [25:0]\Q_reg[2]_0 ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [9:0]D;
  wire [9:0]\Data_array[4]_0 ;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [15:0]Q;
  wire \Q_reg[16]_0 ;
  wire \Q_reg[16]_1 ;
  wire \Q_reg[17]_0 ;
  wire \Q_reg[17]_1 ;
  wire \Q_reg[18]_0 ;
  wire \Q_reg[19]_0 ;
  wire \Q_reg[20]_0 ;
  wire \Q_reg[21]_0 ;
  wire \Q_reg[22]_0 ;
  wire \Q_reg[23]_0 ;
  wire \Q_reg[24]_0 ;
  wire \Q_reg[25]_0 ;
  wire [25:0]\Q_reg[2]_0 ;
  wire \Q_reg[3]_0 ;
  wire \Q_reg[4]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[16]_i_1__1 
       (.I0(\Q_reg[16]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[16]_1 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[16]_i_2 
       (.I0(Q[15]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [9]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[7]),
        .O(\Q_reg[16]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[17]_i_1__1 
       (.I0(\Q_reg[17]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[17]_1 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[17]_i_2 
       (.I0(Q[14]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [8]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[6]),
        .O(\Q_reg[17]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[18]_i_1__1 
       (.I0(\Q_reg[18]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[8]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[18]_i_2 
       (.I0(Q[13]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [7]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[5]),
        .O(\Q_reg[18]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[19]_i_1__1 
       (.I0(\Q_reg[19]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[9]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[19]_i_2 
       (.I0(Q[12]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [6]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[4]),
        .O(\Q_reg[19]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[20]_i_1__2 
       (.I0(\Q_reg[20]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[10]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[20]_i_2 
       (.I0(Q[11]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [5]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[3]),
        .O(\Q_reg[20]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[21]_i_1__3 
       (.I0(\Q_reg[21]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[11]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[21]_i_2 
       (.I0(Q[10]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [4]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[2]),
        .O(\Q_reg[21]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[22]_i_1__2 
       (.I0(\Q_reg[22]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[12]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[22]_i_2 
       (.I0(Q[9]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [3]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[1]),
        .O(\Q_reg[22]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[23]_i_1__1 
       (.I0(\Q_reg[23]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[13]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[23]_i_2 
       (.I0(Q[8]),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [2]),
        .I4(\Q_reg[3]_0 ),
        .I5(Q[0]),
        .O(\Q_reg[23]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[24]_i_1__3 
       (.I0(\Q_reg[24]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[14]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[24]_i_3__0 
       (.I0(Q[7]),
        .I1(Q[15]),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [1]),
        .I4(\Q_reg[3]_0 ),
        .I5(\Data_array[4]_0 [9]),
        .O(\Q_reg[24]_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBBB8B888888)) 
    \Q[25]_i_1__3 
       (.I0(\Q_reg[25]_0 ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg[4]_0 ),
        .I3(Q[15]),
        .I4(\Q_reg[3]_0 ),
        .I5(FSM_barrel_shifter_B_S),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[25]_i_3__0 
       (.I0(Q[6]),
        .I1(Q[14]),
        .I2(\Q_reg[4]_0 ),
        .I3(\Data_array[4]_0 [0]),
        .I4(\Q_reg[3]_0 ),
        .I5(\Data_array[4]_0 [8]),
        .O(\Q_reg[25]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [0]),
        .Q(\Data_array[4]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [10]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [11]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [12]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [13]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [14]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [15]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [16]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [17]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [18]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [19]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [1]),
        .Q(\Data_array[4]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [20]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [21]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [22]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [23]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [24]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [25]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [2]),
        .Q(\Data_array[4]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [3]),
        .Q(\Data_array[4]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [4]),
        .Q(\Data_array[4]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [5]),
        .Q(\Data_array[4]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [6]),
        .Q(\Data_array[4]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [7]),
        .Q(\Data_array[4]_0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [8]),
        .Q(\Data_array[4]_0 [8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(\Q_reg[2]_0 [9]),
        .Q(\Data_array[4]_0 [9]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized7
   (S,
    \Q_reg[0]_0 ,
    E,
    D,
    CLK,
    AR);
  output [0:0]S;
  output [25:0]\Q_reg[0]_0 ;
  input [0:0]E;
  input [25:0]D;
  input CLK;
  input [2:0]AR;

  wire [2:0]AR;
  wire CLK;
  wire [25:0]D;
  wire [0:0]E;
  wire [25:0]\Q_reg[0]_0 ;

  assign S[0] = \Q_reg[0]_0 [0];
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[0]),
        .Q(\Q_reg[0]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[10]),
        .Q(\Q_reg[0]_0 [10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[11]),
        .Q(\Q_reg[0]_0 [11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[12]),
        .Q(\Q_reg[0]_0 [12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[13]),
        .Q(\Q_reg[0]_0 [13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[14]),
        .Q(\Q_reg[0]_0 [14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[15]),
        .Q(\Q_reg[0]_0 [15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[16]),
        .Q(\Q_reg[0]_0 [16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[17]),
        .Q(\Q_reg[0]_0 [17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[18]),
        .Q(\Q_reg[0]_0 [18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[19]),
        .Q(\Q_reg[0]_0 [19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[1]),
        .Q(\Q_reg[0]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[20]),
        .Q(\Q_reg[0]_0 [20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[21]),
        .Q(\Q_reg[0]_0 [21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[22]),
        .Q(\Q_reg[0]_0 [22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[23]),
        .Q(\Q_reg[0]_0 [23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[24]),
        .Q(\Q_reg[0]_0 [24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[2]),
        .D(D[25]),
        .Q(\Q_reg[0]_0 [25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[2]),
        .Q(\Q_reg[0]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[3]),
        .Q(\Q_reg[0]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[4]),
        .Q(\Q_reg[0]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[5]),
        .Q(\Q_reg[0]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[6]),
        .Q(\Q_reg[0]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[7]),
        .Q(\Q_reg[0]_0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[8]),
        .Q(\Q_reg[0]_0 [8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[9]),
        .Q(\Q_reg[0]_0 [9]));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized8
   (D,
    \Q_reg[18]_0 ,
    \Q_reg[16]_0 ,
    \Q_reg[17]_0 ,
    \Q_reg[15]_0 ,
    Q,
    \Q_reg[4]_0 ,
    FSM_barrel_shifter_B_S,
    \Q_reg[2]_0 ,
    \Q_reg[1]_0 ,
    \Q_reg[0]_0 ,
    \Q_reg[0]_1 ,
    FSM_selector_B,
    \Q_reg[0]_2 ,
    \Q_reg[0]_3 ,
    FSM_selector_C,
    \Q_reg[22]_0 ,
    FSM_barrel_shifter_L_R,
    E,
    \Q_reg[22]_1 ,
    CLK,
    AR);
  output [20:0]D;
  output \Q_reg[18]_0 ;
  output \Q_reg[16]_0 ;
  output \Q_reg[17]_0 ;
  output \Q_reg[15]_0 ;
  output [1:0]Q;
  output [4:0]\Q_reg[4]_0 ;
  input FSM_barrel_shifter_B_S;
  input \Q_reg[2]_0 ;
  input \Q_reg[1]_0 ;
  input \Q_reg[0]_0 ;
  input [0:0]\Q_reg[0]_1 ;
  input [1:0]FSM_selector_B;
  input [0:0]\Q_reg[0]_2 ;
  input \Q_reg[0]_3 ;
  input FSM_selector_C;
  input [22:0]\Q_reg[22]_0 ;
  input FSM_barrel_shifter_L_R;
  input [0:0]E;
  input [25:0]\Q_reg[22]_1 ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [20:0]D;
  wire [0:0]E;
  wire FSM_barrel_shifter_B_S;
  wire FSM_barrel_shifter_L_R;
  wire [1:0]FSM_selector_B;
  wire FSM_selector_C;
  wire [1:0]Q;
  wire \Q[0]_i_2__1_n_0 ;
  wire \Q[0]_i_2__2_n_0 ;
  wire \Q[0]_i_3_n_0 ;
  wire \Q[0]_i_4_n_0 ;
  wire \Q[0]_i_5_n_0 ;
  wire \Q[0]_i_6_n_0 ;
  wire \Q[0]_i_7_n_0 ;
  wire \Q[0]_i_8_n_0 ;
  wire \Q[0]_i_9_n_0 ;
  wire \Q[10]_i_2_n_0 ;
  wire \Q[10]_i_3_n_0 ;
  wire \Q[11]_i_2_n_0 ;
  wire \Q[11]_i_3_n_0 ;
  wire \Q[11]_i_4_n_0 ;
  wire \Q[12]_i_2_n_0 ;
  wire \Q[12]_i_3_n_0 ;
  wire \Q[13]_i_2__0_n_0 ;
  wire \Q[13]_i_3__0_n_0 ;
  wire \Q[14]_i_2__0_n_0 ;
  wire \Q[14]_i_3__0_n_0 ;
  wire \Q[15]_i_2__0_n_0 ;
  wire \Q[15]_i_3__0_n_0 ;
  wire \Q[16]_i_2__0_n_0 ;
  wire \Q[16]_i_3__0_n_0 ;
  wire \Q[17]_i_2__0_n_0 ;
  wire \Q[17]_i_3__0_n_0 ;
  wire \Q[18]_i_2__0_n_0 ;
  wire \Q[18]_i_3_n_0 ;
  wire \Q[19]_i_2__0_n_0 ;
  wire \Q[19]_i_3_n_0 ;
  wire \Q[1]_i_2__0_n_0 ;
  wire \Q[1]_i_2_n_0 ;
  wire \Q[1]_i_3__0_n_0 ;
  wire \Q[1]_i_3_n_0 ;
  wire \Q[1]_i_4_n_0 ;
  wire \Q[1]_i_5_n_0 ;
  wire \Q[1]_i_6_n_0 ;
  wire \Q[1]_i_7_n_0 ;
  wire \Q[20]_i_2__0_n_0 ;
  wire \Q[20]_i_3_n_0 ;
  wire \Q[21]_i_3_n_0 ;
  wire \Q[22]_i_3_n_0 ;
  wire \Q[23]_i_3_n_0 ;
  wire \Q[24]_i_3_n_0 ;
  wire \Q[2]_i_2__0_n_0 ;
  wire \Q[2]_i_2_n_0 ;
  wire \Q[2]_i_3__0_n_0 ;
  wire \Q[2]_i_3_n_0 ;
  wire \Q[2]_i_4_n_0 ;
  wire \Q[3]_i_2__0_n_0 ;
  wire \Q[3]_i_3_n_0 ;
  wire \Q[4]_i_2__0_n_0 ;
  wire \Q[4]_i_2_n_0 ;
  wire \Q[4]_i_3__0_n_0 ;
  wire \Q[4]_i_3_n_0 ;
  wire \Q[4]_i_4_n_0 ;
  wire \Q[4]_i_5_n_0 ;
  wire \Q[4]_i_6_n_0 ;
  wire \Q[4]_i_7_n_0 ;
  wire \Q[5]_i_2_n_0 ;
  wire \Q[5]_i_3_n_0 ;
  wire \Q[6]_i_2_n_0 ;
  wire \Q[6]_i_3_n_0 ;
  wire \Q[7]_i_2_n_0 ;
  wire \Q[7]_i_3_n_0 ;
  wire \Q[8]_i_2_n_0 ;
  wire \Q[8]_i_3_n_0 ;
  wire \Q[9]_i_2_n_0 ;
  wire \Q[9]_i_3_n_0 ;
  wire \Q_reg[0]_0 ;
  wire [0:0]\Q_reg[0]_1 ;
  wire [0:0]\Q_reg[0]_2 ;
  wire \Q_reg[0]_3 ;
  wire \Q_reg[15]_0 ;
  wire \Q_reg[16]_0 ;
  wire \Q_reg[17]_0 ;
  wire \Q_reg[18]_0 ;
  wire \Q_reg[1]_0 ;
  wire [22:0]\Q_reg[22]_0 ;
  wire [25:0]\Q_reg[22]_1 ;
  wire \Q_reg[2]_0 ;
  wire [4:0]\Q_reg[4]_0 ;
  wire \Q_reg_n_0_[10] ;
  wire \Q_reg_n_0_[11] ;
  wire \Q_reg_n_0_[12] ;
  wire \Q_reg_n_0_[13] ;
  wire \Q_reg_n_0_[14] ;
  wire \Q_reg_n_0_[15] ;
  wire \Q_reg_n_0_[16] ;
  wire \Q_reg_n_0_[17] ;
  wire \Q_reg_n_0_[18] ;
  wire \Q_reg_n_0_[19] ;
  wire \Q_reg_n_0_[1] ;
  wire \Q_reg_n_0_[20] ;
  wire \Q_reg_n_0_[21] ;
  wire \Q_reg_n_0_[22] ;
  wire \Q_reg_n_0_[23] ;
  wire \Q_reg_n_0_[24] ;
  wire \Q_reg_n_0_[2] ;
  wire \Q_reg_n_0_[3] ;
  wire \Q_reg_n_0_[4] ;
  wire \Q_reg_n_0_[5] ;
  wire \Q_reg_n_0_[6] ;
  wire \Q_reg_n_0_[7] ;
  wire \Q_reg_n_0_[8] ;
  wire \Q_reg_n_0_[9] ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[0]_i_1__4 
       (.I0(\Q[4]_i_2_n_0 ),
        .I1(\Q[6]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[0]_i_2__1_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[2]_i_2_n_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00000000FFFF00AE)) 
    \Q[0]_i_1__6 
       (.I0(\Q[0]_i_2__2_n_0 ),
        .I1(\Q[0]_i_3_n_0 ),
        .I2(\Q[0]_i_4_n_0 ),
        .I3(\Q[0]_i_5_n_0 ),
        .I4(\Q_reg_n_0_[24] ),
        .I5(Q[1]),
        .O(\Q_reg[4]_0 [0]));
  LUT6 #(
    .INIT(64'hB8BBBB88B888BB88)) 
    \Q[0]_i_2__1 
       (.I0(\Q[1]_i_3_n_0 ),
        .I1(\Q_reg[0]_3 ),
        .I2(Q[1]),
        .I3(FSM_barrel_shifter_L_R),
        .I4(FSM_selector_C),
        .I5(Q[0]),
        .O(\Q[0]_i_2__1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Q[0]_i_2__2 
       (.I0(\Q[0]_i_6_n_0 ),
        .I1(\Q_reg_n_0_[22] ),
        .I2(\Q_reg_n_0_[20] ),
        .I3(\Q_reg_n_0_[18] ),
        .O(\Q[0]_i_2__2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF44F4)) 
    \Q[0]_i_3 
       (.I0(\Q_reg_n_0_[7] ),
        .I1(\Q[0]_i_7_n_0 ),
        .I2(\Q_reg_n_0_[10] ),
        .I3(\Q_reg_n_0_[11] ),
        .I4(\Q_reg_n_0_[8] ),
        .I5(\Q_reg_n_0_[12] ),
        .O(\Q[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \Q[0]_i_4 
       (.I0(\Q_reg_n_0_[15] ),
        .I1(\Q_reg_n_0_[17] ),
        .I2(\Q_reg_n_0_[13] ),
        .I3(\Q[0]_i_8_n_0 ),
        .O(\Q[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'hBABBBABA)) 
    \Q[0]_i_5 
       (.I0(\Q_reg_n_0_[23] ),
        .I1(\Q_reg_n_0_[22] ),
        .I2(\Q_reg_n_0_[21] ),
        .I3(\Q_reg_n_0_[20] ),
        .I4(\Q_reg_n_0_[19] ),
        .O(\Q[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h00F2)) 
    \Q[0]_i_6 
       (.I0(\Q_reg_n_0_[14] ),
        .I1(\Q_reg_n_0_[15] ),
        .I2(\Q_reg_n_0_[16] ),
        .I3(\Q_reg_n_0_[17] ),
        .O(\Q[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCEFEFEFEE)) 
    \Q[0]_i_7 
       (.I0(\Q_reg_n_0_[4] ),
        .I1(\Q_reg_n_0_[6] ),
        .I2(\Q_reg_n_0_[3] ),
        .I3(\Q[0]_i_9_n_0 ),
        .I4(\Q_reg_n_0_[2] ),
        .I5(\Q_reg_n_0_[5] ),
        .O(\Q[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFF0B)) 
    \Q[0]_i_8 
       (.I0(\Q_reg_n_0_[10] ),
        .I1(\Q_reg_n_0_[9] ),
        .I2(\Q_reg_n_0_[11] ),
        .I3(\Q_reg_n_0_[12] ),
        .O(\Q[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Q[0]_i_9 
       (.I0(Q[0]),
        .I1(\Q_reg_n_0_[1] ),
        .O(\Q[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[10]_i_1__3 
       (.I0(\Q[14]_i_2__0_n_0 ),
        .I1(\Q[16]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[10]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[12]_i_2_n_0 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[10]_i_2 
       (.I0(\Q[11]_i_4_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[10]_i_3_n_0 ),
        .O(\Q[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[10]_i_3 
       (.I0(\Q_reg_n_0_[15] ),
        .I1(\Q_reg[22]_0 [13]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[10] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [8]),
        .O(\Q[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[11]_i_1__3 
       (.I0(\Q[15]_i_2__0_n_0 ),
        .I1(\Q[17]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[11]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[13]_i_2__0_n_0 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[11]_i_2 
       (.I0(\Q[11]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[11]_i_4_n_0 ),
        .O(\Q[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[11]_i_3 
       (.I0(\Q_reg_n_0_[13] ),
        .I1(\Q_reg[22]_0 [11]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[12] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [10]),
        .O(\Q[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[11]_i_4 
       (.I0(\Q_reg_n_0_[14] ),
        .I1(\Q_reg[22]_0 [12]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[11] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [9]),
        .O(\Q[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[12]_i_1__3 
       (.I0(\Q[16]_i_2__0_n_0 ),
        .I1(\Q[18]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[12]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[14]_i_2__0_n_0 ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hEFEADFD545408A80)) 
    \Q[12]_i_2 
       (.I0(\Q_reg[0]_3 ),
        .I1(\Q_reg_n_0_[13] ),
        .I2(FSM_selector_C),
        .I3(\Q_reg[22]_0 [11]),
        .I4(FSM_barrel_shifter_L_R),
        .I5(\Q[12]_i_3_n_0 ),
        .O(\Q[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \Q[12]_i_3 
       (.I0(\Q_reg_n_0_[12] ),
        .I1(FSM_selector_C),
        .I2(\Q_reg[22]_0 [10]),
        .O(\Q[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[13]_i_1__2 
       (.I0(\Q[17]_i_2__0_n_0 ),
        .I1(\Q[19]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[13]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[15]_i_2__0_n_0 ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[13]_i_2__0 
       (.I0(\Q[14]_i_3__0_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[13]_i_3__0_n_0 ),
        .O(\Q[13]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[13]_i_3__0 
       (.I0(\Q_reg_n_0_[12] ),
        .I1(\Q_reg[22]_0 [10]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[13] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [11]),
        .O(\Q[13]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[14]_i_1__3 
       (.I0(\Q[18]_i_2__0_n_0 ),
        .I1(\Q[20]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[14]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[16]_i_2__0_n_0 ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[14]_i_2__0 
       (.I0(\Q[15]_i_3__0_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[14]_i_3__0_n_0 ),
        .O(\Q[14]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[14]_i_3__0 
       (.I0(\Q_reg_n_0_[11] ),
        .I1(\Q_reg[22]_0 [9]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[14] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [12]),
        .O(\Q[14]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[15]_i_1__2 
       (.I0(\Q[19]_i_2__0_n_0 ),
        .I1(\Q_reg[15]_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[15]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[17]_i_2__0_n_0 ),
        .O(D[15]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[15]_i_2__0 
       (.I0(\Q[16]_i_3__0_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[15]_i_3__0_n_0 ),
        .O(\Q[15]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[15]_i_3__0 
       (.I0(\Q_reg_n_0_[10] ),
        .I1(\Q_reg[22]_0 [8]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[15] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [13]),
        .O(\Q[15]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[16]_i_1__2 
       (.I0(\Q[20]_i_2__0_n_0 ),
        .I1(\Q_reg[16]_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[16]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[18]_i_2__0_n_0 ),
        .O(D[16]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[16]_i_2__0 
       (.I0(\Q[17]_i_3__0_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[16]_i_3__0_n_0 ),
        .O(\Q[16]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[16]_i_3__0 
       (.I0(\Q_reg_n_0_[9] ),
        .I1(\Q_reg[22]_0 [7]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[16] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [14]),
        .O(\Q[16]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[17]_i_1__2 
       (.I0(\Q_reg[15]_0 ),
        .I1(\Q_reg[17]_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[17]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[19]_i_2__0_n_0 ),
        .O(D[17]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[17]_i_2__0 
       (.I0(\Q[18]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[17]_i_3__0_n_0 ),
        .O(\Q[17]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[17]_i_3__0 
       (.I0(\Q_reg_n_0_[8] ),
        .I1(\Q_reg[22]_0 [6]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[17] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [15]),
        .O(\Q[17]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[18]_i_1__2 
       (.I0(\Q_reg[16]_0 ),
        .I1(\Q_reg[18]_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[18]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[20]_i_2__0_n_0 ),
        .O(D[18]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[18]_i_2__0 
       (.I0(\Q[19]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[18]_i_3_n_0 ),
        .O(\Q[18]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[18]_i_3 
       (.I0(\Q_reg_n_0_[7] ),
        .I1(\Q_reg[22]_0 [5]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[18] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [16]),
        .O(\Q[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[19]_i_1__2 
       (.I0(\Q_reg[17]_0 ),
        .I1(\Q_reg[0]_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[19]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q_reg[15]_0 ),
        .O(D[19]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[19]_i_2__0 
       (.I0(\Q[20]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[19]_i_3_n_0 ),
        .O(\Q[19]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[19]_i_3 
       (.I0(\Q_reg_n_0_[6] ),
        .I1(\Q_reg[22]_0 [4]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[19] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [17]),
        .O(\Q[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[1]_i_1__2 
       (.I0(\Q[5]_i_2_n_0 ),
        .I1(\Q[7]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[1]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[3]_i_2__0_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h1111111111110010)) 
    \Q[1]_i_1__3 
       (.I0(Q[1]),
        .I1(\Q_reg_n_0_[24] ),
        .I2(\Q[1]_i_2__0_n_0 ),
        .I3(\Q[1]_i_3__0_n_0 ),
        .I4(\Q_reg_n_0_[22] ),
        .I5(\Q_reg_n_0_[23] ),
        .O(\Q_reg[4]_0 [1]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[1]_i_2 
       (.I0(\Q[2]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[1]_i_3_n_0 ),
        .O(\Q[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \Q[1]_i_2__0 
       (.I0(\Q_reg_n_0_[20] ),
        .I1(\Q_reg_n_0_[21] ),
        .O(\Q[1]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \Q[1]_i_3 
       (.I0(\Q_reg_n_0_[24] ),
        .I1(\Q_reg[22]_0 [22]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(FSM_selector_C),
        .I4(\Q_reg_n_0_[1] ),
        .O(\Q[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1111111111110010)) 
    \Q[1]_i_3__0 
       (.I0(\Q_reg_n_0_[19] ),
        .I1(\Q_reg_n_0_[18] ),
        .I2(\Q[1]_i_4_n_0 ),
        .I3(\Q[1]_i_5_n_0 ),
        .I4(\Q_reg_n_0_[16] ),
        .I5(\Q_reg_n_0_[17] ),
        .O(\Q[1]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \Q[1]_i_4 
       (.I0(\Q_reg_n_0_[14] ),
        .I1(\Q_reg_n_0_[15] ),
        .O(\Q[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1111111111110010)) 
    \Q[1]_i_5 
       (.I0(\Q_reg_n_0_[13] ),
        .I1(\Q_reg_n_0_[12] ),
        .I2(\Q[1]_i_6_n_0 ),
        .I3(\Q[1]_i_7_n_0 ),
        .I4(\Q_reg_n_0_[10] ),
        .I5(\Q_reg_n_0_[11] ),
        .O(\Q[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \Q[1]_i_6 
       (.I0(\Q_reg_n_0_[8] ),
        .I1(\Q_reg_n_0_[9] ),
        .O(\Q[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1110111011101111)) 
    \Q[1]_i_7 
       (.I0(\Q_reg_n_0_[6] ),
        .I1(\Q_reg_n_0_[7] ),
        .I2(\Q_reg_n_0_[4] ),
        .I3(\Q_reg_n_0_[5] ),
        .I4(\Q_reg_n_0_[2] ),
        .I5(\Q_reg_n_0_[3] ),
        .O(\Q[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[20]_i_1__1 
       (.I0(\Q_reg[18]_0 ),
        .I1(FSM_barrel_shifter_B_S),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[20]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q_reg[16]_0 ),
        .O(D[20]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[20]_i_2__0 
       (.I0(\Q[21]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[20]_i_3_n_0 ),
        .O(\Q[20]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[20]_i_3 
       (.I0(\Q_reg_n_0_[5] ),
        .I1(\Q_reg[22]_0 [3]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[20] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [18]),
        .O(\Q[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[21]_i_2__0 
       (.I0(\Q[22]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[21]_i_3_n_0 ),
        .O(\Q_reg[15]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[21]_i_3 
       (.I0(\Q_reg_n_0_[4] ),
        .I1(\Q_reg[22]_0 [2]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[21] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [19]),
        .O(\Q[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[22]_i_2__0 
       (.I0(\Q[23]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[22]_i_3_n_0 ),
        .O(\Q_reg[16]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[22]_i_3 
       (.I0(\Q_reg_n_0_[3] ),
        .I1(\Q_reg[22]_0 [1]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[22] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [20]),
        .O(\Q[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[23]_i_2__0 
       (.I0(\Q[24]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[23]_i_3_n_0 ),
        .O(\Q_reg[17]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[23]_i_3 
       (.I0(\Q_reg_n_0_[2] ),
        .I1(\Q_reg[22]_0 [0]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[23] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [21]),
        .O(\Q[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB833FFFFB8330000)) 
    \Q[24]_i_2__0 
       (.I0(Q[0]),
        .I1(FSM_barrel_shifter_L_R),
        .I2(Q[1]),
        .I3(FSM_selector_C),
        .I4(\Q_reg[0]_3 ),
        .I5(\Q[24]_i_3_n_0 ),
        .O(\Q_reg[18]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hB833B800)) 
    \Q[24]_i_3 
       (.I0(\Q_reg_n_0_[1] ),
        .I1(FSM_barrel_shifter_L_R),
        .I2(\Q_reg_n_0_[24] ),
        .I3(FSM_selector_C),
        .I4(\Q_reg[22]_0 [22]),
        .O(\Q[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[2]_i_1__2 
       (.I0(\Q[6]_i_2_n_0 ),
        .I1(\Q[8]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[2]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[4]_i_2_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h0001000000010001)) 
    \Q[2]_i_1__3 
       (.I0(\Q_reg_n_0_[22] ),
        .I1(\Q_reg_n_0_[23] ),
        .I2(\Q_reg_n_0_[24] ),
        .I3(Q[1]),
        .I4(\Q[2]_i_2__0_n_0 ),
        .I5(\Q[2]_i_3__0_n_0 ),
        .O(\Q_reg[4]_0 [2]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[2]_i_2 
       (.I0(\Q[3]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[2]_i_3_n_0 ),
        .O(\Q[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00808888AAAAAAAA)) 
    \Q[2]_i_2__0 
       (.I0(\Q[4]_i_6_n_0 ),
        .I1(\Q[4]_i_3__0_n_0 ),
        .I2(Q[0]),
        .I3(\Q_reg_n_0_[1] ),
        .I4(\Q[4]_i_2__0_n_0 ),
        .I5(\Q[2]_i_4_n_0 ),
        .O(\Q[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[2]_i_3 
       (.I0(\Q_reg_n_0_[23] ),
        .I1(\Q_reg[22]_0 [21]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[2] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [0]),
        .O(\Q[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[2]_i_3__0 
       (.I0(\Q_reg_n_0_[21] ),
        .I1(\Q_reg_n_0_[20] ),
        .I2(\Q_reg_n_0_[19] ),
        .I3(\Q_reg_n_0_[18] ),
        .O(\Q[2]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[2]_i_4 
       (.I0(\Q_reg_n_0_[11] ),
        .I1(\Q_reg_n_0_[10] ),
        .I2(\Q_reg_n_0_[13] ),
        .I3(\Q_reg_n_0_[12] ),
        .O(\Q[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[3]_i_1__2 
       (.I0(\Q[7]_i_2_n_0 ),
        .I1(\Q[9]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[3]_i_2__0_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[5]_i_2_n_0 ),
        .O(D[3]));
  LUT5 #(
    .INIT(32'h8000AAAA)) 
    \Q[3]_i_1__3 
       (.I0(\Q[4]_i_5_n_0 ),
        .I1(\Q[4]_i_3__0_n_0 ),
        .I2(\Q[4]_i_2__0_n_0 ),
        .I3(\Q_reg_n_0_[1] ),
        .I4(\Q[4]_i_4_n_0 ),
        .O(\Q_reg[4]_0 [3]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[3]_i_2__0 
       (.I0(\Q[4]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[3]_i_3_n_0 ),
        .O(\Q[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[3]_i_3 
       (.I0(\Q_reg_n_0_[22] ),
        .I1(\Q_reg[22]_0 [20]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[3] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [1]),
        .O(\Q[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[4]_i_1__3 
       (.I0(\Q[8]_i_2_n_0 ),
        .I1(\Q[10]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[4]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[6]_i_2_n_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFDFF000000000000)) 
    \Q[4]_i_1__4 
       (.I0(\Q[4]_i_2__0_n_0 ),
        .I1(\Q_reg_n_0_[1] ),
        .I2(Q[0]),
        .I3(\Q[4]_i_3__0_n_0 ),
        .I4(\Q[4]_i_4_n_0 ),
        .I5(\Q[4]_i_5_n_0 ),
        .O(\Q_reg[4]_0 [4]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[4]_i_2 
       (.I0(\Q[5]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[4]_i_3_n_0 ),
        .O(\Q[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[4]_i_2__0 
       (.I0(\Q_reg_n_0_[3] ),
        .I1(\Q_reg_n_0_[2] ),
        .I2(\Q_reg_n_0_[5] ),
        .I3(\Q_reg_n_0_[4] ),
        .O(\Q[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[4]_i_3 
       (.I0(\Q_reg_n_0_[21] ),
        .I1(\Q_reg[22]_0 [19]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[4] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [2]),
        .O(\Q[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[4]_i_3__0 
       (.I0(\Q_reg_n_0_[9] ),
        .I1(\Q_reg_n_0_[8] ),
        .I2(\Q_reg_n_0_[6] ),
        .I3(\Q_reg_n_0_[7] ),
        .O(\Q[4]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \Q[4]_i_4 
       (.I0(\Q_reg_n_0_[12] ),
        .I1(\Q_reg_n_0_[13] ),
        .I2(\Q_reg_n_0_[10] ),
        .I3(\Q_reg_n_0_[11] ),
        .I4(\Q[4]_i_6_n_0 ),
        .O(\Q[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \Q[4]_i_5 
       (.I0(\Q_reg_n_0_[18] ),
        .I1(\Q_reg_n_0_[19] ),
        .I2(\Q_reg_n_0_[20] ),
        .I3(\Q_reg_n_0_[21] ),
        .I4(\Q[4]_i_7_n_0 ),
        .O(\Q[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[4]_i_6 
       (.I0(\Q_reg_n_0_[17] ),
        .I1(\Q_reg_n_0_[16] ),
        .I2(\Q_reg_n_0_[15] ),
        .I3(\Q_reg_n_0_[14] ),
        .O(\Q[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \Q[4]_i_7 
       (.I0(Q[1]),
        .I1(\Q_reg_n_0_[24] ),
        .I2(\Q_reg_n_0_[23] ),
        .I3(\Q_reg_n_0_[22] ),
        .O(\Q[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[5]_i_1__2 
       (.I0(\Q[9]_i_2_n_0 ),
        .I1(\Q[11]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[5]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[7]_i_2_n_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[5]_i_2 
       (.I0(\Q[6]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[5]_i_3_n_0 ),
        .O(\Q[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[5]_i_3 
       (.I0(\Q_reg_n_0_[20] ),
        .I1(\Q_reg[22]_0 [18]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[5] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [3]),
        .O(\Q[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[6]_i_1__3 
       (.I0(\Q[10]_i_2_n_0 ),
        .I1(\Q[12]_i_2_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[6]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[8]_i_2_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[6]_i_2 
       (.I0(\Q[7]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[6]_i_3_n_0 ),
        .O(\Q[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[6]_i_3 
       (.I0(\Q_reg_n_0_[19] ),
        .I1(\Q_reg[22]_0 [17]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[6] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [4]),
        .O(\Q[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[7]_i_1__2 
       (.I0(\Q[11]_i_2_n_0 ),
        .I1(\Q[13]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[7]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[9]_i_2_n_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[7]_i_2 
       (.I0(\Q[8]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[7]_i_3_n_0 ),
        .O(\Q[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[7]_i_3 
       (.I0(\Q_reg_n_0_[18] ),
        .I1(\Q_reg[22]_0 [16]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[7] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [5]),
        .O(\Q[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[8]_i_1__3 
       (.I0(\Q[12]_i_2_n_0 ),
        .I1(\Q[14]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[8]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[10]_i_2_n_0 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[8]_i_2 
       (.I0(\Q[9]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[8]_i_3_n_0 ),
        .O(\Q[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[8]_i_3 
       (.I0(\Q_reg_n_0_[17] ),
        .I1(\Q_reg[22]_0 [15]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[8] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [6]),
        .O(\Q[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[9]_i_1__3 
       (.I0(\Q[13]_i_2__0_n_0 ),
        .I1(\Q[15]_i_2__0_n_0 ),
        .I2(\Q_reg[2]_0 ),
        .I3(\Q[9]_i_2_n_0 ),
        .I4(\Q_reg[1]_0 ),
        .I5(\Q[11]_i_2_n_0 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFABAFABF0A8A0A80)) 
    \Q[9]_i_2 
       (.I0(\Q[10]_i_3_n_0 ),
        .I1(\Q_reg[0]_1 ),
        .I2(FSM_selector_B[0]),
        .I3(FSM_selector_B[1]),
        .I4(\Q_reg[0]_2 ),
        .I5(\Q[9]_i_3_n_0 ),
        .O(\Q[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Q[9]_i_3 
       (.I0(\Q_reg_n_0_[16] ),
        .I1(\Q_reg[22]_0 [14]),
        .I2(FSM_barrel_shifter_L_R),
        .I3(\Q_reg_n_0_[9] ),
        .I4(FSM_selector_C),
        .I5(\Q_reg[22]_0 [7]),
        .O(\Q[9]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [10]),
        .Q(\Q_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [11]),
        .Q(\Q_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [12]),
        .Q(\Q_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [13]),
        .Q(\Q_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [14]),
        .Q(\Q_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [15]),
        .Q(\Q_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [16]),
        .Q(\Q_reg_n_0_[16] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [17]),
        .Q(\Q_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [18]),
        .Q(\Q_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [19]),
        .Q(\Q_reg_n_0_[19] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [1]),
        .Q(\Q_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [20]),
        .Q(\Q_reg_n_0_[20] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [21]),
        .Q(\Q_reg_n_0_[21] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [22]),
        .Q(\Q_reg_n_0_[22] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [23]),
        .Q(\Q_reg_n_0_[23] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [24]),
        .Q(\Q_reg_n_0_[24] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [25]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [2]),
        .Q(\Q_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [3]),
        .Q(\Q_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [4]),
        .Q(\Q_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [5]),
        .Q(\Q_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [6]),
        .Q(\Q_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [7]),
        .Q(\Q_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [8]),
        .Q(\Q_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\Q_reg[22]_1 [9]),
        .Q(\Q_reg_n_0_[9] ));
endmodule

(* ORIG_REF_NAME = "RegisterAdd" *) 
module RegisterAdd__parameterized9
   (Q,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[3] );
  output [4:0]Q;
  input [0:0]E;
  input [4:0]D;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[3] ;

  wire CLK;
  wire [4:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg_reg[3] ;
  wire [4:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[3] ),
        .D(D[4]),
        .Q(Q[4]));
endmodule

module Simple_Subt
   (D,
    Q,
    \Q_reg[26] ,
    S);
  output [7:0]D;
  input [6:0]Q;
  input [3:0]\Q_reg[26] ;
  input [3:0]S;

  wire [7:0]D;
  wire [6:0]Q;
  wire [3:0]\Q_reg[26] ;
  wire [3:0]S;
  wire Y_carry__0_n_1;
  wire Y_carry__0_n_2;
  wire Y_carry__0_n_3;
  wire Y_carry_n_0;
  wire Y_carry_n_1;
  wire Y_carry_n_2;
  wire Y_carry_n_3;
  wire [3:3]NLW_Y_carry__0_CO_UNCONNECTED;

  CARRY4 Y_carry
       (.CI(1'b0),
        .CO({Y_carry_n_0,Y_carry_n_1,Y_carry_n_2,Y_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(D[3:0]),
        .S(\Q_reg[26] ));
  CARRY4 Y_carry__0
       (.CI(Y_carry_n_0),
        .CO({NLW_Y_carry__0_CO_UNCONNECTED[3],Y_carry__0_n_1,Y_carry__0_n_2,Y_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(D[7:4]),
        .S(S));
endmodule

(* ORIG_REF_NAME = "Simple_Subt" *) 
module Simple_Subt_5
   (D,
    Q,
    \Q_reg[26] ,
    S);
  output [7:0]D;
  input [6:0]Q;
  input [3:0]\Q_reg[26] ;
  input [3:0]S;

  wire [7:0]D;
  wire [6:0]Q;
  wire [3:0]\Q_reg[26] ;
  wire [3:0]S;
  wire Y_carry__0_n_1;
  wire Y_carry__0_n_2;
  wire Y_carry__0_n_3;
  wire Y_carry_n_0;
  wire Y_carry_n_1;
  wire Y_carry_n_2;
  wire Y_carry_n_3;
  wire [3:3]NLW_Y_carry__0_CO_UNCONNECTED;

  CARRY4 Y_carry
       (.CI(1'b0),
        .CO({Y_carry_n_0,Y_carry_n_1,Y_carry_n_2,Y_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(D[3:0]),
        .S(\Q_reg[26] ));
  CARRY4 Y_carry__0
       (.CI(Y_carry_n_0),
        .CO({NLW_Y_carry__0_CO_UNCONNECTED[3],Y_carry__0_n_1,Y_carry__0_n_2,Y_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(D[7:4]),
        .S(S));
endmodule

module Tenth_Phase
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  RegisterAdd__parameterized10 Final_Result_IEEE
       (.AR(AR),
        .CLK(CLK),
        .D(D),
        .E(E),
        .Q(Q));
endmodule

module add_sub_carry_out
   (S,
    \Q_reg[7] ,
    \Q_reg[4] ,
    FSM_selector_B,
    \Q_reg[30] ,
    FSM_exp_operation_A_S,
    \Q_reg[30]_0 );
  output [3:0]S;
  output [3:0]\Q_reg[7] ;
  input [4:0]\Q_reg[4] ;
  input [1:0]FSM_selector_B;
  input [7:0]\Q_reg[30] ;
  input FSM_exp_operation_A_S;
  input [6:0]\Q_reg[30]_0 ;

  wire FSM_exp_operation_A_S;
  wire [1:0]FSM_selector_B;
  wire [7:0]\Q_reg[30] ;
  wire [6:0]\Q_reg[30]_0 ;
  wire [4:0]\Q_reg[4] ;
  wire [3:0]\Q_reg[7] ;
  wire [3:0]S;

  LUT6 #(
    .INIT(64'h2320DCDFDCDF2320)) 
    \Q[3]_i_2 
       (.I0(\Q_reg[4] [3]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[30] [3]),
        .I4(FSM_exp_operation_A_S),
        .I5(\Q_reg[30]_0 [2]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h2320DCDFDCDF2320)) 
    \Q[3]_i_3 
       (.I0(\Q_reg[4] [2]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[30] [2]),
        .I4(FSM_exp_operation_A_S),
        .I5(\Q_reg[30]_0 [1]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h2320DCDFDCDF2320)) 
    \Q[3]_i_4 
       (.I0(\Q_reg[4] [1]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[30] [1]),
        .I4(FSM_exp_operation_A_S),
        .I5(\Q_reg[30]_0 [0]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h3B38)) 
    \Q[3]_i_5 
       (.I0(\Q_reg[4] [0]),
        .I1(FSM_selector_B[0]),
        .I2(FSM_selector_B[1]),
        .I3(\Q_reg[30] [0]),
        .O(S[0]));
  LUT5 #(
    .INIT(32'h02FDFD02)) 
    \Q[7]_i_2 
       (.I0(\Q_reg[30] [7]),
        .I1(FSM_selector_B[0]),
        .I2(FSM_selector_B[1]),
        .I3(FSM_exp_operation_A_S),
        .I4(\Q_reg[30]_0 [6]),
        .O(\Q_reg[7] [3]));
  LUT5 #(
    .INIT(32'h02FDFD02)) 
    \Q[7]_i_3 
       (.I0(\Q_reg[30] [6]),
        .I1(FSM_selector_B[0]),
        .I2(FSM_selector_B[1]),
        .I3(FSM_exp_operation_A_S),
        .I4(\Q_reg[30]_0 [5]),
        .O(\Q_reg[7] [2]));
  LUT5 #(
    .INIT(32'h02FDFD02)) 
    \Q[7]_i_4 
       (.I0(\Q_reg[30] [5]),
        .I1(FSM_selector_B[0]),
        .I2(FSM_selector_B[1]),
        .I3(FSM_exp_operation_A_S),
        .I4(\Q_reg[30]_0 [4]),
        .O(\Q_reg[7] [1]));
  LUT6 #(
    .INIT(64'h2320DCDFDCDF2320)) 
    \Q[7]_i_5 
       (.I0(\Q_reg[4] [4]),
        .I1(FSM_selector_B[1]),
        .I2(FSM_selector_B[0]),
        .I3(\Q_reg[30] [4]),
        .I4(FSM_exp_operation_A_S),
        .I5(\Q_reg[30]_0 [3]),
        .O(\Q_reg[7] [0]));
endmodule

(* ORIG_REF_NAME = "add_sub_carry_out" *) 
module add_sub_carry_out__parameterized0
   (\Q_reg[25] ,
    O,
    Q,
    DI,
    S,
    \Q_reg[7] ,
    \Q_reg[11] ,
    \Q_reg[15] ,
    \Q_reg[19] ,
    \Q_reg[23] ,
    \Q_reg[31] );
  output [24:0]\Q_reg[25] ;
  output [0:0]O;
  input [22:0]Q;
  input [1:0]DI;
  input [3:0]S;
  input [3:0]\Q_reg[7] ;
  input [3:0]\Q_reg[11] ;
  input [3:0]\Q_reg[15] ;
  input [3:0]\Q_reg[19] ;
  input [3:0]\Q_reg[23] ;
  input [2:0]\Q_reg[31] ;

  wire [1:0]DI;
  wire [0:0]O;
  wire [22:0]Q;
  wire [3:0]\Q_reg[11] ;
  wire [3:0]\Q_reg[15] ;
  wire [3:0]\Q_reg[19] ;
  wire [3:0]\Q_reg[23] ;
  wire [24:0]\Q_reg[25] ;
  wire [2:0]\Q_reg[31] ;
  wire [3:0]\Q_reg[7] ;
  wire [3:0]S;
  wire _inferred__0_carry__0_n_0;
  wire _inferred__0_carry__0_n_1;
  wire _inferred__0_carry__0_n_2;
  wire _inferred__0_carry__0_n_3;
  wire _inferred__0_carry__1_n_0;
  wire _inferred__0_carry__1_n_1;
  wire _inferred__0_carry__1_n_2;
  wire _inferred__0_carry__1_n_3;
  wire _inferred__0_carry__2_n_0;
  wire _inferred__0_carry__2_n_1;
  wire _inferred__0_carry__2_n_2;
  wire _inferred__0_carry__2_n_3;
  wire _inferred__0_carry__3_n_0;
  wire _inferred__0_carry__3_n_1;
  wire _inferred__0_carry__3_n_2;
  wire _inferred__0_carry__3_n_3;
  wire _inferred__0_carry__4_n_0;
  wire _inferred__0_carry__4_n_1;
  wire _inferred__0_carry__4_n_2;
  wire _inferred__0_carry__4_n_3;
  wire _inferred__0_carry__5_n_2;
  wire _inferred__0_carry__5_n_3;
  wire _inferred__0_carry_n_0;
  wire _inferred__0_carry_n_1;
  wire _inferred__0_carry_n_2;
  wire _inferred__0_carry_n_3;
  wire [0:0]NLW__inferred__0_carry_O_UNCONNECTED;
  wire [3:2]NLW__inferred__0_carry__5_CO_UNCONNECTED;
  wire [3:3]NLW__inferred__0_carry__5_O_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry
       (.CI(1'b0),
        .CO({_inferred__0_carry_n_0,_inferred__0_carry_n_1,_inferred__0_carry_n_2,_inferred__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({Q[1:0],DI}),
        .O({\Q_reg[25] [2:0],NLW__inferred__0_carry_O_UNCONNECTED[0]}),
        .S(S));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry__0
       (.CI(_inferred__0_carry_n_0),
        .CO({_inferred__0_carry__0_n_0,_inferred__0_carry__0_n_1,_inferred__0_carry__0_n_2,_inferred__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(Q[5:2]),
        .O(\Q_reg[25] [6:3]),
        .S(\Q_reg[7] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry__1
       (.CI(_inferred__0_carry__0_n_0),
        .CO({_inferred__0_carry__1_n_0,_inferred__0_carry__1_n_1,_inferred__0_carry__1_n_2,_inferred__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(Q[9:6]),
        .O(\Q_reg[25] [10:7]),
        .S(\Q_reg[11] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry__2
       (.CI(_inferred__0_carry__1_n_0),
        .CO({_inferred__0_carry__2_n_0,_inferred__0_carry__2_n_1,_inferred__0_carry__2_n_2,_inferred__0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(Q[13:10]),
        .O(\Q_reg[25] [14:11]),
        .S(\Q_reg[15] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry__3
       (.CI(_inferred__0_carry__2_n_0),
        .CO({_inferred__0_carry__3_n_0,_inferred__0_carry__3_n_1,_inferred__0_carry__3_n_2,_inferred__0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(Q[17:14]),
        .O(\Q_reg[25] [18:15]),
        .S(\Q_reg[19] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry__4
       (.CI(_inferred__0_carry__3_n_0),
        .CO({_inferred__0_carry__4_n_0,_inferred__0_carry__4_n_1,_inferred__0_carry__4_n_2,_inferred__0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(Q[21:18]),
        .O(\Q_reg[25] [22:19]),
        .S(\Q_reg[23] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _inferred__0_carry__5
       (.CI(_inferred__0_carry__4_n_0),
        .CO({NLW__inferred__0_carry__5_CO_UNCONNECTED[3:2],_inferred__0_carry__5_n_2,_inferred__0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,Q[22]}),
        .O({NLW__inferred__0_carry__5_O_UNCONNECTED[3],O,\Q_reg[25] [24:23]}),
        .S({1'b0,\Q_reg[31] }));
endmodule

module counter_d
   (max_tick_iter,
    Q,
    D,
    \Q_reg[1] ,
    \FSM_sequential_state_reg_reg[2] ,
    \count_reg[3]_0 ,
    \Q_reg[0] ,
    E,
    cont_var_out,
    out,
    \FSM_sequential_state_reg_reg[0] ,
    CLK,
    AR,
    \count_reg[1]_0 );
  output max_tick_iter;
  output [3:0]Q;
  output [19:0]D;
  output \Q_reg[1] ;
  output \FSM_sequential_state_reg_reg[2] ;
  output \count_reg[3]_0 ;
  output \Q_reg[0] ;
  input [0:0]E;
  input [1:0]cont_var_out;
  input [1:0]out;
  input [0:0]\FSM_sequential_state_reg_reg[0] ;
  input CLK;
  input [0:0]AR;
  input [1:0]\count_reg[1]_0 ;

  wire [0:0]AR;
  wire CLK;
  wire [19:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg_reg[0] ;
  wire \FSM_sequential_state_reg_reg[2] ;
  wire [3:0]Q;
  wire \Q_reg[0] ;
  wire \Q_reg[1] ;
  wire [1:0]cont_var_out;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_2_n_0 ;
  wire [1:0]\count_reg[1]_0 ;
  wire \count_reg[3]_0 ;
  wire max_tick_iter;
  wire [1:0]out;

  LUT6 #(
    .INIT(64'h0BBBBBBBBBBBBBBB)) 
    \FSM_sequential_state_reg[2]_i_2 
       (.I0(cont_var_out[0]),
        .I1(cont_var_out[1]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\FSM_sequential_state_reg_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_sequential_state_reg[3]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(max_tick_iter));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT4 #(
    .INIT(16'h7465)) 
    \Q[0]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h1111111111111110)) 
    \Q[0]_i_2__4 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\Q_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'h7445)) 
    \Q[10]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT4 #(
    .INIT(16'h55EF)) 
    \Q[11]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT4 #(
    .INIT(16'h6474)) 
    \Q[12]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'h54BE)) 
    \Q[14]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'h5B)) 
    \Q[16]_i_1__6 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'h5E)) 
    \Q[18]_i_1__6 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT4 #(
    .INIT(16'h55AB)) 
    \Q[1]_i_1__7 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \Q[1]_i_2__1 
       (.I0(cont_var_out[1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(\Q_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'h5E)) 
    \Q[20]_i_1__6 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'h55FE)) 
    \Q[21]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \Q[22]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \Q[23]_i_1__6 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'h708F)) 
    \Q[24]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'h0787)) 
    \Q[25]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'h007F)) 
    \Q[26]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT4 #(
    .INIT(16'h0858)) 
    \Q[2]_i_1__7 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT4 #(
    .INIT(16'h01F3)) 
    \Q[4]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT4 #(
    .INIT(16'h5443)) 
    \Q[6]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \Q[8]_i_1 
       (.I0(Q[2]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT4 #(
    .INIT(16'h55BF)) 
    \Q[9]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \count[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(E),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \count[3]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(E),
        .O(\count[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0444444444444444)) 
    \count[3]_i_3 
       (.I0(cont_var_out[0]),
        .I1(cont_var_out[1]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\count_reg[3]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[0] ),
        .CLR(AR),
        .D(\count_reg[1]_0 [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[0] ),
        .CLR(AR),
        .D(\count_reg[1]_0 [1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[0] ),
        .CLR(AR),
        .D(\count[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[0] ),
        .CLR(AR),
        .D(\count[3]_i_2_n_0 ),
        .Q(Q[3]));
endmodule

module counter_up
   (E,
    cont_var_out,
    \Q_reg[31] ,
    \count_reg[0]_0 ,
    \Q_reg[0] ,
    \FSM_sequential_state_reg_reg[1] ,
    \Q_reg[0]_0 ,
    max_tick_iter,
    \FSM_sequential_state_reg_reg[3] ,
    d_ff3_sign_out,
    out,
    enab_cont_var,
    \FSM_sequential_state_reg_reg[1]_0 ,
    CLK,
    AR);
  output [0:0]E;
  output [1:0]cont_var_out;
  output [0:0]\Q_reg[31] ;
  output \count_reg[0]_0 ;
  output \Q_reg[0] ;
  input \FSM_sequential_state_reg_reg[1] ;
  input \Q_reg[0]_0 ;
  input max_tick_iter;
  input \FSM_sequential_state_reg_reg[3] ;
  input d_ff3_sign_out;
  input [3:0]out;
  input enab_cont_var;
  input [0:0]\FSM_sequential_state_reg_reg[1]_0 ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire \FSM_sequential_state_reg_reg[1] ;
  wire [0:0]\FSM_sequential_state_reg_reg[1]_0 ;
  wire \FSM_sequential_state_reg_reg[3] ;
  wire \Q_reg[0] ;
  wire \Q_reg[0]_0 ;
  wire [0:0]\Q_reg[31] ;
  wire [1:0]cont_var_out;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count_reg[0]_0 ;
  wire d_ff3_sign_out;
  wire enab_cont_var;
  wire max_tick_iter;
  wire [3:0]out;

  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \Q[0]_i_1__15 
       (.I0(cont_var_out[0]),
        .I1(d_ff3_sign_out),
        .O(\Q_reg[0] ));
  LUT6 #(
    .INIT(64'h2020202A00000000)) 
    \Q[31]_i_1 
       (.I0(\FSM_sequential_state_reg_reg[1] ),
        .I1(\Q_reg[0]_0 ),
        .I2(max_tick_iter),
        .I3(cont_var_out[0]),
        .I4(cont_var_out[1]),
        .I5(\FSM_sequential_state_reg_reg[3] ),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \Q[31]_i_1__0 
       (.I0(\FSM_sequential_state_reg_reg[1] ),
        .I1(max_tick_iter),
        .I2(cont_var_out[1]),
        .I3(cont_var_out[0]),
        .I4(\FSM_sequential_state_reg_reg[3] ),
        .O(\Q_reg[31] ));
  LUT6 #(
    .INIT(64'h0000FFFFFFDF0000)) 
    \count[0]_i_1 
       (.I0(out[0]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(enab_cont_var),
        .I5(cont_var_out[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT4 #(
    .INIT(16'h1F20)) 
    \count[1]_i_1 
       (.I0(cont_var_out[0]),
        .I1(\FSM_sequential_state_reg_reg[1]_0 ),
        .I2(enab_cont_var),
        .I3(cont_var_out[1]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[1]_i_4 
       (.I0(cont_var_out[1]),
        .I1(cont_var_out[0]),
        .O(\count_reg[0]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\count[0]_i_1_n_0 ),
        .Q(cont_var_out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\count[1]_i_1_n_0 ),
        .Q(cont_var_out[1]));
endmodule

module d_ff_en
   (\Q_reg[0]_0 ,
    D,
    \Q_reg[31] ,
    \FSM_sequential_state_reg_reg[0] ,
    CLK,
    \FSM_sequential_state_reg_reg[1] ,
    Q,
    \Q_reg[31]_0 );
  output \Q_reg[0]_0 ;
  output [11:0]D;
  output [31:0]\Q_reg[31] ;
  input \FSM_sequential_state_reg_reg[0] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;
  input [11:0]Q;
  input [31:0]\Q_reg[31]_0 ;

  wire CLK;
  wire [11:0]D;
  wire \FSM_sequential_state_reg_reg[0] ;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [11:0]Q;
  wire \Q_reg[0]_0 ;
  wire [31:0]\Q_reg[31] ;
  wire [31:0]\Q_reg[31]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[0]_i_1__16 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[0]_i_1__17 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [0]),
        .O(\Q_reg[31] [0]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[10]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [10]),
        .O(\Q_reg[31] [10]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[11]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[11]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [11]),
        .O(\Q_reg[31] [11]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[12]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [12]),
        .O(\Q_reg[31] [12]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[13]_i_1__6 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [13]),
        .O(\Q_reg[31] [13]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[14]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [14]),
        .O(\Q_reg[31] [14]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[15]_i_1__6 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[15]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [15]),
        .O(\Q_reg[31] [15]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[16]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [16]),
        .O(\Q_reg[31] [16]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[17]_i_1__6 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [17]),
        .O(\Q_reg[31] [17]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[18]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[18]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [18]),
        .O(\Q_reg[31] [18]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[19]_i_1__6 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [19]),
        .O(\Q_reg[31] [19]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[1]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [1]),
        .O(\Q_reg[31] [1]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[20]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [20]),
        .O(\Q_reg[31] [20]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[21]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[21]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [21]),
        .O(\Q_reg[31] [21]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[22]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[8]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[22]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [22]),
        .O(\Q_reg[31] [22]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[23]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[23]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [23]),
        .O(\Q_reg[31] [23]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[24]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [24]),
        .O(\Q_reg[31] [24]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[25]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [25]),
        .O(\Q_reg[31] [25]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[26]_i_1__5 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [26]),
        .O(\Q_reg[31] [26]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[27]_i_1__4 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [27]),
        .O(\Q_reg[31] [27]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[28]_i_1__4 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [28]),
        .O(\Q_reg[31] [28]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[29]_i_1__4 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [29]),
        .O(\Q_reg[31] [29]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[2]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [2]),
        .O(\Q_reg[31] [2]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[30]_i_1__4 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[30]_i_1__5 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [30]),
        .O(\Q_reg[31] [30]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[31]_i_1__9 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [31]),
        .O(\Q_reg[31] [31]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[31]_i_2__3 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[3]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [3]),
        .O(\Q_reg[31] [3]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[4]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[4]_i_1__9 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [4]),
        .O(\Q_reg[31] [4]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[5]_i_1__6 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [5]),
        .O(\Q_reg[31] [5]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[6]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [6]),
        .O(\Q_reg[31] [6]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[7]_i_1__6 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [7]),
        .O(\Q_reg[31] [7]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[8]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[8]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [8]),
        .O(\Q_reg[31] [8]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[9]_i_1__7 
       (.I0(\Q_reg[0]_0 ),
        .I1(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Q[9]_i_1__8 
       (.I0(\Q_reg[0]_0 ),
        .I1(\Q_reg[31]_0 [9]),
        .O(\Q_reg[31] [9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(\FSM_sequential_state_reg_reg[0] ),
        .Q(\Q_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en_2
   (\Q_reg[0]_0 ,
    \FSM_sequential_state_reg_reg[2] ,
    CLK,
    \FSM_sequential_state_reg_reg[1] );
  output \Q_reg[0]_0 ;
  input \FSM_sequential_state_reg_reg[2] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;

  wire CLK;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire \FSM_sequential_state_reg_reg[2] ;
  wire \Q_reg[0]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(\FSM_sequential_state_reg_reg[2] ),
        .Q(\Q_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en_3
   (d_ff1_operation_out,
    E,
    operation_IBUF,
    CLK,
    AR);
  output d_ff1_operation_out;
  input [0:0]E;
  input operation_IBUF;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire d_ff1_operation_out;
  wire operation_IBUF;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(operation_IBUF),
        .Q(d_ff1_operation_out));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en_4
   (d_ff3_sign_out,
    \FSM_sequential_state_reg_reg[1] ,
    Q,
    CLK,
    \FSM_sequential_state_reg_reg[1]_0 );
  output d_ff3_sign_out;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;
  input [0:0]Q;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[1]_0 ;

  wire CLK;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [0:0]\FSM_sequential_state_reg_reg[1]_0 ;
  wire [0:0]Q;
  wire d_ff3_sign_out;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 ),
        .D(Q),
        .Q(d_ff3_sign_out));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized0
   (D,
    \Q_reg[0]_0 ,
    \Q_reg[0]_1 ,
    Q,
    d_ff1_operation_out,
    max_tick_iter,
    cont_var_out,
    \FSM_sequential_state_reg_reg[1] ,
    \shift_region_flag[1] ,
    CLK,
    \FSM_sequential_state_reg_reg[1]_0 );
  output [0:0]D;
  output \Q_reg[0]_0 ;
  output \Q_reg[0]_1 ;
  input [0:0]Q;
  input d_ff1_operation_out;
  input max_tick_iter;
  input [0:0]cont_var_out;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;
  input [1:0]\shift_region_flag[1] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[1]_0 ;

  wire CLK;
  wire [0:0]D;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [0:0]\FSM_sequential_state_reg_reg[1]_0 ;
  wire [0:0]Q;
  wire \Q_reg[0]_0 ;
  wire \Q_reg[0]_1 ;
  wire [0:0]cont_var_out;
  wire d_ff1_operation_out;
  wire [1:0]d_ff1_shift_region_flag_out;
  wire max_tick_iter;
  wire [1:0]\shift_region_flag[1] ;

  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT5 #(
    .INIT(32'h96FF9600)) 
    \Q[0]_i_2__0 
       (.I0(d_ff1_operation_out),
        .I1(d_ff1_shift_region_flag_out[1]),
        .I2(d_ff1_shift_region_flag_out[0]),
        .I3(max_tick_iter),
        .I4(cont_var_out),
        .O(\Q_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h9AA6)) 
    \Q[31]_i_2__0 
       (.I0(Q),
        .I1(d_ff1_shift_region_flag_out[0]),
        .I2(d_ff1_shift_region_flag_out[1]),
        .I3(d_ff1_operation_out),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \Q[31]_i_4 
       (.I0(d_ff1_operation_out),
        .I1(d_ff1_shift_region_flag_out[1]),
        .I2(d_ff1_shift_region_flag_out[0]),
        .O(\Q_reg[0]_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 ),
        .D(\shift_region_flag[1] [0]),
        .Q(d_ff1_shift_region_flag_out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 ),
        .D(\shift_region_flag[1] [1]),
        .Q(d_ff1_shift_region_flag_out[1]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized1
   (Q,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[1] );
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized10
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized11
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized12
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [1:0]AR;

  wire [1:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[1]),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR[0]),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized13
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized2
   (S,
    Q,
    \Q_reg[26]_0 ,
    \count_reg[3] ,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[1] );
  output [3:0]S;
  output [31:0]Q;
  output [3:0]\Q_reg[26]_0 ;
  input [3:0]\count_reg[3] ;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[1] ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [1:0]\FSM_sequential_state_reg_reg[1] ;
  wire [31:0]Q;
  wire [3:0]\Q_reg[26]_0 ;
  wire [3:0]S;
  wire [3:0]\count_reg[3] ;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[9]),
        .Q(Q[9]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_1__0
       (.I0(Q[30]),
        .O(S[3]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_2__0
       (.I0(Q[29]),
        .O(S[2]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_3__0
       (.I0(Q[28]),
        .O(S[1]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_4__0
       (.I0(Q[27]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_1
       (.I0(Q[26]),
        .I1(\count_reg[3] [3]),
        .O(\Q_reg[26]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_2__0
       (.I0(Q[25]),
        .I1(\count_reg[3] [2]),
        .O(\Q_reg[26]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_3
       (.I0(Q[24]),
        .I1(\count_reg[3] [1]),
        .O(\Q_reg[26]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_4__0
       (.I0(Q[23]),
        .I1(\count_reg[3] [0]),
        .O(\Q_reg[26]_0 [0]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized3
   (S,
    Q,
    \Q_reg[26]_0 ,
    \count_reg[3] ,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[1] );
  output [3:0]S;
  output [31:0]Q;
  output [3:0]\Q_reg[26]_0 ;
  input [3:0]\count_reg[3] ;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[1] ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [1:0]\FSM_sequential_state_reg_reg[1] ;
  wire [31:0]Q;
  wire [3:0]\Q_reg[26]_0 ;
  wire [3:0]S;
  wire [3:0]\count_reg[3] ;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[9]),
        .Q(Q[9]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_1
       (.I0(Q[30]),
        .O(S[3]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_2
       (.I0(Q[29]),
        .O(S[2]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_3
       (.I0(Q[28]),
        .O(S[1]));
  LUT1 #(
    .INIT(2'h1)) 
    Y_carry__0_i_4
       (.I0(Q[27]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_1__0
       (.I0(Q[26]),
        .I1(\count_reg[3] [3]),
        .O(\Q_reg[26]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_2
       (.I0(Q[25]),
        .I1(\count_reg[3] [2]),
        .O(\Q_reg[26]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_3__0
       (.I0(Q[24]),
        .I1(\count_reg[3] [1]),
        .O(\Q_reg[26]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    Y_carry_i_4
       (.I0(Q[23]),
        .I1(\count_reg[3] [0]),
        .O(\Q_reg[26]_0 [0]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized4
   (Q,
    E,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[1] );
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[1] ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [1:0]\FSM_sequential_state_reg_reg[1] ;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized5
   (Q,
    \FSM_sequential_state_reg_reg[1] ,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[1]_0 );
  output [31:0]Q;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;
  input [31:0]D;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[1]_0 ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [1:0]\FSM_sequential_state_reg_reg[1]_0 ;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized6
   (Q,
    \FSM_sequential_state_reg_reg[1] ,
    D,
    CLK,
    \FSM_sequential_state_reg_reg[1]_0 );
  output [31:0]Q;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;
  input [31:0]D;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[1]_0 ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [1:0]\FSM_sequential_state_reg_reg[1]_0 ;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [1]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(\FSM_sequential_state_reg_reg[1] ),
        .CLR(\FSM_sequential_state_reg_reg[1]_0 [0]),
        .D(D[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized7
   (Q,
    E,
    CLK,
    \FSM_sequential_state_reg_reg[1] ,
    D);
  output [20:0]Q;
  input [0:0]E;
  input CLK;
  input [1:0]\FSM_sequential_state_reg_reg[1] ;
  input [19:0]D;

  wire CLK;
  wire [19:0]D;
  wire [0:0]E;
  wire [1:0]\FSM_sequential_state_reg_reg[1] ;
  wire [20:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[9]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [1]),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(1'b1),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(\FSM_sequential_state_reg_reg[1] [0]),
        .D(D[6]),
        .Q(Q[6]));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized8
   (D,
    \Q_reg[31] ,
    Q,
    \Q_reg[29] ,
    \Q_reg[31]_0 ,
    \Q_reg[31]_1 ,
    \Q_reg[31]_2 ,
    \Q_reg[31]_3 ,
    \Q_reg[0]_0 ,
    out,
    \count_reg[1] ,
    CLK,
    \FSM_sequential_state_reg_reg[1] );
  output [31:0]D;
  output [31:0]\Q_reg[31] ;
  input [31:0]Q;
  input [20:0]\Q_reg[29] ;
  input [31:0]\Q_reg[31]_0 ;
  input [31:0]\Q_reg[31]_1 ;
  input [31:0]\Q_reg[31]_2 ;
  input [31:0]\Q_reg[31]_3 ;
  input \Q_reg[0]_0 ;
  input [3:0]out;
  input \count_reg[1] ;
  input CLK;
  input [0:0]\FSM_sequential_state_reg_reg[1] ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]\FSM_sequential_state_reg_reg[1] ;
  wire [31:0]Q;
  wire \Q[0]_i_1_n_0 ;
  wire \Q[1]_i_1__1_n_0 ;
  wire \Q_reg[0]_0 ;
  wire [20:0]\Q_reg[29] ;
  wire [31:0]\Q_reg[31] ;
  wire [31:0]\Q_reg[31]_0 ;
  wire [31:0]\Q_reg[31]_1 ;
  wire [31:0]\Q_reg[31]_2 ;
  wire [31:0]\Q_reg[31]_3 ;
  wire \Q_reg_n_0_[0] ;
  wire \Q_reg_n_0_[1] ;
  wire \count_reg[1] ;
  wire [3:0]out;

  LUT6 #(
    .INIT(64'hFFFFFBFC00000800)) 
    \Q[0]_i_1 
       (.I0(\Q_reg[0]_0 ),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(\Q_reg_n_0_[0] ),
        .O(\Q[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[0]_i_1__1 
       (.I0(Q[0]),
        .I1(\Q_reg[29] [0]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [0]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[0]_i_1__2 
       (.I0(\Q_reg[31]_1 [0]),
        .I1(\Q_reg[31]_2 [0]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [0]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [0]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[10]_i_1__0 
       (.I0(Q[10]),
        .I1(\Q_reg[29] [7]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [10]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[10]_i_1__1 
       (.I0(\Q_reg[31]_1 [10]),
        .I1(\Q_reg[31]_2 [10]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [10]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [10]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[11]_i_1__0 
       (.I0(Q[11]),
        .I1(\Q_reg[29] [8]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [11]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[11]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[11]_i_1__1 
       (.I0(\Q_reg[31]_1 [11]),
        .I1(\Q_reg[31]_2 [11]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [11]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [11]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[12]_i_1__0 
       (.I0(Q[12]),
        .I1(\Q_reg[29] [9]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [12]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[12]_i_1__1 
       (.I0(\Q_reg[31]_1 [12]),
        .I1(\Q_reg[31]_2 [12]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [12]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [12]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[13]_i_1 
       (.I0(Q[13]),
        .I1(\Q_reg[29] [12]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [13]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[13]_i_1__0 
       (.I0(\Q_reg[31]_1 [13]),
        .I1(\Q_reg[31]_2 [13]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [13]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [13]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[14]_i_1__0 
       (.I0(Q[14]),
        .I1(\Q_reg[29] [10]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [14]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[14]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[14]_i_1__1 
       (.I0(\Q_reg[31]_1 [14]),
        .I1(\Q_reg[31]_2 [14]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [14]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [14]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[15]_i_1 
       (.I0(Q[15]),
        .I1(\Q_reg[29] [13]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [15]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[15]_i_1__0 
       (.I0(\Q_reg[31]_1 [15]),
        .I1(\Q_reg[31]_2 [15]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [15]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [15]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[16]_i_1 
       (.I0(Q[16]),
        .I1(\Q_reg[29] [11]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [16]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[16]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[16]_i_1__0 
       (.I0(\Q_reg[31]_1 [16]),
        .I1(\Q_reg[31]_2 [16]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [16]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [16]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[17]_i_1 
       (.I0(Q[17]),
        .I1(\Q_reg[29] [13]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [17]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[17]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[17]_i_1__0 
       (.I0(\Q_reg[31]_1 [17]),
        .I1(\Q_reg[31]_2 [17]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [17]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [17]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[18]_i_1 
       (.I0(Q[18]),
        .I1(\Q_reg[29] [12]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [18]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[18]_i_1__0 
       (.I0(\Q_reg[31]_1 [18]),
        .I1(\Q_reg[31]_2 [18]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [18]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [18]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[19]_i_1 
       (.I0(Q[19]),
        .I1(\Q_reg[29] [15]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [19]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[19]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[19]_i_1__0 
       (.I0(\Q_reg[31]_1 [19]),
        .I1(\Q_reg[31]_2 [19]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [19]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [19]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[1]_i_1 
       (.I0(Q[1]),
        .I1(\Q_reg[29] [1]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [1]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[1]_i_1__0 
       (.I0(\Q_reg[31]_1 [1]),
        .I1(\Q_reg[31]_2 [1]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [1]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [1]));
  LUT6 #(
    .INIT(64'hFFFFFBFC00000800)) 
    \Q[1]_i_1__1 
       (.I0(\count_reg[1] ),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(\Q_reg_n_0_[1] ),
        .O(\Q[1]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[20]_i_1 
       (.I0(Q[20]),
        .I1(\Q_reg[29] [13]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [20]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[20]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[20]_i_1__0 
       (.I0(\Q_reg[31]_1 [20]),
        .I1(\Q_reg[31]_2 [20]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [20]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [20]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[21]_i_1__0 
       (.I0(Q[21]),
        .I1(\Q_reg[29] [14]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [21]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[21]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[21]_i_1__1 
       (.I0(\Q_reg[31]_1 [21]),
        .I1(\Q_reg[31]_2 [21]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [21]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [21]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[22]_i_1__0 
       (.I0(Q[22]),
        .I1(\Q_reg[29] [15]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [22]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[22]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[22]_i_1__1 
       (.I0(\Q_reg[31]_1 [22]),
        .I1(\Q_reg[31]_2 [22]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [22]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [22]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[23]_i_1 
       (.I0(Q[23]),
        .I1(\Q_reg[29] [16]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [23]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[23]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[23]_i_1__0 
       (.I0(\Q_reg[31]_1 [23]),
        .I1(\Q_reg[31]_2 [23]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [23]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [23]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[24]_i_1__0 
       (.I0(Q[24]),
        .I1(\Q_reg[29] [17]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [24]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[24]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[24]_i_1__1 
       (.I0(\Q_reg[31]_1 [24]),
        .I1(\Q_reg[31]_2 [24]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [24]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [24]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[25]_i_1__0 
       (.I0(Q[25]),
        .I1(\Q_reg[29] [18]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [25]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[25]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[25]_i_1__1 
       (.I0(\Q_reg[31]_1 [25]),
        .I1(\Q_reg[31]_2 [25]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [25]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [25]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[26]_i_1__0 
       (.I0(Q[26]),
        .I1(\Q_reg[29] [19]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [26]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[26]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[26]_i_1__1 
       (.I0(\Q_reg[31]_1 [26]),
        .I1(\Q_reg[31]_2 [26]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [26]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [26]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[27]_i_1 
       (.I0(Q[27]),
        .I1(\Q_reg[29] [20]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [27]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[27]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[27]_i_1__0 
       (.I0(\Q_reg[31]_1 [27]),
        .I1(\Q_reg[31]_2 [27]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [27]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [27]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[28]_i_1 
       (.I0(Q[28]),
        .I1(\Q_reg[29] [20]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [28]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[28]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[28]_i_1__0 
       (.I0(\Q_reg[31]_1 [28]),
        .I1(\Q_reg[31]_2 [28]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [28]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [28]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[29]_i_1 
       (.I0(Q[29]),
        .I1(\Q_reg[29] [20]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [29]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[29]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[29]_i_1__0 
       (.I0(\Q_reg[31]_1 [29]),
        .I1(\Q_reg[31]_2 [29]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [29]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [29]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[2]_i_1 
       (.I0(Q[2]),
        .I1(\Q_reg[29] [2]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [2]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[2]_i_1__0 
       (.I0(\Q_reg[31]_1 [2]),
        .I1(\Q_reg[31]_2 [2]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [2]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [2]));
  LUT4 #(
    .INIT(16'hCA0C)) 
    \Q[30]_i_1__0 
       (.I0(Q[30]),
        .I1(\Q_reg[31]_0 [30]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg_n_0_[0] ),
        .O(D[30]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[30]_i_1__1 
       (.I0(\Q_reg[31]_1 [30]),
        .I1(\Q_reg[31]_2 [30]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [30]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [30]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[31]_i_1__7 
       (.I0(\Q_reg[31]_1 [31]),
        .I1(\Q_reg[31]_2 [31]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [31]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [31]));
  LUT4 #(
    .INIT(16'hCA0C)) 
    \Q[31]_i_2__1 
       (.I0(Q[31]),
        .I1(\Q_reg[31]_0 [31]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg_n_0_[0] ),
        .O(D[31]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[3]_i_1 
       (.I0(Q[3]),
        .I1(\Q_reg[29] [11]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [3]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[3]_i_1__0 
       (.I0(\Q_reg[31]_1 [3]),
        .I1(\Q_reg[31]_2 [3]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [3]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [3]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[4]_i_1__0 
       (.I0(Q[4]),
        .I1(\Q_reg[29] [3]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [4]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[4]_i_1__1 
       (.I0(\Q_reg[31]_1 [4]),
        .I1(\Q_reg[31]_2 [4]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [4]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [4]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[5]_i_1 
       (.I0(Q[5]),
        .I1(\Q_reg[29] [10]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [5]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[5]_i_1__0 
       (.I0(\Q_reg[31]_1 [5]),
        .I1(\Q_reg[31]_2 [5]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [5]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [5]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[6]_i_1__0 
       (.I0(Q[6]),
        .I1(\Q_reg[29] [4]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [6]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[6]_i_1__1 
       (.I0(\Q_reg[31]_1 [6]),
        .I1(\Q_reg[31]_2 [6]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [6]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [6]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[7]_i_1 
       (.I0(Q[7]),
        .I1(\Q_reg[29] [8]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [7]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[7]_i_1__0 
       (.I0(\Q_reg[31]_1 [7]),
        .I1(\Q_reg[31]_2 [7]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [7]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [7]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[8]_i_1__0 
       (.I0(Q[8]),
        .I1(\Q_reg[29] [5]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [8]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[8]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[8]_i_1__1 
       (.I0(\Q_reg[31]_1 [8]),
        .I1(\Q_reg[31]_2 [8]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [8]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [8]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[9]_i_1__0 
       (.I0(Q[9]),
        .I1(\Q_reg[29] [6]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_0 [9]),
        .I4(\Q_reg_n_0_[0] ),
        .O(D[9]));
  LUT5 #(
    .INIT(32'hFA0ACFC0)) 
    \Q[9]_i_1__1 
       (.I0(\Q_reg[31]_1 [9]),
        .I1(\Q_reg[31]_2 [9]),
        .I2(\Q_reg_n_0_[1] ),
        .I3(\Q_reg[31]_3 [9]),
        .I4(\Q_reg_n_0_[0] ),
        .O(\Q_reg[31] [9]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(\Q[0]_i_1_n_0 ),
        .Q(\Q_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\FSM_sequential_state_reg_reg[1] ),
        .D(\Q[1]_i_1__1_n_0 ),
        .Q(\Q_reg_n_0_[1] ));
endmodule

(* ORIG_REF_NAME = "d_ff_en" *) 
module d_ff_en__parameterized9
   (Q,
    E,
    D,
    CLK,
    AR);
  output [31:0]Q;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[24] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[31]),
        .Q(Q[31]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(D[9]),
        .Q(Q[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
