#ifndef FP2Fix_HPP
#define FP2Fix_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>

#include "Operator.hpp"
#include "FPNumber.hpp"
#include "FXP_Shift.hpp"
#include "IntAdder.hpp"


namespace flopoco{

   /** The FP2Fix class */
   class FP2Fix : public Operator
   {
   public:
      /**
		 * The  constructor
		 * @param[in]		target		the target device
                 * @param[in]		MSB			the MSB of the output number for the convertion result
                 * @param[in]		LSB			the LSB of the output number for the convertion result
                 * @param[in]		wER			the with of the exponent in input
                 * @param[in]		wFR			the with of the fraction in input
                 * @param[in]		trunc_p			the output is not rounded when trunc_p is true
                 */
      FP2Fix(Target* target, int LSBO, int MSBO, int Signed,int wER, int wFR, bool trunc_p);

      /**
		 *  destructor
		 */
      ~FP2Fix();


      void emulate(TestCase * tc);
      void buildStandardTestCases(TestCaseList* tcl);



   private:

      /** The integer adder object to compute the correct value of the exponent*/
      IntAdder* Exponent_difference;
      IntAdder* MantSum;
      IntAdder* MantSum2;
      FXP_Shift*FXP_shifter;

      int MSB;
      int LSB;


   };
}
#endif
