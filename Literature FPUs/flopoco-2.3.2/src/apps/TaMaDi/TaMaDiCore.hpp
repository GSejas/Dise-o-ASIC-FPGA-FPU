#ifndef TaMaDiCore_HPP
#define TaMaDiCore_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>


#include <Operator.hpp>

namespace flopoco{

	/** The TaMaDiCore class.  */
	class TaMaDiCore : public Operator
	{
	public:

		/**
		 * The TaMaDiCore constructor
		 * @param[in]		target  the target device
		 * @param[in]		p		binary-format precision we are intrested in      
		 * @param[in]		m		largest possble precision value  
		 **/ 
		TaMaDiCore(Target* target, int wp, int d, int iterations, int wIntervalID, int compSize);

		/**
		 * TaMaDiCore destructor
		 */
		~TaMaDiCore();
	
	protected:
		
		int wp;    /**< Working precision will be defined as m-p */
		int d;     /**< The degree of the polynomial */
		int iterations;
		int wIntervalID;
	
		void outputVHDL(std::ostream& o, std::string name);
	private:
	};
}
#endif
