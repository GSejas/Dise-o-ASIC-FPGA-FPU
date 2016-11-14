#!/bin/bash
#dir_list1=(FPU_Multiplication_Function CORDIC_Arch2v1 CORDIC_Arch3v1 FPU_Add_Subtr FPU_PIPELINED_FPADDSUB)

MOD_FILENAME_list=($1)
precision_list=("SINGLE" "DOUBLE")

#multiplicador_lst=("DW_1STAGE" "RKOA_1STAGE" "RKOA_2STAGE" "KOA_1STAGE" "KOA_2STAGE")
max_clk_lst=(ASIC_fpu_syn_constraints_clk1.tcl ASIC_fpu_syn_constraints_clk10.tcl ASIC_fpu_syn_constraints_clk20.tcl ASIC_fpu_syn_constraints_clk30.tcl ASIC_fpu_syn_constraints_clk40.tcl ASIC_fpu_syn_constraints_noclk.tcl)
match_report_string_lst=("Critical Path Length:" "  Leaf Cell Count: " "Cell Area: " "Design Area: ")
dir_list4[0]="              1"
dir_list4[1]="            10"
dir_list4[2]="            20"
dir_list4[3]="            30"
dir_list4[4]="            40"
#dir_list4[4]="            inf"
Txt_design_name[0]="Delay"
Txt_design_name[1]="Celdas"
Txt_design_name[2]="AreaCelda"
Txt_design_name[3]="AreaDiseño"
Txt_design_name[4]="Potencia"
z=0
x=0
#for e in "${multiplicador_lst[@]}"
 # do
for MOD_FILENAME in "${MOD_FILENAME_list[@]}"
do
  for PREC in "${precision_list[@]}"
  do
    for o in "${match_report_string_lst[@]}"
      do
            #echo ${Txt_design_name[$z]} >> "${e}.txt"
             for i in "${max_clk_lst[@]}"
            do
                      output_text=$(find $PREC -name "${MOD_FILENAME}_${i}_GATED_syn_qor.txt" -exec grep -i "$o" {} \;)
                  #echo $output_text
                  number=$(echo $output_text  | grep -oP '[0-9]*\.?[0-9]*' | sed -e "s/^/${dir_list4[$x]}    /")
                  echo $number
                 # echo ${e}
                  #echo "${dir_list4[$z]} $number"

                      echo "           $number" >> "FPU_Reports/${MOD_FILENAME}_${PREC}_${Txt_design_name[$z]}_GATED.csv"

                  x=`expr $x + 1`
            done
            x=0
            z=`expr $z + 1`
     done

     z=0
#done

#for e in "${multiplicador_lst[@]}"
  #do
    # for o in "${match_report_string_lst[@]}"
    #   do
            #echo "Power" >> "${e}.txt"
             for i in "${max_clk_lst[@]}"
            do
                  output_text=$(find $PREC  -name "${MOD_FILENAME}_${i}_GATED_syn_power.txt" -exec grep -i "Total\ \ \ " {} \;)
                  #echo $output_text
                  number=$(echo $output_text  | grep -oP '[0-9]*.(\d+)(?!.*\d)' | sed -e "s/^/${dir_list4[$x]}    /")
                  echo $number
                 # echo ${e}
                  #echo "${dir_list4[$z]} $number"
                  echo "           $number" >> "FPU_Reports/${MOD_FILENAME}_${PREC}_Power_GATED.csv"

                  x=`expr $x + 1`
            done
            x=0
          #  z=`expr $z + 1`
     # done
   done
done
     #z=0
#done
#z=0
