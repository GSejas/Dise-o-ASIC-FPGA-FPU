//==================================================================================================
//  Filename      : task_FPADD_FPSUB.v
//  Created On    : 2016-09-23 11:04:26
//  Last Modified : 2016-09-24 01:26:36
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : Task emulating the behavior of the stages of the pipelined FP adder/subber
//
//
//==================================================================================================

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


      // $display ("%g CPU Write task with address : %h Data : %h",
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

      @ (posedge clk);


      $display("===============INIT STAGE: input signals============");
      $display("---------First Operator------------");
      $display("Mantissa = %23h, Exponent = %8h, sign = %d", Mantissa1_SW, Exponent1_EW, Sign1);
      $display("Mantissa = %b, Exponent = %b, sign = %b", Mantissa1_SW, Exponent1_EW, Sign1);
      $display("--------Second Operator------------");
      $display("Mantissa = %23h, Exponent = %8h, sign = %d", Mantissa2_SW, Exponent2_EW, Sign2);
      $display("Mantissa = %b, Exponent = %b, sign = %b", Mantissa2_SW, Exponent2_EW, Sign2);

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

      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");

      $display("===============INIT STAGE: output signals============");
      $display("--------------------FLAGS------------------");
      $display("Sign = %d, real_op = %d", real_sign, real_op);
      $display("--------Big Number------------");
      $display("Mantissa_M_SW = %23h, Exponent_M_EW = %8h", Mantissa_M_SW, Exponent_M_EW);
      $display("Mantissa_M_SW = %b, Exponent_M_EW = %b", Mantissa_M_SW, Exponent_M_EW);
      $display("--------Small Number------------");
      $display("Mantissa_m_SW = %23h, Exponent_m_EW = %8h", Mantissa_m_SW, Exponent_m_EW);
      $display("Mantissa_m_SW = %b, Exponent_m_EW = %b", Mantissa_m_SW, Exponent_m_EW);

      @ (posedge clk);

      Exponent_diff_EW = Exponent_M_EW - Exponent_m_EW;

      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");

      $display("===============EXP STAGE============");
      $display("--------------------FLAGS------------------");
      $display("Sign = %d, real_op = %d", real_sign, real_op);
      $display("--------Big Number------------");
      $display("Mantissa_M_SW = %23h, Exponent_M_EW = %8h", Mantissa_M_SW, Exponent_M_EW);
      $display("Mantissa_M_SW = %b, Exponent_M_EW = %b", Mantissa_M_SW, Exponent_M_EW);
      $display("--------Small Number------------");
      $display("Mantissa_m_SW = %23h", Mantissa_m_SW);
      $display("Mantissa_m_SW = %b", Mantissa_m_SW);
      $display("--------OPERATION RESULT------------");
      $display("Exponent_diff_EW = Exp M - Exp m = %8h", Exponent_diff_EW);
      $display("Exponent_diff_EW = Exp M - Exp m = %b", Exponent_diff_EW);
      $display("===============EXP STAGE============");
      @ (posedge clk);

      Mantissa_m_SWR = {1'b1,Mantissa_m_SW, 2'b0} >> Exponent_diff_EW;

      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");

      $display("===================SHT1 STAGE================");
      $display("--------------------FLAGS------------------");
      $display("--------Sign = %d, real_op = %d ----------------", real_sign, real_op);
      $display("--------Big Number------------------------------------");
      $display("--------------Mantissa_M_SW = %23h, Exponent_M_EW = %8h--------", Mantissa_M_SW, Exponent_M_EW);
      $display("--------------Mantissa_M_SW = %b, Exponent_M_EW = %b--------", Mantissa_M_SW, Exponent_M_EW);
      $display("--------------Small Number--------------------");
      $display("--------Mantissa_m_SW hex = %23h--------", Mantissa_m_SW);
      $display("--------Mantissa_m_SW bin = %b----------", Mantissa_m_SW);
      $display("--------------------OPERATION RESULT--------------------");
      $display("--------Shifted mantissa result hex = %26h-------", Mantissa_m_SWR);
      $display("--------Shifted mantissa result bin = %b-------", Mantissa_m_SWR);
      $display("===========------========SHT1 STAGE===-------=============");

      @ (posedge clk);

      //Our shifter is segmented, hence, the extra clk cycle
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");

      $display("===================SHT2 STAGE================");
      $display("--------------------FLAGS------------------");
      $display("Sign = %d, real_op = %d", real_sign, real_op);
      $display("--------Big Number------------");
      $display("Mantissa_M_SW = %23h, Exponent_M_EW = %8h", Mantissa_M_SW, Exponent_M_EW);
      $display("Mantissa_M_SW = %b, Exponent_M_EW = %b", Mantissa_M_SW, Exponent_M_EW);
      $display("--------OPERATION RESULT------------");
      $display("Shifted Mantissa_m_SWR = %26h", Mantissa_m_SWR);
      $display("Shifted Mantissa_m_SWR = %b", Mantissa_m_SWR);
      $display("===================SHT2 STAGE================");

      @ (posedge clk);

      Mantissa_M_SWR = {1'b1,Mantissa_M_SW, 2'b0};

      if (real_op == 1) begin
        raw_Mantissa_SWR1 = Mantissa_M_SWR - Mantissa_m_SWR;
        $display("Se restan las mantisas");
      end
      else begin
        raw_Mantissa_SWR1 = Mantissa_M_SWR + Mantissa_m_SWR;
        $display("Se suman las mantisas");
      end
      raw_Mantissa_SWR = raw_Mantissa_SWR1[SWR-1:0];
      add_overflow = raw_Mantissa_SWR1[SWR-2];

      add_overflow = add_overflow&(~real_op);

      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");

      $display("===================SGF STAGE================");
      $display("--------------------FLAGS------------------");
      $display("add_overflw = %d, Sign = %d", add_overflow, real_sign);
      $display("--------Big Number------------");
      $display("Mantissa_M_SW = %26h, Exponent_M_EW = %8h", Mantissa_M_SW, Exponent_M_EW);
      $display("Mantissa_M_SW = %b, Exponent_M_EW = %b", Mantissa_M_SW, Exponent_M_EW);
      $display("Mantissa_M_SW = %26d, Exponent_M_EW = %8d", Mantissa_M_SW, Exponent_M_EW);
      $display("Mantissa_M_SWR = %26h, Exponent_M_EW = %8h", Mantissa_M_SWR, Exponent_M_EW);
      $display("Mantissa_M_SWR = %b, Exponent_M_EW = %b", Mantissa_M_SWR, Exponent_M_EW);
      $display("Mantissa_M_SWR = %26d, Exponent_M_EW = %8d", Mantissa_M_SWR, Exponent_M_EW);
      $display("--------Small Number------------");
      $display("Mantissa hex = %26h",Mantissa_m_SWR);
      $display("Mantissa bin = %b",Mantissa_m_SWR);
      $display("Mantissa bin = %26d",Mantissa_m_SWR);
      $display("--------OPERATION RESULT------------");
      $display("Mantissa operation result = %26h", raw_Mantissa_SWR);
      $display("Mantissa operation result = %b", raw_Mantissa_SWR);
      $display("Mantissa operation result = %26d", raw_Mantissa_SWR);
      $display("===================SGF STAGE================");

      @ (posedge clk);

      LZD_raw_val_EWR = 0;
      k=SWR-1;
      $display("Mantissa operation result = %h, Mantissa result bin = %b", raw_Mantissa_SWR, raw_Mantissa_SWR);
      $display("dentro del loop %d, ", raw_Mantissa_SWR[k]);
      while(~raw_Mantissa_SWR[k]) begin
        k = k-1;
        LZD_raw_val_EWR = LZD_raw_val_EWR + 1;
        $display("dentro del loop");
      end

      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");
      $display("======================== ^ ===================");

      $display("=================== NRM STAGE ================");
      $display("--------------------FLAGS------------------");
      $display("add_overflw = %d, Sign = %d", add_overflow, real_sign);
      $display("--------Big Number------------");
      $display("Mantisa hex SW  = %23h ", Mantissa_M_SW);
      $display("Mantisa hex SW  = %b", Mantissa_M_SW);
      $display("Mantisa hex SWR = %26h", Mantissa_M_SWR);
      $display("Mantisa hex SWR = %b", Mantissa_M_SWR);
      $display("Exponent = %h", Exponent_M_EW);
      $display("--------OPERATION RESULT------------");
      $display("Mantissa operation result = %26h", raw_Mantissa_SWR);
      $display("Mantissa operation result = %h", raw_Mantissa_SWR);
      $display("Mantissa operation result = %26d", raw_Mantissa_SWR);
      $display("LZD result hex = %h, LZD result hex = %b", LZD_raw_val_EWR, LZD_raw_val_EWR);
      $display("=================== NRM STAGE ================");


      @ (posedge clk);

      if (add_overflow) begin
      //Signed shift
        norm_Mantissa_SWR = raw_Mantissa_SWR >>> 1;
      end
      else begin
        norm_Mantissa_SWR = raw_Mantissa_SWR << LZD_raw_val_EWR;
      end

      $display("=================== SH1NRM STAGE ================");
      $display("--------------------FLAGS------------------");
      $display("add_overflw = %d, sign = %d", add_overflow, real_sign);
      $display("--------Big Number------------");
      $display("Exponent = %8h", Exponent_M_EW);
      $display("Exponent = %b", Exponent_M_EW);
      $display("Exponent = %8d", Exponent_M_EW);
      $display("--------OPERATION RESULT------------");
      $display("Normalized mantissa (shifted) = %26h", norm_Mantissa_SWR);
      $display("Normalized mantissa (shifted) = %b", norm_Mantissa_SWR);
      $display("Normalized mantissa (shifted) = %26d", norm_Mantissa_SWR);
      $display("LZD result hex = %h, LZD result bin = %b", LZD_raw_val_EWR, LZD_raw_val_EWR);
      $display("=================== SH1NRM STAGE ================");

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


      $display("=================== NRM2 STAGE ================");
      $display("--------------------FLAGS------------------");
      $display("overflow flag = %d, underflow flag = %d, sign flag = %d", overflow_flag, underflow_flag, real_sign);
      $display("--------OPERATION RESULT------------");
      $display("Compensated Exponent = %8h, Normalized mantissa (shifted) = %26h", Exponent_M_EW, norm_Mantissa_SWR);
      $display("Compensated Exponent = %b,  Normalized mantissa (shifted) = %b", Exponent_M_EW, norm_Mantissa_SWR);
      $display("Compensated Exponent = %8d, Normalized mantissa (shifted) = %26d", Exponent_M_EW, norm_Mantissa_SWR);
      $display("=================== NRM2 STAGE ================");

      @ (posedge clk);
        overunder = overflow_flag | underflow_flag;
        case ({overflow_flag,underflow_flag})
            2'b00: final_sign=real_sign;
            2'b01: final_sign=1'b1;
            2'b10: final_sign=1'b0;
            default: final_sign=0;
        endcase

        if (overunder == 0) begin
            $display("La mantisa final sera: %23h", norm_Mantissa_SWR[SWR-2:2]);
            $display("La mantisa final sera: %b", norm_Mantissa_SWR[SWR-2:2]);
            $display("La mantisa final sera: %23d", norm_Mantissa_SWR[SWR-2:2]);
            $display("El exponente final sera: %8h", Exponent_M_EW);
            $display("El exponente final sera: %b", Exponent_M_EW);
            $display("El exponente final sera: %8d", Exponent_M_EW);
            formatted_number_W = {final_sign, Exponent_M_EW, norm_Mantissa_SWR[SWR-2:2]};
        end else begin
            formatted_number_W = {final_sign,exp_mux_D1,sgf_mux_D1};
        end

      $display("=================== FRMT STAGE ================");
      $display("--------------------FLAGS------------------");
      $display("overflow flag = %d, underflow flag = %d", overflow_flag, underflow_flag);
      $display("--------OPERATION RESULT------------");
      $display("El resultado final sera: %32h", formatted_number_W);
      $display("El resultado final sera: %b", formatted_number_W);
      $display("El resultado final sera: %32d", formatted_number_W);
      $display("=================== FRMT STAGE ================");

    end
endtask
