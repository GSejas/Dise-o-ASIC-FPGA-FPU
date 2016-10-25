/*
  Tilling Multiplier for FloPoCo
 
  Authors:  Bogdan Pasca, Bogdan.Pasca@ens-lyon.org, 
            Sebastian Banescu, Radu Tudoran, 
 
  This file is part of the FloPoCo project
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

 */

#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <typeinfo>
#include <math.h>
#include <string.h>
#include <limits.h>

#include <gmp.h>


#include <gmpxx.h>
#include "../utils.hpp"
#include "../Operator.hpp"
#include "../IntMultiplier.hpp"
#include "IntTilingMult.hpp"

#include <cstdlib>
#include <iostream>
#include <iomanip>
#include <sstream>
#include <string>
#include <list>
#include <map>
#include <vector>
#include <math.h>
#include <locale>
#include <cfloat>

#include <stdio.h>
#include <mpfr.h>

using namespace std;

namespace flopoco{

	IntTilingMult:: IntTilingMult(Target* target, int wInX, int wInY, float ratio, int maxTimeInMinutes, bool interactive, map<string, double> inputDelays) :
		Operator(target), wInX(wInX), wInY(wInY), wOut(wInX + wInY),ratio(ratio), maxTimeInMinutes(maxTimeInMinutes-1){
 
		srcFileName="IntTilingMultiplier";

		ostringstream name;
		name <<"IntTilingMultiplier_"<<wInX<<"_"<<wInY<<"_uid"<<getNewUId();
		setName(name.str());

		setCopyrightString("Sebastian Banescu, Radu Tudoran, Bogdan Pasca 2009-2011");

		addInput ("X", wInX);
		addInput ("Y", wInY);
		addOutput("R", wOut); /* wOut = wInX + wInY */

		start = clock(); /* time management */
		REPORT(INFO, "Generating multiplier of size "<<wInX<<"x"<<wInY<<" using tiling technique ...");
		warningInfo();
	
		/* the board is extended horizontally and vertically. This is done
		in order to fit DSPs on the edges. */
		extendedBoardWidth  = wInX + 2*getExtraWidth(); 
		extendedBoardHeight = wInY + 2*getExtraHeight();
		
		/* one of the important optimizations consist in removing the extra
		stripes on the top and on the bottom */	
		extendedBoardWidthme = extendedBoardWidth - getExtraWidth();		
		extendedBoardHeightme = extendedBoardHeight - getExtraHeight();
		
		REPORT( DETAILED, "Input board size is width="<<wInX<<" height="<<wInY);
		REPORT( DETAILED, "Extra width:="<<getExtraWidth()<<" extra height:="<<getExtraHeight());
		REPORT( DETAILED, "Extended board width="<<extendedBoardWidthme<<" height="<<extendedBoardHeightme);

		/* detailed info about the abstracted DSP block */
		int x,y;
		target->getDSPWidths(x,y);
		REPORT( DETAILED, "DSP block: width= "<< x <<" height=" << y);

		/* get an estimated number of DSPs needed to tile the board with */
		nrDSPs = estimateDSPs();
		REPORT( INFO, "Estimated DSPs = " <<nrDSPs);

		/* the maximum number of DSPs that can be chained on Virtex devices.
		The number is related with the number of register levels inside the
		DSPs, but also to the latency of the resulting multiplier; a lower 
		value for nrOfShifts4Virtex will decrease overall latency but 
		have a larger area. */
		if ( ( target_->getID() == "Virtex4") || ( target_->getID() == "Spartan3"))  // then the target is A Xilinx FPGA 
			nrOfShifts4Virtex=16; //int(sqrt(nrDSPs));			
		else
			nrOfShifts4Virtex=32;
		
		/* each time a tile is placed maxDist2Move is the maximum distance
		it may be placed from the already placed blocks */
		float tempDist =	0;
		maxDist2Move = (int) ( sqrt(tempDist) );
		REPORT(DETAILED, "maxDist2Move = "<<maxDist2Move);
	
		costDSP = 1.0;
		REPORT(DETAILED, "Cost DSP is " << costDSP);

		costLUT = 1.0 / double(target_->getEquivalenceSliceDSP());
		REPORT(DETAILED, "Equivalent slices to implement one DSP=" << target_->getEquivalenceSliceDSP());
		REPORT(DETAILED, "Cost LUT is " << costLUT);
		
		if (interactive){
			cout << " DO you want to run the algorithm? (y/n)" << endl;
			string myc;
			cin >> myc;
			if ( myc.compare("y")!=0)
				exit(-1);
		}						

		runAlgorithm();
		generateVHDLCodeForCompleteTilling();
	}

	
	IntTilingMult::~IntTilingMult() {
	}

