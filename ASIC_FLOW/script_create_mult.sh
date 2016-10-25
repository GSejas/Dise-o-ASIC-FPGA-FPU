#!/bin/bash

dir_list=(FPMultiplierKaratsuba_8_23_8_23_8_23 FPMultiplier_8_23_8_23_8_23_uid2)
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
  cp ASIC_fpaddsub_arch3_syn.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/ASIC_fpaddsub_arch3_syn.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn.tcl"
  cp ASIC_fpaddsub_arch3_syn_constraints.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/ASIC_fpaddsub_arch3_syn_constraints.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn_constraints.tcl"
  cp .synopsys_dc.setup $i/integracion_fisica/front_end
done
