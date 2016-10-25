#!/bin/bash

dir_list=($1)
for i in "${dir_list[@]}"
do
#CREATE DC STRUCTURE
  mkdir $i
  mkdir $i/integracion_fisica
  mkdir $i/integracion_fisica/front_end
  mkdir $i/integracion_fisica/front_end/libs
  mkdir $i/integracion_fisica/front_end/source
  mkdir $i/integracion_fisica/front_end/db
  mkdir $i/integracion_fisica/front_end/reports
  mkdir $i/integracion_fisica/front_end/scripts
  mkdir $i/integracion_fisica/front_end/work
##CREATE SIM FILES
  mkdir $i/integracion_fisica/simulacion_logica_sintesis
  mkdir $i/integracion_fisica/simulacion_logica_sintesis/SINGLE
  mkdir $i/integracion_fisica/simulacion_logica_sintesis/DOUBLE
  mkdir $i/integracion_fisica/simulacion_logica_behavioral
  mkdir $i/integracion_fisica/simulacion_logica_behavioral/SINGLE
  mkdir $i/integracion_fisica/simulacion_logica_behavioral/DOUBLE

#WE COPY THE CELL LIBRARY FROM THIS ROOT
  cp ibm13rflpvt.v $i/integracion_fisica/simulacion_logica_sintesis/SINGLE
  cp ibm13rflpvt.v $i/integracion_fisica/simulacion_logica_sintesis/DOUBLE

#WE COPY SOME TEMPLATE SCRIPTS
  cp ASIC_fpaddsub_arch3_syn.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/ASIC_fpaddsub_arch3_syn.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn.tcl"
  cp ASIC_fpaddsub_arch3_syn_constraints.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/ASIC_fpaddsub_arch3_syn_constraints.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn_constraints.tcl"
  cp .synopsys_dc.setup $i/integracion_fisica/front_end

done
