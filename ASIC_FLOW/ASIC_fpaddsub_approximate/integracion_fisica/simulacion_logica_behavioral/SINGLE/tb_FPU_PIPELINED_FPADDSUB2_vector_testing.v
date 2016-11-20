//==================================================================================================
//  Filename      : tb_FPU_PIPELINED_FPADDSUB2_vector_testing.v
//  Created On    : 2016-09-27 18:38:13
//  Last Modified : 2016-11-19 17:55:11
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
//  Filename      : tb_FPU_PIPELINED_FPADDSUB2_vector_testing.v
//  Created On    : 2016-09-25 17:59:05
//  Last Modified : 2016-09-27 18:36:46
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
//  Filename      : tb_uut2_vector_testing.v
//  Created On    : 2016-09-25 12:25:16
//  Last Modified : 2016-09-25 12:25:16
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : Testbench simulating the behavior and stimuli of the FPADD/FPSUB Unit.
//
//
//==================================================================================================
//==================================================================================================
//  Filename      : tb_uut2_vector_testing.v
//  Created On    : 2016-09-24 01:24:56
//  Last Modified : 2016-09-24 01:24:56
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : Testbench simulating the behavior and stimuli of the FPADD/FPSUB Unit.
//
//
//==================================================================================================

`timescale 1ns/1ps


module tb_FPU_PIPELINED_FPADDSUB2_vector_testing (); /* this is automatically generated */

  localparam PERIOD = 10;

`ifdef SINGLE
   parameter W = 32;
   parameter EW = 8;
   parameter SW = 23;
   parameter SWR=26;
   parameter EWR = 5;  //Single Precision */
`endif

`ifdef DOUBLE
   parameter W   = 64;
   parameter EW  = 11;
   parameter SW  = 52;
   parameter SWR = 55;
   parameter EWR = 6;
`endif

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                           MODULE SIGNALS
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////

  reg         clk;
  reg         rst;
  reg         beg_OP;
  reg [W-1:0] Data_X;
  reg [W-1:0] Data_Y;
  reg         add_subt;
  wire        busy;
  wire        overflow_flag;
  wire        underflow_flag;
  wire        zero_flag;

  wire [W-1:0] final_result_ieee;
  reg [SW-1:0] final_result_ieee_mantissa;
  reg [EW-1:0] final_result_ieee_exponent;
  reg          final_result_ieee_sign;

  wire ready;

//Temps for the testbench and verification

  reg [SW-1:0] Data_X_mant;
  reg [SW-1:0] Data_Y_mant;
  reg [EW-1:0] Data_X_exp;
  reg [EW-1:0] Data_Y_exp;
  reg Data_X_sign;
  reg Data_Y_sign;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                           TASKS VARIABLES
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////

 // reg  [W-1:0] formatted_number_W;
  //reg overflow_flag_t, underflow_flag_t;

  //reg [EWR-1:0] LZD_raw_val_EWR;
  reg [W-1:0]  Theoretical_result;
  reg [SW-1:0] Theoretical_result_mantissa;
  reg [EW-1:0] Theoretical_result_exponent;
  reg Theoretical_result_sign;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                           STIMULI SIGNALS
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////

  reg [W-1:0] Array_IN [0:((2**PERIOD)-1)];
  reg [W-1:0] Array_IN_2 [0:((2**PERIOD)-1)];
  reg [W-1:0] Array_IN_3 [0:((2**PERIOD)-1)];
  integer contador;
  integer FileSaveData;
  integer FileSaveDataDEC;
  integer logVectorReference;
  integer Cont_CLK;
//  integer Recept;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                           END OF DECLARATIONS
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////


  FPU_PIPELINED_FPADDSUB #(
      .W(W),
      .EW(EW),
      .SW(SW),
      .SWR(SWR),
      .EWR(EWR)
    ) inst_uut (
      .clk               (clk),
      .rst               (rst),
      .beg_OP            (beg_OP),
      .Data_X            (Data_X),
      .Data_Y            (Data_Y),
      .add_subt          (add_subt),
      .busy              (busy),
      .overflow_flag     (overflow_flag),
      .underflow_flag    (underflow_flag),
      .zero_flag         (zero_flag),
      .ready             (ready),
      .final_result_ieee (final_result_ieee)
    );

always begin
    #1;
    final_result_ieee_mantissa = final_result_ieee[SW-1:0];
    final_result_ieee_exponent = final_result_ieee[W-2:SW];
    final_result_ieee_sign     = final_result_ieee[W-1];
    Data_X_mant = Data_X[SW-1:0];
    Data_Y_mant = Data_Y[SW-1:0];
    Data_X_exp  = Data_X[W-2:SW];
    Data_Y_exp  = Data_Y[W-2:SW];
    Data_X_sign = Data_X[W-1];
    Data_Y_sign = Data_Y[W-1];
    Theoretical_result_mantissa = Theoretical_result[SW-1:0];
    Theoretical_result_exponent = Theoretical_result[W-2:SW];
    Theoretical_result_sign = Theoretical_result[W-1];

end

// function [EWR-1:0] LZD_raw; // function definition starts here
//    input [SWR-1:0] ADD_SUB_RAW;
//    integer k;
//    begin
//      LZD_raw = 0;
//      k=SWR-1;
//      while(ADD_SUB_RAW[k] == 0) begin
//        k = k-1;
//        LZD_raw = LZD_raw + 1;
//         $display("This is the bit analized %d\n", k);
//         $display("This is the bit analized %d\n", ADD_SUB_RAW[k]);
//         $display("Number of 0s %d\n", LZD_raw);
//      end
//    end
//  endfunction


   initial begin

`ifdef ACAIN16Q4
    FileSaveData = $fopen("ResultadoXilinxACAIN16Q4FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxACAIN16Q4FLMDEC.txt","w");
