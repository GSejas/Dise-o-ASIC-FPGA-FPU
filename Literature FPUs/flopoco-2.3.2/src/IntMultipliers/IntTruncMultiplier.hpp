#ifndef IntTruncMultiplier_HPP
#define IntTruncMultiplier_HPP
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
	 * The SoftDSP class.
	 * Its main purpose is to store the coordinates of non hardware multipliers
	 * on in a tiling configuration. Such a configuration is composed of two
	 * lists. One one hand list of DSP objects (hardware DSP) store the 
	 * corresponding locations and possible associations of target DSP blocks.
	 * On the other hand the list of SoftDSP s will store all the informations
	 * about the soft (logic implemented) multiplier tiles.  
	 */
	class SoftDSP{
	public:

		/** Constructor 
		 * Takes as arguments the coordinates of the top right and bottom left
		 * corners of the rectangular softcore multiplier tile
		 */
		SoftDSP(int topX, int topY, int bottomX, int bottomY):
			topX(topX), topY(topY), bottomX(bottomX), bottomY(bottomY){
			/*constructor*/
			
		}	
		/**
		 * Destructor. Empty for now
		 */ 
		~SoftDSP(){}
		
		/** Fetches the coordinates of the top right corner
		 * @param[in/out] xT the top coordinate in X dimension 
		 * @param[in/out] yT the top coordinate in Y dimension 
		 */
		void getTopRightCorner(int &xT, int &yT){
			xT = topX;
			yT = topY;
		}
		
		/** Fetches the coordinates of the bottom right corner
		 * @param[in/out] xB the top coordinate in X dimension 
		 * @param[in/out] yB the top coordinate in Y dimension 
		 */
		void getBottomLeftCorner(int &xB, int &yB){
			xB = bottomX;
			yB = bottomY;
		}

		/** Fetches ALL coordinates of the soft DSP 
		 * @param[in/out] xT the top coordinate in X dimension 
		 * @param[in/out] yT the top coordinate in Y dimension 
		 * @param[in/out] xB the top coordinate in X dimension 
		 * @param[in/out] yB the top coordinate in Y dimension 
		 */
		void getCoordinates(int &xT, int &yT, int &xB, int &yB){
			xT = topX;
			yT = topY;
			xB = bottomX;
			yB = bottomY;
		} 

		/** allows updating the coordinates of  the top right corner 
		 * @param[in/out] xT the top coordinate in X dimension 
		 * @param[in/out] yT the top coordinate in Y dimension 
		 */
		void setTopRightCorner(int xT, int yT){
			topX = xT;
			topY = yT;
		}

		/** allows updating the coordinates of  the top right corner 
		 * @param[in/out] xB the top coordinate in X dimension 
		 * @param[in/out] yB the top coordinate in Y dimension 
		 */
		void setBottomLeftCorner(int xB, int yB){
			bottomX = xB;
			bottomY = yB;
		}

		/** trims the tile coordinates to a certain board size. That is,
		 * if the board to be tiled has a dimension of 20 x 20 and the bottom
		 * left corner exceeds the board limits, this corner will be trimmed 
		 * to the board dimensions 
		 * @param[in] wX the X dimension of the board to trim to 
		 * @param[in] wY the Y dimension of the board to trim to 
		 */
		void trim(int wX, int wY){
			if (bottomX > wX)
				bottomX = wX;
			if (bottomY > wY)
				bottomY = wY;
		}
		
	protected:
		int topX, topY, bottomX, bottomY; /**< the coordinates of the tile (top right and bottom left corners */
	};



	/** 
	 * The Truncated Multiplier class.
	 * For experimenting with truncated multipliers. 
	 * TODO Not Yet Fully Documented
	 */
	class IntTruncMultiplier : public Operator
	{
	public:
		
		int wInX;             /**<The width of first input*/
		int wInY;             /**<The width of second input*/
		int wOut;             /**<The width of output */
	
		
		IntTruncMultiplier(Target* target, int winX, int winY, int wOut, float ratio,int uL, int maxTimeInMinutes, bool interactive = false, bool sign = false, bool roundCompensate = true);
	
		/** IntTruncMultiplier destructor */
		~IntTruncMultiplier();

		void outputVHDL(std::ostream& o, std::string name);

		/** Computes the max value of a w x h bit multiplication 
		 * @param[in] w the size of the first operand
		 * @param[in] h the size of the second operand
		 * @return (2^w-1)(2^h-1)
		 */ 
		mpfr_t* evalMaxValue(int w, int h);
		
		
		/** Evaluates the Approximation error introduced by truncating 
		 * the multiplication. 
		 * @param[in] configuration The list of hard DSPs used in the multiplication
		 *            and their positioning on the board
		 * @param[in] softDSPs The list of soft multipliers (logic implemented) 
		 *            with their corresponding positioning 
		 * @return the approximation error
		 */ 
		mpfr_t* evalTruncTilingErrorInverted(DSP** configuration, vector<SoftDSP*> softDSPs);

		
		/** Emulate the circuit using MPFR */
		void emulate(TestCase * tc);
	
	protected:

		// TODO FIXME Aren't these redundant with wInX, wInY? 
		int wX;      /**< the width (in bits) of the input  X  */
		int wY;      /**< the width (in bits) of the input  Y  */

		float ratio; /**<the ratio between slice and dsp */
		int targetPrecision;
		int useLimits;
		mpfr_t errorSum;
		mpfr_t targetError;
		bool roundCompensate_;
		
		/* RIP */
		void printConfiguration(DSP** configuration, vector<SoftDSP*> softDSPs);
		
		void warningInfo(){
			cout << "********************************************************************************"<<endl;
			cout << "*      The generation of this operator makes extensive use of the stack !      *"<<endl;
			cout << "*      If operator generation is not successful, increase stack limit          *"<<endl;
			cout << "*                    ulimit -s 5120000000                                      *"<<endl;
			cout << "********************************************************************************"<<endl;
		}
		
	private:
		/**
		 * Verifies if the coordinates are inside the area of interest.
		 * @param x coordinate
		 * @param y coordinate
		 * @return TRUE if position is in area of interest, FALSE otherwise
		 */
		bool isValidPosition(int x, int y);
		
		/**
		 * Validates the tiling configuration in terms of error produced
		 * @param configuration the DSP multiplier configuration
		 * @param softDSPs the IntMultiplier configuration
		 * @param k the target precision
		 * @return TRUE if tiling is valid, FALSE otherwise
		 */
		//bool isTilingValid(DSP** configuration, SoftDSP** softDSPs, int k);
		bool isTilingValid(DSP** configuration, vector<SoftDSP*> softDSPs, int k);
		/**
		 * Verifies that the indicated DSP block does not overlap with any 
		 * other block in the given configuration.
		 * @param config the tiling configuration containing DSP objects
		 * @param index the index of the DSP object we want to check is not overlapping in the configuration
		 * @return TRUE if no DSP blocks overlap on the tiling configuration
		 */
		bool checkOverlap(DSP** config, int index);
	
		/**
		 * Displaces the DSP block in the 'next' valid configuration, i.e.
		 * The DSP block in the configuration, indicated by the index parameter
		 * is moved in downward and to the left.
		 * @param config the tiling configuration containing DSP objects
		 * @param index the index of the DSP object we want to move within the configuration
		 * @return FALSE if we have reached the bottom-left most corner of the tiling
		 */
		bool move(DSP** config, int index);
	
		/**
		 * Repositions the indicated DSP object within the configuration in the 
		 * top-right most position possible.
		 * @param config the tiling configuration containing DSP objects
		 * @param index the index of the DSP object we want to move within the configuration
		 */
		bool replace(DSP** config, int index);
	
		/**
		 * Initializes the tiling grid with the DSP-s being positioned in the right-most
		 * and top-most position possible without any overlapping of the DSP blocks
		 * @param config the tiling configuration containing DSP objects
		 * @param dspCount the number of DSP blocks in the configuration
		 */
		void initTiling(DSP** &config, int dspCount);
		void initTiling2(DSP** &config, int dspCount);
		/**
		 * This function returns the amount of extra displacemnet on the tiling board that a dsp block can have on vertical axis
		 * @return extra height
		 */
		int getExtraHeight();

		/**
		 * This function returns the amount of extra displacemnet on the tiling board that a dsp block can have on horizonta axis
		 * @return extra width
		 */
		int getExtraWidth();
	
		/**
		 * This function tries to bind together as many multiplier blocks as possible into the same DSP block of the StratixII 
		 * architecture which has up to 3 adders
		 * @param the configuration of the tiling grid
		 * @return the number of operands for the final adder, which has been reduced from individual DSP count to sums of DSPs
		 */
		int bindDSPs4Stratix(DSP** config);

		/**
		 * This function generates the vhdl code for multiplications using DSP blocks, guided by the settings of the DSP objects.
		 * @param the configuration of the tiling grid
		 * @return the number of addition operands that contain DSP block multiplications
		 */
		int multiplicationInDSPs(DSP** config);
	 
		/**
		 * This function generates the vhdl code for multiplication using only Slices.
		 * @param the configuration of the tiling grid
		 * @return number of IntMultipliers
		 */
		int multiplicationInSlices(vector<SoftDSP*> config);
		
		/**
		 * Generates VHDL code for the given configuration
		 * @param config hard DSP configuration
		 * @param softConfig soft DSP configuration
		 */
		void generateVHDLCode(DSP** config, vector<SoftDSP*> softConfig);
		
		/**
		 * This function approximates the number of discarded columns given a target error
		 * @param k target precision
		 * @return the number of discarded columns
		 */
		int estimateNrOfDiscardedCols(int k);
		
		
		
		int truncationOffset; /** The truncation offset for the multiplication that are not completed. 0 value means that we perform a normal multiplication*/
		DSP** globalConfig;   /**<The working configuration of the tiling algorithm on DSPs */
		float bestCost;       /**<The best cost obtained so far*/
		DSP** bestConfig;     /**<The best configuration of the after tiling DSPs */
		float costDSP,costLUT;/**<This will be used for computing the cost for each configuration */
		int vnme,vmme;        /**<Size of board minus extra bits*/
		int **mat;            /**<Used for partitioning the grid in smaller multiplications */
		DSP** tempc;          /**<Used for creating a temporary storage of the current configuration in order to create binds between different DSPs */
		bool* rot;            /**<The vector which will mark if a dsp in the tiling algorithm was or not rotated */
		int nrDSPs;           /**<The number of estimated DSPs that will be used according to this parameter */
		int nrSoftDSPs;       /**<The number of Soft DSPs in the current configuration */
		

		/**FIXME TO BE KILLED TRUE if we are generating a squarer, FALSE if it is a simple multiplication */
		bool isSquarer;
		
		int vn;               /**<The width of the virtual board */
		int vm;               /**<The height of the virtual board */

		int maxDist2Move; 		/**< The maximum allow distance to move away from the others for the last block */

 	
		/** The matrix will be used to represent the truncated multiplication */
		int **truncatedMultiplication;
		/** will be used to mark each partition for the truncated multiplications*/
		int counterPartitionsTruncated;
		
		/** This function estimates the maximum number of DSPs that can be used with respect to the preference of the user */
		int estimateDSPs();

		int estimateDSPsv2(){
			/* get the are of the board to be tilled */
			float boardArea; 
			boardArea = (float(truncationOffset*truncationOffset)/2) + (wX-truncationOffset)*wY + (wY-truncationOffset)*wX - (wX-truncationOffset)*(wY-truncationOffset);
			/* get the tile area */
			int dx, dy;
			target_->getDSPWidths(dx,dy);
			float tileArea = dx*dy;
			/* compute how many tiles it would take to fill the tiling (approximate) */
			float maxDSPs = ceil(boardArea/tileArea);
//			maxDSPs = maxDSPs + 2.0/maxDSPs; //FIXME
//			maxDSPs = ceil(maxDSPs);
			/* penalty factor due to the non paralel cut of the board. to be improved FIXME */
//			maxDSPs = 1.0*maxDSPs;
			/* take into account the user preference, that is the ratio */
			float realDSPs = ceil ( maxDSPs * ratio );
			
			return int(realDSPs);			
		}


		/** This function computes the cost of the configuration received as input parameter */
	
		float computeCost(DSP** &config);

		/** This function compares the cost of the current configuration( globalConfig) with the best configuration obtained so far(bestConfig). If the current one is better then the best one, 
			 then it will copy the current configuration into the best one.
		*/
		void compareCost();
	
		/** This function is the backtracking function for finding the best configuration with respect to the user preference
		 */
		void tilingAlgorithm(int i, int n, bool repl,int lastMovedDSP);
		
		/**The function will fill the matrix with softdsp until the error is ensured*/
		vector<SoftDSP*> insertSoftDSPs(DSP** config);
	
		/**The function will fill the matrix with softdsp until the error is ensured but limiting the size of a soft dsp to the size of a dsp*/
		vector<SoftDSP*> insertSoftDSPswithLimits(DSP** config);
		
	
		/** This function will take a configuration and will try to maximize the multiplications that are realized in slices 
		 * It will return the number of slices that are required to ferform those multiplications, and through the parameter partitions it will return the number of such partitions
		 */
		int partitionOfGridSlices(DSP** config,int &partitions);
	 
		/** This function will fill the input matrix between the limits received as parameters with the value received as parameter */
	 
		void fillMatrix(int **&matrix,int lw,int lh,int topleftX,int topleftY,int botomrightX,int botomrightY,int value);
	
		//~ /** This function resets all the conections that exists between DSPs of a configuration */
	
		//~ void resetConnections(DSP** &config);
	
		/** This function will create connections between the existing DSPs in the configuration according to the policies of Altera or Virtex */
	
		int bindDSPs(DSP** &config);
	
		/** This function will create the shifts between DSPs for Virtex boards */
	
		int bindDSPs4Virtex(DSP** &config);
	
		/** This function will sort the DSPs blocks by the topright corner */
	
		void sortDSPs(DSP** &config);

		void sortDSPs2(DSP** &config);

	
		/** This is a temporary function used only for displaing a configuration. It has no relevance to the algorithm. */
	
		void display(DSP** config);
	
		/** Same as the above function except it also prints SoftDSPs */
		void displayAll(DSP** config, vector<SoftDSP*> softConfig);
		
		/** This function will be used to run the algorithm. the result of the algorithm (i..e. the best configuration) will be located in the member variable bestConfig */
	
		void runAlgorithm();
	
		/** This function is used in order to compare how much from the multiplication is occupied by the DSPs. It is used to compare the input parameter with the global maximum. 
			 It is used in the cases when the computed cost of the configuration is equal with the current maximum. This is neccessary because the Multiplication in LUT function reports same cost for
			 slightly different arguments in some cases.
		*/
	
		bool compareOccupation(DSP** config);
	
		/** This function is used in order to verify if the last DSP is not to far from the rest of the DSPs. This function should be called after we are sure that the last DSP is not in right of any others DSPs
			 @return 0 - for OK ; 1 - for to far left from all -> finnish ; 2 - is not above then any so move it left with 1 ; 3 continue to move normaly the block
		*/
	
		int checkFarness(DSP** config,int index);
		
		/**
		 * @param tx top-right x coordinate
		 * @param ty top-right y coordinate
		 * @param bx bottom-left x coordinate
		 * @param by bottom-left y coordinate
		 */
		void convertCoordinates(int &tx, int &ty, int &bx, int &by);

		void convertCoordinatesKeepNeg(int &tx, int &ty, int &bx, int &by);

		void convertCoordinatesInvertedBoard(int &tx, int &ty, int &bx, int &by);

		
		/** This functions splits large DSP super-blocks or paris of blocks into unit DSP blocks found on the target
		 * @param config - the configuration to be split
		 * @param numberOfDSPs - in-out parameter that holds the inital and final number of DSP blocks
		 * @return the split configuration
		 */
		DSP** splitLargeBlocks(DSP** config, int &numberOfDSPs);
		
		/** Variable which is used only through testing to count the steps of the first DSP */
		int counterfirst;
		int numberDSP4Overlap;
		//to be set in the InitTiling() with the appropriate value
		int nrOfShifts4Virtex;
		//int *countsShift;
		int dsplimit;
		int maxTimeInMinutes;
		clock_t start;
		clock_t finish;
		int subCount;
		int dspWidth,dspHeight;
		int minShift;
		
		bool sign;
		
		bool testFit;
	};

}
#endif
