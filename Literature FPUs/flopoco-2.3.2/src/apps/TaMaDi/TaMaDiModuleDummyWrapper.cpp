/*
  TaMaDiModuleDummyWrapper evaluation of worst cases for rounding functions without 
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

#include "TaMaDiModuleDummyWrapper.hpp"
#include "TaMaDiModule.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiModuleDummyWrapper::TaMaDiModuleDummyWrapper(Target* target, int wp, int d, int iterations, int wIntervalID, int widthComp, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth):
	Operator(target), wp(wp), d(d), iterations(iterations), wIntervalID(wIntervalID), n(n) 
	{
		srcFileName="TaMaDiModuleDummyWrapper";
		ostringstream name;

		name <<"TaMaDiModuleDummyWrapper_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		int ulpCounterWidth = intlog2(iterations-1);
		
		addInput   ("MainInput", 64);

		addInput   ("MainFIFOInputWE");
		addOutput  ("MainFIFOInputFull");
		addInput   ("MainFIFOOutputRE");
		addOutput  ("MainFIFOOutputEmpty");
		addOutput  ("MainFIFOOutput",wIntervalID + ulpCounterWidth);

		vhdl << tab << declare("mainSignal",(d+1)*wp+wIntervalID) << " <= ";
		int lastC = ((d+1)*wp+wIntervalID) % 64;
		vhdl << "MainInput"<<range(lastC-1,0);
		for (int i=0; i< ((d+1)*wp+wIntervalID-lastC)/64; i++)
			vhdl << "& MainInput";
		vhdl << ";"<<endl;
		
		////////////////////////////////////////////////////////////
		TaMaDiModule *tmodule = new TaMaDiModule(target, wp, d, iterations, wIntervalID, widthComp, n, inFIFODepth, peFIFODepth, outFIFODepth);
		oplist.push_back(tmodule);

		inPortMap( tmodule, "MainFIFOInputWE", "MainFIFOInputWE");
		inPortMap( tmodule, "MainFIFOOutputRE", "MainFIFOOutputRE");
setCycle(1);
		inPortMap( tmodule, "MainFIFOInput", "mainSignal");
setCycle(0);
		outPortMap( tmodule, "MainFIFOInputFull", "MainFIFOInputFull_s");
		outPortMap( tmodule, "MainFIFOOutputEmpty", "MainFIFOOutputEmpty_s");
		outPortMap( tmodule, "MainFIFOOutput", "MainFIFOOutput_s");
		outPortMap  (tmodule, "MainFIFOOutputWESignal", "MainFIFOOutputWESignal_s");
		outPortMap  (tmodule, "MainFIFOInputRESignal", "MainFIFOInputRESignal_s");

		vhdl << tab << instance( tmodule, "TaMaDiModuleX");
		
		vhdl << tab << "MainFIFOInputFull <= MainFIFOInputFull_s;"<<endl;
		vhdl << tab << "MainFIFOOutputEmpty <= MainFIFOOutputEmpty_s;"<<endl;
		vhdl << tab << "MainFIFOOutput <= MainFIFOOutput_s;"<<endl;
	}

	TaMaDiModuleDummyWrapper::~TaMaDiModuleDummyWrapper() {
	}

}



