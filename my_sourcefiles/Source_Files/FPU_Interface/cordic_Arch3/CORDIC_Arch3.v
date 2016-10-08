//==================================================================================================
//  Filename      : CORDIC_Arch3.v
//  Created On    : 2016-09-28 14:58:46
//  Last Modified : 2016-10-04 21:14:36
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   :
//
//
//==================================================================================================
//==================================================================================================


`timescale 1ns / 1ps


module CORDIC_Arch3 #(parameter W = 32, parameter EW = 8, parameter SW = 23, parameter SWR=26, parameter EWR = 5)//*/
/*#(parameter W = 64, parameter EW = 11, parameter SW = 52, parameter SWR = 55, parameter EWR = 6) //-- Double Precision */
(
//Input Signals
input wire clk,                         //  Reloj del sistema.
input wire rst,                         //  Señal de reset del sistema.
input wire beg_fsm_cordic,              //  Señal de inicio de la maquina de estados del módulo CORDIC.
input wire ack_cordic,                  //  Señal de acknowledge proveniente de otro módulo que indica que ha recibido el resultado del modulo CORDIC.
input wire operation,                   //  Señal que indica si se realiza la operacion seno(1'b1) o coseno(1'b0).

input wire [W-1:0] data_in,             //  Dato de entrada, contiene el angulo que se desea calcular en radianes.
input wire [1:0] shift_region_flag,     //  Señal que indica si el ángulo a calcular esta fuera del rango de calculo del algoritmo CORDIC.
//input wire [1:0] r_mode,

//Output Signals
output wire ready_cordic,                // Señal de salida que indica que se ha completado el calculo del seno/coseno.
output wire overflow_flag,                  //  Bandera de overflow de la operacion.
output wire underflow_flag,
output wire zero_flag,
output wire busy,
output wire [W-1:0] data_output          // Bus de datos con el valor final del angulo calculado.

);

//localparam d_var = 0;                      //   Valor por defecto que se le carga al contador de variables.
//localparam d_iter = 0;                  //  Valor por defecto que se le carga al contador de iteraciones.
localparam mode = 1'b0;
localparam iter_bits = 4;                  //Modificar valor para obtener diferente cantidad de iteraciones; ejem= 3=8iter, 4=16iter. etc

wire [W-1:0] x0,y0;
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate
    case(W)

    32:
    begin
        assign x0 = 32'h3f1b74ee;                 //    x0 = 0.607252935008881, valor inicial de la variable X.
        assign y0 = 32'h00000000;                 //    y0 = 0, valor inicial de la variable Y.
    end

    64:
    begin
        assign x0 = 64'h3fe36e9db5086bc9;        // x0 = 0.607252935008881, valor inicial de la variable X.
        assign y0 = 64'h0000000000000000;        // y0 = 0, valor inicial de la variable Y.
    end

    default:
    begin
        assign x0 = 32'h3f1b74ee;                   //    x0 = 0.607252935008881, valor inicial de la variable X.
        assign y0 = 32'h00000000;                   //    y0 = 0, valor inicial de la variable Y.
    end
    endcase
endgenerate

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Signal declaration

wire reset_reg_cordic;

//ENABLE
wire enab_d_ff_RB1;                                         //  Enable de la primera linea de registros.
wire enab_d_ff2_RB2;                                        //  Enable de la segunda linea de registros.
wire enab_RB3;                                              //  Enable del registro que guarda el valor del signo, dependiendo del modo del algoritmo.
wire enab_d_ff4_Xn, enab_d_ff4_Yn, enab_d_ff4_Zn;           //  Enable de los registros que guardan los datos provenientes del modulo de suma/resta.
wire enab_d_ff5_data_out;                                   //  Enable del registo que guarda el valor de salida final, listo para enviarse al procesador.
wire enab_cont_iter, enab_cont_var;                         //  Enable de los contadores de variable e iteracion
//wire load_cont_iter, load_cont_var;                         //  Señal de carga de un valor en los contadores de variable e iteraciones.
wire enab_dff_5;



//SELECTION
wire sel_mux_3;                                  //  Señales de seleccion provenientes de la maquina de estados.
wire [1:0] sel_mux_2;                                       //  Señal de seleccion que se activa dependiendo de la variable que se este calculando.

wire sel_mux_1_reg, sel_mux_3_reg;                          //  Señales de seleccion provenientes de la maquina de estados.
wire [1:0] sel_mux_2_reg;                                   //  Señal de seleccion que se activa dependiendo de la variable que se este calculando.

//DATA WIRES
wire d_ff1_operation_out;                                   //  Salida del registro que guarda el dato de entrada de la operacion a realizar, coseno(1'b0) o seno(1'b1)
wire [1:0] d_ff1_shift_region_flag_out;                     //  Salida del registro que guarda el dato de entrada que indica si el ángulo a calcular esta fuera del rango de calculo del algoritmo CORDIC.
wire [W-1:0] d_ff1_Z;                                       //  Salidas de los registros que guardan los valores iniciales de las variables X, Y y Z.
wire [W-1:0] d_ff_Xn, d_ff_Yn, d_ff_Zn;                     //  Salidas de los registros que guardan los valores de las variables X, Y y Z despues de cada iteracion.
wire [W-1:0] first_mux_X, first_mux_Y, first_mux_Z;         //  Salidas de los mux que escogen entre un valor inicial y el valor obtenido en una iteracion.
wire [W-1:0] d_ff2_X, d_ff2_Y, d_ff2_Z;                     //  Salidas de los registros que guardan los valores provenientes de la primera linea de mux.
wire sign;                                                  //  Salida del mux que escoge entre el signo de Y o Z, dependiendo del modo, ya sea rotacion o vectorizacion.
wire [W-1:0] data_out_LUT;                                  //  Salida del modulo generate que genera la LUT necesaria dependiendo del ancho de palabra.
wire [iter_bits-1:0] cont_iter_out;                         //  Salida del contador que cuenta las iteraciones realizadas.
wire [EW-1:0] sh_exp_x, sh_exp_y;                           //  Salidas de los sumadores de punto fijo que realizan los desplazamientos.
wire [W-1:0] d_ff3_sh_x_out, d_ff3_sh_y_out;                //  Salida del registro que guarda el valor de X y Y luego de realizar los desplazamientos.
wire [W-1:0] d_ff3_LUT_out;                                 //  Salida del registro que guarda el valor de la LUT.
wire d_ff3_sign_out;                                        //  Salida del registro que guarda el valor del signo.
wire [1:0] cont_var_out;                                    //  Salida del contador que cuenta las variables calculadas.
wire [W-1:0] mux_sal;                                       //  Salida del mux final para colocar en la salida el valor deseado.
wire [W-1:0] data_output2;                                  //  Salida del registro antes del cambio de signo.
wire [W-1:0] fmtted_Result;                                  //  Salida del modulo de inversion de signo, dependiendo de si se el angulo de entrada estaba fuera del rango de calculo del algoritmo CORDIC.
wire min_tick_iter,max_tick_iter;                           //  Señales que indican cuando se ha alcanzado el valor mas bajo y masalto de cuenta, correspondientemente en el contador de iteraciones.
wire min_tick_var,max_tick_var;                             //  Señales que indican cuando se ha alcanzado el valor mas bajo y masalto de cuenta, correspondientemente en el contador de variables.
//wire enab_reg_sel_mux1,enab_reg_sel_mux2,enab_reg_sel_mux3;
wire ready_add_subt;                                        //  Señal que indica que se ha realizado la operacion de suma/resta en punto flotante.
wire [W-1:0] result_add_subt;                               //  Dato de entrada, contiene el resultado del módulo de suma/resta.
wire beg_add_subt;                                          //  Señal de salida que indica que se debe de iniciar el modulo de suma/resta.
wire ack_add_subt;                                          //  Señal que le indica al modulo de suma/resta que se recibio el resultado de este modulo correctamente.
wire op_add_subt;                                           //  Señal hacia el módulo de suma/resta que indica si se va a realizar una suma(1'b0) o una resta(1'b1).
wire [W-1:0] add_subt_dataA;                                //  Bus de datos hacia el modulo de suma/resta con el valor al que se le desea aplicar dicha operacion.
wire [W-1:0] add_subt_dataB;                                //  Bus de datos hacia el modulo de suma/resta con el valor al que se le desea aplicar dicha operacion.

//Instanciación
//------------------------------------------------------------------------------------------------------------------------
//FSM


    CORDIC_FSM_v3 inst_CORDIC_FSM_v3
        (
            .clk                 (clk),
            .reset               (rst),
            .beg_FSM_CORDIC      (beg_fsm_cordic),
            .ACK_FSM_CORDIC      (ack_cordic),
            .exception           (1'b0),
            .max_tick_iter       (max_tick_iter),
            .max_tick_var        (max_tick_var),
            .enab_dff_z          (enab_d_ff4_Zn),
            .reset_reg_cordic    (reset_reg_cordic),
            .ready_CORDIC        (ready_cordic),
            .beg_add_subt        (beg_add_subt),
            .enab_cont_iter      (enab_cont_iter),
            .enab_cont_var       (enab_cont_var),
            .enab_RB1            (enab_d_ff_RB1),
            .enab_RB2            (enab_d_ff2_RB2),
            .enab_RB3            (enab_RB3),
            .enab_d_ff5_data_out (enab_d_ff5_data_out)
        );


  Up_counter #(.COUNTER_WIDTH(iter_bits)
    ) ITER_CONT (
      .clk        (clk),
      .rst        (reset_reg_cordic),
      .enable     (enab_cont_iter),
      .c_output_W (cont_iter_out)
    );

    assign max_tick_iter = (cont_iter_out == ((2**iter_bits)-1)) ? 1'b1 : 1'b0;
    assign min_tick_iter = (cont_iter_out == 0) ? 1'b1 : 1'b0;

//Son dos, ya que son 3 variables a ser operadas por el FPADD

  Up_counter #(.COUNTER_WIDTH(2)
    ) VAR_CONT (
      .clk        (clk),
      .rst        (rst),
      .enable     (ready_add_subt|enab_cont_var),
      .c_output_W (cont_var_out)
    );

    assign max_tick_var = (cont_var_out == 2**2-1) ? 1'b1 : 1'b0;


//--------------------------------------------------------------------------------------------------------------------------------------------------------
//Primera Etapa:  Registros que guardan los valores iniciales.

        d_ff_en # (.W(1)) reg_operation
        (
        .clk(clk),//system clock
        .rst(rst), //system reset
        .enable(enab_d_ff_RB1), //load signal
        .D(operation), //input signal
        .Q(d_ff1_operation_out) //output signal
        );

        d_ff_en # (.W(2)) reg_region_flag
        (
        .clk(clk),//system clock
        .rst(rst), //system reset
        .enable(enab_d_ff_RB1), //load signal
        .D(shift_region_flag), //input signal
        .Q(d_ff1_shift_region_flag_out) //output signal
        );

        d_ff_en # (.W(W)) reg_Z0
        (
        .clk(clk),//system clock
        .rst(rst), //system reset
        .enable(enab_d_ff_RB1), //load signal
        .D(data_in), //input signal
        .Q(d_ff1_Z) //output signal
        );

//--------------------------------------------------------------------------------------------------------------------------------------------------------
//Segunda Etapa : Registros que guardan el canal elegido para el mux, asi como los mux.


        Mux_2x1 #(.W(W)) mux1_x0
        (
        .select(~min_tick_iter),
        .ch_0(x0),
        .ch_1(d_ff_Xn),
        .data_out(first_mux_X)
        );

        Mux_2x1 #(.W(W)) mux1_y0
        (
        .select(~min_tick_iter),
        .ch_0(y0),
        .ch_1(d_ff_Yn),
        .data_out(first_mux_Y)
        );

        Mux_2x1 #(.W(W)) mux1_z0
        (
        .select(~min_tick_iter),
        .ch_0(d_ff1_Z),
        .ch_1(d_ff_Zn),
        .data_out(first_mux_Z)
        );

//----------------------------------------------------------------------------------------------------------------------
//Tercera Etapa: Registros que guardan los datos provenientes de los mux.

        d_ff_en # (.W(W)) reg_val_muxX_2stage
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_d_ff2_RB2), //load signal
        .D(first_mux_X), //input signal
        .Q(d_ff2_X) //output signal
        );

        d_ff_en # (.W(W)) reg_val_muxY_2stage
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_d_ff2_RB2), //load signal
        .D(first_mux_Y), //input signal
        .Q(d_ff2_Y) //output signal
        );

        d_ff_en # (.W(W)) reg_val_muxZ_2stage
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_d_ff2_RB2), //load signal
        .D(first_mux_Z), //input signal
        .Q(d_ff2_Z) //output signal
        );

//----------------------------------------------------------------------------------------------------------------------
//Cuarta Etapa : Restadores para el corrimiento del exponente de X y Y, Lookup-Table y mux de signo dependiendo del modo.

        Simple_Subt #(.W(EW),.N(iter_bits)) shift_x
        (
        .A(d_ff2_X[W-2:SW]),
        .B(cont_iter_out),
        .Y(sh_exp_x)
        );

        Simple_Subt #(.W(EW),.N(iter_bits)) shift_y
        (
        .A(d_ff2_Y[W-2:SW]),
        .B(cont_iter_out),
        .Y(sh_exp_y)
        );

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate
    case(W)
    32:
    begin
        LUT_ROM_32bits #(.W(W),.N(iter_bits)) LUT32
        (
        .address(cont_iter_out),
        .data_out(data_out_LUT)
        );
    end
    64:
    begin
        LUT_ROM_64bits #(.W(W),.N(iter_bits)) LUT64
        (
        .address(cont_iter_out),
        .data_out(data_out_LUT)
        );
    end
    default:
    begin
        LUT_ROM_32bits #(.W(W),.N(iter_bits)) LUT32
        (
        .address(cont_iter_out),
        .data_out(data_out_LUT)
        );
    end
    endcase
endgenerate

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        Mux_2x1 #(.W(1)) mux_sign
        (
        .select(mode),
        .ch_0(d_ff2_Z[W-1]),
        .ch_1(d_ff2_Y[W-1]),
        .data_out(sign)
        );

//-------------------------------------------------------------------------------------------------------------------------
//Quinta Etapa : Registros que guardan los datos provenientes de la etapa anterior.

        d_ff_en # (.W(W)) reg_shift_x
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_RB3), //load signal
        .D({d_ff2_X[W-1],sh_exp_x,d_ff2_X[SW-1:0]}), //input signal
        .Q(d_ff3_sh_x_out) //output signal
        );

        d_ff_en # (.W(W)) reg_shift_y
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_RB3), //load signal
        .D({d_ff2_Y[W-1],sh_exp_y,d_ff2_Y[SW-1:0]}), //input signal
        .Q(d_ff3_sh_y_out) //output signal
        );

        d_ff_en # (.W(W)) reg_LUT
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_RB3), //load signal
        .D(data_out_LUT), //input signal
        .Q(d_ff3_LUT_out) //output signal
        );

        d_ff_en # (.W(1)) reg_sign
        (
        .clk(clk),//system clock
        .rst(reset_reg_cordic), //system reset
        .enable(enab_RB3), //load signal
        .D(sign), //input signal
        .Q(d_ff3_sign_out) //output signal
        );

//-------------------------------------------------------------------------------------------------------------------------------------------------------
//Sexta Etapa : Mux de 3 canales que se activan dependiendo de la variable a calcular.


    Mux_3x1_bv2 #(.W(W)) mux_3x1_var1
    (
        .select(cont_var_out),
        .ch_0(d_ff2_X),
        .ch_1(d_ff2_Y),
        .ch_2(d_ff2_Z),
        .data_out(add_subt_dataA)
    );

    Mux_3x1_bv2 #(.W(W)) mux_3x1_var2
    (
        .select(cont_var_out),
        .ch_0(d_ff3_sh_y_out),
        .ch_1(d_ff3_sh_x_out),
        .ch_2(d_ff3_LUT_out),
        .data_out(add_subt_dataB)
    );

    PriorityEncoder_CORDIC inst_PriorityEncoder_CORDIC (
        .enable(ready_add_subt),
        .Data_i(cont_var_out),
        .Data_o({enab_d_ff4_Zn,enab_d_ff4_Yn,enab_d_ff4_Xn})
        );

    Op_Select   op_select_mod
    (
        .variable(~cont_var_out[0]),
        .sign(d_ff3_sign_out),
        .operation(op_add_subt)
    );

//--------------------------------------------------------------------------------------------------------------------------------
//Septima Etapa : Instanciamiento del módulo de suma y resta.


    FPU_PIPELINED_FPADDSUB #(
            .W(W),
            .EW(EW),
            .SW(SW),
            .SWR(SWR),
            .EWR(EWR)
        ) inst_FPU_PIPELINED_FPADDSUB (
            .clk               (clk),
            .rst               (rst|enab_cont_iter),
           // .beg_OP            (enab_cont_var),
            .beg_OP            (beg_add_subt),
            .Data_X            (add_subt_dataA),
            .Data_Y            (add_subt_dataB),
            .add_subt          (op_add_subt),
            .busy              (busy),
            .overflow_flag     (overflow_flag),
            .underflow_flag    (underflow_flag),
            .zero_flag         (zero_flag),
            .ready             (ready_add_subt),
            .final_result_ieee (result_add_subt)
        );


//-------------------------------------------------------------------------------------------------------------------------------
//Octava Etapa: Registros que guardan los valores de calculo del modulo de suma y resta.

    d_ff_en #(.W(W)) d_ff4_Xn
    (
    .clk(clk),
    .rst(reset_reg_cordic),
    .enable(enab_d_ff4_Xn),
    .D(result_add_subt),
    .Q(d_ff_Xn)
    );

    d_ff_en #(.W(W)) d_ff4_Yn
    (
    .clk(clk),
    .rst(reset_reg_cordic),
    .enable(enab_d_ff4_Yn),
    .D(result_add_subt),
    .Q(d_ff_Yn)
    );

    d_ff_en #(.W(W)) d_ff4_Zn
    (
    .clk(clk),
    .rst(reset_reg_cordic),
    .enable(enab_d_ff4_Zn),
    .D(result_add_subt),
    .Q(d_ff_Zn)
    );

//--------------------------------------------------------------------------------------------------------------------------------
//Novena Etapa: Mux de selección del valor de salida, así como el modulo de correccion de signo y los registros intermedios que
//guardan los datos de salida.

//Aca se decodifica el signo del resultado final
//y ademas se decodifica cual resultado vamos a escoger.

    Mux_2x1     #(
        .W(W)
        ) mux_2x1_sal (
            .select   (sel_mux_3),
            .ch_0     (d_ff_Xn),
            .ch_1     (d_ff_Yn),
            .data_out (mux_sal)
        );

    DECO_CORDIC_EXT #(
            .W(W)
        ) inst_DECO_CORDIC_EXT (
            .data_i            (mux_sal),
            .operation         (d_ff1_operation_out),
            .shift_region_flag (d_ff1_shift_region_flag_out),
            .sel_mux_3         (sel_mux_3),
            .data_out          (fmtted_Result)
        );

    d_ff_en #(.W(W)) d_ff5_data_out
    (
    .clk(clk),
    .rst(reset_reg_cordic),
    .enable(enab_d_ff5_data_out),
    .D(fmtted_Result),
    .Q(data_output)
    );

endmodule
