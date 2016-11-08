#!/bin/bash
#IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat copy_sources.sh))'
#echo "${XYZ[5]}"

#for i in "${IFS[@]}"
#do
#  cp $i -
#done

dir_list1=(DW_1STAGE RKOA_1STAGE RKOA_2STAGE KOA_1STAGE KOA_2STAGE)
dir_list2=(ASIC_fpu_syn_constraints_clk10.tcl ASIC_fpu_syn_constraints_clk20.tcl ASIC_fpu_syn_constraints_clk30.tcl ASIC_fpu_syn_constraints_clk40.tcl ASIC_fpu_syn_constraints_noclk.tcl)
dir_list3=("Critical Path Length:" "Total\ \ \ " )
for i in "${dir_list1[@]}"
do
     for i in "${dir_list2[@]}"
    do
      find . -name "FPU_Interface2_$dir_list2\_$dir_list1\_syn_qor.txt" -exec grep -i "Cell Area" {} \;

    done
done
