/*
  An FP exponential for FloPoCo
  
  This file is part of the FloPoCo project
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Author : Florent de Dinechin, Florent.de.Dinechin@ens-lyon.fr

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

*/
#include <iostream>
#include <fstream>
#include <sstream>
#include <math.h>	// For NaN

#include "FPExp.hpp"
#include "FPNumber.hpp"
#include "ConstMult/IntIntKCM.hpp"
#include "ConstMult/FixRealKCM.hpp"
#include "Shifters.hpp"
#include "IntMultiplier.hpp"
#include "FixedPointFunctions/FunctionEvaluator.hpp"
#include "FixedPointFunctions/FunctionTable.hpp"
#include "utils.hpp"
#include "IntAdder.hpp"


using namespace std;


#define LARGE_PREC 1000 // 1000 bits should be enough for everybody

namespace flopoco{
	extern vector<Operator *> oplist;


	mpz_class FPExp::magicTable::function(int x){
		mpz_class h, l;
		mpfr_t a, yh,yl, one;

		// convert x to 2's compliment
		int xs=x;
		if(xs>>(wIn-1))
			xs-=(1<<wIn);

		mpfr_init2(a, wIn);
		mpfr_init2(one, 16);
		mpfr_set_d(one, 1.0, GMP_RNDN);
		mpfr_init2(yh, LARGE_PREC); 
		mpfr_init2(yl, LARGE_PREC); 

		mpfr_set_si(a, xs, GMP_RNDN);
		mpfr_div_2si(a, a, wIn, GMP_RNDN); // now a in [-1/2, 1/2[
		mpfr_exp(yh, a, GMP_RNDN); // e^x in [0.6,1.7[

		mpfr_mul_2si(yh, yh, 26, GMP_RNDN);
		mpfr_get_z(h.get_mpz_t(), yh,  GMP_RNDN);  // Here is the rounding! Should be a 27-bit number

		mpfr_set_ui(a, x, GMP_RNDN);
		mpfr_div_2si(a, a, 2*wIn, GMP_RNDN); // now a in [0,1[. 2^-9

		mpfr_exp(yl, a, GMP_RNDN); // e^(2^-9 x)
		mpfr_sub(yl, yl, a, GMP_RNDN); // e^(2^-9 x) -x 

		mpfr_sub(yl, yl, one, GMP_RNDN); // e^(2^-9 x) -x -1

		//now scale 
		mpfr_mul_2si(yl, yl, 26, GMP_RNDN); //  * 2^-26:  y scaled up to  [0..511] (actually [0..258])
		mpfr_get_z(l.get_mpz_t(), yl,  GMP_RNDN);

		// debug
		if((h>=(1<<27)) || l>=512 || h<0 || l<0)
			REPORT(0, "Ouch!!!!!" <<"x=" << x << " " << xs << "    " << h << " " << l );

		//cout << x << "\t" << h << "\t" << l <<endl;
		mpfr_clears(yh, yl, a, one, NULL);
				
		return l + (h<<9);
	};

	mpz_class FPExp::firstExpTable::function(int x){
		mpz_class h;
		mpfr_t a, y;

		// convert x to 2's compliment
		int xs=x;
		if(xs>>(wIn-1))
			xs-=(1<<wIn);

		mpfr_init2(a, wIn);
		mpfr_set_si(a, xs, GMP_RNDN);
		mpfr_div_2si(a, a, wIn, GMP_RNDN); // now a in [-1/2, 1/2[
		mpfr_init2(y, LARGE_PREC); 
		mpfr_exp(y, a, GMP_RNDN); // in [0.6, 1.7], MSB is 1

		mpfr_mul_2si(y, y, wOut-1, GMP_RNDN);
		mpfr_get_z(h.get_mpz_t(), y,  GMP_RNDN);  // here the rounding takes place

		// debug
		if((h>=(mpz_class(1)<<wOut)) || h<0)
			REPORT(0, "Ouch!!!!!" << h);

		//cout << x << "\t" << h << "\t" << l <<endl;
		mpfr_clears(y, a, NULL);
				
		return h;
	};