	void IntTilingMult::runAlgorithm(){
		int  nrDSPs = estimateDSPs(); /* an overestimation to start with */
		REPORT (DEBUG, "First try with " << nrDSPs << " DSPs");

		/* perform one valid tiling which will represent the first solution */
		initTiling      (globalConfig, nrDSPs);
		REPORT(DEBUG, "->>>>>>>>>>Finished initializing tiling");
		updateBestConfig( bestConfig, globalConfig);
		
		/* let the tiling algorithm find better solutions by moving the DSPs around the 
		tiling board */

		tilingAlgorithm (nrDSPs-1, nrDSPs-1, false, nrDSPs-1);
		softMultipliers.clear();
		partitionMultiplicationInSlices( bestConfig, softMultipliers);
		computeCost(bestConfig);
		printConfiguration(bestConfig, softMultipliers);

//		REPORT(DETAILED, "Best cost is "<<bestCost);
	}

	
	/** The movement of the DSP blocks with values belonging to their widths 
	and heights still needs to be done. Now it only runs with one type of move 
	on one of the directions, which is not ok for the cases when the DSPs 
	are not squares.
	 */
	void IntTilingMult::tilingAlgorithm(int i, int n, bool repl, int lastMovedDSP)
	{
		finish = (clock() - start)/(CLOCKS_PER_SEC*60);

		if (finish > maxTimeInMinutes){
			REPORT(DETAILED, "Tiling time is up! Stopping exploration");
			return;
		}
				
		if (i == n){
		/*if the current DSP is the last one of N*/
			if (repl == true){ 
				REPORT(DEBUG, "Trying to reposition DSP #"<<i<<" due to previous modifications in configuration");
				/* if previous DSPs were moved this one needs to recompute all positions */ 
				if(replace(globalConfig,i)){           /* repostioned the DSP */
					REPORT( DEBUG, "Succesfully repositioned DSP");
					/* if the final DSP was succesfully repositioned, then possibly update best configuration */
					updateBestConfig( bestConfig, globalConfig); 
					/* call the tiling algorithm to verify all the possible placements of the last DSP */
					tilingAlgorithm(i, n, false, lastMovedDSP);
				}else{ /* could not reposition the DSP in the bounds of the tiling board */
					REPORT( DEBUG, "Failed to reposition DSP; reseting its position and backtracking");
					/* if the block was rotated, reset it and go to the last DSP succesfully moved */
					if (globalConfig[i]->isRotated()){
						globalConfig[i]->resetRotation();
						globalConfig[i]->setRotated(false);
					}

					if (lastMovedDSP>=0){ 
						/* go and move to the next position the last DSP succesfully moved */
						tilingAlgorithm(lastMovedDSP, n, false, lastMovedDSP);
					}
				}
			}else{
				REPORT(DEBUG, "Trying to move DSP #"<<i); 
				/* the last DSP is being moved on the tiling board */
				if (move(globalConfig,i)){ 
					REPORT(DEBUG, "Succesfully moved DSP #"<<i); 
					/* if successfuly moved the last block */
					REPORT(DEBUG, "Trying to update the best configuration");
					updateBestConfig(bestConfig, globalConfig);
					tilingAlgorithm(i, n, repl, i);		//repl should be false
				}else{
					REPORT(DEBUG, "Could not move DSP #"<<i<< " so trying to rotate"); 
					/* if no valid possible possitionings are available, then try rotating */
					if ( globalConfig[i]->isRotated() == false && (globalConfig[i]->getMaxMultiplierWidth() != globalConfig[i]->getMaxMultiplierHeight() )){ 
						globalConfig[i]->rotate();
						globalConfig[i]->setRotated(true);
						/* try repositioning the rotated block */
						if (replace(globalConfig,i)){
							REPORT(DEBUG, "Succesfully repositioned rotated block");
							updateBestConfig(bestConfig, globalConfig);
							tilingAlgorithm(i, n, repl, i);		//repl should be false
						}else{
							REPORT(DEBUG, "Failed to reposition rotated block");
						 /* go to the previous block */
							if (i-1 >= 0){
								globalConfig[i]->resetRotation();
								globalConfig[i]->setRotated(false);
								tilingAlgorithm(i-1, n, false, lastMovedDSP);
							}
						}
					}else {
						/* the DSP was either rotated already or it has no worth rotating it (mult is symmetrical)*/
						REPORT(DEBUG, "DSP was already rotated, so backtracking");
						if(i-1 >= 0){
							if (globalConfig[i]->isRotated()){
								globalConfig[i]->resetRotation();
								globalConfig[i]->setRotated(false);
							}
							tilingAlgorithm(i-1, n, repl, lastMovedDSP);		//repl should be false
						}
					}
				}
			}
		} else { 
			/* we are not at the last DSP */
			if (repl == true){ 
				REPORT( DEBUG, "Trying to reposition DSP #"<<i<<" due configuration change");
				/* if the previuos DSPs were successfuly repositioned */
				if (replace(globalConfig,i)){ 
					REPORT( DEBUG, "Succesfully repositioned DSP");
					/* and now we reposition the current DSP */
					tilingAlgorithm(i+1, n, repl, i);
				}else{ 
					/* the current DSP could not be repositioned */
					/* go to the DSP block that was moved (not repostioned) the last time */
					REPORT( DEBUG, "Failed to reposition DSP; Moving to DSP #"<<lastMovedDSP);					
					if( lastMovedDSP>=0) {
						tilingAlgorithm(lastMovedDSP, n, false, lastMovedDSP);
					}
				}
			}else{ 
			/* the folling DSP could not be moved or repositioned */
				REPORT( DEBUG, "Trying to move DSP# "<<i);
				if(move(globalConfig,i)){ 
					REPORT( DEBUG, "Succesfuly moved DSP");
					/* the current DSP was successfuly moved*/
					tilingAlgorithm(i+1, n, true, i);
				}else{ 
				/* the current DSP was not moved successfuly */
					REPORT( DEBUG, "Failed to move DSP, trying to rotate");
					if( globalConfig[i]->isRotated()==false && (globalConfig[i]->getMaxMultiplierWidth() != globalConfig[i]->getMaxMultiplierHeight() )){
						/* if the DSP was not rotated and is not sqare then roteate it */
						globalConfig[i]->rotate();
						globalConfig[i]->setRotated(true);
						if(replace(globalConfig,i)){ // the current DSP was successfuly repositioned
							REPORT( DEBUG, "Succesfully repositioned rotated DSP");
							tilingAlgorithm(i+1, n, true, i);
						}else{
							REPORT( DEBUG, "Failed to reposition rotated DSP; resetting rotation and backtracking");
						/* the current DSP was not successfuly repositioned */
							if(i-1>=0){
								if (globalConfig[i]->isRotated()){
									globalConfig[i]->resetRotation();
									globalConfig[i]->setRotated(false);
								}	
								tilingAlgorithm(i-1,n,repl, i-1);
							}
						}
					}else{
						REPORT( DEBUG, "DSP was already rotated or is square; resetting possible rotation, backtracking"); 
						/* the DSP is either square or has been already rotated */
						if(i-1>=0){
							if (globalConfig[i]->isRotated()){
								globalConfig[i]->resetRotation();
								globalConfig[i]->setRotated(false);
							}	
							tilingAlgorithm(i-1,n,repl,i-1);		//repl should be false
						}
					}
				}
			}
		}
	}

	/* binds DSPs into supertiles */
	int IntTilingMult::bindDSPs(vector<DSP*> &config){
		return bindDSPs4Virtex(config);
	}

	int IntTilingMult::bindDSPs4Virtex(vector<DSP*> &config)
	{
		REPORT(DEBUG, "Binding DSPs");
		int nrOfUsedDSPs = nrDSPs;
		DSP* ref;         /* the first reference DSP; chaning will start with this one */
		sortDSPs(config); /* the DSPs are sorted in increasing distance order from the top-right tiling board corner */
			
		int itx,ity, ibx,iby, jtx,jty, count;
		
		for (int i=0; i< nrDSPs; i++){
			/* unbind any previous bindings */
			config[i]->setShiftIn(NULL);
			config[i]->setShiftOut(NULL);
		}
		
		for(int i=0; i< nrDSPs; i++){
			if ((config[i]!=NULL) && (config[i]->getShiftIn()==NULL)){ //TODO FIXME ???
				ref = config[i];
				ref->getTopRightCorner  (itx,ity);
				ref->getBottomLeftCorner(ibx,iby);

				count = ref->getNrOfPrimitiveDSPs(); 

				bool ver = true;
				int sa = 17;     /* the shift amount */
				
				/* now we start binding DSPs */		
				while ( ver==true && ref->getShiftOut() == NULL && count < nrOfShifts4Virtex){
					ver=false;

					for (int j=0; j < nrDSPs && ref->getShiftOut()==NULL; j++){
						config[j]->getTopRightCorner(jtx,jty);
					
						ref->getTopRightCorner  (itx,ity);
						ref->getBottomLeftCorner(ibx,iby);

						/* we can potentially bind two if by combining the two
						we don't exceed the maximum number of shift combinations */
						if ( config[j]!=NULL && j!=i && ((count + config[j]->getNrOfPrimitiveDSPs()) <= nrOfShifts4Virtex)){
							config[j]->getTopRightCorner(jtx,jty);
							/* if this one is in the bounds of the board */
							if ( jtx <= extendedBoardWidthme && jty <= extendedBoardHeightme){//TODO FIXME
								REPORT(DEBUG, " itx ity "<<itx<<" "<<ity<<" jtx jty "<< jtx<<" "<<jty);
								sa = config[j]->getShiftAmount(); //17 for Xilinx
								
								/* for now this condition binds DSPs on horizontal
								we might need to change this one for optimality */
								if ( (jtx + jty == itx + ity) && config[j]->getShiftIn()==NULL){
									REPORT(DETAILED, "DSP #"<<i<<" bind with DSP# "<<j<<" on direct line");
									ver = true;
									ref->setShiftOut(config[j]);
									config[j]->setShiftIn(ref);
								
									nrOfUsedDSPs--;
									ref = config[j];
									count += ref->getNrOfPrimitiveDSPs();
								}else if (jtx + jty - itx - ity == sa &&  config[j]->getShiftIn()==NULL) {
									/* this is the binding condition */
									REPORT(DETAILED, "DSP #"<<i<<" bind with DSP# "<<j<<" on shift line");
									ver = true;
									ref->setShiftOut(config[j]);
									config[j]->setShiftIn(ref);
								
									nrOfUsedDSPs--;
									ref = config[j];
									count += ref->getNrOfPrimitiveDSPs();
								}else{}
							}
						}
					}
				}
			}
		}
		return nrOfUsedDSPs;
	}

