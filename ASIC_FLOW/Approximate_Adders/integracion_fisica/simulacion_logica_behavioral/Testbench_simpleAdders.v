//==================================================================================================
//  Filename      : Testbench_simpleAdders.v
//  Created On    : 2016-11-18 02:54:20
//  Last Modified : 2016-11-26 01:24:32
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

module Testbench_Multi();

        parameter PERIOD = 10;
        parameter W = 24;
        reg clk;
        //Oper_Start_in signals
        reg [W-1:0] in1;
        reg [W-1:0] in2;
        wire  [2*W-1:0] res;
        integer FileResHex;
        integer FileResDec;
        reg  [2*W-1:0]  ValTeorico;
        reg  signed [2*W:0] Error = 0;
        localparam STRINGHEX = "ResultsFileH.txt";
        localparam STRINGDEC = "ResultsFileDec.txt";

    ETM_Multiplier #(.W(W)) inst_ETM_Multiplier (.in1(in1), .in2(in2), .res(res));

        real floatERROR = 0;
        real sumErrors = 0;

                initial begin
                    // Initialize Inputs
               //      $vcdpluson;
                    clk = 0;
                    in1 = 0;
                    in2 = 0;


            #100;

                    FileResHex = $fopen(STRINGHEX,"w");
                    FileResDec = $fopen(STRINGDEC,"w");

                     runAdder(FileResHex,FileResDec,(1024));
                    $finish;
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
                            #5;
                            in1 = $random;
                            in2 = $random;
                            ValTeorico = in1 * in2;
                            Error = (res - ValTeorico);
                            if (0>Error) begin
                              Error = (ValTeorico - res);
                            end
                            floatERROR = $bitstoreal(Error)/$bitstoreal(ValTeorico);
                            floatERROR = floatERROR*$itor(100);
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
