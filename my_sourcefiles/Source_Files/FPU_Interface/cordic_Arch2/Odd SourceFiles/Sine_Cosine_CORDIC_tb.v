`timescale 1ns / 1ps

module Sine_Cosine_CORDIC_tb;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameter W=32, W_Exp = 8, W_Sgf = 23,  S_Exp = 9;

//declaration of signals
//Input Signals
reg clk;                         						//	Reloj del sistema.
reg rst;													//	Señal de reset del sistema.
reg beg_fsm_cordic;              						//	Señal de inicio de la maquina de estados del módulo CORDIC.
reg ack_cordic;                  						//	Señal de acknowledge proveniente de otro módulo que indica que ha recibido el resultado del modulo CORDIC.
reg operation;											//	Señal que indica si se realiza la operacion seno(1'b1) o coseno(1'b0).

reg [W-1:0] data_in;             						//	Dato de entrada, contiene el angulo que se desea calcular en radianes.
reg [1:0] shift_region_flag;     						//	Señal que indica si el ángulo a calcular esta fuera del rango de calculo del algoritmo CORDIC.

//Output Signals
wire ready_cordic;                						//	Señal de salida que indica que se ha completado el calculo del seno/coseno.
wire [W-1:0] data_output;          						//	Bus de datos con el valor final del angulo calculado.

wire overflow_flag;										//	Bandera de overflow de la operacion.
wire underflow_flag;									//	Bandera de underflow de la operacion.



//integer i;

Sine_Cosine_CORDIC #(.W(W),.W_Exp(W_Exp),.W_Sgf(W_Sgf),.S_Exp(S_Exp)) Sine_Cosine_CORDIC_dut //Single Precision */ # (parameter W = 64, W_Exp = 11, W_Sgf = 52, S_Exp = 12) //-- Double Precision */
(
//Input Signals
.clk(clk),                         						//	Reloj del sistema.
.rst(rst),												//	Señal de reset del sistema.
.beg_fsm_cordic(beg_fsm_cordic),              			//	Señal de inicio de la maquina de estados del módulo CORDIC.
.ack_cordic(ack_cordic),                  				//	Señal de acknowledge proveniente de otro módulo que indica que ha recibido el resultado del modulo CORDIC.
.operation(operation),									//	Señal que indica si se realiza la operacion seno(1'b1) o coseno(1'b0).

.data_in(data_in),             							//	Dato de entrada, contiene el angulo que se desea calcular en radianes.
.shift_region_flag(shift_region_flag),     				//	Señal que indica si el ángulo a calcular esta fuera del rango de calculo del algoritmo CORDIC.

//Output Signals
.ready_cordic(ready_cordic),                			//	Señal de salida que indica que se ha completado el calculo del seno/coseno.
.data_output(data_output),          					//	Bus de datos con el valor final del angulo calculado.

.overflow_flag(overflow_flag),							//	Bandera de overflow de la operacion.
.underflow_flag(underflow_flag)							//	Bandera de underflow de la operacion.

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

initial
begin
	//inicializacion de señales
	rst = 1;
	beg_fsm_cordic = 0;
	ack_cordic = 0;
	operation = 0;
	data_in = 32'h00000000;
	shift_region_flag = 2'b00;
	
	#100
	rst = 0;
	data_in = 32'h3f91361e;
	shift_region_flag = 2'b00;
	
	#5
	beg_fsm_cordic = 1;
	
	#10
	beg_fsm_cordic = 0;
end

integer f,i;

initial
begin
f=$fopen("Primera_prueba_1_dato.txt","w");
$timeformat(-9,1,"ns",12);

for(i=0; i<2;i=i+1)
begin
@(ready_cordic)
$fwrite(f,"%t %h\n", $realtime, data_output);
end
$fclose(f);

end

endmodule
