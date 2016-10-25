#include <iostream>
#include <math.h>
#include "math_lib.h"
#include "signal.h"
#include "gen_table.h"
#include "stdfragment.h"

using namespace std;
using namespace FloPoCo::import::FPExp;

class StdFragmentTable : public IFunContainer
{
public:
  StdFragmentTable(int accuracy) : accuracy(accuracy) {}
  void function(double x, bool negative, mpfr_t& result)
  {
    #ifdef USE_MPFR
      mpfr_t value;
      mpfr_init2(value, accuracy + 1);
      mpfr_init2(result, accuracy + (x >= 0));
      mpfr_set_d(value, x, GMP_RNDD);            // exact
      mpfr_exp(result, value, GMP_RNDN);         // arrondi au plus proche
      mpfr_set_d(value, 1 + x, GMP_RNDD);        // exact
      mpfr_sub(result, result, value, GMP_RNDD); // exact
      mpfr_clear(value);
    #else
      result = round(exp(x) - 1 - x, accuracy);
    #endif
  }
private:
  int accuracy;
};

StdFragment::StdFragment(int length, Fragment* next_part) :
Fragment(length, next_part)
{
}

void StdFragment::evalpos(int accuracy, int start, int& overlapping, bool& is_signed)
{
  this->is_signed = is_signed;
  this->start = start;
  this->accuracy = accuracy;
  reallength = length + overlapping;
  end = start + reallength;

  // calcul des paramètres input_bits et output_bits de la table
  // (si output_bits <= 0, aucune table ne sera construite)
  input_bits = min(reallength, accuracy - 2 * start + 1);
  output_bits = accuracy - 2 * start; // prévoit large pour stocker e^x-1-x ~ x^2/2 (x premier morceau)
  exp_part1_start = start - 1;        // prévoit large pour stocker e^x-1 ~ x
  exp_part2_start = end - 1;          // prévoit pour e^morceaux_suivants-1

  // ajuste output_bits et exp_part1_start si on peut gagner un bit
  double max_input = negPowOf2(start) - negPowOf2(start + input_bits);
  mpfr_t max_output;
  StdFragmentTable(accuracy).function(max_input, false, max_output);
  #ifdef USE_MPFR
    if (mpfr_get_d(max_output, GMP_RNDD) < negPowOf2(accuracy - output_bits + 1)) output_bits--;
    mpfr_clear(max_output);
  #else
    if (max_output < negPowOf2(accuracy - output_bits + 1)) output_bits--;
  #endif
  if (accuracy - output_bits >= end) exp_part1_start++;

  // paramètres du produit (n'ont un sens que s'il y a un morceau après !)
  // bits significatifs du produit (de valeur >= 2 ^ -accuracy)
  // (si product_obits <= 0, il est inutile de faire le produit)
  product_obits = accuracy - exp_part1_start - exp_part2_start;
  // nombre de bits en entrée du produit
  product_ibits1 = (accuracy - exp_part1_start - end) + 1;
  product_ibits2 = (accuracy - start - exp_part2_start) + 1;

  overlapping = 0;
  // is_signed n'est pas modifié
}

void StdFragment::showinfo(int number)
{
  Fragment::showinfo(number);
  cout << ", normal method" << endl;
}

void StdFragment::write_arch(std::string prefix, ostream& o)
{
  Fragment::write_arch(prefix, o);

  if (is_signed) {
    cerr << "Le premier morceau doit utiliser des tables de log" << endl
         << "(car la methode standard n'a pas ete programmee avec des morceaux signes)" << endl;
    exit(1);
  }

  /* Déclarations de signaux
     ======================= */

  Signal x("x", accuracy, start);		  // entrée du composant
  Signal part_1("part_1", accuracy, start, end);  // premier morceau de l'entrée

  // exponentielle du premier morceau
  Signal tbl_out("tbl_out", accuracy, accuracy - output_bits);
  Signal exp_part1("exp_part1", accuracy, exp_part1_start);

  o << part_1.declaration;
  if (output_bits > 0)
    o << "  -- valeur lue dans la table pour ce morceau" << endl
      << tbl_out.declaration;
  o << "  -- exponentielle du morceau moins 1" << endl
    << exp_part1.declaration;

  // exponentielle des morceaux suivants, calculée avec un autre composant
  // (si c'est le dernier morceau, les signaux sont définis mais n'ont aucun sens !)
  Signal exp_part2("exp_part2", accuracy, exp_part2_start);
  Signal product("product", product_ibits1 + product_ibits2, 0);

  if (next_part != 0)
    o << "  -- exponentielle des morceaux suivants moins 1" << endl
      << exp_part2.declaration
      << "  -- produit des deux signaux precedents" << endl
      << product.declaration;

  /* Architecture du circuit
     ======================= */
  o << "begin" << endl
    << "  -- premiere partie" << endl
    << "  part_1 <= " << x.getPart(start, end) << ';' << endl;

  if (output_bits <= 0)
    o << "  exp_part1 <= " << part_1.getPart(exp_part1_start) << ';' << endl;
  else {
    o << "  -- exponentielle de cette partie" << endl
      << "  component1 : " << prefix << "_exp_tbl_" << accuracy - start << endl
      << "    port map (x => " << part_1.getPart(start, start + input_bits) << ',' << endl
      << "              y => tbl_out);" << endl;
    if (accuracy - output_bits < end)
      o << "  exp_part1 <= " << part_1.getPart(start - 1) << " + " << tbl_out.getPart(start - 1) << ';' << endl << endl;
    else
      o << "  exp_part1 <= part_1 & " << tbl_out.getPart(end) << ';' << endl << endl;
  }

  if (next_part == 0)
    o << "  y <= " << exp_part1.getPart(start - 1) << ';' << endl;
  else {
    o << "  -- exponentielle de la partie restante" << endl
      << "  component2 : " << prefix << "_exp_" << accuracy - end << endl
      << "    port map (x => " << x.getPart(end) << ',' << endl
      << "              y => exp_part2);" << endl << endl
      << "  -- calcul du resultat" << endl;
    if (product_obits <= 0)
      /* si on arrive là, il est probable que le découpage ne soit pas optimal
         (la dernière partie est trop petite) */
      o << "  y <= " << exp_part1.getPart(start - 1) << " + " << exp_part2.getPart(start - 1) << ';' << endl;
    else
      o << "  product <= " << exp_part1.getPart(exp_part1_start, exp_part1_start + product_ibits1) << " * "
                           << exp_part2.getPart(exp_part2_start, exp_part2_start + product_ibits2) << ';' << endl << endl
        << "  y <= " << exp_part1.getPart(start - 1) << " + " << exp_part2.getPart(start - 1)
                << " + " << product.getPart(product_obits - (accuracy - start + 1), product_obits) << ';' << endl;
  }

  o << "end architecture;" << endl << endl;
}

