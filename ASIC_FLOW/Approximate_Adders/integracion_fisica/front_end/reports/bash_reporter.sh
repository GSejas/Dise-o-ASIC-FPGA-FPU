#!/bin/bash
#dir_list1=(FPU_Multiplication_Function CORDIC_Arch2v1 CORDIC_Arch3v1 FPU_Add_Subtr FPU_PIPELINED_FPADDSUB)

MOD_FILENAME_list=($1)
Accuracy_MOD_FILENAME_list=($2)
#precision_list=("SINGLE" "DOUBLE")

#multiplicador_lst=("DW_1STAGE" "RKOA_1STAGE" "RKOA_2STAGE" "KOA_1STAGE" "KOA_2STAGE")
#max_clk_lst=(ASIC_fpu_syn_constraints_clk1.tcl ASIC_fpu_syn_constraints_clk10.tcl ASIC_fpu_syn_constraints_clk20.tcl ASIC_fpu_syn_constraints_clk30.tcl ASIC_fpu_syn_constraints_clk40.tcl)
max_clk_lst=($2)
match_report_string_lst=("Critical Path Length:" "  Leaf Cell Count: " "Cell Area: " "Design Area: ")
# dir_list4[0]="              1,"

Txt_design_name[0]="Delay"
Txt_design_name[1]="Celdas"
Txt_design_name[2]="AreaCelda"
Txt_design_name[3]="AreaDiseño"
Txt_design_name[4]="Potencia"
z=0

for MOD_FILENAME in "${MOD_FILENAME_list[@]}"
do
  # for PREC in "${precision_list[@]}"
  # do
    for o in "${match_report_string_lst[@]}"
      do
            #echo ${Txt_design_name[$z]} >> "${e}.txt"
            #  for i in "${max_clk_lst[@]}"
            # do
                      output_text=$(find $PWD -name "${MOD_FILENAME}_syn_qor.txt" -exec grep -i "$o" {} \;)
                  #echo $output_text
                  number=$(echo $output_text  | grep -oP '[0-9]*\.?[0-9]*' | sed -e "s/^/${MOD_FILENAME},    /")
                  echo $number
                 # echo ${e}
                  #echo "${dir_list4[$z]} $number"
                  echo "           $number" >> "./${Txt_design_name[$z]}.csv"
            #done

            z=`expr $z + 1`
     done

     z=0
#done

#for e in "${multiplicador_lst[@]}"
  #do
    # for o in "${match_report_string_lst[@]}"
    #   do
            #echo "Power" >> "${e}.txt"
            #  for i in "${max_clk_lst[@]}"
            # do
                  output_text=$(find $PWD  -name "${MOD_FILENAME}_syn_power.txt" -exec grep -i "Total\ \ \ " {} \;)
                  #echo $output_text
                  number=$(echo $output_text  | grep -oP '[0-9]*\.(\d+)([eE][-+]?[0-9]+)?(?!.*\d)+' | sed -e "s/^/${MOD_FILENAME},    /")
                  echo $number
                 # echo ${e}
                  #echo "${dir_list4[$z]} $number"
                  echo "           $number" >> "./Power.csv"

                  x=`expr $x + 1`
         #   done
            x=0
     # done
   #done
done
     #z=0
#done
#z=0
for Accuracy_MOD_FILENAME in "${Accuracy_MOD_FILENAME_list[@]}"
do
 output_text=$(find $PWD  -name "Resultados${Accuracy_MOD_FILENAME}DEC.txt" -exec grep -i "La media del error es>" {} \;)
                  #echo $output_text
                  number=$(echo $output_text  | grep -oP '[0-9]*\.(\d+)([eE][-+]?[0-9]+)?(?!.*\d)+' | sed -e "s/^/${Accuracy_MOD_FILENAME},    /")
                  echo $number
                  echo "           $number" >> "./AvgError.csv"
done
