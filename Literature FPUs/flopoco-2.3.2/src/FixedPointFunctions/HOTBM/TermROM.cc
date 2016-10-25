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
#include "TermROM.hh"

#include <iostream>

TermROM::TermROM(int d_, double *k_, Param &p_)
	: Term(d_, k_, p_), tp(*(TermROMParam *)p.t[d]), pList(new Polynomial[P(tp.alpha)]), table(NULL)
{
	int n = P(p.alpha-tp.alpha);
	for (long long int i = 0; i < P(tp.alpha); i++) {
		Polynomial p_(d, (k[i*n] + k[(i+1)*n-1]) * .5);
		pList[i] = (p_ + (p_ >> (E(-p.alpha-tp.beta)-E(-p.wI)))) * .5;
	}

	PWPolynomial errP[2];
	errP[0] = calcErrTab(0);
	errP[1] = calcErrTab(E(-p.alpha-tp.beta) - E(-p.wI));

	errMethod[0] = PWPolynomial::max(errP[0], errP[1]);
	errMethod[1] = PWPolynomial::min(errP[0], errP[1]);
}

TermROM::~TermROM()
{
	delete[] pList;
	if (table)
		delete[] table;
}

void TermROM::roundTables(int g, bool full, double *kAdjust)
{
	p.g = g;
	
	int beta_ = tp.beta ? tp.beta-1 : 0;

	if (full) {
		if (table)
			delete[] table;
		table = new long long int[P(tp.alpha+beta_)];
	}

	long long int tMin = P(60), tMax = -P(60);
	for (long long int a = 0; a < P(tp.alpha); a += full ? 1 : MAX(P(tp.alpha)-1,1)) {
		Polynomial p_ = pList[a] + (!d && kAdjust ? kAdjust[a] : 0);
		for (long long int b = 0; b < P(beta_); b += full ? 1 : MAX(P(beta_)-1,1)) {
			long long int r;
			if (tp.beta)
				r = (long long int)floor(p_.eval(b * E(-p.alpha-tp.beta) + E(-p.wI-1)) * P(p.wO+p.g));
			else
				r = (long long int)floor(p_.eval(-E(-p.alpha-1) + E(-p.wI-1)) * P(p.wO+p.g));
			if (full)
				table[a*P(beta_)+b] = r;
			if (r < tMin)
				tMin = r;
			if (r > tMax)
				tMax = r;
		}
	}

	if(tMin < 0) {
		if(tMax >= 0) {
			// Both positive and negative values: use 2's-complement encoding
			signTable = SignMixed;
		}
		else {
			signTable = SignNegative;
		}
	}
	else {
		signTable = SignPositive;
	}
	
	if(signTable == SignMixed) {
		// 2's-complement
		tMax = std::max(tMax, -tMin-1);
		wTable = !tMax ? 1 : (int)floor(log2(tMax))+2;
	}
	else {
		// 2's-complement with implicit sign bit
		if(signTable == SignNegative)
			tMax = -tMin-1;
		wTable = !tMax ? 1 : (int)floor(log2(tMax))+1;
	}
}

double TermROM::estimArea()
{
	return Estim::xorArea(tp.beta-1)
			 + Estim::romArea(tp.alpha + (tp.beta?tp.beta-1:0), wTable)
			 + Estim::xorArea(wTable);
}

double TermROM::estimDelay()
{
	return Estim::xorDelay(tp.beta-1)
			 + Estim::romDelay(tp.alpha + (tp.beta?tp.beta-1:0), wTable)
			 + Estim::xorDelay(wTable);
}

double TermROM::eval(long long int a, long long int b) const
{
	if (tp.beta) {
		bool sign = !I(b,tp.beta,1);
		b = I(b,tp.beta-1,tp.beta-1) ^ (sign * (P(tp.beta-1)-1));
		double r = pList[a].eval(b * E(-p.alpha-tp.beta) + E(-p.wI-1));
		return (!(d % 2) || !sign) ? r : -r;
	}
	else
		return pList[a].eval(-E(-p.alpha-1) + E(-p.wI-1));
}

long long int TermROM::evalRound(long long int a, long long int b) const
{
	if (tp.beta) {
		bool sign = !I(b,tp.beta,1);
		b = I(b,tp.beta-1,tp.beta-1) ^ (sign * (P(tp.beta-1)-1));
		long long int r = table[a*P(tp.beta-1)+b];
		return (!(d % 2) || !sign) ? r : -r-1;
	}
	else
		return table[a];
}

