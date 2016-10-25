/*
  TaMaDiDecoder evaluation of worst cases for rounding functions without 
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

#include "TaMaDiDecoder.hpp"


using namespace std;

namespace flopoco{

	extern vector<Operator*> oplist;

	TaMaDiDecoder::TaMaDiDecoder(Target* target, int n):
	Operator(target)
	{
		srcFileName="TaMaDiDecoder";
		ostringstream name;

		int outWires = intlog2(n-1); 
		name <<"TaMaDiDecoder_n"<<n<<"_output"<<outWires<<"_uid"<<getNewUId();
		setName(name.str()); 

		setCopyrightString("Bogdan Pasca (2011)");		

		/* Set up the I/O signals of of the entity */
		int inWires = intlog2(n-1);
		addInput   ("X",inWires,true);
		addOutput  ("R",n,1,true);

		vhdl << tab << "with X select" << endl;
		vhdl << tab << "R <= "<<endl;
		for (int i=0;i<n;i++){
			vhdl << tab << tab <<"\"";
			for (int k=0;k<i;k++)
				vhdl << "0";
			vhdl << "1";
			for (int k=i+1;k<n;k++)
				vhdl << "0";
			vhdl <<"\"";
			vhdl << " when \"" << unsignedBinary( n-1-i, inWires) <<"\","<<endl;

		}
		vhdl <<  tab << tab << zg(n) <<" when others;" << endl;
	}

	TaMaDiDecoder::~TaMaDiDecoder() {
	}

}



