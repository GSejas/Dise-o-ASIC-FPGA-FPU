#ifndef SignedIntMultiplier_HPP
#define SignedIntMultiplier_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>

#include "../Operator.hpp"
#include "../IntAdder.hpp"
#include "../IntMultiAdder.hpp"


namespace flopoco{


	/** 
	 * The Integer Multiplier class. Receives at input two numbers of 
	 * wInX and wInY widths and outputs a result having the width wOut=wInX+wInY 
	 **/
	class SignedIntMultiplier : public Operator
	{
	public:
		/** 
		 * The constructor of the SignedIntMultiplier class
		 * @param target argument of type Target containing the data for which this operator will be optimized
		 * @param wInX integer argument representing the width in bits of the input X 
		 * @param wInY integer argument representing the width in bits of the input Y
		 **/
		SignedIntMultiplier(Target* target, int wInX, int wInY, map<string, double> inputDelays = emptyDelayMap);
	
		/** SignedIntMultiplier destructor */
		~SignedIntMultiplier();
	
		int getChunkNumber( int width, int mSu, int mSs){
			int  chunks=0;
			int  w = width;
			bool done = false; 
			while (!done){
				if (w-mSs<=0){
					w -= mSs;
					done = true;
				}else{
					w -= mSu;
				}
				chunks++;
			}
			return chunks;
		}
		void outputVHDL(std::ostream& o, std::string name);

		void emulate(TestCase* tc);

	protected:

		int wInX_; /**< the width (in bits) of the input X  */
		int wInY_; /**< the width (in bits) of the input Y  */
		int wOut_; /**< the width (in bits) of the output R  */

	private:

	};

}
#endif
