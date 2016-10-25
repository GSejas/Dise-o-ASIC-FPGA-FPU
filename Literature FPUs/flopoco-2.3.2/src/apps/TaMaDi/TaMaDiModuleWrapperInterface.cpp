/*
  TaMaDiModuleWrapperInterface evaluation of worst cases for rounding functions without 
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

#include "TaMaDiModuleWrapperInterface.hpp"
#include "TaMaDiModule.hpp"

using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiModuleWrapperInterface::TaMaDiModuleWrapperInterface(Target* target, int wp, int d, int iterations, int wIntervalID, int compSize, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth):
	Operator(target), wp(wp), d(d), iterations(iterations), wIntervalID(wIntervalID), n(n) 
	{
		srcFileName="TaMaDiModuleWrapperInterface";
		ostringstream name;

		name <<"TaMaDiModuleWrapperInterface_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		int ulpCounterWidth = intlog2(iterations-1);
		
		addInput   ("MainFIFOInput", (d+1)*wp+wIntervalID); //
		addInput   ("MainFIFOInputWE"); //this signal is received 
		addOutput  ("InputCreditToken");
	
		addOutput   ("MainFIFOOutput", wIntervalID + ulpCounterWidth); 
		addInput    ("MainFIFOOutputRE");
		addOutput   ("OutputWEToken");
		addOutput   ("OutputCreditToken");

		/* here we instantiate the TaMaDi Module */
		////////////////////////////////////////////////////////////
		TaMaDiModule *tmodule = new TaMaDiModule(target, wp, d, iterations, wIntervalID, compSize, n, inFIFODepth, peFIFODepth, outFIFODepth);
		oplist.push_back(tmodule);

		inPortMap ( tmodule, "MainFIFOInput",         "MainFIFOInput");
		inPortMap ( tmodule, "MainFIFOInputWE",       "MainFIFOInputWE");
		outPortMap( tmodule, "MainFIFOInputRESignal", "MainFIFOInputRESignal_s"); //used for incrementing the credit counter
		outPortMap( tmodule, "MainFIFOInputFull",     "MainFIFOInputFull_s"); //this will not be used

		inPortMap ( tmodule, "MainFIFOOutputRE",      "MainFIFOOutputRE"); //signal received from the global controller
		outPortMap( tmodule, "MainFIFOOutputEmpty",   "MainFIFOOutputEmpty_s"); //not used, all data is in the counter
		outPortMap( tmodule, "MainFIFOOutput",        "MainFIFOOutput_s");
		outPortMap( tmodule, "MainFIFOOutputWESignal","MainFIFOOutputWESignal_s"); 
		vhdl << tab << instance(tmodule, "TaMaDiModuleX");
		
		vhdl << tab << declare("inputCreditCounterUp") << " <= MainFIFOInputRESignal_s;"<<endl; 

		vhdl << tab << " process(clk, rst, inputCreditCounter, inputCreditCounterUp) " << endl;
		vhdl << tab << "      begin" << endl;
		vhdl << tab << "         if rst = '1' then" << endl;
		/* the credit counter is initialized with the size of the input FIFO */
		vhdl << tab << "               " << declare("inputCreditCounter", intlog2(inFIFODepth))<<" <= CONV_STD_LOGIC_VECTOR("<<inFIFODepth<<","<<intlog2(inFIFODepth)<<");" << endl; 
		vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
		vhdl << tab << "			if (inputCreditCounter > 0) and (inputCreditCounterUp='0') then"<<endl; 
		vhdl << tab << "				inputCreditCounter <= inputCreditCounter - 1;"<<endl;
		vhdl << tab << "            end if; "<<endl;
		vhdl << tab << "         end if;" << endl;
		vhdl << tab << "      end process;" << endl;
		
		vhdl << tab << declare("inputCreditCounterGZ") << "<= '1' when (inputCreditCounter > 0) else '0';"<<endl;
		vhdl << tab << "InputCreditToken <= inputCreditCounterGZ or inputCreditCounterUp;"<<endl;

		vhdl << tab << "OutputCreditToken <= MainFIFOOutputWESignal_s;"<<endl;
		
		vhdl << tab << "MainFIFOOutput <= MainFIFOOutput_s;"<<endl;
//		setCycle(0,false);
//		vhdl << tab << declare("tmpMainFIFOOutputWESignal_s") << " <= MainFIFOOutputWESignal_s;"<<endl;
//		setCycle(1,false);		
		vhdl << tab << "OutputWEToken <= MainFIFOOutputWESignal_s;"<<endl;
	}

	TaMaDiModuleWrapperInterface::~TaMaDiModuleWrapperInterface() {
	}

}



