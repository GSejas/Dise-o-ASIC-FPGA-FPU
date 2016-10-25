#ifndef IntTillingMult_HPP
#define IntTillingMult_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <time.h>

#include "../Operator.hpp"
#include "../IntMultiAdder.hpp"
#include "IntTruncMultiplier.hpp" // for softDSPs etc
#include "LogicIntMultiplier.hpp"


namespace flopoco{
	/** The InttilingMult class */
	class IntTilingMult : public Operator
	{
	public:
		/**
		 * The FPAdder constructor
		 * @param[in]		target		the target device
		 * @param[in]		MSB			the MSB of the input number
		 * @param[in]		LSB			the LSB of the input number
		 * @param[in]		wER			the with of the exponent for the convertion result
		 * @param[in]		wFR			the with of the fraction for the convertion result
		 */
		IntTilingMult(Target* target, int wInX, int wInY,float ratio, int maxTimeInMinutes, bool interactive = true, map<string, double> inputDelays = emptyDelayMap);
	
		

		/**
		 * IntTilingMult destructor
		 */
		~IntTilingMult();


		void emulate(TestCase * tc);
		void buildStandardTestCases(TestCaseList* tcl);
		
		void warningInfo(){
			REPORT(DEBUG, "********************************************************************************");
			REPORT(DEBUG, "*      The generation of this operator makes extensive use of the stack !      *");
			REPORT(DEBUG, "*      If operator generation is not successful, increase stack limit          *");
			REPORT(DEBUG, "*                    ulimit -s 5120000000                                      *");
			REPORT(DEBUG, "********************************************************************************");
		}

	private:

		/**
		 * This function prints the VHDL code the entire VHDL code of the operator.
		 * It calls the multiplicationInDSPs() function with the best found configuration 
		 * in order to print the VHDL code for the DSP multiplications. Then, it 
		 * partitions the untiled board with the partitionMultiplicationInSlices() 
		 * function in order to obtain a list of soft-core multipliers. Next, 
		 * it calles multiplicationInSlices() on this soft-core multiplier list 
		 * in order to print their associated VHDL code. 
		 * Finally, it prints uses a multi-operand adder to add all these operands.
		 */
		void generateVHDLCodeForCompleteTilling();

		/**
		 * This function prints the VHDL code for multiplications using DSP blocks, 
		 * guided by the settings of the DSP objects.
		 * @param config         the configuration of the tiling 
		 * @return               the number of addition operands for this tiling.
		 *                       This number may be different from the number of tiles 
		 *                       as some additions may be performed inside the DSPs
		 */
		int multiplicationInDSPs(vector<DSP*> config);

		/**
		 * This function prints the VHDL cord for the soft-core multipliers in 
		 * the VHDL stream.
		 * @param softMultipliers   the list of soft-core multipliers
		 */
		void multiplicationInSlices(vector<SoftDSP*> &softMultipliers);
		
		/**
		 * This function receives for its first paramter the DSP tiling
		 * and populates the second argument with the soft-multiplier tiling  
		 * @param config            the configuration of the tiling grid
		 * @param softMultipliers   the list of soft-core multipliers populated by this function
		 * @return the number of soft-core multipliers in the board boundaries 
		 */
		int partitionMultiplicationInSlices(vector<DSP*> config, vector<SoftDSP*> &softMultipliers);
	
		


		/* DESIGN SPACE EXPORATION --------------------------------------------*/
		
		/**
		 * Initializes the tiling grid with the DSP-s being positioned in the right-most
		 * and top-most position possible without any overlapping of the DSP blocks
		 * @param config     the tiling configuration containing DSP objects
		 * @param dspCount   the number of DSP blocks in the configuration
		 */
		void initTiling(vector<DSP*> &config, int dspCount);
		
		/**
		 * Repositions the indicated DSP object within the configuration in the 
		 * top-right most position possible.
		 * @param[in] config      the tiling configuration containing DSP objects
		 * @param[in] index       the index of the DSP object we want to move within the configuration
		 * @return                  
		 */
		bool replace(vector<DSP*> config, int index);

