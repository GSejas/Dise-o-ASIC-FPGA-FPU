vcs -debug_all -full64 -R -PP -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE \
+define+MULT_DW1_SINGLE \
 -timescale=1ns/1ps   \
 +neg_tchk
 ./simv
    vcd2saif -64 -input vcdplus.vpd -output activity.saif
