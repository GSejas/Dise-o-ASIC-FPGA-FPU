#ifndef TaMaDiDecoder_HPP
#define TaMaDiDecoder_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>


#include <Operator.hpp>

namespace flopoco{

	/** The TaMaDiDecoder class.  */
	class TaMaDiDecoder : public Operator
	{
	public:

		/**
		 * The TaMaDiDecoder constructor
		 * @param[in]		target  the target device
		 * @param[in]		n		number of outputs      
		 **/ 
		TaMaDiDecoder(Target* target, int n);

		/**
		 * TaMaDiDecoder destructor
		 */
		~TaMaDiDecoder();
	
	protected:
		
		
	private:
	};
}
#endif
