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
  mkdir $i
  mkdir $i/integracion_fisica
  mkdir $i/integracion_fisica/front_end
  mkdir $i/integracion_fisica/front_end/libs
  mkdir $i/integracion_fisica/front_end/source
  mkdir $i/integracion_fisica/front_end/db
  mkdir $i/integracion_fisica/front_end/reports
  mkdir $i/integracion_fisica/front_end/scripts
  mkdir $i/integracion_fisica/front_end/work
  mkdir $i/integracion_fisica/simulacion_logica_sintesis
  mkdir $i/integracion_fisica/simulacion_logica_behavioral
  cp ibm13rflpvt.v $i/integracion_fisica/simulacion_logica_sintesis
  cp counter_syn.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/counter_syn.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn.tcl"
  cp counter_syn_constraints.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/counter_syn_constraints.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn_constraints.tcl"
  cp .synopsys_dc.setup $i/integracion_fisica/front_end
done