		/**
		 * Verifies that the indicated DSP block does not overlap with any 
		 * other block in the given configuration.
		 * @param config the tiling configuration containing DSP objects
		 * @param index the index of the DSP object we want to check is not overlapping in the configuration
		 * @return TRUE if no DSP blocks overlap on the tiling configuration
		 */
		bool checkOverlap(vector<DSP*> config, int index);		

		/**
		 * Displaces the DSP block in the 'next' valid configuration, i.e.
		 * The DSP block in the configuration, indicated by the index parameter
		 * is moved in downward and to the left.
		 * @param config the tiling configuration containing DSP objects
		 * @param index the index of the DSP object we want to move within the configuration
		 * @return FALSE if we have reached the bottom-left most corner of the tiling
		 */
		bool move(vector<DSP*> config, int index);

		/** This function computes the cost of the configuration received as 
		  * input parameter 
		  * @param[inout] config       the DSP tiling configuration
		  * @return                    the cost of the configuration  
		  */
		float computeCost(vector<DSP*> &config);

		/** This function computes the cost of the configuration received as 
		  * input parameter 
		  * @param[inout] config       the DSP tiling configuration
		  * @param[in]    nrDSPs       the number of DSPs in this configuration
		  * @return                    the cost of the configuration  
		  */
		void updateBestConfig(vector<DSP*> &bestConfig, vector<DSP*> running);


		/**
		 * Given a tiling, this function checks how many of the DSPs are 
		 * severely underutilized and suggests a value for the ratio that 
		 * will instantiate soft-multipliers to replace these blocks.
		 * @param configuration the tiling configuration containing DSP objects
		 * @return the new value for the ratio
		 */
		float suggestRatio(vector<DSP*> configuration);
		
		

	

	

	

		/**
		 * This function returns the amount of extra displacemnet on the tiling board that a dsp block can have on vertical axis
		 * @return extra height
		 */
		int getExtraHeight();

		/**
		 * This function returns the amount of extra displacemnet on the tiling
		 * board that a dsp block can have on horizonta axis
		 * @return extra width
		 */
		int getExtraWidth();
	
		/**
		 * This function tries to bind together as many multiplier blocks as
		 * possible into the same DSP block of the StratixII * architecture which has up to
		 * 3 adders
		 * @param the configuration of the tiling grid
		 * @return the number of operands for the final adder, which has been reduced from individual DSP count to sums of DSPs
		 */
		int bindDSPs4Stratix(vector<DSP*> config);


	 
	 	/**
		 * @param tx top-right x coordinate
		 * @param ty top-right y coordinate
		 * @param bx bottom-left x coordinate
		 * @param by bottom-left y coordinate
		 */
		void convertCoordinates(int &tx, int &ty, int &bx, int &by);

		void convertCoordinatesKeepNeg(int &tx, int &ty, int &bx, int &by);
	 



	 
		/** The width of first input*/
		int wInX; 
		/** The width of second input*/
		int wInY; 
		/** The width of output */
		int wOut;
		/** The ratio between the number of DSPs and slices */
		float ratio;
		/** The truncation offset for the multiplication that are not completed. 0 value means that we perform a normal multiplication*/
		int truncationOffset;
		/** The working configuration of the tiling algorithm on DSPs */
		vector<DSP*> globalConfig;

		/** The working configuration of the tiling algorithm on DSPs */
		vector<DSP*> workingConfig;

		/** The best cost obtained so far*/
		float bestCost;
		/** The best configuration of the after tiling DSPs */
		vector<DSP*> bestConfig;
		/** The target */
//		Target * target; //FIXME Killed by Bogdan. Operator Class contains a pointer to this target, so a second one is useless 
		/** This will be used for computing the cost for each configuration */
		float costDSP,costLUT;
	
		/**Size of board minus extra bits*/
		int extendedBoardWidthme,extendedBoardHeightme;
		
		/** Used for partitioning the grid in smaller multiplications */
		int **mat;
	
		/** The vector which will mark if a dsp in the tiling algorithm was or not rotated */
		bool* rot;

		/** The number of estimated DSPs that will be used according to this parameter */
		int nrDSPs;
		
