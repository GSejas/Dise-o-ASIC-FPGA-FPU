#!/bin/bash
./$HOME/bash_syn_ibm_2016
vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+ACAIN16Q4  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+ETAIIN16Q4  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+ETAIIN16Q8  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+ACAIIN16Q4  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+ACAIIN16Q8  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+GDAN16M4P4  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+GDAN16M4P8 \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+GeArN16R2P4  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+GeArN16R4P4  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+GeArN16R4P8  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+LOA  \
-timescale=1ns/1ps   \
+neg_tchk

vcs -full64 -PP -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+SINGLE  \
+define+GeArN16R6P4  \
-timescale=1ns/1ps   \
+neg_tchk
