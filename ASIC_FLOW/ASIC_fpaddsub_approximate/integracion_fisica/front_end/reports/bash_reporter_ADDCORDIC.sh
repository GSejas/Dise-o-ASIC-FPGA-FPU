#!/bin/bash
#dir_list1=( FPU_Interface2 FPU_Multiplication_Function CORDIC_Arch2v1 CORDIC_Arch3v1 FPU_Add_Subtr FPU_PIPELINED_FPADDSUB)

#MOD_FILENAME_list=("FPU_Interface2" "FPU_Multiplication_Function")
MOD_FILENAME_list=($1)
precision_list=("SINGLE" "DOUBLE")
multiplicador_lst=("DW_ADDER" "LOA" "ACAIN16Q4" "ETAIIN16Q4" "ETAIIN16Q8" "ACAIIN16Q4" "ACAIIN16Q8" "GDAN16M4P4" "GDAN16M4P8" "GeArN16R2P4" "GeArN16R4P4" "GeArN16R4P8" "GeArN16R6P4")
max_clk_lst=($2)
match_report_string_lst=("Critical Path Length:" "  Leaf Cell Count: " "Cell Area: " "Design Area: ")
# dir_list4[0]="              1,"
# dir_list4[1]="            10,"
# dir_list4[2]="            20,"
# dir_list4[3]="            30,"
# dir_list4[4]="            40,"
# dir_list4[5]="          100,"
Txt_design_name[0]="Delay"
Txt_design_name[1]="Celdas"
Txt_design_name[2]="AreaCelda"
Txt_design_name[3]="AreaDiseño"
Txt_design_name[4]="Potencia"
z=0
x=0
for MOD_FILENAME in "${MOD_FILENAME_list[@]}"
do
  for PREC in "${precision_list[@]}"
  do
    for e in "${multiplicador_lst[@]}"
      do
        for o in "${match_report_string_lst[@]}"
          do
                #echo ${Txt_design_name[$z]} >> "${e}.txt"

                 for i in "${max_clk_lst[@]}"
                do
                      output_text=$(find $PREC -name "${MOD_FILENAME}_ASIC_fpadd_approx_syn_constraints_clk${i}.tcl_${e}_syn_qor.txt" -exec grep -i "$o" {} \;)
                      #echo $output_text
                      number=$(echo $output_text  | grep -oP '[0-9]*\.?[0-9]*' | sed -e "s/^/${i},       /")
                      echo $number
                     # echo ${e}
                      #echo "${dir_list4[$z]} $number"

                      echo "           $number" >> "FPU_Reports/${MOD_FILENAME}_${PREC}_${Txt_design_name[$z]}_${e}.csv"

                      x=`expr $x + 1`
                done
                x=0
                  echo "\pgfplotstableread[col sep = comma]{FPU_Reports/${MOD_FILENAME}_${PREC}_${Txt_design_name[$z]}_${e}.csv}{\\${MOD_FILENAME}${PREC}${Txt_design_name[$z]}${e}}
" >> "LatexCode.txt"
                z=`expr $z + 1`
         done

         z=0
    done

    for e in "${multiplicador_lst[@]}"
      do
        # for o in "${match_report_string_lst[@]}"
        #   do
                #echo "Power" >> "${e}.txt"
                 for i in "${max_clk_lst[@]}"
                do
                      output_text=$(find $PREC  -name "${MOD_FILENAME}_ASIC_fpadd_approx_syn_constraints_clk${i}.tcl_${e}_syn_power.txt" -exec grep -i "Total\ \ \ " {} \;)
                      #echo $output_text
                      number=$(echo $output_text  | grep -oP '[0-9]*\.(\d+)([eE][-+]?[0-9]+)?(?!.*\d)+' | sed -e "s/^/${i},      /")
                      echo $number
                     # echo ${e}
                      #echo "${dir_list4[$z]} $number"
                      echo "           $number" >> "FPU_Reports/${MOD_FILENAME}_${PREC}_Power_${e}.csv"

                      x=`expr $x + 1`
                done
                x=0
                echo "\pgfplotstableread[col sep = comma]{FPU_Reports/${MOD_FILENAME}_${PREC}_Power_${e}.csv}{\\${MOD_FILENAME}${PREC}Power${e}}
" >> "LatexCode.txt"
      done
  done
  #z=0
done

