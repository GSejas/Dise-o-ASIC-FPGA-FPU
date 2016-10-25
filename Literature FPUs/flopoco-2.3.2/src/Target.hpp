/*
  The abstract class that models different chips for delay and area. 
  Classes for real chips inherit from this one. They should be in subdirectory Targets
 
  Authors:   Bogdan Pasca, Florent de Dinechin

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  

  All Rights Reserved
*/


//TODO a logicTableDelay() that would replace the delay computation in Table.cpp (start from there)


#ifndef TARGET_HPP
#define TARGET_HPP

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "Targets/DSP.hpp"
#include <string>

using namespace std;

namespace flopoco{


	/** Abstract target Class. All classes which model real chips inherit from this class */
	class Target
	{
	public:
		/** The default constructor. Creates a pipelined target, with 4 inputs/LUT, 
		 * with a desired frequency of 400MHz and which is allowed to use hardware multipliers
		 */ 
		Target()   {
			pipeline_          = true;
			lutInputs_         = 4;
			frequency_         = 400000000.;
			useHardMultipliers_= true;
			id_                = "generic";
		}
	
		/** The destructor */
		virtual ~Target() {}

		/** Returns ID of instantiated target. This ID is represented by the name
		 * @return the ID
		 */
		string getID();

		/** Returns ID of the vendor, currently "Altera" or "Xilinx". 
		 * @return the ID
		 */
		string getVendor(){
			return vendor_;
		}

		// Architecture-related methods
		/** Returns the number of inputs that the LUTs have on the specific device
		 * @return the number of inputs for the look-up tables (LUTs) of the device
		 */
		int lutInputs();
	
		/** Function for determining the submultiplication sizes so that the design is able 
		 * to function at a desired frequency ( multiplicatio is considerd X * Y )
		 * @param[in,out] x the size of the submultiplication for x
		 * @param[in,out] y the size of the submultiplication for y
		 * @param[in] wInX the width of X
		 * @param[in] wInY the width of Y
		 */
		virtual bool suggestSubmultSize(int &x, int &y, int wInX, int wInY)=0;

		/** Function for determining the subadition sizes so that the design is able 
		 * to function at a desired frequency ( addition is considerd X + Y )
		 * @param[in,out] x the size of the subaddition for x and y
		 * @param[in] wIn the widths of X and Y
		 */
		virtual bool suggestSubaddSize(int &x, int wIn)=0; 	

		/** Function for determining the subadition sizes so that the design is able 
		 * to function at a desired frequency ( addition is considerd X + Y )
		 * @param[in,out] x the size of the subaddition for x and y
		 * @param[in] wIn the widths of X and Y
		 * @param[in] slack the time delay consumed out of the input period 
		 */
		virtual bool   suggestSlackSubaddSize(int &x, int wIn, double slack)=0;

		/** Function for determining the subcomparator sizes so that the design is able 
		* to function at a desired frequency 
		* @param[in,out] x the size of the subaddition for x and y
		* @param[in] wIn the widths of x and y
		* @param[in] slack the time delay consumed out of the input period 
		* @param[in] constant if the comparisson is done against a constant or Y
		*/
		virtual bool suggestSlackSubcomparatorSize(int &x, int wIn, double slack, bool constant)=0;
		
		
		/* -------------------- Delay-related methods ------------------------*/

		/* -------------------  logic related  -------------------------------*/
		
		/** Function which returns the lutDelay for this target
		 * @return the LUT delay
		 */
		virtual double lutDelay() =0;
	
		/** Function which returns the flip-flop Delay for this target
			 (not including any net delay)
			 * @return the flip-flop delay
			 */
		virtual double ffDelay() =0;
	
		/** Function which returns the carry propagate delay
		 * @return the carry propagate dealy
		 */
		virtual double carryPropagateDelay() =0;

		/** Function which returns addition delay for an n bit addition
		 * @param n the number of bits of the addition (n-bit + n-bit )
		 * @return the addition delay for an n bit addition
		 */
		virtual double adderDelay(int n) =0;

		/** Function which returns the delay for an n bit equality comparison 
		* @param n the number of bits of the comparisson
		* @return the delay of the comparisson between two vectors
		*/
		virtual double eqComparatorDelay(int n) =0;

		/** Function which returns the delay for an n bit equality comparison with a 
		* constant
		* @param n the number of bits of the comparisson
		* @return the delay of the comparisson between a vector and a constant
		*/
		virtual double eqConstComparatorDelay(int n) =0;
		
		
		/** Function which returns the distant wire delay.
		 * @return distant wire delay 
		 */
		virtual double distantWireDelay(int n) =0;

		/** Function which returns the local wire delay (local routing)
		 * @return local wire delay 
		 */
		virtual double localWireDelay(int fanout = 1) =0;

		/* --------------------  DSP related  --------------------------------*/

		/** Function which returns the delay of the multiplier of the DSP block
		 * @return delay of the DSP multiplier
		 */
		virtual double DSPMultiplierDelay() =0;