	/* sort the DSP blocks in the config list according to their Top
	left corner coordinates */
	void IntTilingMult::sortDSPs(vector<DSP*> &config){
		int ix,iy,jx,jy;
		DSP* temp;
		for(int i=0; i< nrDSPs-1;i++){		
			for(int j=i+1;j<nrDSPs;j++){
				config[i]->getTopRightCorner(ix,iy);
				config[j]->getTopRightCorner(jx,jy);
				if (iy + ix > jy + jx)  {
					temp      = config[i];
					config[i] = config[j];
					config[j] = temp;				
				}
			}
		}
	}

	/* compares the cost of the global config with best config and sets 
	the best config accordingly */
	void IntTilingMult::updateBestConfig(vector<DSP*> &bestConfig, vector<DSP*> runningConfig){
		REPORT(DETAILED, "----->Updating best configuration ...");
		REPORT(DETAILED, "Best confg has    "   <<bestConfig.size() << " DSPs");
		REPORT(DETAILED, "Running confg has "<<runningConfig.size() << " DSPs");
		
		float costBestConfig       = (bestConfig.size()>0 ? computeCost(bestConfig): FLT_MAX);
		
		/* copy the runningConfig into a workingConfig variable, as modifications on it will 
		intervene with the backtracking algo */
		workingConfig.clear();
		for (unsigned i=0; i<runningConfig.size(); i++){
			DSP* myDSP = (DSP*) malloc(sizeof(DSP));
			memcpy( myDSP, runningConfig[i], sizeof(DSP)); 
			workingConfig.push_back (myDSP);
		}
		 
		float costCompetitorConfig = computeCost( workingConfig );
		
		if (costCompetitorConfig < costBestConfig){
			bestConfig.clear();
			for (unsigned i=0; i<runningConfig.size(); i++){
				DSP* myDSP = (DSP*) malloc(sizeof(DSP));
				memcpy( myDSP, runningConfig[i], sizeof(DSP)); 
				bestConfig.push_back (myDSP);
			}
		}
	}

	/* computes the cost of a given configuration */
	float IntTilingMult::computeCost(vector<DSP*> &config)
	{
		float cost = 0.0;
		int nrDSPs = config.size();
		
		vector<SoftDSP*> softMultipliers;

		cost += ((float)nrDSPs)*costDSP; // the normalized cost of these DSPs in the final cost
		
		/* now count the cost of the soft-core multipliers, weighed by user ratio */
		int partitions = partitionMultiplicationInSlices(config, softMultipliers);
		
		float lutsForSoftMultipliers = 0;
		for (unsigned k=0; k<softMultipliers.size(); k++){
			int iiN, iiS, jjE, jjW;
			(softMultipliers[k])->getCoordinates(jjE, iiN, jjW, iiS);
			lutsForSoftMultipliers += target_->getIntMultiplierCost(jjW-jjE+1, iiS-iiN+1);
		}
		softMultipliers.clear(); //clean up
				
		REPORT( DETAILED, "-------->COMPUTE COST: Number of slices for soft-core multipliers is = " << lutsForSoftMultipliers);
		cost += costLUT * lutsForSoftMultipliers;
		
		/* finally, we add to this cost the size of the final multi-operand adder */
		
		/* some of the DSPs can be bined in order to save some additions */
		int nrOfUsedDSPs = bindDSPs(config); 
		REPORT( DETAILED, "-------->COMPUTE COST: Number of operands for intNAdder is " << nrOfUsedDSPs+partitions);
		float LUTs4NAdder=((float)target_->getIntNAdderCost(wInX + wInY, nrOfUsedDSPs+partitions) );
		REPORT( DETAILED, "-------->COMPUTE COST: AdderCost = " << LUTs4NAdder); /* this size will be reduced due to the 
		fact that the sof-core multipliers usually have higher weights */ 

		cost +=  LUTs4NAdder * costLUT;
		REPORT( DETAILED, "-------->COMPUTE COST: Configuration cost = " << cost);	
		return cost;
	}


	/* this function might need to be changed depending on the meaning of 
	ratio */	
	int IntTilingMult::estimateDSPs()
	{
		if (ratio > 1){
			REPORT(DETAILED, "Ratio is " << ratio << " and should be in [0,1]. Will saturate to 1");
			ratio = 1;
		}
			
		float t1,t2,t3,t4; /* meaningful vars ;) */
		int Xd, Yd;  /* the dimension of the multiplier on X and on Y */
		target_->getDSPWidths(Xd,Yd);

		int maxDSP, mDSP = target_->getNumberOfDSPs();
		int wInXt = wInX;
		int wInYt = wInY;
		if (wInY > wInX){
			wInYt = wInX;
			wInXt = wInY;
		}

		/* all trivial tiling possibilities */
		t1 = ((float) wInXt) / ((float) Xd);
		t2 = ((float) wInYt) / ((float) Yd);
		t3 = ((float) wInXt) / ((float) Yd);
		t4 = ((float) wInYt) / ((float) Xd);
		
		maxDSP = int ( max( ceil(t1)*ceil(t2), ceil(t3)*ceil(t4)) );
		maxDSP = int(ratio * double(maxDSP));
	
		if(maxDSP > mDSP){ /* there are not enough DSPs on this FPGA to perform 
			this multiplication using just DSPs */
			maxDSP = mDSP; //set the maximum number of DSPs to the multiplication size
		}
			
		return int(ceil((float)maxDSP));
	}
	
	int  IntTilingMult::getExtraHeight()
	{
		int x,y;	
		target_->getDSPWidths(x,  y);
		float temp = ratio * 0.75 * ((float) y);
		return ((int)temp);
		//return 4;
	}

	
	int  IntTilingMult::getExtraWidth()
	{
		int x,y;	
		target_->getDSPWidths(x,y);
		float temp = ratio * 0.75 * ((float) x);
		return ((int)temp);
	}

	void IntTilingMult::emulate(TestCase* tc)
	{
		mpz_class svX = tc->getInputValue("X");
		mpz_class svY = tc->getInputValue("Y");

		mpz_class svR = svX * svY;

		tc->addExpectedOutput("R", svR);
	}

	void IntTilingMult::buildStandardTestCases(TestCaseList* tcl){
	
	}


	int IntTilingMult::checkFarness(vector<DSP*> config,int index)
	{
		int xtr1, ytr1, xbl1, ybl1, xtr2, ytr2, xbl2, ybl2;
		//if we run the algorithm with one less DSP then we should verify against the DSP nrDSP-2
	
		if(index  < 1)
			return 0;
	
		config[index]->getTopRightCorner(xtr1, ytr1);
		config[index]->getBottomLeftCorner(xbl1, ybl1);
		int dist=0;
		bool ver=false;
		int sqrDist = maxDist2Move * maxDist2Move;
	
		dist=0;	
		for (int i=0; i<index; i++)
			if ((config[i] != NULL) )
				{
					config[i]->getTopRightCorner(xtr2, ytr2);
					config[i]->getBottomLeftCorner(xbl2, ybl2);
					if(xtr1 > xbl2+1 + maxDist2Move)
						dist++;			
				}
		if(dist == index)
			return 1;
	
		//cout<<"Sqr max is "<<sqrDist<<endl;
		for (int i=0; i<index; i++)
			if ((config[i] != NULL) )
				{
					dist=0;
					config[i]->getTopRightCorner(xtr2, ytr2);
					config[i]->getBottomLeftCorner(xbl2, ybl2);
					if(xtr1 > xbl2)
						dist +=(xtr1 - xbl2-1)*(xtr1 - xbl2-1);
					//~ cout<<"xtr1= "<<xtr1<<" xbl2= "<<xbl2<<" Dist = "<<dist<<"  ";
					if(ybl2 < ytr1)
						dist +=(1+ybl2-ytr1) * (1+ybl2-ytr1) ;
					else
						if(ybl1 < ytr2)
							{
								dist +=(1+ybl1 - ytr2) *(1+ybl1 - ytr2) ;
								ver =true;
							}
			
					//~ cout<<"The distance for DSP "<<i<<" is "<<dist<<endl;
					if(dist <= sqrDist)
						{
							//cout<<"Dist  was = "<<dist<<endl;
							return 0; //OK
					
						}			
				}
		if(!ver)
			return 2;
	
		return 3;
	}

