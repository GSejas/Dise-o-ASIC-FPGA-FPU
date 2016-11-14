#!/bin/bash

source bash_reporter.sh "FPU_Add_Subtr* FPU_PIPELINED_FPADDSUB CORDIC_Arch2v1 CORDIC_Arch3v1 CORDIC_Arch2 CORDIC_Arch3"
source bash_reporter_ADDCORDIC.sh "FPU_Interface2 FPU_Multiplication_Function"
source bash_reporter_GATED.sh "FPU_Add_Subtr* FPU_PIPELINED_FPADDSUB CORDIC_Arch2v1 CORDIC_Arch3v1 CORDIC_Arch2 CORDIC_Arch3"
source bash_reporter_ADDCORDIC_Gated.sh "FPU_Interface2 FPU_Multiplication_Function"
