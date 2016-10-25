/*
  TaMaDiShiftRegister evaluation of worst cases for rounding functions without 
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

#include "TaMaDiShiftRegister.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiShiftRegister::TaMaDiShiftRegister(Target* target, int widthLocation, int n):
	Operator(target)
	{
		srcFileName="TaMaDiShiftRegister";
		ostringstream name;

		name <<"TaMaDiShiftRegister_width"<<widthLocation<<"_dimmension"<<n<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		addInput   ("DataIn", widthLocation*n); //parallel load
		addInput   ("ParallelWrite");
		
		addOutput  ("DataOut",widthLocation);
		addOutput  ("Ready");
		
		int counterWidth = intlog2(n+2);

		vhdl << tab << "process(clk, rst, ParallelWrite, counter)"<<endl;
		vhdl << tab << "	begin"<<endl;
		vhdl << tab << " 		if rst='1' or counter="<<n+2<<" then "<<endl;
		vhdl << tab << "		   "<<declare("counter",counterWidth)<<" <= (others => '0');"<<endl;
		vhdl << tab << "		elsif clk'event and clk='1' then"<<endl;
		vhdl << tab << "			if ParallelWrite ='1' or counter>0 then"<<endl;
		vhdl << tab << "				counter <= counter + 1;"<<endl;
		vhdl << tab << "			end if;"<<endl;
		vhdl << tab << "		end if;"<<endl;
		vhdl << tab << "	end process;"<<endl;

		
		vhdl << tab << "process(clk, rst, ParallelWrite)"<<endl;
		vhdl << tab << "	begin"<<endl;
		vhdl << tab << " 		if rst='1' then "<<endl;
		for (int i=0; i<n; i++)
		vhdl << tab << "			"<<declare(join("reg",i), widthLocation) << " <= (others => '0');"<<endl;
		vhdl << tab << "		elsif clk'event and clk='1' then"<<endl;
		vhdl << tab << "			if (ParallelWrite ='1') then"<<endl;
		for (int i=0;i<n;i++) //parallel Load
		vhdl << tab << "				" << join("reg",i) << "<= DataIn"<<range((i+1)*widthLocation-1,i*widthLocation)<<";"<<endl;
		vhdl << tab << "			end if;"<<endl;
		vhdl << tab << "		end if;"<<endl; 
		vhdl << tab << "	end process;"<<endl;

		vhdl << tab << "with counter select" << endl;
		vhdl << tab << "DataOut <=" << endl;
		for (int i=0;i<n;i++)
			if (i<n-1)
				vhdl << tab << tab << tab << join("reg",i) << " when \""<<unsignedBinary(i+1,counterWidth)<<"\","<<endl; 
			else
				vhdl << tab << tab << tab << join("reg",i) << " when others;"<<endl;  

		vhdl << tab << "Ready <= '1' when counter=\""<<unsignedBinary(0,counterWidth)<< "\" else '0';"<<endl;
	}

	TaMaDiShiftRegister::~TaMaDiShiftRegister() {
	}

}