	/* we check the validity of our tiling */
	bool IntTilingMult::checkOverlap(vector<DSP*> config, int index)
	{	
		int xtr1, ytr1, xbl1, ybl1, xtr2, ytr2, xbl2, ybl2;

		config[index]->getTopRightCorner  (xtr1, ytr1);
		config[index]->getBottomLeftCorner(xbl1, ybl1);
		
		REPORT(DEBUG, tab << tab << "checkOverlap: ref is block #" << index << ". Top-right is at (" << xtr1 << ", " << ytr1 << ") and Bottom-right is at (" << xbl1 << ", " << ybl1 << ")");
	
		for (int i=0; i<index; i++){
			if (config[i] != NULL) /* it should be different, morally ... */
			{
				config[i]->getTopRightCorner  (xtr2, ytr2);
				config[i]->getBottomLeftCorner(xbl2, ybl2);
			
				REPORT(DEBUG, "checkOverlap: comparing with block #" << i << ". Top-right is at (" << xtr2 << ", " << ytr2 << ") and Bottom-right is at (" << xbl2 << ", " << ybl2 << ")");
		
				if (((xtr2 <= xbl1) && (ytr2 <= ybl1) && (xtr2 >= xtr1) && (ytr2 >= ytr1)) || // config[index] overlaps the upper and/or right part(s) of config[i]
				((xbl2 <= xbl1) && (ybl2 <= ybl1) && (xbl2 >= xtr1) && (ybl2 >= ytr1)) || // config[index] overlaps the bottom and/or left part(s) of config[i]
				((xtr2 <= xbl1) && (ybl2 <= ybl1) && (xtr2 >= xtr1) && (ybl2 >= ytr1)) || // config[index] overlaps the upper and/or left part(s) of config[i]
				((xbl2 <= xbl1) && (ytr2 <= ybl1) && (xbl2 >= xtr1) && (ytr2 >= ytr1)) || // config[index] overlaps the bottom and/or right part(s) of config[i]
				((xbl2 >= xbl1) && (ybl2 <= ybl1) && (ytr2 >= ytr1) && (xtr2 <= xtr1)) || // config[index] overlaps the center part of config[i]
			
				((xtr1 <= xbl2) && (ytr1 <= ybl2) && (xtr1 >= xtr2) && (ytr1 >= ytr2)) || // config[i] overlaps the upper and/or right part(s) of config[index]
				((xbl1 <= xbl2) && (ybl1 <= ybl2) && (xbl1 >= xtr2) && (ybl1 >= ytr2)) || // config[i] overlaps the bottom and/or left part(s) of config[index]
				((xtr1 <= xbl2) && (ybl1 <= ybl2) && (xtr1 >= xtr2) && (ybl1 >= ytr2)) || // config[i] overlaps the upper and/or left part(s) of config[index]
				((xbl1 <= xbl2) && (ytr1 <= ybl2) && (xbl1 >= xtr2) && (ytr1 >= ytr2)) || // config[i] overlaps the bottom and/or right part(s) of config[index]
				((xbl1 >= xbl2) && (ybl1 <= ybl2) && (ytr1 >= ytr2) && (xtr1 <= xtr2))){    // config[i] overlaps the center part of config[index]
					REPORT( DEBUG, "checkOverlap: return true");
					return true;
				}
			}
		}		
		REPORT( DEBUG, "checkOverlap: return false");
		return false;
	}


	/* DESIGN SPACE EXPLORATION */
    /* ---------------------------------------------------------------------- */
	void IntTilingMult::initTiling(vector<DSP*> &config, int dspCount){
		int w, h; 
		target_->getDSPWidths(w, h);
		dsplimit = w*h;
		
		for (int i=0; i<dspCount; i++){
			REPORT(DETAILED, "initializing tiling; placing DSP block #" << i); 
			config.push_back(target_->createDSP());
			config[i]->setNrOfPrimitiveDSPs(1);
			config[i]->allocatePositions(64); /* each DSP offers 8 placement positions, actually a lot less but 8 is for margin */
			/* try to place the DSP ... */
			if(!replace(config, i)){
				/* if we could not place the DSP in the tiling board bounds, then we place it outside the board */
				w = config[i]->getMaxMultiplierWidth();
				h = config[i]->getMaxMultiplierHeight();
				config[i]->setTopRightCorner   (extendedBoardWidth  , extendedBoardHeight);
				config[i]->setBottomLeftCorner (extendedBoardWidth+w, extendedBoardHeight+h);
			}
			int xtr, ytr, xbl, ybl;
			config[i]->getTopRightCorner(xtr, ytr);
			config[i]->getBottomLeftCorner( xbl, ybl);
			REPORT(DEBUG, "Placed DSP that spans from "<<xtr<<","<<ytr<<" to "<<xbl<<","<<ybl);
		}
	}


