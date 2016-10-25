/*
 * An constant multiplier for FloPoCo using the KCM method
  This file is part of the FloPoCo project developed by the Arenaire
  team at Ecole Normale Superieure de Lyon
  
  Author :  Bogdan.Pasca, Florent.de.Dinechin, both @ens-lyon.fr

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

 */

// TODO if LUTsize=5 and wIn=11, we should have 2 tables, not 3

#include <iostream>
#include <sstream>
#include <vector>
#include <typeinfo>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include "../utils.hpp"
#include "../Operator.hpp"
#include "../IntAdder.hpp"
#include "IntIntKCM.hpp"
#include "KCMTable.hpp"

using namespace std;

namespace flopoco{

	extern vector<Operator *> oplist;

	IntIntKCM::IntIntKCM(Target* target, int wIn, mpz_class C, bool inputTwosComplement, map<string, double> inputDelays):
		Operator(target, inputDelays), wIn_(wIn), signedInput_(inputTwosComplement), C_(C), inputDelays_(inputDelays) 
	{
	
		setCopyrightString("Bogdan Pasca, Florent de Dinechin (2009,2010)");		
		srcFileName="IntIntKCM";
		// Set up the IO signals
		addInput ("X" , wIn_);
		

		if(C<0)
			throw string("IntIntKCM: only positive constants are supported");

		wOut_ = intlog2(C) + wIn_; 
				
		addOutput("R" , wOut_);

		ostringstream name;
		name << "IntIntKCM_" << wIn_ << "_" << C << (signedInput_?"_signed":"_unsigned");
		setName(name.str());


		int constantWidth = intlog2( C ); 
		int lutWidth = target->lutInputs();
		chunkSize_ = lutWidth;
		int nbOfTables = int ( ceil( double(wIn)/double(lutWidth)) );
		int lastLutWidth = (wIn%lutWidth==0?lutWidth: wIn%lutWidth);

		// Better to double an existing table than adding one more table and one more addition.
		if (lastLutWidth==1){ 
		  nbOfTables--;
		  lastLutWidth=lutWidth + 1;
		}
		
		
		// Actually there are only two cases: 
		// if lastLutWidth<=lutWidth, all the digits (including the last one) may have the same size,
		// we just pad the last digit with zeroes and use the same table as for the other digits.
		// now if lastLutWidth=lutWidth + 1  then we need a larger last digit, and a different last table.
		// Besides if signedResult we also need a different last table.


		REPORT(INFO, "Constant multiplication in "<< nbOfTables << " tables, input sizes:  for the first tables, " << lutWidth << ", for the last table: " << lastLutWidth);

		setCriticalPath( getMaxInputDelays(inputDelays) );

		// First get rid of the easy case when there is just one table
		if(nbOfTables==1) { 
			KCMTable  *lastTable=0; 
			lastTable = new KCMTable(target, wIn_, constantWidth + wIn_, C, signedInput_);
			oplist.push_back(lastTable);
			useSoftRAM(lastTable);

			// pipeline depth of a Table, so far, is always 0, but the table is well behaved and updates the critical path.
			double tableDelay=lastTable->getOutputDelay("Y"); // since we passed an empty inputDelayMap

			manageCriticalPath(tableDelay);
			inPortMap (lastTable, "X", "X");
			outPortMap(lastTable, "Y", "Ri");
			vhdl << instance(lastTable, "KCMTable");

			vhdl << tab << "R <= Ri;" <<endl;
			outDelayMap["R"] = getCriticalPath();
		}


		else{
			
			///////////////////////////////////   Generic Case  ////////////////////////////////////

			int nbOfTables = int ( ceil( double(wIn)/double(lutWidth)) );
			int lastLutWidth = (wIn%lutWidth==0?lutWidth: wIn%lutWidth);
			// Better to double an existing table than adding one more table and one more addition.
			if (lastLutWidth==1){ 
				nbOfTables--;
				lastLutWidth=lutWidth + 1;
			}
			REPORT(INFO, "Constant multiplication in "<< nbOfTables << " tables, input sizes:  for the first tables, " << lutWidth << ", for the last table: " << lastLutWidth);

			KCMTable *firstTable=0, *lastTable=0; 

			firstTable = new KCMTable(target, lutWidth, constantWidth + lutWidth, C, false);
			oplist.push_back(firstTable);
			useSoftRAM(firstTable);
			
			lastTable = new KCMTable(target, lastLutWidth, constantWidth + lastLutWidth, C, signedInput_);
			oplist.push_back(lastTable);
			useSoftRAM(lastTable);

			// Critical path among the tables is through the last one, which may be larger
			double tableDelay=lastTable->getOutputDelay("Y"); // since we passed an empty inputDelayMap

			//possibly register the inputs before the table read
			manageCriticalPath(tableDelay);


			for (int i=0; i<nbOfTables; i++) {

				//first split the input X into digits having lutWidth bits

				KCMTable *t;
				if (i < nbOfTables-1){
					vhdl << tab << declare( join("d",i), lutWidth ) << " <= X" << range(lutWidth*(i+1)-1, lutWidth*i ) << ";" <<endl;
					t=firstTable;
				}
				else {// last table is a bit special
					vhdl << tab << declare( join("d",i), lastLutWidth ) << " <= " << "X" << range( wIn-1 , lutWidth*i ) << ";" <<endl;
					t=lastTable;
				}
				inPortMap (t , "X", join("d",i));
				outPortMap(t , "Y", join("pp",i));
				vhdl << instance(t , join("KCMTable_",i));
			}

				
			//determine the addition operand size
			int addOpSize = (nbOfTables - 2) * lutWidth  +  lastLutWidth + constantWidth;
			// if (verbose)
			// 	cerr << "> IntIntKCM:\t The addition operand size is: " << addOpSize << endl;
		
			for (int i=0; i<nbOfTables; i++){
				vhdl << tab << declare( join("addOp",i), addOpSize ) << " <= ";
				if (i!=nbOfTables-1){ //if not the last table
					vhdl << rangeAssign(addOpSize-1, constantWidth + i*lutWidth, "'0'") << " & " 
						  <<  join("pp",i) << range(constantWidth + lutWidth -1, (i==0?lutWidth:0)) << " & " 
						  << zg((i-1)*lutWidth,0) << ";" << endl;
				}
				else{
					vhdl << join("pp",i)<<range(constantWidth + lastLutWidth -1, (i==0?lutWidth:0))<< " & " << zg((i-1)*lutWidth,0) << ";" << endl;
				}
			}
		
			
			Operator* adder;

			if(nbOfTables>2) {
				adder = new IntMultiAdder(target, addOpSize, nbOfTables, inDelayMap("X0", target->localWireDelay() + getCriticalPath()));
				oplist.push_back(adder);
				for (int i=0; i<nbOfTables; i++)
					inPortMap (adder, join("X",i) , join("addOp",i));
			}else {
				adder = new IntAdder(target, addOpSize, inDelayMap("X0", target->localWireDelay() + getCriticalPath()));
				oplist.push_back(adder);
				inPortMap (adder, "X" , join("addOp",0));
				inPortMap (adder, "Y" , join("addOp",1));
				inPortMapCst(adder, "Cin" , "'0'");
			}

			outPortMap(adder, "R", "OutRes");
			vhdl << instance(adder, "Result_Adder");
			syncCycleFromSignal("OutRes");

		
			outDelayMap["R"] = adder->getOutputDelay("R");
			vhdl << tab << "R <= OutRes & pp0" << range(lutWidth-1,0) << ";" <<endl;
		}
	}

	IntIntKCM::~IntIntKCM() {
	}

	int IntIntKCM::getOutputWidth(){
		return wOut_;
	}

	void IntIntKCM::emulate(TestCase* tc)
	{
		mpz_class svX =  tc->getInputValue("X");
		// cout << "-------------------------"<<endl;
		// cout << "X="<<unsignedBinary(svX, wIn_);
		// bool xneg = false;
		//x is in 2's complement, so it's value is
		if(signedInput_) {
			if ( svX > ( (mpz_class(1)<<(wIn_-1))-1) ){
				// cout << "X is negative" << endl;
				// xneg = true;
				svX = svX - (mpz_class(1)<<wIn_);
			}
		}
		mpz_class svR;
	
		svR = svX * C_;

		if ( svR < 0)
			svR = (mpz_class(1)<<wOut_) + svR;
	
		// cout << "R="<<unsignedBinary(svR, wOut_);

		tc->addExpectedOutput("R", svR);
	}


}
