//==================================================================================================
//  Filename      : tb_FPU_PIPELINED_FPADDSUB2_vector_testing.v
//  Created On    : 2016-09-27 18:38:13
//  Last Modified : 2016-09-27 20:00:38
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

  // (*NOTE*) replace reset, clock
   parameter W = 32;
   parameter EW = 8;
   parameter SW = 23;
   parameter SWR=26;
   parameter EWR = 5;  //Single Precision */

  // parameter W   = 64;
  // parameter EW  = 11;
  // parameter SW  = 52;
  // parameter SWR = 55;
  // parameter EWR = 6;

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

  reg  [W-1:0] formatted_number_W;
  reg overflow_flag_t, underflow_flag_t;

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
  integer logVectorReference;
  integer Cont_CLK;
  integer Recept;

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
    FileSaveData = $fopen("ResultadoXilinxFLM.txt","w");
    logVectorReference = $fopen("output_log.py","w");

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
        $readmemh("Hexadecimal_A.txt", Array_IN);
        $readmemh("Hexadecimal_B.txt", Array_IN_2);
        $readmemh("Hexadecimal_R.txt", Array_IN_3);
    end

     //**************************** Transmision de datos de forma paralela ************************************************************//

  always @(posedge clk) begin
      if (contador == (2**PERIOD+6)) begin
          $fclose(FileSaveData);
          $fclose(logVectorReference);
          $finish;
      end else if(ready) begin
        $fwrite(FileSaveData,"%h\n",final_result_ieee);
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                           TASKS
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////
task FPADD_FPSUB;

  //inputs
    input op;
    input [W-1:0] Operand1_W;
    input [W-1:0] Operand2_W;

  //outputs
    output [W-1:0] formatted_number_W;
    output overflow_flag;
    output underflow_flag;

  //Temporaries
    reg [SW-1:0] Mantissa1_SW;
    reg [SW-1:0] Mantissa2_SW;
    reg [EW-1:0] Exponent1_EW;
    reg [EW-1:0] Exponent2_EW;

    reg          Sign1;
    reg [SW-1:0] Mantissa_M_SW;
    reg [EW-1:0] Exponent_M_EW;

    reg          Sign2;
    reg [SW-1:0] Mantissa_m_SW;
    reg [EW-1:0] Exponent_m_EW;

    reg [SWR-1:0] Mantissa_M_SWR;
    reg [SWR-1:0] Mantissa_m_SWR;
    reg [SWR-1:0] Mantissa_m_SWR1;
    reg [SWR-1:0] norm_Mantissa_SWR;

    reg [EW-1:0] Exponent_diff_EW;

    reg [SWR:0] raw_Mantissa_SWR1;

    reg overflow_flag, underflow_flag;
    reg carry_out_exp_oper;
    reg gtXY;
    reg eqXY;
    reg real_sign;
    reg real_op;
    reg add_overflow;
    reg overunder;
    reg [SWR-1:0]raw_Mantissa_SWR;
    reg [EWR-1:0]LZD_raw_val_EWR;
    reg [EW-1:0] U_limit; //Max Normal value of the standar ieee 754
    reg [EW-1:0] L_limit; //Min Normal value of the standar ieee 754
    reg final_sign;
    reg [EW-1:0] exp_mux_D1;
    reg [SW-1:0] sgf_mux_D1;
    reg [EW-EWR-1:0] LZD_ZFiller;
    integer k;

    begin


      // $display ("%g CPU Write task with address : 0x%h Data : 0x%h",
      //   $time, address,data);
      // $display ("%g  -> Driving CE, WR, WR data and ADDRESS on to bus",
      //   $time);
      Sign1 =     Operand1_W[W-1];
      Sign2 =     Operand2_W[W-1];
      Exponent1_EW = Operand1_W[EW-1+SW:SW];
      Exponent2_EW = Operand2_W[EW-1+SW:SW];
      Mantissa1_SW = Operand1_W[SW-1:0];
      Mantissa2_SW = Operand2_W[SW-1:0];


      //LZD_raw_val_EWR = LZD_raw({3'b000,Operand1_W});

      if(EW == 8) begin
        assign U_limit = 9'hfe;
        assign L_limit = 9'h01;
      end
      else begin
        assign U_limit = 12'b111111111110;
        assign L_limit = 12'b000000000001;
      end

      if(W == 32) begin
          assign exp_mux_D1 =8'hff;
          assign sgf_mux_D1 =23'd0;
      end
      else begin

          assign exp_mux_D1 =11'hfff;
          assign sgf_mux_D1 =52'd0;

      end

    if (EW == 8) begin
        LZD_ZFiller = 3'd0;
    end else begin
        LZD_ZFiller =5'd0;
    end

      //@ (posedge clk);
      #10;

      $fwrite(logVectorReference,"=============INIT STAGE: input signals==============\n");

      $fwrite(logVectorReference,"---------First Operator------------\n");
      $fwrite(logVectorReference,"FP Format = 0x%30h, Mantissa = 0x%21h, Exponent = 0x%6h, sign = %d\n", Operand1_W, Mantissa1_SW, Exponent1_EW, Sign1);
      $fwrite(logVectorReference,"FP Format = %b, Mantissa = %b, Exponent = %b, sign = %b\n", Operand1_W, Mantissa1_SW, Exponent1_EW, Sign1);
      $fwrite(logVectorReference,"--------Second Operator------------\n");
      $fwrite(logVectorReference,"P Format = 0x%30h, Mantissa = 0x%21h, Exponent = 0x%6h, sign = %d\n", Operand2_W, Mantissa2_SW, Exponent2_EW, Sign2);
      $fwrite(logVectorReference,"FP Format = %b, Mantissa = %b, Exponent = %b, sign = %b\n", Operand2_W, Mantissa2_SW, Exponent2_EW, Sign2);

      gtXY = ({Exponent1_EW, Mantissa1_SW} > {Exponent2_EW, Mantissa2_SW}) ? 1'b1 : 1'b0;
      eqXY = ({Exponent1_EW, Mantissa1_SW} == {Exponent2_EW, Mantissa2_SW}) ? 1'b1 : 1'b0;
      real_op = op ^ Sign2 ^ Sign1;
      real_sign = (gtXY | ((op | Sign2) & (~op | ~Sign2))) & ( Sign1 | ~(eqXY | gtXY));

      if(gtXY == 1) begin
        {Exponent_M_EW, Mantissa_M_SW} = {Exponent1_EW , Mantissa1_SW};
        {Exponent_m_EW, Mantissa_m_SW} = {Exponent2_EW , Mantissa2_SW};
      end
      else begin
        {Exponent_M_EW, Mantissa_M_SW} = {Exponent2_EW , Mantissa2_SW};
        {Exponent_m_EW, Mantissa_m_SW} = {Exponent1_EW , Mantissa1_SW};
      end


      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=============INIT STAGE: output signals==============\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"Sign = %d, real_op = %d\n", real_sign, real_op);
      $fwrite(logVectorReference,"--------Big Number------------\n");
      $fwrite(logVectorReference,"Mantissa_M_SW = 0x%21h, Exponent_M_EW = 0x%6h\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SW = %b, Exponent_M_EW = %b\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"--------Small Number------------\n");
      $fwrite(logVectorReference,"Mantissa_m_SW = 0x%21h, Exponent_m_EW = 0x%6h\n", Mantissa_m_SW, Exponent_m_EW);
      $fwrite(logVectorReference,"Mantissa_m_SW = %b, Exponent_m_EW = %b\n", Mantissa_m_SW, Exponent_m_EW);
      $fwrite(logVectorReference,"======================== ^ ===================\n");

      //$fwrite(logVectorReference,"===============INIT STAGE: FROM THE UUT ============\n");
      //$fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      //$fwrite(logVectorReference,"SIGN_FLAG_EXP = %d, OP_FLAG_INIT = %d\n", uut.SIGN_FLAG_INIT, uut.OP_FLAG_INIT);
      // $fwrite(logVectorReference,"--------Big Number------------\n");
      // $fwrite(logVectorReference,"Mantissa_M_SW = 0x%21h, Exponent_M_EW = 0x%6h\n", Mantissa_M_SW, Exponent_M_EW);
      // $fwrite(logVectorReference,"Mantissa_M_SW = %b, Exponent_M_EW = %b\n", Mantissa_M_SW, Exponent_M_EW);
      // $fwrite(logVectorReference,"--------Small Number------------\n");
      // $fwrite(logVectorReference,"Mantissa_m_SW = 0x%21h, Exponent_m_EW = 0x%6h\n", Mantissa_m_SW, Exponent_m_EW);
      // $fwrite(logVectorReference,"Mantissa_m_SW = %b, Exponent_m_EW = %b\n", Mantissa_m_SW, Exponent_m_EW);
      // $fwrite(logVectorReference,"======================== ^ ===================\n");
      // $fwrite(logVectorReference,"======================== ^ ===================\n");
      // $fwrite(logVectorReference,"======================== ^ ===================\n");
      // $fwrite(logVectorReference,"======================== ^ ===================\n");
      @ (posedge clk);

      Exponent_diff_EW = Exponent_M_EW - Exponent_m_EW;


      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=============EXP STAGE==============\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");

      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"Sign = %d, real_op = %d\n", real_sign, real_op);
      $fwrite(logVectorReference,"--------Big Number------------\n");
      $fwrite(logVectorReference,"Mantissa_M_SW = 0x%21h, Exponent_M_EW = 0x%6h\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SW = %b, Exponent_M_EW = %b\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"--------Small Number------------\n");
      $fwrite(logVectorReference,"Mantissa_m_SW = 0x%21h\n", Mantissa_m_SW);
      $fwrite(logVectorReference,"Mantissa_m_SW = %b\n", Mantissa_m_SW);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"Exponent_diff_EW = Exp M - Exp m = 0x%6h\n", Exponent_diff_EW);
      $fwrite(logVectorReference,"Exponent_diff_EW = Exp M - Exp m = %b\n", Exponent_diff_EW);


      // $fwrite(logVectorReference,"===============EXP STAGE FROM UUT============\n");
      // $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      // $fwrite(logVectorReference,"SIGN_FLAG_EXP = %d, OP_FLAG_EXP = %d\n", uut.SIGN_FLAG_EXP, uut.OP_FLAG_EXP);
      // $fwrite(logVectorReference,"--------Big Number------------\n");
      // $fwrite(logVectorReference,"DMP_mant_EXP_SW = 0x%21h, Exponent_M_EW = 0x%6h\n", uut.DMP_mant_EXP_SW, uut.DMP_exp_EXP_EW);
      // $fwrite(logVectorReference,"DMP_mant_EXP_SW = %b, Exponent_M_EW = %b\n", uut.DMP_mant_EXP_SW, uut.DMP_exp_EXP_EW);
      // $fwrite(logVectorReference,"--------Small Number------------\n");
      // $fwrite(logVectorReference,"Mantissa_m_SW = 0x%21h\n", uut.DmP_mant_EXP_SW);
      // $fwrite(logVectorReference,"Mantissa_m_SW = %b\n", uut.DmP_mant_EXP_SW);
      // $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      // $fwrite(logVectorReference,"Shift_amount_EXP_EW = Exp M - Exp m = 0x%6h\n", uut.Exponent_diff_EW);
      // $fwrite(logVectorReference,"Shift_amount_EXP_EW = Exp M - Exp m = %b\n", uut.Exponent_diff_EW);
      // $fwrite(logVectorReference,"===============EXP STAGE============\n");

      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=============EXP STAGE==============\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");

      @ (posedge clk);

      Mantissa_m_SWR = {1'b1,Mantissa_m_SW, 2'b0} >> Exponent_diff_EW;



      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"==========        ===SHT1 STAGE==============\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");

      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"--------Sign = %d, real_op = %d ----------------\n", real_sign, real_op);
      $fwrite(logVectorReference,"--------Big Number------------------------------------\n");
      $fwrite(logVectorReference,"--------------Mantissa_M_SW = 0x%21h, Exponent_M_EW = 0x%6h--------\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"--------------Mantissa_M_SW = %b, Exponent_M_EW = %b--------\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"--------------Small Number--------------------\n");
      $fwrite(logVectorReference,"--------Mantissa_m_SW hex = 0x%21h--------\n", Mantissa_m_SW);
      $fwrite(logVectorReference,"--------Mantissa_m_SW bin = %b----------\n", Mantissa_m_SW);
      $fwrite(logVectorReference,"--------------------OPERATION RESULT--------------------\n");
      $fwrite(logVectorReference,"--------Shifted mantissa result hex = 0x%24h-------\n", Mantissa_m_SWR);
      $fwrite(logVectorReference,"--------Shifted mantissa result bin = %b-------\n", Mantissa_m_SWR);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"==========          ===SHT1 STAGE==============\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");



      @ (posedge clk);

      //Our shifter is segmented, hence, the extra clk cycle

      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"===================SHT2 STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"Sign = %d, real_op = %d\n", real_sign, real_op);
      $fwrite(logVectorReference,"--------Big Number------------\n");
      $fwrite(logVectorReference,"Mantissa_M_SW = 0x%21h, Exponent_M_EW = 0x%6h\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SW = %b, Exponent_M_EW = %b\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"Shifted Mantissa_m_SWR = 0x%24h\n", Mantissa_m_SWR);
      $fwrite(logVectorReference,"Shifted Mantissa_m_SWR = %b\n", Mantissa_m_SWR);
      $fwrite(logVectorReference,"===================SHT2 STAGE================\n");

      // $fwrite(logVectorReference,"======================== ^ ===================\n");
      // $fwrite(logVectorReference,"===================SHT2 STAGE FROM THE UUT================\n");
      // $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      // $fwrite(logVectorReference,"Sign = %d, real_op = %d\n", uut.SIGN_FLAG_SHT2, uut.OP_FLAG_SHT2);

      // $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      // $fwrite(logVectorReference,"sftr_idat_SHT2_SWR = 0x%24h\n", uut.sftr_idat_SHT2_SWR);
      // $fwrite(logVectorReference,"sftr_odat_SHT2_SWR = %b\n", uut.sftr_odat_SHT2_SWR);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"===================SHT2 STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");

      @ (posedge clk);

      Mantissa_M_SWR = {1'b1,Mantissa_M_SW, 2'b0};

      if (real_op == 1) begin
        raw_Mantissa_SWR1 = Mantissa_M_SWR - Mantissa_m_SWR;
        $display("Se restan las mantisas\n");
      end
      else begin
        raw_Mantissa_SWR1 = Mantissa_M_SWR + Mantissa_m_SWR;
        $display("Se suman las mantisas\n");
      end
      raw_Mantissa_SWR = raw_Mantissa_SWR1[SWR-1:0];
      add_overflow = raw_Mantissa_SWR1[SWR-2];

      add_overflow = add_overflow&(~real_op);


      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"===================SGF STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"add_overflw = %d, Sign = %d\n", add_overflow, real_sign);
      $fwrite(logVectorReference,"--------Big Number------------\n");
      $fwrite(logVectorReference,"Mantissa_M_SW = 0x%24h, Exponent_M_EW = 0x%6h\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SW = %b, Exponent_M_EW = %b\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SW = %26d, Exponent_M_EW = %8d\n", Mantissa_M_SW, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SWR = 0x%24h, Exponent_M_EW = 0x%6h\n", Mantissa_M_SWR, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SWR = %b, Exponent_M_EW = %b\n", Mantissa_M_SWR, Exponent_M_EW);
      $fwrite(logVectorReference,"Mantissa_M_SWR = %26d, Exponent_M_EW = %8d\n", Mantissa_M_SWR, Exponent_M_EW);
      $fwrite(logVectorReference,"--------Small Number------------\n");
      $fwrite(logVectorReference,"Mantissa hex = 0x%24h\n",Mantissa_m_SWR);
      $fwrite(logVectorReference,"Mantissa bin = %b\n",Mantissa_m_SWR);
      $fwrite(logVectorReference,"Mantissa bin = %26d\n",Mantissa_m_SWR);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"Mantissa operation result = 0x%24h\n", raw_Mantissa_SWR);
      $fwrite(logVectorReference,"Mantissa operation result = %b\n", raw_Mantissa_SWR);
      $fwrite(logVectorReference,"Mantissa operation result = %26d\n", raw_Mantissa_SWR);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"===================SGF STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");

      @ (posedge clk);

      LZD_raw_val_EWR = 0;
      k=SWR-1;
      $display("Mantissa operation result = 0x%h, Mantissa result bin = %b\n", raw_Mantissa_SWR, raw_Mantissa_SWR);
      $display("dentro del loop %d, \n", raw_Mantissa_SWR[k]);
      while(~raw_Mantissa_SWR[k]) begin
        k = k-1;
        LZD_raw_val_EWR = LZD_raw_val_EWR + 1;
        $display("dentro del loop\n");
      end


      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== NRM STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"add_overflw = %d, Sign = %d\n", add_overflow, real_sign);
      $fwrite(logVectorReference,"--------Big Number------------\n");
      $fwrite(logVectorReference,"Mantisa hex SW  = 0x%21h \n", Mantissa_M_SW);
      $fwrite(logVectorReference,"Mantisa hex SW  = %b\n", Mantissa_M_SW);
      $fwrite(logVectorReference,"Mantisa hex SWR = 0x%24h\n", Mantissa_M_SWR);
      $fwrite(logVectorReference,"Mantisa hex SWR = %b\n", Mantissa_M_SWR);
      $fwrite(logVectorReference,"Exponent = 0x%h\n", Exponent_M_EW);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"Mantissa operation result = 0x%24h\n", raw_Mantissa_SWR);
      $fwrite(logVectorReference,"Mantissa operation result = 0x%h\n", raw_Mantissa_SWR);
      $fwrite(logVectorReference,"Mantissa operation result = %26d\n", raw_Mantissa_SWR);
      $fwrite(logVectorReference,"LZD result hex = 0x%h, LZD result hex = %b\n", LZD_raw_val_EWR, LZD_raw_val_EWR);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== NRM STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");


      @ (posedge clk);

      if (add_overflow) begin
      //Signed shift
        norm_Mantissa_SWR = raw_Mantissa_SWR >>> 1;
      end
      else begin
        norm_Mantissa_SWR = raw_Mantissa_SWR << LZD_raw_val_EWR;
      end

      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== NRM2 STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"add_overflw = %d, sign = %d\n", add_overflow, real_sign);
      $fwrite(logVectorReference,"--------Big Number------------\n");
      $fwrite(logVectorReference,"Exponent = 0x%6h\n", Exponent_M_EW);
      $fwrite(logVectorReference,"Exponent = %b\n", Exponent_M_EW);
      $fwrite(logVectorReference,"Exponent = %8d\n", Exponent_M_EW);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"Normalized mantissa (shifted) = 0x%24h\n", norm_Mantissa_SWR);
      $fwrite(logVectorReference,"Normalized mantissa (shifted) = %b\n", norm_Mantissa_SWR);
      $fwrite(logVectorReference,"Normalized mantissa (shifted) = %26d\n", norm_Mantissa_SWR);
      $fwrite(logVectorReference,"LZD result hex = 0x%h, LZD result bin = %b\n", LZD_raw_val_EWR, LZD_raw_val_EWR);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== NRM2 STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");


      @ (posedge clk);

      //We do a second shift over here

      //We do the xponent compensation

      if (add_overflow) begin
        {carry_out_exp_oper,Exponent_M_EW} = Exponent_M_EW - 1;
      end
      else begin
        {carry_out_exp_oper,Exponent_M_EW} = Exponent_M_EW + {LZD_ZFiller,LZD_raw_val_EWR};
      end

        overflow_flag  =({carry_out_exp_oper,Exponent_M_EW} > U_limit) ? 1'b1 : 1'b0;
        underflow_flag =({carry_out_exp_oper,Exponent_M_EW} < L_limit) ? 1'b1 : 1'b0;


      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== NRM2 STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"overflow flag = %d, underflow flag = %d, sign flag = %d\n", overflow_flag, underflow_flag, real_sign);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"Compensated Exponent = 0x%6h, Normalized mantissa (shifted) = 0x%24h\n", Exponent_M_EW, norm_Mantissa_SWR);
      $fwrite(logVectorReference,"Compensated Exponent = %b,  Normalized mantissa (shifted) = %b\n", Exponent_M_EW, norm_Mantissa_SWR);
      $fwrite(logVectorReference,"Compensated Exponent = %8d, Normalized mantissa (shifted) = %26d\n", Exponent_M_EW, norm_Mantissa_SWR);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== NRM2 STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");

      @ (posedge clk);


      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== FRMT STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"La mantisa final sera: 0x%21h\n", norm_Mantissa_SWR[SWR-2:2]);
      $fwrite(logVectorReference,"La mantisa final sera: %b\n", norm_Mantissa_SWR[SWR-2:2]);
      $fwrite(logVectorReference,"La mantisa final sera: %23d\n", norm_Mantissa_SWR[SWR-2:2]);
      $fwrite(logVectorReference,"El exponente final sera: 0x%6h\n", Exponent_M_EW);
      $fwrite(logVectorReference,"El exponente final sera: %b\n", Exponent_M_EW);
      $fwrite(logVectorReference,"El exponente final sera: %8d\n", Exponent_M_EW);
      $fwrite(logVectorReference,"======================== * ===================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"=================== FRMT STAGE================\n");
      $fwrite(logVectorReference,"===                                             \n");
      $fwrite(logVectorReference,"======================== * ===================\n");
        overunder = overflow_flag | underflow_flag;
        case ({overflow_flag,underflow_flag})
            2'b00: final_sign=real_sign;
            2'b01: final_sign=1'b1;
            2'b10: final_sign=1'b0;
            default: final_sign=0;
        endcase

        if (overunder == 0) begin
            formatted_number_W = {final_sign, Exponent_M_EW, norm_Mantissa_SWR[SWR-2:2]};
        end else begin
            formatted_number_W = {final_sign,exp_mux_D1,sgf_mux_D1};
        end

      $fwrite(logVectorReference,"=================== FRMT STAGE ================\n");
      $fwrite(logVectorReference,"--------------------FLAGS------------------\n");
      $fwrite(logVectorReference,"overflow flag = %d, underflow flag = %d\n", overflow_flag, underflow_flag);
      $fwrite(logVectorReference,"--------OPERATION RESULT------------\n");
      $fwrite(logVectorReference,"El resultado final sera: %32h\n", formatted_number_W);
      $fwrite(logVectorReference,"El resultado final sera: %b\n", formatted_number_W);
      $fwrite(logVectorReference,"El resultado final sera: %32d\n", formatted_number_W);
      $fwrite(logVectorReference,"=================== FRMT STAGE ================\n");

    end
endtask

endmodule




