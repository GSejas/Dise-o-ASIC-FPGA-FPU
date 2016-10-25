#ifndef _POWERROM_HH_
#define _POWERROM_HH_

#include "Power.hh"
#include "Util.hh"



class PowerROM : public Power {
public:
	PowerROM(int d_, Param &p_);
	~PowerROM();

	double estimArea();
	double estimDelay();

	void mpEval(mpz_t mpR, long long int b) const;

	void genVHDL(ostream &os, string name);

private:
	PWPolynomial calcErrTab(double shift = 0);

	PowerROMParam &pp;
};

#endif // _POWERROM_HH_
