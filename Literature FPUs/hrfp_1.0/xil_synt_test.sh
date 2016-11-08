#!/bin/bash
#
# A small script that will synthesize and place and route a HDL
# design using XST for synthesis and the backend tools
# provided by Xilinx for place & route.
# 
# Version 1.1
# Written by Andreas Ehliar <ehliar@isy.liu.se>
# You may consider this script as public domain
#
# Usage: sh xil_synt_test.sh design.v design.ucf submodule.v submodule2.vhd
# (The UCF file is optional)
#
# Tested on Linux with ISE 7.1, 8.1, 8.2, 9.1 and 9.2

echo "xil_synt_test.sh V1.1 by Andreas Ehliar <ehliar@isy.liu.se>"

basename=$(echo "$1" | sed s/\\..*$//g)
basename=$(basename $basename)
echo "The basename is $basename out of $1"

# Change to the part you are targetting!
#export PART=xc2v4000-4-ff1152
if [ -z "$PART" ]
then
    export PART=xc6slx25-2-fgg484
fi
# The directory it will synthesize in
export WORKDIR=testsynthdir

if test -d $WORKDIR
then
    echo "$WORKDIR already exists, contents is:"
    ls $WORKDIR
    echo "Removing $WORKDIR in 5 seconds, press ctrl c if you want to abort"
    sleep 1
    echo 4
    sleep 1
    echo 3
    sleep 1
    echo 2
    sleep 1
    echo 1
    sleep 1
    echo "Removing $WORKDIR"
    rm -rf $WORKDIR
fi

mkdir $WORKDIR


# Options to the XST synthesizer

(cat <<EOF
set -tmpdir tmpdir
set -xsthdpdir xst
run -ifn design.prj
-ifmt mixed -ofn $basename
-ofmt NGC -p $PART
-top $basename                   
-shreg_extract NO         
EOF
) >> $WORKDIR/design.scr
#-register_balancing Yes

### -opt_mode Speed           
### -opt_level 1              
### -iuc NO                   
### -keep_hierarchy YES       
### -rtlview Yes              
### -glob_opt AllClockNets    
### -read_cores YES           
### -write_timing_constraints NO 
### -cross_clock_analysis NO  
### -hierarchy_separator /    
### -bus_delimiter <>         
### -case maintain            
### -slice_utilization_ratio 100 
### -fsm_extract YES          
### -fsm_encoding Auto        
### -safe_implementation No   
### -fsm_style lut            
### -ram_extract Yes          
### -ram_style Auto           
### -rom_extract Yes          
### -shreg_extract NO         
### -rom_style Auto           
### -resource_sharing YES     
### -iobuf yes
### -max_fanout 500           
### -bufg 16                  
### -register_duplication YES 
### -register_balancing Yes
### -optimize_primitives NO   
### -use_clock_enable Auto    
### -use_sync_set Auto        
### -use_sync_reset Auto      
### -iob true
### -equivalent_register_removal YES
### -slice_utilization_ratio_maxmargin 5

echo "Adding files to $WORKDIR/design.prj:"

# Make sure the file exists before doing anything else...
touch $WORKDIR/design.prj.tmp

UCFFILE=""
# Try to figure out the languages of the source files
for i in $*
do
  echo -n "$i "

#  if [[ "$i" =~ "[vV]$" ]]
  if echo "$i" | egrep "[vV]$"
  then
      echo "verilog work \"$PWD/$i\"" >> $WORKDIR/design.prj.tmp
#  elif [[ "$i" =~ "[vV][hH][dD][lL]?$" ]]
  elif echo "$i" | egrep "[vV][hH][dD][lL]?$"
  then
      echo "vhdl work \"$PWD/$i\"" >> $WORKDIR/design.prj.tmp
#  elif [[ "$i" =~ "[uU][cC][fF]$" ]]
  elif echo "$i" | egrep "[uU][cC][fF]$"
  then
      echo "UCF file is set to $i"
      UCFFILE="-uc $PWD/$i"
  else
      echo "Does not recognize file extension on $i, aborting"
      exit 1
  fi

done

# We are sorting the design here to allow for tricks like
# xil_synt_test.sh toplevel.v *.v
# without getting errors because toplevel.v was included twice
sort $WORKDIR/design.prj.tmp | uniq > $WORKDIR/design.prj
echo



cd $WORKDIR
mkdir tmpdir
mkdir xst
mkdir _ngo
STARTTIME=$(date +%s)
# Remove the line with the xdl generation unless you want the xdl file for some
# reason. (eg. running xdlanalyze.pl on it.)
xst -ifn design.scr -ofn $basename.syr &&\
 ngdbuild $UCFFILE -dd _ngo -nt timestamp -p $PART "$basename.ngc" "$basename.ngd" &&\
 map -xe n -ol high -register_duplication off -detail -ignore_keep_hierarchy -pr b -u -p $PART  -c 100 -o "${basename}_map.ncd" "$basename.ngd" "$basename.pcf" &&\ 
 par -nopad  -w -ol high  "${basename}_map.ncd" "$basename.ncd" "$basename.pcf" &&\
 trce -v 1000 "$basename.ncd" "$basename.pcf" &&\
 xdl -ncd2xdl "$basename.ncd" &&\
 bitgen -g StartupClk:JtagClk "$basename.ncd"



echo "Finished, synthesis took $(( $(date +%s) - $STARTTIME)) seconds"
