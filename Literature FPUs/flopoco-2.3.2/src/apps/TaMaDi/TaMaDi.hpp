#ifndef TaMaDi_HPP
#define TaMaDi_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>
#include <FloPoCo.hpp>




/* the TaMaDi application, using FPGAs to caluclate the hard-to
round cases for elementary functions ------------------------- */
#include "TaMaDiSystem.hpp"
#include "TaMaDiModule.hpp"
#include "TaMaDiCore.hpp"
#include "TaMaDiModuleDummyWrapper.hpp"
#include "TaMaDiModuleWrapperInterface.hpp"
#include "TaMaDiDispatcherInterface.hpp"
#include "TaMaDiPriorityEncoder.hpp"
#include "TaMaDiDecoder.hpp"
#include "TaMaDiFIFO.hpp"
#include "TaMaDiShiftRegister.hpp"
#include "TaMaDiDeserializer.hpp"


namespace flopoco{

	/** The TaMaDi class.  */
	class TaMaDi : public Operator
	{
	public:

		/**
		 * The TaMaDi constructor
		 * @param[in]		target  the target device
		 * @param[in]		wp		binary-format precision we are intrested in      
		 * @param[in]		d		polynomial degree
		 * @param[in]		iterations number of iterations in each interval
		 * @param[in]		wIntervalID the number of bits required to store the interval ID (log2(#intervals))  
		 * @param[in]		n		number of parallel processing units
		 **/ 
		TaMaDi(Target* target, int wp, int d, int iterations, int wIntervalID, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth);

		/**
		 * TaMaDi destructor
		 */
		~TaMaDi();
	
	protected:
		
		int wp;    /**< Working precision will be defined as m-p */
		int d;     /**< The degree of the polynomial */
		int iterations;
		int wIntervalID;
		int n;
		int inFIFODepth;
		
	private:
	};
}
#endif