		/** Function which returns the delay of the adder of the DSP block
		 * @return delay of the DSP adder
		 */
		virtual double DSPAdderDelay()=0;
		
		/** Function which returns the delay of the wiring between neighboring 
		 * DSPs
		 * @return delay of the interconnect between DSPs
		 */
		virtual double DSPCascadingWireDelay()=0;

		/** Function which returns the delay of the wiring between  
		 * DSPs output and logic (slices)
		 * @return delay DSP -> slice
		 */
		virtual double DSPToLogicWireDelay()=0;

		/** Function which returns the delay of the wiring between 
		 * slices and DSPs input
		 * @return delay slice -> DSP
		 */
		virtual double LogicToDSPWireDelay()=0;

		/* -------------------  BRAM related  --------------------------------*/

		/** Function which returns the delay between
		 * RAMs and slices
		 * @return delay RAMout to slice
		 */
		virtual double RAMToLogicWireDelay()=0;

		/** Function which returns the delay between
		 * slices and RAM input
		 * @return delay slice to RAMin
		 */
		virtual double LogicToRAMWireDelay()=0;

		/** Function which returns the delay of the RAM
		 * @return delay RAM
		 */
		virtual double RAMDelay()=0;


		/** Function which returns the size of a primitive memory block,which could be recognized by the synthesizer as a dual block.
		 * @return the size of the primitive memory block
		 */	
		virtual long sizeOfMemoryBlock() = 0 ;

	
		/** Function which returns the Equivalence between slices and a DSP.
		 * @return X ,  where X * Slices = 1 DSP
		 */
		virtual int getEquivalenceSliceDSP() = 0;
	
		/** Function which returns the number of DSPs that exist in FPGA
		 * @return number of DSPs
		 */
	
		virtual int getNumberOfDSPs() = 0;
	
		/** Function which returns the maximum widths of the operands of a DSP
		 * @return widths
		 */
		virtual void getDSPWidths(int &x, int &y, bool sign = false) = 0;
	
		virtual void getAdderParameters(double &k1, double &k2, int size) = 0;

		// Methods related to target behaviour and performance
		/** Sets the target to pipelined */
		void setPipelined();                
	
		/**< Sets the target to combinatorial */    
		void setNotPipelined();                 
	
		/** Returns true if the target is pipelined, otherwise false
		 * @return if the target is pipelined
		 */
		bool isPipelined();
	
		/** Returns the desired frequency for this target in Hz
		 * @return the frequency
		 */
		double frequency();

		/** Returns the desired frequency for this target in MHz
		 * @return the frequency
		 */
		double frequencyMHz();


		/** Returns the target frequency, normalized between 0 and 1 in a target-independent way.
			 1 means maximum practical frequency (400MHz on Virtex4, 500MHz on Virtex-5, etc)
			 This method is intended to make it easier to write target-independent frequency-directed operators
		 */
		double normalizedFrequency();

	
		/** Sets the desired frequency for this target
		 * @param f the desired frequency
		 */	
		void setFrequency(double f);

		/** Sets the use of hardware multipliers 
		 * @param v use or not harware multipliers
		 */
		void setUseHardMultipliers(bool v);

		/** Returns true if the operator for this target is allowed to use hardware multipliers
		 * @return the status of hardware multipliers usage
		 */
		bool getUseHardMultipliers(); 

		/** Function which returns the number of LUTs needed to implement
		 *	 a multiplier of the given width
		 * @param	wInX the width (in bits) of the first operand
		 * @param	wInY the width (in bits) of the second operand
		 */
		virtual int getIntMultiplierCost(int wInX, int wInY) =0;
	
	
		/** Function which return the number of Slices needed to implement
		 * an adder that has 2 or more operands.
		 * @param wIn the width (in bits) of the adder operands
		 * @param n the number of operands
		 * @return the cost of the adder in Slices/ALMs
		 */
		virtual int getIntNAdderCost(int wIn, int n) =0;
	
		/** Constructs a specific DSP to each target */
		virtual DSP* createDSP() = 0;
	
		//todo
		

	protected:
		string id_;
		string vendor_;
		int    lutInputs_;          /**< The number of inputs for the LUTs */
		bool   pipeline_;           /**< True if the target is pipelined/ false otherwise */
		double frequency_;          /**< The desired frequency for the operator in Hz */
		int    multXInputs_;        /**< The size for the X dimmension of the hardware multipliers */
		int    multYInputs_;        /**< The size for the Y dimmension of the hardware multipliers */
		bool   useHardMultipliers_; /**< If true the operator design can use the hardware multipliers */
		long   sizeOfBlock_;		/**< The size of a primitive memory block */
		double maxFrequencyMHz_ ;/**< The maximum practical frequency attainable on this target. An indicator of relative performance of FPGAs. 400 is for Virtex4 */
	
	};

}
#endif
