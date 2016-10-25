#ifndef FPPipeline_HPP
#define FPPipeline_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <unistd.h>

#include "FPAdderSinglePath.hpp"

#include "FPMultiplier.hpp"
#include "FPSquarer.hpp"
#include "FPSqrt.hpp"
#include "FPExp.hpp"
#include "FPLog.hpp"
#include "FPSqrtPoly.hpp"
#include "FPSqrt.hpp"
#include "ConstMult/FPRealKCM.hpp"

#include "Operator.hpp"
#include "FPExpressions/ExpressionParserData.h"
// #include "HOTBM/sollya.h"	// Do NOT use libsollya from user's environment
// #include "UtilSollya.hh"

namespace flopoco{
	
	extern vector<Operator*> oplist;
	
	/** The FPPipeline class.  */
	class FPPipeline : public Operator {
		public:
			/** Class that assembles floating-point operators starting with 
			 * an untyped, untimed Python-like description of the computational
			 * datapath
			 * @param[in] target     The target FPGA object
			 * @param[in] filename   The filename containing the datapath
			 * @param[in] wE         Exponent width
			 * @param[in] wF         Fraction width
			**/ 
			FPPipeline(Target* target, string filename, int wE, int wF);
			
			/**
			* FPPipeline destructor
			*/
			~FPPipeline();
			
