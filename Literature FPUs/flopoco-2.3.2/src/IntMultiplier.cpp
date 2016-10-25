/*
An integer multiplier for FloPoCo

Authors:  Bogdan Pasca

This file is part of the FloPoCo project
developed by the Arenaire team at Ecole Normale Superieure de Lyon

Initial software.
Copyright © ENS-Lyon, INRIA, CNRS, UCBL,
2008-2010.
  All rights reserved.
*/

#include <cstdlib>
#include <iostream>
#include <sstream>
#include <vector>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include "utils.hpp"
#include "Operator.hpp"
#include "IntMultiplier.hpp"
#include "IntMultipliers/SignedIntMultiplier.hpp"
#include "IntMultipliers/UnsignedIntMultiplier.hpp"
#include "IntMultipliers/LogicIntMultiplier.hpp"
#include "IntMultipliers/IntTilingMult.hpp"
// 
using namespace std;

namespace flopoco {
	extern vector<Operator*> oplist;
	
	IntMultiplier::IntMultiplier (Target* target, int wInX, int wInY, map<string, double> inputDelays, bool sign, float ratio):
	Operator ( target, inputDelays, false ), wInX_(wInX), wInY_(wInY), wOut_(wInX+wInY), sign_(sign), ratio_(ratio) {
		ostringstream name;
		srcFileName="IntMultiplier";
		setCopyrightString ( "Bogdan Pasca 2011" );
		
		name <<"IntMultiplier_"<<wInX_<<"_"<<wInY_<<"_" << (sign_?"signed":"unsigned") << "_uid"<<Operator::getNewUId();;
		setName ( name.str() );
		
		// Set up the IO signals
		addInput ( "X"  , wInX_, true );
		addInput ( "Y"  , wInY_, true );
		addOutput ( "R"  , wInX_+wInY_, 1 , true );
		
		REPORT(INFO, "Implementing IntMultiplier ");
		
		if ((!sign) && (ratio==1)){
			selectedVersion = 0; //UnsignedIntMultiplier	
		}else if ((!sign) && (ratio<1) && (ratio>0)){
			selectedVersion = 2; //IntTilingMultiplier
		}else if ((!sign) && (ratio==0)){
			selectedVersion = 3; //LogicIntMultiplier with sign 0
		}else if ((sign) && (ratio>0)){
			selectedVersion = 1; //SignedIntMultiplier
		}else if ((sign) && (ratio==0)){
			selectedVersion = 4; //LogicIntMultiplier with sign 1
		}else if ((!target->getUseHardMultipliers()) && (sign)){
			selectedVersion = 4;	
		}else if ((!target->getUseHardMultipliers()) && (!sign)){
			selectedVersion = 3;
		}	

		REPORT(INFO, "Selected implementation is "<<selectedVersion);
		
		//generate the component itself
		switch (selectedVersion) {
			case 0: { IntMultiplierInstantiation = new UnsignedIntMultiplier(target, wInX, wInY, inputDelays); break;}
			case 1: { IntMultiplierInstantiation = new SignedIntMultiplier(target, wInX, wInY, inputDelays); break;}
			case 2: { IntMultiplierInstantiation = new IntTilingMult(target, wInX, wInY, ratio, 2, false); break;}
			case 3: { IntMultiplierInstantiation = new LogicIntMultiplier(target, wInX, wInY, inputDelays, false); break;}
			case 4: { IntMultiplierInstantiation = new LogicIntMultiplier(target, wInX, wInY, inputDelays, true); break; }
			default: { REPORT(INFO, "Something is wrong!, check IntMultiplier");		
					IntMultiplierInstantiation = new UnsignedIntMultiplier(target, wInX, wInY, inputDelays); }
		}

		IntMultiplierInstantiation->setuid(getuid()); //the selected implemetation becomes this operator 
		oplist.push_back(IntMultiplierInstantiation); //the code of the selected implementation 

		outDelayMap["R"] = IntMultiplierInstantiation->getOutputDelay("R"); //populate output delays
		setCycle(IntMultiplierInstantiation->getPipelineDepth());
		IntMultiplierInstantiation->setName ( name.str() );//accordingly set the name of the implementation

		signalList_ = IntMultiplierInstantiation->signalList_;
		subComponents_ = IntMultiplierInstantiation->subComponents_;
		ioList_ = IntMultiplierInstantiation->ioList_;
		
		
	}
	
	/**************************************************************************/
	IntMultiplier::~IntMultiplier() {
	}
	
	void IntMultiplier::outputVHDL(std::ostream& o, std::string name) {

	
	}
	
	/******************************************************************************/
	void IntMultiplier::emulate ( TestCase* tc ) {
		mpz_class svX = tc->getInputValue("X");
		mpz_class svY = tc->getInputValue("Y");
		
		if (! sign_){

			mpz_class svR = svX * svY;

			tc->addExpectedOutput("R", svR);
		}else{
			mpz_class big1 = (mpz_class(1) << (wInX_));
			mpz_class big1P = (mpz_class(1) << (wInX_-1));
			mpz_class big2 = (mpz_class(1) << (wInY_));
			mpz_class big2P = (mpz_class(1) << (wInY_-1));

			if ( svX >= big1P)
				svX = svX-big1;

			if ( svY >= big2P)
				svY = svY -big2;
			
			mpz_class svR = svX * svY;
			if ( svR < 0){
				mpz_class tmpSUB = (mpz_class(1) << (wOut_));
				svR = tmpSUB + svR; 
			}

			tc->addExpectedOutput("R", svR);
		}

	}
	
        void IntMultiplier::changeName(std::string operatorName){
                Operator::changeName(operatorName);
				IntMultiplierInstantiation->changeName(operatorName);
        }
}


