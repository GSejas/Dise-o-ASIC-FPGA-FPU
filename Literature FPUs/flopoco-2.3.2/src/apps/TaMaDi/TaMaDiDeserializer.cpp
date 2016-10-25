/*
  TaMaDiDeserializer evaluation of worst cases for rounding functions without 
  overheating the planet

  This file is part of the FloPoCo project 
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Author :   Bogdan Pasca

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  CeCILL license, 2008-2010.

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

#include "TaMaDiDeserializer.hpp"
#include "TaMaDiModule.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiDeserializer::TaMaDiDeserializer(Target* target, int wp, int d, int iterations, int wIntervalID, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth):
	Operator(target), wp(wp), d(d), iterations(iterations), wIntervalID(wIntervalID), n(n) 
	{
		srcFileName="TaMaDiDeserializer";
		ostringstream name; 

		name <<"TaMaDiDeserializer_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		
		
		int sw=128;
		
		addInput   ("MainInput", sw);
		addInput   ("DMAFIFOHasData"); //we have data in DMA input FIFO
		addInput   ("CanWriteSystemInFIFO");
		
		addOutput  ("rdDMAFIFO");
		
		addOutput  ("MainFIFOOutput", (d+1)*wp + wIntervalID);
		addOutput  ("ValidData");

		int chunks;		
		
		if ( ((d+1)*wp + wIntervalID) % sw == 0)
			chunks = ((d+1)*wp + wIntervalID) / sw;
		else
			chunks = ((d+1)*wp + wIntervalID) / sw +1;

		cout << "number of chunks is = " << chunks<<endl;
		declare("deserializerCounter", intlog2(chunks+2)); 
//		setCycle(1);
//		declare("deserializerCounter_d1", intlog2(chunks+1)); 
//		setCycle(0);

		vhdl << tab << " process(clk, rst, DMAFIFOHasData, CanWriteSystemInFIFO) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' or deserializerCounter=CONV_STD_LOGIC_VECTOR("<<chunks+2<<","<<intlog2(chunks+2)<< ") then" << endl;
		vhdl << tab << "               deserializerCounter <=  (others => '0');" << endl;
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "            if (DMAFIFOHasData='1' and CanWriteSystemInFIFO='1') or (deserializerCounter=" <<chunks+1<<  ") then " << endl;
		vhdl << tab << "               deserializerCounter <=  deserializerCounter + CONV_STD_LOGIC_VECTOR(1,"<<intlog2(chunks+2)<< ");" << endl;
		vhdl << tab << "         	end if;" << endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;

		vhdl << tab << " rdDMAFIFO <= '1' when (DMAFIFOHasData='1' and deserializerCounter > CONV_STD_LOGIC_VECTOR(0,"<<intlog2(chunks+2)<< ") and deserializerCounter < CONV_STD_LOGIC_VECTOR("<< chunks+1 << ","<<intlog2(chunks+1)<< ")) else '0';"<<endl;

		for (int i=1; i<=chunks; i++)
			vhdl << tab << declare( join("CE",i-1) ) << "<= '1' when (DMAFIFOHasData='1' and deserializerCounter =CONV_STD_LOGIC_VECTOR("<<i<<","<<intlog2(chunks+2)<< ")) else '0';"<<endl;

		
		vhdl << tab << " process(clk, rst,";
		for (int i=1; i<chunks; i++)
			vhdl << join("CE",i-1)<<",";
		vhdl << tab << join("CE",chunks-1)<< ")"<<endl;

		vhdl << tab << tab << "begin" << endl;
		vhdl << tab << tab << tab << "if rst='1' then "<<endl;
		for (int i=1;i<=chunks;i++)		
			vhdl << tab << tab << tab << tab << declare(join("reg",i-1), sw) << " <= (others=>'0');" << endl;
		vhdl << tab << tab << tab << "elsif clk'event and clk = '1' then" << endl;
		for (int i=1; i<=chunks; i++){
			vhdl << tab << tab << tab << tab << "if "<<join("CE",i-1)<<"='1' then"<<endl;
			vhdl << tab << tab << tab << tab << join("reg",i-1) << " <= MainInput;" << endl;
			vhdl << tab << tab << tab << tab << "end if;"<<endl;
		}	
		vhdl << tab << tab << tab << "end if;" << endl;
		vhdl << tab << tab << "end process;" << endl;
		
		vhdl << tab << "ValidData <= '1' when deserializerCounter=CONV_STD_LOGIC_VECTOR("<<chunks+1<<","<<intlog2(chunks+2)<< ") else '0';"<<endl;

		vhdl << tab << "MainFIFOOutput <= ";
		for (int i=chunks; i>=1; i--)
			if (i==chunks)
				vhdl << join("reg",i-1)<<range( (((d+1)*wp + wIntervalID) % sw == 0? sw-1: (((d+1)*wp + wIntervalID) % sw) -1), 0) << " & ";
			else if (i>1)
				vhdl << join("reg",i-1) << " & ";
			else
				vhdl << join("reg",i-1) << ";"<<endl;
	}

	TaMaDiDeserializer::~TaMaDiDeserializer() {
	}

}


	
