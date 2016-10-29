#!/bin/bash

dir_list=(ASIC_cordic_Arch2 ASIC_cordic_Arch3)
for i in "${dir_list[@]}"
do
#CREATE DC STRUCTURE
  sim_syn_dir="$i/integracion_fisica/simulacion_logica_sintesis"
  sim_beh_dir="$i/integracion_fisica/simulacion_logica_behavioral"
  echo $sim_syn_dir
  echo $sim_beh_dir
 # mkdir $i
 # mkdir $i/integracion_fisica
 # mkdir $i/integracion_fisica/front_end
 # mkdir $i/integracion_fisica/front_end/libs
 # mkdir $i/integracion_fisica/front_end/source
 # mkdir $i/integracion_fisica/front_end/db
  mkdir $i/integracion_fisica/front_end/db/SINGLE
  mkdir $i/integracion_fisica/front_end/db/DOUBLE
 # mkdir $i/integracion_fisica/front_end/reports
  mkdir $i/integracion_fisica/front_end/reports/SINGLE
  mkdir $i/integracion_fisica/front_end/reports/DOUBLE
 # mkdir $i/integracion_fisica/front_end/scripts
  #mkdir $i/integracion_fisica/front_end/work
##CREATE SIM FILES
  #mkdir $sim_syn_dir
  #mkdir $sim_syn_dir/SINGLE
  #mkdir $sim_syn_dir/DOUBLE

#  mkdir $sim_beh_dir
 # mkdir $sim_beh_dir/SINGLE
  #mkdir $sim_beh_dir/DOUBLE

#WE COPY THE CELL LIBRARY FROM THIS ROOT
  cp ibm13rflpvt.v $sim_syn_dir/SINGLE
  cp ibm13rflpvt.v $sim_syn_dir/DOUBLE

  cp filelist4sim.sh $sim_beh_dir/SINGLE
  cp filelist4sim.sh $sim_beh_dir/DOUBLE

 # cp get_saif.sh $sim_beh_dir/SINGLE
#  cp get_saif.sh $sim_beh_dir/DOUBLE

  cp get_saif.sh $sim_syn_dir/SINGLE
  cp get_saif.sh $sim_syn_dir/DOUBLE

  sed -i "s/+define+SINGLE \ /+define+DOUBLE \ /g" $sim_syn_dir/DOUBLE/get_saif.sh

  cp run_sim.sh $sim_beh_dir/SINGLE
  cp run_sim.sh $sim_beh_dir/DOUBLE
  
  sed -i "s/+define+SINGLE  \ /+define+DOUBLE \ /g" $sim_syn_dir/DOUBLE/run_sim.sh

  cp run_sim.sh $sim_syn_dir/SINGLE
  cp run_sim.sh $sim_syn_dir/DOUBLE
  
  sed -i "s/+define+SINGLE \ /+define\+DOUBLE \ /g" $sim_syn_dir/DOUBLE/run_sim.sh

  touch $i/integracion_fisica/front_end/scripts/file_list.sh
  chmod 777 $i/integracion_fisica/front_end/scripts/file_list.sh
  echo "#!/bin/bash"    >> $i/integracion_fisica/front_end/scripts/file_list.sh
  echo "find \"../../front_end/source\" -name \"*.v\" >> file_list" >> $i/integracion_fisica/front_end/scripts/file_list.sh

#WE COPY SOME TEMPLATE SCRIPTS
  cp ASIC_fpaddsub_arch3_syn.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/ASIC_fpaddsub_arch3_syn.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn.tcl"
  cp ASIC_fpaddsub_arch3_syn_constraints.tcl $i/integracion_fisica/front_end/scripts
  mv "$i/integracion_fisica/front_end/scripts/ASIC_fpaddsub_arch3_syn_constraints.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn_constraints.tcl"

  cp .synopsys_dc.setup $i/integracion_fisica/front_end

done

find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