		/** TRUE if we are generating a squarer, FALSE if it is a simple multiplication */
		bool isSquarer;
		/** The width of the virtual board */
		int extendedBoardWidth;
		/** The height of the virtual board */
		int extendedBoardHeight;
		/** The maximum allow distance to move away from the others for the last block */
		int maxDist2Move;
	
		/** This function estimates the maximum number of DSPs that can be used
		with respect to the preference of the user */
		int estimateDSPs();

//		float computeCostBinding(vector<DSP*> &config);

		/** This function compares the cost of the current configuration( globalConfig) with the best configuration obtained so far(bestConfig). If the current one is better then the best one, 
			 then it will copy the current configuration into the best one.
		*/
	
		/** This function is the backtracking function for finding the best configuration with respect to the user preference
		 */
		void tilingAlgorithm(int i, int n, bool repl,int lastMovedDSP);
	
		/** This function will take a configuration and will try to maximize the multiplications that are realized in slices 
		 * It will return the number of slices that are required to ferform those multiplications, and through the parameter partitions it will return the number of such partitions
		 */
		int partitionOfGridSlices(vector<DSP*> config,int &partitions);
	 
		/** This function will fill the input matrix between the limits received as parameters with the value received as parameter */
	 
		void fillMatrix(int **&matrix,int lw,int lh,int topleftX,int topleftY,int botomrightX,int botomrightY,int value);
	
		//~ /** This function resets all the conections that exists between DSPs of a configuration */
	
		//~ void resetConnections(vector<DSP*> &config);
	
		/** This function will create connections between the existing DSPs in the configuration according to the policies of Altera or Virtex */
	
		int bindDSPs(vector<DSP*> &config);
	
		/** This function will create the shifts between DSPs for Virtex boards */
	
		int bindDSPs4Virtex(vector<DSP*> &config);
	
		/** This function will sort the DSPs blocks by the topright corner */
	
		void sortDSPs(vector<DSP*> &config);
	
		/** This is a temporary function used only for displaing a configuration. It has no relevance to the algorithm. */
	
		void display(vector<DSP*> config, vector<SoftDSP*> &softMultipliers);
	
		/** This function will be used to run the algorithm. the result of the algorithm (i..e. the best configuration) will be located in the member variable bestConfig */
	
		void runAlgorithm();
	
		/** This function is used in order to compare how much from the multiplication is occupied by the DSPs. It is used to compare the input parameter with the global maximum. 
			 It is used in the cases when the computed cost of the configuration is equal with the current maximum. This is neccessary because the Multiplication in LUT function reports same cost for
			 slightly different arguments in some cases.
		*/
	
		bool compareOccupation(vector<DSP*> config);
	
		/** This function is used in order to verify if the last DSP is not to far from the rest of the DSPs. This function should be called after we are sure that the last DSP is not in right of any others DSPs
			 @return 0 - for OK ; 1 - for to far left from all -> finnish ; 2 - is not above then any so move it left with 1 ; 3 continue to move normaly the block
		*/
	
		int checkFarness(vector<DSP*> config,int index);
		
		
		/** This functions splits large DSP super-blocks or paris of blocks into unit DSP blocks found on the target
		 * @param config - the configuration to be split
		 * @param numberOfDSPs - in-out parameter that holds the inital and final number of DSP blocks
		 * @return the split configuration
		 */
		vector<DSP*> splitLargeBlocks(vector<DSP*> config, int &numberOfDSPs);
		
		
		void outputVHDL(std::ostream& o, std::string name);
		
		void printConfiguration(vector<DSP*> configuration, vector<SoftDSP*> softDSPs);

		/** Functions used for Simulated Annealing */
		vector<DSP*> neighbour(vector<DSP*> config);
		float temp(float f);
		float probability(float e, float enew, float t);
		void simulatedAnnealing();
		int numberDSP4Overlap;
		//to be set in the InitTiling() with the appropriate value
		int nrOfShifts4Virtex;
		//int *countsShift;
		int dsplimit;
		int maxTimeInMinutes;
		clock_t start;
		clock_t finish;
		
		int shiftedValDSPs; 
		
	private:
		vector<DSP*>     DSPConfig;         /**> stores the current configuration*/
		vector<SoftDSP*> softMultipliers;   /**> stores the current soft-multiplier configuration*/
	};
}
#endif

