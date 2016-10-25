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
#include "PowerAdHoc.hh"



PowerAdHoc::PowerAdHoc(int d_, Param &p_)
	: Power(d_, p_), pp(*(PowerAdHocParam *)((TermPowMultParam *)p.t[d])->p)
{
	tPPArray ppaB;

	for (int i = -pp.beta+1; i < 0; i++) {
		tPPElement ppB;
		ppB.insert(i);
		ppaB[i].insert(ppB);
	}
	ppaB[-p.beta].insert(tPPElement());

	ppa = ppPow(ppaB, d);

	for (int i = -p.beta+1; i <= -pp.beta; i++)
		ppaB[i].insert(tPPElement());

	ppa = ppShift(ppAdd(ppa, ppPow(ppaB, d)), -1);

	PWPolynomial errP[2];
	errP[0] = calcErrTab(0);
	errP[1] = calcErrTab(E(-pp.beta+1) - E(-p.beta+1));

	errPow[0] = PWPolynomial::max(errP[0], errP[1]);
	errPow[1] = PWPolynomial::min(errP[0], errP[1]);

	mpz_t mpErr[2], mpTmp;
	for (int i = 0; i < 2; i++) {
		mpz_init(mpErr[i]);
		mpz_set_ui(mpErr[i], 0);
	}
	mpz_init(mpTmp);

	while (ppa.size() && (*ppa.begin()).first <= -pp.mu) {
		tPPArray::iterator i = ppa.begin();
		int sum[2] = { 0, 0 };
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			sum[0]++;
			if ((*j).empty())
				sum[1]++;
		}
		for (int j = 0; j < 2; j++) {
			mpz_set_ui(mpTmp, sum[j]);
			mpz_mul_2exp(mpTmp, mpTmp, d*p.beta+(*i).first);
			mpz_add(mpErr[j], mpErr[j], mpTmp);
		}
		ppa.erase(i);
	}

	for (tPPArray::const_iterator i = ppa.begin(); (i != ppa.end()) && ((*i).first <= -pp.lambda); i++) {
		int sum[2] = { 0, 0 };
		if (!(*i).second.empty())
			sum[0]++;
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			if ((*j).empty())
				sum[1]++;
		}
		for (int j = 0; j < 2; j++) {
			mpz_set_ui(mpTmp, sum[j]);
			mpz_mul_2exp(mpTmp, mpTmp, d*p.beta+(*i).first);
			mpz_add(mpErr[j], mpErr[j], mpTmp);
		}
	}

	mpz_set_ui(mpTmp, 1);
	mpz_mul_2exp(mpTmp, mpTmp, d*p.beta-pp.lambda);
	for (int i = 0; i < 2; i++) {
		mpz_sub(mpErr[i], mpErr[i], mpTmp);
		errPow[i] = errPow[i] + mpz_get_d(mpErr[i]) * E(-d*p.beta);
		mpz_clear(mpErr[i]);
	}
	mpz_clear(mpTmp);

	nPPLine = 0;
	for (tPPArray::const_iterator i = ppa.begin(); i != ppa.end(); i++) {
		if ((signed)(*i).second.size() > nPPLine)
			nPPLine = (*i).second.size();
	}
}

PowerAdHoc::~PowerAdHoc()
{
}

double PowerAdHoc::estimArea()
{
	return nPPLine ? Estim::multiplierArea(nPPLine, pp.mu) : 0;
}

double PowerAdHoc::estimDelay()
{
	return nPPLine ? Estim::multiplierDelay(nPPLine, pp.mu) + 2 : 0;
}

void PowerAdHoc::mpEval(mpz_t mpR, long long int b) const
{
	mpz_set_ui(mpR, 0);

	mpz_t mpTmp;
	mpz_init(mpTmp);

	for (tPPArray::const_iterator i = ppa.begin(); i != ppa.end(); i++) {
		int sum = 0;
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			sum++;
			for (tPPElement::const_iterator k = (*j).begin(); k != (*j).end(); k++) {
				if (!I(b,pp.beta+*k,1)) {
					sum--;
					break;
				}
			}
		}
		mpz_set_ui(mpTmp, sum);
		mpz_mul_2exp(mpTmp, mpTmp, pp.mu+(*i).first);
		mpz_add(mpR, mpR, mpTmp);
	}

	mpz_fdiv_q_2exp(mpR, mpR, pp.mu+1-pp.lambda);

	mpz_set_ui(mpTmp, 1);
	mpz_mul_2exp(mpTmp, mpTmp, pp.lambda-1);
	mpz_add(mpR, mpR, mpTmp);

	mpz_clear(mpTmp);
}

PWPolynomial PowerAdHoc::calcErrTab(double shift)
{
	PWPolynomial errP;

	Polynomial p_ = Polynomial(d, 1) >> (E(-p.beta+1) * .5);
	Polynomial pr = (p_ + (p_ >> (E(-pp.beta+1)-E(-p.beta+1)))) * .5;

	if (shift < E(-pp.beta+1))
		errP.set(1+shift-E(-pp.beta+1), 1, p_ - pr.eval(1-E(-pp.beta+1)));

	errP.set(0, 1+shift-E(-pp.beta+1), p_ - (pr << shift));

	return errP;
}

