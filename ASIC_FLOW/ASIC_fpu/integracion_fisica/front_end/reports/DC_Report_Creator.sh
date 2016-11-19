#!/bin/bash
rm FPU_Reports/*.csv
rm *.txt
source bash_reporter.sh "FPU_Add_Subtract_Function FPU_PIPELINED_FPADDSUB CORDIC_Arch2v1 CORDIC_Arch3v1 CORDIC_Arch2 CORDIC_Arch3" "10 20 30 40"
source bash_reporter_ADDCORDIC.sh "FPU_Interface2 FPU_Multiplication_Function" "10 20 30 40"
source bash_reporter_GATED.sh "FPU_Add_Subtract_Function FPU_PIPELINED_FPADDSUB CORDIC_Arch2v1 CORDIC_Arch3v1 CORDIC_Arch2 CORDIC_Arch3" "10 20 30 40"
source bash_reporter_Gated.sh "FPU_Interface2 FPU_Multiplication_Function" "10 20 30 40"
