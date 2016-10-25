#ifndef FXP_Shift_HPP
#define FXP_Shift_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <mpfr.h>
#include <gmpxx.h>

#include "Operator.hpp"
#include "FPNumber.hpp"
#include "IntAdder.hpp"


namespace flopoco{

   /** The FXP_Shift class */
   class FXP_Shift : public Operator
   {
   public:
      /**
		 * The  constructor
                 * @param[in]	target	the target device
                 * @param[in]	wE	the with of the exponent in input
                 * @param[in]	wFX	the with of the fixpoint in input
		 */
      FXP_Shift(Target* target, int wE, int wFX);

      /**
		 *  destructor
		 */
      ~FXP_Shift();

      void emulate(TestCase * tc);
      void buildStandardTestCases(TestCaseList* tcl);

   private:


   };
}
#endif
