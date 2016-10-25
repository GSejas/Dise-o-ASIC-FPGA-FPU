#include <iostream>
#include <math.h>
#include "math_lib.h"
#include "signal.h"
#include "gen_table.h"
#include "logfragment.h"

using namespace std;
using namespace FloPoCo::import::FPExp;

/* Fonctions tabulées
   ================== */

// Table d'exponentielles arrondies
class LogFragmentTable1 : public IFunContainer
{
public:
  LogFragmentTable1(int exp_accuracy) : exp_accuracy(exp_accuracy)
  {
    delta = negPowOf2(exp_accuracy);
  }
  void function(double x, bool negative, mpfr_t& result)
  {
    if (negative) x -= delta;
    #ifdef USE_MPFR
      mpfr_t value;
      mpfr_init2(value, exp_accuracy + 1);
      mpfr_init2(result, exp_accuracy + (x >= 0));
      // aucun arrondi
      mpfr_set_d(value, x, GMP_RNDD);
      // arrondi vers moins l'infini
      mpfr_exp(result, value, GMP_RNDD);
      // à partir de là tout est exact
      mpfr_set_d(value, 1.0 + x, GMP_RNDD);
      mpfr_sub(result, result, value, GMP_RNDD);
      mpfr_clear(value);
    #else
      result = floor(exp(x) - 1 - x, exp_accuracy);
    #endif
  }
private:
  int exp_accuracy;
  double delta;
};

// Table de logarithmes
class LogFragmentTable2 : public IFunContainer
{
public:
  LogFragmentTable2(int accuracy, int exp_accuracy) :
  accuracy(accuracy), exp_accuracy(exp_accuracy)
  {
    delta = negPowOf2(exp_accuracy);
  }
  void function(double x, bool negative, mpfr_t& result)
  {
    if (negative) x -= delta;
    #ifdef USE_MPFR
      mpfr_t value, exp_val, log_val, num_6;
      mpfr_init2(value, exp_accuracy);
      mpfr_init2(exp_val, exp_accuracy + (x >= 0));
      mpfr_init2(log_val, accuracy + 20);
      mpfr_init2(num_6, 3);
      mpfr_init2(result, accuracy + 3);
      mpfr_set_d(value, x, GMP_RNDD);
      mpfr_set_d(num_6, 6.0, GMP_RNDD);
      mpfr_exp(exp_val, value, GMP_RNDD);            // arrondi vers moins l'infini
      mpfr_log(log_val, exp_val, GMP_RNDN);          // calcul du log avec une "grande" précision (par rapport à accuracy)
      mpfr_sub(result, num_6, log_val, GMP_RNDN);    // arrondi au plus proche
      mpfr_add(result, result, value, GMP_RNDD);     // opération exacte
      mpfr_sub(result, result, num_6, GMP_RNDD);     // opération exacte
      mpfr_clear(value);
      mpfr_clear(exp_val);
      mpfr_clear(log_val);
      mpfr_clear(num_6);
    #else
      result = x - round(log(floor(exp(x), exp_accuracy)), accuracy);
    #endif
  }
private:
  int accuracy;
  int exp_accuracy;
  double delta;
};

/* Opérations préliminaires sur le morceau
   ======================================= */

LogFragment::LogFragment(int length, Fragment* next_part) :
Fragment(length, next_part)
{
  if (next_part == 0) {
    cerr << "Impossible d'utiliser un morceau avec une table de log pour la derniere partie" << endl;
    exit(1);
  }
}

void LogFragment::evalpos(int accuracy, int start, int& overlapping, bool& is_signed)
{
  double max_input, max_output, po2;

  this->is_signed = is_signed;
  this->start = start;
  this->accuracy = accuracy;
  reallength = length + overlapping;
  end = start + reallength;

  // calcule le nombre de bits en sortie de la table d'exponentielles
  max_input = negPowOf2(start) - negPowOf2(end);
  // TODO: remettre le calcul exact
  max_output = exp(max_input) - 1 - max_input;
  /* LogFragmentTable1 fc(end);
  max_output = fc.function(max_input, false); */

  po2 = negPowOf2(end);
  for (exp_bits = 0; max_output >= po2; exp_bits++)
    max_output /= 2;
  /* TODO: si max_input est petit, le minimum pourrait aussi
     être atteint dans les négatifs puisqu'on arrondit l'exponentielle par
     valeur inférieure et qu'elle est prise en une valeur -newPowOf2(start)
     (et pas -newPowOf2(start) + newPowOf2(end)) au minimum */

  // calcule le nombre de bits en sortie de la table de logarithmes
  // TODO: améliorer cette approximation (pour l'instant il n'y a
  // pas de risque mais on perd de la place)
  log_bits = accuracy - end + is_signed;

  overlapping = 1 + is_signed;
  is_signed = false;

  // nombre de bits en entrée du produit
  product_ibits1 = reallength + (exp_bits > 0);
  product_ibits2 = accuracy - (end - overlapping - 1);
}

