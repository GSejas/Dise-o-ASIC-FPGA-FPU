/*
  TaMaDiPriorityEncoder evaluation of worst cases for rounding functions without 
  overheating the planet

  This file is part of the FloPoCo project 
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Author :   Bogdan Pasca

  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,  
  2008-2010.
  All rights reserved.

 */

#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <vector>
#include <math.h>
#include <string.h>
#include <gmp.h>
#include <mpfr.h>
#include <cstdlib>
#include <gmpxx.h>
#include <utils.hpp>
#include <Operator.hpp>

#include "TaMaDiPriorityEncoder.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiPriorityEncoder::TaMaDiPriorityEncoder(Target* target, int n):
	Operator(target)
	{
		srcFileName="TaMaDiPriorityEncoder";
		ostringstream name;

		int outWires = intlog2(n-1); 
		name <<"TaMaDiPriorityEncoder_n"<<n<<"_output"<<outWires<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		addInput   ("X",n,true);
		addOutput  ("R",outWires,1,true);

//		vhdl << tab << "with X select" << endl;
//		vhdl << tab << "R <= "<<endl;
//		for (int i=0;i<n;i++){
//			vhdl << tab << tab << "\""<< unsignedBinary(n-1-i,outWires) <<"\" when \"";
//			for (int k=0;k<i;k++)
//				vhdl << "0";
//			vhdl << "1";
//			for (int k=i+1;k<n;k++)
//				vhdl << "X";
//			vhdl <<"\","<<endl;
//		}
//		vhdl << tab << tab << tab << zg(outWires) <<" when others;" << endl;

		vhdl << tab << "R <= "<<endl;
		for (int i=0;i<n;i++){
			vhdl << tab << tab << "\""<< unsignedBinary(n-1-i,outWires) <<"\" when ";
			vhdl << "X("<<n-i-1<<")='1' else"  << endl;
		}
		ostringstream dcare;
		dcare << "\"";
		for (int i=0; i<outWires; i++)
			dcare << "X";
		dcare << "\"";	
		
		vhdl << tab << tab << tab << dcare.str() <<";" << endl;
	}

	TaMaDiPriorityEncoder::~TaMaDiPriorityEncoder() {
	}

}



