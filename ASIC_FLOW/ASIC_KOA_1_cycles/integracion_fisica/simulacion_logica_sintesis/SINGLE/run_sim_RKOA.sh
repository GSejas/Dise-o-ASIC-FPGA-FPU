#!/bin/bash
./$HOME/bash_syn_ibm_2016

vcs -full64 -gui -R -f file_list_RKOA +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
-timescale=1ns/1ps   \
+neg_tchk \
+sdfverbose