/* Production du code VHDL
   ======================= */

// premier fichier : tout sauf les tables

void LogFragment::write_arch(std::string prefix, ostream& o)
{
  Fragment::write_arch(prefix, o);

  /* Déclarations de signaux
     ======================= */
  Signal x("x", accuracy, start);

  // entree pour la table x -> exp(x)_arrondi-1-x (en valeur absolue si signé)
  Signal signed_input("signed_input", reallength + 1, 0);
  Signal exp_tbl_out("exp_tbl_out", accuracy, end - exp_bits, end);
  if (exp_bits > 0) {
    if (is_signed) o << signed_input.declaration;
    o << exp_tbl_out.declaration;
  }

  // premier morceau de l'entrée
  Signal part_1("part_1", accuracy, start, end);
  // exponentielle arrondie du premier morceau moins 1 (= sortie de la table plus x) (en valeur abs)
  Signal exp_part1("exp_part1", end, start - (exp_bits > 0));
  /* sortie de la table x -> x - log(exp(x)_arrondi) (x : 1er morceau de l'entrée)
     comme exp(x) est arrondi par valeur inférieur, le résultat est positif */
  Signal remainder_1("remainder_1", accuracy, accuracy - log_bits);
  // morceaux_suivants ou (2 ^ -end) - morceaux_suivants selon le signe de x
  Signal remainder_2("remainder_2", accuracy, end - is_signed);
  // somme de remainder_1 et remainder_2
  Signal remainder("remainder", accuracy, accuracy - log_bits - 1);
  // exponentielle du reste
  Signal exp_rmd("exp_rmd", accuracy, next_part->getStart() - 1);
  // produit des deux parties fractionnaires des exponentielles
  int product_start = exp_part1.start + exp_rmd.start;
  Signal product("product", accuracy, product_start, product_start + product_ibits1 + product_ibits2);
  // total à ajouter ou soustraire au produit selon le signe
  Signal signed_part("signed_part", accuracy, start - 1);

  o << part_1.declaration
    << exp_part1.declaration
    << remainder_1.declaration
    << remainder_2.declaration
    << remainder.declaration
    << exp_rmd.declaration
    << product.declaration
    << signed_part.declaration;

  /* Architecture du circuit
     ======================= */
  o << "begin" << endl;

  // calcul de exp_part1
  o << "  -- premiere partie" << endl
    << "  part_1 <= " << x.getPart(start, end) << ';' << endl
    << "  -- exponentielle de cette partie" << endl;
  if (exp_bits > 0) {
    if (is_signed)
      o << "  signed_input(" << signed_input.length - 1 << ") <= sign;" << endl
        << "  " << signed_input.getPart(1) << " <= part_1;" << endl
	<< "  component1 : " << prefix << "_exp_tbl_" << accuracy - start << endl
	<< "    port map (x => signed_input," << endl
        << "              y => exp_tbl_out);" << endl
        << "  exp_part1 <= " << part_1.getPart(start - 1, end) << " + " << exp_tbl_out.getPart(start - 1, end)
	<< " when sign = '0' else " << part_1.getPart(start - 1, end) << " + \"" << zeros(reallength, false)
	<< "1\" - " << exp_tbl_out.getPart(start - 1, end) << ';' << endl;
    else
      o << "  component1 : " << prefix << "_exp_tbl_" << accuracy - start << endl
        << "    port map (x => part_1," << endl
        << "              y => exp_tbl_out);" << endl
        << "  exp_part1 <= " << part_1.getPart(start - 1, end) << " + " << exp_tbl_out.getPart(start - 1, end) << ';' << endl;
  }
  else if (is_signed) {
    Signal sign("sign", accuracy, end - 1, end);
    o << "  exp_part1 <= " << part_1.getPart(start - 1, end) << " - " << sign.getPart(start - 1, end) << ';' << endl;
  }
  else {
    o << "  exp_part1 <= part_1;" << endl;
  }

  // calcul de remainder
  o << endl << "  -- partie restante" << endl
    << "  component2 : " << prefix << "_log_tbl_" << accuracy - start << endl
    << "    port map (x => " << (is_signed ? "signed_input" : "part_1") << ',' << endl
    << "              y => remainder_1);" << endl;

  if (is_signed)
    o << "  remainder_2 <= (\"0\" & " << x.getPart(end) << ") when sign = '0' else "
      << "\"1" << zeros(accuracy - end, false) << "\" - (\"0\" & " << x.getPart(end) << ");" << endl;
  else
    o << "  remainder_2 <= " << x.getPart(end) << ';' << endl;

  o << "  remainder <= " << remainder_1.getPart(remainder.start) << " + " << remainder_2.getPart(remainder.start) << ';' << endl;

  o << "  -- exponentielle de ce reste" << endl
    << "  component3 : " << prefix << "_exp_" << accuracy - next_part->getStart() << endl
    << "    port map (x => remainder," << endl
    << "              y => exp_rmd);" << endl << endl

    << "  -- calcul du resultat" << endl
    << "  product <= " << exp_part1.getPart(exp_part1.start, end) << " * exp_rmd;" << endl
    << "  signed_part <= " << exp_part1.getPart(start - 1, accuracy) << " + " << product.getPart(start - 1, accuracy) << ";" << endl;

  if (is_signed)
    o << "  y <= " << exp_rmd.getPart(start - 1) << " + signed_part when sign = '0' else "
      << exp_rmd.getPart(start - 1) << " - signed_part;" << endl;
  else
    o << "  y <= " << exp_rmd.getPart(start - 1) << " + signed_part;" << endl;

  o << "end architecture;" << endl << endl;
}