	FPExp::FPExp(Target* target, int wE_, int wF_, int k_, int d_, int guardBits, bool fullInput, map<string, double> inputDelays)
		: Operator(target), wE(wE_), wF(wF_), k(k_), d(d_), g(guardBits)
	{

#ifndef HAVE_SOLLYA
		ostringstream e;
		e << "ERROR in FPExp, unable to build architecture if HAVE_SOLLYA is not enabled" <<endl;
		throw e.str();
#endif

		// if we use the magic table, we need one guard bit less
		if(wF<=23)
			g=3;
		else
			g=4;

		// if automatic mode, set up the parameters
		if(k==0 && d==0) {
			d=2; 
			k=9;

			if (wF<30)
				d=1;

			if(wF>60) {
				d=3;
				k=10;
			}
			if(wF>100) {
				d=4;
				k=11;
			}
			if(wF==112) {
				d=4;
				k=13;
			}

		}


		/* Generate unique name */
		{
			std::ostringstream o;
			o << "FPExp_" << wE << "_" << wF << "_" ;
			if(target->isPipelined()) 
				o << target->frequencyMHz() ;
			else
				o << "comb";
			uniqueName_ = o.str();
		}

		setCopyrightString("F. de Dinechin, Bogdan Pasca (2008-2010)");
		srcFileName="FPExp";
	
		int wFIn; // The actual size of the input 
		if(fullInput) 
			wFIn=wF+wE+g;
		else 
			wFIn=wF;

		addFPInput("X", wE, wFIn);
		addFPOutput("R", wE, wF, 2);  // 2 because faithfully rounded



		//***************** Building a few MPFR constants, useful or obsolete ******** 
		mpz_class mpzLog2, mpzInvLog2;
	
		mpfr_t mp2, mp1, mplog2, mpinvlog2;

		mpfr_inits(mp1, mp2, NULL);
		mpfr_set_si(mp1, 1, GMP_RNDN);
		mpfr_set_si(mp2, 2, GMP_RNDN);

		// 1/log2 ~ 1.44, truncated, on sizeFirstKCM bits
		int sizeFirstKCM=wE+4;

		// All this mostly useless now that we have FixReal KCM
		mpfr_init2(mplog2, 3*(wE+wF+g));	// way too much precision
		mpfr_log(mplog2, mp2, GMP_RNDN);
		mpfr_init2(mpinvlog2, sizeFirstKCM);	
		mpfr_div(mpinvlog2, mp1, mplog2, GMP_RNDN);
		mpfr_mul_2si(mpinvlog2, mpinvlog2, sizeFirstKCM-1, GMP_RNDN); //Exact
		mpfr_get_z(mpzInvLog2.get_mpz_t(), mpinvlog2, GMP_RNDN);
		mpfr_clear(mplog2);

		//Computing log2 ~ 0.69 on wE+wF+g bits, rounded down, too
		mpfr_init2(mplog2, wE+wF+g);
		mpfr_log(mplog2, mp2, GMP_RNDN);
		mpfr_mul_2si(mplog2, mplog2, wE+wF+g, GMP_RNDN); //Exact
		mpfr_get_z(mpzLog2.get_mpz_t(), mplog2, GMP_RNDN);

		mpfr_clears(mp1, mp2, mplog2, mpinvlog2, NULL);

		addConstant("wE", "positive", wE);
		addConstant("wF", "positive", wF);
		addConstant("wFIn", "positive", wFIn);
		addConstant("g", "positive", g);

		int bias = (1<<(wE-1))-1;
		if(bias < wF+g){
			ostringstream e;
			e << "ERROR in FPExp, unable to build architecture if wF+g > 2^(wE-1)-1." <<endl;
			e << "      Try increasing wE." << endl;
			e << "      If you really need FPExp to work with such values, please report this as a bug :)" << endl;
			throw e.str();
		}



		//***************** Input unpacking and shifting to fixed-point ******** 

		setCriticalPath( getMaxInputDelays(inputDelays) + target->localWireDelay());
		vhdl << tab  << declare("Xexn", 2) << " <= X(wE+wFIn+2 downto wE+wFIn+1);" << endl;
		vhdl << tab  << declare("XSign") << " <= X(wE+wFIn);" << endl;
		vhdl << tab  << declare("XexpField", wE) << " <= X(wE+wFIn-1 downto wFIn);" << endl;
		vhdl << tab  << declare("Xfrac", wFIn) << " <= X(wFIn-1 downto 0);" << endl;

		int e0 = bias - (wF+g);
		vhdl << tab  << declare("e0", wE+2) << " <= conv_std_logic_vector(" << e0 << ", wE+2);  -- bias - (wF+g)" << endl;
		manageCriticalPath( target->localWireDelay() + target->adderDelay(wE+2) ); 
		vhdl << tab  << declare("shiftVal", wE+2) << " <= (\"00\" & XexpField) - e0; -- for a left shift" << endl;

		vhdl << tab  << "-- underflow when input is shifted to zero (shiftval<0), in which case exp = 1" << endl;
		vhdl << tab  << declare("resultWillBeOne") << " <= shiftVal(wE+1);" << endl;
 
		// As we don't have a signed shifter, shift first, complement next. TODO? replace with a signed shifter
		vhdl << tab << "--  mantissa with implicit bit" << endl;
		vhdl << tab  << declare("mXu", wFIn+1) << " <= \"1\" & Xfrac;" << endl;

#if 0  //  FIXME maxshift is too large, but fixing it breaks alignment
		// left shift
		int maxshift=wE+g-1; // maxX < 2^(wE-1); 
		Shifter* lshift = new Shifter(target, wFIn+1, maxshift , Shifter::Left);   
		oplist.push_back(lshift);
		int shiftInSize = lshift->getShiftInWidth();
		vhdl << tab  << declare("shiftValIn", shiftInSize) << " <= shiftVal" << range(shiftInSize-1, 0) << ";" << endl;

		outPortMap(lshift, "R", "fixX");
		inPortMap(lshift, "S", "shiftValIn");
		inPortMap(lshift, "X", "mXu");
		vhdl << instance(lshift, "mantissa_shift");
		syncCycleFromSignal("fixX0");
		nextCycle();

		vhdl << tab  << "-- Partial overflow/underflow detection" << endl;
		vhdl << tab  << declare("oufl0") << " <= not shiftVal(wE+1) when shiftVal(wE downto 0) >= conv_std_logic_vector(" << maxshift << ", wE+1) else '0';" << endl;


#else


		// left shift
		double scp = getCriticalPath();
		vhdl << tab  << "-- Partial overflow/underflow detection" << endl;
		int maxshift=wE-1+ wF+g; // maxX < 2^(wE-1); 
		manageCriticalPath( target->adderDelay(wE+1) + target->localWireDelay() + target->lutDelay() + target->localWireDelay());
		vhdl << tab  << declare("oufl0") << " <= not shiftVal(wE+1) when shiftVal(wE downto 0) >= conv_std_logic_vector(" << maxshift << ", wE+1) else '0';" << endl;

		setCycleFromSignal("shiftVal", scp);

		Shifter* lshift = new Shifter(target, wFIn+1, maxshift , Shifter::Left, inDelayMap("S", target->localWireDelay(wFIn+1) + getCriticalPath())  );   
		oplist.push_back(lshift);
		int shiftInSize = lshift->getShiftInWidth();
		vhdl << tab  << declare("shiftValIn", shiftInSize) << " <= shiftVal" << range(shiftInSize-1, 0) << ";" << endl;

		outPortMap(lshift, "R", "fixX0");
		inPortMap(lshift, "S", "shiftValIn");
		inPortMap(lshift, "X", "mXu");
		vhdl << instance(lshift, "mantissa_shift");
		syncCycleFromSignal("fixX0", lshift->getOutputDelay("R") );

#endif	
		
		int sizeXfix = wE+wF+g; // still unsigned; msb=wE-1; lsb = -wF-g
		manageCriticalPath( target->localWireDelay(sizeXfix) + target->lutDelay());
		vhdl << tab << declare("fixX", sizeXfix) << " <= " << " fixX0" << range(wE-1 + wF+g + wFIn+1 -1, wFIn) << " and "<<rangeAssign(sizeXfix-1,0,"not(resultWillBeOne)")<<";" << endl;

		int lsbXforFirstMult=-3; 
		int sizeXMulIn = wE-2 - lsbXforFirstMult +1; // msb=wE-2, lsb=-3
		vhdl << tab <<	declare("xMulIn", sizeXMulIn) << " <=  fixX" << range(sizeXfix-2, sizeXfix - sizeXMulIn-1  ) << "; -- truncation, error 2^-3" << endl;

		//***************** Multiplication by 1/log2 to get approximate result ******** 
		// FixRealKCM does the rounding to the proper place with the proper error
		FixRealKCM *mulInvLog2 = new  FixRealKCM(target,
																						 lsbXforFirstMult, // lsbIn 
																						 wE-2 , // msbIn,
																						 false,  // unsigned input,
																						 0,   // lsbOut,
																						 "1/log(2)", //  constant
																						 0.5 + 0.09, // error: we have 0.125 on X, and target is 0.5+0.22 
																						 inDelayMap( "X", target->localWireDelay(2) + getCriticalPath())
																						 
																						 );
		oplist.push_back(mulInvLog2);
		outPortMap(mulInvLog2, "R", "absK");
		inPortMap(mulInvLog2, "X", "xMulIn");
		vhdl << instance(mulInvLog2, "mulInvLog2");

		syncCycleFromSignal("absK", mulInvLog2->getOutputDelay("R") );


		// Now I have two things to do in parallel: compute K, and compute absKLog2
		// First compute K
		manageCriticalPath(target->localWireDelay() + target->adderDelay(wE+1));
		vhdl << tab << declare("minusAbsK",wE+1) << " <= " << rangeAssign(wE, 0, "'0'")<< " - ('0' & absK);"<<endl;
		// The synthesizer should be able to merge the addition and this mux, so the next line is commented
		// manageCriticalPath(target->localWireDelay() + target->lutDelay());
		vhdl << tab << declare("K",wE+1) << " <= minusAbsK when  XSign='1'   else ('0' & absK);"<<endl;

		// get back to the cycle+critical path at the output of the first multiplier
		// We kind of forget the critical path at the end of the compute K block, because mulLog2 will be much larger.
		setCycleFromSignal("absK", mulInvLog2->getOutputDelay("R") );

		FixRealKCM *mulLog2 = new FixRealKCM(target, 
																				 0, 
																				 wE-1, 
																				 false  /* unsigned input */, 
																				 -wF-g, 
																				 "log(2)", 
																				 1.0, 
																				 inDelayMap( "X", target->localWireDelay(wF+g) + getCriticalPath()) );

		oplist.push_back(mulLog2);
		outPortMap(mulLog2, "R", "absKLog2");
		inPortMap(mulLog2, "X", "absK");
		vhdl << instance(mulLog2, "mulLog2");
		syncCycleFromSignal("absKLog2", mulLog2->getOutputDelay("R") );


		// absKLog2: msb wE-2, lsb -wF-g

		int sizeY=wF+g; // This is also the weight of Y's LSB

		manageCriticalPath( target->localWireDelay() + target->lutDelay() );

		vhdl << tab << declare("subOp1",sizeY) << " <= fixX" << range(sizeY-1, 0) << " when XSign='0'"
				 << " else not (fixX" << range(sizeY-1, 0) << ");"<<endl;
		vhdl << tab << declare("subOp2",sizeY) << " <= absKLog2" << range(sizeY-1, 0) << " when XSign='1'"
				 << " else not (absKLog2" << range(sizeY-1, 0) << ");"<<endl;

		double ctperiod = 1.0 / target->frequency(); 
		target->setFrequency( 1.0 / (ctperiod - target->LogicToRAMWireDelay() ) ); // Bogdan, WTF is that? 
		IntAdder *yPaddedAdder = new IntAdder(target, sizeY, // we know the leading bits will cancel out
																					inDelayMap("X", target->localWireDelay() + getCriticalPath()) ); 
		target->setFrequency( 1.0 / ctperiod );
		oplist.push_back(yPaddedAdder);

		outPortMap( yPaddedAdder, "R", "Y");
		inPortMapCst ( yPaddedAdder, "Cin", "'1'");
		inPortMapCst ( yPaddedAdder, "Y", "subOp2");
		inPortMap( yPaddedAdder, "X", "subOp1");
	
		vhdl << instance(yPaddedAdder, "theYAdder") << endl;
		syncCycleFromSignal("Y", yPaddedAdder->getOutputDelay("R"));


		vhdl << tab << "-- Now compute the exp of this fixed-point value" <<endl;

		int rWidth;

		// nY is in [-1/2, 1/2]
		int sizeZ = wF+g-k; 
		int sizeExpA = wF+g+1; // e^A has MSB weight 1
		int sizeZhigh=wF+g-2*k;
		int sizeZxpZmZm1 = wF+g - 2*k +1;
		int sizeExpZm1 = sizeZ+1; // 
		int sizeMultIn = sizeZ; // sacrificing accuracy where it costs
		REPORT(2, "sizeZ=" << sizeZ);
		REPORT(2, "sizeExpA=" << sizeExpA);
		REPORT(2, "sizeZhigh=" << sizeZhigh);
		REPORT(2, "sizeZxpZmZm1=" << sizeZxpZmZm1);
		REPORT(2, "sizeExpZm1=" << sizeExpZm1);
		//REPORT(2, "=" << );


		

 #ifdef HAVE_SOLLYA
		//		double cpexpA;
		
		if(wF+g<=26) { // Magic exp table works up to single precision
			
#if 0 //// stupid ISE not able to pack both tables in a single dual-port one
			LowerExpTable* lowertable;
			lowertable = new LowerExpTable(target, k, sizeZhigh, wF+g); // last parameter is -LSB of the result
			oplist.push_back(lowertable);
			outPortMap(lowertable, "Y", "expZmZm1_0");
			inPortMap(lowertable, "X", "Zhigh");
			vhdl << instance(lowertable, "expZmZm1_table");
#else

			//The following is really designed for k=9
			if(k!=9){
				REPORT(0, "k!=9, setting it to 9 to use the magic exp dual table")
					k=9;	
			}
			vhdl << tab << declare("Addr1", k) << " <= Y" << range(sizeY-1, sizeY-k) << ";\n";
			vhdl << tab << declare("Z", sizeZ) << " <= Y" << range(sizeZ-1, 0) << ";\n";

			vhdl << tab << declare("Addr2", k) << " <= Z" << range(sizeZ-1, sizeZ-k) << ";\n";
			magicTable* table = new magicTable(target);
			oplist.push_back(table);
			
			/* Magic Table is an instance of DualTable which is, for now combinatorial */
			nextCycle(); //However, to get the MagicTable inferred as a dual-port ram, it needs buffered inputs			
			outPortMap(table, "Y2", "lowerTerm0");
			inPortMap(table, "X2", "Addr2");
			outPortMap(table, "Y1", "expA0");
			inPortMap(table, "X1", "Addr1");
			vhdl << instance(table, "table");
			setSignalDelay("expA0",  target->RAMDelay() );
			syncCycleFromSignal("expA0", getSignalDelay("expA0"));
			
			//TODO FIXME
			//cpexpA = getCriticalPath();
			vhdl << tab << declare("expA", 27) << " <=  expA0" << range(35, 9) << ";" << endl;
			setSignalDelay("expA", target->RAMDelay());
			vhdl << tab << declare("expZmZm1_0", 9) << " <= lowerTerm0" << range(8, 0) << ";" << endl;

#endif
		}
		else { // use a polynomial evaluator
			vhdl << tab << declare("Addr1", k) << " <= Y" << range(sizeY-1, sizeY-k) << ";\n";
			vhdl << tab << declare("Z", sizeZ) << " <= Y" << range(sizeZ-1, 0) << ";\n";
			vhdl << tab << declare("Zhigh", sizeZhigh) << " <= Z" << range(sizeZ-1, sizeZ-sizeZhigh) << ";\n";
		
			double cpZhigh = getCriticalPath();
//			manageCriticalPath( target->LogicToRAMWireDelay() + target->RAMDelay() );
			firstExpTable* table;
			table = new firstExpTable(target, k, sizeExpA); // e^A-1 has MSB weight 1
			oplist.push_back(table);
			outPortMap(table, "Y", "expA");
			inPortMap(table, "X", "Addr1");
			vhdl << instance(table, "table");
			setSignalDelay("expA",  table->getOutputDelay("Y"));
			syncCycleFromSignal("expA", getSignalDelay("expA"));
			vhdl << "-- signal delay at BRAM output = "<<getSignalDelay("expA")<<endl;
			//cpexpA = getCriticalPath();
			syncCycleFromSignal("Zhigh", cpZhigh );

#if 1
			REPORT(LIST, "Generating the polynomial approximation, this may take some time");
			// We want the LSB value to be  2^(wF+g)
			FunctionEvaluator *fe;
			ostringstream function;
			function << "1b"<<2*k<<"*(exp(x*1b-" << k << ")-x*1b-" << k << "-1), 0,1,1";
			fe = new FunctionEvaluator(target, function.str(), sizeZhigh, wF+g-2*k, d, true, inDelayMap("X", target->localWireDelay() + getCriticalPath()) );
			oplist.push_back(fe);
			inPortMap(fe, "X", "Zhigh");
			outPortMap(fe, "R", "expZmZm1_0");
			vhdl << instance(fe, "poly");
			syncCycleFromSignal("expZmZm1_0", fe->getOutputDelay("R") );
#else
			FunctionTable *fe;
			ostringstream function;
			function << "1b"<<2*k<<"*(exp(x*1b-" << k << ")-x*1b-" << k << "-1)";
			fe = new FunctionTable(target, function.str(), sizeZhigh, -wF-g+2*k, -1, inDelayMap("X", target->localWireDelay() + getCriticalPath()) );
			oplist.push_back(fe);
			inPortMap(fe, "X", "Zhigh");
			outPortMap(fe, "Y", "expZmZm1_0");
			vhdl << instance(fe, "poly");
			syncCycleFromSignal("expZmZm1_0", fe->getOutputDelay("R") );

#endif
		}

		// here we have in expZmZm1 e^Z-Z-1
		// Alignment of expZmZm10:  MSB has weight -2*k, LSB has weight -(wF+g).
		//		vhdl << tab << declare("ShouldBeZero2", (rWidth- sizeZxpZmZm1)) << " <= expZmZm1_0" << range(rWidth-1, sizeZxpZmZm1)  << "; -- for debug to check it is always 0" <<endl;
		vhdl << tab << declare("expZmZm1", sizeZxpZmZm1) << " <= expZmZm1_0" << range(sizeZxpZmZm1-1, 0)  << "; " <<endl;
		
		vhdl << tab << "-- Computing Z + (exp(Z)-1-Z)" << endl;
		
		IntAdder* addexpZminus1 = new IntAdder( target, sizeExpZm1, inDelayMap( "X", target->localWireDelay() + getCriticalPath() ) );
		oplist.push_back(addexpZminus1);
		
		vhdl << tab << declare( "expZminus1X", sizeExpZm1) << " <= '0' & Z;"<<endl;
		vhdl << tab << declare( "expZminus1Y", sizeExpZm1) << " <= " << rangeAssign(sizeZ, sizeZ-k+1, "'0'") << " & expZmZm1 ;" << endl;
		
		inPortMap(addexpZminus1, "X", "expZminus1X");
		inPortMap(addexpZminus1, "Y", "expZminus1Y");
		inPortMapCst( addexpZminus1, "Cin" , " '0' ");
		outPortMap( addexpZminus1, "R", "expZminus1");
		vhdl << instance( addexpZminus1, "Adder_expZminus1");
		syncCycleFromSignal("expZminus1", addexpZminus1->getOutputDelay("R") );


		vhdl << tab << "-- Truncating expA to the same accuracy as expZminus1" << endl;
		setCycleFromSignal("expA", getSignalDelay("expA"));
		
		IntAdder* expArounded0 = new IntAdder( target, sizeMultIn+1, inDelayMap( "X", target->RAMToLogicWireDelay() + getCriticalPath()) );
		oplist.push_back(expArounded0);
		
		
		inPortMapCst(expArounded0, "X", "expA"+range(sizeExpA-1, sizeExpA-sizeMultIn-1));
		inPortMapCst(expArounded0, "Y", zg(sizeMultIn+1,0));
		inPortMapCst( expArounded0, "Cin" , " '1' ");
		outPortMap( expArounded0, "R", "expArounded0");
		vhdl << instance( expArounded0, "Adder_expArounded0");
		syncCycleFromSignal("expArounded0", expArounded0->getOutputDelay("R") );
		
		vhdl << tab << declare("expArounded", sizeMultIn) << " <= expArounded0" << range(sizeMultIn, 1) << ";" << endl;
		
		syncCycleFromSignal( "expZminus1", addexpZminus1->getOutputDelay("R"));
		
		int sizeProd;
		Operator* lowProd;
		if(false && wF+g-k>17){ // commented out because 1/ it fails the test, do,n't understand why and 2/ it adds 4 cycles to the latency TODO
			sizeProd = (sizeExpA-k+1); 
			lowProd = new IntTruncMultiplier(target, sizeMultIn, sizeExpZm1, sizeProd, 0.95, 1, -1, false, false);  //inDelayMap("X", target->LogicToDSPWireDelay() + getCriticalPath() ) );
		}
		else {
			sizeProd = sizeMultIn + sizeExpZm1;
			//	if (wF==23){
			//nextCycle();//FIXME -> add inputDelays to intTilingMultiplier
				// ???? This builds a comlbinatorial mult,
				//lowProd = new IntTilingMult(target, sizeMultIn, sizeExpZm1, 0.15, -1, false);//, inDelayMap("X", target->LogicToDSPWireDelay() + getCriticalPath() ) );
			//}// else
		 			// 		lowProd = new IntMultiplier(target, sizeMultIn, sizeExpZm1, inDelayMap("X", target->LogicToDSPWireDelay() + getCriticalPath() ) );
		}
		lowProd = new IntMultiplier(target, sizeMultIn, sizeExpZm1, inDelayMap("X", target->LogicToDSPWireDelay() + getCriticalPath() ) );
			oplist.push_back(lowProd);
		
			inPortMap(lowProd, "X", "expArounded");
		inPortMap(lowProd, "Y", "expZminus1");
		outPortMap(lowProd, "R", "lowerProduct");
		
		vhdl << instance(lowProd, "TheLowerProduct")<<endl;
		syncCycleFromSignal("lowerProduct", lowProd->getOutputDelay("R") );

		vhdl << tab << "-- Final addition -- the product MSB bit weight is -k+2 = "<< -k+2 << endl;


#if 0 // Trying to round the product instead of truncating it		Why doesn't that work?
		IntAdder *finalAdder = new IntAdder(target, sizeExpA+1, finalAdderInDelayMap, 2, 1, -1);
		oplist.push_back(finalAdder);
		
		vhdl << tab << declare("extendedLowerProduct",sizeExpA+1) << " <= (" << rangeAssign(sizeExpA-1, sizeExpA-k+1, "'0'") 
		     << " & lowerProduct" << range(sizeMultIn+sizeExpZm1-1, sizeMultIn+sizeExpZm1 - (sizeExpA-k+1) -1) << ");" << endl;		
		vhdl << tab << declare("extendedExpA",sizeExpA+1) << " <= expA & '1'; -- rounding bit for the product" << endl;		
		     
		     
		inPortMap(finalAdder, "X", "extendedExpA");
		inPortMap(finalAdder, "Y", "extendedLowerProduct");
		inPortMapCst(finalAdder, "Cin", "'0'");
		outPortMap(finalAdder, "R", "expY0");
		
		vhdl << instance(finalAdder,"TheFinalAdder") << endl;
		syncCycleFromSignal("expY0");
		vhdl << tab << declare("expY",sizeExpA) << " <= expY0" << range(sizeExpA, 1) << " ; -- rounding" << endl;		
		     		
#else  //  truncating it		
		IntAdder *finalAdder = new IntAdder(target, sizeExpA, inDelayMap( "X", target->localWireDelay() + getCriticalPath()));
		oplist.push_back(finalAdder);
		
		vhdl << tab << declare("extendedLowerProduct",sizeExpA) << " <= (" << rangeAssign(sizeExpA-1, sizeExpA-k+1, "'0'") 
		     << " & lowerProduct" << range(sizeProd-1, sizeProd - (sizeExpA-k+1)) << ");" << endl;
		     		     
		inPortMap(finalAdder, "X", "expA");
		inPortMap(finalAdder, "Y", "extendedLowerProduct");
		inPortMapCst(finalAdder, "Cin", "'0'");
		outPortMap(finalAdder, "R", "expY");
		
		vhdl << instance(finalAdder,"TheFinalAdder") << endl;
		syncCycleFromSignal("expY", finalAdder->getOutputDelay("R") );
		     		
#endif

		rWidth=sizeExpA; // for the rounding
				       
#else
		throw string("FPExp requires Sollya for this precision, sorry.");
#endif


		// The following is generic normalization/rounding code if we have an approx of exp(y) of size rwidth in expY
		// with MSB of weight 2^1
		// We start a cycle here
//		nextCycle();

		vhdl << tab << declare("needNoNorm") << " <= expY(" << rWidth-1 << ");" << endl;
		manageCriticalPath( target->localWireDelay(wE+wF+2) + target->lutDelay() );		
		vhdl << tab << "-- Rounding: all this should consume one row of LUTs" << endl; 
		vhdl << tab << declare("preRoundBiasSig", wE+wF+2)
		     << " <= conv_std_logic_vector(" << bias << ", wE+2)  & expY" << range(rWidth-2, rWidth-2-wF+1) << " when needNoNorm = '1'" << endl
		     << tab << tab << "else conv_std_logic_vector(" << bias-1 << ", wE+2)  & expY" << range(rWidth-3, rWidth-3-wF+1) << " ;" << endl;

		vhdl << tab << declare("roundBit") << " <= expY(" << rWidth-2-wF << ")  when needNoNorm = '1'    else expY(" <<  rWidth-3-wF << ") ;" << endl;
		vhdl << tab << declare("roundNormAddend", wE+wF+2) << " <= K(" << wE << ") & K & "<< rangeAssign(wF-1, 1, "'0'") << " & roundBit;" << endl;

		
		IntAdder *roundedExpSigOperandAdder = new IntAdder(target, wE+wF+2, inDelayMap( "X", target->localWireDelay() + getCriticalPath()));
		oplist.push_back(roundedExpSigOperandAdder);
		
		inPortMap(roundedExpSigOperandAdder, "X", "preRoundBiasSig");
		inPortMap(roundedExpSigOperandAdder, "Y", "roundNormAddend");
		inPortMapCst(roundedExpSigOperandAdder, "Cin", "'0'");
		outPortMap(roundedExpSigOperandAdder, "R", "roundedExpSigRes");
		
		vhdl << instance(roundedExpSigOperandAdder,"roundedExpSigOperandAdder") << endl;
		syncCycleFromSignal("roundedExpSigRes", roundedExpSigOperandAdder->getOutputDelay("R") );
		vhdl << tab << "-- delay at adder output is " << getCriticalPath() << endl;

		manageCriticalPath( target->localWireDelay() + target->lutDelay() );
		vhdl << tab << declare("roundedExpSig", wE+wF+2) << " <= roundedExpSigRes when Xexn=\"01\" else "
		     << " \"000\" & (wE-2 downto 0 => '1') & (wF-1 downto 0 => '0');" << endl;
	
		manageCriticalPath( target->localWireDelay() + target->lutDelay() );
		vhdl << tab << declare("ofl1") << " <= not XSign and oufl0 and (not Xexn(1) and Xexn(0)); -- input positive, normal,  very large" << endl;
		vhdl << tab << declare("ofl2") << " <= not XSign and (roundedExpSig(wE+wF) and not roundedExpSig(wE+wF+1)) and (not Xexn(1) and Xexn(0)); -- input positive, normal, overflowed" << endl;
		vhdl << tab << declare("ofl3") << " <= not XSign and Xexn(1) and not Xexn(0);  -- input was -infty" << endl;
		vhdl << tab << declare("ofl") << " <= ofl1 or ofl2 or ofl3;" << endl;

		vhdl << tab << declare("ufl1") << " <= (roundedExpSig(wE+wF) and roundedExpSig(wE+wF+1))  and (not Xexn(1) and Xexn(0)); -- input normal" << endl;
		vhdl << tab << declare("ufl2") << " <= XSign and Xexn(1) and not Xexn(0);  -- input was -infty" << endl;
		vhdl << tab << declare("ufl3") << " <= XSign and oufl0  and (not Xexn(1) and Xexn(0)); -- input negative, normal,  very large" << endl;

		vhdl << tab << declare("ufl") << " <= ufl1 or ufl2 or ufl3;" << endl;

		vhdl << tab << declare("Rexn", 2) << " <= \"11\" when Xexn = \"11\"" << endl
		     << tab << tab << "else \"10\" when ofl='1'" << endl
		     << tab << tab << "else \"00\" when ufl='1'" << endl
		     << tab << tab << "else \"01\";" << endl;
		
		vhdl << tab << "R <= Rexn & '0' & roundedExpSig" << range(wE+wF-1, 0) << ";" << endl;
		outDelayMap["R"] = getCriticalPath();

	}	

