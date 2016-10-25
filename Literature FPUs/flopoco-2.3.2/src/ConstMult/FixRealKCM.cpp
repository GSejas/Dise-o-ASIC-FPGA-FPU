/*
 * A faithful multiplier by a real constant, using a variation of the KCM method

 This file is part of the FloPoCo project developed by the Arenaire
 team at Ecole Normale Superieure de Lyon
  
 Author : Florent de Dinechin, Florent.de.Dinechin@ens-lyon.fr

 Initial software.
 Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
 2008-2011.
  All rights reserved.
*/

#include "../Operator.hpp"

#ifdef HAVE_SOLLYA
#include <iostream>
#include <sstream>
#include <vector>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include "../sollya.h"
#include "../utils.hpp"
#include "FixRealKCM.hpp"
#include "../IntAdder.hpp"
#include "../IntMultiAdder.hpp"

using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;





	FixRealKCM::FixRealKCM(Target* target, int lsbIn_, int msbIn_, int signedInput_, int lsbOut_, string constant_, double targetUlpError_, map<string, double> inputDelays) :
		Operator(target, inputDelays), lsbIn(lsbIn_), msbIn(msbIn_), signedInput(signedInput_),
		wIn(msbIn_-lsbIn_+1), lsbOut(lsbOut_), constant(constant_), targetUlpError(targetUlpError_) 
	{
		srcFileName="FixRealKCM";

		if(lsbIn>msbIn) 
			throw string("FixRealKCM: Error, lsbIn>msbIn");
    
		if(targetUlpError>1.0) 
			throw string("FixRealKCM: Error, targetUlpError>1.0. Should be between 0.5 and 1.");
		if(targetUlpError<0.5) 
			throw string("FixRealKCM: Error, targetUlpError<0.5. Should be between 0.5 and 1.");
		
		int signBit=0;
		if(signedInput)
			signBit=1;
		wIn+=signBit;

		/* Convert the input string into a sollya evaluation tree */
		sollya_node_t node;
		node = parseString(constant.c_str());	/* If conversion did not succeed (i.e. parse error) */
		if (node == 0) {
			ostringstream error;
			error << srcFileName << ": Unable to parse string "<< constant << " as a numeric constant" <<endl;
			throw error.str();
		}

		mpfr_init2(mpC, 10000);
		setToolPrecision(10000);
		evaluateConstantExpression(mpC, node,  getToolPrecision());// should be enough for everybody

		if(mpfr_cmp_si(mpC, 0)<0)
			throw string("FixRealKCM: only positive constants are supported");

		REPORT(DEBUG, "Constant evaluates to " << mpfr_get_d(mpC, GMP_RNDN));

		// build the name
		ostringstream name; 
		name <<"FixRealKCM_" << vhdlize(lsbIn)  << "_" << vhdlize(msbIn) << "_" << vhdlize(lsbOut) << "_" 
		     << vhdlize(constant_)  << (signedInput?"_signed":"_unsigned");
		setName(name.str()); 

		mpfr_t log2C;
		mpfr_init2(log2C, 1000); // should be enough for anybody
		mpfr_log2(log2C, mpC, GMP_RNDN);
		msbC = mpfr_get_si(log2C, GMP_RNDU);

		msbOut = msbC + msbIn;
		wOut = msbOut + signBit - lsbOut+1;
		REPORT(DEBUG, "msbConstant=" << msbC << "   lsbOut="<<lsbOut << "   msbOut="<<msbOut << "   wOut="<<wOut);
	
		 // if(wIn>wOut) 
		 // 	throw string("FixRealKCM: Error, wIn>wOut,  You probably want to truncate your input instead.");

		addInput("X", wIn);
		addOutput("R", wOut);


		int lutWidth = target->lutInputs();

		setCriticalPath( getMaxInputDelays(inputDelays) );

		if(wIn <= lutWidth+1){
			///////////////////////////////////  multiplication using 1 table only ////////////////////////////////////
			REPORT(INFO, "Constant multiplication in a single table, will be correctly rounded");
			g=0;

			FixRealKCMTable *t; 
			t = new FixRealKCMTable(target, this, 0, wIn, wOut, signedInput, false);
			oplist.push_back(t);
			useSoftRAM(t);

			manageCriticalPath(target->localWireDelay() + target->lutDelay());
      
			inPortMap (t , "X", "X");
			outPortMap(t , "Y", "Y");
			vhdl << instance(t , "KCMTable");


			vhdl << tab << "R <= Y;" << endl;
		  	outDelayMap["R"] = getCriticalPath();
		}else {
			///////////////////////////////////   Generic Case  ////////////////////////////////////

			int nbOfTables = int ( ceil( double(wIn)/double(lutWidth)) );
			int lastLutWidth = (wIn%lutWidth==0?lutWidth: wIn%lutWidth);
			// Better to double an existing table than adding one more table and one more addition.
			if (lastLutWidth==1){ 
				nbOfTables--;
				lastLutWidth=lutWidth + 1;
			}
			REPORT(INFO, "Constant multiplication in "<< nbOfTables << " tables, input sizes:  for the first tables, " << lutWidth << ", for the last table: " << lastLutWidth);

			// How many guard bits? ulp=2^lsbOut, and we want to ensure targetUlpError
			// One half-ulp for the final rounding, and nbOfTables tables with an error of 2^(lsbOut-g-1) each 
			// so we want nbOfTables*2^(lsbOut-g-1) + 0.5 < targetUlpError*2^lsbOut 

			// For targetUlpError=1.0,    3, 4 tables: g=2;  5..8 tables: g=3  etc

			if(nbOfTables==2 && targetUlpError==1.0)
				g=0; // specific case: two CR table make up a faithful sum
			else
				g = ceil(log2(nbOfTables/((targetUlpError-0.5)*exp2(-lsbOut)))) -1 -lsbOut;

			REPORT(DEBUG, "g=" << g);


			// All the tables are read in parallel
			setCriticalPath(getMaxInputDelays(inputDelays));
			// TODO Wrong if the last table uses two luts per bit! Use the delay reported by the table itself
			manageCriticalPath( target->lutDelay() );


			//first split the input X into digits having lutWidth bits -> this is as generic as it gets :)
			bool tableSigned=false, last;
			for (int i=0; i<nbOfTables; i++) {
				int diSize;

				// The bit width of the output of this table
				// The last table has to have wOut+g  bits.
				// The previous one wOut+g-lastLutWidth
				// the previous one wOut+g-lastLutWidth-lutWidth etc
				int ppiSize;

				if (i < nbOfTables-1){
					vhdl << tab << declare( join("d",i), lutWidth ) << " <= X" << range(lutWidth*(i+1)-1, lutWidth*i ) << ";" <<endl;
					diSize=lutWidth;
					tableSigned=false;
					last=false;
					ppiSize = wOut+g  - lastLutWidth - (nbOfTables-2-i)*lutWidth ;
				}
				else {// last table is a bit special
					vhdl << tab << declare( join("d",i), lastLutWidth ) << " <= " << "X" << range( wIn-1 , lutWidth*i ) << ";" <<endl;
					diSize=lastLutWidth;
					if(signedInput)
						tableSigned=true;
					last=true;
					ppiSize=wOut+g;
				}

				REPORT(DEBUG, "Table i=" << i << ", input size=" << diSize<< ", output size=" << ppiSize);

				// Now produce the VHDL
				
				FixRealKCMTable *t; 
				t = new FixRealKCMTable(target, this, i, diSize, ppiSize, tableSigned, last, 1);
				useSoftRAM(t);
				oplist.push_back(t);
            	
				inPortMap (t , "X", join("d",i));
				outPortMap(t , "Y", join("pp",i));
				vhdl << instance(t , join("KCMTable_",i));

				vhdl << tab << declare( join("addOp",i), wOut+g ) << " <= ";
				if (i!=nbOfTables-1) //if not the last table
					vhdl << rangeAssign(wOut+g-1, ppiSize, "'0'") << " & " ;	
				vhdl << join("pp",i) << ";" << endl;
			}
			
			Operator* adder;
			if(nbOfTables>2) {
				adder = new IntMultiAdder(target, wOut+g, nbOfTables, inDelayMap("X0",target->localWireDelay() + getCriticalPath()));
				oplist.push_back(adder);
				for (int i=0; i<nbOfTables; i++)
					inPortMap (adder, join("X",i) , join("addOp",i));
			}
			else { // 2 tables only
				adder = new IntAdder(target, wOut+g, inDelayMap("X",target->localWireDelay() + getCriticalPath()));
				oplist.push_back(adder);
				inPortMap (adder, "X" , join("addOp",0));
				inPortMap (adder, "Y" , join("addOp",1));
				inPortMapCst(adder, "Cin" , "'0'");
			}
			outPortMap(adder, "R", "OutRes");
			vhdl << instance(adder, "Result_Adder");
			syncCycleFromSignal("OutRes");
			setCriticalPath( adder->getOutputDelay("R") );
			vhdl << tab << "R <= OutRes" << range(wOut+g-1, g) << ";" << endl;
			outDelayMap["R"] = getCriticalPath();
		}

		mpfr_clears(log2C, NULL);
	}



	FixRealKCM::~FixRealKCM() {
		// TODO 
	}


	// To have MPFR work in fix point, we perform the multiplication in very large precision using RN,
	// and the RU and RD are done only when converting to an int at the end.
	void FixRealKCM::emulate(TestCase* tc){
		/* Get I/O values */
		mpz_class svX = tc->getInputValue("X");
		// get rid of two's complement
		if(signedInput) {
			if ( svX > ( (mpz_class(1)<<(wIn-1))-1) )
				svX = svX - (mpz_class(1)<<wIn);
		}
		// Cast it to mpfr 
		mpfr_t mpX; 
		mpfr_init2(mpX, msbIn-lsbIn+2);	
		mpfr_set_z(mpX, svX.get_mpz_t(), GMP_RNDN); // should be exact
		// scale appropriately: multiply by 2^lsbIn
		mpfr_mul_2si(mpX, mpX, lsbIn, GMP_RNDN); //Exact
		// prepare the result
		mpfr_t mpR;
		mpfr_init2(mpR, 10*wOut);	
		// do the multiplication
		mpfr_mul(mpR, mpX, mpC, GMP_RNDN);
		// scale back to an integer
		mpfr_mul_2si(mpR, mpR, -lsbOut, GMP_RNDN); //Exact
		mpz_class svRu, svRd;
		mpfr_get_z(svRd.get_mpz_t(), mpR, GMP_RNDD);
		mpfr_get_z(svRu.get_mpz_t(), mpR, GMP_RNDU); 
		tc->addExpectedOutput("R", svRd);
		tc->addExpectedOutput("R", svRu);

		// clean up
		mpfr_clears(mpX, mpR, NULL);
	}

	// void FixRealKCM::buildStandardTestCases(TestCaseList* tcl){

	// }





	/****************************** The FixRealKCMTable class ********************/


	FixRealKCMTable::FixRealKCMTable(Target* target, FixRealKCM* mother, int i, int wIn, int wOut, bool signedInput, bool last, int pipeline) : 
		Table(target, wIn, wOut, 0, -1, pipeline), mother(mother), index(i), signedInput(signedInput), last(last)
	{
		ostringstream name; 
		srcFileName="FixRealKCM";
		name << mother->getName() << "_Table_"<<i;
		setName(name.str());
	}
  
	FixRealKCMTable::~FixRealKCMTable() {}

	mpz_class FixRealKCMTable::function(int x0) {
		int x;
		// get rid of two's complement
		x = x0;
		if(signedInput) {
			if ( x0 > ((1<<(wIn-1))-1) )
				x = x - (1<<wIn);
		}
		// Cast x to mpfr 
		mpfr_t mpX;
		mpfr_init2(mpX, wIn);	
		mpfr_set_si(mpX, x, GMP_RNDN); // should be exact
		mpfr_mul_2si(mpX, mpX, index*(target()->lutInputs()), GMP_RNDN); //Exact
		// now mpX is the integer radix-LUTinput digit, with its proper weight 

		// Now we want to compute the product correctly rounded to LSB  lsbOut-g
		// but we have to coerce MPFR into rounding to this fixed-point format.
		mpfr_t mpR;
		mpfr_init2(mpR, 10*wOut);	
		// do the mult in large precision
		mpfr_mul(mpR, mpX, mother->mpC, GMP_RNDN);

		// Result is integer*C, which is more or less what we need: just scale to add g bits.
		mpfr_mul_2si(mpR, mpR, mother->wOut - mother->wIn - mother->msbC + mother->g, GMP_RNDN); //Exact

		// and add the half-ulp of the result that turns truncation into rounding
		// if g=0 (meaning either one table, or two tables+faithful rounding), 
		// we don't need to add this bit
		if(last && mother->g!=0) 
			mpfr_add_si(mpR, mpR, 1<<(mother->g-1), GMP_RNDN);

		// Here is when we do the rounding
		mpz_class result;
		mpfr_get_z(result.get_mpz_t(), mpR, GMP_RNDN); // Should be exact

		// Gimme back two's complement
		if(signedInput) {
			if ( x0 > (1<<(wIn-1))-1 ) // if x was negative
				result = result + (mpz_class(1)<<wOut);
		}
		return  result;
	}


}




#endif //HAVE_SOLLYA
