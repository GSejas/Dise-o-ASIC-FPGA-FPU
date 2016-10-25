/*
  Truncated Integer Multiplier for FloPoCo
 
  This file is part of the FloPoCo project 
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Authors : Sebastian Banescu, 
            Bogdan Pasca, Bogdan.Pasca@ens-lyon.org,
            Radu Tudoran

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.
*/

#include <typeinfo>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <limits.h>
#include "../utils.hpp"
#include "../Operator.hpp"
#include "../IntMultiplier.hpp"
#include "LogicIntMultiplier.hpp"
#include "IntTruncMultiplier.hpp"

using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	// FIXME Janitoring dangerous redundancy?:  k=targetPrecision, wX=wInX, wY=wInY (not sure, there are wX-- in some places)
	IntTruncMultiplier::IntTruncMultiplier(Target* target, int winX, int winY, int wOut, float ratio, int uL, int maxTimeInMinutes, bool interactive, bool sign, bool roundCompensate):
		Operator(target), wInX(winX), wInY(winY), wOut(wOut), wX(winX), wY(winY), ratio(ratio),targetPrecision(wInX+wInY-wOut),useLimits(uL),  roundCompensate_(roundCompensate), maxTimeInMinutes(maxTimeInMinutes-1), sign(sign){
		start = clock(); /* time management */
		srcFileName="IntTruncMultiplier";
		isSquarer = false;	
		ostringstream name;
		name <<"IntTruncMultiplier_"<<wX<<"_"<<wY<<"_"<<wOut<<"_"<<(sign?"signed":"unsigned");
		setName(name.str());
		int k=targetPrecision;

		setCopyrightString("Sebastian Banescu, Bogdan Pasca, Radu Tudoran (2010-2011)");
	
		addInput ("X", wX, true);
		addInput ("Y", wY, true);
		addOutput("R", wX + wY - k, 2, true); 
	
		wOut = wX + wY - k;
		
		int wxDSP, wyDSP;
		//test if the multiplication fits into one DSP
		target->getDSPWidths(wxDSP, wyDSP, sign);
		bool testForward, testReverse;
		testForward     = (winX<=wxDSP)&&(winY<=wyDSP);
		testReverse = (winY<=wxDSP)&&(winX<=wyDSP);
		testFit = testForward || testReverse;
		
		if (testFit){
			nextCycle();// TODO: not needed for low frequencies
			if (sign)
				vhdl << tab << declare("rfull", wX + wY) << " <= X * Y;"<<endl;
			else //sign extension is necessary for using use ieee.std_logic_signed.all; 
			    // for correct inference of Xilinx DSP functions
				vhdl << tab << declare("rfull", wX + wY + 2) << " <= (\"0\" & X) * (\"0\" & Y);"<<endl;
			
			nextCycle();// TODO: to be fixed
			vhdl << tab << "R <= rfull"<<range(wX + wY-1, k)<<";"<<endl;	
			outDelayMap["R"] = 0.0;
			
			return;
			//don't go do the rest as we already solved our problem			
		}
		
	
		if (sign) {
			//for a signed multiplier the tiling board is smaller by one unit.
			//code generation will take into account the sign on the tiles 
			//from the left and bottom parts of the boardArea
			
			REPORT(DEBUG, "Signed, original values for wX="<<wX<< " wY="<<wY);
			wX--;
			wY--;
			REPORT(DEBUG, "Signed, modified values for wX="<<wX<< " wY="<<wY);
				
		}
	
		if (verbose>1)
			warningInfo();
	
		wInX             = wX;
		wInY             = wY;
		vn               = wInX + 2* getExtraWidth();
		vm               = wInY + 2* getExtraHeight();
		vnme             = vn - getExtraWidth();
		vmme             = vm - getExtraHeight();
		truncationOffset = estimateNrOfDiscardedCols(k);
		nrDSPs           = estimateDSPsv2();
			
		nrSoftDSPs       = 0;
		subCount         = 0;
		
		REPORT(INFO, "Estimated number of DSP blocks = "     << nrDSPs);
		REPORT(INFO, "Approx. number of discarded columns =" << truncationOffset);
		REPORT(DETAILED, "board padding padx="<<getExtraWidth()<<" y="<<getExtraHeight());
		
		/* the number of DSPs that could be cascaded on Xilinx FPGAs. Initially this was 4 
		but existance of SRLs made us increase the number. Nevertheless, in order to obtain
		balanced binindg this number should be function of input width and height TODO*/
		nrOfShifts4Virtex=20; 
		
		/* paranormal activity; FIXME COMMENT OR WILL GET KILLED*/
		float const scale=100.0;
		costDSP = ( (1.0+scale) - scale * ratio );
		//~ cout<<"Cost DSP is "<<costDSP<<endl;
		costLUT = ( (1.0+scale) - scale * (1-ratio) ) /  ((float) target_->getEquivalenceSliceDSP() );
		/* ---------------------------------------- */
		
		/* command-line interactivity. This is disabled for library mode */ 
		if (interactive){
			cout << "Do you want to run the algorithm? (y/n)" << endl;
			string myc;
			cin >> myc;
			if ( myc.compare("y")!=0)
				exit(-1);
		}
		runAlgorithm();
	}


	IntTruncMultiplier::~IntTruncMultiplier() {
	}
	
	
	int IntTruncMultiplier::estimateNrOfDiscardedCols(int k){
		int d = k+1;
		double limit = k;
		double apxError;
		double aux;
		do{
			d--;
			aux = pow(2.0, (double)d);
			aux *= (d-1);
			aux += 2.0;
			aux = log2(aux);
			apxError = ceil(aux);
		}while (limit < apxError);
		return d;
	}

	
	bool IntTruncMultiplier::isTilingValid(DSP** configuration, vector<SoftDSP*> softDSPs, int k){
		mpfr_init2(targetError, 1000);
		mpfr_set_ui(targetError, 2, GMP_RNDN);
		mpfr_pow_si(targetError, targetError, k, GMP_RNDN);

		mpfr_t roundingError;
		mpfr_init2(roundingError,1000);
		mpfr_set_ui(roundingError, 2, GMP_RNDN);
		mpfr_pow_si(roundingError, roundingError, k-1, GMP_RNDN);

		mpfr_t *approxError = evalTruncTilingErrorInverted(configuration, softDSPs);
		double apxError = mpfr_get_d(*approxError, GMP_RNDN);
		
		if (apxError < 0){ // then next loop will never finish (REASON: some multipliers overlap)
			REPORT(DEBUG,"Unexpected value for trunc error. Execution stopped.");
			return false;
		}
		
		/* Find error of the compensation term. error after compensation */
		mpfr_t t,t2;
		mpfr_init2(t, 1000);
		mpfr_init2(t2, 1000);
		
		bool found = false;
		mpfr_set_ui( t, 0, GMP_RNDN);
		if (mpfr_cmp(t, *approxError) == 0){
			mpfr_set(*approxError, t, GMP_RNDN);
			found = true;
		}
		
		int i=0;
		do{
			mpfr_set_ui( t, 2, GMP_RNDN);
			mpfr_pow_si(  t, t, i, GMP_RNDN); 
			mpfr_mul_ui( t2, t, 2, GMP_RNDN);
		
			if  ((mpfr_cmp(t, *approxError) <= 0) && (mpfr_cmp(*approxError, t2) <= 0)){
				found = true;
				mpfr_set(*approxError, t, GMP_RNDN);		
			}else{
				i++;
			} 
		}while(!found);

		mpfr_init2(errorSum, 1000);
		mpfr_add( errorSum, roundingError, *approxError, GMP_RNDN);
		mpfr_clear(*approxError);
		free(approxError);
		
		if ( mpfr_cmp( errorSum, targetError) <= 0){
			mpfr_clear(targetError);
			mpfr_clear(roundingError);
			mpfr_clear(errorSum);
			mpfr_clear(t);
			mpfr_clear(t2);
			return true;
		}else{
			mpfr_clear(targetError);
			mpfr_clear(roundingError);
			mpfr_clear(errorSum);
			mpfr_clear(t);
			mpfr_clear(t2);
			return false;
		}
	}
	
	void IntTruncMultiplier::printConfiguration(DSP** configuration, vector<SoftDSP*> softDSPs){
		ofstream fig;
		fig.open ("tiling_trunc.fig", ios::trunc);
		fig << "#FIG 3.2  Produced by xfig version 3.2.5a" << endl;
		fig << "Landscape" << endl;
		fig << "Center" << endl;
		fig << "Metric" << endl;
		fig << "A4      " << endl;
		fig << "100.00" << endl;
		fig << "Single" << endl;
		fig << "-2" << endl;
		fig << "1200 2" << endl;
	
		if (configuration!=NULL){
			int i=0;
			int xB,xT,yB,yT;
			for(i=0; i<nrDSPs; i++){
				configuration[i]->getTopRightCorner(xT,yT);
				configuration[i]->getBottomLeftCorner(xB,yB);
				REPORT(DETAILED, "HARD DSP Top right = " << xT-getExtraWidth() << ", " << yT << " and bottom left = " << xB-getExtraHeight() << ", " <<yB);
				fig << " 2 2 0 1 0 7 50 -1 -1 0.000 0 0 -1 0 0 5 " << endl;
				fig << " " <<- (-xB+getExtraWidth()-1) * 45 << " " <<- (yT-getExtraHeight())     * 45
				    << " " <<- (-xT+getExtraWidth())   * 45 << " " <<- (yT-getExtraHeight())     * 45
				    << " " <<- (-xT+getExtraWidth())   * 45 << " " <<- (yB-getExtraHeight()+1)   * 45
				    << " " <<- (-xB+getExtraWidth()-1) * 45 << " " <<- (yB-getExtraHeight()+1)   * 45
				    << " " <<- (-xB+getExtraWidth()-1) * 45 << " " <<- (yT-getExtraHeight())     * 45   << endl;
			}
		}

		int xB,xT,yB,yT;
		for (unsigned k=0; k < softDSPs.size(); k++){
			softDSPs[k]->trim(vnme, vmme);
			softDSPs[k]->getTopRightCorner(xT,yT);
			softDSPs[k]->getBottomLeftCorner(xB,yB);
			REPORT(DETAILED, "SOFT DSP Top right = " << xT << ", " << yT << " and bottom left = " << xB << ", " <<yB);
				fig << " 2 2 0 1 0 7 50 -1 19 0.000 0 0 -1 0 0 5 " << endl;
				fig << "	  " <<- (-xB+getExtraWidth()-1)*45 << " " <<- (yT-getExtraHeight())*45 
				         << " " <<- (-xT+getExtraWidth())*45 << " " <<- (yT-getExtraHeight())*45 
				         << " " <<- (-xT+getExtraWidth())*45 << " " <<- (yB-getExtraHeight()+1)*45 
				         << " " <<- (-xB+getExtraWidth()-1)*45 << " " <<- (yB-getExtraHeight()+1)*45 
				         << " " << -(-xB+getExtraWidth()-1)*45 << " " <<- (yT-getExtraHeight())*45 << endl;
			

		}
		
		fig << "		2 2 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 5" << endl;
		fig << "	  " <<- (-wInX)*45 << " " << 0 
		<< " " <<- 0 << " " <<- 0  
		<< " " <<- 0 << " " <<- (wInY)*45 
		<< " " <<- (-wInX)*45 << " " <<- (wInY)*45 
		<< " " <<- (-wInX)*45 << " " <<- 0 << endl;
		fig.close();
	}
	
	
	mpfr_t *IntTruncMultiplier::evalTruncTilingErrorInverted(DSP** configuration, vector<SoftDSP*> softDSPs){
		mpfr_t *fullSum;
		int xB,xT,yB,yT;

		/* fist we get the maximal sum */
		fullSum = evalMaxValue(wX, wY);
		
		/* the error produced by the hard-dsps is subtracted from the sum*/
		if (configuration!=NULL){
			for(int i=0; i<nrDSPs; i++){
				configuration[i]->getTopRightCorner(xT,yT);
				configuration[i]->getBottomLeftCorner(xB,yB);
//				REPORT(DEBUG, "Fetched tile having xT="<<xT<<" yT="<<yT<<" xB="<<xB<<" yB="<<yB);
				convertCoordinates(xT,yT,xB,yB);
//				REPORT(DEBUG, "Same tile after coordinate transformation xT="<<xT<<" yT="<<yT<<" xB="<<xB<<" yB="<<yB);

				int power = xT + yT;
				mpfr_t* currentSum;
				currentSum = evalMaxValue(xB - xT + 1, yB - yT + 1);
				
				mpfr_t s;
				mpfr_init2(s, 1000);
				mpfr_set_ui( s, 2, GMP_RNDN);
				mpfr_pow_si( s, s, power, GMP_RNDN);
				mpfr_mul( *currentSum, *currentSum, s, GMP_RNDN);
				mpfr_sub( *fullSum, *fullSum, *currentSum, GMP_RNDN);
				mpfr_clear(*currentSum);
				free(currentSum);
				mpfr_clear(s);
			}
		}
		
		/* the error produced by the soft-dsps is subtracted from the sum*/
		for (unsigned k=0; k < softDSPs.size(); k++){
			softDSPs[k]->trim(vnme, vmme);
			softDSPs[k]->getTopRightCorner(xT,yT);
			softDSPs[k]->getBottomLeftCorner(xB,yB);
			convertCoordinates(xT,yT,xB,yB);
			
			int power = xT + yT;
			mpfr_t* currentSum;
			if ((xB>=xT) && (yB >=yT))
				currentSum = evalMaxValue(xB - xT + 1, yB - yT + 1);
			else{
				currentSum = (mpfr_t *) malloc( sizeof( mpfr_t));
				mpfr_init2( *currentSum, 1000);
				mpfr_set_si( *currentSum, 0, GMP_RNDN); 
			}
			
			mpfr_t s;
			mpfr_init2(s, 1000);
			mpfr_set_ui( s, 2, GMP_RNDN);
			mpfr_pow_si( s, s, power, GMP_RNDN);
			mpfr_mul( *currentSum, *currentSum, s, GMP_RNDN);
			mpfr_sub( *fullSum, *fullSum, *currentSum, GMP_RNDN);
			mpfr_clear(*currentSum);
			free(currentSum);
			mpfr_clear(s);
		}
		
		if (sign){
			//the removed bits might have an negative influence as well, therefore they have double amplitude
			mpfr_mul_si( *fullSum, *fullSum, 2, GMP_RNDN);	
		}
		
		return fullSum;
	}
	
	mpfr_t* IntTruncMultiplier::evalMaxValue(int w, int h){
		mpfr_t *l, *r;
		l = (mpfr_t *) malloc( sizeof( mpfr_t) );
		r = (mpfr_t *) malloc( sizeof( mpfr_t) );
		mpfr_init2( *l, 1000);
		mpfr_set_ui( *l, 2, GMP_RNDN);
		mpfr_pow_ui( *l, *l, w, GMP_RNDN);
		mpfr_add_si( *l, *l, -1, GMP_RNDN);
		mpfr_init2( *r, 1000);
		mpfr_set_ui( *r, 2, GMP_RNDN);
		mpfr_pow_ui( *r, *r, h, GMP_RNDN);
		mpfr_add_si( *r, *r, -1, GMP_RNDN);
		mpfr_mul( *l, *l, *r, GMP_RNDN);
		mpfr_clear(*r);
		free(r);
		return l; 
	}		


	/** The movement of the DSP blocks with values belonging to their widths and
	heights still needs to be done. Now it only runs with one type of move on
	one of the directions, which is not ok for the cases when the DSPs are not
	squares. */
	void IntTruncMultiplier::tilingAlgorithm(int i, int n,bool repl,int lastMovedDSP)
	{

		if(i==n)
			{
				
				if(repl==true) // if previous DSPs were moved this one needs to recompute all positions 
					{
						if(replace(globalConfig,i)) // repostioned the DSP
							{
								compareCost();
								finish = (clock() - start)/(CLOCKS_PER_SEC*60);
								if (finish > maxTimeInMinutes)
									return;
								rot[i]=false;
								tilingAlgorithm(i,n,false,lastMovedDSP);	
							}
						else // could not reposition the DSP in the bounds of the tiling board
							{
								rot[i]=false;
								if( lastMovedDSP>=0) // go one level up the backtracking stack
								{
									finish = (clock() - start)/(CLOCKS_PER_SEC*60);
									if (finish > maxTimeInMinutes)
										return;
									tilingAlgorithm(lastMovedDSP,n,false, lastMovedDSP);
								}
							}
					}
				else // the last DSP is being moved on the tiling board
					{
						if(move(globalConfig,i)) // successfuly moved the last block
							{
								compareCost();
								finish = (clock() - start)/(CLOCKS_PER_SEC*60);
								if (finish > maxTimeInMinutes)
									return;
								tilingAlgorithm(i,n,repl,i);		//repl should be false
							}
 						else // could not find a position for the last block
							{
								if(rot[i]==false && (globalConfig[i]->getMaxMultiplierWidth() != globalConfig[i]->getMaxMultiplierHeight() ))
									{ // if the DSP was not rotated and is not sqare then roteate it
										globalConfig[i]->rotate();
										rot[i]=true;
										if(replace(globalConfig,i)) // the DSP could be repositioned
											{
												compareCost();
												finish = (clock() - start)/(CLOCKS_PER_SEC*60);
												if (finish > maxTimeInMinutes)
													return;
												tilingAlgorithm(i,n,repl,i);		//repl should be false
											}
										else // go to the previous block 
											{
												if(i-1>=0)
												{	
													finish = (clock() - start)/(CLOCKS_PER_SEC*60);
													if (finish > maxTimeInMinutes)
														return;
													tilingAlgorithm(i-1,n,false,i);
												}
											}
									}
								else // the DSP was either rotated already or is square
									{
										if(i-1>=0)
										{	
											finish = (clock() - start)/(CLOCKS_PER_SEC*60);
											if (finish > maxTimeInMinutes)
												return;
											tilingAlgorithm(i-1,n,repl,i);		//repl should be false
										}
									}
							}
					}
			}
		else // we are not at the last DSP
			{
				if(repl==true) // the previuos DSPs were successfuly repositioned
					{
						if(replace(globalConfig,i)) // the current DSP was successfuly repositioned
							{
								rot[i]=false;
								finish = (clock() - start)/(CLOCKS_PER_SEC*60);
								if (finish > maxTimeInMinutes)
										return;
								tilingAlgorithm(i+1,n,repl, lastMovedDSP);
							}
						else // the current DSP could not be repositioned
							{// go to the DSP block that was moved (not repostioned) the last time
								rot[i]=false;
								if( lastMovedDSP>=0) 
								{
									finish = (clock() - start)/(CLOCKS_PER_SEC*60);
									if (finish > maxTimeInMinutes)
										return;
									tilingAlgorithm( lastMovedDSP,n,false, lastMovedDSP);
								}
							}
			
		
					}
				else // the folling DSP could not be moved or repositioned 
					{	
						if(move(globalConfig,i)) // the current DSP was successfuly moved
							{
								if(i==0){
									REPORT(DETAILED,"DSP #1 has made another step!");
								}
								finish = (clock() - start)/(CLOCKS_PER_SEC*60);
								if (finish > maxTimeInMinutes)
										return;
								tilingAlgorithm(i+1,n,true,i);
							}
						else // the current DSP was not moved successfuly
							{
								if(rot[i]==false && (globalConfig[i]->getMaxMultiplierWidth() != globalConfig[i]->getMaxMultiplierHeight() ))
									{// if the DSP was not rotated and is not sqare then roteate it
										globalConfig[i]->rotate();
										if(replace(globalConfig,i)) // the current DSP was successfuly repositioned
											{
												finish = (clock() - start)/(CLOCKS_PER_SEC*60);
												if (finish > maxTimeInMinutes)
													return;
												rot[i]=true;
												tilingAlgorithm(i+1,n,true,i);
											}
										else // the current DSP was not successfuly repositioned
											{
												if(i-1>=0)
												{
													finish = (clock() - start)/(CLOCKS_PER_SEC*60);
													if (finish > maxTimeInMinutes)
														return;
													tilingAlgorithm(i-1,n,repl,i);
												}
											}
									}
								else // the DSP is either square or has been already rotated
									{
										if(i-1>=0)
										{
											finish = (clock() - start)/(CLOCKS_PER_SEC*60);
											if (finish > maxTimeInMinutes)
												return;
											tilingAlgorithm(i-1,n,repl,i);		//repl should be false
										}
									}
							}
					}
			}
	}

	void IntTruncMultiplier::runAlgorithm()
	{	
		int n=vn;
		int m=vm;

		mat = new int*[m];
		for(int i=0;i<m;i++)
			{
				mat[i] = new int [n];
				for(int j=0;j<n;j++)
					mat[i][j]=0;
			}
		target_->getDSPWidths(dspWidth,dspHeight);
		
		//if the estimated number of DSPs is grather then 0 then we should run the algorithm
		if(nrDSPs>0){
			tempc= new DSP*[nrDSPs];
			for(int ii=0;ii<nrDSPs;ii++)
				tempc[ii]= new DSP();
			
			/*we will try the algorithm with 2 values of nrDSPs	
			One will be the estimated value(nrDSPs) and the second one will be nrDSPs-1	
			*/
			rot = new bool[nrDSPs];
			for(int i =0;i<nrDSPs;i++)
				rot[i]=false;
		
			//The second
			numberDSP4Overlap=nrDSPs;
			initTiling(globalConfig, nrDSPs);
			REPORT(DEBUG, "NRDSPs = " << nrDSPs);
			//this will initialize the bestConfig with the first configuration
			bestCost = FLT_MAX ;
			REPORT(INFO, "Max score is" << bestCost);
			//bestConfig = (DSP**)malloc(nrDSPs * sizeof(DSP*));
			bestConfig = new DSP*[nrDSPs];
			for(int i=0;i<nrDSPs;i++)
				bestConfig[i]= new DSP();
			compareCost();
			REPORT(INFO,"New best score is"<<bestCost);
			/* the best configuration should be considered initially the first
			one. So the bestConfig parameter will be initialized with global
			config and hence the bestCost will be initialized with the first
			cost */
		
			//the one
			numberDSP4Overlap = nrDSPs;
			tilingAlgorithm(nrDSPs-1,nrDSPs-1,false,nrDSPs-1);
			
			// remove DSP blocks that are outside the tiling grid
			DSP** tempc = new DSP*[nrDSPs];
			memcpy(tempc, bestConfig, nrDSPs*sizeof(DSP*));
			int newNrDSPs=0;
			for (int i=0; i<nrDSPs; i++)
			{
				int trx1, try1, blx1, bly1; 	// coordinates of the two corners of a DSP block 
				tempc[i]->getTopRightCorner(trx1, try1);
				tempc[i]->getBottomLeftCorner(blx1, bly1);
				if (trx1 < vnme && try1 < vmme)
				{
					bestConfig[newNrDSPs] = tempc[i];
					newNrDSPs++;
				}
			}
			
			nrDSPs = newNrDSPs;
			
			//bindDSPs(bestConfig);
			vector<SoftDSP*> configSoft;
			if (useLimits == 0)
				configSoft = insertSoftDSPs(bestConfig);
			else
				configSoft = insertSoftDSPswithLimits(bestConfig);
			
			displayAll(bestConfig, configSoft);
			printConfiguration(bestConfig, configSoft);
			REPORT(INFO, "Best cost is "<<bestCost);
			generateVHDLCode(bestConfig, configSoft);
			
			/* After all configurations with the nrDSPs number of DSPs were
			evaluated then a new search is carryed with one DSP less */
			/* After the initialization of the new configuration with nrDSPs-1,
			the cost must be evaluated and confrunted with the best score
			obtained so far. */
		}
		else
		{
			n=vn;
			m=vm;
	
			mat = new int*[m];
			for(int i=0;i<m;i++)
			{
				mat[i] = new int [n];
				for(int j=0;j<n;j++)
					mat[i][j]=0;
			}
			tempc= new DSP*[0];
			bestConfig = new DSP*[1];
			globalConfig = new DSP*[1];
			tempc[0]=bestConfig[0]=globalConfig[0]=NULL;
			
			bestCost = FLT_MAX ;
			REPORT(DEBUG, "Max score is"<<bestCost);
			compareCost();
			REPORT(DEBUG, "New best score is" <<bestCost);
			vector<SoftDSP*> configSoft;
			if (useLimits == 0)
				configSoft = insertSoftDSPs(bestConfig);
			else
				configSoft = insertSoftDSPswithLimits(bestConfig);
			
			printConfiguration(bestConfig, configSoft);
			generateVHDLCode(bestConfig, configSoft);
			displayAll(bestConfig, configSoft);
		}
	
	}
	
	bool IntTruncMultiplier::compareOccupation(DSP** config)
	{
		int totalSize = wInX * wInY;
		int sizeBest = totalSize;
		int sizeConfig = totalSize;
		int c1X,c2X,c1Y,c2Y;
		int nj,ni,njj,nii;
		int ii,jj,i,j;
		int n,m;
		n=vm;
		m=vm;
	
		int nmew = n-getExtraWidth();
		int ew = getExtraWidth();
		int mmeh = m - getExtraHeight() ;
		int eh = getExtraHeight();
	
		for(int ti=0;ti<nrDSPs;ti++)
			if(config[ti]!=NULL)
				{
					config[ti]->getTopRightCorner(c1X,c1Y);
					config[ti]->getBottomLeftCorner(c2X,c2Y);
					c1X=n-c1X-1;
					c2X=n-c2X-1;
					j = c2X;
					i = c1Y;
					jj = c1X;
					ii = c2Y;
					if( j>= nmew || jj< ew || i >= mmeh || ii < eh)
						{
							nj=ni=njj=nii=0;
						}
					else
						{
							if( j < getExtraWidth() )
								nj = getExtraWidth() ;
							else
								nj = j;
							if( jj >= n - getExtraWidth() )
								njj = n -getExtraWidth() -1;
							else
								njj = jj;
							
							if( i < getExtraHeight() )
								ni = getExtraHeight() ;
							else
								ni = i;
							if( ii >= m - getExtraHeight() )
								nii = m -getExtraHeight() -1;
							else
								nii = ii;
							sizeConfig-=(njj-nj+1)*(nii-ni+1);
						}
				}
		for(int ti=0;ti<nrDSPs;ti++)
			if(bestConfig[ti]!=NULL)
				{
					bestConfig[ti]->getTopRightCorner(c1X,c1Y);
					bestConfig[ti]->getBottomLeftCorner(c2X,c2Y);
					c1X=n-c1X-1;
					c2X=n-c2X-1;
					j = c2X;
					i = c1Y;
					jj = c1X;
					ii = c2Y;
					if( j>= nmew || jj< ew || i >= mmeh || ii < eh)
						{
							nj=ni=njj=nii=0;
						}
					else
						{
							if( j < getExtraWidth() )
								nj = getExtraWidth() ;
							else
								nj = j;
							if( jj >= n - getExtraWidth() )
								njj = n -getExtraWidth() -1;
							else
								njj = jj;
							
							if( i < getExtraHeight() )
								ni = getExtraHeight() ;
							else
								ni = i;
							if( ii >= m - getExtraHeight() )
								nii = m -getExtraHeight() -1;
							else
								nii = ii;
							sizeBest-=(njj-nj+1)*(nii-ni+1);
							
						}
			
				}
		
		if(sizeBest >= sizeConfig){
			return true;
		}else{
			REPORT( INFO, "New best configuration found");
			return false;
		}
	}

	void IntTruncMultiplier::fillMatrix(int **&matrix,int lw,int lh,int topleftX,int topleftY,int botomrightX,int botomrightY,int value)
	{
		for(int j=topleftX;j<=botomrightX;j++)
			{
				for(int i=topleftY;i<=botomrightY;i++)
					{
						if(j>-1&&i>-1&&i<lh&&j<lw)
							matrix[i][j]=value;
					}
			}
	}

	void IntTruncMultiplier::display(DSP** config)
	{
		int **mat;
		int n,m;
		int count=1;
		n=wInX + 2* getExtraWidth();
		m=wInY + 2* getExtraHeight();
		REPORT(DETAILED, "real width"<<wInX<<"real height"<<wInY);
		REPORT(DETAILED, "width "<<n<<"height "<<m);
		mat = new int*[m];
	
		int nmew = n-getExtraWidth();
		int ew = getExtraWidth();
		int mmeh = m - getExtraHeight() ;
		int eh = getExtraHeight();
		int nj,ni,njj,nii;
		for(int i=0;i<m;i++)
			{
				mat[i] = new int [n];
				for(int j=0;j<n;j++)
					mat[i][j]=0;
			}
		for(int i=0;i<nrDSPs;i++)
			{
				int c1X,c2X,c1Y,c2Y;
			
				config[i]->getTopRightCorner(c1X,c1Y);
				config[i]->getBottomLeftCorner(c2X,c2Y);
				REPORT(DETAILED, "DSP #"<<i+1<<"has toprigh ("<<c1X<<","<<c1Y<<") and botomleft ("<<c2X<<","<<c2Y<<")");
				c1X=n-c1X-1;
				c2X=n-c2X-1;
				fillMatrix(mat,n,m,c2X,c1Y,c1X,c2Y,count);
				count++;			
			}
	
		count++;
		for(int i=0;i<m;i++)
			{
				for(int j=0;j<n;j++)
					{
						if(mat[i][j]==0)
							{
								int ver =0;
								int ii=i,jj=j;
								while(ver<6&&(ii<m-1||jj<n-1))
									{
										if(ver<3)
											{
												if(ver==0||ver==1)
													ii++;
												if(ii>m-1)
													{
														ii=m-1;
														ver=2;							
													}
							
												if(ver==0||ver==2)
													jj++;
							
												if(jj>n-1)
													{
														jj=n-1;
														ver=1;
													}
												for(int k=ii,q=jj;k>i-1&&(ver==0||ver==2);k--)
													if(mat[k][q]!=0)
														{
															if(ver==0)
																ver=1;
															else
																ver=3;
															jj--;
														}
									
												for(int k=ii,q=jj;q>j-1&&(ver==0||ver==1);q--)
													if(mat[k][q]!=0)
														{
															if(ver==0)
																ver=2;
															else
																ver=3;
															ii--;
														}
											}
										else
											{
												if(ver==3||ver==5)
													jj++;
							
												if(jj>n-1)
													{
														jj=n-1;
														ver=4;
													}
												if(ver==3||ver==4)
													ii++;
												if(ii>m-1)
													{
														ii=m-1;
														ver=5;							
													}
												for(int k=ii,q=jj;q>j-1&&(ver==3||ver==4);q--)
													if(mat[k][q]!=0)
														{
															if(ver==3)
																ver=5;
															else
																ver=6;
															ii--;
														}
								
												for(int k=ii,q=jj;k>i-1&&(ver==3||ver==5);k--)
													if(mat[k][q]!=0)
														{
															if(ver==3)
																ver=4;
															else
																ver=6;
															jj--;
														}
												if(ver==5&&jj==n-1)
													ver=6;
												if(ver==4&&ii==m-1)
													ver=6;
											}
									}
								if( j>= nmew || jj< ew || i >= mmeh || ii < eh)
									{
										REPORT(DETAILED, "Partition number "<<count<<" is totally out of the real multiplication bounds. ("<<j<<" , "<<i<<" , "<<jj<<" , "<<ii<<")");
									}
								else
									{
										if( j < getExtraWidth() )
											nj = getExtraWidth() ;
										else
											nj = j;
										if( jj >= n - getExtraWidth() )
											njj = n -getExtraWidth() -1;
										else
											njj = jj;
							
										if( i < getExtraHeight() )
											ni = getExtraHeight() ;
										else
											ni = i;
										if( ii >= m - getExtraHeight() )
											nii = m -getExtraHeight() -1;
										else
											nii = ii;
										REPORT(DETAILED, "Partition number "<<count<<" with bounds. ("<<j<<" , "<<i<<" , "<<jj<<" , "<<ii<<") has now bounds ("<<nj<<" , "<<ni<<" , "<<njj<<" , "<<nii<<")");
									}
						
								REPORT(DETAILED, j<<" "<<i<<" "<<jj<<" "<<ii);
								fillMatrix(mat,n,m,j,i,jj,ii,count);
								count++;
							}
					}
			}
		char af;
		int afi;
		ostringstream tmp;
		
		for(int i=0;i<m;i++)
			{
				if(i==getExtraHeight())
					REPORT(INFO, "");
			

				for(int j=0;j<n;j++)
					{
						if(j==getExtraWidth())
							tmp<<" ";
						if(j==n-getExtraWidth())
							tmp<<" ";
				
						if(mat[i][j]<10)
							afi=mat[i][j];
						else
							afi=mat[i][j]+7;
						af=(int)afi+48;
						
						tmp<<af;
					}
				tmp<<endl;
				if(i==m-getExtraHeight()-1)
					tmp<<endl;
			}
		REPORT(DETAILED, tmp.str() );		

		for(int ii=0;ii<m;ii++)
		   delete [] (mat[ii]);
	
		delete[] (mat);
		

	}

	void IntTruncMultiplier::displayAll(DSP** config, vector<SoftDSP*> softConfig)
	{
		int **mat;
		int n,m;
		int count=1;
		n=wInX + 2* getExtraWidth();
		m=wInY + 2* getExtraHeight();
		REPORT(DETAILED, "real width"<<wInX<<"real height"<<wInY);
		REPORT(DETAILED,"width "<<n<<"height "<<m);
		mat = new int*[m];
	
		int nmew = n-getExtraWidth();
		int ew = getExtraWidth();
		int mmeh = m - getExtraHeight() ;
		int eh = getExtraHeight();
		int nj,ni,njj,nii;
		for(int i=0;i<m;i++)
			{
				mat[i] = new int [n];
				for(int j=0;j<n;j++)
					mat[i][j]=0;
			}
		for(int i=0;i<nrDSPs;i++)
			{
				int c1X,c2X,c1Y,c2Y;
			
				config[i]->getTopRightCorner(c1X,c1Y);
				config[i]->getBottomLeftCorner(c2X,c2Y);
				REPORT(DETAILED,"DSP #"<<i+1<<"has toprigh ("<<c1X<<","<<c1Y<<") and botomleft ("<<c2X<<","<<c2Y<<")");
				c1X=n-c1X-1;
				c2X=n-c2X-1;
				fillMatrix(mat,n,m,c2X,c1Y,c1X,c2Y,count);
				count++;			
			}
			
		for(unsigned i=0;i<softConfig.size();i++)
			{
				int c1X,c2X,c1Y,c2Y;
			
				softConfig[i]->getTopRightCorner(c1X,c1Y);
				softConfig[i]->getBottomLeftCorner(c2X,c2Y);
				REPORT(DETAILED,"DSP #"<<i+1<<"has toprigh ("<<c1X<<","<<c1Y<<") and botomleft ("<<c2X<<","<<c2Y<<")");
				c1X=n-c1X-1;
				c2X=n-c2X-1;
				fillMatrix(mat,n,m,c2X,c1Y,c1X,c2Y,count);
				count++;			
			}
			
		count++;
		for(int i=0;i<m;i++)
			{
				for(int j=0;j<n;j++)
					{
						if(mat[i][j]==0)
							{
								int ver =0;
								int ii=i,jj=j;
								while(ver<6&&(ii<m-1||jj<n-1))
									{
										if(ver<3)
											{
												if(ver==0||ver==1)
													ii++;
												if(ii>m-1)
													{
														ii=m-1;
														ver=2;							
													}
							
												if(ver==0||ver==2)
													jj++;
							
												if(jj>n-1)
													{
														jj=n-1;
														ver=1;
													}
												for(int k=ii,q=jj;k>i-1&&(ver==0||ver==2);k--)
													if(mat[k][q]!=0)
														{
															if(ver==0)
																ver=1;
															else
																ver=3;
															jj--;
														}
									
												for(int k=ii,q=jj;q>j-1&&(ver==0||ver==1);q--)
													if(mat[k][q]!=0)
														{
															if(ver==0)
																ver=2;
															else
																ver=3;
															ii--;
														}
											}
										else
											{
												if(ver==3||ver==5)
													jj++;
							
												if(jj>n-1)
													{
														jj=n-1;
														ver=4;
													}
								
								
												if(ver==3||ver==4)
													ii++;
												if(ii>m-1)
													{
														ii=m-1;
														ver=5;							
													}
												for(int k=ii,q=jj;q>j-1&&(ver==3||ver==4);q--)
													if(mat[k][q]!=0)
														{
															if(ver==3)
																ver=5;
															else
																ver=6;
															ii--;
														}
												for(int k=ii,q=jj;k>i-1&&(ver==3||ver==5);k--)
													if(mat[k][q]!=0)
														{
															if(ver==3)
																ver=4;
															else
																ver=6;
															jj--;
														}
												if(ver==5&&jj==n-1)
													ver=6;
												if(ver==4&&ii==m-1)
													ver=6;
											}
									}
								if( j>= nmew || jj< ew || i >= mmeh || ii < eh)
									{
										REPORT(DETAILED,"Partition number "<<count<<" is totally out of the real multiplication bounds. ("<<j<<" , "<<i<<" , "<<jj<<" , "<<ii<<")");
									}
								else
									{
										if( j < getExtraWidth() )
											nj = getExtraWidth() ;
										else
											nj = j;
										if( jj >= n - getExtraWidth() )
											njj = n -getExtraWidth() -1;
										else
											njj = jj;
							
										if( i < getExtraHeight() )
											ni = getExtraHeight() ;
										else
											ni = i;
										if( ii >= m - getExtraHeight() )
											nii = m -getExtraHeight() -1;
										else
											nii = ii;
										REPORT(DETAILED, "Partition number "<<count<<" with bounds. ("<<j<<" , "<<i<<" , "<<jj<<" , "<<ii<<") has now bounds ("<<nj<<" , "<<ni<<" , "<<njj<<" , "<<nii<<")");
									}
						
								REPORT(DETAILED, j<<" "<<i<<" "<<jj<<" "<<ii);
								fillMatrix(mat,n,m,j,i,jj,ii,count);
								count++;
							}
					}
			}
		char af;
		int afi;
		ostringstream tmp;
		for(int i=0;i<m;i++)
			{
				if(i==getExtraHeight())
					tmp<<endl;
			
				for(int j=0;j<n;j++)
					{
						if(j==getExtraWidth())
							tmp<<" ";
						if(j==n-getExtraWidth())
							tmp<<" ";
				
						if(mat[i][j]<10)
							afi=mat[i][j];
						else
							afi=mat[i][j]+7;
						af=(int)afi+48;
						tmp<<af;
					}
				tmp<<endl;
				if(i==m-getExtraHeight()-1)
					tmp<<endl;
			}
		REPORT(DETAILED, tmp.str());		

		for(int ii=0;ii<m;ii++)
		   delete [] (mat[ii]);
	
		delete[] (mat);
		
		
	
	}

	int IntTruncMultiplier::partitionOfGridSlices(DSP** config,int &partitions)
	{
		//~ cout<<"Incepe"<<endl;
		int costSlice=0;
	
		int n,m;
		int count=1;
		n=vn;
		m=vm;
	
		int nmew = vnme;
		int ew = getExtraWidth();
		int mmeh = vmme;
		int eh = getExtraHeight();
		int nj,ni,njj,nii;
		for(int i=0;i<m;i++)
			{
			
				for(int j=0;j<n;j++)
					mat[i][j]=0;
			}
		for(int i=0;i<nrDSPs;i++)
			{
				int c1X,c2X,c1Y,c2Y;
			
				config[i]->getTopRightCorner(c1X,c1Y);
				config[i]->getBottomLeftCorner(c2X,c2Y);
				c1X=n-c1X-1;
				c2X=n-c2X-1;
			
				fillMatrix(mat,n,m,c2X,c1Y,c1X,c2Y,count);
				count++;			
			}
		partitions = 0;
		for(int i=0;i<m;i++)
			{
				for(int j=0;j<n;j++)
					{
						if(mat[i][j]==0)
							{
								int ver =0;
								int ii=i,jj=j;
								while(ver<6&&(ii<m-1||jj<n-1))
									{
										if(ver<3)
											{
												if(ver==0||ver==1)
													ii++;
												if(ii>m-1)
													{
														ii=m-1;
														ver=2;							
													}
							
												if(ver==0||ver==2)
													jj++;
							
												if(jj>n-1)
													{
														jj=n-1;
														ver=1;
													}
												for(int k=ii,q=jj;k>i-1&&(ver==0||ver==2);k--)
													if(mat[k][q]!=0)
														{
															if(ver==0)
																ver=1;
															else
																ver=3;
															jj--;
														}
												for(int k=ii,q=jj;q>j-1&&(ver==0||ver==1);q--)
													if(mat[k][q]!=0)
														{
															if(ver==0)
																ver=2;
															else
																ver=3;
															ii--;
														}
											}
										else
											{
												if(ver==3||ver==5)
													jj++;
							
												if(jj>n-1)
													{
														jj=n-1;
														ver=4;
													}
												if(ver==3||ver==4)
													ii++;
												if(ii>m-1)
													{
														ii=m-1;
														ver=5;							
													}
												for(int k=ii,q=jj;q>j-1&&(ver==3||ver==4);q--)
													if(mat[k][q]!=0)
														{
															if(ver==3)
																ver=5;
															else
																ver=6;
															ii--;
														}
												for(int k=ii,q=jj;k>i-1&&(ver==3||ver==5);k--)
													if(mat[k][q]!=0)
														{
															if(ver==3)
																ver=4;
															else
																ver=6;
															jj--;
														}
												if(ver==5&&jj==n-1)
													ver=6;
												if(ver==4&&ii==m-1)
													ver=6;
								
											}
									}
								if( j>=nmew || jj< ew || i >= mmeh || ii < eh)
									{
							
									}
								else
									{
										if( j < ew )
											nj = ew ;
										else
											nj = j;
										if( jj >=nmew )
											njj = nmew -1;
										else
											njj = jj;
							
										if( i < eh )
											ni = eh ;
										else
											ni = i;
										if( ii >=mmeh)
											nii = mmeh -1;
										else
											nii = ii;
							
										partitions++;
										//cout << "IntMultiplierCost ("<<nj<<", "<<njj<<") ("<<ni<<", "<<nii<<") cost="<< target_->getIntMultiplierCost(njj-nj+1,nii-ni+1) << endl;
										costSlice += target_->getIntMultiplierCost(njj-nj+1,nii-ni+1);//(njj-nj+1)*(nii-ni+1);
									}
								fillMatrix(mat,n,m,j,i,jj,ii,count);
								count++;
							}
					}
			}
		return costSlice;
	}	
	
	int IntTruncMultiplier::bindDSPs4Virtex(DSP** &config)
	{
		int nrOfUsedDSPs = 0;
		int xTopCurrentDSP, yTopCurrentDSP;
		int tilingBoardExtX = vnme;
		int tilingBoardExtY = vmme;
		
		for(int i=0; i<nrDSPs; i++){
			config[i]->getTopRightCorner(xTopCurrentDSP, yTopCurrentDSP);
			if ( (config[i] != NULL ) && (xTopCurrentDSP < tilingBoardExtX && yTopCurrentDSP < tilingBoardExtY)){  
				nrOfUsedDSPs++;
			}
		}
		DSP* ref;
		sortDSPs(config);

		int itx,ity, jtx,jty;
			
		int count;
		for(int i=0; i<nrDSPs; i++){
			if((config[i]!=NULL) && (config[i]->getShiftOut()==NULL)){
				ref = config[i];
				count = ref->getNrOfPrimitiveDSPs();
				
				bool ver = true;
				int rw, rh;
				int shiftAmount;
				while(ver == true && ref->getShiftOut()==NULL && count < nrOfShifts4Virtex){
					ver = false;
					/* fetched real DSP coordinates (on the inverted board */
					ref->getBottomLeftCorner(itx, ity);
					itx = tilingBoardExtX-itx;
					ity = tilingBoardExtY-ity;
					
					rw = ref->getMaxMultiplierWidth();
					rh = ref->getMaxMultiplierHeight();
			
					for(int j=0; j< nrDSPs && ver==false; j++){
						/* try to bind DSPs to this chain*/
						if (config[j]!=NULL && j!=i && count+config[j]->getNrOfPrimitiveDSPs()<=nrOfShifts4Virtex){
							/* top right corner coordinates on the real board */
							config[j]->getBottomLeftCorner(jtx, jty);
							jtx = tilingBoardExtX - jtx;
							jty = tilingBoardExtY - jty;
							
							if (jtx <= tilingBoardExtX && jty < tilingBoardExtY){
							/* if the DSP is in the bounds of the real board */
								shiftAmount = 17; 
								if ( (jtx + jty == itx + ity) && config[j]->getShiftIn()==NULL){
									REPORT(DETAILED, "DSP #"<<i<<" bind with DSP #"<<j<<"on direct line");
									ver = true;
									ref->setShiftOut(config[j]);
									config[j]->setShiftIn(ref);
									nrOfUsedDSPs--;
									ref = config[j];
									count += ref->getNrOfPrimitiveDSPs();
								}else if (jtx + jty - itx - ity == shiftAmount && config[j]->getShiftIn()==NULL) {
									/* this is the binding condition */
									REPORT(DETAILED, "DSP #"<<i<<" bind with DSP #"<<j<<" on shift line");
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

	
	/* sort the DSP blocks in the config list according to their Top corner coordinates */
	void IntTruncMultiplier::sortDSPs(DSP** &config){
		int ix,iy,jx,jy;
		DSP* temp;
		for(int i=0; i< nrDSPs-1;i++){		
			for(int j=i+1;j<nrDSPs;j++){
				config[i]->getTopRightCorner(ix,iy);
				config[j]->getTopRightCorner(jx,jy);
				if (iy + ix <= jy + jx)  {
					temp      = config[i];
					config[i] = config[j];
					config[j] = temp;				
				}
			}
		}
	}

	int IntTruncMultiplier::bindDSPs(DSP** &config){
		if (target_->getVendor()=="Xilinx"){
			return bindDSPs4Virtex(config);
		}else if (target_->getVendor()=="Altera"){
			return bindDSPs4Stratix(config);
		}else{
			/* just Xilinx and Altera FPGAs are supproted for the moment */
			throw("just Xilinx and Altera FPGAs are supproted for the moment");
		}
	}

	void IntTruncMultiplier::compareCost()
	{
		for(int ii=0;ii<nrDSPs;ii++)
			memcpy(tempc[ii],globalConfig[ii],sizeof(DSP) );
		
		float temp = computeCost(tempc);
		
		if(temp < bestCost)
			{
				bestCost=temp;
				REPORT(INFO,"New best score is"<<bestCost);
				for(int ii=0;ii<nrDSPs;ii++)
					memcpy(bestConfig[ii],globalConfig[ii],sizeof(DSP) );
			}
		else
			if(temp == bestCost )
				{
					if(compareOccupation(tempc)==true)
						{
							bestCost=temp;
							REPORT(INFO,"Interchange for same cost. New best score is"<<bestCost);
							for(int ii=0;ii<nrDSPs;ii++)
								memcpy(bestConfig[ii],globalConfig[ii],sizeof(DSP) );
						}
				}
	}

	float IntTruncMultiplier::computeCost(DSP** &config)
	{
		float acc=0.0;
		//costLUT = ( (1.0+scale) - scale * (1-ratio) ) /  ((float)100);
	
		REPORT(DETAILED,"Cost of a DSP is "<<costDSP<<endl<<"Cost of a Slice is "<<costLUT);
	
		int nrOfUsedDSPs=0;
		
		for(int i=0;i<nrDSPs;i++)
			if(config[i]!=NULL)
				{
					int nrPrimitiveDSPs = config[i]->getNrOfPrimitiveDSPs();
					if (isSquarer)
					{
						int trx1, try1, blx1, bly1; 
						config[i]->getTopRightCorner(trx1, try1);
						config[i]->getBottomLeftCorner(blx1, bly1);
						convertCoordinates(trx1, try1, blx1, bly1);
						int wh = blx1-try1+1;
						int width = blx1-trx1;
						int height = bly1-try1;
						
						if ((blx1 >= try1) && (((try1-trx1)!=0) || ((blx1-bly1)!=0) || (width != height)))
						{ // the block is over the secondary diagonal result is multiplied by 2
							
							acc += target_->getIntMultiplierCost(wh, wh);
						}
					}
					nrOfUsedDSPs += nrPrimitiveDSPs;
				}
		
		REPORT(DETAILED, "Number of used DSP blocks is "<<nrOfUsedDSPs);
		REPORT(DETAILED, "IntMultiplierCost for subtraction = "<< acc);
		vector<SoftDSP*> configSoft;
		if(useLimits==0)
			configSoft = insertSoftDSPs(config);
		else
			configSoft = insertSoftDSPswithLimits(config);
		
		int partitions = (int)configSoft.size();
		float LUTs4Multiplication =  0;
		int stx, sty, sbx, sby;
		
		for (int i=0; i<partitions; i++)
		{
			configSoft[i]->getTopRightCorner(stx,sty);
			configSoft[i]->getBottomLeftCorner(sbx,sby); 
			LUTs4Multiplication += target_->getIntMultiplierCost(sbx-stx+1, sby-sty+1);
		}
		
		// empty old configuration
		int configSize = configSoft.size();
		for (int i=0; i<configSize; i++)
			delete configSoft[i];
		configSoft.clear();
		//cout<<"Number of slices 4 multiplication of the rest is "<<LUTs4Multiplication<<endl;
		
		acc +=((float)nrOfUsedDSPs)*costDSP + costLUT * LUTs4Multiplication;
		
		REPORT(DEBUG, "Accum = " << acc);
		REPORT(DEBUG, "Number of partitions for LUTs is "<<partitions);
		nrOfUsedDSPs = bindDSPs(config);
		REPORT(DEBUG, "Number of operands coming from DSPs is "<<nrOfUsedDSPs);
		
	
		float LUTs4NAdder=((float)target_->getIntNAdderCost(wInX + wInY,nrOfUsedDSPs+partitions) );
		//float LUTs4NAdder=((float)200);
				
				
	
		REPORT(DEBUG, "LUTs used for last "<<nrOfUsedDSPs+partitions<<" adder are"<<LUTs4NAdder);
		
		acc +=  LUTs4NAdder* costLUT;	
		REPORT(DEBUG, "Accum = " << acc );
		
		//~ Substracting the cost of different additions that can be done in DSPs(Virtex) or the cost of a DSP if they can be combined(Altera)
		
		
		return acc;
			
	}

	int IntTruncMultiplier::estimateDSPs()
	{
		ratio=((ratio>1)?1:ratio);
		float t1,t2, t3, t4;
		int Xd, Yd; //the dimension of the multiplier on X and on Y
		bool fitMultiplicaication = true;
		target_->getDSPWidths(Xd,Yd);
		int wInX = vnme-getExtraWidth();
		int wInY = vmme-getExtraHeight();
		int maxDSP, mDSP = target_->getNumberOfDSPs();
		int wInXt = wInX;
		int wInYt = wInY;
		if (wInY > wInX)
		{
			wInYt = wInX;
			wInXt = wInY;
		}
		//~ tempDSP =    int(ceil( t1) * ceil(t2) );
		
		//t1 = wInX*wInY;
		//t2 = Xd*Yd; 
		//tempDSP =    int(ceil(   ((float) t1) / ((float) t2) ));
		t1 = ((float) wInXt) / ((float) Xd);
		t2 = ((float) wInYt) / ((float) Yd);
		t3 = ((float) wInXt) / ((float) Yd);
		t4 = ((float) wInYt) / ((float) Xd);
		if (t1 < 1) // DSP width > multiplication width
		{
			if (t3 < 1) // DSP height > multiplication width
				maxDSP = int (ceil(t4));
			else
				maxDSP = int (ceil(t2));
		}
		else
		{
			if (t2 < 1) // DSP height > multiplication height
				maxDSP = int (ceil(t1));
			else if (t4 < 1) // DSP width > multiplication height
				maxDSP = int (ceil(t3));
			else // none of the above
			{
				int rw = wInXt % Xd;
				int rh = wInXt % Yd;
				
				if ((rw == 0) || (rh == 0))// divide by width or height
					maxDSP = int (ceil(t1)*ceil(t2));
				else if ((rh-Xd) <= 0) // can pad with width
				{
					if ((rw-Yd) <= 0) // can pad with height
					{	
						if ((rw-Yd) >= (rh-Xd)) // pad with height
							maxDSP = int (floor(t1)*ceil(t2)+ceil(t4));
						else // pad with width
							maxDSP = int (floor(t3)*ceil(t4)+ceil(t2));
					}
					else // can't pad with height
						maxDSP = int (floor(t3)*ceil(t4)+ceil(t2));
				}
				else if ((rw-Yd) <= 0) // can pad with height
					maxDSP = int (floor(t1)*ceil(t2)+ceil(t4));
				else
					maxDSP = int (ceil(t1)*ceil(t2));
			}
		}
		int limitDSP = maxDSP;
		/* After estimating the maximal number of DSPs for the entire 
		 * board subtract the number of DSPs not needed to cover the 
		 * part of the tiling board that is of no interest */
		int areaTrunc = 0;
		int areaCommon = 0;
		int areaSq = 0;
		
		// Compute area not needed after truncation
		for(int i=0,j=(wInY-truncationOffset);i<wInX&&j<wInY&&i<truncationOffset;i++,j++)	
			{
				for(int k=j;k<wInY;k++)
				{
					if(k>=0)
						areaTrunc++;
					if(k>(wInX-i))
						areaCommon++;
				}
			}
			
		if(isSquarer)	
		{
			// Area above second diagonal minus max surface of standing out ridges
			areaSq = wInX*wInY/2 - (wInXt/Xd+1)*(Xd*Yd/2);
			maxDSP -= floor((double)areaSq/(Xd*Yd));
			areaTrunc -= areaCommon;
		}
		// (truncationOffset/Xd)*(Xd*Yd/2)
		areaTrunc -= (truncationOffset*Yd/2);
		if (areaTrunc < 0)
			areaTrunc = 0;
			
		maxDSP -= floor((double)areaTrunc/(Xd*Yd));
		
		if(maxDSP > mDSP)
		{
			fitMultiplicaication = false;
			maxDSP = mDSP; //set the maximum number of DSPs to the multiplication size
		}
			
		if (ratio == 1){
			if (! fitMultiplicaication){
				REPORT(INFO, "Warning!!! The number of existing DSPs on this FPGA is not enough to cover the whole multiplication!");
			}
			return maxDSP;
		}else{	
			float scaleDSPs=1.0;
			float temp;
			if(isSquarer || (truncationOffset>0))
			{
				int trCornerMultX = truncationOffset/2;
				int trCornerMultY = truncationOffset - trCornerMultX;
				float intMultCost = float(target_->getIntMultiplierCost(wInX,wInY)-target_->getIntMultiplierCost(trCornerMultX, trCornerMultY));
				temp = (intMultCost * ratio * maxDSP)  /   (float(target_->getEquivalenceSliceDSP()*limitDSP)) ;
				REPORT(DETAILED,"temp= "<<temp);
			}
			else
			{
				if(maxDSP>4)
					scaleDSPs= ((float)maxDSP) / ((float)maxDSP-2);
				temp = ( float(target_->getIntMultiplierCost(wInX,wInY)) * ratio* scaleDSPs)  /   (float(target_->getEquivalenceSliceDSP())) ;
				REPORT(DETAILED,"val calc "<<temp);
			}
			int i_tmp = int(ceil(temp));
			REPORT(DETAILED, " rounded "<<i_tmp);
	
			if(i_tmp > maxDSP){
				if (fitMultiplicaication){
					REPORT(INFO, "Warning!!! The number of estimated DSPs with respect with this ratio of preference is grather then the needed number of DSPs to perform this multiplication!");
				}else{
					REPORT(INFO, "Warning!!! The number of estimated DSPs with respect with this ratio of preference is grather then the total number of DSPs that exist on this board!");
				}
				
				i_tmp = maxDSP;
				//cout<<" final val is(the max dsps) "<<i_tmp<<endl;
			}
	
			return i_tmp ;
		}
	}

	int  IntTruncMultiplier::getExtraHeight()
	{	
		int x,y;	
		target_->getDSPWidths(x,y);
		float temp = ratio * 0.75 * ((float) max(x,y));
		return ((int)temp);
	}
	
	int  IntTruncMultiplier::getExtraWidth()
	{
		int x,y;	
		target_->getDSPWidths(x,y);
		float temp = ratio * 0.75 * ((float) max(x,y));
		return ((int)temp);
	}
	
	bool IntTruncMultiplier::isValidPosition(int xTopCurrentDSP, int yTopCurrentDSP){
		int tilingBoardExtX = vnme;
		int tilingBoardExtY = vmme;		
		
		if ( (xTopCurrentDSP >= tilingBoardExtX) || (yTopCurrentDSP >= tilingBoardExtY)  ) {
			REPORT(DEBUG, "then not in tiling grid bounds" );
			return false;
		}
		return true;
	}

	bool IntTruncMultiplier::checkOverlap(DSP** config, int index)
	{			
		int x,y,w,h;
		h = config[index]->getMaxMultiplierHeight();
		w = config[index]->getMaxMultiplierWidth();
		int poscur = config[index]->getCurrentPosition();
		int posav = config[index]->getAvailablePositions();
		int minY,minX;
		config[index]->getTopRightCorner(minX,minY);
		//~ cout<<index<<" "<< minX<<" "<<minY<<" "<<poscur<<" "<<posav<<" ";
		minX+=w; 
		for(;poscur<posav;poscur++)
		{
			if(minY>config[index]->Ypositions[poscur])
			{
				minY=config[index]->Ypositions[poscur];
				minX=config[index]->Xpositions[poscur];
			}
		}
		//~ cout<<index<<" "<< minX<<" "<<minY<<" ";
		
		config[index]->getBottomLeftCorner(x,y);
		
		
		
		long area = (vn - minX+6) * (vm -minY+6) + w * (vm- y);

		int dsplimittemp = (int)ceil( ((double)area) / dsplimit );
		//I have added +1 to the number of dsps that could be place because when we work with combined dsps there exists the case when an are of a dsp is not added
		if( dsplimittemp+1 < (numberDSP4Overlap -index-1))

			return true;
		
		//return false;
		
		//not used now
		
		int xtr1, ytr1, xbl1, ybl1, xtr2, ytr2, xbl2, ybl2;
		config[index]->getTopRightCorner(xtr1, ytr1);
		config[index]->getBottomLeftCorner(xbl1, ybl1);
	
		bool a1,a2,a3,a4,a5,a6,b1,b2,b3,b4,b5,b6;
	
		REPORT(DEBUG, tab<<tab<<"checkOverlap: ref is block #" << index << ". Top-right is at (" << xtr1 << ", " << ytr1 << ") and Bottom-right is at (" << xbl1 << ", " << ybl1 << ")");
	
		for (int i=0; i<index; i++)
			if (config[i] != NULL)
				{
					config[i]->getTopRightCorner(xtr2, ytr2);
					config[i]->getBottomLeftCorner(xbl2, ybl2);
					if (((xbl1 < xbl2) && (ytr2 > ybl1)) || 	// config[index] is above and to the right of config[i]
						  ((xbl1 < xtr2)))// && (ybl1 < ybl2))) 							// config[index] is to the right of config[i]
						return true;
				
					REPORT(DEBUG, tab << tab << "checkOverlap: comparing with block #" << i << ". Top-right is at (" << xtr2 << ", " << ytr2 << ") and Bottom-right is at (" << xbl1 << ", " << ybl1 << ")");
			
					// the optimisation of the above if
					a1 = (xtr2 <= xbl1);
					a2 = (xtr2 >= xtr1);
					a3 = (xbl2 <= xbl1);
					a4 = (xbl2 >= xtr1);
					a5 = (xbl2 >= xbl1);
					a6 = (xtr1 >= xtr2);
				
					b1 = (ytr2 <= ybl1);
					b2 = (ytr2 >= ytr1);
					b3 = (ybl2 <= ybl1);
					b4 = (ybl2 >= ytr1);
					b5 = (ytr1 >= ytr2);
					b6 = (ybl1 <= ybl2);
				
					if ((((a1 && a2)||(a3 && a4)) && ((b1 && b2)||(b3 && b4))) || 
					    (((a4 && a6)||(a5 && a1)) && ((b6 && b1)||(b4 && b5))) || 
					    (((a5 && b3) && ( b2 && a6)) || ((a3 && b6) && (b5 && a2))))
						return true;
					
				
			
			
				}	
		REPORT(DEBUG, tab << tab << "checkOverlap: return false");	
		return false;
	}

	/**
		There is one case that is not resolved w=yet. For DSP with widths different then height the algorithm should move the dsp with both values
	*/

	bool IntTruncMultiplier::move(DSP** config, int index)
	{
		int xtr1, ytr1, xbl1, ybl1;
		int w, h;
		//target->getDSPWidths(w,h);
		w= config[index]->getMaxMultiplierWidth();
		h= config[index]->getMaxMultiplierHeight();
	
		config[index]->getTopRightCorner(xtr1, ytr1);
		config[index]->getBottomLeftCorner(xbl1, ybl1);
	
		REPORT(DEBUG, tab << "replace : DSP #" << index << " width is " << w << ", height is " << h );
		/*
		 * Initialized in the constructor:
		 * vn = wInX+2*getExtraWidth(); width of the tiling grid including extensions
		 * vm = wInY+2*getExtraHeight(); height of the tiling grid including extensions
		 * */
		int pos; // index for list of positions of a DSP
		
		if(index==0) // the first DSP block can move freely on the tiling grid
			return false;
		else // all DSP blocks except the first one can move only in fixed positions
		{
						do{
							// move to next position
							pos = config[index]->pop();
							if(pos >= 0)
							{
									ytr1 = config[index]->Ypositions[pos];
									ybl1 = ytr1 + h-1;
									xtr1 = config[index]->Xpositions[pos];
									xbl1 = xtr1 + w-1;
							}
							else
								return false;
								
							config[index]->setTopRightCorner(xtr1, ytr1);
							config[index]->setBottomLeftCorner(xbl1, ybl1);
						}while (checkOverlap(config, index));
		}
		return true;
	}

	bool IntTruncMultiplier::replace(DSP** config, int index)
	{
		int xtr1, ytr1, xbl1, ybl1;
		int w, h;
		string targetID = target_->getID();
		
		//target->getDSPWidths(w,h);
		w= config[index]->getMaxMultiplierWidth();
		h= config[index]->getMaxMultiplierHeight();
		config[index]->setPosition(0);
		
		if (index > 1)
		{// take all positions from the previous DSP
			int curpos =config[index-1]->getCurrentPosition();
			int avpos = config[index-1]->getAvailablePositions();
				memcpy(config[index]->Xpositions, config[index-1]->Xpositions + curpos, sizeof(int)*(avpos - curpos));	
				memcpy(config[index]->Ypositions, config[index-1]->Ypositions + curpos, sizeof(int)*(avpos - curpos));	
				config[index]->setPosition((avpos - curpos));
		}
		
		if (index > 0){
			w= config[index-1]->getMaxMultiplierWidth();
			h= config[index-1]->getMaxMultiplierHeight();

			int mind = min(w,h);
			int mindX = mind;
			int mindY = mind;
			
			if (false && (targetID == "Virtex5" || targetID == "Virtex6"))
			{ // align bottom-left corner of current with X-possition of previous to catch ideal case
				mindX = -abs(w-h);
				mindY = h;
			}
			else if ((targetID == "StratixIII") || (targetID == "StratixIV"))
			{ // align on diagonal
				mindX = -w;
				mindY = h;	
			}
			int positionDisplacementX[] = {0, w, mindX};
			int positionDisplacementY[] = {h, 0, mindY};

			int xTopPrevDSP, yTopPrevDSP, xTopCurrentDSP,yTopCurrentDSP, pos;
			config[index-1]->getTopRightCorner(xTopPrevDSP, yTopPrevDSP);
			
			//* Loop unrolling
			bool extraPosition = ((w!=h) || ((targetID == "StratixIII") || (targetID == "StratixIV")));

			for (int i=0; i<3; i++){
				xTopCurrentDSP = xTopPrevDSP + positionDisplacementX[i];
				yTopCurrentDSP = yTopPrevDSP + positionDisplacementY[i];
				if ( isValidPosition(xTopCurrentDSP, yTopCurrentDSP) ) 
					if ( (i!=2) || extraPosition)
					config[index]->push(xTopCurrentDSP, yTopCurrentDSP);
				
			}
			w= config[index]->getMaxMultiplierWidth();
			h= config[index]->getMaxMultiplierHeight();

			config[index]->resetPosition();
			
			do{// go to next position in list
				pos = config[index]->pop();
				if(pos >= 0)
				{
					ytr1 = config[index]->Ypositions[pos];
					ybl1 = ytr1 + h-1;
					xtr1 = config[index]->Xpositions[pos];
					xbl1 = xtr1 + w-1;
				}
				else
				{
					config[index]->setTopRightCorner(vn, vm);
					config[index]->setBottomLeftCorner(vn+w, vm+h);
					return false;
				}
				
				config[index]->setTopRightCorner(xtr1, ytr1);
				config[index]->setBottomLeftCorner(xbl1, ybl1);
			}while (checkOverlap(config, index));
				
			return true;
		}else{	
			/* placing first DSP */
			REPORT(DEBUG, tab << "Placing first DSP");
			int exh = getExtraHeight();
			int exw = getExtraWidth();
		
			xtr1 = exw;
			ytr1 = exh;	
			ybl1 = ytr1 + h-1;
			xbl1 = xtr1 + w-1;
	
			config[index]->setTopRightCorner(xtr1, ytr1);
			config[index]->setBottomLeftCorner(xbl1, ybl1);
		
			REPORT(DEBUG, tab << "replace : DSP width is " << w << ", height is " << h ); 
		}
		return true;
	}

	void IntTruncMultiplier::initTiling(DSP** &config, int dspCount)
	{
		int w,h; 
		target_->getDSPWidths(w, h);
		dsplimit = w*h;
		config = new DSP*[nrDSPs];
		for (int i=0; i<nrDSPs; i++)
			config[i] = NULL;
			
		for (int i=0; i<dspCount; i++){
			REPORT(DETAILED, "initTiling : iteration #" << i );
			config[i] = target_->createDSP();						
			config[i]->setNrOfPrimitiveDSPs(1);
			
			config[i]->allocatePositions(3*i); // each DSP offers 8 positions
			if(!replace(config, i)){
				w= config[i]->getMaxMultiplierWidth();
				h= config[i]->getMaxMultiplierHeight();
				config[i]->setTopRightCorner(vn, vm);
				config[i]->setBottomLeftCorner(vn+w, vm+h);
			}
		}
	}
	
	void IntTruncMultiplier::initTiling2(DSP** &config, int dspCount)
	{
		//nrOfShifts4Virtex =2; 
		int w, h;
		target_->getDSPWidths(w, h);
		int min = h;
		int mw,mh;
		mw = vn - 2*getExtraWidth();
		mh = vm - 2*getExtraHeight();
		if(w < h)
		{
			min = w;
			w = h;
			h = min;
		}	
		
		// allocate the maximum number of DSP objects
		config = new DSP*[nrDSPs];
		for (int i=0; i<nrDSPs; i++)
		{	
			config[i] = NULL;
		}
		
		/* NOTE: In case the multiplication is narrower than twice the minimum dimension of a DSP 
		 * then we do not form paris of multipliers
		 */
		if ((vm < 2*min) || (vn < 2*min))
		{
			for (int i=0; i<dspCount; i++)
			{
				config[i] = target_->createDSP();
				config[i]->setNrOfPrimitiveDSPs(1);
				config[i]->allocatePositions(3*i); // each DSP offers 3 positions
				if(!replace(config, i))
				{
					w=config[i]->getMaxMultiplierWidth();
					h= config[i]->getMaxMultiplierHeight();
					config[i]->setTopRightCorner(vn, vm);
					config[i]->setBottomLeftCorner(vn+w, vm+h);
				}
			}
			dsplimit = w*h;
			return; // force exit
		}
		dsplimit = w*h*2;
		// else form paris
		// verify if we have an even or odd nr of DSPs
		bool singleDSP = false;
		if (nrDSPs % 2 == 1)
			singleDSP = true;
		
		int nrDSPsprim = nrDSPs;
			
		// compute new number of DSPs

		numberDSP4Overlap = dspCount = nrDSPs = (int) ceil((double) dspCount/2);

		
		// set shift amount according to target
		int shift = 0;
		if ((target_->getID() == "Virtex4") || (target_->getID() == "Virtex5"))
			shift = 17;
		
		int start = 0; // starting position
		
		if (dspCount >= 16 &&
			((mw == h*4 || mh ==h*4) ||
			(  (h*0.9 + h*4 <=mw) &&  mh>=2*w  ) ||
			(   (h*0.9 + h*4 <=mh) &&  mw>=2*w  ) ||
			( mw*mh>= h*w*nrDSPsprim )
			)) 
		{ // we have more than 16 paris of multipliers we can group 4 such pairs into a super-block
			REPORT(DEBUG, "A super DSP was created");
			config[start] = new DSP(0, w*2, h*4);
			config[start]->setNrOfPrimitiveDSPs(4);
			config[start]->allocatePositions(3*start); // each DSP offers 3 positions
			if(!replace(config, start))
			{
				int w=config[start]->getMaxMultiplierWidth();
				int h= config[start]->getMaxMultiplierHeight();
				config[start]->setTopRightCorner(vn, vm);
				config[start]->setBottomLeftCorner(vn+w, vm+h);
			}
			start++;
			dspCount -= 3;

			numberDSP4Overlap = nrDSPs = dspCount;

			
			int i;
			for (i=start; i<3; i++)
			{
				config[i] = new DSP(shift, w, h*2);	
				config[i]->setNrOfPrimitiveDSPs(2);
				config[i]->allocatePositions(3*i); // each DSP offers 3 positions
				if(!replace(config, i))
				{
					int w=config[i]->getMaxMultiplierWidth();
					int h= config[i]->getMaxMultiplierHeight();
					config[i]->setTopRightCorner(vn, vm);
					config[i]->setBottomLeftCorner(vn+w, vm+h*2);
				}
			}
			start = i;	
		}

		/*NOTE: if the program entered the previous if clause it will also enter the following 
		 * 	if clause. This is the effect we want to obtain */
		if (dspCount >= 10 		&&
			((mw == h*4 || mh ==h*4) ||
			(  (h*0.9 + h*4 <=mw) &&  mh>=2*w  ) ||
			(   (h*0.9 + h*4 <=mh) &&  mw>=2*w  ) ||
			( mw*mh>= h*w*nrDSPsprim )
			)	
		)
		{ // we have more than 10 paris of multipliers we can group 4 such pairs into a super-block
			REPORT(DEBUG,"A super DSP was created");
			config[start] = new DSP(0, w*2, h*4);
			config[start]->setNrOfPrimitiveDSPs(4);
			config[start]->allocatePositions(3*start); // each DSP offers 3 positions
			dspCount -= 3;
			numberDSP4Overlap = nrDSPs = dspCount;
			if(!replace(config, start))
			{
				int w=config[start]->getMaxMultiplierWidth();
				int h= config[start]->getMaxMultiplierHeight();
				config[start]->setTopRightCorner(vn, vm);
				config[start]->setBottomLeftCorner(vn+w, vm+h);
			}
			start++;

		}
		
		// initialize all DSP paris except first one
		dspCount--;
		for (int i=start; i<dspCount; i++)
		{
			config[i] = new DSP(shift, w, h*2);	
			config[i]->setNrOfPrimitiveDSPs(2);
			config[i]->allocatePositions(3*i); // each DSP offers 3 positions
			if(!replace(config, i))
			{
				int w=config[i]->getMaxMultiplierWidth();
				int h= config[i]->getMaxMultiplierHeight();
				config[i]->setTopRightCorner(vn, vm);
				config[i]->setBottomLeftCorner(vn+w, vm+h*2);
			}
		}
		
		//initializa last DSP or DSP pair
		if (singleDSP) // then the last position is a single DSP 
		{ // allocate single DSP
			config[dspCount] = target_->createDSP();
			config[dspCount]->setNrOfPrimitiveDSPs(1);
			config[dspCount]->allocatePositions(3*dspCount); // each DSP offers 3 positions
			if(!replace(config, dspCount))
			{
				int w=config[dspCount]->getMaxMultiplierWidth();
				int h= config[dspCount]->getMaxMultiplierHeight();
				config[dspCount]->setTopRightCorner(vn, vm);
				config[dspCount]->setBottomLeftCorner(vn+w, vm+h);
			}
			
		}
		else // then the last position is a DSP pair
		{ // allocate DSP pair
			config[dspCount] = new DSP(shift, w, h*2);
			config[dspCount]->setNrOfPrimitiveDSPs(2);
			config[dspCount]->allocatePositions(3*dspCount); // each DSP offers 3 positions
			if(!replace(config, dspCount))
			{
				int w=config[dspCount]->getMaxMultiplierWidth();
				int h= config[dspCount]->getMaxMultiplierHeight();
				config[dspCount]->setTopRightCorner(vn, vm);
				config[dspCount]->setBottomLeftCorner(vn+w, vm+h*2);
			}
			
		}	
		
	}
	
	int IntTruncMultiplier::bindDSPs4Stratix(DSP** config)
	{
		int nrDSPs_ = nrDSPs;
		int DSPcount = nrDSPs_;
	
		for (int i=0; i<nrDSPs_; i++)
			if (config[i] == NULL)
				DSPcount--;
		
			
		for (int i=0; i<DSPcount; i++)
			if (config[i]->getNumberOfAdders() < 3) // serach for an aligned DSP block that can be added with this one
				{
					int xtri, ytri, wx, wy, nrOp;
					bool bound;
					config[i]->getTopRightCorner(xtri, ytri);
					target_->getDSPWidths(wx,wy);
				
					REPORT(DEBUG, "bindDSP4Stratix: DSP #" << i << " has less than 3 operands. Top-right is at ( " << xtri << ", " << ytri << ") width is " << wx );
					DSP** operands;
					DSP** operandsj;
					DSP** opsk;
					for (int j=0; j<DSPcount; j++)
						if (i != j)
							{
								nrOp = config[i]->getNumberOfAdders();
								if (nrOp == 3)
									break;
			
								operands = config[i]->getAdditionOperands();
								bound = false;
								// check if the DSP blocks are bound
								for (int k=0; k<nrOp; k++)
									if (operands[k] == config[j]) // the DSPs are allready bound
										{
											REPORT(DEBUG, "bindDSP4Stratix: DSP #" << j << " has #" << i << " as one of its operands allready." );
											bound = true;
											break;
										}
				
								if (bound)
									continue;
								// if they are not bound
								int xtrj, ytrj, nrOpj;
								config[j]->getTopRightCorner(xtrj, ytrj);
								nrOpj = config[j]->getNumberOfAdders();
				
								REPORT(DEBUG,"bindDSP4Stratix:" << tab << " Checking against DSP #" << j << " Top-right is at ( " << xtrj << ", " << ytrj << ") width is " << wx);
			
								if ((((xtrj-xtri == -wx) && (ytrj-ytri == wy)) || ((xtrj-xtri == wx) && (ytrj-ytri == -wy))) && // if they have the same alignment
									 (nrOpj + nrOp < 3)) // if the DSPs we want to bind have less than 3 other DSPs to add together
									{ // copy the operands from one another and bind them 
					
										REPORT(DEBUG, "bindDSP4Stratix : DSP #" << j << " together with #" << i << " have fewer than 3 operands. We can bind them.");
										operandsj = config[j]->getAdditionOperands();
					
										for (int k=0; k<nrOp; k++)
											{
												operandsj[nrOpj+k] = operands[k];
												// each operand of congif[i] also gets bounded 
												int opcntk = operands[k]->getNumberOfAdders();
												operands[k]->setNumberOfAdders(nrOp+nrOpj+1);
												opsk = operands[k]->getAdditionOperands();
												for (int l=0; l < nrOpj; l++)
													opsk[l+opcntk] = operandsj[l];
												opsk[nrOpj+opcntk] = config[j];
												operands[k]->setAdditionOperands(opsk);
											}
										operandsj[nrOp+nrOpj] = config[i];
										config[j]->setAdditionOperands(operandsj);
										config[j]->setNumberOfAdders(nrOp+nrOpj+1);
					
										for (int k=0; k<nrOpj; k++)
											{
												operands[nrOp+k] = operandsj[k];
												// each operand of congif[j] also gets bounded 
												int opcntk = operandsj[k]->getNumberOfAdders();
												operandsj[k]->setNumberOfAdders(nrOp+nrOpj+1);
												opsk = operandsj[k]->getAdditionOperands();
												for (int l=0; l < nrOp; l++)
													opsk[l+opcntk] = operands[l];
												opsk[nrOp+opcntk] = config[i];
												operandsj[k]->setAdditionOperands(opsk);
											}
										operands[nrOp+nrOpj] = config[j];
										config[i]->setAdditionOperands(operands);
										config[i]->setNumberOfAdders(nrOp+nrOpj+1);
									}
							}
				}
		
		/* We now have:
		 * 	- pairs of DSP objects which have the number of operands set to 1
		 * 	- triplets of DSP objects which have the number of operands set to 2
		 * 	- quadruplets of DSP objects which have the number of operands set to 3 
		 * We keep a counter for each possible number of operands. */
		int pair[3] = {0, 0, 0};
	
	
		for (int i=0; i<DSPcount; i++)
			{
				REPORT(DEBUG, "bindDSP4Stratix : DSP #" << i << " has " << config[i]->getNumberOfAdders() << " adders" );
				pair[config[i]->getNumberOfAdders()-1]++;
			}
			REPORT(DEBUG, "bindDSP4Stratix : one " << pair[0]); 
			REPORT(DEBUG, "bindDSP4Stratix : two " << pair[1]); 
			REPORT(DEBUG, "bindDSP4Stratix : three " << pair[2]);
			
		return (DSPcount - pair[0]/2 - pair[1]*2/3 - pair[2]*3/4);
	}

	DSP** IntTruncMultiplier::splitLargeBlocks(DSP** config, int &numberOfDSPs)
	{
		int h, w, dspH, dspW, tmp, nrDSPonHeight, nrDSPonWidth, shiftAmount, newNrDSPs=0;
		getTarget()->getDSPWidths(dspW, dspH);
		
		// count total number of DSPs
		for (int i=0; i<numberOfDSPs; i++)
		{
			h = config[i]->getMaxMultiplierHeight();
			w = config[i]->getMaxMultiplierWidth();
			
			if ((h % dspH) != 0) // match width and height
			{
				tmp = dspH;
				dspH = dspW;
				dspW = tmp;
			}
			
			nrDSPonHeight = h/dspH;
			nrDSPonWidth = w/dspW;
			
			newNrDSPs += (nrDSPonHeight*nrDSPonWidth);
		}
		
		DSP** returnConfig = new DSP*[newNrDSPs];
		int index = 0;
		int xtr, xbl, ytr, ybl;
		for (int i=0; i<numberOfDSPs; i++)
		{
			h = config[i]->getMaxMultiplierHeight();
			w = config[i]->getMaxMultiplierWidth();
			shiftAmount = config[i]->getShiftAmount();
			config[i]->getTopRightCorner(xtr, ytr);
			config[i]->getBottomLeftCorner(xbl, ybl);
			
			if ((h % dspH) != 0) // match width and height
			{
				tmp = dspH;
				dspH = dspW;
				dspW = tmp;
			}
			
			nrDSPonHeight = h/dspH;
			nrDSPonWidth = w/dspW;
			// create DSP blocks
			for (int j=0; j<nrDSPonHeight; j++)
				for (int k=0; k<nrDSPonWidth; k++)
				{
					returnConfig[index] = getTarget()->createDSP();
					returnConfig[index]->setTopRightCorner(xtr+k*dspW, ytr+j*dspH);
					returnConfig[index]->setBottomLeftCorner(xtr+(k+1)*dspW-1, ytr+(j+1)*dspH-1);
					returnConfig[index]->setMultiplierHeight(dspH);
					returnConfig[index]->setMultiplierWidth(dspW);
					// take care of shiftings between DSPs
					if (shiftAmount == dspH)
					{
						if (j > 0) 
						{
							returnConfig[index]->setShiftIn(returnConfig[index-(j*nrDSPonWidth)]);
							returnConfig[index-(j*nrDSPonWidth)]->setShiftOut(returnConfig[index]);	
						}
					}
					else if (shiftAmount == dspW)
					{
						if (k > 0)
						{
							returnConfig[index]->setShiftIn(returnConfig[index-1]);
							returnConfig[index-1]->setShiftOut(returnConfig[index]);
						}
					}
					index++;
				}
		}
		numberOfDSPs = newNrDSPs;
		return returnConfig;
	}
	
	void IntTruncMultiplier::convertCoordinates(int &tx, int &ty, int &bx, int &by){
		int ax = bx;
		int ay = by;
		bx = vnme - tx-1;
		if (bx >= wInX) bx = wInX-1;
		by = vmme - ty-1;
		if (by >= wInY) by = wInY-1;
		tx = vnme - ax-1;
		if (tx < 0) tx = 0;
		ty = vmme - ay-1;	
		if (ty < 0) ty = 0;
	}

	void IntTruncMultiplier::convertCoordinatesKeepNeg(int &tx, int &ty, int &bx, int &by){
		int ax = bx;
		int ay = by;
		bx = vnme - tx-1;
		by = vmme - ty-1;
		tx = vnme - ax-1;
		ty = vmme - ay-1;	
	}
	
	void IntTruncMultiplier::convertCoordinatesInvertedBoard(int &tx, int &ty, int &bx, int &by){
		int ax = bx;
		int ay = by;
		bx = (vnme + getExtraWidth() ) - tx-1;
		by = (vmme + getExtraHeight()) - ty-1;

		tx = (vnme + getExtraWidth() ) - ax-1;
		ty = (vmme + getExtraHeight()) - ay-1;	
	}

	int IntTruncMultiplier::multiplicationInDSPs(DSP** config)
	{
		int nrOp = 0;		 			// number of resulting adder operands
		int trx1, try1, blx1, bly1; 	// coordinates of the two corners of a DSP block 
		int trx2, try2, blx2, bly2; 	// coordinates of the two corners of a DSP block 

		int fpadX, fpadY, bpadX, bpadY;	// zero padding on both axis
		int multW, multH; 				// width and height of the multiplier the DSP block is using
		int extW, extH;
		ostringstream xname, yname, mname, cname, sname;
		DSP** tempc = new DSP*[nrDSPs];	// buffer that with hold a copy of the global configuration
		int partitions = 0; 			// subtracted operand count	
			
		memcpy(tempc, config, sizeof(DSP*) * nrDSPs );
		
		if ( target_->getVendor() == "Xilinx"){  // then the target is A Xilinx FPGA 
			for (int i=0; i<nrDSPs; i++){
				if (tempc[i] != NULL){
					DSP* d = tempc[i]; // the current DSP that is to be processed
					int j = 0; /* the index of the element in the chain to be processed */
					bool outside = false;
					
					/* chech how many DSPs are there in this chain */
					int connected = 0;
					while (d != NULL){
						connected++;
						d = d->getShiftOut();
					} /* parse the whole chain in order to get the last DSP */
					REPORT(DEBUG, "CONNECTED " << connected);
					d = tempc[i]; /* get back to the initial one */

					setCycle(0);
					setCriticalPath(0);

					int rtXOld = 0, rtYOld = 0;	
					int previousPadding = 0;
					while (d != NULL){
						bool onEdge = false;
						bool onEdgeX = false;
						bool onEdgeY = false;
						
						d->getTopRightCorner(trx1, try1);
						d->getBottomLeftCorner(blx1, bly1);
						
						convertCoordinatesInvertedBoard (trx1, try1, blx1, bly1); 
						REPORT(DEBUG, "coordinates REAL trx="<<trx1<<" try="<<try1<<" blx"<<blx1<<" bly="<<bly1);
						
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
						int nrZeros  = (wInX-1 + (sign?1:0) ) - bounded_bX +  (wInY-1 + (sign?1:0)) - bounded_bY;
					
						
						
						/* just in case check that this tile is not outside the area of interest */
						if ((startX < endX) || (startY < endY)) {
							outside = true;
							break;
						}
						
						if ((wX == rbX+1) && (sign))
							onEdgeX = true;
						if ((wY == rbY+1) && (sign))
							onEdgeY = true;

						onEdge = onEdgeX || onEdgeY; //if the block is on the edge it must be sign extended
					
						/* this is where the DSP-part of the multiplier code gets generated; TODO: bring to new standard so it gets less levels of pipeline */
						setCycle(0);

						if (!onEdgeX)					
							vhdl << tab << declare(join("x",i,"_",j), multW+1) << " <= \"0\" & " << zg(fpadX,0) << " & X" << range(startX, endX) << " & " << zg(bpadX,0) << ";" << endl;
						else
							vhdl << tab << declare(join("x",i,"_",j), multW+1) << " <= " << rangeAssign(fpadX-1, 0, "X"+of(startX+1)) << " & X"<< range(startX+1, endX) << " & " << zg(bpadX,0) << ";" << endl;

						if (!onEdgeY)					
							vhdl << tab << declare(join("y",i,"_",j), multH+1) << " <= \"0\" & " << zg(fpadY,0) << " & Y" << range(startY, endY) << " & " << zg(bpadY,0) << ";" << endl;
						else
							vhdl << tab << declare(join("y",i,"_",j), multH+1) << " <=" << rangeAssign(fpadY-1, 0, "Y"+of(startY+1)) << " & Y" << range(startY+1, endY) << " & " << zg(bpadY,0) << ";" << endl;
						

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
								if (!sign)
									vhdl << tab << declare(join("pxy",i,j), multW+multH+2) << " <= (" << join("txy",i,j)<<range(multW+multH+1,0) << ") + (" <<zg(d->getShiftAmount(),0)<< " &" << join("pxy",i,j-1) << range(multW+multH+1, d->getShiftAmount()) << ");" << endl;
								else
									vhdl << tab << declare(join("pxy",i,j), multW+multH+2) << " <= (" << join("txy",i,j)<<range(multW+multH+1,0) << ") + (" <<rangeAssign(d->getShiftAmount()-1,0, join("pxy",i,j-1)+of(multW+multH+1))<< " &" << join("pxy",i,j-1) << range(multW+multH+1, d->getShiftAmount()) << ");" << endl;	
						
							if (d->getShiftOut() == NULL){ 
								/* concatenate the entire partial product */
								setCycle(connected);
								sname.seekp(ios_base::beg);
								if (!sign)
									sname << zg(nrZeros) << " & " << join("pxy",i,j) << range(multW+multH - fpadX - fpadY - 1, min(bpadX + bpadY, max(0,previousPadding - d->getShiftAmount()))) << " & " << sname.str();
								else{
									if  (rtX+rtY == rtXOld+rtYOld) 
										sname << rangeAssign(nrZeros-2,0, join("pxy",i,j)+of(multW+multH + 1 - fpadX - fpadY - 1)) << " & " << join("pxy",i,j) << range(multW+multH + 1 - fpadX - fpadY - 1, min(bpadX + bpadY, previousPadding)) << " & " << sname.str();
									else 
										sname << rangeAssign(nrZeros-2,0, join("pxy",i,j)+of(multW+multH + 1 - fpadX - fpadY - 1)) << " & " << join("pxy",i,j) << range(multW+multH + 1 - fpadX - fpadY - 1, min(bpadX + bpadY, max(0,previousPadding - d->getShiftAmount()))) << " & " << sname.str();
								}
							} else { // concatenate only the lower portion of the partial product
								setCycle(connected);
								sname.seekp(ios_base::beg);

								int trx2,try2,blx2,bly2;
								d->getShiftOut()->getTopRightCorner  (trx2, try2);
								d->getShiftOut()->getBottomLeftCorner(blx2, bly2);
								convertCoordinatesInvertedBoard(trx2, try2, blx2, bly2); 
							
								int rtXNext = trx2 - extW;
								int rtYNext = try2 - extH;

								if (rtX + rtY != rtXNext + rtYNext) 
									sname << join("pxy",i,j) << range( min(tileSize, d->getShiftAmount())-1, min(bpadX + bpadY, max(0, previousPadding - ( rtX+rtY == rtXOld+rtYOld?0:17)) )) << " & " << sname.str();
							}
						}else{ // only multiplication
							vhdl << tab << declare(join("pxy",i,j), multW+multH+2) << " <= " << join("x",i,"_",j)<<range(multW,0) << " * " <<join("y",i,"_",j)<<range(multH,0) << "; --0" << endl;
							sname.str("");
							if (d->getShiftOut() == NULL){ // concatenate the entire partial product
								if (!onEdge)
									sname << zg(nrZeros) << " & " << join("pxy",i,j) << range(tileSize + bpadX+bpadY -1, bpadX+bpadY) << " & " << zg(bounded_tX + bounded_tY - minShift) << "; --1" << endl;
								else
									sname << rangeAssign(nrZeros-1,0, join("pxy",i,j)+of(tileSize + bpadX+bpadY -1)) << " & " << join("pxy",i,j) << range(tileSize + bpadX+bpadY -1, bpadX+bpadY) << " & " << zg(bounded_tX+bounded_tY-minShift) << "; --1" << endl;
							} else { 
							
								/* check if the next element has as 17-bit shift wr to this one. If this is true, then 
								concatenate only the lower portion of the partial product */

								/* these are the real coordinates next tile. if this tile has the same weight as the current 
								then the contribuiton of the current tile will be absorbed in the next so nothing will be outputed*/
								int trx2,try2,blx2,bly2;
								d->getShiftOut()->getTopRightCorner  (trx2, try2);
								d->getShiftOut()->getBottomLeftCorner(blx2, bly2);
								convertCoordinatesInvertedBoard(trx2, try2, blx2, bly2);
							
								int rtXNext = trx2 - extW;
								int rtYNext = try2 - extH;
							
								if ( (rtXNext+rtYNext) - (rtX+rtY) == 17){ //indeed, 17 bit shift 
									if ( bpadX + bpadY < 17)
										sname << join("pxy",i,j) << range(d->getShiftAmount()-1, bpadX+bpadY);
					
									sname << " & " << zg(bounded_tX + bounded_tY - minShift) << " & ";
								}
									
								sname <<" \"\";--3 bpadX "<< bpadX <<" bpadY "<<bpadY <<endl;

								previousPadding = bpadX + bpadY;
							}
						}

						// erase d from the DSPConfig buffer to avoid handeling it twice
						for (int k=i+1; k<nrDSPs; k++) {
							if ((tempc[k] != NULL) && (tempc[k] == d)) {
								tempc[k] = NULL;
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
					if (!sign)
						sname << tab << declare(join("addOpDSP", nrOp),wInX+wInY-minShift) << " <= " << sname.str();
					else
						sname << tab << declare(join("addOpDSP", nrOp),wInX+wInY + 2 - minShift) << " <= " << sname.str();
					vhdl << sname.str();
					nrOp++;		
				}
			}
		return nrOp;
		}


//	int IntTruncMultiplier::multiplicationInDSPs(DSP** config)
//	{
//		int nrOp = 0;		 			// number of resulting adder operands
//		int trx1, try1, blx1, bly1; 	// coordinates of the two corners of a DSP block 
//		int trx2, try2, blx2, bly2; 	// coordinates of the two corners of a DSP block 

//		int fpadX, fpadY;	// zero padding on both axis
//		int multW, multH; 				// width and height of the multiplier the DSP block is using
//		ostringstream xname, yname, mname, cname, sname;
//		DSP** tempc = new DSP*[nrDSPs];	// buffer that with hold a copy of the global configuration
//		int partitions = 0; 			// subtracted operand count	
//			
//		memcpy(tempc, config, sizeof(DSP*) * nrDSPs );
//		
//		if ( target_->getVendor() == "Xilinx"){  // then the target is A Xilinx FPGA 
//			for (int i=0; i<nrDSPs; i++)
//				if (tempc[i] != NULL){
//					DSP* d = tempc[i]; // the current DSP that is to be processed
//					int j = 0; /* the index of the element in the chain to be processed */

//					/* chech how many DSPs are there in this chain */
//					int connected = 0;
//					while (d != NULL){
//						connected++;
//						d = d->getShiftOut();
//					} /* parse the whole chain in order to get the last DSP */
//					REPORT(DEBUG, "CONNECTED " << connected);
//					d = tempc[i]; /* get back to the initial one */

//					setCycle(0);
//					setCriticalPath(0);
//	
//					while (d != NULL){
//						bool onEdge = false;
//						
//						d->getTopRightCorner(trx1, try1);
//						d->getBottomLeftCorner(blx1, bly1);
//						d->getTopRightCorner(trx2, try2);
//						d->getBottomLeftCorner(blx2, bly2);

//						convertCoordinates       (trx1, try1, blx1, bly1); 
//						convertCoordinatesKeepNeg(trx2, try2, blx2, bly2); /*REAL dsp coord. may exceed board area */

//						REPORT(INFO, "coordinates      trx="<<trx1<<" try="<<try1<<" blx"<<blx1<<" bly="<<bly1);
//						REPORT(INFO, "coordinates REAL trx="<<trx2<<" try="<<try2<<" blx"<<blx2<<" bly="<<bly2);
//						
//						
//						
//						

//						//						int sh = 0;
//						/* forward padding variables */
//						fpadX = (wInX - 1) - blx1; //max coord on X axis - bottom left corner (x)
//						fpadX = (fpadX<0)? 0: fpadX; //no need to pad if tile exceeds limits
//						fpadY = (wInY-1) - bly1;
//						fpadY = (fpadY<0)?0:fpadY;

//						/* the real size of the multiplication. */					
//						multW = blx2-trx2+1;
//						multH = bly2-try2+1;

//						if ( (wX == blx1+1) || (wY == bly1+1) )
//							onEdge = true; //if the block is on the edge it must be sign extended
//						
//						setCycle(0);
//						/* the correct operands */
//						vhdl << tab << declare(join("x",i,"_",j), multW + 1, true) << " <= ";
//						if (sign && (blx1+1 == wX)){
//							vhdl << rangeAssign(blx2-blx1 -1, 0 , "X"+of(blx1+1))  
//								 << " & X" << range(blx1 + 1, trx1) //the real part of X that's getting multiplied
//								 << " & "  << zg(trx1-trx2) <<  ";" << endl;
//						}else{
//							vhdl << zg(blx2-blx1 + 1) 
//							     << " & X" << range(blx1, trx1) 
//							     << " & "  << zg(trx1-trx2) << ";" << endl;
//						}	
//						
//						vhdl << tab << declare(join("y",i,"_",j), multH + 1,true) << " <= ";
//						if (sign  && (wY == bly1+1)){
//							vhdl << rangeAssign(bly2-bly1 - 1, 0, "Y"+of(bly1+1))
//							     << " & Y" << range(bly1+1, try1)
//							     << " & " << zg(try1-try2) << ";" << endl;
//						}else{
//							vhdl << zg(bly2-bly1+1)
//							     << " & Y" << range(bly1, try1)
//							     << " & " << zg(try1-try2) << ";" << endl;
//						}
//						
//						//conditions will obviously happen at the same time
//						if ((d->getShiftIn() != NULL) && (j>0)){ // multiply accumulate 
//							setCycleFromSignal( join("pxy",i,j-1));
//							nextCycle();
//							vhdl << tab << declare(join("txy",i,j), multW + multH + 2) << " <= " << join("x",i,"_",j) << " * " << join("y",i,"_",j) << ";" << endl;
//							syncCycleFromSignal( join("pxy",i,j-1));
//							vhdl << tab << declare(join("pxy",i,j), multW + multH + 2) << " <= " << join("txy",i,j)   << " + (" 
//							<< rangeAssign( d->getShiftAmount() -1, 0, (sign?join("pxy",i,j-1)+of(multW + multH + 1):"'0'")) << " & " //sign extension 
//							<< join("pxy",i,j-1) << range(multW+multH+1, d->getShiftAmount()) << ");" << endl;	

//							sname.seekp(ios_base::beg);
//							if (d->getShiftOut() == NULL){ // concatenate the entire partial product
//								if (sign)
//									sname << rangeAssign(fpadX + fpadY - 1, 0, join("pxy",i,j)+of(multH+multW+1)) << " & " << join("pxy",i,j) << range( (blx1-trx1+1) + (bly1-try1+1) + 2 -1, 0) << " & " << sname.str();							
//								else
//									sname << rangeAssign(fpadX + fpadY - 1, 0, join("pxy",i,j)+of(multH+multW+1)) << " & " << join("pxy",i,j) << range( (blx1-trx1+1) + (bly1-try1+1)  -1, 0) << " & " << sname.str();							
//							}else{ // concatenate only the lower portion of the partial product
//								sname << join("pxy",i,j) << range(d->getShiftAmount()-1, 0) << " & " << sname.str();
//							}
//						}else{
//							// only multiplication
//							syncCycleFromSignal( join("x",i,"_",j) );
//							syncCycleFromSignal( join("y",i,"_",j) );
//							nextCycle();
//							vhdl << tab << declare(join("pxy",i,j), multW + multH + 2) << " <= " << join("x",i,"_",j) << " * " << join("y",i,"_",j) << ";-- -" << endl;
//							sname.str("");
//							if (d->getShiftOut() == NULL) //concatenate the entire partial product
//								if (onEdge && sign)//we need to sign extend this operand
//									sname << rangeAssign(fpadX+fpadY -1 , 0,  join("pxy",i,j)+of(multW+multH+1)) << " & " << join("pxy",i,j) << range( (blx1-trx2+1) + (bly1-try2+1) + 2 -1, trx1-trx2+try1-try2) << " & " << zg(try1+trx1-minShift, 0) <<  ";--+" << endl;
//								else if (sign)//extend with 0
//									sname << zg(fpadX+fpadY    , 0) << " & " << join("pxy",i,j)<<range( (blx1-trx1+1) + (bly1-try1+1) + 2 -1, 0) << " & " << zg(try1 + trx1 -minShift, 0)  <<  ";--/" << endl;
//								else
//									sname << zg(fpadX+fpadY , 0) << " & " << join("pxy",i,j)<<range( (blx1-trx1+1) + (bly1-try1+1) -1, 0) << " & " << zg(try1 + trx1 -minShift, 0)  <<  ";--/" << endl;	
//							else // concatenate only the lower portion of the partial product
//								sname << join("pxy",i,j) << range(d->getShiftAmount()- (try1-try2 + bly2-bly1) - (trx1-trx2 + blx2-blx1) -1 ,0) << " & " << zg( try1 + trx1 -minShift,0) << ";--"<<try1<<","<<trx1<<"*" << endl;
//						}
//						// erase d from the tempc buffer to avoid handleing it twice
//						for (int k=i+1; k<nrDSPs; k++)
//							if ((tempc[k] != NULL) && (tempc[k] == d)){
//								tempc[k] = NULL;
//								break;
//							}
//	
//						//next tile	
//						d = d->getShiftOut();
//						j++;
//					}	
//					sname.seekp(ios_base::beg);
//					nextCycle();//necessary for infering 1 reg level inside DPSs. Otherwise the registers are pulled in the SRL
//					sname << tab << declare(join("addOpDSP", nrOp),wInX+wInY+(sign?2:0)-minShift) << " <= " << sname.str();
//					vhdl << sname.str();
//					nrOp++;		
//				}
//			subCount = partitions;
//			return nrOp;
//		}

		else // the target is Stratix
		{
				int boundDSPs;  				// number of bound DSPs in a group
				DSP** addOps;					// addition operands bound to a certain DSP
	
				for (int i=0; i<nrDSPs; i++)
					if (tempc[i] != NULL){
							REPORT(DETAILED, "At DSP#"<< i+1 << " tempc["<<i<<"]");
							tempc[i]->getTopRightCorner(trx1, try1);
							tempc[i]->getBottomLeftCorner(blx1, bly1);
							convertCoordinates(trx1, try1, blx1, bly1);

							int trx2,try2,blx2,bly2;
							tempc[i]->getTopRightCorner(trx2, try2);
							tempc[i]->getBottomLeftCorner(blx2, bly2);
							convertCoordinatesKeepNeg(trx2, try2, blx2, bly2);
							multW = blx2-trx2+1;
							multH = bly2-try2+1;
			
							setCycle(0);
							vhdl << tab << declare(join("x",i,"_0"), multW, true) << " <= X" << range(blx1, trx1) << " & " << zg(trx1-trx2 + blx1-blx2) << ";" << endl;
							vhdl << tab << declare(join("y",i,"_0"), multH, true) << " <= Y" << range(bly1, try1) << " & " << zg(try1-try2 + bly1-bly2) << ";" << endl;

							boundDSPs = tempc[i]->getNumberOfAdders();
							int ext = 0;        // the number of carry bits of the addtion accumulation. 
							if (boundDSPs > 0){ // need to traverse the addition operands list and perform addtion
								ext = (boundDSPs>1)?2:1;
								REPORT(INFO, "boundDSPs = " << boundDSPs);
								nextCycle();
								mname.str("");
								mname << "mult_" << i << "_0";
								vhdl << tab << declare(mname.str(), multW+multH, true, Signal::registeredWithAsyncReset) << " <= " << join("x",i,"_0") << " * " << join("y",i,"_0") << ";" << endl;
								addOps = tempc[i]->getAdditionOperands();
			
								/* At most 4 operands */
								for (int j=0; j<3; j++)
									if (addOps[j] == NULL){
										REPORT(DETAILED, "addOps["<< j << "]=NULL");
									}else
										REPORT(DETAILED, "addOps["<< j << "]=not null");
			
								for (int j=0; j<boundDSPs; j++){
										REPORT(DETAILED, "j = " << j );
										// erase addOps[j] from the tempc buffer to avoid handleing it twice
										for (int k=i+1; k<nrDSPs; k++){
											if ((tempc[k] != NULL) && (tempc[k] == addOps[j])){
												REPORT( DETAILED, "tempc[" << k << "] deleted");
												tempc[k] = NULL;
												break;
											}
										}
				
										addOps[j]->getTopRightCorner(trx1, try1);
										addOps[j]->getBottomLeftCorner(blx1, bly1);
										convertCoordinates(trx1, try1, blx1, bly1);
										multW = addOps[j]->getMaxMultiplierWidth();
										multH = addOps[j]->getMaxMultiplierHeight();
										
										addOps[j]->getTopRightCorner(trx2, try2);
										addOps[j]->getBottomLeftCorner(blx2, bly2);
										convertCoordinatesKeepNeg(trx2, try2, blx2, bly2);

										multW = blx2-trx2+1;
										multH = bly2-try2+1;
										
										setCycle(0); ////////////////////////////////////
										vhdl << tab << declare(join("x",i,"_",j+1), multW, true) << " <= X" << range(blx1, trx1) << " & " << zg(trx1-trx2 + blx1-blx2) << ";" << endl;
										vhdl << tab << declare(join("y",i,"_",j+1), multH, true) << " <= Y" << range(bly1, try1) << " & " << zg(try1-try2 + bly1-bly2) << ";" << endl;


										nextCycle(); ////////////////////////////////////
										vhdl << tab << declare(join("mult_",i,"_",j+1), multW+multH, true) << " <= " << join("x",i,"_",j+1) << " * " << join("y",i,"_",j+1) << ";" << endl;
								}
			
								nextCycle();
								vhdl << tab << declare(join("addDSP", nrOp), multW+multH+ext, true) << " <= ";
			
								for (int j=0; j<boundDSPs; j++){
									vhdl << "(" << zg(ext,0) << " & " << join("mult_",i,"_",j) << ") + "; 
								}
								vhdl << "(" << zg(ext,0) << " & " << join("mult_",i,"_",boundDSPs) << ");" << endl; 
							}else{ // multiply the two terms and you're done
								nextCycle();
								vhdl << tab << declare(join("addDSP", nrOp), multW+multH, true) << " <= " << join("x",i,"_0") << " * " << join("y",i,"_0") << ";" << endl;
							}
							vhdl << tab << declare(join("addOpDSP", nrOp), wInX+wInY-minShift) << " <= " << zg(wX+wY-(trx2+try2+ext+multW+multH),0) << " & " << join("addDSP", nrOp)<<range(ext+multW+multH-1 ,ext+multW+multH - (wInX+wInY-minShift) ) << " & " << zg(trx2+try2-minShift,0) << ";" << endl;
							nrOp++;
					}
				return nrOp;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	int IntTruncMultiplier::multiplicationInSlices(vector<SoftDSP*> config)
	{
		unsigned partitions;
		bool savedUseHardMultipliers = target_->getUseHardMultipliers();

		for (partitions=0; partitions<config.size(); partitions++)
		{	
			int trx1, try1, blx1, bly1;
			bool onEdge=false;
			config[partitions]->getCoordinates(trx1, try1, blx1, bly1);
			convertCoordinates(trx1, try1, blx1, bly1);

			setCycle(0); //TODO	
//			setCriticalPath( getMaxInputDelays(inputDelays));
			
			target_->setUseHardMultipliers(false);
			
			if ((blx1 == wX-1) || ( bly1 == wY-1))
			onEdge = true; //if the block is on the edge it must be sign extended
			
			int wMultX, wMultY;
			wMultX = blx1-trx1+1; 
			wMultY = bly1-try1+1; 
			if ((sign) && (onEdge)){
				wMultX++; //the extra 1 is for the sign
				wMultY++;
			}			
			
			
			LogicIntMultiplier* mult =  new LogicIntMultiplier(target_, wMultX, wMultY, inDelayMap("X", getCriticalPath()), (sign) && (onEdge) ); //if it's on edge then is signed
			mult->changeName( join( mult->getName()+"_",partitions) );
			oplist.push_back(mult);
			
			vhdl << tab << declare(join("x_",partitions), wMultX, true) << " <= " ;
			if ((sign) && onEdge )
				if (blx1==wX-1)
					vhdl << "X" << range(blx1+1, trx1) << ";" << endl;
				else
					vhdl << "\"0\" & X" << range(blx1, trx1) << ";" << endl;
			else
				vhdl << "X" << range(blx1, trx1) << ";" << endl;	

			vhdl << tab << declare(join("y_",partitions), wMultY, true) << " <= " ;
			if ((sign) && onEdge )
				if (bly1==wY-1)
					vhdl << "Y" << range(bly1+1, try1) << ";" << endl;
				else
					vhdl << "\"0\" & Y" << range(bly1, try1) << ";" << endl;
			else
				vhdl << "Y" << range(bly1, try1) << ";" << endl;	
				
			inPortMap (mult, "X", join("x_",partitions));
			inPortMap (mult, "Y", join("y_",partitions));
			outPortMap(mult, "R", join("result", partitions));
			vhdl << instance(mult, join("Mult", partitions));
		
			syncCycleFromSignal(join("result", partitions));
			
			vhdl << tab << declare(join("addOpSlice", partitions), wInX+wInY + (sign?2:0) -minShift) << " <= " ;
			if ((sign) && onEdge ){
				vhdl << rangeAssign(wX+wY+(sign?2:0) - (trx1+wMultX+try1+wMultY) -1 , 0, join("result", partitions)+of(wMultX+wMultY-1)) << " & " << join("result", partitions) 
					 << " & " << zg(trx1+try1-minShift, 0) << ";" << endl;	
			}else{
				vhdl << zg(wX+wY+(sign?2:0) - (trx1+wMultX+try1+wMultY) , 0) << " & " << join("result", partitions) 
					 << " & " << zg(trx1+try1-minShift, 0) << ";" << endl;	
			}

			setSignalDelay(join("addOpSlice", partitions), mult->getOutputDelay("R"));
		}
		
		target_->setUseHardMultipliers(savedUseHardMultipliers);		
		return (int)partitions;
	}	

	void IntTruncMultiplier::generateVHDLCode(DSP** config, vector<SoftDSP*> softConfig){
		
		int trx1, try1, blx1, bly1; 	// coordinates of the two corners of a DSP block 
		DSP** bestConfig = config;
		bindDSPs(bestConfig); 
		
		minShift = wX + wY - 2;
		for (int i=0; i<nrDSPs; i++){
			if (bestConfig[i] != NULL){
				DSP* d = bestConfig[i];
				d->getTopRightCorner(trx1, try1);
				d->getBottomLeftCorner(blx1, bly1);
				convertCoordinates(trx1, try1, blx1, bly1);
				minShift = min (minShift, trx1+try1);
			}
		}
		REPORT(INFO, "The minimal shift of DSPs is:" << minShift);


		for (uint32_t partitions=0; partitions<softConfig.size(); partitions++)
		{	
			int njj, nj, ni, nii;
			softConfig[partitions]->getCoordinates(nj, ni, njj, nii);
			convertCoordinates(nj, ni, njj, nii);
			minShift = min (minShift, nj+ni);
		}
		REPORT(INFO, "The minimal shift of DSP + soft is:" << minShift);
		     
		//bestConfig = splitLargeBlocks(bestConfig, nrDSPs);
		int nrDSPOperands = multiplicationInDSPs(bestConfig);
		int nrSliceOperands = multiplicationInSlices(softConfig);
		map<string, double> inMap;
		
		for (int j=0; j<nrDSPOperands; j++)
			{
				ostringstream concatPartialProd;
				concatPartialProd  << "addOpDSP" << j;
				syncCycleFromSignal(concatPartialProd.str(), getSignalDelay(concatPartialProd.str()));
			}	
			
		for (int j=0; j<nrSliceOperands; j++)
			{
				ostringstream concatPartialProd;
				concatPartialProd  << "addOpSlice" << j;
				syncCycleFromSignal(concatPartialProd.str(), getSignalDelay(concatPartialProd.str()));
			}	
			
		for (int j=0; j<subCount; j++)
			{
				ostringstream concatPartialProd;
				concatPartialProd  << "addOpSlice_sub" << j;
				syncCycleFromSignal(concatPartialProd.str(), getSignalDelay(concatPartialProd.str()) );
			}		
		Operator *add;
		add =  new IntMultiAdder(getTarget(), wInX+wInY+(sign?2:0)-minShift, nrDSPOperands+nrSliceOperands+subCount + (targetPrecision>0 && roundCompensate_?1:0), inDelayMap("X0",target_->localWireDelay() + getCriticalPath() )  );
		
		oplist.push_back(add);

		for (int j=0; j<nrDSPOperands; j++)
			{
				ostringstream concatPartialProd;
				concatPartialProd  << "addOpDSP" << j;

				inPortMap (add, join("X",j) , concatPartialProd.str());
			}	
			
		for (int j=0; j<nrSliceOperands; j++)
			{
				ostringstream concatPartialProd;
				concatPartialProd  << "addOpSlice" << j;
				inPortMap (add, join("X",j+nrDSPOperands) , concatPartialProd.str());
			}	
			
		for (int j=0; j<subCount; j++)
			{
				ostringstream concatPartialProd;
				concatPartialProd  << "addOpSlice_sub" << j;
				inPortMap (add, join("X", j+nrDSPOperands+nrSliceOperands), concatPartialProd.str());
			}
			
		if (targetPrecision > 0 && roundCompensate_){
			ostringstream concatPartialProd;
			concatPartialProd<< zg( wInX+wInY+(sign?2:0)-targetPrecision-1, -1) << "1" << zg(targetPrecision-minShift,1);
			inPortMapCst( add, join("X",nrDSPOperands+nrSliceOperands+subCount), concatPartialProd.str() );
		}		

		outPortMap(add, "R", "addRes");
		vhdl << instance(add, "adder");

		syncCycleFromSignal("addRes");
		setCriticalPath(add->getOutputDelay("R"));
		vhdl << tab << "R <= addRes" << range(wX+wY+(sign?2:0)-1-minShift, targetPrecision-minShift) << ";" << endl;
		
		outDelayMap["R"] = getCriticalPath();

	}
	
	vector<SoftDSP*> IntTruncMultiplier::insertSoftDSPs(DSP** config)
	{
		vector<SoftDSP*> configSoft;
		configSoft.clear();
		SoftDSP *tempSoft;

		int n,m;
		int count=1;
		n=vn;
		m=vm;
	
		int ew = getExtraWidth();
		int eh = getExtraHeight();
	
		for(int i=0;i<m;i++){
			for(int j=0;j<n;j++)
				mat[i][j]=0;
		}
		
	
		for(int i=0;i<nrDSPs;i++){
			int c1X,c2X,c1Y,c2Y;
			config[i]->getTopRightCorner(c1X,c1Y);
			config[i]->getBottomLeftCorner(c2X,c2Y);
			c1X=n-c1X-1;
			c2X=n-c2X-1;
			fillMatrix(mat,n,m,c2X,c1Y,c1X,c2Y,count);
			count++;			
		}
		
		
		int deepX=vn,deepY=vm,rdeepX=vm;
		int ti;
		int sbx,sby;
		int lastModifiedIndex = -1;
		int lastDeepX, lastDeepY;	
			
		while(!isTilingValid(config,configSoft,targetPrecision) )
		{
			//displayAll(bestConfig, configSoft);
		deepX=vn,deepY=vm,rdeepX=vm;
		bool found = false;
		//search the deapest position
		for(int i=ew+1;i<=vnme;i++)	
		{
			ti = vn-i;
			for(int j=eh;j<vmme;j++)
			{
				if(mat[j][ti]==0&&((deepX+deepY)>(i+j))  )
				{
					found = true;
					deepX=i;
					rdeepX=ti;
					deepY=j;					
				}				
			}			
		}	
		
		if (!found)
			break;
			
		mat[deepY][rdeepX]=count++;
		
		//puts the current 1x1 multiplication on the board and will try to combine and extend the neighbours
		//bool isextentionok=false;
		int ref=1;
		//try in right
		if( (rdeepX+1)<vn && mat[deepY][rdeepX+1]!=1369 && mat[deepY][rdeepX+1]>nrDSPs && (deepY==0 || mat[deepY-1][rdeepX+1]!=mat[deepY][rdeepX+1]))
		{
			if (deepX > 0)
				ref = mat[deepY][rdeepX+1];
			int i;
			for(i=deepY+1; i<vmme && mat[i][rdeepX]==0 && mat[i][rdeepX+1]==ref;i++ )
			{
				mat[i][rdeepX]=ref;
			}
			
			bool tooHigh = false;
			if (i==vmme)
			{
				i--;
				tooHigh = true;
			}	
				
			if(  mat[i][rdeepX+1]==ref  )
			{
				//new multiplier should be created
				for(i=deepY+1; i<vmme && mat[i][rdeepX]==ref;i++)
					mat[i][rdeepX]=0;
				lastModifiedIndex = ref-nrDSPs-1;
				lastDeepX = 0;
				lastDeepY = 0;
				tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
				configSoft.push_back(tempSoft);
			}
			else
			{
				lastModifiedIndex = ref-nrDSPs-1;
				lastDeepX = 1;
				lastDeepY = 0;
				//the previous multiplier was extended
				mat[deepY][rdeepX]=ref;
				count--;		
				configSoft[(ref-nrDSPs-1)]->getBottomLeftCorner(sbx,sby);
				sbx++;
				configSoft[(ref-nrDSPs-1)]->setBottomLeftCorner(sbx,sby);
			}			
		}
		else
		{
			//try top
			if( deepY>0 && mat[deepY-1][rdeepX]!=1369 && mat[deepY-1][rdeepX]>nrDSPs &&  mat[deepY-1][rdeepX+1]!=mat[deepY-1][rdeepX])
			{
				ref = mat[deepY-1] [rdeepX];
				int i;
				for(i=rdeepX-1;mat[deepY][i]==0 && mat[deepY-1][i]==ref;i--)
				{
					mat[deepY][i]=ref;
				}
				if(mat[deepY-1][i]==ref)
				{
					//new multiplier should be created
					for(i=rdeepX-1;mat[deepY][i]==ref;i--)
						mat[deepY][i]=0;
					lastModifiedIndex = ref-nrDSPs-1;
					lastDeepX = 0;
					lastDeepY = 0;
					tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
					configSoft.push_back(tempSoft);
				}
				else
				{
					lastModifiedIndex = ref-nrDSPs-1;
					lastDeepX = 0;
					lastDeepY = 1;
					//the previous multiplier was extended
					mat[deepY][rdeepX]=ref;
					count--;
					configSoft[(ref-nrDSPs-1)]->getBottomLeftCorner(sbx,sby);
					sby++;
					configSoft[(ref-nrDSPs-1)]->setBottomLeftCorner(sbx,sby);
				}				
			}
			else
			{
				lastModifiedIndex = ref-nrDSPs-1;
				lastDeepX = 0;
				lastDeepY = 0;
				//no SoftDSP exists in the neighbourhood
				tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
				configSoft.push_back(tempSoft);
			}
		}
		}
	
		vector<SoftDSP*> newSoft;
		newSoft.clear();
		
		if (isSquarer)
		{
			//cout << "m=" << m << " n=" << n << endl;
			for (int i=m-1; i>=0; i--)
			{
				if ((mat[i][n-i-1] > nrDSPs) && (mat[i][n-i-1] != 1369) && (mat[i-1][n-i-1] == 1369) && (mat[i][n-i-2] == 1369))
				{
					//cout << "in " << i << " " << mat[i-1][n-i-1] << " " << mat[i-1][n-i-2] << mat[i][n-i-1] <<endl;
					mat[i][n-i-1] = -1;//int ref = mat[i][n-i-1];
				
					int j = n-i-1;
					// expand ref
					//cout << "ref=" << ref << endl;
					while ((mat[i][j+1] > nrDSPs) && (mat[i][j+1] < count) && (mat[n-2-j][j+1] > nrDSPs))
					{
						//cout << "under " << mat[i][j+1] << " over " << mat[n-1-j][j] << endl;
						j++;
						for (int k=n-i-1; k<=j; k++)
						{
							mat[n-1-j][k] = -1;//ref;
							mat[n-1-k][j] = -1;//ref;
						}
					}
					j -= n-i-1;
					tempSoft = new SoftDSP(i-j, i-j, i, i);
					newSoft.push_back(tempSoft);
				}
			}	
			bool modified;
			do{
			modified = false;
			for (int j=0; j<n; j++)
			{
				int start = m-j-1;
				if (start<0)
					start = 0;
				for (int i=start; i<(m-1); i++)
				{
					//cout << "sus i="<<i<<" j="<<j<< endl;
					if ((mat[i][j] > nrDSPs) && (mat[i][j] != 1369) && (mat[i][j-1] == 1369) && (mat[i+1][j] == 1369) && (j!=n-i-1)) //&& (mat[i-1][j-1] == 1369))
					{
						mat[i][j] = -1;//int ref = mat[i][j];
						// expand ref
						//cout << "ref=" << ref << endl;	
						int oldi = i;
						int oldj = j;
						// go down
						while ((i<(m-1)) && (mat[i+1][j] > nrDSPs) && (mat[i+1][j] != 1369))
						{
							i++;
							mat[i][j] = -1;
						}
						// go right & down
						while ((i<(m-1)) && (j<(n-1)) && (mat[oldi][j+1] > nrDSPs) && (mat[oldi][j+1] < count) && (mat[i+1][j+1] == mat[oldi][j+1]))// && (mat[n-2-j][j+1] > nrDSPs)
						{
							j++;
							i++;
							for (int k=oldi; k<=i; k++)
								mat[k][j] = -1;//ref;
							for (int k=oldj; k<=j; k++)	
								mat[i][k] = -1;//ref;
							
						}
						// go right
						while ((j<(n-1)) && (mat[oldi][j+1] > nrDSPs) && (mat[i][j+1] == mat[oldi][j+1]))
						{
							j++;
							for (int k=oldi; k<=i; k++)
								mat[k][j] = -1;//ref;
						}
						
						int tx1, ty1, bx1, by1;
						tx1 = m-j-1;
						ty1 = oldi;
						bx1 = n-oldj-1;
						by1 = i;
						if (tx1 )
						tempSoft = new SoftDSP(m-j-1, oldi, n-oldj-1, i);
						newSoft.push_back(tempSoft);
						modified = true;
					}
					
					//cout << "i="<<i<<" j="<<j<< endl;
					if ((mat[i][j] > nrDSPs) && (mat[i][j] != 1369))
					{
						//int ref = mat[i][j];
						mat[i][j] = -1;
						// expand ref
						//cout << "ref=" << ref <<" i="<<i<<" j="<<j<< endl;	
						int oldi = i;
						int oldj = j;
						// go down
						while ((i<(m-1)) && (mat[i+1][j] > nrDSPs))
						{
							i++;	
							mat[i][j] = -1;
						}
						
						// go right
						while ((j<(n-1)) && (mat[oldi][j+1] > nrDSPs) && (mat[i][j+1] == mat[oldi][j+1]))
						{
							j++;
							for (int k=oldi; k<=i; k++)
								mat[k][j] = -1;
						}
						
						tempSoft = new SoftDSP(m-j-1, oldi, n-oldj-1, i);
						newSoft.push_back(tempSoft);
						modified = true;
					}
					
				}
			}
			}while(modified); 
			
			// empty old configuration
			int configSize = configSoft.size();
			for (int i=0; i<configSize; i++)
				delete configSoft[i];
			configSoft.clear();
			configSoft = newSoft;
		}
		
		return configSoft;
	}
	
	void IntTruncMultiplier::outputVHDL(std::ostream& o, std::string name) {
		licence(o);
		o << "library ieee; " << endl;
		o << "use ieee.std_logic_1164.all;" << endl;
		o << "use ieee.std_logic_arith.all;" << endl;
		o << "use ieee.std_logic_signed.all;" << endl;
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
	
	
	vector<SoftDSP*>IntTruncMultiplier::insertSoftDSPswithLimits(DSP** config){
		vector<SoftDSP*> configSoft;
		configSoft.clear();
		SoftDSP *tempSoft;
		int n,m;
		int count = 1;
		int ew    = getExtraWidth();
		int eh    = getExtraHeight();
		n         = vn;
		m         = vm;
	
		for(int i=0;i<m;i++){
			for(int j=0;j<n;j++)
				mat[i][j]=0;
		}
			
			
		for(int i=0;i<nrDSPs;i++){
			int c1X,c2X,c1Y,c2Y;
		
			config[i]->getTopRightCorner(c1X,c1Y);
			config[i]->getBottomLeftCorner(c2X,c2Y);
			c1X=n-c1X-1;
			c2X=n-c2X-1;
			fillMatrix(mat,n,m,c2X,c1Y,c1X,c2Y,count);
			count++;			
		}
		
		int deepX=vn,deepY=vm,rdeepX=vm;
		int ti;
		int sbx,sby;
		int stx,sty;
		int lastModifiedIndex = -1;
		int lastDeepX, lastDeepY;	
			
		while(!isTilingValid(config,configSoft,targetPrecision) )
		{
			//displayAll(bestConfig, configSoft);
		deepX=vn,deepY=vm,rdeepX=vm;
		bool found = false;
		//search the deapest position
		for(int i=ew+1;i<=vnme;i++)	
		{
			ti = vn-i;
			for(int j=eh;j<vmme;j++)
			{
				if(mat[j][ti]==0&&((deepX+deepY)>(i+j))  )
				{
					found = true;
					deepX=i;
					rdeepX=ti;
					deepY=j;					
				}				
			}			
		}	
		
		/*
		for(int i=0;i<m;i++){
			for(int j=0;j<n;j++)
				cout << mat[i][j];
			cout << endl;
		}
		cout << endl;
		*/
		if (!found)
			return configSoft;
			
		mat[deepY][rdeepX]=count++;
				
		//puts the current 1x1 multiplication on the board and will try to combine and extend the neighbours
		//bool isextentionok=false;
		int ref=1;
		int sdspw,sdsph;
		//try in right
		if( (rdeepX+1)<vn && mat[deepY][rdeepX+1]!=1369 &&   mat[deepY][rdeepX+1]>nrDSPs && (deepY==0 || mat[deepY-1][rdeepX+1]!=mat[deepY] [rdeepX+1]))
		{
			if (deepX > 0)
				ref = mat[deepY] [rdeepX+1];
			int i;
			
			configSoft[(ref-nrDSPs-1)]->getCoordinates(stx,sty,sbx,sby);
			sdspw = sbx-stx+1;
			sdsph = sby-sty+1;
				
			if( ( ((float)dspWidth*dspHeight)*0.5)< (sdspw*sdsph) &&  sdspw>=dspWidth ){
				
				lastModifiedIndex = ref-nrDSPs-1;
				lastDeepX = 0;
				lastDeepY = 0;
				tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
				configSoft.push_back(tempSoft);
			}else{
				for(i=deepY+1; i<vmme && mat[i][rdeepX]==0 && mat[i][rdeepX+1]==ref;i++ ){
					mat[i][rdeepX]=ref;
				}
				
				bool tooHigh = false;
				if (i==vmme)
				{
					i--;
					tooHigh = true;
				}	
				
				if( !tooHigh && mat[i][rdeepX+1]==ref)	{
					//new multiplier should be created
					for(i=deepY+1; i<vmme && mat[i][rdeepX]==ref;i++)
						mat[i][rdeepX]=0;
					lastModifiedIndex = ref-nrDSPs-1;
					lastDeepX = 0;
					lastDeepY = 0;
					tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
					configSoft.push_back(tempSoft);
				}else{
					lastModifiedIndex = ref-nrDSPs-1;
					lastDeepX = 1;
					lastDeepY = 0;
					//the previous multiplier was extended
					mat[deepY][rdeepX]=ref;
					count--;		
					configSoft[(ref-nrDSPs-1)]->getBottomLeftCorner(sbx,sby);
					sbx++;
					configSoft[(ref-nrDSPs-1)]->setBottomLeftCorner(sbx,sby);
				}
			}			
		}
		else
		{
			//try top
			if( deepY>0 && mat[deepY-1][rdeepX]!=1369 && mat[deepY-1][rdeepX]>nrDSPs &&  mat[deepY-1][rdeepX+1]!=mat[deepY-1][rdeepX])
			{
				ref = mat[deepY-1] [rdeepX];
				int i;
				
				configSoft[(ref-nrDSPs-1)]->getCoordinates(stx,sty,sbx,sby);
				sdspw = sbx-stx+1;
				sdsph = sby-sty+1;
			
				
				if( ( ((float)dspWidth*dspHeight)*0.5)< (sdspw*sdsph) &&  sdsph>=dspHeight ){
					lastModifiedIndex = ref-nrDSPs-1;
					lastDeepX = 0;
					lastDeepY = 0;
					tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
					configSoft.push_back(tempSoft);
				}else{
					for(i=rdeepX-1;  mat[deepY][i]==0 && mat[deepY-1][i]==ref;i--){
						mat[deepY][i]=ref;
					}
					if( mat[deepY-1][i]==ref){
						//new multiplier should be created
						for(i=rdeepX-1;mat[deepY][i]==ref;i--)
							mat[deepY][i]=0;
						lastModifiedIndex = ref-nrDSPs-1;
						lastDeepX = 0;
						lastDeepY = 0;
						tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
						configSoft.push_back(tempSoft);
					}else{
						lastModifiedIndex = ref-nrDSPs-1;
						lastDeepX = 0;
						lastDeepY = 1;
						//the previous multiplier was extended
						mat[deepY][rdeepX]=ref;
						count--;
						configSoft[(ref-nrDSPs-1)]->getBottomLeftCorner(sbx,sby);
						sby++;
						configSoft[(ref-nrDSPs-1)]->setBottomLeftCorner(sbx,sby);
					}	
				}				
			}else{
				lastModifiedIndex = ref-nrDSPs-1;
				lastDeepX = 0;
				lastDeepY = 0;
				//no SoftDSP exists in the neighbourhood
				tempSoft =  new SoftDSP(deepX-1,deepY,deepX-1,deepY);
				configSoft.push_back(tempSoft);
			}
		}
		}
		return configSoft;
	}
	
	
		void IntTruncMultiplier::emulate(TestCase* tc)
	{

		mpz_class svX = tc->getInputValue("X");
		mpz_class svY = tc->getInputValue("Y");
		
		if (!sign){
			mpz_class svR = svX * svY;
			svR = (svR >> int(targetPrecision));
		
			tc->addExpectedOutput("R", svR);
			svR = svR + mpz_class(1);
			tc->addExpectedOutput("R", svR);
		}else{
			mpz_class big1, big1P,big2, big2P;
			
			if (!testFit){
				big1 = (mpz_class(1) << (wX+1));
				big1P = (mpz_class(1) << (wX+1-1));
				big2 = (mpz_class(1) << (wY+1));
				big2P = (mpz_class(1) << (wY+1-1));
			}else{
				big1 = (mpz_class(1) << (wX));
				big1P = (mpz_class(1) << (wX-1));
				big2 = (mpz_class(1) << (wY));
				big2P = (mpz_class(1) << (wY-1));
			}
			
			if ( svX >= big1P)
				svX = svX-big1;

			if ( svY >= big2P)
				svY = svY -big2;
			
			cout << "X="<<svX<<" ,Y="<<svY<<endl;
			
			cout << "wX="<<wX<<" ,wY="<<wY<<endl;
			
			mpz_class svR = svX * svY;
			
			if ( svR < 0){
				mpz_class tmpSUB;
				if (!testFit)
					tmpSUB = (mpz_class(1) << (wX+1+wY+1));
				else
					tmpSUB = (mpz_class(1) << (wX+wY));
				svR = tmpSUB + svR; 
			}

			svR = (svR >> int(targetPrecision));
			tc->addExpectedOutput("R", svR);
			svR = svR + mpz_class(1);
			tc->addExpectedOutput("R", svR);

		}
		
		
	}
	
}
