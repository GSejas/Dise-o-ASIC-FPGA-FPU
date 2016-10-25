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

#include "FXP_Shift.hpp"

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


   FXP_Shift::FXP_Shift(Target* target, int wE, int wFX) :
         Operator(target) {

      ostringstream name;

      name<<"FXP_Shift_"<< wE<<"_"<<wFX;
      setName(name.str());

      setCopyrightString("Fabrizio Ferrandi (2011)");

      //parameter set up

      /* Set up the IO signals */


      addInput ("fA", wFX+2);
      addInput ("n", wE);
      addOutput ("fR", wFX+2);
      int maxShift;     /**< the maximum shift amount*/
      maxShift = intlog2(wFX);
      maxShift = min(maxShift,wE);

      /*	VHDL code description	*/
      vhdl << tab << declare("shift",(maxShift+1)*(wFX+1)) << range(wFX, 0) << " <= fA" << range(wFX+1, 1) << ";"<<endl;
      vhdl << tab << declare("s",maxShift+1) << of(0) << "<= fA" << of(0) << ";"<<endl;

      for(int i = 0; i < maxShift; ++i)
      {
         vhdl << tab << "with n" << of(i) << " select"<< endl;
         vhdl << tab << tab << "shift" << range((i+2)*(wFX+1)-1, (i+1)*(wFX+1)) << " <= "<<endl;
         vhdl << tab << tab << tab << rangeAssign(((1<<i)-1),0,"'0'") << " & shift" << range((i+1)*(wFX+1)-1, i*(wFX+1)+(1<<i)) <<
               " when '1',"<<endl;
         vhdl << tab << tab << tab << "shift" << range((i+1)*(wFX+1)-1, i*(wFX+1)) <<  " when others;"<<endl;
         vhdl << tab << "s" << of(i+1) << "<= s" << of(i) << " when shift" << range(i*(wFX+1)+((1<<i)-1), i*(wFX+1))
                << " = " << rangeAssign(((1<<i)-1),0,"'0'") << " else n" << of(i) << " or s" << of(i)<<";"<<endl<<endl;
       }
      if(maxShift < wE)
      {
         vhdl << tab << declare("kill",1) << " <= '0' when n" << range(wE-1, maxShift) << " = " << rangeAssign(wE-1, maxShift, "'0'") << " else '1';"<<endl;
         vhdl << tab << "with kill select"<<endl;
         vhdl << tab << tab << "fR" << range(wFX+1, 1) << " <= " << rangeAssign(wFX+1,1,"'0'") << " when '1'," << endl;
         vhdl << tab << tab << "shift" << range((maxShift+1)*(wFX+1)-1, maxShift*(wFX+1)) << " when others;" << endl;
         vhdl << tab <<  "fR" << of(0) << " <= s" << of(maxShift) << " when shift" << range((maxShift+1)*(wFX+1)-1, maxShift*(wFX+1)) << " = " << rangeAssign(wFX,0,"'0'") << " else kill or s" <<
               of(maxShift) << ";"<<endl;
      }
      else
      {
         vhdl << tab << "fR <= shift" << range((maxShift+1)*(wFX+1)-1, maxShift*(wFX+1)) <<" & s" << of(maxShift)<<";"<<endl;
      }
   }


   FXP_Shift::~FXP_Shift() {
   }


   void FXP_Shift::emulate(TestCase * tc)
   {
      // TODO
   }


   void FXP_Shift::buildStandardTestCases(TestCaseList* tcl){

   }

}