void StdFragment::write_tbl_declaration(std::string prefix, ostream& o)
{
  /* fait l'appel récursif sur les morceaux suivants
     (oui, mais en c++, on ne peut pas accéder aux membres protégés des
      objets construits avec la classe mère qui ne sont pas aussi construits
      avec la classe dérivée. on doit donc passer par la classe mère - ou
      rendre tous les membres publics) */
  Fragment::write_tbl_declaration(prefix, o);
  int input_size = accuracy - start;

  // table de x -> e ^ x - x - 1 avec la précision maximale
  if (output_bits > 0)
    o << "  component " << prefix << "_exp_tbl_" << input_size << " is\n"
      << "    port (x : in  std_logic_vector(" << input_bits << " - 1 downto 0);" << endl
      << "          y : out std_logic_vector(" << output_bits << " - 1 downto 0));" << endl
      << "  end component;" << endl;
}

void StdFragment::write_tbl_arch(std::string prefix, ostream& o)
{
  Fragment::write_tbl_arch(prefix, o);
  if (output_bits > 0) {
    StdFragmentTable table(accuracy);
    gen_table(o, (prefix + "_exp_tbl").c_str(), accuracy - start, table,
      start + input_bits, input_bits, is_signed, accuracy, output_bits);
  }
}

double StdFragment::area()
{
  double result = Fragment::area();
  if (output_bits > 0)
    result += table_area(input_bits, output_bits);
  if (next_part != 0)
    result += multiplier_area(product_ibits1, product_ibits2);
  return result;
}

double StdFragment::max_error(double input_error)
{
  double result = Fragment::max_error(input_error);
  double fragment_error;

  /* hypothèse : on suppose que le dernier morceau est assez
     long pour que l'influence de l'erreur input_error sur
     le terme quadratique soit négligeable */

  if (output_bits <= 0)
    // approxime e^x par 1+x -> erreur en x^2/2 (termes suivants du DSE négligés)
    fragment_error = negPowOf2(2 * start - accuracy + 1);
  else {
    // erreur sur la valeur tabulée de e^x-1-x
    fragment_error = 0.5;
    // éventuellement, erreur quand l'entrée est tronquée
    if (input_bits < reallength)
      /* x tronqué à input_bits bits. on pose e = 2 ^ -(start + input_bits)
	 erreur max en sortie : (x + e) ^ 2 - x ^ 2 = 2ex + e ^ 2
         input_bits choisi pour avoir 2ex <= 2 ^ -accuracy d'où */
      fragment_error += 1.0 + negPowOf2((start + input_bits) * 2 - accuracy);
  }

  if (next_part == 0)
    result += fragment_error;
  else if (product_obits <= 0)
    result += fragment_error + 1.0;
  else {
    // majorant de l'exponentielle du premier morceau
    double max_output = exp(negPowOf2(start)) - 1;
          /*  ErreurMax = ErreurMax + ErreurMorceau + 3 / 4 + 1 + _
                        ValeurMax * ErreurMax + _
                        (2 ^ -Morceaux(i + 1).Debut) * ErreurMorceau */
    result = result + fragment_error // addition des erreurs précédentes
             + 1.0                   // les entrées du produit sont tronquées
	     + max_output * result   // erreurs précédentes, multipliées
	     + negPowOf2(next_part->getStart()) * fragment_error
	     + 1.0;                  // résultat du produit tronqué
  }

  return result;
}
