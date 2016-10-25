#ifndef TaMaDiFIFO_HPP
#define TaMaDiFIFO_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>


#include <Operator.hpp>

namespace flopoco{

	/** The TaMaDiFIFO class.  */
	class TaMaDiFIFO : public Operator
	{
	public:

		/**
		 * The TaMaDiFIFO constructor
		 * @param[in]		target  the target device
		 * @param[in]		n		number of outputs      
		 **/ 
		TaMaDiFIFO(Target* target, int w, int n, int moreThan = 0);

		/**
		 * TaMaDiFIFO destructor
		 */
		~TaMaDiFIFO();
	
		/**
		 * Method belonging to the Operator class overloaded by the IntSquarer class
		 * @param[in,out] o     the stream where the current architecture will be outputed to
		 * @param[in]     name  the name of the entity corresponding to the architecture generated in this method
		 **/
		void outputVHDL(std::ostream& o, std::string name);
	
	protected:
		int _n;
		int	_w;
		int _moreThan;
		
	private:
	};
}
#endif
