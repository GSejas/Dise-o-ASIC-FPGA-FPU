#include <iostream>
#include "math_lib.h"
#include "gen_table.h"

using namespace std;

void gen_table(ostream& o, const char* name, int component_id, IFunContainer& fc, int input_accuracy,
	       int input_bits, bool input_signed, int output_accuracy, int output_bits)
{
  o << "library ieee;" << endl
    << "use ieee.std_logic_1164.all;" << endl
    << "use ieee.std_logic_arith.all;" << endl
    << "use ieee.std_logic_unsigned.all;" << endl << endl

    << "entity " << name << "_" << component_id << " is" << endl
    << "  port ( x : in  std_logic_vector(" << input_bits + input_signed - 1 << " downto 0);" << endl
    << "         y : out std_logic_vector(" << output_bits - 1 << " downto 0) );" << endl
    << "end entity;" << endl << endl

    << "architecture arch of " << name << "_" << component_id << " is" << endl
    << "begin" << endl
    << "  with x select" << endl
    << "    y <= ";

  gen_table_lines(o, fc, input_accuracy, input_bits, input_signed, output_accuracy, output_bits);

  o << "end architecture;" << endl << endl;
}

/* Tabule la fonction contenue dans fc avec une précision donnée
   2 ^ -input_accuracy : plus petite entrée non nulle de la table (le pas de la table)
   input_bits          : bits en entrée, les entrées vont donc de 0 (inclus) à 2 ^ (-accuracy + input_bits) (exclu)
   2 ^ -output_accuracy: plus petit nombre non nul représentable en sortie
   output_bits         : bits en sortie
   spaces              : retrait du code (sauf pour la première ligne) */

void gen_table_lines(ostream& o, IFunContainer& fc, int input_accuracy, int input_bits, bool input_signed,
	      int output_accuracy, int output_bits)
	      // bool outputSigned -> on n'a jamais besoin de stocker ce signe dans une table
{
  const int spaces = 9;
  int i, iMax, iMiddle;
  double number = 0, inc = 1;
  char* margin = new char[spaces + 1];
  mpfr_t result;

  if (input_bits > 10)
    cerr << "Avertissement : production d'une table avec " << input_bits << " bits en entree" << endl;

  inc = negPowOf2(input_accuracy);
  // mise en retrait du code
  for (i = 0; i < spaces; i++) margin[i] = ' ';
  margin[i] = '\0';

  // boucle sur les entrées
  iMiddle = (1 << input_bits) - 1;
  iMax = 1 << (input_bits + input_signed);
  if (input_signed) number = -negPowOf2(input_accuracy - input_bits) + inc;
  for (i = 0; i < iMax; i++) {
    fc.function(number, input_signed && i <= iMiddle, result);
    // affiche le résultat de l'application
    o << "\"";
    #ifdef USE_MPFR
      printBinNumMPFR(o, result, output_accuracy, output_bits);
      mpfr_clear(result);
    #else
      printBinNum(o, result, output_accuracy, output_bits);
    #endif
    o << "\" when \"";
    // et la valeur associée
    if (input_signed) o << (i <= iMiddle);
    printBinNum(o, number, input_accuracy, input_bits);
    o << "\"," << endl
      << margin;
    // incrémente number sauf si on doit passer de -0 à +0
    if (i != iMiddle) number += inc;
  }

  o << "\"";
  for (i = 0; i < output_bits; i++) o << "-";
  o << "\" when others;" << endl;
  delete [] margin;
}
