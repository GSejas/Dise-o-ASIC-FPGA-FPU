#ifndef TaMaDiSystem_HPP
#define TaMaDiSystem_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>


#include <Operator.hpp>
#include "TaMaDiModuleWrapperInterface.hpp"
#include "TaMaDiDeserializer.hpp"
#include "TaMaDiDispatcherInterface.hpp"

namespace flopoco{

	/** The TaMaDiSystem class.  */
	class TaMaDiSystem : public Operator
	{
	public:

		/**
		 * The TaMaDiSystem constructor
		 * @param[in]		target  the target device
		 * @param[in]		wp		binary-format precision we are intrested in      
		 * @param[in]		d		polynomial degree
		 * @param[in]		iterations number of iterations in each interval
		 * @param[in]		wIntervalID the number of bits required to store the interval ID (log2(#intervals))  
		 * @param[in]		n		number of parallel processing units
		 **/ 
		TaMaDiSystem(Target* target, int wp, int d, int iterations, int wIntervalID, int compSize, int n, int inFIFODepth, int peFIFODepth, int outFIFODepth, int DispatcherInputFIFODepth, int DispatcherOutputFIFODepth, int ModuleCount);

		/**
		 * TaMaDiSystem destructor
		 */
		~TaMaDiSystem();
	
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
