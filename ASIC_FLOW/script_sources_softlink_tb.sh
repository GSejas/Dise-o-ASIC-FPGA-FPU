#!/bin/bash
#IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat copy_sources.sh))'
#echo "${XYZ[5]}"

#for i in "${IFS[@]}"
#do
#  cp $i -
#done

dir_list=(ASIC_cordic_Arch2 ASIC_cordic_Arch3 ASIC_fpaddsub_arch2 ASIC_fpaddsub_arch3 ASIC_fpmult_arch2 ASIC_fpmult_arch3 ASIC_KOA ASIC_RKOA)
for i in "${dir_list[@]}"
do
  touch $i/integracion_fisica/simulacion_logica_behavioral/SINGLE/file_tb_source
  ls $i/integracion_fisica/front_end/source >> $i/integracion_fisica/simulacion_logica_behavioral/SINGLE/file_tb_source
  ls $PWD/../my_sourcefiles/Source_Files/Testbench
  ln --symbolic $PWD/../my_sourcefiles/Source_Files/Testbench/${i:5}/*.v $i/integracion_fisica/front_end/source/.
done

#find $PWD -type d -name "source" -exec cp -Rp temp '{}' \;

#ln --symbolic ../my_sourcefiles DESTINY