			/**
			 * Function which generates the VHDL code containing the assembled 
			 * operators starting from the node containg the output variable
			 * @param[in] n    The output variable (one of the output node list)
			 * @param[in] top  Boolean describing if this function is called from
			 * the statement level, or in some recursion level
			*/
			void generateVHDL_c(node* n, bool top){
				REPORT(DETAILED, "Generating VHDL ... ");
				
				if (n->type == 0){
					//we start at cycle 0, for now
					setCycle(0);
					//check if inputs are already declared. if not declare the inputs
					if (n->name!=NULL){
						if (!isSignalDeclared(n->name)){
							REPORT(DETAILED, "signal " << n->name << "   declared");
							addFPInput(n->name, wE, wF);
						}
					}else{
						//this is a constant, so it has no name, and is not declared
					}
				}else{
					//iterate on all inputs
					nodeList* lh = n->nodeArray;
					while (lh!=NULL){
						generateVHDL_c(lh->n, false);
						lh=lh->next;
					}
					lh = n->nodeArray;
					while (lh!=NULL){
						if (lh->n->name!=NULL)
							syncCycleFromSignal(lh->n->name);
						lh=lh->next;
					}
					REPORT(DETAILED, "finished with node");
				}
				
				bool hadNoName = (n->name==NULL);
				
				if (n->name==NULL){
					//assign a unique name;
					ostringstream t;
					t << "tmp_var_"<<getNewUId();
					string w = t.str();
					char *c  = new char[t.str().length()+1];
					c = strncpy(c, t.str().c_str(), t.str().length() );
					c[t.str().length()]=0;
					REPORT(DETAILED, " new temporary variable created "<< c <<" size="<<t.str().length());
					n->name = c;
					REPORT(DETAILED, " the value was created for the constant " << n->value);
				}
				
				if ((hadNoName)&&(n->type == 0)){
					//it is a constant_expr
					mpfr_t mpx;
					mpfr_init2 (mpx, wF+1);
					mpfr_set_str (mpx, n->s_value, 10, GMP_RNDN);
					vhdl << tab << declare(n->name, wE+wF+3) << " <= \""<<fp2bin(mpx, wE, wF)<< "\";"<<endl;
				}

				ostringstream t;				
				if (n->isOutput){
					t << "out_" << n->name;
					addFPOutput(t.str(), wE, wF);
				}

				
				Operator* op1;
				//let's instantiate the proper operator

				switch (n->type) {

					case 0:{  //input
						break;
					}
					
					case 1:{ //adder 
						REPORT(DETAILED, " instance adder");
						
						op1 = new FPAdderSinglePath(target_, wE, wF, wE, wF, wE, wF);
						oplist.push_back(op1);

						inPortMap( op1, "X", n->nodeArray->n->name);
						inPortMap( op1, "Y", n->nodeArray->next->n->name);
						outPortMap( op1, "R", n->name);
						
						ostringstream tmp;
						tmp << "adder" << getNewUId();
						vhdl << instance(op1, tmp.str())<<endl;
						break;
					}
					case 2:{ //subtracter 
						REPORT(DETAILED, " instance subtracter");
						
						op1 = new FPAdderSinglePath(target_, wE, wF, wE, wF, wE, wF);
						oplist.push_back(op1);

						ostringstream temp;
						temp << "minus_"<<n->nodeArray->next->n->name;
						vhdl<<tab<<declare(temp.str(),wE+wF+3) << " <= " << n->nodeArray->next->n->name <<range(wE+wF+2,wE+wF+1)
						                                       << " & not(" << n->nodeArray->next->n->name <<of(wE+wF)<<")"
						                                       << " & " << n->nodeArray->next->n->name << range(wE+wF-1,0)<<";"<<endl;  

						inPortMap( op1, "X", n->nodeArray->n->name);
						inPortMap( op1, "Y", temp.str());
						outPortMap( op1, "R", n->name);
						
						ostringstream tmp;
						tmp << "adder" << getNewUId();
						vhdl << instance(op1, tmp.str())<<endl;
						break;
					}

					case 3:{ //multiplier
						REPORT(DETAILED, " instance multiplier");
						if (((n->nodeArray->n->type==0)&&(n->nodeArray->n->s_value!=NULL)) || 
						    ((n->nodeArray->next->n->type==0)&&(n->nodeArray->next->n->s_value!=NULL))){
							REPORT(INFO, "constant node detected");
							ostringstream constant_expr, operand_name;
							if ((n->nodeArray->n->type==0)&&(n->nodeArray->n->s_value!=NULL)){
								//the first one is the constant
								constant_expr << n->nodeArray->n->s_value;
								operand_name << n->nodeArray->next->n->name;		
							}else{
								constant_expr << n->nodeArray->next->n->s_value;
								operand_name << n->nodeArray->n->name;		
							}
							
							REPORT(INFO, "Constant is "<< constant_expr.str());

							op1 = new FPRealKCM(target_,wE, wF, constant_expr.str());
							oplist.push_back(op1);
							
							inPortMap( op1, "X", operand_name.str());
							outPortMap( op1, "R", n->name);

							ostringstream tmp;
							tmp << "constant_multiplier" << getNewUId();
							vhdl << instance(op1, tmp.str())<<endl;
						}else{
							//we just plug-in a regular multiplier
							op1 = new FPMultiplier(target_, wE, wF, wE, wF, wE, wF);
							oplist.push_back(op1);

							inPortMap( op1, "X", n->nodeArray->n->name);
							inPortMap( op1, "Y", n->nodeArray->next->n->name);
							outPortMap( op1, "R", n->name);
						
							ostringstream tmp;
							tmp << "multiplier" << getNewUId();
							vhdl << instance(op1, tmp.str())<<endl;
						}
						break;
					}
					case 5:{ //squarer
						REPORT(DETAILED, " instance squarer");
						
						op1 = new FPSquarer(target_, wE, wF, wF);
						oplist.push_back(op1);

						inPortMap( op1, "X", n->nodeArray->n->name);
						outPortMap( op1, "R", n->name);
						
						ostringstream tmp;
						tmp << "squarer" << getNewUId();
						vhdl << instance(op1, tmp.str())<<endl;
						break;
					}
					case 6:{ //sqrt
						REPORT(DETAILED, " instance sqrt");
#ifdef ha
						int degree = int ( floor ( double(wF) / 10.0) );
						op1 = new FPSqrtPoly(target_, wE, wF, 0, degree);
#else
						op1 = new FPSqrt(target_, wE, wF);//, 1, degree);
#endif
						oplist.push_back(op1);
						
						inPortMap( op1, "X", n->nodeArray->n->name);
						outPortMap( op1, "R", n->name);
						
						ostringstream tmp;
						tmp << "squarer" << getNewUId();
						vhdl << instance(op1, tmp.str())<<endl;
						break;
					}
					case 7:{ //exponential
						REPORT(DETAILED, " instance exp");
						
						op1 = new FPExp(target_, wE, wF, 0, 0);
						oplist.push_back(op1);

						inPortMap( op1, "X", n->nodeArray->n->name);
						outPortMap( op1, "R", n->name);
						
						ostringstream tmp;
						tmp << "exponential" << getNewUId();
						vhdl << instance(op1, tmp.str())<<endl;
						break;
					}
					case 8:{ //logarithm
						REPORT(DETAILED, " instance log");
						
						op1 = new FPLog(target_, wE, wF, 9);
						oplist.push_back(op1);

						inPortMap( op1, "X", n->nodeArray->n->name);
						outPortMap( op1, "R", n->name);
						
						ostringstream tmp;
						tmp << "logarithm" << getNewUId();
						vhdl << instance(op1, tmp.str())<<endl;
						break;
					}
					case 17:{ //assignement
						vhdl << tab << declare( n->name, wE+wF+3) << "<= " << n->nodeArray->n->name <<";"<<endl;
						break;
					}

					default:{
						
						cerr << "nothing else implemented yet for operation code: "<<n->type << endl;
						exit(-1);
					}
				}
				
				if (n->isOutput){
					syncCycleFromSignal(n->name);
					nextCycle();
 					vhdl << tab << "out_"<<n->name << " <= " << n->name << ";" << endl;
				}
				
			};


			
		protected:
			int wE;   /**< Exponent size*/ 
			int wF;  /**< Significand fraction size */
	};
	
}
#endif
