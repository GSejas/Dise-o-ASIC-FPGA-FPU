#ifndef MATH_LIB_H
#define MATH_LIB_H

#include <iostream>
using namespace std;

#ifdef USE_MPFR
  #include <gmp.h>
  #include <mpfr.h>
  void printBinNumMPFR(ostream& o, mpfr_t& number, int accuracy, int size);
#else
  typedef double mpfr_t;
#endif

void printBinNum(ostream& o, double number, int accuracy, int size);
double round(double number, int bits);
double trunc(double number, int bits);
double floor(double number, int bits);
double floor_strict(double number, int bits);
double powOf2(int power);
double negPowOf2(int minusPower);
int intlog2(double number);

inline double max(double x, double y) {return (x > y ? x : y);}
inline double min(double x, double y) {return (x < y ? x : y);}
inline int max(int x, int y) {return (x > y ? x : y);}
inline int min(int x, int y) {return (x < y ? x : y);}

#endif
