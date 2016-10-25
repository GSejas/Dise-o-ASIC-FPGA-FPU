#ifndef TaMaDiShiftRegister_HPP
#define TaMaDiShiftRegister_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>


#include <Operator.hpp>

namespace flopoco{

	/** The TaMaDiShiftRegister class.  */
	class TaMaDiShiftRegister : public Operator
	{
	public:

		/**
		 * The TaMaDiShiftRegister constructor
		 * @param[in]		target  the target device
		 * @param[in]		widthLocation		the width of the shift register in bits
		 * @param[in]		n				the number of positions it supports for shifting       
		 **/ 
		TaMaDiShiftRegister(Target* target, int widthLocation, int n);

		/**
		 * TaMaDiShiftRegister destructor
		 */
		~TaMaDiShiftRegister();
	
	protected:
		
		
	private:
	};
}
#endif
