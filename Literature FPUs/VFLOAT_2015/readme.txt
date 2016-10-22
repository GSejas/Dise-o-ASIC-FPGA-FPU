VFLOAT: The Northeastern Variable precision FLOATing point library

By:  Xin Fang and Miriam Leeser
Reconfigurable and GPU Computing Laboratory, Northeastern University.

License Statement:  GPL
--******************************************************************************--
--                                                                              --
--	Copyright (C) 2015		                                                    --
--                                                                              --
--	This program is free software; you can redistribute it and/or				--
--	modify it under the terms of the GNU General Public License                 --
--	as published by the Free Software Foundation; either version 3              --
--	of the License, or (at your option) any later version.                      --
--                                                                              --
--	This program is distributed in the hope that it will be useful,             --
--	but WITHOUT ANY WARRANTY; without even the implied warranty of              --
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               --
--	GNU General Public License for more details.                                --
--                                                                              --
--	You should have received a copy of the GNU General Public License           --
--	along with this program.  If not, see<http://www.gnu.org/licenses/>.        --
--                                                                           	--
--******************************************************************************--

Required Tools and Version Numbers: 

	Xilinx ISE Design Tools 14.2 or higher version; Or, Altera Quartus II 13.0 or higher

Overview of Files: 

	All of the arithmetic floating point modules of VFLOAT are in the folder "Variable Precision Modules".  User should go through the readme.txt file fore each intended module folder. 

	Exclusive modules for different operations are in their own variable precision module folder, for example, files variable_precision_divider.vhd, fp_div,vhd and div.vhd are in folder "variable_precision_divider" folder.

	The common modules are in the folder named "General Modules".

	The "TABLE" folder is where the look up table data is for division, reciprocal and square root operations.

Interfaces:

	INPUT: CLK, RESET, STALL, OPERAND(s), READY, ROUND, EXCEPTION_IN;
	OUTPUT: DONE, RESULT, EXCEPTION_OUT.
	
	CLK 			:	clock
	RESET 			:	reset signal, active high
	STALL 			:	stop the operation until it is low
	OPERAND(s)		:	operand(s) input
	READY			:	ready signal for input data
	ROUND			:	round mode ('0' is truncation, and '1' is round to the nearest, ties to even)
	EXCEPTION_IN	:	exception input signal
	
	DONE			:	operation complete signal
	RESULT			:	operation result
	EXCEPTION_OUT	:	exception output signal
	
Build Instructions:
Follow the readme file in each variable precision module folder and copy all the required files in one place. Note that some modules might be duplicated when copying, and just keep one. Build IP cores if necessary.
	
May. 2015
