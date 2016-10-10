#!/bin/bash
dir_list=(ASIC_cordic_Arch2 ASIC_cordic_Arch3 ASIC_fpaddsub_arch2 ASIC_fpaddsub_arch3 ASIC_fpmult_arch2 ASIC_fpmult_arch3 ASIC_KOA ASIC_RKOA)

for i in "${dir_list[@]}"
do
#WE COPY FROM ONE PLACE TO THE OTHER
  cp counter_syn_constraints.tcl $i/integracion_fisica/front_end/scripts
#WE RENAME ACCORDINLY  
  mv "$i/integracion_fisica/front_end/scripts/counter_syn_constraints.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn_constraints.tcl"
#WE COPY THE CONSTRAINTS EVERYWHERE
  cp .synopsys_dc.setup $i/integracion_fisica/front_end
done
