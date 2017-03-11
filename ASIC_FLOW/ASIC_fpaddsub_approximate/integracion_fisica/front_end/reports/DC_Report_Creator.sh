#!/bin/bash
#This script erases the past created reports, and recreates new ones
#depending on the creating of new ones, or tweaks on the reports.
rm FPU_Reports/*.csv
rm *.txt
source bash_reporter_ADDCORDIC.sh "FPU_PIPELINED_FPADDSUB" "1 10 20 30 40"
