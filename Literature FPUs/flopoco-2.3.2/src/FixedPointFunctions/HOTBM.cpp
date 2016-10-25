/*
  Higher-Order Table-Based Method in FloPoCo

  Authors: J. Detrey, F. de Dinechin, C. Klein

  This file is part of the FloPoCo project
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

  */
#include "HOTBM.hpp"
#include "Function.hpp"
#include "HOTBM/Param.hh"
#include "HOTBM/HOTBMInstance.hh"
#include "HOTBM/Exhaustive.hh"
#include "../utils.hpp"


namespace flopoco{

	HOTBM::HOTBM(Target* target, string func, string namebase, int wI, int wO, int n, double xmin, double xmax, double scale)
		: Operator(target), inst(0), f(*new Function(func, xmin, xmax, scale)), wI(wI), wO(wO)
	{
		try {
			Param p(wI, wO, n);
			Exhaustive ex(f, p);

			inst = 0;
			inst = ex.getInstance();
			inst->roundTables();
		} catch (const char *s) {
			throw std::string(s);
		}
		if (!inst)
			throw std::string("HOTBM cound not be generated.");

		{
			std::ostringstream o;
			if(namebase != "")
				o << namebase << "_";
 
			o << "hotbm_" << vhdlize(func) << wI << "_" << wO << "_" << n;
			o << "_" << vhdlize(xmin) << "_" << vhdlize(xmax) << "_" << vhdlize(scale);
			uniqueName_ = o.str();
		}
		setCombinatorial();
		addInput("X", wI);
		addOutput("R", wO+1, 2);  // faithful rounding
	}

	HOTBM::~HOTBM()
	{
		if (inst)
			delete inst;
	}

	// Overloading the virtual functions of Operator
	void HOTBM::outputVHDL(std::ostream& o, std::string name)
	{
		if (!inst)
			return;

		inst->genVHDL(o, name);
	}


	void HOTBM::fillTestCase(mpz_class a[])
	{
		/* Get inputs / outputs */
		mpz_class &x  = a[0];
		mpz_class &rd = a[1]; // rounded down
		mpz_class &ru = a[2]; // rounded up

		// int outSign = 0;

		mpfr_t mpX, mpR;
		mpfr_inits(mpX, mpR, 0, NULL);

		/* Convert a random signal to an mpfr_t in [0,1[ */
		mpfr_set_z(mpX, x.get_mpz_t(), GMP_RNDN);
		mpfr_div_2si(mpX, mpX, wI, GMP_RNDN);

		/* Compute the function */
		f.eval(mpR, mpX);

		/* Compute the signal value */
		if (mpfr_signbit(mpR))
			{
				// outSign = 1;
				mpfr_abs(mpR, mpR, GMP_RNDN);
			}
		mpfr_mul_2si(mpR, mpR, wO, GMP_RNDN);

		/* NOT A TYPO. HOTBM only guarantees faithful
		 * rounding, so we will round down here,
		 * add both the upper and lower neighbor.
		 */
		mpfr_get_z(rd.get_mpz_t(), mpR, GMP_RNDD);
		ru = rd + 1;
	}

}
