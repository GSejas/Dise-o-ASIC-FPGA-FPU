#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim tb_multiplier_behav -key {Behavioral:KOA_RECURSIVE:Functional:tb_multiplier} -tclbatch tb_multiplier.tcl -log simulate.log
