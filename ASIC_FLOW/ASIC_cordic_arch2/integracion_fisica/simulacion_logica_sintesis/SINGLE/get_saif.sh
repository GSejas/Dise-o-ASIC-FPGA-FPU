#!/bin/bash
#SOURCE: http://www.googoolia.com/wp/2014/06/07/estimating-power-at-rtl-using-synopsys-design-compiler/
vcs -debug_all -full64 -R -PP -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
 -timescale=1ns/1ps   \
 +neg_tchk
 
 ./simv
    vcd2saif -64 -input vcdplus.vpd -output activity.saif
