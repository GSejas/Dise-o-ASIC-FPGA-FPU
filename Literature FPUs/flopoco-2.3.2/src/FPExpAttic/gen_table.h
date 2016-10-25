#ifndef GEN_TABLE_H
#define GEN_TABLE_H

#include <iostream>
#include "math_lib.h"
using namespace std;

// remplace les applications partielles de Caml
class IFunContainer
{
public:
  // negative est vrai si x < 0 ou si x = 0 et qu'on veut représenter 0-
  // result n'est jamais initialisé (quand USE_MPFR est définie)
  virtual void function(double x, bool negative, mpfr_t& result) = 0;
  // pour faire taire gcc
  virtual ~IFunContainer() {}
};

void gen_table(ostream& o, const char* name, int component_id, IFunContainer& fc, int input_accuracy,
	       int input_bits, bool input_signed, int output_accuracy, int output_bits);

void gen_table_lines(ostream& o, IFunContainer& fc, int input_accuracy, int input_bits, bool input_signed,
	             int output_accuracy, int output_bits);

#endif
