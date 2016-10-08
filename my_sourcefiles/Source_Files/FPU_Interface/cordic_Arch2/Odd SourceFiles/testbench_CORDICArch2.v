
`timescale 1ns/1ps

module testbench_CORDIC_Arch2 (); /* this is automatically generated */

parameter PERIOD = 10;

//ESTAS SON DEFINICIONES QUE SE REALIZAN EN LOS COMANDOS O CONFIGURACIONES 
//DEL SIMULADOR O EL SINTETIZADOR

`ifdef SINGLE
	parameter W = 32;
	parameter EW = 8;
	parameter SW = 23;
	parameter SWR = 26;
	parameter EWR = 5;
`endif

`ifdef DOUBLE
	parameter W = 64;
	parameter EW = 11;
	parameter SW = 52;
	parameter SWR = 55;
	parameter EWR = 6;
`endif



reg clk;                         						//	Reloj del sistema.
reg rst;													//	Señal de reset del sistema.
reg beg_fsm_cordic;              						//	Señal de inicio de la maquina de estados del módulo CORDIC.
reg ack_cordic;                  						//	Señal de acknowledge proveniente de otro módulo que indica que ha recibido el resultado del modulo CORDIC.
reg operation;											//	Señal que indica si se realiza la operacion seno(1'b1) o coseno(1'b0).
reg [1:0] r_mode;
reg [W-1:0] data_in;             						//	Dato de entrada, contiene el angulo que se desea calcular en radianes.
reg [1:0] shift_region_flag;     						//	Señal que indica si el ángulo a calcular esta fuera del rango de calculo del algoritmo CORDIC.

//Output Signals
wire ready_cordic;                						//	Señal de salida que indica que se ha completado el calculo del seno/coseno.
wire [W-1:0] data_output;          						//	Bus de datos con el valor final del angulo calculado.

wire overflow_flag;										//	Bandera de overflow de la operacion.
wire underflow_flag;									//	Bandera de underflow de la operacion.

	CORDIC_Arch2 #(.W(W),.EW(EW),.SW(SW),.SWR(SWR),.EWR(EWR)) uut
		(
			.clk               (clk),
			.rst               (rst),
			.beg_fsm_cordic    (beg_fsm_cordic),
			.ack_cordic        (ack_cordic),
			.operation         (operation),
			.data_in           (data_in),
			.shift_region_flag (shift_region_flag),
			.r_mode            (r_mode),
			.ready_cordic      (ready_cordic),
			.overflow_flag     (overflow_flag),
			.underflow_flag    (underflow_flag),
			.data_output       (data_output)
		);

		

	reg [W-1:0] Array_IN [0:((2**PERIOD)-1)];
    //reg [W-1:0] Array_IN_2 [0:((2**PERIOD)-1)];
    integer contador;
    integer FileSaveData;
    integer Cont_CLK;
    integer Recept;

	initial begin

   		clk = 0;
   		beg_fsm_cordic = 0;
		ack_cordic = 0;
		operation = 0;
		data_in = 32'h00000000;
		shift_region_flag = 2'b00;
		rst = 1;

		//Depending upong the sumulator, this directive will
		//understand that if the macro is defined (e.g. RMODE00) 
		//then the following code will be added to the compilation
		//simulation or sinthesis. 

//This is added in order to simulate the accuracy change of the system.

`ifdef RMODE00
		r_mode = 2'b00;
`endif
`ifdef RMODE01
		r_mode = 2'b01;
`endif
`ifdef RMODE10
		r_mode = 2'b10;
`endif
`ifdef RMODE11
		r_mode = 2'b11;
`endif
        //Abre el archivo testbench
        FileSaveData = $fopen("ResultadoXilinxFLM.txt","w");
        
        //Inicializa las variables del testbench
        contador = 0;
        Cont_CLK = 0;
        Recept = 1;		
		

		#100 rst = 0;
		// #15
		// data_in = 32'h3f25514d; //37 grados
		// shift_region_flag = 2'b00;
		
		// #5
		// beg_fsm_cordic = 1;
		
		// #10
		// beg_fsm_cordic = 0;
 	end


    initial begin
        $readmemh("CORDIC32_input_angles_hex.txt", Array_IN);
        //$readmemh("Hexadecimal_B.txt", Array_IN_2);
    end
	// clock
	initial forever #5 clk = ~clk;

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
                beg_fsm_cordic = 0;
                data_in = Array_IN[contador];
    			#40;
                Cont_CLK = Cont_CLK + 1;
                ack_cordic = 0;
                #40;
            end
            else if(Cont_CLK ==2) begin                         
                ack_cordic = 0;
                beg_fsm_cordic = 1;
                Cont_CLK = Cont_CLK +1 ;
                #40;
            end 
            else begin
                ack_cordic = 0;
                Cont_CLK = Cont_CLK + 1;
                beg_fsm_cordic = 0;
                #40;
            end
            if(ready_cordic==1) begin      
                ack_cordic = 1;    
                Cont_CLK = 0;
                #15;
            end
            
            if(ready_cordic==1 && ack_cordic) begin                        
                Cont_CLK = 0;
                #15;
            end
        end
    end
end

    // Recepción de datos y almacenamiento en archivo*************
    always @(posedge clk) begin
        if(ready_cordic) begin
            if(Recept == 1) begin
                $fwrite(FileSaveData,"%h\n",data_output);
                Recept = 0;
            end
        end
        else begin
            Recept = 1; 
        end    
    end 

endmodule
