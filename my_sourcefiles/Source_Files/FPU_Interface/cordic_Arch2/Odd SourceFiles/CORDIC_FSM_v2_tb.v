`timescale 1ns / 1ps

module CORDIC_FSM_v2_tb;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//declaration of signals
//Input Signals 
reg clk;												//	Reloj del sitema.
reg reset;												//	Reset del sitema.
reg beg_FSM_CORDIC;										//	Señal de inicio de la maquina de estados.
reg ACK_FSM_CORDIC;										//	Señal proveniente del modulo que recibe el resultado, indicado que el dato ha sido recibido.
reg operation;											//	Señal que determina si lo que se requiere es realizar un coseno(1´b0) o seno (1'b1).
reg [1:0] shift_region_flag;							//	Señal que indica si el angulo a calcular se encuentra fuera del rango de calculo del algoritmo CORDIC.
reg [1:0] cont_var;										//	Señal que indica cual varible se va a calcular. Proveniente del contador de variables.
reg ready_add_subt;										//	Señal proveniente del módulo de suma/resta, indica que se ha terminado la operacion y que se puede disponer del resultado de dicho modulo.
reg max_tick_iter;
reg min_tick_iter;										//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de iteraciones.
reg max_tick_var;
reg min_tick_var;										//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de variables.

//Output Signals
wire reset_reg_cordic;
wire ready_CORDIC;										//	Señal que indica que el calculo CORDIC se ha terminado.
wire beg_add_subt;										//	Señal que indica al modulo de suma/resta que inicie su operacion.
wire ack_add_subt;										//	Señal que le indica al modulo de suma/resta que se ha recibido exitosamente el resultado que este entrega.
wire sel_mux_1;
wire sel_mux_3;											//	Señales de seleccion de mux, la primera escoge el canal 0 si es la primera iteracion, en otro caso escoge el canal 1, y la segunda escoge cual variable (X o Y) debe aparecer a la salida.
wire [1:0] sel_mux_2;									//	Señal de seleccion de mux, que escoge entre X, Y o Z dependiendo de cual variable se deba calcular en ese momento.
wire mode;												//	1'b0 si el modo es rotacion(signo de Y), 1'b1 si el modo es vectorizacion(signo de Z).
wire enab_cont_iter;
wire load_cont_iter;									//	Señales de habilitacion y carga, respectivamente, en el contador de iteraciones.
wire enab_cont_var;
wire load_cont_var;										//	Señales de habilitacion y carga, respectivamente, en el contador de variables.
wire enab_RB1;
wire enab_RB2;											//	Señales de habilitacion para los registros de variables de entrada y para los valores de las variables despues de los primeros mux, respectivamente.
wire enab_d_ff_Xn;
wire enab_d_ff_Yn;
wire enab_d_ff_Zn;										//	Señales de habilitacion para los registros que guardan los resultados de cada variable en cada iteracion provenientes del modulo de suma/resta.

wire enab_d_ff_out;										//	Señales de habilitacion para los registros en la salida, el primero antes del cambio de signo y el segundo es el que se encuentra en la salida.
wire enab_dff_shifted_x;
wire enab_dff_shifted_y;								//	Señales de habilitacion para los registros que guardan el valor de las variables X y Y luego de realizarles los desplazamientos.
wire enab_dff_LUT;
wire enab_dff_sign;										//	Señales de habilitacion para los registros	que guardan los valores provenientes de la look-up table y del signo, respectivamente.

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//Instantiation of the FSM

CORDIC_FSM_v2 cordic_fsm_v2
(
//Input Signals 
.clk(clk),												//	Reloj del sitema.
.reset(reset),											//	Reset del sitema.
.beg_FSM_CORDIC(beg_FSM_CORDIC),						//	Señal de inicio de la maquina de estados.
.ACK_FSM_CORDIC(ACK_FSM_CORDIC),						//	Señal proveniente del modulo que recibe el resultado, indicado que el dato ha sido recibido.
.operation(operation),									//	Señal que determina si lo que se requiere es realizar un coseno(1´b0) o seno (1'b1).
.shift_region_flag(shift_region_flag),					//	Señal que indica si el angulo a calcular se encuentra fuera del rango de calculo del algoritmo CORDIC.
.cont_var(cont_var),									//	Señal que indica cual varible se va a calcular. Proveniente del contador de variables.
.ready_add_subt(ready_add_subt),						//	Señal proveniente del módulo de suma/resta, indica que se ha terminado la operacion y que se puede disponer del resultado de dicho modulo.
.max_tick_iter(max_tick_iter),
.min_tick_iter(min_tick_iter),							//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de iteraciones.
.max_tick_var(max_tick_var),
.min_tick_var(min_tick_var),							//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de variables.

//Output Signals
.reset_reg_cordic(reset_reg_cordic),
.ready_CORDIC(ready_CORDIC),							//	Señal que indica que el calculo CORDIC se ha terminado.
.beg_add_subt(beg_add_subt),							//	Señal que indica al modulo de suma/resta que inicie su operacion.
.ack_add_subt(ack_add_subt),							//	Señal que le indica al modulo de suma/resta que se ha recibido exitosamente el resultado que este entrega.
.sel_mux_1(sel_mux_1), 
.sel_mux_3(sel_mux_3),									//	Señales de seleccion de mux, la primera escoge el canal 0 si es la primera iteracion, en otro caso escoge el canal 1, y la segunda escoge cual variable (X o Y) debe aparecer a la salida.
.sel_mux_2(sel_mux_2),									//	Señal de seleccion de mux, que escoge entre X, Y o Z dependiendo de cual variable se deba calcular en ese momento.
.mode(mode),											//	1'b0 si el modo es rotacion(signo de Y), 1'b1 si el modo es vectorizacion(signo de Z).
.enab_cont_iter(enab_cont_iter),
.load_cont_iter(load_cont_iter),						//	Señales de habilitacion y carga, respectivamente, en el contador de iteraciones.
.enab_cont_var(enab_cont_var),
.load_cont_var(load_cont_var),							//	Señales de habilitacion y carga, respectivamente, en el contador de variables.
.enab_RB1(enab_RB1),
.enab_RB2(enab_RB2),									//	Señales de habilitacion para los registros de variables de entrada y para los valores de las variables despues de los primeros mux, respectivamente.
.enab_d_ff_Xn(enab_d_ff_Xn),
.enab_d_ff_Yn(enab_d_ff_Yn),
.enab_d_ff_Zn(enab_d_ff_Zn),							//	Señales de habilitacion para los registros que guardan los resultados de cada variable en cada iteracion provenientes del modulo de suma/resta.

.enab_d_ff_out(enab_d_ff_out),							//	Señales de habilitacion para los registros en la salida, el primero antes del cambio de signo y el segundo es el que se encuentra en la salida.
.enab_dff_shifted_x(enab_dff_shifted_x),
.enab_dff_shifted_y(enab_dff_shifted_y),				//	Señales de habilitacion para los registros que guardan el valor de las variables X y Y luego de realizarles los desplazamientos.
.enab_dff_LUT(enab_dff_LUT),
.enab_dff_sign(enab_dff_sign)							//	Señales de habilitacion para los registros	que guardan los valores provenientes de la look-up table y del signo, respectivamente.
);

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//Generation of the clock
initial
begin
	clk = 1;
	forever #5 clk = ~clk;
end

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//Stimulus specification

initial
begin
	//inicializacion de señales
	reset = 0;
	beg_FSM_CORDIC = 0;
	ACK_FSM_CORDIC = 0;
	operation = 0;
	shift_region_flag = 2'b10;
	cont_var = 2'b00;
	ready_add_subt = 0;
	max_tick_iter = 0;
	min_tick_iter = 0;
	max_tick_var = 0;
	min_tick_var = 0;

	#100
	reset = 1;
	operation = 0;
	shift_region_flag = 2'b00;
	
	#10
	reset = 0;
	
	#10
	beg_FSM_CORDIC = 1;
	min_tick_iter = 1;
	min_tick_var = 1;
	
	#10
	beg_FSM_CORDIC = 0;
	
	
	#55
	ready_add_subt = 1;
	
	#10
	ready_add_subt = 0;
	min_tick_var = 0;
	cont_var = 2'b01;
	
	#25
	ready_add_subt = 1;
	
	#30
	ready_add_subt = 0;
	cont_var = 2'b10;
	max_tick_var = 1;
	
	#35
	ready_add_subt = 1;
	
	#10
	ready_add_subt = 0;
	min_tick_iter = 0;
	
	
	#25
	max_tick_var = 0;
	min_tick_var = 0;
	max_tick_iter = 1;
	
	#5
	max_tick_var = 1;
	
	#30
	ready_add_subt = 1;
	
	#10
	ready_add_subt = 0;
	
	#40
	ACK_FSM_CORDIC = 1'b1;

	#100 $stop;
end

endmodule
