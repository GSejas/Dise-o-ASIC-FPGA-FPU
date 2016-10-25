/*
  TaMaDi evaluation of worst cases for rounding functions without 
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
#include "../utils.hpp"
#include "../Operator.hpp"

#include "TaMaDi.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDi::TaMaDi(Target* target, int wp, int d, int iterations, int wIntervalID, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth):
	Operator(target), wp(wp), d(d), iterations(iterations), wIntervalID(wIntervalID), n(n) 
	{
		srcFileName="TaMaDi";
		ostringstream name;

		name <<"TaMaDi_wp"<<wp<<"_interations"<<iterations<<"_degree"<<d<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		int ulpCounterWidth = intlog2(iterations-1);
		
		addInput   ("MainFIFOInput", d*wp+wIntervalID);
		addInput   ("MainFIFOInputWE");
		addOutput  ("MainFIFOInputFull");

		addInput   ("MainFIFOOutputRE");
		addOutput  ("MainFIFOOutputEmpty");
		addOutput  ("MainFIFOOutput",wIntervalID + ulpCounterWidth);
		

		TaMaDiFIFO *inFifo = new TaMaDiFIFO(target, d*wp+wIntervalID, inFIFODepth, 0);
		oplist.push_back(inFifo);
		
		inPortMap( inFifo, "DataIn", "MainFIFOInput");
		inPortMap( inFifo, "WriteEnable", "MainFIFOInputWE");
		inPortMapCst( inFifo, "ReadEnable", "readEnableMainFifo");
		
		outPortMap( inFifo, "DataOut", "MainFIFOInputDataOut");
		outPortMap( inFifo, "FifoFull", "MainFIFOInputFull_signal");
		outPortMap( inFifo, "FifoEmpty", "MainFIFOInputEmpty");

		vhdl << tab << "MainFIFOInputFull <= MainFIFOInputFull_signal;"<<endl;

		vhdl << tab << instance( inFifo, "InputFiFo");

//		vhdl << tab << "ReadEnable <= not MainFIFOInputFull;"<<endl;//FIXME may need to remove
		
		vhdl << tab << declare("FIFOIntervalID",wIntervalID) << " <= MainFIFOInputDataOut"<<range(wIntervalID-1,0)<<";"<<endl;
		vhdl << tab << declare("srData",d*wp)<<" <= MainFIFOInputDataOut"<<range(d*wp + wIntervalID-1,wIntervalID)<<";"<<endl;
		
		TaMaDiShiftRegister *sr = new TaMaDiShiftRegister(target, wp, d);
		oplist.push_back(sr);

		inPortMap(sr, "DataIn", "srData");
		inPortMapCst(sr, "ParallelWrite", "oneGetsInitialized");
		
		outPortMap (sr, "DataOut", "shiftRegisterDataOut");
		outPortMap (sr, "Ready", "shiftRegisterReady");
		vhdl << tab << instance( sr, "ShiftRegisterForDataSerializing");

		TaMaDiCore *core = new TaMaDiCore(target, wp, d, iterations, wIntervalID);
		oplist.push_back(core);
		
		TaMaDiFIFO *coreOutFifo = new TaMaDiFIFO( target, ulpCounterWidth+wIntervalID, peFIFODepth, 0);
		oplist.push_back(coreOutFifo);
		
		/* generation of the processing elements */
		for (int i=0; i<n; i++){
			setCycle(0);
			
			vhdl << tab << declare( join("ce_pe",i) ) << " <= not " << join("postPE_FIFOFull",i) << ";"<<endl;
			
			inPortMap( core, "SerialPin", "shiftRegisterDataOut");
			inPortMapCst( core, "Initialize", join("InitializePE",i));
			inPortMapCst( core, "IntervalID", "FIFOIntervalID");
			inPortMap( core, "CE", join("ce_pe",i)); //block while output fifo is full, otherwise potential ouputs might be lost

			outPortMap(core, "potentialUlpNumber", join("potentialUlpNumberPE",i));
			outPortMap(core, "potentialInterval", join("potentialIntervalPE",i));
			outPortMap(core, "potentialOutput", join("potentialOutputPE",i));
			outPortMap(core, "finished", join("readyPE",i));

			vhdl << tab << instance(core, join("PE_",i));
			
			syncCycleFromSignal(join("potentialUlpNumberPE",i)); //gets us to cycle1
			
			/* concatenate to form a pair <intervalID, ulp> */
			vhdl << tab << declare( join("postPE_FIFODataIn",i), ulpCounterWidth+wIntervalID) << " <= " << join("potentialIntervalPE",i) << " & " << join("potentialUlpNumberPE",i) <<";" <<endl;
			vhdl << tab << declare( join("posePE_FIFOWE",i) ) << " <= (not " << join("postPE_FIFOFull",i) << ") and "<< join("potentialOutputPE",i)<<";"<<endl;
			/* link processing element to local output fifo */
			
			inPortMap( coreOutFifo, "DataIn", join("postPE_FIFODataIn",i));
			inPortMap( coreOutFifo, "WriteEnable", join("posePE_FIFOWE",i) );
			
			inPortMapCst( coreOutFifo, "ReadEnable", join("postPE_FIFORE",i));
		
			outPortMap( coreOutFifo, "DataOut", join("postPE_FIFODataOut",i));
			outPortMap( coreOutFifo, "FifoFull", join("postPE_FIFOFull",i)); //to go to priority encoder
			outPortMap( coreOutFifo, "FifoEmpty", join("postPE_FIFOEmpty",i)); //to go to priority encoder

			vhdl << tab << instance( coreOutFifo, join("postPE_FIFO",i));
		}
		
		/*create the priority encoder for synchronizing with the inputs*/
		syncCycleFromSignal( join("readyPE",0) );
		
		vhdl << tab << declare( "pe_priorityEncoder", n) << " <= "; 
		for (int i=n-1;i>=0;i--){
			if (i>0)
				vhdl << join("readyPE",i) << " & ";
			else
				vhdl << join("readyPE",i) << ";" <<endl;
		}
		/* check if at least one PE is ready. The Priority decoder always selects one, even if none are ready.
		therefore, we need to add this suplementary check */		
		vhdl << tab << declare("readyAtLeastOnePE") << " <= '1' when pe_priorityEncoder>"<<zg(n,0)<<" else '0';"<<endl; 		

		TaMaDiPriorityEncoder *priorityEncoder = new TaMaDiPriorityEncoder(target, n);
		oplist.push_back(priorityEncoder);
		inPortMap( priorityEncoder, "X", "pe_priorityEncoder");
		outPortMap( priorityEncoder, "R", "encodedPriorityInputs");
		vhdl << tab << instance(priorityEncoder, "priorityEncoder_Inputs");

		
		TaMaDiDecoder *priorityDecoder = new TaMaDiDecoder(target, n);
		oplist.push_back(priorityDecoder);
		inPortMap( priorityDecoder, "X", "encodedPriorityInputs");
		outPortMap( priorityDecoder, "R", "decodedPriorityInputs");
		vhdl << tab << instance(priorityDecoder, "inputPriorityDecoder");
		
		/* if there is at least one PE which is ready then forward these signals (delayed by one cycle for syncronization) to Initialize signals on PE */
		vhdl << tab << declare( "decodedPriorityInputsPostProcessing", n) << " <= decodedPriorityInputs when readyAtLeastOnePE='1' else " << zg(n,0) << ";" <<endl; 
		nextCycle();
		vhdl << tab << declare( "decodedPriorityInputsPostProcessingDelayed",n) << " <= decodedPriorityInputsPostProcessing;"<<endl;
		vhdl << tab << declare("oneGetsInitialized") << " <= readyAtLeastOnePE;"<<endl;

		setCycle(0); //get back to cycle 0 => lots of feedback signals 

		for (int i=0; i<n;i++){
			vhdl << tab << declare(join("InitializePE",i)) << " <= decodedPriorityInputsPostProcessingDelayed"<<of(i)<<";"<<endl; 
		}
		vhdl << tab << declare("readEnableMainFifo") << " <= readyAtLeastOnePE and (not MainFIFOInputEmpty) and (shiftRegisterReady);"<<endl;

		/* now for the outputs */

		/* form the logic vector */
		syncCycleFromSignal(join("postPE_FIFOEmpty",0));
		
		vhdl << tab << declare("opIn",n) << " <= ";
		for (int i=n-1;i>=0;i--){
			vhdl << "(not "<<join("postPE_FIFOEmpty",i)<<")";
			if (i>0)
				vhdl << " & ";
			else
				vhdl << ";" <<endl;
		}
		/* if one of the pe fifos is not empty than we have a data do write to the output fifo */
		vhdl << tab << declare("dataToOutput") << " <= '1' when opIn>"<<zg(n,0)<<" else '0';"<<endl;
		
		/* use a priority encoder to for selecting which pe fifo is written in the output FIFO */
		TaMaDiPriorityEncoder *ope = new TaMaDiPriorityEncoder(target, n);
		oplist.push_back(ope);
		
		int bits = intlog2(n-1);
		inPortMap( ope, "X", "opIn");
		outPortMap( ope, "R", "opCoded");
		vhdl << tab << instance(ope, "outputPriorityEncoded");

		/* connect the output data lines of the pe fifos via a mux controlled by the priority encoder to the DataIn port of the ouput fifo */		
		vhdl << tab << "with opCoded select"<<endl;
		vhdl << tab << declare("muxOut",ulpCounterWidth+wIntervalID)<<" <= " <<endl;
		for (int i=0;i<n;i++)
			vhdl << tab << tab << join("postPE_FIFODataOut",i) << " when \""<<unsignedBinary(i,bits)<<"\","<<endl;
		vhdl << tab << tab << zg(ulpCounterWidth+wIntervalID,0)  << " when others;"<<endl;
	
		/* describe output decoder. This provides the signals which control the read-enable port of the PE fifos and the output fifo WE port*/
		TaMaDiDecoder *od = new TaMaDiDecoder(target,n);
		oplist.push_back(od);
		
		inPortMap( od, "X", "opCoded");
		outPortMap( od , "R", "opPDecoded");
		vhdl << tab << instance( od, "outputDecoder");
		
		/* we select one RE if there is one fifo having some content and the output fifo is not full */
		vhdl << tab << declare( "outputDecoderPP",n) << " <= opPDecoded when (dataToOutput='1' and (MainFIFOOutputFull_signal='0')) else "<<zg(n,0)<<";"<<endl;
		//assign the signal to the corresponding readEnable lines of the fifos
		for (int i=0;i<n;i++)
			vhdl << tab << declare(join("postPE_FIFORE",i)) << " <= outputDecoderPP"<<of(i)<<";"<<endl;
		
		/* we write to the output fifo if it's not full and we have something to write */
		vhdl << tab << declare("MainFIFOOutputWE")<<" <= (not MainFIFOOutputFull_signal) and (dataToOutput);"<<endl;

		TaMaDiFIFO *outFifo = new TaMaDiFIFO(target, ulpCounterWidth+wIntervalID, outFIFODepth, 0);
		oplist.push_back(outFifo);

		inPortMap( outFifo, "DataIn", "muxOut");
		inPortMap( outFifo, "WriteEnable", "MainFIFOOutputWE");
		inPortMap( outFifo, "ReadEnable", "MainFIFOOutputRE"); /* comes from the entity input */
		
		outPortMap( outFifo, "DataOut", "MainFIFOOutput_signal");
		outPortMap( outFifo, "FifoFull", "MainFIFOOutputEmpty_signal");
		outPortMap( outFifo, "FifoEmpty", "MainFIFOOutputFull_signal");

		vhdl << tab << instance(outFifo, "mainOutputFIFO");

		/* assign the two outputs */
		vhdl << tab << "MainFIFOOutput <= MainFIFOOutput_signal;"<<endl;
		vhdl << tab << "MainFIFOOutputEmpty <= MainFIFOOutputEmpty_signal;"<<endl;
	}

	TaMaDi::~TaMaDi() {
	}

}