PWPolynomial TermROM::calcErrTab(double shift)
{
	PWPolynomial errP;

	for (long long int i = 0; i < P(p.alpha); i++) {
		long long int a = I(i,p.alpha,tp.alpha);
		Polynomial p_ = Polynomial(d, k[i]);
		double ia =  i    * E(-p.alpha);
		double ib = (i+1) * E(-p.alpha);
		double ib_ = ib - E(-p.wI);
		double delta = E(-p.alpha-tp.beta);

		if (shift > 0)
			errP.set(ia, ia+shift, (p_ - pList[a].eval(-E(-p.alpha-1) + E(-p.wI-1))) << ((ia+ib_)/2));

		if (shift < delta-E(-p.wI))
			errP.set(ib+shift-(delta-E(-p.wI)), ib, (p_ - pList[a].eval(E(-p.alpha-1)-delta + E(-p.wI-1))) << ((ia+ib_)/2));

		errP.set(ia+shift, ib+shift-(delta-E(-p.wI)), (p_ - (pList[a] << shift)) << ((ia+ib_)/2));
	}

	return errP;
}

void TermROM::genVHDL(ostream &os, string name)
{
	int beta_ = tp.beta ? tp.beta-1 : 0;

	os << "--------------------------------------------------------------------------------" << endl;
	os << "-- TermROM instance for order-" << d << " term." << endl;
	os << "-- Decomposition:" << endl;
	os << "--   alpha_" << d << " = " << tp.alpha << "; ";
	if (tp.beta)
		os << "beta_" << d << " = " << tp.beta << " (1+" << (tp.beta-1) << ")" << "; ";
	else
		os << "beta_" << d << " = 0; ";
	os << "wO_" << d << " = " << wTable << "; " << "wO = " << p.wO << "; " << "g = " << p.g << "." << endl;
	os << endl;

	os << "library ieee;" << endl;
	os << "use ieee.std_logic_1164.all;" << endl;
	os << "use ieee.std_logic_arith.all;" << endl;
	os << "use ieee.std_logic_unsigned.all;" << endl;
	os << endl;

	os << "entity " << name << " is" << endl;
	os << "  port ( ";
	if (tp.alpha)
		os << "a : in  std_logic_vector(" << (tp.alpha-1) << " downto 0);" << endl << "         ";
	if (tp.beta)
		os << "b : in  std_logic_vector(" << (tp.beta-1) << " downto 0);" << endl << "         ";
	os << "r : out std_logic_vector(" << (p.wO+p.g) << " downto 0) );" << endl;
	os << "end entity;" << endl;
	os << endl;

	os << "architecture arch of " << name << " is" << endl;
	if (tp.beta)
		os << "  signal sign : std_logic;" << endl;
	if (beta_)
		os << "  signal b0   : std_logic_vector(" << (beta_-1) << " downto 0);" << endl;
	if (beta_ || tp.alpha)
		os << "  signal x0   : std_logic_vector(" << (tp.alpha+beta_-1) << " downto 0);" << endl;
	os << "  signal r0   : std_logic_vector(" << (wTable-1) << " downto 0);" << endl;
	os << "begin" << endl;
	if (tp.beta)
		os << "  sign <= not b(" << (tp.beta-1) << ");" << endl;
	if (beta_) {
		os << "  b0 <= b(" << (beta_-1) << " downto 0) xor (" << (beta_-1) << " downto 0 => sign);" << endl;
		if (tp.alpha)
			os << "  x0 <= a & b0;" << endl;
		else
			os << "  x0 <= b0;" << endl;
	}
	else if (tp.alpha)
		os << "  x0 <= a;" << endl;
	if (tp.beta || tp.alpha)
		os << endl;

	if (signTable == SignMixed)
		os << "  -- Table in 2's-complement" << endl;
	if (beta_ || tp.alpha)
		VHDLGen::genROM(os, table, tp.alpha+beta_, wTable, "x0", "r0");
	else {
		os << "  r0 <= ";
		VHDLGen::genInteger(os, table[0], wTable);
		os << "; -- t = " << table[0] << endl;
	}
	os << endl;

	if ((d%2) && tp.beta){
		os << "  r(" << (wTable-1) << " downto 0) <= r0 xor (" << (wTable-1) << " downto 0 => ("
			 << "sign));" << endl;
		// Do NOT negate sign when signTable==SignNegative here
	}
	else
		os << "  r(" << (wTable-1) << " downto 0) <= r0;" << endl;

	if (p.wO+p.g+1 > wTable) {
		os << "  -- Sign extension" << endl;
		os << "  r(" << (p.wO+p.g) << " downto " << wTable << ") <= (" << (p.wO+p.g) << " downto " << wTable << " => ("
			 << (signTable == SignNegative ? "not " : "");
			 
		if(signTable == SignMixed) {
			if ((d%2) && tp.beta)
				os << "sign xor ";
			os << "r0(" << (wTable-1) << ")";	// cannot use r as an input
		}
		else {
			os << (((d%2) && tp.beta) ? "sign" : "'0'");
		}
		os << "));" << endl;
	}

	os << "end architecture;" << endl;
}
