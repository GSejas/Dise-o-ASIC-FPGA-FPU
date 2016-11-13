vcs -debug_all -full64 -R -PP -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+DOUBLE \
+define+MULT_DW1_DOUBLE \
 -timescale=1ns/1ps   \
 +neg_tchk
 ./simv
    vcd2saif -64 -input vcdplus.vpd -output activity.saif
