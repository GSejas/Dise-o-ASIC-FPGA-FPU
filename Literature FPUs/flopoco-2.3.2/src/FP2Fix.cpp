/*
*/

#include <iostream>
#include <sstream>
#include <vector>
#include <math.h>
#include <string.h>

#include <gmp.h>

#include <gmpxx.h>
#include "utils.hpp"
#include "Operator.hpp"

#include "FP2Fix.hpp"

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

#include <stdio.h>
#include <mpfr.h>

using namespace std;

namespace flopoco{

   extern vector<Operator*> oplist;

#define DEBUGVHDL 0


   FP2Fix::FP2Fix(Target* target, int LSB, int MSB, int Signed,int wE, int wF, bool trunc_p) :
         Operator(target) {

      ostringstream name;

      if ((MSB < LSB)){
         cerr << " FP2Fix: Input constraint LSB <= MSB not met."<<endl;
         exit (EXIT_FAILURE);
      }

      int wFX = MSB - LSB + 1;
      mpz_class maxExpWE = mpz_class(1)<<(wE-1);
      mpz_class minExpWE = 1 - maxExpWE;

      int eMax = static_cast<int>(maxExpWE.get_si()) - 1;
      int wFX0;
      if(eMax+1 < MSB + 1)
         wFX0 = eMax + 1 - LSB;
      else
         wFX0 = MSB + 1 - LSB;

      if (( maxExpWE < MSB ) || ( minExpWE > LSB)){
         cerr << " The exponent is too small for full coverage. Try increasing the exponent !"<<endl;
         exit (EXIT_FAILURE);
      }
      int absMSB = MSB>=0?MSB:-MSB;
      int absLSB = LSB>=0?LSB:-LSB;
      name<<"FP2Fix_"<< (LSB<0?"M":"")<<absLSB<<"_"<<(MSB<0?"M":"")<<absMSB <<"_"<< (Signed==1?"S":"US") << "_" <<wE<<"_"<<wF;
      setName(name.str());

      setCopyrightString("Fabrizio Ferrandi (2011)");

      /* Set up the IO signals */

      addFPInput ("I", wE,wF);
      addOutput ("O", MSB-LSB+1);

      /*	VHDL code description	*/
      vhdl << tab << declare("neA0",wE) << " <= not I" << range(wE+wF-1,wF) << ";"<<endl;
      mpz_class tobeshiftedof;
      if(eMax < MSB)
         tobeshiftedof = eMax + eMax;
      else
         tobeshiftedof = eMax+MSB;
      vhdl << tab << declare("tobeshiftedof",wE) << " <= conv_std_logic_vector(" << tobeshiftedof << ", "<< wE<<");"<<endl;

      Exponent_difference = new IntAdder(target, wE);
      Exponent_difference->changeName(getName()+"Exponent_difference");
      oplist.push_back(Exponent_difference);
      inPortMap  (Exponent_difference, "X", "tobeshiftedof");
      inPortMap  (Exponent_difference, "Y", "neA0");
      inPortMapCst(Exponent_difference, "Cin", "'1'");
      outPortMap (Exponent_difference, "R","eA1");
      vhdl << instance(Exponent_difference, "Exponent_difference");

      setCycleFromSignal("Exponent_differenceS");

      if (wF+1 < wFX0+2)
      {
         vhdl << tab << declare("fA0",wFX0+2) << " <= \"1\" & I" << range(wF-1, 0) << " & " << rangeAssign(wFX0-wF,0,"'0'")<<";"<<endl;
      }
      else
      {
         vhdl << tab << declare("fA0",wFX0+2) << range(wFX0+1,1) << " <= \"1\" & I" << range(wF-1, wF-wFX0) << ";" << endl;
         vhdl << tab << "fA0" << of(0) << " <= '0' when I" << range(wF-wFX0-1, 0) << " = " << rangeAssign(wF-wFX0-1,0,"'0'") << " else '1';"<<endl;
      }
      //FXP shifter mappings
      FXP_shifter = new FXP_Shift(target, wE, wFX0);
      oplist.push_back(FXP_shifter);

      inPortMap (FXP_shifter, "fA", "fA0");
      inPortMap (FXP_shifter, "n", "eA1");
      outPortMap (FXP_shifter, "fR", "fA1");
      vhdl << instance(FXP_shifter, "FXP_shifter");

      syncCycleFromSignal("FXP_shifter");

      if(trunc_p)
      {
         vhdl << tab << declare("fA2",wFX+1) <<  "<= " << rangeAssign(wFX-wFX0,0,"'0'") << " & fA1" << range(wFX0+1, 2)<< ";"<<endl;
      }
      else
      {
         vhdl << tab << declare("round",1) << " <= fA1(1) and (fA1(2) or fA1(0));"<<endl;

         vhdl << tab << declare("fA2a",wFX+1) <<  "<= " << rangeAssign(wFX-wFX0,0,"'0'") << " & fA1" << range(wFX0+1, 2)<< ";"<<endl;
         vhdl << tab << declare("fA2b",wFX+1) <<  "<= " << rangeAssign(wFX,1,"'0'") << " & round;"<<endl;
         MantSum = new IntAdder(target, wFX+1);
         MantSum->changeName(getName()+"MantSum");
         oplist.push_back(MantSum);
         inPortMap  (MantSum, "X", "fA2a");
         inPortMap  (MantSum, "Y", "fA2b");
         inPortMapCst(MantSum, "Cin", "'0'");
         outPortMap (MantSum, "R","fA2");
         vhdl << instance(MantSum, "MantSum");

         setCycleFromSignal("MantSumS");
      }
      if (eMax+1 > MSB+1)
      {
         vhdl << tab << declare("overFl0",1) << "<= '1' when I" << range(wE+wF-1,wF) << " > conv_std_logic_vector("<< eMax+MSB << "," << wE << ") else I" << of(wE+wF+2)<<";"<<endl;
      }
      else
      {
         vhdl << tab << declare("overFl0",1) << "<= I" << of(wE+wF+2)<<";"<<endl;
      }
      vhdl << tab << declare("overFl1",1) << " <= fA2" << of(wFX) << " or fA2" << of(wFX-1)<<";"<<endl;
      if (minExpWE < LSB)
         vhdl << tab << declare("undrFl0",1) << " <= '1' when I" << range(wE+wF-1,wF) << " < conv_std_logic_vector(" << eMax+LSB-1 << "," << wE <<
               ") else not (I" << of (wE+wF+2) << " or I" << of(wE+wF+1) << ");" << endl;
      else
         vhdl << tab << declare("undrFl0",1) << " <= not (I" << of (wE+wF+2) << " or I" << of(wE+wF+1) << ");" << endl;
      vhdl << tab << declare("fA3", wFX) << of(0) << " <= fA2" << of(0) << " xor I" << of(wE+wF) << ";" << endl;
      for(int i=1; i < wFX; ++i)
         vhdl << tab << "fA3" << of(i) << " <= fA2" << of(i) << " xor I" << of(wE+wF) << ";" << endl;
      vhdl << tab << declare("fA3b", wFX) << " <= " << rangeAssign(wFX-1,1,"'0'") << " & I(" << wE+wF << ");" << endl;

      MantSum2 = new IntAdder(target, wFX);
      MantSum2->changeName(getName()+"MantSum2");
      oplist.push_back(MantSum2);
      inPortMap  (MantSum2, "X", "fA3");
      inPortMap  (MantSum2, "Y", "fA3b");
      inPortMapCst(MantSum2, "Cin", "'0'");
      outPortMap (MantSum2, "R","fA4");
      vhdl << instance(MantSum2, "MantSum2");

      setCycleFromSignal("MantSum2S");

      vhdl << tab << declare("eTest",2) << " <= (overFl0 or overFl1) & undrFl0;" << endl;

      vhdl << tab << "with eTest select" << endl;
      vhdl << tab << tab << "O <= " << rangeAssign(wFX-1,0,"'0'") << " when \"01\"," << endl;
      vhdl << tab << tab << "I" << of(wE+wF) << " & (" << wFX-2 << " downto 0 => not I" << of(wE+wF) << ") when \"10\","<<endl;
      vhdl << tab << tab << "fA4 when others;"<<endl;
   }


   FP2Fix::~FP2Fix() {
   }


   void FP2Fix::emulate(TestCase * tc)
   {
      // TODO
   }


   void FP2Fix::buildStandardTestCases(TestCaseList* tcl){

   }

}
