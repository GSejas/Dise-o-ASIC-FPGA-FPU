/*
  TaMaDiDispatcherInterface evaluation of worst cases for rounding functions without 
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

#include "TaMaDiDispatcherInterface.hpp"
#include "TaMaDiModule.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiDispatcherInterface::TaMaDiDispatcherInterface(Target* target, int wp, int d, int iterations, int wIntervalID, int compSize, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth, int DispatcherInputFIFODepth, int DispatcherOutputFIFODepth):
	Operator(target), wp(wp), d(d), iterations(iterations), wIntervalID(wIntervalID), n(n) 
	{
		srcFileName="TaMaDiDispatcherInterface";
		ostringstream name;

		name <<"TaMaDiDispatcherInterface_n"<<n<<"_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		int ulpCounterWidth = intlog2(iterations-1);
		
		addInput   ("DispatcherInputData", (d+1)*wp+wIntervalID); //data coming from the PCIE deserialized 
		addInput   ("DispatcherInputDataValid");
		addOutput  ("DispatcherInputFIFOFull");

		for (int i=0; i<n; i++){
			/* ports where we will plug-in the TaMadi modules with their interface	*/
			addInput( join("needData",i) );
			addOutput( join("moduleWE",i));
			addOutput( join("moduleInputData",i),(d+1)*wp+wIntervalID);
		}

		addOutput   ("DispatcherOutputData", wIntervalID + ulpCounterWidth); //data going to the serializer
		addInput   ("DispatcherOutputFIFORE"); //to read from the output fifo
		addOutput   ("DispatherOutputFIFOEmpty"); //to prevent reading an empty fifo
		for (int i=0; i<n; i++){
			/* ports where we will plug-in the TaMadi modules with their interface	*/
			addInput( join("haveData",i) ); //will be connected to the WE line of the module out fifo
			addInput( join("writeToOutputFIFO",i)); //its the same data line as for have data, but delayed with 1 clk cycle
			addOutput( join("moduleRE",i)); //sent to modules
			addInput( join("moduleOutputData",i), wIntervalID + ulpCounterWidth); //data coming from modules
		}
		
		
		////////////////////////////////////////////////////////////
		//GLOBAL INPUT FIFO//
		////////////////////////////////////////////////////////////
		TaMaDiFIFO *inFifo = new TaMaDiFIFO(target, (d+1)*wp+wIntervalID, DispatcherInputFIFODepth, 0);
		oplist.push_back(inFifo);
		
		inPortMap( inFifo, "DataIn", "DispatcherInputData"); //data coming in from the deserializer
		inPortMap( inFifo, "WriteEnable", "DispatcherInputDataValid"); 
		inPortMapCst( inFifo, "ReadEnable", "readEnableMainFifo"); 
		
		outPortMap( inFifo, "DataOut", "DispatcherInputFIFODataOut");
		outPortMap( inFifo, "FifoFull", "MainFIFOInputFull_signal"); //to output
		outPortMap( inFifo, "FifoEmpty", "DispatcherInputFIFOEmpty"); //don't read if empty

		vhdl << tab << instance( inFifo, "DispatcherInputFIFO");
		////////////////////////////////////////////////////////////
		vhdl << tab << "DispatcherInputFIFOFull <= MainFIFOInputFull_signal;"<<endl; //responsability of serializer not to send if full
			

		for (int i=0; i<n; i++){
			/* each module is assigned a counter initialized with 0 */
			declare(join("inCreditCount",i), intlog2(inFIFODepth));
			vhdl << tab << " process(clk, rst, "<<join("needData",i)<<", "<<join("moduleWE_signal",i)<<" )" << endl;
			vhdl << tab << "      begin" << endl;
			vhdl << tab << "         if rst = '1' then" << endl;
			vhdl << tab << "               "<<join("inCreditCount",i)<<" <= CONV_STD_LOGIC_VECTOR("<<0<<","<<intlog2(inFIFODepth)<<");" << endl;
			vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
			vhdl << tab << "				if ("<<join("needData",i)<<"='1') and ("<<join("moduleWE_signal",i)<<"='0') then"<<endl; 
			vhdl << tab << "					"<<join("inCreditCount",i)<<" <= "<<join("inCreditCount",i)<<" + 1;"<<endl;
			vhdl << tab << "				elsif ("<<join("needData",i)<<"='0') and ("<<join("moduleWE_signal",i)<<"='1') then"<<endl; 
			vhdl << tab << "					"<<join("inCreditCount",i)<<" <= "<<join("inCreditCount",i)<<" - 1;"<<endl;
			vhdl << tab << "            	end if; "<<endl;
			vhdl << tab << "         end if;" << endl;
			vhdl << tab << "      end process;" << endl;		

			vhdl << tab << declare( join("inCreditCountGZ",i)) << " <= '1' when "<< join("inCreditCount",i)<<">"<<zg(intlog2(inFIFODepth))<<" else '0';"<<endl;
		}

		vhdl << tab << declare("inputCreditCounterPriorityEncoderInputs",n) << " <= ";
		for (int i=n-1;i>=0;i--){
			if (i>0)
				vhdl << join("inCreditCountGZ",i) << " & ";
			else
				vhdl << join("inCreditCountGZ",i) << ";" <<endl;
		}
		vhdl << tab << declare("readyAtLeastOneNeedsData") << " <= '1' when inputCreditCounterPriorityEncoderInputs>"<<zg(n)<<" else '0';"<<endl; 

		TaMaDiPriorityEncoder *priorityEncoderInCredit = new TaMaDiPriorityEncoder(target, n);
		oplist.push_back(priorityEncoderInCredit);
		inPortMap( priorityEncoderInCredit, "X", "inputCreditCounterPriorityEncoderInputs");
		outPortMap( priorityEncoderInCredit, "R", "encodedCreditCounterPriority");
		vhdl << tab << instance(priorityEncoderInCredit, "InputCreditCounterPriorityEncoderInstance");

		TaMaDiDecoder *priorityDecoderInCredit = new TaMaDiDecoder(target, n);
		oplist.push_back(priorityDecoderInCredit);
		inPortMap( priorityDecoderInCredit, "X", "encodedCreditCounterPriority");
		outPortMap( priorityDecoderInCredit, "R", "inputCreditCounterDecodedPriorities");
		vhdl << tab << instance(priorityDecoderInCredit, "inputCreditCounterPriorityDecoderInstance");

		vhdl << tab << declare( "inputCreditCounterDecodedPriorities2", n) << " <= inputCreditCounterDecodedPriorities when (readyAtLeastOneNeedsData='1' and DispatcherInputFIFOEmpty='0') else " << zg(n,0) << ";" <<endl; 
		/* assign to wE ports */
		
		vhdl << tab << declare("readEnableMainFifo") << " <= '1' when inputCreditCounterDecodedPriorities2>"<<zg(n)<<" else '0';"<<endl;
		
		for (int i=0; i<n; i++)
			vhdl << tab << declare(join("moduleWE_signal",i)) << " <= inputCreditCounterDecodedPriorities2"<<of(i)<<";"<<endl;
		setCycle(1);
		for (int i=0; i<n; i++)
			vhdl << tab << join("moduleWE",i) << " <= " << join("moduleWE_signal",i) << ";"<<endl;

		/* assign data ports */
		for (int i=0; i<n; i++)
			vhdl << tab << join("moduleInputData",i) << " <= DispatcherInputFIFODataOut;" << endl;
		setCycle(0);	 
			 
		////////////////////////////////////////////////////////////
		//GLOBAL OUTPUT FIFO//
		////////////////////////////////////////////////////////////
		TaMaDiFIFO *outFifo = new TaMaDiFIFO(target, wIntervalID + ulpCounterWidth, DispatcherOutputFIFODepth, 0);
		oplist.push_back(outFifo);

		inPortMapCst( outFifo, "DataIn", "DispatcherInputDataMultiplexer"); //data coming from our demultiplexer, selecting the data lines among modules
		inPortMapCst( outFifo, "WriteEnable", "DispatcherOutputFIFOWE"); //if WE comes back, we need to write to OutFIFO
		inPortMapCst( outFifo, "ReadEnable", "DispatcherOutputFIFORE"); // INPUT GLOBAL 
		
		outPortMap( outFifo, "DataOut", "DispatcherOutputFIFOData"); //output signal
		outPortMap( outFifo, "FifoFull", "DispatcherOutputFIFOFull"); //used internally, not to write to a full fifo
		outPortMap( outFifo, "FifoEmpty", "DispatcherOutputFIFOEmpty_s"); //don't read if empty, so output this signal
		vhdl << tab << instance( outFifo, "DispatcherOutputFIFO");
		////////////////////////////////////////////////////////////

		vhdl << tab << "DispatherOutputFIFOEmpty <= DispatcherOutputFIFOEmpty_s;"<<endl;
		
		/* create n counters for keeping track of the number of elements 
		in the modules output fifos */
		
		for (int i=0; i<n; i++){
			/* each module is assigned a counter initialized with 0 */
			declare(join("outputCreditCount",i), intlog2(outFIFODepth));
			vhdl << tab << " process(clk, rst, "<<join("haveData",i)<<","<<join("moduleRE_signal",i)<<","<<join("outputCreditCountGZ",i)<<")"<< endl;
			vhdl << tab << "      begin" << endl;
			vhdl << tab << "         if rst = '1' then" << endl;
			vhdl << tab << "               "<<join("outputCreditCount",i)<<" <= CONV_STD_LOGIC_VECTOR("<<0<<","<<intlog2(outFIFODepth)<<");" << endl;
			vhdl << tab << "         elsif clk'event and clk = '1' then" << endl;
			vhdl << tab << "				if ("<<join("haveData",i)<<"='1') and ("<<join("moduleRE_signal",i)<<"='0') then"<<endl; 
			vhdl << tab << "					"<<join("outputCreditCount",i) << " <= " << join("outputCreditCount",i) << " + 1;"<<endl;
			vhdl << tab << "				elsif  ("<<join("haveData",i)<<"='0') and ("<<join("outputCreditCountGZ",i)<<"='1') and ("<<join("moduleRE_signal",i)<<"='1') then"<<endl; 
			vhdl << tab << "					"<<join("outputCreditCount",i) << " <= " << join("outputCreditCount",i) << " - 1;"<<endl;
			vhdl << tab << "            	end if; "<<endl;
			vhdl << tab << "         end if;" << endl;
			vhdl << tab << "      end process;" << endl;		

			vhdl << tab << declare( join("outputCreditCountGZ",i)) << " <= '1' when "<< join("outputCreditCount",i)<<">"<<zg(intlog2(outFIFODepth))<<" else '0';"<<endl;
		}
		
		/*use a priority encoder-decoder to generate the appropriate RE signals to be dispatched to the modules*/
		vhdl << tab << declare("outputCreditCounterPriorityEncoder",n) << " <= ";
		for (int i=n-1;i>=0;i--){
			if (i>0) vhdl << join("outputCreditCountGZ",i) << " & ";
			else     vhdl << join("outputCreditCountGZ",i) << ";" <<endl;
		}
		vhdl << tab << declare("readyAtLeastOneHasData") << " <= '1' when outputCreditCounterPriorityEncoder>"<<zg(n)<<" else '0';"<<endl; 

		TaMaDiPriorityEncoder *priorityEncoderOutCredit = new TaMaDiPriorityEncoder(target, n);
		oplist.push_back(priorityEncoderOutCredit);
		inPortMap( priorityEncoderOutCredit, "X", "outputCreditCounterPriorityEncoder");
		outPortMap( priorityEncoderOutCredit, "R", "encodedOutputCreditCounterPriority");
		vhdl << tab << instance(priorityEncoderOutCredit, "OutputCreditCounterPriorityEncoderInstance");

		TaMaDiDecoder *priorityDecoderOutCredit = new TaMaDiDecoder(target, n);
		oplist.push_back(priorityDecoderOutCredit);
		inPortMap( priorityDecoderOutCredit, "X", "encodedOutputCreditCounterPriority");
		outPortMap( priorityDecoderOutCredit, "R", "outputCreditCounterDecodedPriorities");
		vhdl << tab << instance(priorityDecoderOutCredit, "outputCreditCounterPriorityDecoderInstance");
		
		vhdl << tab << declare( "outputCreditCounterDecodedPriorities2", n) << " <= outputCreditCounterDecodedPriorities when (readyAtLeastOneHasData='1' and DispatcherOutputFIFOFull='0') else " << zg(n,0) << ";" <<endl; 
		/* let's now send these to the modules */
		for (int i=0; i<n; i++){
			vhdl << tab << declare(join("moduleRE_signal",i)) << " <= outputCreditCounterDecodedPriorities2"<<of(i)<<";"<<endl;
			vhdl << tab << join("moduleRE",i) << " <= "<<join("moduleRE_signal",i)<<";"<<endl;
		}
	
		vhdl << tab << declare("writeBusToOutputFIFO",n) << " <= ";
		for (int i=n-1;i>=0;i--){
			if (i>0) vhdl << join("writeToOutputFIFO",i) << " & ";
			else     vhdl << join("writeToOutputFIFO",i) << ";" <<endl;
		}
		vhdl << tab << declare("atLeastOneWritesToOutputFIFO") << " <= '1' when writeBusToOutputFIFO>"<<zg(n)<<" else '0';"<<endl;
		vhdl << tab << declare("DispatcherOutputFIFOWE")<<" <= '1' when (outputCreditCounterDecodedPriorities2 > 0) else '0';"<<endl;//  atLeastOneWritesToOutputFIFO;"<<endl;

		/* we also need to decide which is the data we are writing to the out fifo  */			
		TaMaDiPriorityEncoder *priorityEncoderDataSelect = new TaMaDiPriorityEncoder(target, n);
		oplist.push_back(priorityEncoderDataSelect);
		inPortMap( priorityEncoderDataSelect, "X", "writeBusToOutputFIFO");
		outPortMap( priorityEncoderDataSelect, "R", "DataSelectLines");
		vhdl << tab << instance(priorityEncoderDataSelect, "DataSelectPriorityEncoder");

		/*use the dataselect lines to multiplex among the data coming from the modules */
		
		vhdl << tab << " with outputCreditCounterDecodedPriorities2 select"<<endl;
		vhdl << tab << declare("DispatcherInputDataMultiplexer",wIntervalID + ulpCounterWidth) << " <= " << endl;
		for (int i=0; i<n; i++){
			vhdl << tab << tab << join("moduleOutputData",i) << " when \"" << unsignedBinary(intpow2(i), n) << "\"," << endl; 	
		}
		vhdl << tab << tab << tab << join("moduleOutputData",0)  << " when  others;"<<endl;

		vhdl << tab << "DispatcherOutputData <= DispatcherOutputFIFOData;"<<endl;
	}

	TaMaDiDispatcherInterface::~TaMaDiDispatcherInterface() {
	}

}



