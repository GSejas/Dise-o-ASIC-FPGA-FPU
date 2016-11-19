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
    #First argument is the end path for this script
    #Second argument is the macro list for the run sim
  #Third argument is the name of the script
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
    #First argument is the end path for this script
  #Second argument is the name of the script
  touch "$1/$2"
  chmod 777 "$1/$2"
  echo "#!/bin/bash"    >> "$1/$2"
  echo "ls ../source/. > file_list" >>"$1/$2"

  }

function file_list_SIM_FILE {
  #First argument is the end path for this script
  #Second argument is the name of the script
  touch "$1/$2"
  chmod 777 "$1/$2"
  echo "#!/bin/bash"    >> "$1/$2"
  echo 'find "../../front_end/source" -name "*.v" >> file_list' >>"$1/$2"

  }

function file_list_SIM_FILE_synth {
    #First argument is the end path for this script
  #Second argument is the name of the script
  touch "$1/$2"
  chmod 777 "$1/$2"
  echo "#!/bin/bash"    >> "$1/$2"
  echo 'find "../../front_end/db/PRECISION_NAME/*.v" -name "*.v" >> file_list' >>"$1/$2"
  echo 'find "." -name "*.v" >> file_list' >>"$1/$2"
  }


##################START OF MAIN ##################
#############################################
#This dir_list holds a list of the files to be created
dir_list=($1)
precision_list=("ACAI" "ACAII" "ETAI" "GDA" "RCA" "LOA" "GeAr")
sim_syn_dir="simulacion_logica_sintesis"
sim_beh_dir="simulacion_logica_behavioral"
for i in "${dir_list[@]}"
do
    ##CREATE SIM FILES
    mkdir  $sim_syn_dir/$i
    #WE COPY THE CELL LIBRARY FROM THIS ROOT
    cp ibm13rflpvt.v $sim_syn_dir/$i


    for PRES in "${precision_list[@]}"
    do

    #SAIF SCRIPT FILES ARE CREATED
      SAIF_FILE "$sim_syn_dir/$i/$PRES" "$PRES" "get_saif_$i$PRES.sh"

    #RUN SCRIPT FILES ARE CREATED FOR EACH PRECISION
      RUN_SIM_FILE "$sim_syn_dir/$i/$PRES" "$PRES" "run_sim_$i$PRES.sh"

      #CREATE SCRIPT THAT SEARCHES FOR VERILOG FILES IN SOURCE
      file_list_SIM_FILE_synth "$sim_syn_dir/$i/$PRES" "filelist4sim.sh"

    done
done

find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
