#ifndef STRATIXII_HPP
#define  STRATIXII_HPP
#include <iostream>
#include <sstream>
#include <vector>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include "../Target.hpp"


namespace flopoco{

	/** Class for representing an StratixII target */
	class StratixII : public Target
	{
	public:

		/** The default constructor. */  
		StratixII() : Target()	{
			id_                = "StratixII";
			vendor_           = "Altera";
			maxFrequencyMHz_= 400;
			sizeOfBlock_ 		= 4608; 	// the size of a primitive block is 2^9 * 9
			fastcarryDelay_ 	= 3.5e-11; 	// aproximately right    
			elemWireDelay_  	= 0.222e-11; 	// an average value over R4, R24, C4, C16 interconnects delays
			lut2lutDelay_   	= 1.5e-10; 	// ???
			lutDelay_       	= 0.378e-9; 	// 378 ps  
			ffDelay_        	= 0.127e-9; 	// 127 ps LE register clock-to-output max delay for -3 speed grade
			multXInputs_    	= 36;
			multYInputs_    	= 36;
			lutInputs_		= 6;
			almsPerLab_		= 8;		// there are 8 ALMs per LAB
			// all these values are set precisely to match the Stratix 2
			lut2_ 			= 0.162e-9; 	// obtained from Handbook
			lut3_			= 0.280e-9; 	// obtained from Handbook
			lut4_			= 0.378e-9; 	// obtained from Handbook
			innerLABcarryDelay_	= 0.136e-9; 	// obtained from Quartus 2 Chip Planner
			interLABcarryDelay_	= 0.235e-9; 	// obtained from Quartus 2 Chip Planner
			shareOutToCarryOut_	= 0.172e-9; 	// obtained from Quartus 2 Chip Planner
			muxStoO_		= 0.189e-9; 	// obtained from Quartus 2 Chip Planner by subtraction
			fdCtoQ_			= 0.352e-9; 	// obtained from Quartus 2 Chip Planner by subtraction
			carryInToSumOut_	= 0.125e-9;	// obtained from Quartus 2 Chip Planner
			// DSP parameters
			totalDSPs_ 		= 12;		
			nrConfigs_ 		= 3;		// StratixII has 9, 18, 36 bit multipliers by default
		
			multiplierWidth_[0] 	= 9;
			multiplierWidth_[1] 	= 18;
			multiplierWidth_[2] 	= 36;
		
			multiplierDelay_[0] 	= 2.439e-9; 	// obtained experimentaly from Quartus 2. Value in handbook is: 2.880e-9
			multiplierDelay_[1] 	= 2.724e-9; 	// obtained experimentaly from Quartus 2. Value in handbook is: 2.990e-9
			multiplierDelay_[2] 	= 4.000e-9; 	// obtained experimentaly from Quartus 2. Value in handbook is: 4.450e-9
			
			RAMDelay_ = 2.439e-9; //TODO
			RAMToLogicWireDelay_ = 0.439e-9; //TODO
		}
	
		/** The destructor */
		virtual ~StratixII() {}

		/** overloading the virtual functions of Target
		 * @see the target class for more details 
		 */
		double carryPropagateDelay();
		double adderDelay(int size);
		double eqComparatorDelay(int size);
		double eqConstComparatorDelay(int size);

		double DSPMultiplierDelay(){ return multiplierDelay_[2];}
		double DSPAdderDelay(){ return 2.439e-9;} //TODO
		double DSPCascadingWireDelay(){ return 0.378e-9;}//TODO
		double DSPToLogicWireDelay(){ return 0.724e-9;}	
		double LogicToDSPWireDelay(){ return 0.724e-9;}
		
		double RAMDelay() { return RAMDelay_; }
		double RAMToLogicWireDelay() { return RAMToLogicWireDelay_; }
		double LogicToRAMWireDelay() { return RAMToLogicWireDelay_; }	

		
		void   getAdderParameters(double &k1, double &k2, int size);
		double localWireDelay(int fanout = 1);
		double lutDelay();
		double ffDelay();
		double distantWireDelay(int n);
		bool   suggestSubmultSize(int &x, int &y, int wInX, int wInY);
		bool   suggestSubaddSize(int &x, int wIn);
		bool   suggestSlackSubaddSize(int &x, int wIn, double slack);
		bool   suggestSlackSubcomparatorSize(int &x, int wIn, double slack, bool constant);
		
		int    getIntMultiplierCost(int wInX, int wInY);
		long   sizeOfMemoryBlock();
		DSP*   createDSP(); 
		int    getEquivalenceSliceDSP();
		int    getNumberOfDSPs();
		void   getDSPWidths(int &x, int &y, bool sign = false);
		int    getIntNAdderCost(int wIn, int n);	

	private:

		double fastcarryDelay_; 	/**< The delay of the fast carry chain */
		double lut2lutDelay_;   	/**< The delay between two LUTs */
		double ffDelay_;   		/**< The delay between two flipflops (not including elemWireDelay_) */
		double elemWireDelay_;  	/**< The elementary wire dealy (for computing the distant wire delay) */
		double lutDelay_;       	/**< The LUT delay (in seconds)*/
	
		// Added by Sebi
		double lut2_;           	/**< The LUT delay for 2 inputs */
		double lut3_;           	/**< The LUT delay for 3 inputs */
		double lut4_;           	/**< The LUT delay for 4 inputs */
		double innerLABcarryDelay_;	/**< The wire delay between the upper and lower parts of a LAB --> R4 & C4 interconnects */	
		double interLABcarryDelay_;	/**< The approximate wire between two LABs --> R24 & C16 interconnects */	
		double shareOutToCarryOut_;	/**< The delay between the shared arithmetic out of one LAB and the carry out of the following LAB */	
		double muxStoO_;		/**< The delay of the MUX right after the 3-LUT of a LAB */	
		double fdCtoQ_;			/**< The delay of the FlipFlop. Also contains an approximate Net Delay experimentally determined */	
		double carryInToSumOut_;	/**< The delay between the carry in and the adder outup of one LAB */
		int    almsPerLab_;		/**< The number of ALMs contained by a LAB */
	
		// DSP parameters
		int 	totalDSPs_;		/**< The total number of DSP blocks available on this target */
		int	    nrConfigs_;		/**< The number of distinct predefinded multiplier widths */
		int 	multiplierWidth_[3];	/**< The multiplier width available */
		double 	multiplierDelay_[3];	/**< The corresponding delay for each multiplier width available */
		
		double RAMDelay_;
		double RAMToLogicWireDelay_;
		
	};


}
#endif
