/*
  TaMaDiFIFO evaluation of worst cases for rounding functions without 
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

#include "TaMaDiFIFO.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiFIFO::TaMaDiFIFO(Target* target, int w, int n, int moreThan):
	Operator(target)
	{
		_w = w;
		_n = n;
		_moreThan = moreThan;
		srcFileName="TaMaDiFIFO";
		ostringstream name;

		name <<"TaMaDiFIFO_w"<<w<<"_depth"<<n<<"_m"<<moreThan<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
	    addInput("WriteEnable");
	    addInput("ReadEnable");
		addInput("DataIn",w);
		addOutput("DataOut",w);
		addOutput("FifoEmpty");
		addOutput("FifoFull");
		if (moreThan>0)
			addOutput("FifoTFull");

		/* detect the number of positions */
		int pointerWidth = intlog2(n-1);
		
		declare("readptr",pointerWidth,true);
		declare("writeptr",pointerWidth,true);
		declare("full");
		declare("empty");
		declare("dout",w);
		declare("filled",pointerWidth,true);

		vhdl << tab << "process(clk, rst, ReadEnable, WriteEnable, readptr, writeptr)"<<endl;
		vhdl << tab << "	begin"<<endl;
		vhdl << tab << " 		if rst='1' then "<<endl;
		vhdl << tab << "           readptr  <= (others => '0');"<<endl;
		vhdl << tab << "           writeptr <= (others => '0');"<<endl;
		vhdl << tab << "		   full <= '0';"<<endl;
		vhdl << tab << "		   empty <= '1';"<<endl;
		vhdl << tab << "		   filled <= (others=>'0');"<<endl;
		vhdl << tab << "		elsif clk'event and clk='1' then"<<endl;
		vhdl << tab << "			if (ReadEnable ='1') and (empty='0')  then"<<endl;
		vhdl << tab << "				filled <= filled - '1';"<<endl;
		vhdl << tab << "				readptr <= readptr + '1';      --points to next address."<<endl;
		vhdl << tab << "				if (readptr+'1'=writeptr) then"<<endl;
		vhdl << tab << "					empty<='1';"<<endl;
		vhdl << tab << "					full<='0';"<<endl;
		vhdl << tab << "				else"<<endl;
		vhdl << tab << "					empty<='0';"<<endl;
		vhdl << tab << "					full<='0';"<<endl;
		vhdl << tab << "				end if;"<<endl;
		vhdl << tab << "			end if;"<<endl;
		vhdl << tab << "			if WriteEnable ='1' and (full='0') then"<<endl;
		vhdl << tab << "				memory(conv_integer(writeptr)) <= DataIn;"<<endl;
		vhdl << tab << "				filled <= filled + '1';"<<endl;
		vhdl << tab << "				writeptr <= writeptr + '1';  --points to next address."<<endl;
		vhdl << tab << "				if (writeptr+'1'=readptr) then"<<endl;
		vhdl << tab << "					full<='1';"<<endl;
		vhdl << tab << "					empty<='0';"<<endl;
		vhdl << tab << "				else"<<endl;
		vhdl << tab << "					full<='0';"<<endl;
		vhdl << tab << "					empty<='0';"<<endl;
		vhdl << tab << "				end if;"<<endl;
		vhdl << tab << "			end if;"<<endl;
		vhdl << tab << "		end if;"<<endl;
		vhdl << tab << "end process;"<<endl;

		vhdl << tab << "dout <= memory(conv_integer(readptr));"<<endl;
		
		if (moreThan>0)
			vhdl << tab << "FifoTFull <= '1' when filled>=CONV_STD_LOGIC_VECTOR("<<moreThan<<","<<pointerWidth<<") else '0';"<<endl;
		vhdl << tab << "FifoFull  <= full;"<<endl;
		vhdl << tab << "FifoEmpty <= empty;"<<endl;
		vhdl << tab << "DataOut <= dout;"<<endl;
	}
	
	TaMaDiFIFO::~TaMaDiFIFO() {
	}
	
	void TaMaDiFIFO::outputVHDL(std::ostream& o, std::string name) {
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
		o << "type memory_type is array (0 to "<<_n-1<<") of std_logic_vector("<<_w-1 <<" downto 0);"<<endl;
		o << "signal memory : memory_type :=(others => (others => '0'));   --memory for queue."<<endl;
		o << buildVHDLSignalDeclarations();
		beginArchitecture(o);		
		o<<buildVHDLRegisters();
		o << vhdl.str();
		endArchitecture(o);
	}
		

}