// second fichier : tables utilisés dans le composant

void LogFragment::write_tbl_declaration(std::string prefix, ostream& o)
{
  Fragment::write_tbl_declaration(prefix, o); // fait l'appel récursif sur les morceaux suivants
  int input_size = accuracy - start;

  // table de x -> {e ^ x - 1 - x} arrondi à la précision de l'entrée
  if (exp_bits > 0) {
    o << "  -- tabule e ^ x - x - 1 avec " << reallength << " bits en entree, " << exp_bits << " en sortie" << endl
      << "  -- le dernier bit de l'entree est le " << end << "eme apres la virgule" << endl;
    if (is_signed) o << "  -- l'entree a en plus un bit de signe" << endl;
    o << "  component " << prefix << "_exp_tbl_" << input_size << " is\n"
      << "    port (x : in  std_logic_vector(" << reallength - 1 + is_signed << " downto 0);" << endl
      << "          y : out std_logic_vector(" << exp_bits - 1 << " downto 0));" << endl
      << "  end component;" << endl;
  }

  // table de x -> x - log({e ^ x} arrondi)
  o << "  -- tabule ln(e ^ x tronque a " << end << " bits) avec " << log_bits << " bits en sortie" << endl
    << "  component " << prefix << "_log_tbl_" << input_size << " is\n"
    << "    port (x : in  std_logic_vector(" << reallength - 1 + is_signed << " downto 0);" << endl
    << "          y : out std_logic_vector(" << log_bits - 1 << " downto 0));" << endl
    << "  end component;" << endl;
}

void LogFragment::write_tbl_arch(std::string prefix, ostream& o)
{
  Fragment::write_tbl_arch(prefix, o);
  if (exp_bits > 0) {
		LogFragmentTable1 table1(end);
    gen_table(o, (prefix + "_exp_tbl").c_str(), accuracy - start, table1,
    end, reallength, is_signed, end, exp_bits);
  }
	
	LogFragmentTable2 table2(accuracy, end);
  gen_table(o, (prefix + "_log_tbl").c_str(), accuracy - start, table2,
    end, reallength, is_signed, accuracy, log_bits);
}

/* Obtention d'informations diverses
   ================================= */

void LogFragment::showinfo(int number)
{
  Fragment::showinfo(number);
  cout << ", rounded exp method and log table" << endl;
}

double LogFragment::area()
{
  double result = Fragment::area();
  result += table_area(reallength, exp_bits);
  result += table_area(reallength, log_bits);
  result += multiplier_area(product_ibits1, product_ibits2);
  return result;
}

double LogFragment::max_error(double input_error)
{
  double result = Fragment::max_error(input_error + 0.5);
  double max_output = exp(negPowOf2(start)) - 1;
  result += 1 + max_output * result;
  return result;
}