	bool IntTilingMult::replace(vector<DSP*> config, int index)
	{
		int xtr1, ytr1, xbl1, ybl1, multiplierWidth, multiplierHeight;
		
		multiplierWidth  = config[index]->getMaxMultiplierWidth();
		multiplierHeight = config[index]->getMaxMultiplierHeight();

		config[index]->tilingResetPosition();

		if (index==0){ /* first DSP is placed in the top-right corner */
			xtr1 = getExtraWidth() ;
			ytr1 = getExtraHeight() ;	
			ybl1 = ytr1 + multiplierHeight -1;
			xbl1 = xtr1 + multiplierWidth  -1;
			
			config[index]->setTopRightCorner  (xtr1, ytr1);
			config[index]->setBottomLeftCorner(xbl1, ybl1);
		}else { /* starting with the second DSP */

			bool foundValidConfiguration = false;

			if (index > 1){
				/* the new block can be placed anywhere this is valid */
				REPORT( DEBUG, "replace: Trying to push all additional untested configurations from previous block");
				REPORT( DEBUG, "replace: Out of " << config[index-1]->getAvailablePositions() << " configurations, adding " << config[index-1]->getAvailablePositions() - config[index-1]->getCurrentPosition()); 
	
				if (config[index-1]->getCurrentPosition()>=0){
					for(int  v=config[index-1]->getCurrentPosition(); v<config[index-1]->getAvailablePositions(); v++){
						REPORT( DEBUG, "replace: Pused new additional configuration " << config[index-1]->Xpositions[v] << " " << config[index-1]->Ypositions[v] );
						config[index]->push( config[index-1]->Xpositions[v], config[index-1]->Ypositions[v]); 
						foundValidConfiguration = true;
					}
				}
			}

			/* calulate possible dispacements */
			int mindX, mindY;
			int multiplierWidth  = config[index-1]->getMaxMultiplierWidth();
			int multiplierHeight = config[index-1]->getMaxMultiplierHeight();

			
			if (target_->getID()  == "Virtex5" || target_->getID()  == "Virtex6") { 
				/* align top right of current 24-17 bits left, 24 bits lower */
				if (multiplierWidth > multiplierHeight){
					mindX = multiplierWidth;
					mindY = multiplierHeight-multiplierWidth;
				}else{
					mindX = multiplierWidth-multiplierHeight;
					mindY = multiplierHeight;
				}
			}
			else if (target_->getVendor()=="Altera"){ 
				// align on diagonal in order to use internal adders 
				mindX = -multiplierWidth;
				mindY = multiplierHeight;	
			}

			/* TODO explore with other dispacements as well */
			int positionDisplacementX[] = {0, multiplierWidth,  mindX};
			int positionDisplacementY[] = {multiplierHeight, 0, mindY};

			int x,y, x1,y1;
			config[index-1]->getTopRightCorner(x, y);
			REPORT(DEBUG, "replace: DSP " << index-1 << " was found at "<<x<<","<<y);
			
			bool extraPosition = ( (multiplierWidth!=multiplierHeight) || ((target_->getID() == "StratixII") || (target_->getID()  == "StratixIII") || (target_->getID()  == "StratixIV") ));
//			config[index]->allocatePositions( (2 + (extraPosition? 1:0)) );
			
			for (int i=0; i<3; i++){
				x1 = x + positionDisplacementX[i];
				y1 = y + positionDisplacementY[i];
				if (x1 < extendedBoardWidthme && y1 < extendedBoardHeightme && x1>0 && y1>0){ /* if inside the board */ 
					if ( (i!=2) || extraPosition){ /* for Virtex5 and Altera FPGAs */
						REPORT(DEBUG, "replace: Pushing new default configuration");
						config[index]->push(x1, y1);
					}
					foundValidConfiguration = true;
				}
			}

			if (foundValidConfiguration){
				REPORT(DEBUG, "replace: Available positions for index "<<index << " are " <<config[index]->getAvailablePositions());
				do{
					int currentPosition = config[index]->pop();
					REPORT( DEBUG, "replace: The current position is " << currentPosition);
					if (currentPosition >= 0) 
						config[index]->setConfiguration( currentPosition );
					else{
						REPORT( DEBUG, "replace: returning false");
						return false; // could not place DSP inside tiling board
					}
				}while (checkOverlap(config, index)); 
			}
		}
		REPORT (DEBUG, "replace: Succesfully placed DSP");
		return true;
	}
	

	/**
		There is one case that is not resolved yet. For DSP with widths 
		different then height the algorithm should move the dsp with both values
	*/
	bool IntTilingMult::move(vector<DSP*> config, int index){

		int xtr1, ytr1, xbl1, ybl1;
		int w, h;
		w= config[index]->getMaxMultiplierWidth();
		h= config[index]->getMaxMultiplierHeight();
	
		config[index]->getTopRightCorner  (xtr1, ytr1);
		config[index]->getBottomLeftCorner(xbl1, ybl1);
	
		int pos; // index for list of positions of a DSP
		
		if(index==0){ // the first DSP block cannot move freely on the tiling grid
			return false;
		}else{ // all DSP blocks except the first one can move only in fixed positions
			do{
				// move to next valid position (one that does not overlap with the existing config 
				pos = config[index]->pop();
				if(pos >= 0){
					ytr1 = config[index]->Ypositions[pos];
					ybl1 = ytr1 + h-1;
					xtr1 = config[index]->Xpositions[pos];
					xbl1 = xtr1 + w-1;
				}else // all possible positions have been finished 
					return false;
					
				config[index]->setTopRightCorner  (xtr1, ytr1);
				config[index]->setBottomLeftCorner(xbl1, ybl1);
			}while (checkOverlap(config, index));
		}
		return true;
	}

	/* CODE GENERATION */
    /* ---------------------------------------------------------------------- */

	void IntTilingMult::generateVHDLCodeForCompleteTilling(){
		
		softMultipliers.clear();
		int nrDSPOperands   = multiplicationInDSPs           (bestConfig);
		int nrSliceOperands = partitionMultiplicationInSlices(bestConfig, softMultipliers);
		                      multiplicationInSlices         (softMultipliers);

		REPORT(DETAILED, "nr of DSP operands="<<nrDSPOperands);
		REPORT(DETAILED, "nr of softDSP operands="<<nrSliceOperands);
		map<string, double> inMap;
		
		for (int j=0; j<nrDSPOperands; j++)
			syncCycleFromSignal( join("addOpDSP",j), getSignalDelay(join("addOpDSP",j)));
			
		for (int j=0; j<nrSliceOperands; j++)
			syncCycleFromSignal( join("addOpSlice",j), getSignalDelay(join("addOpSlice",j)));

		nextCycle();		
		if (nrDSPOperands + nrSliceOperands > 1){
			IntMultiAdder *add =  new IntMultiAdder(getTarget(), wInX+wInY, nrDSPOperands+nrSliceOperands, inDelayMap("X0", target_->localWireDelay()) );

			oplist.push_back(add);
			REPORT(DEBUG, "Finished generating the multioperand adder");

			for (int j=0; j<nrDSPOperands; j++)
				inPortMap (add, join("X",j) , join("addOpDSP",j) );
					
			for (int j=0; j<nrSliceOperands; j++)
				inPortMap (add, join("X",j+nrDSPOperands) , join("addOpSlice",j) );

			outPortMap(add, "R", "addRes");
			vhdl << instance(add, "FinalAdder");
			syncCycleFromSignal("addRes");
			setCriticalPath( add->getOutputDelay("R") );

			vhdl << tab << "R <= addRes;" << endl;
			outDelayMap["R"] = getCriticalPath();
		}else{
			if (nrDSPOperands==1){
				syncCycleFromSignal("addOpDSP0");
				vhdl << tab << "R <= addOpDSP0;" << endl;
			}else{
				syncCycleFromSignal("addOpSlice0");
				vhdl << tab << "R <= addOpSlice0;" << endl;
			}
		}
	}
	