	FPExp::~FPExp()
	{
	}



	void FPExp::emulate(TestCase * tc)
	{
		/* Get I/O values */
		mpz_class svX = tc->getInputValue("X");

		/* Compute correct value */
		FPNumber fpx(wE, wF);
		fpx = svX;

		mpfr_t x, ru,rd;
		mpfr_init2(x,  1+wF);
		mpfr_init2(ru, 1+wF);
		mpfr_init2(rd, 1+wF); 
		fpx.getMPFR(x);
		mpfr_exp(rd, x, GMP_RNDD);
		mpfr_exp(ru, x, GMP_RNDU);
		FPNumber  fprd(wE, wF, rd);
		FPNumber  fpru(wE, wF, ru);
		mpz_class svRD = fprd.getSignalValue();
		mpz_class svRU = fpru.getSignalValue();
		tc->addExpectedOutput("R", svRD);
		tc->addExpectedOutput("R", svRU);
		mpfr_clears(x, ru, rd, NULL);
	}
 


	void FPExp::buildStandardTestCases(TestCaseList* tcl){
		TestCase *tc;

		mpfr_t x, y;
		FPNumber *fx, *fy;
		// double d;

		mpfr_init2(x, 1+wF);
		mpfr_init2(y, 1+wF);



		tc = new TestCase(this); 
		tc->addFPInput("X", log(2));
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", FPNumber::plusDirtyZero);
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", FPNumber::minusDirtyZero);
		emulate(tc);
		tcl->add(tc);



		tc = new TestCase(this); 
		tc->addFPInput("X", 1.0);
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", 2.0);
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", 1.5);
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", -1.0);
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", -2.0);
		emulate(tc);
		tcl->add(tc);

		tc = new TestCase(this); 
		tc->addFPInput("X", -3.0);
		emulate(tc);
		tcl->add(tc);




		tc = new TestCase(this); 
		tc->addComment("The largest number whose exp is finite");
		fx = new FPNumber(wE, wF, FPNumber::largestPositive);
		fx->getMPFR(x);
		mpfr_log(y, x, GMP_RNDN);
		//		cout << "A " << fx->getSignalValue() << endl;
		//		 d = mpfr_get_d(x, GMP_RNDN);
		// cout << d << endl;
		// d = mpfr_get_d(y, GMP_RNDN);
		// cout << d << endl;
		fy = new FPNumber(wE, wF, y); 
		tc->addFPInput("X", fy);
		emulate(tc);
		tcl->add(tc);
		delete(fx); 

		tc = new TestCase(this); 
		tc->addComment("The first number whose exp is infinite");
		mpfr_nextabove(y);
		fy = new FPNumber(wE, wF, y); 
		tc->addFPInput("X", fy);
		emulate(tc);
		tcl->add(tc);
		delete(fy);




		tc = new TestCase(this); 
		tc->addComment("The last number whose exp is nonzero");
		fx = new FPNumber(wE, wF, FPNumber::smallestPositive);
		fx->getMPFR(x);
		mpfr_log(y, x, GMP_RNDU);

		// cout << "A " << fx->getSignalValue() << endl;
		// d = mpfr_get_d(x, GMP_RNDN);
		// cout << d << endl;
		// d = mpfr_get_d(y, GMP_RNDN);
		// cout << d << endl;

		fy = new FPNumber(wE, wF, y); 
		tc->addFPInput("X", fy);
		emulate(tc);
		tcl->add(tc);
		delete(fx); 

		tc = new TestCase(this); 
		tc->addComment("The first number whose exp flushes to zero");
		mpfr_nextbelow(y);
		fy = new FPNumber(wE, wF, y); 
		tc->addFPInput("X", fy);
		emulate(tc);
		tcl->add(tc);
		delete(fy);



	
		mpfr_clears(x, y, NULL);
	}





	// One test out of 8 fully random (tests NaNs etc)
	// All the remaining ones test numbers with exponents between -wF-3 and wE-2,
	// For numbers outside this range, exp over/underflows or flushes to 1. 
 
	TestCase* FPExp::buildRandomTestCase(int i){
		TestCase *tc;
		tc = new TestCase(this); 
		mpz_class x;
		mpz_class normalExn = mpz_class(1)<<(wE+wF+1);
		mpz_class bias = ((1<<(wE-1))-1);
		/* Fill inputs */
		if ((i & 7) == 0) { //fully random
			x = getLargeRandom(wE+wF+3);
		}
		else
			{
				mpz_class e = (getLargeRandom(wE+wF) % (wE+wF+2) ) -wF-3; // Should be between -wF-3 and wE-2
				//cout << e << endl;
				e = bias + e;
				mpz_class sign = getLargeRandom(1);
				x  = getLargeRandom(wF) + (e << wF) + (sign<<(wE+wF)) + normalExn;
			}
		tc->addInput("X", x);
		/* Get correct outputs */
		emulate(tc);
		return tc;
	}


}
