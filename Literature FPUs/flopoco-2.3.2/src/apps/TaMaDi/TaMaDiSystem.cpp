/*
  TaMaDiSystem evaluation of worst cases for rounding functions without 
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

#include "TaMaDiSystem.hpp"
#include "TaMaDiModule.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiSystem::TaMaDiSystem(Target* target, int wp, int d, int iterations, int wIntervalID, int compSize, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth, int DispatcherInputFIFODepth, int DispatcherOutputFIFODepth, int moduleCount):
	Operator(target), wp(wp), d(d), iterations(iterations), wIntervalID(wIntervalID), n(n) 
	{
		srcFileName="TaMaDiSystem";
		ostringstream name;

		name <<"TaMaDiSystem_m"<<"moduleCount"<<"_n"<<n<<"_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		int ulpCounterWidth = intlog2(iterations-1);
		
		addInput   ("TaMaDiInput", 128); //data coming from the PCIE in packets of 128bits 
		addInput   ("TaMaDiInputValid");

		addInput   ("DMAFIFOHasData");
		addOutput  ("DMAFIFORD");		
		
		addOutput  ("TaMaDiInputFIFOFull");

		addOutput  ("TaMaDiOutput", wIntervalID + ulpCounterWidth);
		addOutput  ("TaMaDiOutputEmpty");
		addInput   ("TaMaDiOutputRE");

		/////////////////////////////////////////////////////////////
		/// DESERIALIZER ////////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		TaMaDiDeserializer *ds = new TaMaDiDeserializer(target, wp, d, iterations, wIntervalID, n, inFIFODepth, peFIFODepth, outFIFODepth);
		oplist.push_back(ds);

		inPortMap   (ds, "MainInput",      "TaMaDiInput");
		inPortMap   (ds, "DMAFIFOHasData", "DMAFIFOHasData");
		inPortMapCst(ds, "CanWriteSystemInFIFO", "CanWriteSystemInFIFO");

		outPortMap  (ds, "rdDMAFIFO", "rdFromDMAFIFO");
		
		outPortMap  (ds, "MainFIFOOutput",  "DeserializerOutput");
		outPortMap  (ds, "ValidData",      "DeserializerOutputValid");
		vhdl << tab << instance(ds, "PCIEDeserializerUnit");
		syncCycleFromSignal("DeserializerOutput");
		
		
		vhdl << tab << declare("CanWriteSystemInFIFO") << " <= not (DispatcherInputFIFOFull_signal); " << endl;
		vhdl << tab << "DMAFIFORD <= rdFromDMAFIFO;" <<endl;
			
		/////////////////////////////////////////////////////////////
		/// DISPATCHER INTEFACE /////////////////////////////////////
		/////////////////////////////////////////////////////////////
		TaMaDiDispatcherInterface *di = new TaMaDiDispatcherInterface(target, wp, d, iterations, wIntervalID, compSize, moduleCount, inFIFODepth, peFIFODepth, outFIFODepth, DispatcherInputFIFODepth, DispatcherOutputFIFODepth);
		oplist.push_back(di);
		
		inPortMap   (di, "DispatcherInputData",         "DeserializerOutput");
		inPortMap   (di, "DispatcherInputDataValid",    "DeserializerOutputValid");
		outPortMap  (di, "DispatcherInputFIFOFull",     "DispatcherInputFIFOFull_signal");
		
		for (int i=0; i<moduleCount; i++){
			/* ports where we will plug-in the TaMadi modules with their interface	*/
			inPortMapCst(di, join("needData",i),        join("InputCreditToken",i)); 
			outPortMap  (di, join("moduleWE",i),        join("moduleWE",i)); 
			outPortMap  (di, join("moduleInputData",i), join("moduleInputData",i));
		}

		inPortMap  (di, "DispatcherOutputFIFORE",   "TaMaDiOutputRE"); //to read from the output fifo
		outPortMap (di, "DispatcherOutputData",     "DispatcherOutputData_signal"); //data going to the serializer
		outPortMap (di, "DispatherOutputFIFOEmpty", "DispatherOutputFIFOEmpty_signal"); //to prevent reading an empty fifo

		for (int i=0; i<moduleCount; i++){
			/* ports where we will plug-in the TaMadi modules with their interface	*/
			inPortMapCst(di, join("haveData",i),          join("OutputCreditToken",i) ); 
			inPortMapCst(di, join("writeToOutputFIFO",i), join("OutputWEToken",i)); 
			outPortMap  (di, join("moduleRE",i),          join("moduleRE",i)); //sent to modules
			inPortMapCst(di, join("moduleOutputData",i),  join("moduleFIFOOutput",i)); //data coming from modules
		}
		vhdl << tab << instance( di, "DispatcherInterface" );

		vhdl << tab << "TaMaDiInputFIFOFull <= DispatcherInputFIFOFull_signal;"<<endl;
		vhdl << tab << "TaMaDiOutput <= DispatcherOutputData_signal;"<<endl;
		vhdl << tab << "TaMaDiOutputEmpty <= DispatherOutputFIFOEmpty_signal;"<<endl;

		/////////////////////////////////////////////////////////////
		/// WRAPPED MODULES /////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		TaMaDiModuleWrapperInterface *module = new TaMaDiModuleWrapperInterface(target, wp, d, iterations, wIntervalID, compSize, n, inFIFODepth, peFIFODepth, outFIFODepth);
		oplist.push_back(module);
	
		for (int i=0; i<moduleCount; i++){
			setCycleFromSignal(join("moduleInputData",i),false);
			nextCycle(false);
			inPortMap   (module, "MainFIFOInput",    join("moduleInputData",i)); 
			inPortMap   (module, "MainFIFOInputWE",  join("moduleWE",i));
			setCycle(0,false); 
			outPortMap  (module, "InputCreditToken", join("InputCreditToken",i));
			outPortMap   (module, "MainFIFOOutput",     join("moduleFIFOOutput",i)); 
			inPortMapCst (module, "MainFIFOOutputRE",   join("moduleRE",i));
			outPortMap   (module, "OutputWEToken",      join("OutputWEToken",i));
			outPortMap   (module, "OutputCreditToken",  join("OutputCreditToken",i));	
			vhdl << tab << instance(module, join("Module",i));
		}
	}

	TaMaDiSystem::~TaMaDiSystem() {
	}

}