`elsif ETAIIN16Q4
    FileSaveData = $fopen("ResultadoXilinxETAIIN16Q4FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxETAIIN16Q4FLMDEC.txt","w");
`elsif ETAIIN16Q8
    FileSaveData = $fopen("ResultadoXilinxETAIIN16Q8FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxETAIIN16Q8FLMDEC.txt","w");
`elsif ACAIIN16Q4
    FileSaveData = $fopen("ResultadoXilinxACAIIN16Q4FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxACAIIN16Q4FLMDEC.txt","w");
`elsif ACAIIN16Q8
    FileSaveData = $fopen("ResultadoXilinxACAIIN16Q8FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxACAIIN16Q8FLMDEC.txt","w");
`elsif GDAN16M4P4
    FileSaveData = $fopen("ResultadoXilinxGDAN16M4P4FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxGDAN16M4P4FLMDEC.txt","w");
`elsif GDAN16M4P8
    FileSaveData = $fopen("ResultadoXilinxGDAN16M4P8FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxGDAN16M4P8FLMDEC.txt","w");
`elsif GeArN16R2P4
    FileSaveData = $fopen("ResultadoXilinxGeArN16R2P4FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxGeArN16R2P4FLMDEC.txt","w");
`elsif GeArN16R4P4
    FileSaveData = $fopen("ResultadoXilinxGeArN16R4P4FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxGeArN16R4P4FLMDEC.txt","w");
`elsif GeArN16R4P8
    FileSaveData = $fopen("ResultadoXilinxGeArN16R4P8FLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxGeArN16R4P8FLMDEC.txt","w");
`elsif LOA
    FileSaveData = $fopen("ResultadoXilinxLOAFLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxLOAFLMDEC.txt","w");
`else
    FileSaveData = $fopen("ResultadoXilinxFLM.txt","w");
    FileSaveDataDEC = $fopen("ResultadoXilinxFLMDEC.txt","w");
`endif


    logVectorReference = $fopen("output_log.txt","w");

    rst = 1;

`ifdef SUB_OPER
    add_subt = 1; //Se realiza la operacion de resta
`else
    add_subt = 0; //Se realiza la operacion de suma
`endif

    beg_OP = 0;
    Data_Y = 0;
    Data_X = 0;
    Data_X_mant = 0;
    Data_Y_mant = 0;
    Data_X_exp  = 0;
    Data_Y_exp  = 0;
    Data_X_sign = 0;
    Data_Y_sign = 0;
    //Theoretical_result = 32'hbe1abef8;
    //Inicializa las variables del testbench
    contador = 0;
    Cont_CLK = 0;



    #98 rst = 0;
    //FPADD_FPSUB(0, Array_IN[3], Array_IN_2[3], formatted_number_W, overflow_flag_t, underflow_flag_t);



   end

   //**************************** Se lee el archivo txt y se almacena en un arrays***************************************************//

    initial begin
        $vcdpluson; //ESTO ES PARA LA OBTENCION DE LA POTENCIA DINAMICA, para esto necesitamos el .vcd
        $readmemh("Hexadecimal_A.txt", Array_IN);
        $readmemh("Hexadecimal_B.txt", Array_IN_2);
        $readmemh("Hexadecimal_R.txt", Array_IN_3);
    end

     //**************************** Transmision de datos de forma paralela ************************************************************//

  always @(posedge clk) begin
      if (contador == (2**PERIOD+6)) begin
          $fclose(FileSaveData);
          $fclose(FileSaveDataDEC);
          $fclose(logVectorReference);
          $finish;
          $vcdplusclose;
      end else if(ready) begin
        $fwrite(FileSaveData,"%h\n",final_result_ieee);
`ifdef SINGLE
        $fwrite(FileSaveDataDEC,"%f\n",$bitstoshortreal(final_result_ieee));
`endif
`ifdef DOUBLE
        $fwrite(FileSaveDataDEC,"%f\n",$bitstoreal(final_result_ieee));
`endif
      end

  end

always @(negedge clk) begin
    #(PERIOD/5);
    if(~busy & ~rst) begin
      beg_OP = 1;
    end
end

always @(posedge clk) begin
    #(PERIOD/5);
    if(rst) begin
        contador = 0;
    end
    else if(~busy & ~rst) begin
        Data_X = Array_IN[contador];
        Data_Y = Array_IN_2[contador];
        Theoretical_result = Array_IN_3[contador];
        contador = contador + 1;
        @(posedge clk)
        #(PERIOD/3);
        Data_X = Array_IN[contador];
        Data_Y = Array_IN_2[contador];
        Theoretical_result = Array_IN_3[contador];
        contador = contador + 1;
        @(posedge clk)
        #(PERIOD/3);
        Data_X = Array_IN[contador];
        Data_Y = Array_IN_2[contador];
        Theoretical_result = Array_IN_3[contador];
        contador = contador + 1;
        repeat(3) @(posedge clk);
    end
end

  // clock

  initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
  end

endmodule




