/*
  TaMaDiCore evaluation of worst cases for rounding functions without 
  overheating the planet

  This file is part of the FloPoCo project 
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Author :   Bogdan Pasca

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

 */

#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <vector>
#include <math.h>
#include <string.h>
#include <gmp.h>
#include <mpfr.h>
#include <cstdlib>
#include <gmpxx.h>
#include <utils.hpp>
#include <Operator.hpp>
#include <IntAddition/IntAdderSpecific.hpp>

#include "TaMaDiCore.hpp"
//#define IAS

using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiCore::TaMaDiCore(Target* target, int wp, int d, int iterations, int wIntervalID, int compSize):
	Operator(target), wp(wp),d(d), iterations(iterations), wIntervalID(wIntervalID) 
	{
		srcFileName="TaMaDiCore";
		ostringstream name;

		name <<"TaMaDiCore_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		addInput   ("SerialPin", wp);
		addInput   ("Initialize");
		addInput   ("IntervalID",wIntervalID);
		addInput   ("CE");

		int counterWidth = intlog2(iterations-1);
		addOutput ("potentialUlpNumber", counterWidth);
		addOutput ("potentialInterval", wIntervalID);
		addOutput ("potentialOutput");

		addOutput ("finished"); 
		 
		/* computing core description */

		/* describe the counter */
		int countSize = intlog2(1+d+1+1);
		
		/* counter that manages registering the Interval identifier */
		vhdl << tab << " process(clk, rst, CE, Initialize) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' then" << endl;
		vhdl << tab << "               "<<declare("iid",wIntervalID)<<" <=  (others => '0');" << endl;
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "            if CE='1' and Initialize='1' then"<<endl;
		vhdl << tab << "               iid <=  IntervalID;" << endl;
		vhdl << tab << "            end if; "<<endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		/* a register flag that signals if this unit is ready to receive work */
		vhdl << tab << " process(clk, rst, CE, Initialize, fin) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' or fin='1' then" << endl;
		vhdl << tab << "               "<<declare("ready")<<" <=  '1';" << endl;
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "         	ready <=  ready and (not Initialize);" << endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		/* a state counter. */
		/* state 0 - idle */
		/* state 1 - write the constant register */
		/* states 2 to d+1 are used for the select lines of the d multiplexers */		
		/* state d+2 is used to increment the ulp counter */
		vhdl << tab << " process(clk, rst, CE, Initialize, state_counter) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' or state_counter=\"" << unsignedBinary(1+d+1+1, countSize) <<"\" then" << endl;
		/* the idle mode for the coutner is state encoded by 0000 */
		vhdl << tab << "               "<< declare("state_counter", countSize) << " <=  (others => '0');" << endl; 
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "			if (CE='1' and Initialize='1') or (CE='1' and state_counter > 0) then " <<endl;
		vhdl << tab << "               state_counter <=  state_counter + 1;" << endl;
		vhdl << tab << "            end if; "<<endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		/* the register for the constant */	
		vhdl << tab << " process(clk, rst, CE, state_counter) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' then" << endl;
		vhdl << tab << "              "<<declare("c", wp) << " <=  (others => '0');" << endl;
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "            if CE='1' and state_counter=\""<<unsignedBinary(1, countSize)<<"\" then " << endl;
		vhdl << tab << "               c <=  SerialPin;" << endl;
		vhdl << tab << "         	end if;" << endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		/* the multiplexer signals */
		for (int i=0; i<d; i++)
			vhdl << tab << declare( join("select",i) ) << "<= '1' when (state_counter=\""<<unsignedBinary(i+2,countSize)<<"\") else '0';"<<endl;

		/* now we describe the pairs of multiplexer-adders */
		for(int i=0; i<d; i++){
			vhdl << tab << declare( join("mux",i), wp) << " <= SerialPin when " << join("select",i) << " = '1' else "<< join("adder",i) << ";" << endl;
		}

		/* the register for the constant */	
		vhdl << tab << " process(clk, rst, CE) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' then" << endl;
		for (int i=0; i<d; i++)
			vhdl << tab << "             " << declare( join("adder",i), wp ) << " <= (others => '0');"<<endl;
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "            if CE='1' then " << endl;
		for (int i=0; i<d; i++)
			if (i==0)
				vhdl << tab << "               "<<join("adder",i) << "<= " << join("mux",i) << " + c;" << endl;
			else
				vhdl << tab << "               "<<join("adder",i) << "<= " << join("mux",i) << " + " << join("adder",i-1) << ";" << endl;
		vhdl << tab << "         	end if;" << endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		/* finally, the ULP counter, the value that we use to indetify where the HR case is in this interval */
		vhdl << tab << " process(clk, rst, CE, Initialize, state_counter, ulp_counter) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' or Initialize='1'  then" << endl;
		vhdl << tab << "              " << declare("ulp_counter",counterWidth) << " <= (others => '0');" << endl;
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "            if (CE='1' and state_counter=\""<<unsignedBinary(d+2,countSize) << "\") or (CE='1' and ulp_counter>0)" << " then"<<endl;
		vhdl << tab << "               ulp_counter <=  ulp_counter + 1;" << endl;
		vhdl << tab << "            end if; "<<endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		/* one comparator */
		vhdl << tab << "potentialUlpNumber <= ulp_counter;" << endl; /*permanent*/
		vhdl << tab << "potentialInterval <= iid;"<<endl;

		vhdl << tab << "potentialOutput <= '1' when ("<<join("adder",d-1)<<range(wp-1, wp-compSize)<<"="<<"\"1"<<zg(compSize-1,1)<<" or "
		                                              <<join("adder",d-1)<<range(wp-1, wp-compSize)<<"="<<"\"0"<<og(compSize-1,1) <<") else '0';"<<endl;


		vhdl << tab << declare("fin") << " <= '1' when ulp_counter=CONV_STD_LOGIC_VECTOR("<<iterations-1<<","<<counterWidth<<") else '0';"<<endl;
		vhdl << tab << "finished <= ready;"<<endl;
	}

	TaMaDiCore::~TaMaDiCore() {
	}
	
	void TaMaDiCore::outputVHDL(std::ostream& o, std::string name) {
		ostringstream signame;
		licence(o);
		pipelineInfo(o);
		o << "library ieee; " << endl;
		o << "use ieee.std_logic_1164.all;" << endl;
		o << "use ieee.std_logic_arith.all;" << endl;
		o << "use ieee.std_logic_unsigned.all;" << endl;

		o << "library work;" << endl;

		outputVHDLEntity(o);
		newArchitecture(o,name);
		o << buildVHDLComponentDeclarations();	
		o << buildVHDLSignalDeclarations();
		beginArchitecture(o);		
		o<<buildVHDLRegisters();
		o << vhdl.str();
		endArchitecture(o);
	}
}



