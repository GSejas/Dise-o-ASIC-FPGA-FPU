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
  #rm -r $i/integracion_fisica/simulacion_logica_behavioral
  #rm -r $i/integracion_fisica/simulacion_logica_sintesis

  mkdir $i/integracion_fisica/simulacion_logica_sintesis
  mkdir $i/integracion_fisica/simulacion_logica_behavioral

  mkdir $i/integracion_fisica/simulacion_logica_sintesis/SINGLE
  mkdir $i/integracion_fisica/simulacion_logica_sintesis/DOUBLE
  mkdir $i/integracion_fisica/simulacion_logica_behavioral/SINGLE
  mkdir $i/integracion_fisica/simulacion_logica_behavioral/DOUBLE
  cp ibm13rflpvt.v $i/integracion_fisica/simulacion_logica_sintesis/SINGLE   
  cp ibm13rflpvt.v $i/integracion_fisica/simulacion_logica_sintesis/DOUBLE 	
done