	int IntTilingMult::multiplicationInDSPs(vector<DSP*> config)
	{
		shiftedValDSPs = -1;
		int nrOp = 0;		 			// number of resulting adder operands
		int trx1, try1, blx1, bly1; 	// coordinates of the two corners of a DSP block 
		int fpadX, fpadY, bpadX, bpadY;	// zero padding on both axis
		int extW, extH;					// extra width and height of the tiling grid
		int multW, multH; 				// width and height of the multiplier the DSP block is using
		ostringstream xname, yname, mname, cname, sname;
		vector<DSP*> DSPConfig;	// buffer that with hold a copy of the global configuration
			
		DSPConfig = config;
	
		for (unsigned i=0; i<DSPConfig.size(); i++){
			if (DSPConfig[i] != NULL){
				DSP* d = DSPConfig[i];
				int j=0;
				int connected = 0;
				bool outside = false;
				
				/* determine ne number of tiles in the supertile */ 
				while (d != NULL) {
					connected++;
					d = d->getShiftOut();
				}

				REPORT(DETAILED, "Found Supertile having " <<connected<<" connected DSPs");
				d = DSPConfig[i];
				
				int rtXOld=0, rtYOld=0;
				while (d != NULL){

					d->getTopRightCorner  (trx1, try1);
					d->getBottomLeftCorner(blx1, bly1);
					extW = getExtraWidth();
					extH = getExtraHeight();
					
					fpadX = blx1-wInX-extW+1;
					fpadX = (fpadX<0)?0:fpadX;
					
					fpadY = bly1-wInY-extH+1;
					fpadY = (fpadY<0)?0:fpadY;
					
					bpadX = extW-trx1;
					bpadX = (bpadX<0)?0:bpadX;
					
					bpadY = extH-try1;
					bpadY = (bpadY<0)?0:bpadY;
					
					multW = blx1 - trx1 + 1;
					multH = bly1 - try1 + 1;

					/* these are the true coordinates of the tile used to 
					address the X and Y std_logic_vector inputs. */
					int startX = blx1-fpadX-extW;
					int endX   = trx1+bpadX-extW;
					int startY = bly1-fpadY-extH;
					int endY   = try1+bpadY-extH;
						
					/* these are the real coordinates of the tile which may
					have values outside the 0..wIn-1 range if the tile goes
					outside the tiling board */
					int rtX = trx1 - extW;
					int rtY = try1 - extH;
					int rbX = blx1 - extW;
					int rbY = bly1 - extH;

					/* these are the values of the possibly smaller tile
					which covers the tiling board */ 
					int bounded_bX = (rbX > wInX-1? wInX-1: rbX);
					int bounded_bY = (rbY > wInY-1? wInY-1: rbY);
					
					int bounded_tX = (rtX < 0? 0: rtX);
					int bounded_tY = (rtY < 0? 0: rtY);
					
					int tileSize = (bounded_bX - bounded_tX + 1) + (bounded_bY - bounded_tY + 1);
					int nrZeros  = (wInX-1) - bounded_bX +  (wInY-1) - bounded_bY;
					
					int previousPadding = 0;
						
					/* just in case check that this tile is not outside
					the area of interest */
					if ((startX < endX) || (startY < endY)) {
						outside = true;
						break;
					}
					
					/* this is where the DSP-part of the multiplier code 
					gets generated; TODO: bring to new standard so 
					it gets less levels of pipeline */
					setCycle(0);
					
					vhdl << tab << declare(join("x",i,"_",j), multW+1) << " <= \"0\" & " << zg(fpadX,0) << " & X" << range(startX, endX) << " & " << zg(bpadX,0) << ";" << endl;
					vhdl << tab << declare(join("y",i,"_",j), multH+1) << " <= \"0\" & " << zg(fpadY,0) << " & Y" << range(startY, endY) << " & " << zg(bpadY,0) << ";" << endl;

					if ((d->getShiftIn() != NULL) && (j>0)){ 
						/* this block will also accumulate the product computed 
						by the neighbour DSP block, either as is, either shifted 
						17 bits right (MSB bits of neighbouring product) */
						mname.str("");
						mname << "pxy" << i;
						cname.str("");
						cname << "txy" << i << j;
						setCycle(j);
						vhdl << tab << declare(join("txy",i,j), multW+multH+2) << " <= " << join("x",i,"_",j)<<range(multW,0) << " * " << join("y",i,"_",j)<<range(multH,0) << ";" << endl;
						
						if (rtX+rtY == rtXOld+rtYOld) 
							/* the contribution of the previous tile will not be shifted*/
							vhdl << tab << declare(join("pxy",i,j), multW+multH+2) << " <= (" << join("txy",i,j)<<range(multW+multH+1,0) << ") + (" << join("pxy",i,j-1) << ");" << endl;	
						else
							/* this is the regular case where previous MSB (17 to ..) from
							the previous tile are added */
							vhdl << tab << declare(join("pxy",i,j), multW+multH+2) << " <= (" << join("txy",i,j)<<range(multW+multH+1,0) << ") + (" <<zg(d->getShiftAmount(),0)<< " &" << join("pxy",i,j-1) << range(multW+multH+1, d->getShiftAmount()) << ");" << endl;	
						
						if (d->getShiftOut() == NULL){ 
							/* concatenate the entire partial product */
							setCycle(connected);
							sname.seekp(ios_base::beg);

							sname << zg(nrZeros) << " & " << join("pxy",i,j) << range(multW+multH - fpadX - fpadY - 1, min(bpadX + bpadY, max(0,previousPadding - d->getShiftAmount()))) << " & " << sname.str();
						} else { // concatenate only the lower portion of the partial product
							setCycle(connected);
							sname.seekp(ios_base::beg);

							int trx2,try2,blx2,bly2;
							d->getShiftOut()->getTopRightCorner  (trx2, try2);
							d->getShiftOut()->getBottomLeftCorner(blx2, bly2);
							
							int rtXNext = trx2 - extW;
							int rtYNext = try2 - extH;

							if (rtX + rtY != rtXNext + rtYNext) 
								sname << join("pxy",i,j) << range( min(tileSize, d->getShiftAmount())-1, min(bpadX + bpadY, previousPadding+d->getShiftAmount())) << " & " << sname.str();
						}
					}else{ // only multiplication
						vhdl << tab << declare(join("pxy",i,j), multW+multH+2) << " <= " << join("x",i,"_",j)<<range(multW,0) << " * " <<join("y",i,"_",j)<<range(multH,0) << ";" << endl;
						sname.str("");
						if (d->getShiftOut() == NULL){ // concatenate the entire partial product
							
							sname << zg(nrZeros) << " & " << join("pxy",i,j) << range(tileSize + bpadX+bpadY -1, bpadX+bpadY) << " & " << zg(bounded_tX + bounded_tY) << ";" << endl;
						
						} else { // concatenate only the lower portion of the partial product
							/* check if the next element has as 17-bit shift wr to this one */

							/* these are the real coordinates next tile.
							if this tile has the same weight as the current 
							then the contribuiton of the current tile will
							be absorbed in the next so nothing will be 
							outputed*/
							int trx2,try2,blx2,bly2;
							d->getShiftOut()->getTopRightCorner  (trx2, try2);
							d->getShiftOut()->getBottomLeftCorner(blx2, bly2);
							
							int rtXNext = trx2 - extW;
							int rtYNext = try2 - extH;
							
							if ( rtX+rtY != rtXNext+rtYNext) //indeed, 17 bit shift 
								if (bpadX+bpadY < d->getShiftAmount())
								sname << join("pxy",i,j) << range(d->getShiftAmount()-1, bpadX+bpadY);
							
							sname << " & " << zg(bounded_tX + bounded_tY)<<";"<<endl;
							
							previousPadding = bpadX + bpadY;
						}
					}

					// erase d from the DSPConfig buffer to avoid handeling it twice
					for (int k=i+1; k<nrDSPs; k++) {
						if ((DSPConfig[k] != NULL) && (DSPConfig[k] == d)) {
							DSPConfig[k] = NULL;
							break;
						}
					}

					/* save previous tile coordinates as they will be 
					used in next tile generation */
					rtXOld = rtX;
					rtYOld = rtY;
					
					d = d->getShiftOut();
					j++;
				}
				
				if (outside) continue;	
				sname.seekp(ios_base::beg);
				sname << tab << declare(join("addOpDSP", nrOp),wInX+wInY) << " <= " << sname.str();
				vhdl << sname.str();
				nrOp++;		
			}
		}
		return nrOp;
	}


	void IntTilingMult::multiplicationInSlices(vector<SoftDSP*> &softConfig){
		for (unsigned k=0; k < softConfig.size(); k++){
			setCycle(0);
		
			int jjE, jjW, iiN, iiS;
			int width, height;
		
			softConfig[k]->getCoordinates(jjE, iiN, jjW, iiS);
				
			width  = jjW - jjE + 1;
			height = iiS - iiN + 1;

			LogicIntMultiplier* mult =  new LogicIntMultiplier(target_, width, height); //unsigned
			mult->changeName(join( mult->getName(), int(k)));
			oplist.push_back(mult);

			vhdl << tab << declare(join("x_p",k), width,  true) << " <= X" << range(jjW, jjE) << ";" << endl;
			vhdl << tab << declare(join("y_p",k), height, true) << " <= Y" << range(iiS, iiN) << ";" << endl;

			inPortMap  (mult, "X", join("x_p",k));
			inPortMap  (mult, "Y", join("y_p",k));
			outPortMap (mult, "R", join("result", k));

			vhdl << instance(mult, join("Mult", k));
			syncCycleFromSignal(join("result", k));
			setSignalDelay(join("result", k), mult->getOutputDelay("R"));

			vhdl << tab << declare(join("addOpSlice", k), wInX+wInY) << " <= " << zg(wInX+wInY-2-jjW-iiS, 0) << " & " << join("result", k) << " & " << zg(jjE+iiN,0) << ";" << endl;
			setSignalDelay( join("addOpSlice", k), mult->getOutputDelay("R"));
		}
	}
	
