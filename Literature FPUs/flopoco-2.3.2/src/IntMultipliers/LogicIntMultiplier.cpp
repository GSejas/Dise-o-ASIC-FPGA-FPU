/*
  An unsigned integer multiplier for FloPoCo
  
  Authors: Bogdan Pasca, Sebastian Banescu

  This file is part of the FloPoCo project
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

 */

#include <typeinfo>
#include <iostream>
#include <sstream>
#include <vector>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include "../utils.hpp"
#include "../Operator.hpp"
#include "LogicIntMultiplier.hpp"

using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	LogicIntMultiplier:: LogicIntMultiplier(Target* target, int wInX, int wInY, map<string, double> inputDelays, bool sign) :
		Operator(target, inputDelays), wInX_(wInX), wInY_(wInY), wOut_(wInX + wInY), sign_(sign){
 
		ostringstream name;
		double target_freq = target->frequency();
		double maxDSPFrequency = int(floor(1.0/ (target->DSPMultiplierDelay() + 1.0e-10)));
		if (target_freq > maxDSPFrequency)
			target->setFrequency(maxDSPFrequency);
			

		/* Name Setup procedure
		 *  The name has the format: LogicIntMultiplier_wInX_wInY
		 *  wInX = width of the X input
		 *  wInY = width of the Y input
		 */  
		name <<"LogicIntMultiplier_"<<wInX_<<"_"<<wInY_<<"_uid"<<Operator::getNewUId();;
		if (sign_)
			name << "_signed";
		srcFileName="LogicIntMultiplier";
		setName(name.str());
		
		setCopyrightString("Bogdan Pasca, Sebastian Banescu (2008-2009)");
	
		addInput ("X", wInX_,true);
		addInput ("Y", wInY_,true);
		addOutput("R", wOut_,1, true); /* wOut_ = wInX_ + wInY_ */
	
		/***************************************************************************
		 ***************************************************************************/
		//LogicIntMultiplier Version -- multiplication performed in LUTs. Works for both Xilinx and Altera
		//architectures for corner cases 
		if ((!sign_) && ( wInX == 1 )){
			setCriticalPath( getMaxInputDelays( inputDelays ));
			manageCriticalPath( target->localWireDelay() + target->lutDelay() );
			vhdl << tab << "R <= (\"0\" & Y) when X(0)='1' else "<<zg(wInY+1,0)<<";"<<endl;	
			outDelayMap["R"] = getCriticalPath();
		}else if ((!sign_) && (wInY == 1)){
			setCriticalPath( getMaxInputDelays( inputDelays ));
			manageCriticalPath( target->localWireDelay() + target->lutDelay() );
			vhdl << tab << "R <= (\"0\" & X) when Y(0)='1' else "<<zg(wInX+1,0)<<";"<<endl;	
			outDelayMap["R"] = getCriticalPath();
		}else if ((!sign_) && (((wInX == 2) && (target->lutInputs()-2>=wInY)) || ( (wInY == 2) && (target->lutInputs()-2>=wInX) ))){
			setCriticalPath( getMaxInputDelays( inputDelays ));
			manageCriticalPath( target->localWireDelay() + target->lutDelay() );
			vhdl << tab << "R <= X * Y;"<<endl;	
			outDelayMap["R"] = getCriticalPath();
		}else if ((!sign_) && ((wInX == 2) && (target->lutInputs()-2<wInY))){
			//one addition
			setCriticalPath( getMaxInputDelays( inputDelays ));
			manageCriticalPath( target->localWireDelay() + target->lutDelay() );
			vhdl << tab << declare("R0",wInY+2) << " <= (\"00\" & Y) when X(0)='1' else "<<zg(wInY+2,0)<<";"<<endl;	
			vhdl << tab << declare("R1",wInY+2) << " <= ( \"0\" & Y & \"0\") when X(1)='1' else "<<zg(wInY+2,0)<<";"<<endl;	
				
			IntAdder *resultAdder = new IntAdder( target, wInY+2, inDelayMap("X", target->localWireDelay() + getCriticalPath() ) );
			oplist.push_back(resultAdder);
			
			inPortMap(resultAdder, "X", "R0");
			inPortMap(resultAdder, "Y", "R1");
			inPortMapCst(resultAdder, "Cin", "'0'");
			outPortMap( resultAdder, "R", "RAdder");
			vhdl << tab << instance(resultAdder, "ResultAdder") << endl;
			syncCycleFromSignal("RAdder");
			setCriticalPath( resultAdder->getOutputDelay("R"));

			vhdl << tab << "R <= RAdder;"<<endl;	
			outDelayMap["R"] = getCriticalPath();
		} else if ((!sign_) && ((wInY == 2) && (target->lutInputs()-2<wInX))){
			//one addition
			setCriticalPath( getMaxInputDelays( inputDelays ));
			manageCriticalPath( target->localWireDelay() + target->lutDelay() );
			vhdl << tab << declare("R0",wInX+2) << " <= (\"00\" & X) when Y(0)='1' else "<<zg(wInX+2,0)<<";"<<endl;	
			vhdl << tab << declare("R1",wInX+2) << " <= ( \"0\" & X & \"0\") when Y(1)='1' else "<<zg(wInX+2,0)<<";"<<endl;	
				
			IntAdder *resultAdder = new IntAdder( target, wInX+2, inDelayMap("X", target->localWireDelay() + getCriticalPath() ) );
			oplist.push_back(resultAdder);
			
			inPortMap(resultAdder, "X", "R0");
			inPortMap(resultAdder, "Y", "R1");
			inPortMapCst(resultAdder, "Cin", "'0'");
			outPortMap( resultAdder, "R", "RAdder");
			vhdl << tab << instance(resultAdder, "ResultAdder") << endl;
			syncCycleFromSignal("RAdder");
			setCriticalPath( resultAdder->getOutputDelay("R"));

			vhdl << tab << "R <= RAdder;"<<endl;	
			outDelayMap["R"] = getCriticalPath();
		} else { //the generic case
	
			int chunkSize_ = target->lutInputs()/2;
			int chunksX =  int(ceil( ( double(wInX) / (double) chunkSize_) ));
			int chunksY =  int(ceil( ( double(wInY) / (double) chunkSize_) ));
	
			setCriticalPath( getMaxInputDelays(inputDelays) );

			REPORT(DEBUG, "X splitted in "<< chunksX << " chunks and Y in " << chunksY << " chunks; ");
			if (chunksX + chunksY > 2) { //we do more than 1 subproduct
				int widthX = wInX_;
				int widthY = wInY_;	
				bool swap = false;

				if (chunksX > chunksY){ //interchange X with Y
					int tmp = chunksX;
					chunksX = chunksY;
					chunksY = tmp;
	
					tmp = widthX;
					widthX = widthY;
					widthY = tmp;
					swap = true;
				}		

				vhdl<<tab<<declare("sX",chunkSize_*chunksX)<<" <= "<< (swap? "Y":"X")<<" & "<<zg( chunkSize_ * chunksX -widthX,0)<< ";"<<endl;
				vhdl<<tab<<declare("sY",chunkSize_*chunksY)<<" <= "<< (swap? "X":"Y")<<" & "<<zg(chunkSize_*chunksY-widthY,0)<< ";"<<endl;	
				//SPLITTINGS
				for (int k=0; k<chunksX ; k++)
					vhdl<<tab<<declare(join("x",k),chunkSize_)<<" <= sX"<<range((k+1)*chunkSize_-1,k*chunkSize_)<<";"<<endl;
				for (int k=0; k<chunksY ; k++)
					vhdl<<tab<<declare(join("y",k),chunkSize_)<<" <= sY"<<range((k+1)*chunkSize_-1,k*chunkSize_)<<";"<<endl;

				manageCriticalPath( target->lutDelay() + target->lutInputs()*target->localWireDelay() );
		
				if (sign_){
					/* ----------------------------------------------------*/
					//COMPUTE PARTIAL PRODUCTS
					for (int i=0; i<chunksY; i++)
						for (int j=0; j<chunksX; j++){
							if ((i<chunksY-1) && (j<chunksX-1)){
								vhdl<<tab<<declare(join("px",j,"y",i),2*chunkSize_+2)<<" <= ( \"0\" & " << join("x",j) <<") * " 
			                                        << "( \"0\" & " << join("y",i)<< ");" << endl;
							} else if ((i==chunksY-1) && (j<chunksX-1)){
								vhdl<<tab<<declare(join("px",j,"y",i),2*chunkSize_+1)<<" <= ( \"0\" & " << join("x",j) <<") * " 
			                                        << "(" << join("y",i)<< ");" << endl;
							} else if ((i<chunksY-1) && (j==chunksX-1)){	
								vhdl<<tab<<declare(join("px",j,"y",i),2*chunkSize_+1)<<" <= ( " << join("x",j) <<") * " 
			                                        << "( \"0\" & " << join("y",i)<< ");" << endl;
							} else{
								vhdl<<tab<<declare(join("px",j,"y",i),2*chunkSize_)<<" <= "<< join("x",j)<<" * " << join("y",i)<< ";" << endl;
							}								
						}		

					map<string, int> availableZeros;
					map<string, int> neededSignExtensions;

					int adderWidth = (chunksX+chunksY)*chunkSize_;
					// CONCATENATE PARTIAL PRODUCTS
					for (int i=0; i<2; i++){
						for (int j=0; j<chunksX; j++){
							int startIdx = chunksY-1-i;
							int paddWidth = adderWidth - chunkSize_*2*(startIdx/2+1);
							int endPaddWidth = chunkSize_*(j+startIdx%2);

							if (j!=chunksX-1){ //the last chunk makes us problems 
								if (i!=0)
									availableZeros[join("cp",i,j)] = paddWidth-endPaddWidth; 
							}else{
								//each of these subproducts requires sign extension
								for (int k=startIdx; k>=0; k-=2)
									if (k!=startIdx)
										neededSignExtensions[join("px",j,"y",k)]= adderWidth - (j+k+2)*chunkSize_;
							}
						}
					}

					map<string,int>::iterator it, it2;

					REPORT(DEBUG, "available ");						
					for (it = availableZeros.begin(); it!=availableZeros.end(); it++)
						REPORT(DEBUG, it->first << " -> " << it->second);

					REPORT(DEBUG, "needed");
					for (it = neededSignExtensions.begin(); it!=neededSignExtensions.end(); it++)
						REPORT(DEBUG, it->first << " -> " << it->second);
			
					map< string, pair<string,int> > reallocations;
					map< string, int> unallocated; 
			
					for (it=neededSignExtensions.begin(); it!= neededSignExtensions.end(); it++){
						bool reallocationsStatus = false;
						REPORT(DEBUG, "trying to allocate " << it->first << "," << it->second);
						for (it2=availableZeros.begin(); it2!= availableZeros.end() && (!reallocationsStatus); it2++){
							if (it2->second >= it->second){ //we have enough zeros to allocate
								reallocations[ it2->first ] = pair<string,int>(it->first, it->second); 
								reallocationsStatus = true;
								availableZeros.erase(it2->first); //delete the entry.
							}
						}
						if (!reallocationsStatus) // we could not realocate
							unallocated[it->first] = it->second;
					}
			
					map< string, pair<string,int> >::iterator it3;
			
					REPORT(DEBUG, "reallocated ");
					for (it3 = reallocations.begin(); it3!=reallocations.end(); it3++)
						REPORT(DEBUG, it3->first << " --> " << it3->second.first << ", " << it3->second.second);

					REPORT(DEBUG, "unallocated");
					for (it = unallocated.begin(); it!=unallocated.end(); it++)
						REPORT(DEBUG, it->first << " -> " << it->second);
			
					vector<string> operandNames;
			
					for (int i=0; i<2; i++){
						for (int j=0; j<chunksX; j++){
							int startIdx = chunksY-1-i;
							int paddWidth = adderWidth - chunkSize_*2*(startIdx/2+1);
							int endPaddWidth = chunkSize_*(j+startIdx%2);

							operandNames.push_back(join("cp",i,j));
							vhdl << tab << declare(join("cp",i,j),adderWidth) << " <= ";

							if (j!=chunksX-1){ //the last chunk makes us problems 
								if (i==0){ //multiply with the last chunk of y, so sign extend
									vhdl << rangeAssign(paddWidth-endPaddWidth-1, 0, join("px",j,"y",startIdx)+of(2*chunkSize_-1));
								}else{
									//we check the reallocations. Some zeros might be reallocated
									it3 = reallocations.find(join("cp",i,j));

									if (it3!=reallocations.end()){ // some reallocation happended here
										REPORT(DEBUG, "reallocated " << it3->second.second << " sign bits over " << paddWidth-endPaddWidth << " zero bits");
										vhdl << rangeAssign( it3->second.second-1, 0, it3->second.first+of(2*chunkSize_-1)) << " & " << zg(paddWidth-endPaddWidth-it3->second.second,0) ; 	
									}else{
										vhdl << zg(paddWidth-endPaddWidth,0) ; 	
									}
								}
								for (int k=startIdx; k>=0; k-=2)
									vhdl << " & " << use(join("px",j,"y",k))<<range(2*chunkSize_-1,0);
								vhdl << " & " << zg((startIdx<0?2:endPaddWidth),0) << ";" << endl;
							}else{
								//the ms one does't need any reallocations
								vhdl << rangeAssign(paddWidth-endPaddWidth-1, 0, join("px",j,"y",startIdx)+of(2*chunkSize_-1));
								for (int k=startIdx; k>=0; k-=2){
									if (k==startIdx){
										vhdl << " & " << join("px",j,"y",k)<<range(2*chunkSize_-1,0);
									}else{
										//check if the sign extension was reallocated
										bool reallocationsStatus = false;
										for(it3 = reallocations.begin(); it3!=reallocations.end() && (!reallocationsStatus); it3++){
											if (it3->second.first == join("px",j,"y",k)){
												reallocationsStatus = true;
											}
										}
								
										if (reallocationsStatus){ //if the sign extension was reallocated we simply continue
											vhdl << " & " << join("px",j,"y",k)<<range(2*chunkSize_-1,0);
										}else{
											//not reallocated.
											//we need to finish the current cp and start a new one
											vhdl << " & " << zg( (j+1 + k+1)*chunkSize_, 0) << ";" << endl;
											operandNames.push_back(join("cp",i,j,k));
											vhdl << tab << declare(join("cp",i,j,k),adderWidth) << " <= ";
											vhdl << rangeAssign(adderWidth - (j+k+2)*chunkSize_ -1 , 0, join("px",j,"y",k)+of(2*chunkSize_-1))
												 << " & " << join("px",j,"y",k) << range(2*chunkSize_-1,0);
										}											
									}
									if (k-2 <0) //we need to finish
										vhdl << " & " << zg( (j + k)*chunkSize_, 0) << ";--" << endl;
								}
							}
						}
					}

					IntMultiAdder* add =  new IntMultiAdder(target, adderWidth, operandNames.size(), inDelayMap("X0", getCriticalPath()));
					oplist.push_back(add);

					for (int i=0; i< signed(operandNames.size()); i++)
						inPortMap (add, join("X",i) , operandNames[i]);

					outPortMap(add, "R", "addRes");
					vhdl << instance(add, "adder");
					syncCycleFromSignal("addRes");
					setCriticalPath(add->getOutputDelay("R"));

					outDelayMap["R"] = getCriticalPath();	
					vhdl<<tab<<"R<=addRes" << range(adderWidth-1,adderWidth-wInX_-wInY_) << ";" << endl;		
				}else{ //unsigned version
				/* ----------------------------------------------------*/
				//COMPUTE PARTIAL PRODUCTS
					for (int i=0; i<chunksY; i++)
						for (int j=0; j<chunksX; j++)
							vhdl<<tab<<declare(join("px",j,"y",i),2*chunkSize_)<<" <= "<< join("x",j)<< " * " << join("y",i) << ";" << endl;
				
					int adderWidth = (chunksX+chunksY)*chunkSize_;
					// CONCATENATE PARTIAL PRODUCTS
					for (int i=0; i<2; i++){
						for (int j=0; j<chunksX; j++){
							vhdl << tab << declare(join("cp",i,j),adderWidth) << " <= ";

							int startIdx = chunksY-1-i;
							int paddWidth = adderWidth - chunkSize_*2*(startIdx/2+1);
							int endPaddWidth = chunkSize_*(j+startIdx%2);
							vhdl << zg(paddWidth-endPaddWidth,0); 

							for (int k=startIdx; k>=0; k-=2)
								vhdl << " & " << use(join("px",j,"y",k));
			
							vhdl << " & " << zg((startIdx<0?2:endPaddWidth),0) << ";" << endl;
						}
					}

					IntMultiAdder* add =  new IntMultiAdder(target, adderWidth, 2*chunksX, inDelayMap("X0", getCriticalPath()));
					oplist.push_back(add);

					for (int i=0; i<2; i++)
						for (int j=0; j<chunksX; j++)
							inPortMap (add, join("X",i*chunksX+j) , join("cp",i,j));

					outPortMap(add, "R", "addRes");
					vhdl << instance(add, "adder");
					syncCycleFromSignal("addRes");
					setCriticalPath(add->getOutputDelay("R"));
					vhdl<<tab<<"R<=addRes" << range(adderWidth-1,adderWidth-wInX_-wInY_) << ";" << endl;		
					outDelayMap["R"] = getCriticalPath();				
				}
			}else{// we perform just one multiplication 
				setCriticalPath(getMaxInputDelays(inputDelays));
				manageCriticalPath( target->lutDelay() + target->localWireDelay());
				vhdl << tab << " R <= X * Y;"<<endl;
				outDelayMap["R"] = getCriticalPath();				
			}
		}

		if (target_freq > maxDSPFrequency)
			target->setFrequency( target_freq );
	}

	LogicIntMultiplier::~LogicIntMultiplier() {
	}

	void LogicIntMultiplier::outputVHDL(std::ostream& o, std::string name) {
		licence(o);
		o << "library ieee; " << endl;
		o << "use ieee.std_logic_1164.all;" << endl;
		o << "use ieee.std_logic_arith.all;" << endl;
		if (sign_)
			o << "use ieee.std_logic_signed.all;" << endl;
		else
			o << "use ieee.std_logic_unsigned.all;" << endl;
		o << "library work;" << endl;
		outputVHDLEntity(o);
		newArchitecture(o,name);
		o << "	attribute multstyle : string;"<<endl;
   		o << "	attribute multstyle of arch : architecture is \"logic\";"<<endl;
		o << buildVHDLComponentDeclarations();	
		o << buildVHDLSignalDeclarations();
		beginArchitecture(o);		
		o<<buildVHDLRegisters();
		o << vhdl.str();
		endArchitecture(o);
	}


	void LogicIntMultiplier::emulate(TestCase* tc)
	{
		mpz_class svX = tc->getInputValue("X");
		mpz_class svY = tc->getInputValue("Y");
		
		if (! sign_){

			mpz_class svR = svX * svY;

			tc->addExpectedOutput("R", svR);
		}else{
			mpz_class big1 = (mpz_class(1) << (wInX_));
			mpz_class big1P = (mpz_class(1) << (wInX_-1));
			mpz_class big2 = (mpz_class(1) << (wInY_));
			mpz_class big2P = (mpz_class(1) << (wInY_-1));

			if ( svX >= big1P)
				svX = svX-big1;

			if ( svY >= big2P)
				svY = svY -big2;
			
			mpz_class svR = svX * svY;
			if ( svR < 0){
				mpz_class tmpSUB = (mpz_class(1) << (wOut_));
				svR = tmpSUB + svR; 
			}

			tc->addExpectedOutput("R", svR);
		}

	}
}
