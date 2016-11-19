//==================================================================================================
//  Filename      : Testbench_simpleAdders.v
//  Created On    : 2016-11-18 02:54:20
//  Last Modified : 2016-11-18 17:52:24
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : Testbench for different approximate
//
//
//==================================================================================================
`timescale 1ns / 1ps

module Testbench_Adder();

        parameter PERIOD = 10;
        parameter W = 16;
        reg clk;
        //Oper_Start_in signals
        reg [W-1:0] in1;
        reg [W-1:0] in2;
        wire  [W:0] res;
`ifdef ACAII
    ACA_II_N16_Q8 inst_ACA_II_N16_Q8 (.in1(in1), .in2(in2), .res(res));
`endif
`ifdef ETAII
    ETAII_N16_Q4 inst_ETAII_N16_Q4 (.in1(in1), .in2(in2), .res(res));
`endif
`ifdef GeAr
    GeAr_N16_R6_P4 inst_GeAr_N16_R6_P4 (.in1(in1), .in2(in2), .res(res));
`endif
`ifdef ACAI
    ACA_I_N16_Q4 inst_ACA_I_N16_Q4 (.in1(in1), .in2(in2), .res(res));
`endif
`ifdef GDA
    GDA_St_N16_M4_P4 inst_GDA_St_N16_M4_P4 (.in1(in1), .in2(in2), .res(res));
`endif
`ifdef RCA
//RIPPLE CARRY LOOKAHEAD
    RCA_N16 inst_RCA_N16 (.in1(in1), .in2(in2), .res(res));
`endif
`ifdef LOA
    LOA #(.LPL(10), .W(16)) inst_LOA (.in1(in1), .in2(in2), .res(res));
`endif
        integer FileResHex;
        integer FileResDec;
        integer ValTeorico;
        integer Error = 0;
        real floatERROR = 0;
        real sumErrors = 0;

                initial begin
                    // Initialize Inputs
               //      $vcdpluson;
                    clk = 0;
                    in1 = 0;
                    in2 = 0;


            #100;

                    FileResHex = $fopen("ResultadosHEX.txt","w");
                    FileResDec = $fopen("ResultadosDEC.txt","w");

                     runAdder(FileResHex,FileResDec,(200000));

                    $finish;
                   // $vcdplusclose;
          end


             //******************************* Se ejecuta el CLK ************************

                initial forever #5 clk = ~clk;

                task runAdder;
                    input integer ResultsFileH;
                    input integer ResultsFileD;
                    input integer Vector_size;
                begin
                    $fwrite(ResultsFileH, "Entrada 1, Entrada 2, Resultado, Teorico, Error\n");
                    $fwrite(ResultsFileD, "Entrada 1, Entrada 2, Resultado, Teorico, Error\n");
                    repeat(Vector_size) @(posedge clk) begin
                            //input the new values inside the operator
                            in1 = $random;
                            in2 = $random;
                            #5;
                            ValTeorico = in1 + in2;
                            if (res > ValTeorico) begin
                              Error = res - ValTeorico;
                            end else begin
                              Error = (ValTeorico - res)*$itor(100);
                            end
                            floatERROR = $bitstoreal(Error)/$bitstoreal(ValTeorico);
                            sumErrors = sumErrors + floatERROR;
                            $fwrite(ResultsFileH, "%h, %h, %h, %h, %h\n", in1, in2, res, ValTeorico, Error);
                            $fwrite(ResultsFileD, "%d, %d, %d, %d, %d, %f\n", in1, in2, res, ValTeorico, Error, floatERROR);
                    end
                    $fwrite(ResultsFileD, "La suma de los errores es > %f\n", sumErrors);
                    $fwrite(ResultsFileD, "El numero de elementos es  > %f\n", $itor(Vector_size));
                    $fwrite(ResultsFileD, "La media del error es> %f\n", sumErrors/$itor(Vector_size));
                    $fclose(ResultsFileH);
                    $fclose(ResultsFileD);
                end
            endtask

endmodule