	int IntTilingMult::partitionMultiplicationInSlices(vector<DSP*> config, vector<SoftDSP*> &softConfig)
	{
		/* given a configuration of hardMultipliers, in this function we 
		first generate a list of softMultipliers, by partitioning the remaining 
		untiled board into rectangular pieces */

		int partitions=0; /* the number of soft-core multipliers on the board */
		int count=1; /* the indexes of the multipliers */

		int **mat; /* the integer matrix, which will represent the tiling board */
		mat = new int*[extendedBoardHeight];

		/* initialize matrix mat, which will contain the partition of soft DSPs */
		for(int i=0;i<extendedBoardHeight;i++){
			mat[i] = new int [extendedBoardWidth];
			for(int j=0;j<extendedBoardWidth;j++)
				mat[i][j]=0;
		}
		
		/* the corresponding locations to the current DSPs in the 
		integer matrix mat are filled-in */
		for(unsigned i=0;i<config.size();i++){
			int c1X,c2X,c1Y,c2Y;
	
			config[i]->getTopRightCorner  (c1X,c1Y);
			config[i]->getBottomLeftCorner(c2X,c2Y);

			REPORT(DETAILED, "found DSP spanning from "<<c1X<<","<<c1Y<<" to "<<c2X<<","<<c2Y);

			fillMatrix(mat, extendedBoardWidth, extendedBoardHeight, c1X, c1Y, c2X, c2Y, count);
			count++;			
		}

		/* the rest of the board is tiled with soft-core multipliers */		
		for(int i=0;i<extendedBoardHeight;i++)
			for(int j=0;j<extendedBoardWidth;j++)
				if (mat[i][j]==0){ // the start of a soft DSP
					// four directions to grow multiplier S N E V 
					bool south = true, north = true, east = true, west = true;
					int iiN=i, iiS=i, jjW=j, jjE=j;
					
					while ( south || north || east || west){
						//we try to grow the multipliers accordingly
						if (south){
							/* if in initial state we try to grow it south */	
							iiS++;
							if (iiS > extendedBoardHeight-1){
								iiS = extendedBoardHeight-1;
								south = false;	
							}
							if (south){
								for (int p=iiN; p<=iiS; p++)
									for (int q=jjE; q<=jjW; q++)
										if ( mat[p][q] != 0 )
											south = false;
								if (!south)
									iiS--;			
							}	
						}else if (west){
							/* if in initial state we try to grow it south */	
							jjW++;
							if (jjW > extendedBoardWidth-1){
								jjW = extendedBoardWidth;
								west = false;	
							}
							if (west){
								for (int p=iiN; p<=iiS; p++)
									for (int q=jjE; q<=jjW; q++)
										if ( mat[p][q] != 0 )
											west = false;
								if (!west)
									jjW--;
							}
						}else if (north){
							/* if in initial state we try to grow it south */	
							iiN--;
							if (iiN < 0){
								iiN = 0;
								north = false;	
							}
							if (north){
								for (int p=iiN; p<=iiS; p++)
								for (int q=jjE; q<=jjW; q++)
									if ( mat[p][q] != 0 )
										north = false;
								if (!north)
									iiN++;
							}
						}else if (east){
							/* if in initial state we try to grow it south */	
							jjE--;
							if (jjE < 0){
								jjE = 0;
								east = false;	
							}
							if (east){
								for (int p=iiN; p<=iiS; p++)
									for (int q=jjE; q<=jjW; q++)
										if ( mat[p][q] != 0 )
											east = false;
								if (!east)
									jjE++;
							}
						}
					}

					int njjW, niiN, njjE, niiS;
					int extH = getExtraHeight();
					int extW = getExtraWidth();
					
					REPORT(DEBUG, "Found Soft-multiplier that spans from "<<jjE<<","<<iiN<<" to "<<jjW<<","<<iiS);
	
					if( (jjE >= extendedBoardWidth-extW) || (jjW < extW) || (iiN >= extendedBoardHeight-extH) || (iiS < extH) ){
						REPORT(DETAILED, "Partition number "<<count<<" is totally out of the real multiplication bounds. ("<<iiN<<" , "<<jjE<<" , "<<iiS<<" , "<<jjW<<")");
					}else{
						/* determine the proper size of the soft-core multiplier.
						if the soft-core multiplier exceeds the bounds of the 
						multiplication, it will be truncated to these bounds */
						
						njjE = max(jjE, extW);
						njjW = min(jjW, extendedBoardWidth-extW-1);

						niiN = max(iiN, extH);
						niiS = min(iiS, extendedBoardHeight-extH-1);

						SoftDSP *sdsp = new SoftDSP (njjE-extW, niiN-extH, njjW-extW, niiS-extH);
						softConfig.push_back(sdsp);
						partitions++;
					}

					fillMatrix(mat, extendedBoardWidth, extendedBoardHeight, jjE, iiN, jjW, iiS, count);
					count++;
				}
	
		/* cleanup */
		for(int ii=0;ii<extendedBoardHeight;ii++)
			delete[](mat[ii]);
	
		delete[] (mat);
		return partitions;
	}	

	
	/* fill matrix with DSP index */
	void IntTilingMult::fillMatrix(int **&matrix, int lw, int lh,int topleftX,int topleftY, int botomrightX, int botomrightY, int value){
		for(int j=topleftX; j<= botomrightX; j++)
			for(int i=topleftY; i <= botomrightY; i++)
				if(j>-1 && i>-1 && i<lh && j<lw)
					matrix[i][j]=value;
	}


