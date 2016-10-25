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
#include "PowerROM.hh"



PowerROM::PowerROM(int d_, Param &p_)
	: Power(d_, p_), pp(*(PowerROMParam *)((TermPowMultParam *)p.t[d])->p)
{
	PWPolynomial errP[2];
	errP[0] = calcErrTab(0);
	errP[1] = calcErrTab(E(-pp.beta+1) - E(-p.beta+1));

	errPow[0] = PWPolynomial::max(errP[0], errP[1]);
	errPow[1] = PWPolynomial::min(errP[0], errP[1]);

	mpz_t mpErr[2], mpTmp;
	for (int i = 0; i < 2; i++)
		mpz_init(mpErr[i]);
	mpz_init(mpTmp);

	mpz_set_si(mpErr[0], -1);
	mpz_set_ui(mpErr[1], (pp.beta == p.beta) ? 1 : 0);

	mpz_set_ui(mpTmp, 1);
	mpz_mul_2exp(mpTmp, mpTmp, d*p.beta-pp.lambda);
	mpz_add(mpErr[0], mpErr[0], mpTmp);
	mpz_sub(mpErr[1], mpErr[1], mpTmp);

	for (int i = 0; i < 2; i++) {
		errPow[i] = errPow[i] + mpz_get_d(mpErr[i]) * E(-d*p.beta);
		mpz_clear(mpErr[i]);
	}
	mpz_clear(mpTmp);
}

PowerROM::~PowerROM()
{
}

double PowerROM::estimArea()
{
	return Estim::romArea(pp.beta, pp.lambda-1);
}

double PowerROM::estimDelay()
{
	return Estim::romDelay(pp.beta, pp.lambda-1);
}

void PowerROM::mpEval(mpz_t mpR, long long int b) const
{
	b <<= p.beta+1-pp.beta;

	mpz_t mpB;

	mpz_init(mpB);
	mpz_set_lli(mpB, b+1);
	mpz_pow_ui(mpR, mpB, d);

	mpz_set_lli(mpB, b+P(p.beta+1-pp.beta)-1);
	mpz_pow_ui(mpB, mpB, d);
	mpz_add(mpR, mpR, mpB);

	mpz_fdiv_q_2exp(mpR, mpR, d*p.beta+2-pp.lambda);

	mpz_set_ui(mpB, 1);
	mpz_mul_2exp(mpB, mpB, pp.lambda-1);
	mpz_add(mpR, mpR, mpB);

	mpz_clear(mpB);
}

PWPolynomial PowerROM::calcErrTab(double shift)
{
	PWPolynomial errP;

	Polynomial p_ = Polynomial(d, 1) >> (E(-p.beta+1) * .5);
	Polynomial pr = (p_ + (p_ >> (E(-pp.beta+1)-E(-p.beta+1)))) * .5;

	if (shift < E(-pp.beta+1))
		errP.set(1+shift-E(-pp.beta+1), 1, p_ - pr.eval(1-E(-pp.beta+1)));

	errP.set(0, 1+shift-E(-pp.beta+1), p_ - (pr << shift));

	return errP;
}

void PowerROM::genVHDL(ostream &os, string name)
{
	os << "--------------------------------------------------------------------------------" << endl;
	os << "-- PowerROM instance for order-" << d << " powering unit." << endl;
	os << "-- Decomposition:" << endl;
	os << "--   beta_" << d << " = " << pp.beta << "; lambda_" << d << " = " << pp.lambda << "." << endl;
	os << endl;

	os << "library ieee;" << endl;
	os << "use ieee.std_logic_1164.all;" << endl;
	os << "use ieee.std_logic_arith.all;" << endl;
	os << "use ieee.std_logic_unsigned.all;" << endl;
	os << endl;

	os << "entity " << name << " is" << endl;
	os << "  port ( ";
	if(pp.beta >= 2)
		os << "x : in  std_logic_vector(" << (pp.beta-2) << " downto 0);" << endl << "         ";
	os << "r : out std_logic_vector(" << (pp.lambda-1) << " downto 0) );" << endl;
	os << "end entity;" << endl;
	os << endl;

	os << "architecture arch of " << name << " is" << endl;
	os << "begin" << endl;

	mpz_t *mpT = new mpz_t[P(pp.beta-1)];
	for (long long int i = 0; i < P(pp.beta-1); i++) {
		mpz_init(mpT[i]);
		mpEval(mpT[i], i);
	}

	if(pp.beta >= 2)
		VHDLGen::genROM(os, mpT, pp.beta-1, pp.lambda, "x", "r");
	else {
		os << "  r <= ";
		VHDLGen::genInteger(os, mpT[0], pp.lambda);
		os << ";" << endl;
	}		

	for (long long int i = 0; i < P(pp.beta-1); i++)
		mpz_clear(mpT[i]);
	delete[] mpT;

	os << "end architecture;" << endl;
}
