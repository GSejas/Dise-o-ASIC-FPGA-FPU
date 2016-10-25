#ifndef FIXREALKCM_HPP
#define FIXREALKCM_HPP
#include "../Operator.hpp"
#include "../Table.hpp"

namespace flopoco{

	class FixRealKCM : public Operator
	{
	public:
		FixRealKCM(Target* target, int lsbIn, int msbIn, int signedInput, int lsbOut, string constant, 
							 double targetUlpError = 1.0, map<string, double> inputDelays = emptyDelayMap);
		~FixRealKCM();

		// Overloading the virtual functions of Operator
	  
		void emulate(TestCase* tc);

		int lsbIn;
		int msbIn;
		bool signedInput;
		int wIn;
		int lsbOut;
		int msbOut;
		int wOut;
		string constant;
		float targetUlpError;
		mpfr_t mpC;
		int msbC;
		int g;

	};
  
	class FixRealKCMTable : public Table
	{
	public:
		FixRealKCMTable(Target* target, FixRealKCM* mother, int i, int wIn, int wOut, bool signedInput, bool last, int logicTable = 1);
		~FixRealKCMTable();
    
		mpz_class function(int x);
		FixRealKCM* mother;
		int index; 
		bool signedInput;
		bool last;
	};

}


#endif