	void IntTilingMult::printConfiguration(vector<DSP*> configuration, vector<SoftDSP*> softDSPs){
		ofstream fig;
		ostringstream figureFileName;
		figureFileName << "tiling_w" << wInX << "_h" <<wInY << "_target-"<< target_->getID()<<"_DSP"<<nrDSPs<< ".fig";
		
		FILE* pfile;
		pfile  = fopen(figureFileName.str().c_str(), "w");
		fclose(pfile);
		
		fig.open (figureFileName.str().c_str(), ios::trunc);
				
		fig << "#FIG 3.2  Produced by xfig version 3.2.5a" << endl;
		fig << "Landscape" << endl;
		fig << "Center" << endl;
		fig << "Metric" << endl;
		fig << "A4      " << endl;
		fig << "100.00" << endl;
		fig << "Single" << endl;
		fig << "-2" << endl;
		fig << "1200 2" << endl;
	
		if (configuration.size()>0){
			int i=0;
			int xB,xT,yB,yT;
			for(i=0; i<nrDSPs; i++){
				configuration[i]->getCoordinates(xT,yT,xB,yB);
				
				REPORT(DEBUG, "HARD DSP Top right = " << xT << ", " << yT << " and bottom left = " << xB << ", " <<yB);
				fig << " 2 2 0 1 0 7 50 -1 -1 0.000 0 0 -1 0 0 5 " << endl;
				fig << "	  " << (-xB+getExtraWidth()-1)*45 << " " << (yT-getExtraHeight())*45 
				         << " " << (-xT+getExtraWidth())*45 << " " << (yT-getExtraHeight())*45 
				         << " " << (-xT+getExtraWidth())*45 << " " << (yB-getExtraHeight()+1)*45 
				         << " " << (-xB+getExtraWidth()-1)*45 << " " << (yB-getExtraHeight()+1)*45 
				         << " " << (-xB+getExtraWidth()-1)*45 << " " << (yT-getExtraHeight())*45 << endl;
				
				int dpx = (-(xT+xB)/2+getExtraWidth()-1)*45;
				int dpy = ((yB+yT)/2-getExtraHeight())*45;         
				REPORT(DETAILED, "x="<<dpx<<" y="<<dpy);
				fig << " 4 1 0 50 -1 0 12 0.0000 4 195 630 "<<dpx<<" "<<dpy<<" DSP"<<i<<"\\001" << endl;

				//annotations
				fig << " 4 1 0 50 -1 0 7 0.0000 4 195 630 "<<(-xB+getExtraWidth())*45<<" "<<-45<<" "<<xB-getExtraWidth()<<"\\001" << endl;
				fig << " 4 1 0 50 -1 0 7 0.0000 4 195 630 "<<(-xT+getExtraWidth()-1)*45<<" "<<-45<<" "<<xT-getExtraWidth()<<"\\001" << endl;
				fig << " 4 0 0 50 -1 0 7 0.0000 4 195 630 "<<45<<" "<<(yT-getExtraHeight()+2)*45<<" "<<yT-getExtraHeight()<<"\\001" << endl;
				fig << " 4 0 0 50 -1 0 7 0.0000 4 195 630 "<<45<<" "<<(yB-getExtraHeight()+1)*45<<" "<<yB-getExtraHeight()<<"\\001" << endl;
			}
		}

		int xB,xT,yB,yT;
		for (unsigned k=0; k < softDSPs.size(); k++){
			softDSPs[k]->getCoordinates(xT,yT, xB, yB);
			
			REPORT(DETAILED,  "SOFT DSP Top right = " << xT << ", " << yT << " and bottom left = " << xB << ", " <<yB);
			fig << " 2 2 0 1 0 7 50 -1 19 0.000 0 0 -1 0 0 5 " << endl;
			fig 
			<< " " << (-xB-1)*45 << " " << yT*45 
			<< " " << (-xT)  *45 << " " <<  yT   *45 
			<< " " << (-xT)  *45 << " " << (yB+1)*45 
			<< " " << (-xB-1)*45 << " " << (yB+1)*45 
			<< " " << (-xB-1)*45 << " " <<  yT   *45 << endl;
			int dpx = (-(xT+xB)/2-1)*45;
			int dpy = ((yB+yT)/2)*45;         
			REPORT(DETAILED,  "x="<<dpx<<" y="<<dpy);
			fig << " 4 1 0 50 -1 0 12 0.0000 4 195 630 "<<dpx<<" "<<dpy<<" M"<<k<<"\\001" << endl;
			
			xT++; yT++; xB++; yB++;
			int tmp=xT; xT=xB; xB=tmp; 
			tmp=yT; yT=yB; yB=tmp;
			
			//annotations
			fig << " 4 1 0 50 -1 0 7 0.0000 4 195 630 "<<(-xB)*45<<" "<<-45<<" "<<xB<<"\\001" << endl;
			fig << " 4 1 0 50 -1 0 7 0.0000 4 195 630 "<<(-xT-1)*45<<" "<<-45<<" "<<xT<<"\\001" << endl;
			fig << " 4 0 0 50 -1 0 7 0.0000 4 195 630 "<<45<<" "<<(yT+2)*45<<" "<<yT<<"\\001" << endl;
			fig << " 4 0 0 50 -1 0 7 0.0000 4 195 630 "<<45<<" "<<(yB+1)*45<<" "<<yB<<"\\001" << endl;
		}
		
		fig << "		2 2 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 5" << endl;
		fig << "	  " << (-wInX)*45 << " " << 0 
         << " " << 0 << " " << 0  
         << " " << 0 << " " << (wInY)*45 
         << " " << (-wInX)*45 << " " << (wInY)*45 
         << " " << (-wInX)*45 << " " << 0 << endl;

		//big X and Y
		fig << " 4 1 0 50 -1 0 16 0.0000 4 195 630 "<<-wInX/2*45<<" "<<-3*45<<" X\\001" << endl;
		fig << " 4 0 0 50 -1 0 16 0.0000 4 195 630 "<<3*45<<" "<<wInY/2*45<<" Y\\001" << endl;

		fig.close();
	}	
	
	
	float IntTilingMult::suggestRatio(vector<DSP*> configuration){
		int dspMultHeight, dspMultWidth, dspMultArea;
		getTarget()->getDSPWidths(dspMultHeight, dspMultWidth);
		
		dspMultArea = dspMultWidth * dspMultHeight;
		REPORT(DEBUG, " DSP area is: " << dspMultArea); 
		
		if (configuration.size()>0)
			return 1.0;
			
		int xB,xT,yB,yT;
		int underutilized = 0;
		int severelyUnderutilized = 0;
		
		for(int i=0; i<nrDSPs; i++){
			configuration[i]->getCoordinates(xT,yT,xB,yB); //coordinates in the extended board
			convertCoordinates(xT,yT,xB,yB); 
			
			if ( float((xB-xT+1)*(yB-yT+1))< float(dspMultArea)) {
				if ( float((xB-xT+1)*(yB-yT+1))/float(dspMultArea) < 0.5 ){ //TODO-- link this ratio to the global one
					REPORT(DETAILED, "HARD DSP is SEVERELY under-utilized, just " << float((xB-xT+1)*(yB-yT+1))/float(dspMultArea) << "%");
					severelyUnderutilized++;
				}else{
					REPORT(DETAILED, "HARD DSP utilized " << float((xB-xT+1)*(yB-yT+1))/float(dspMultArea) << "%");
					underutilized++;
				}
			}
		}
		REPORT(DETAILED, "*      underutilized = " << underutilized  + severelyUnderutilized);
		REPORT(DETAILED, "*      suggested ratio = " << (float(nrDSPs)*ratio - float(severelyUnderutilized)) / float(nrDSPs));
	
		return  (float(nrDSPs)*ratio - float(severelyUnderutilized)) / float(nrDSPs);
	}

	void IntTilingMult::convertCoordinates(int &tx, int &ty, int &bx, int &by)
	{
		tx -= getExtraWidth();
		ty -= getExtraHeight();
		bx -= getExtraWidth();
		by -= getExtraHeight();

		if (bx>=wInX) bx = wInX-1;
		if (by>=wInY) by = wInY-1;
	}

	void IntTilingMult::convertCoordinatesKeepNeg(int &tx, int &ty, int &bx, int &by)
	{
		tx -= getExtraWidth();
		ty -= getExtraHeight();
		bx -= getExtraWidth();
		by -= getExtraHeight();
	}

	void IntTilingMult::outputVHDL(std::ostream& o, std::string name) {
		licence(o);
		o << "library ieee; " << endl;
		o << "use ieee.std_logic_1164.all;" << endl;
		o << "use ieee.std_logic_arith.all;" << endl;
		if  (target_->getVendor() == "Xilinx"){
			o << "use ieee.std_logic_signed.all;" << endl;
		}else{
			o << "use ieee.std_logic_unsigned.all;" << endl;
		}
		
		o << "library work;" << endl;
		outputVHDLEntity(o);
		newArchitecture(o,name);
		o << buildVHDLComponentDeclarations();	
		o << buildVHDLSignalDeclarations();
		beginArchitecture(o);		
		o<<buildVHDLRegisters();
		o << vhdl.str();
		endArchitecture(o);
	}
}

