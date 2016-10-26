These are different tcl scripts for synplify. Their right place is in /syn directory of the present Leon version in use.

It is possible to use synplify from the command line by creating one tcl file from the prj, and adding some lines in the following way:

project -new
tcl commands (actually the file.prj)
project -run

The above lines should be stored in one file.tcl, and to synthesize use command:
synplify_pro -batch file.tcl

Luis Azuara.