PowerAdHoc::tPPArray PowerAdHoc::ppAdd(const tPPArray &ppa1, const tPPArray &ppa2)
{
	tPPArray ppaR = ppa1;

	for (tPPArray::const_iterator i = ppa2.begin(); i != ppa2.end(); i++) {
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			int k;
			for (k = (*i).first; ppaR.count(k) && ppaR[k].count(*j); k++)
				ppaR[k].erase(*j);
			ppaR[k].insert(*j);
		}
	}

	return ppaR;
}

PowerAdHoc::tPPArray PowerAdHoc::ppShift(const tPPArray &ppa, int n)
{
	tPPArray ppaR;

	for (tPPArray::const_iterator i = ppa.begin(); i != ppa.end(); i++)
		ppaR[(*i).first+n] = (*i).second;

	return ppaR;
}

PowerAdHoc::tPPArray PowerAdHoc::ppMul(const tPPArray &ppa, const tPPElement &pp)
{
	tPPArray ppaR;

	for (tPPArray::const_iterator i = ppa.begin(); i != ppa.end(); i++) {
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			tPPElement ppR = *j;
			ppR.insert(pp.begin(), pp.end());
			int k;
			for (k = (*i).first; ppaR.count(k) && ppaR[k].count(ppR); k++)
				ppaR[k].erase(ppR);
			ppaR[k].insert(ppR);
		}
	}

	return ppaR;
}

PowerAdHoc::tPPArray PowerAdHoc::ppMul(const tPPArray &ppa1, const tPPArray &ppa2)
{
	tPPArray ppaR;

	for (tPPArray::const_iterator i = ppa2.begin(); i != ppa2.end(); i++) {
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			ppaR = ppAdd(ppaR, ppShift(ppMul(ppa1, *j), (*i).first));
		}
	}

	return ppaR;
}

PowerAdHoc::tPPArray PowerAdHoc::ppPow(const tPPArray &ppa, int d)
{
	tPPArray ppaR = ppa;

	for (int i = 1; i < d; i++)
		ppaR = ppMul(ppaR, ppa);

	return ppaR;
}

void PowerAdHoc::ppPrint(ostream &os, const tPPArray &ppa)
{
	int count = 0;
	for (tPPArray::const_iterator i = ppa.begin(); i != ppa.end(); i++) {
		os << "2^{";
		os.width(3);
		os << (*i).first << "}: (";
		os.width(2);
		os << (*i).second.size() << ")   ";
		count += (*i).second.size();
		for (tPPLine::const_iterator j = (*i).second.begin(); j != (*i).second.end(); j++) {
			if (j != (*i).second.begin())
				os << " + ";
			if ((*j).empty())
				os << "1";
			for (tPPElement::const_iterator k = (*j).begin(); k != (*j).end(); k++) {
				if (k != (*j).begin())
					os << ".";
				os << "b_{" << *k << "}";
			}
		}
		os << endl;
	}
	os << "nPP: " << count << endl;
}

void PowerAdHoc::genVHDL(ostream &os, string name)
{
	os << "--------------------------------------------------------------------------------" << endl;
	os << "-- PowerAdHoc instance for order-" << d << " powering unit." << endl;
	os << "-- Decomposition:" << endl;
	os << "--   beta_" << d << " = " << pp.beta << "; mu_" << d << " = " << pp.mu
		 << "; lambda_" << d << " = " << pp.lambda << "." << endl;
	os << endl;

	os << "library ieee;" << endl;
	os << "use ieee.std_logic_1164.all;" << endl;
	os << "use ieee.std_logic_arith.all;" << endl;
	os << "use ieee.std_logic_unsigned.all;" << endl;
	os << endl;

	os << "entity " << name << " is" << endl;
	os << "  port ( x : in  std_logic_vector(" << (pp.beta-2) << " downto 0);" << endl;
	os << "         r : out std_logic_vector(" << (pp.lambda-1) << " downto 0) );" << endl;
	os << "end entity;" << endl;
	os << endl;

	os << "architecture arch of " << name << " is" << endl;
	for (int i = 0; i < nPPLine; i++)
		os << "  signal pp" << i << " : std_logic_vector(" << (pp.mu-2) << " downto 0);" << endl;
	os << "  signal r0 : std_logic_vector(" << (pp.mu-2) << " downto 0);" << endl;
	os << "begin" << endl;
	for (int i = -1; i > -pp.mu; i--) {
		int l = 0;
		for (tPPLine::const_iterator j = ppa[i].begin(); j != ppa[i].end(); j++, l++) {
			os << "  pp" << l << "(" << (pp.mu-1+i) << ") <= ";
			if ((*j).empty())
				os << "'1'";
			for (tPPElement::const_iterator k = (*j).begin(); k != (*j).end(); k++) {
				if (k != (*j).begin())
					os << " and ";
				os << "x(" << (pp.beta-1+*k) << ")";
			}
			os << ";" << endl;
		}
		for (; l < nPPLine; l++)
			os << "  pp" << l << "(" << (pp.mu-1+i) << ") <= '0';" << endl;
		os << endl;
	}
	os << "  r0 <= ";
	for (int i = 0; i < nPPLine; i++)
		os << (i ? " + " : "") << "pp" << i;
	os << ";" << endl;
	os << "  r <= \"1\" & r0(" << (pp.mu-2) << " downto " << (pp.mu-pp.lambda) << ");" << endl;
	os << "end architecture;" << endl;
}
