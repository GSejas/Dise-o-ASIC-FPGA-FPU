#!/bin/bash
vcs -full64 -gui -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+DOUBLE \
+define+MULT_RKOA2_DOUBLE \
-timescale=1ns/1ps   \
+neg_tchk \
+sdfverbose
