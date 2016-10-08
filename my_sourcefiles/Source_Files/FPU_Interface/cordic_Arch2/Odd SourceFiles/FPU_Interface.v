`timescale 1ns / 1ps

module FPU_Interface #(parameter W = 64, EW = 11, SW = 52, SWR = 55, EWR = 6, S_Exp=12)
(
//Input Signals
input wire clk,
input wire rst,
input wire begin_operation,
input wire ack_operation,
input wire [2:0] operation,
input wire [1:0] region_flag,
input wire [W-1:0] Data_1,
//input wire [W-1:0] Data_2,
input wire [1:0] r_mode,
//Output Signals
output wire overflow_flag,
output wire underflow_flag,
output wire NaN_flag,
output wire operation_ready,
output wire [W-1:0] op_result
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
d_ff_en	# (.W(2)) operation_dff
(
.clk(clk),//system clock
.rst(rst), //system reset
.enable(1'b1), //load signal
.D(operation[2:1]), //input signal
.Q(operation_reg) //output signal
);
d_ff_en	# (.W(W)) reg_dataA
(
.clk(clk),//system clock
.rst(rst), //system reset
.enable(1'b1), //load signal
.D(Data_1), //input signal
.Q(dataA) //output signal
);
d_ff_en	# (.W(W)) reg_dataB
(
.clk(clk),//system clock
.rst(rst), //system reset
.enable(1'b1), //load signal
.D(Data_1), //input signal
.Q(dataB) //output signal
);
generate
    case(W)    
    32:
    begin    
        NaN_mod_32 NaN_flag_32
        (
        .operation(operation_reg),
        .data1(dataA),
        .data2(dataB),
        .NaN_flag(NaN_reg)
         );
     end     
     64:
     begin
        NaN_mod_64 NaN_flag_64
        (
        .operation(operation_reg),
        .data1(dataA),
        .data2(dataB),
        .NaN_flag(NaN_reg)
         );
     end     
     default:
     begin
         NaN_mod_32 NaN_flag_32
         (
         .operation(operation_reg),
         .data1(dataA),
         .data2(dataB),
         .NaN_flag(NaN_reg)
          );
     end     
     endcase
endgenerate
d_ff_en	# (.W(1)) NaN_dff
(
.clk(clk),//system clock
.rst(rst), //system reset
.enable(1'b1), //load signal
.D(NaN_reg), //input signal
.Q(NaN_flag) //output signal
);
//----------------------------------------------------------------------------------------------------------------------------
demux_1x3 demux_beg_op
(
.data(begin_operation),
.select(operation[2:1]),
.ch1(beg_fsm_addsubt),
.ch2(beg_fsm_cordic),
.ch3(beg_fsm_mult)
);
demux_1x3 demux_ack_op
(
.data(ack_operation),
.select(operation[2:1]),
.ch1(ack_fsm_addsubt),
.ch2(ack_fsm_cordic),
.ch3(ack_fsm_mult)
);
deco_op deco_operation
(
.operation(operation[1:0]),
.op_mod_add_subt(op_mod_add_subt),
.op_mod_cordic(op_mod_cordic)
);
Mux_2x1 #(.W(1)) mux_beg_addsubt
(
.select(operation[1]),
.ch_0(beg_fsm_addsubt),
.ch_1(beg_add_subt_cordic),
.data_out(beg_add_subt)
);
Mux_2x1 #(.W(1)) mux_ack_addsubt
(
.select(operation[1]),
.ch_0(ack_fsm_addsubt),
.ch_1(ack_add_subt_cordic),
.data_out(ack_add_subt)
);
Mux_2x1 #(.W(1)) mux_operation_add_cordic
(
.select(operation[1]),
.ch_0(op_mod_add_subt),
.ch_1(op_addsubt_cordic),
.data_out(op_addsubt)
);
Mux_2x1 #(.W(W)) mux_data_in1
(
.select(operation[1]),
.ch_0(Data_1),
.ch_1(add_subt_dataA),
.data_out(add_subt_data1)
);
Mux_2x1 #(.W(W)) mux_data_in2
(
.select(operation[1]),
.ch_0(Data_1),
.ch_1(add_subt_dataB),
.data_out(add_subt_data2)
);
//----------------------------------------------------------------------------------------------------------------------------
FPU_Add_Subtract_Function	#(.W(W),.EW(EW),.SW(SW),.SWR(SWR),.EWR(EWR)) add_subt_module
(
.clk(clk),
.rst(rst),
.beg_FSM(beg_add_subt),
.rst_FSM(ack_add_subt),
.Data_X(add_subt_data1),
.Data_Y(add_subt_data2),
.add_subt(op_addsubt),
.r_mode(r_mode),
.overflow_flag(overflow_flag_addsubt),
.underflow_flag(underflow_flag_addsubt),
.ready(ready_add_subt),
.final_result_ieee(result_add_subt)
);
//----------------------------------------------------------------------------------------------------------------------------
CORDIC_Arch #(.W(W), .EW(EW), .SW(SW)) CORDIC_SineCOsine
/*#(parameter W = 64, EW = 11, SW = 52) //-- Double Precision */
(
.clk(clk),                         //	Reloj del sistema.
.rst(rst),                         //	Señal de reset del sistema.
.beg_fsm_cordic(beg_fsm_cordic),   //	Señal de inicio de la maquina de estados del módulo CORDIC.
.ack_cordic(ack_fsm_cordic),       //	Señal de acknowledge proveniente de otro módulo que indica que ha recibido el resultado del modulo CORDIC.
.operation(op_mod_cordic),		   //	Señal que indica si se realiza la operacion seno(1'b1) o coseno(1'b0).
//.violation_flag(),
//.overflow_flag(),                  //	Bandera de overflow de la operacion.
//.underflow_flag(),			       //	Bandera de underflow de la operacion.
//.NaN_Flag(),
.data_in(Data_1),                 //	Dato de entrada, contiene el angulo que se desea calcular en radianes.
.shift_region_flag(region_flag),     //	Señal que indica si el ángulo a calcular esta fuera del rango de calculo del algoritmo CORDIC.
.ready_add_subt(ready_add_subt),              //	Señal que indica que se ha realizado la operacion de suma/resta en punto flotante.
.result_add_subt(result_add_subt),     //	Dato de entrada, contiene el resultado del módulo de suma/resta.
.ready_cordic(ready_cordic),                //	Señal de salida que indica que se ha completado el calculo del seno/coseno.
.beg_add_subt(beg_add_subt_cordic),                //	Señal de salida que indica que se debe de iniciar el modulo de suma/resta.
.ack_add_subt(ack_add_subt_cordic),                //	Señal que le indica al modulo de suma/resta que se recibio el resultado de este modulo correctamente.
.op_add_subt(op_addsubt_cordic),                 //	Señal hacia el módulo de suma/resta que indica si se va a realizar una suma(1'b0) o una resta(1'b1).
.add_subt_dataA(add_subt_dataA),      //	Bus de datos hacia el modulo de suma/resta con el valor al que se le desea aplicar dicha operacion.
.add_subt_dataB(add_subt_dataB),      //	Bus de datos hacia el modulo de suma/resta con el valor al que se le desea aplicar dicha operacion.
.data_output(cordic_result)          //	Bus de datos con el valor final del angulo calculado.
);
//----------------------------------------------------------------------------------------------------------------------------
FPU_Multiplication_Function #(.W(W),.W_Exp(EW),.W_Sgf(SW),.S_Exp(S_Exp)) multipl_fpu
(
.clk(clk),
.rst(rst),
.beg_FSM(beg_fsm_mult),
.rst_FSM(ack_fsm_mult),		
.Data_MX(Data_1),
.Data_MY(Data_1),
.round_mode(r_mode),		
.overflow_flag(overflow_flag_mult),
.underflow_flag(underflow_flag_mult),
.ready_flag(ready_mult),
.F_ieee_result(mult_result)
);
//----------------------------------------------------------------------------------------------------------------------------
Mux_2x1 #(.W(1)) overflow_flag_mux
(
.select(operation[2]),
.ch_0(overflow_flag_addsubt),
.ch_1(overflow_flag_mult),
.data_out(overflow_flag)
);
Mux_2x1 #(.W(1)) underflow_flag_mux
(
.select(operation[2]),
.ch_0(underflow_flag_addsubt),
.ch_1(underflow_flag_mult),
.data_out(underflow_flag)
);
Mux_3x1_b #(.W(1)) mux_ready_op
(
.select(operation[2:1]),
.ch_0(ready_add_subt),
.ch_1(ready_cordic),
.ch_2(ready_mult),
.data_out(operation_ready)
);
Mux_3x1_b #(.W(W)) mux_result_op
(
.select(operation[2:1]),
.ch_0(result_add_subt),
.ch_1(cordic_result),
.ch_2(mult_result),
.data_out(op_result)
);
endmodule
