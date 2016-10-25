#ifndef TaMaDiPriorityEncoder_HPP
#define TaMaDiPriorityEncoder_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>


#include <Operator.hpp>

namespace flopoco{

	/** The TaMaDiPriorityEncoder class.  */
	class TaMaDiPriorityEncoder : public Operator
	{
	public:

		/**
		 * The TaMaDiPriorityEncoder constructor
		 * @param[in]		target  the target device
		 * @param[in]		n		number of inputs      
		 **/ 
		TaMaDiPriorityEncoder(Target* target, int n);

		/**
		 * TaMaDiPriorityEncoder destructor
		 */
		~TaMaDiPriorityEncoder();
	
	protected:
		
		
	private:
	};
}
#endif
