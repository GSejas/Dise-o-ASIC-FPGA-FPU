/*
  The High Order Table Based Method for hardware function evaluation

  Author: Jérémie Detrey, FloPoCoized by Christian Klein and F. de Dinechin

  (developed for the polynomial-based square root)

  This file is part of the FloPoCo project
  developed by the Arenaire team at Ecole Normale Superieure de Lyon
  
  Initial software.
  Copyright © ENS-Lyon, INRIA, CNRS, UCBL,
  2005-2011  

  All rights reserved.

*/
#include "Util.hh"



void mpz_set_lli(mpz_t rop, unsigned long long int op)
{
	unsigned long int opL = op & (P(32)-1);
	unsigned long int opH = op >> 32;

	mpz_set_ui(rop, opH);
	mpz_mul_2exp(rop, rop, 32);
	mpz_add_ui(rop, rop, opL);
}

unsigned long long int mpz_get_lli(mpz_t op)
{
	unsigned long long int rop;
	mpz_t mpTmp;
	mpz_init(mpTmp);

	mpz_fdiv_r_2exp(mpTmp, op, 32);
	rop = mpz_get_ui(mpTmp);

	mpz_fdiv_q_2exp(mpTmp, op, 32);
	rop += ((unsigned long long int)mpz_get_ui(mpTmp)) << 32;
	mpz_clear(mpTmp);

	return rop;
}

double fact(int n)
{
	return n <= 1 ? 1 : n*fact(n-1);
}

double bin(int n, int k)
{
	return fact(n) / (fact(k) * fact(n-k));
}



void VHDLGen::genInteger(ostream &os, long long int x, int w)
{
	os << "\"";
	for (int i = w-1; i >= 0; i--)
		os << I(x,i+1,1);
	os << "\"";
}

void VHDLGen::genInteger(ostream &os, mpz_t mpX, int w)
{
	os << "\"";
	for (int i = w-1; i >= 0; i--)
		os << mpz_tstbit(mpX, i);
	os << "\"";
}

void VHDLGen::genROM(ostream &os, long long int *t, int wX, int wR, string x, string r)
{
	os << "  with " << x << " select" << endl;
	os << "    " << r << " <= ";
	for (long long int i = 0; i < P(wX); i++) {
		VHDLGen::genInteger(os, t[i], wR);
		os << " when ";
		VHDLGen::genInteger(os, i, wX);
		os << ", -- t[" << i << "] = " << t[i]  << endl;
		os << "        " << string(r.size(), ' ');
	}
	os << "\"" << string(wR, '-') << "\" when others;" << endl;
}

void VHDLGen::genROM(ostream &os, mpz_t *mpT, int wX, int wR, string x, string r)
{
	char buf[1024];

	os << "  with " << x << " select" << endl;
	os << "    " << r << " <= ";
	for (long long int i = 0; i < P(wX); i++) {
		VHDLGen::genInteger(os, mpT[i], wR);
		os << " when ";
		VHDLGen::genInteger(os, i, wX);
		os << ", -- t[" << i << "] = ";
		mpz_get_str(buf, 10, mpT[i]);
		os << buf << endl;
		os << "        " << string(r.size(), ' ');
	}
	os << "\"" << string(wR, '-') << "\" when others;" << endl;
}



double Estim::xorArea(int w)
{
	return .5 * w;
}

double Estim::xorDelay(int w)
{
	return 1.8;
}

double Estim::adderArea(int w, int n)
{
	return .5 * w * (n-1);
}

double Estim::adderDelay(int w, int n)
{
	return 2.5 * ceil(log2(n)) + .05 * w + 1.2;
}

double Estim::multiplierArea(int wX, int wY)
{
	return .5 * MAX(wX,wY) * (MIN(wX,wY)-1);
}

double Estim::multiplierDelay(int wX, int wY)
{
	return 2.8 * ceil(log2(MIN(wX,wY))) + .05 * MAX(wX,wY) + 1.2;
}

double Estim::romArea(int wX, int wR)
{
	return exp2(wX-5) * wR;
}

double Estim::romDelay(int wX, int wR)
{
	return .6 * wX;
}
