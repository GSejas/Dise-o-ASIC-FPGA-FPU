#!/bin/bash

###############################
#Description> This function creates a script inside the simulation files, that will allow the programs
#to estimate the dinamic power utilized.
#Inputs> 1:  The path for the end script file
#              2:  A list of the macros used inside the testbench.
#              3:  Name of the file
#             SOURCE: http://www.googoolia.com/wp/2014/06/07/estimating-power-at-rtl-using-synopsys-design-compiler/
#################################
function SAIF_FILE {
touch "$1/$3"
chmod 777 "$1/$3"
echo "vcs -debug_all -full64 -R -PP -f file_list +v2k +lint=all -l log_name -Mupdate \\" >  "$1/$3"
DEFINE_MACRO_LISTS=($2)
for ELEMENTS_DEFINES in "${DEFINE_MACRO_LISTS[@]}"
do
      echo "+define+$ELEMENTS_DEFINES \\" >>  "$1/$3"
done
echo " -timescale=1ns/1ps   \\" >>  "$1/$3"
echo " +neg_tchk" >>  "$1/$3"
echo " ./simv" >>  "$1/$3"
echo "    vcd2saif -64 -input vcdplus.vpd -output activity.saif" >>  "$1/$3"
}

function RUN_SIM_FILE {
touch "$1/$3"
chmod 777 "$1/$3"
echo "#!/bin/bash"  >> "$1/$3"
echo "vcs -full64 -gui -R -f file_list +v2k +lint=all -l log_name -Mupdate \\" >>  "$1/$3"
DEFINE_MACRO_LISTS=($2)
for ELEMENTS_DEFINES in "${DEFINE_MACRO_LISTS[@]}"
do
      echo "+define+$ELEMENTS_DEFINES \\" >>  "$1/$3"
done
echo "-timescale=1ns/1ps   \\" >>  "$1/$3"
echo "+neg_tchk \\" >>  "$1/$3"
echo "+sdfverbose" >>  "$1/$3"

}

function file_list_FILE {
  touch "$1/$2"
  chmod 777 "$1/$2"
  echo "#!/bin/bash"    >> "$1/$2"
  echo "ls ../source/. > file_list" >>"$1/$2"

  }

function file_list_SIM_FILE {
  touch "$1/$2"
  chmod 777 "$1/$2"
  echo "#!/bin/bash"    >> "$1/$2"
  echo 'find "../../front_end/source" -name "*.v" >> file_list' >>"$1/$2"

  }

##################START OF MAIN ##################
#############################################

dir_list=($1)
pres_list=($2)
for i in "${dir_list[@]}"
do
for PRES in "${pres_list[@]}"
    do
    #CREATE DC STRUCTURE
      sim_syn_dir="$i/integracion_fisica/simulacion_logica_sintesis"
      sim_beh_dir="$i/integracion_fisica/simulacion_logica_behavioral"
      mkdir $i
      mkdir $i/integracion_fisica
      mkdir $i/integracion_fisica/front_end
      mkdir $i/integracion_fisica/front_end/libs
      mkdir $i/integracion_fisica/front_end/source
      mkdir $i/integracion_fisica/front_end/db
      mkdir $i/integracion_fisica/front_end/db/$PRES
      mkdir $i/integracion_fisica/front_end/reports
      mkdir $i/integracion_fisica/front_end/reports/$PRES
      mkdir $i/integracion_fisica/front_end/scripts
     mkdir $i/integracion_fisica/front_end/work
    ##CREATE SIM FILES
      mkdir $sim_syn_dir
     mkdir $sim_syn_dir/$PRES

      mkdir $sim_beh_dir
      mkdir $sim_beh_dir/$PRES

    #WE COPY THE CELL LIBRARY FROM THIS ROOT
      cp ibm13rflpvt.v $sim_syn_dir/$PRES

    #SAIF SCRIPT FILES ARE CREATED
      SAIF_FILE "$sim_beh_dir/$PRES" "$PRES" "get_saif.sh"
      SAIF_FILE "$sim_syn_dir/$PRES" "$PRES" "get_saif.sh"

    #RUN SCRIPT FILES ARE CREATED FOR EACH PRECISION
      RUN_SIM_FILE "$sim_beh_dir/$PRES" "$PRES" "run_sim.sh"
      RUN_SIM_FILE "$sim_syn_dir/$PRES" "$PRES" "run_sim.sh"

      #CREATE SCRIPT THAT SEARCHES FOR VERILOG FILES IN SOURCE
      file_list_SIM_FILE "$sim_beh_dir/$PRES" "filelist4sim.sh"

      file_list_FILE "$i/integracion_fisica/front_end/scripts" "file_list.sh"

    #WE COPY SOME TEMPLATE SCRIPTS
      cp ASIC_DesignTemplate_syn.tcl $i/integracion_fisica/front_end/scripts
      mv "$i/integracion_fisica/front_end/scripts/ASIC_DesignTemplate_syn.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn.tcl"
      cp ASIC_DesignTemplate_syn_constraints.tcl $i/integracion_fisica/front_end/scripts
      mv "$i/integracion_fisica/front_end/scripts/ASIC_DesignTemplate_syn_constraints.tcl" "${i}/integracion_fisica/front_end/scripts/${i}_syn_constraints.tcl"
      cp .synopsys_dc.setup $i/integracion_fisica/front_end
    done
done

find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
