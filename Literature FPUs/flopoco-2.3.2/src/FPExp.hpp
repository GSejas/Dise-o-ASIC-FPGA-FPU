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
#ifndef __FPEXP_HPP
#define __FPEXP_HPP
#include <vector>
#include <sstream>

#include "Operator.hpp"
#include "Table.hpp"
#include "DualTable.hpp"
#include "IntMultipliers/IntTilingMult.hpp"

class Fragment;
class FPNumber;


namespace flopoco{


	class FPExp : public Operator
	{
	public:


		/** The magic dual table */
		
		class magicTable: public DualTable {
		public:
			static const int sizeH = 27;
			static const int sizeL = 9;

			magicTable(Target* target) :

				DualTable(target, 9, 36, 0, 511) {
				ostringstream name; 
				srcFileName="FPExp::MagicSPExpTable";
				name <<"MagicSPExpTable";
				setName(name.str());
			};

			mpz_class function(int x);
		};


		class firstExpTable: public Table {
		public:

			firstExpTable(Target* target, int wIn, int wOut) : 
				Table(target, wIn, wOut) {
				ostringstream name; 
				srcFileName="FPExp::firstExpTable";
				name <<"firstExpTable_" << wIn << "_" << wOut;
				setName(name.str());
				
				outDelayMap["Y"] = target->RAMDelay();
			};

			mpz_class function(int x);
		};






		/** The constructor with manual control of all options
		    * @param wE exponent size
		    * @param wF fraction size
		    * @param k size of the input to the first table 
		    * @param d  degree of the polynomial approximation (if k=d=0, the constructor tries to compute sensible values)
		    * @param guardBits number of gard bits, defaults to 3, which is enough for faithful rounding 
		    * @param fullInput boolean, if true input mantissa is of size wE+wF+1, so that input shift doesn't padd it with 0s (useful for FPPow)
		    */

		FPExp(Target* target, int wE, int wF, int k, int d, int guardBits=3, bool fullInput=false,  map<string, double> inputDelays = emptyDelayMap);
		~FPExp();
		
		// Overloading the virtual functions of Operator
		// void outputVHDL(std::ostream& o, std::string name);
		
		void emulate(TestCase * tc);
		void buildStandardTestCases(TestCaseList* tcl);
		TestCase* buildRandomTestCase(int i);

	private:
		int wE; /**< Exponent size */
		int wF; /**< Fraction size */
		int k;  /**< Size of the address bits for the first table  */
		int d;  /**< Degree of the polynomial approximation */
		int g;  /**< Number of guard bits */
	};

}
#endif
