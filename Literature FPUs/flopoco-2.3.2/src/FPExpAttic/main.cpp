#include <iostream>
#include <fstream>
#include <string>
#include "math_lib.h"
#include "logfragment.h"
#include "stdfragment.h"
#include "signal.h"
#include "explore.h"

using namespace std;

void read_args(int argc, char* argv[], int& exponent_size, int& explore_size, istream*& input_stream);
Fragment* read_fragments(istream& i);
void copy_file_section(ostream& o, istream& i);

int main(int argc, char* argv[])
{
  int exponent_size, explore_size;
  istream* input_stream;

  // lecture de la ligne de commande
  read_args(argc, argv, exponent_size, explore_size, input_stream);

  // ouvre les fichiers de code à générer
  ofstream fp_exp, fixp_exp, fixp_exp_tbl;
  fp_exp.open("../fp_exp.vhd", ios::out);
  fixp_exp.open("../fixp_exp.vhd", ios::out);
  fixp_exp_tbl.open("../fixp_exp_tbl.vhd", ios::out);

  // lecture des paramètres (interactive ou non selon input_stream)
  Fragment* f;
  if (explore_size == -1) {
    if (!(f = read_fragments(*input_stream))) return 0;
  }
  else {
    if (!(f = explore(explore_size))) return 0;
  }
  /* exponent_size = 8;
  f = explore(52);
  if (f == 0) {
    cout << "pas trouvé" << endl;
    return 0;
  } */

  #ifdef USE_MPFR
    cout << "Compilé pour calculer les tables avec MPFR" << endl;
  #else
    cout << "Avertissement : compilé sans MPFR, précision des tables non garantie" << endl
         << "Vous devriez recompiler avec l'option -D USE_MPFR" << endl;
  #endif

  int result_length;
  double area, max_error;
  // génère le code pour l'exponentielle en virgule fixe
  result_length = f->prepare(area, max_error);
  f->generate(fixp_exp, fixp_exp_tbl);

  int g_bits = intlog2(max_error) + 2;
  cout << "Aire estimee (partie virgule fixe) : " << area << endl
       << "Erreur maximale : " << max_error << endl
       << "Precision interne : " << result_length << endl
       << "Precision : " << result_length - g_bits << endl;

  // produit l'entité principale à partir du fichier modèle
  ifstream template_file;
  template_file.open("../fp_exp.template", ios::in);
  copy_file_section(fp_exp, template_file);
  fp_exp << "    generic ( wE : positive := " << exponent_size << ";" << endl
         << "              wF : positive := " << result_length - g_bits << ";" << endl
         << "              g : positive := " << g_bits << " );" << endl;
  copy_file_section(fp_exp, template_file);
  fp_exp << "  generic ( wE : positive := " << exponent_size << ";" << endl
         << "            wF : positive := " << result_length - g_bits << ";" << endl
         << "            g : positive := " << g_bits << " );" << endl;
  copy_file_section(fp_exp, template_file);
  fp_exp << "  label2 : exp_" << result_length - 1 << endl;
  copy_file_section(fp_exp, template_file);
  template_file.close();

  fp_exp.close();
  fixp_exp.close();
  fixp_exp_tbl.close();
  return 0;
}

// Lit la ligne de commande
void read_args(int argc, char* argv[], int& exponent_size, int& explore_size, istream*& input_stream)
{
  exponent_size = -1;
  explore_size = -1;
  input_stream = &cin;

  for (int iarg = 1; iarg < argc; iarg++) {
    string the_arg(argv[iarg]);
    if (argv[iarg][0] == '-') {
      if (the_arg == "-explore")
	explore_size = atoi(argv[iarg + 1]);
      else if (the_arg == "-exponent")
	exponent_size = atoi(argv[iarg + 1]);
      else {
	cout << "Genere un circuit en VHDL calculant l'exponentielle d'un nombre flottant" << endl
	     << "Syntaxe : code_gen [fichier | -explore n] [-exponent e]" << endl
	     << "  aucun argument : mode interactif, lit les parametres sur stdin" << endl
	     << "  fichier        : utilise fichier en entree a la place de stdin" << endl
	     << "  -explore n     : recherche les meilleurs parametres pour avoir une precision n" << endl
	     << "  -exponent e    : definit la taille de l'exposant = e au lieu de la lire sur l'entree" << endl;
	exit(the_arg != "--help");
      }
      iarg++;
    }
    else {
      ifstream* input_file = new ifstream();
      input_file->open(argv[iarg], ios::in);
      input_stream = input_file;
    }
  }
  if (exponent_size == -1) {
    char line[3];
    cout << "Entrez la taille de l'exposant" << endl;
    input_stream->getline(line, 3);
    exponent_size = atoi(line);
  }
}

// Lit sur stdin le découpage de la mantisse
Fragment* read_fragments(istream& i)
{
  Fragment* f = 0;
  int fragment_size;
  char line[1024];

  cout << "Entrez la liste des fragments du dernier au premier (ligne vide pour finir)" << endl;
  while (!i.eof()) {
    /* lit une ligne au format 'type,taille'
       type=0 -> fragment standard, avec seulement table d'exponentielles
       type=1 -> fragment utilisant une table de logarithmes */
    i.getline(line, 1024);
    if (line[0] == '\0') break;
    fragment_size = atoi(&line[2]);
    switch (line[0]) {
      case '0':	f = new StdFragment(fragment_size, f); break;
      case '1':	f = new LogFragment(fragment_size, f); break;
      default:
	cerr << "Le format de la liste des fragments est incorrect" << endl
	     << "Definition d'un fragment : 'type,taille'" << endl
	     << "avec type = 0 (standard) ou 1 (table de log)" << endl;
	exit(1);
    }
  }
  return f;
}

/* Copie les lignes du flux i au le flux o jusqu'à
   trouver une ligne contenant uniquement un '$'
   ou à arriver à la fin du fichier */
void copy_file_section(ostream& o, istream& i)
{
  const int line_size = 1024;
  int empty_lines = 0;
  char line[line_size];
  while (!(i.eof() || empty_lines > 100)) {
    i.getline(line, line_size);
    if (line[0] == '$' && line[1] == '\0')
      break;
    else if (line[0] == '\0')
      empty_lines++;
    else
      empty_lines = 0;
    if (i.bad() || empty_lines > 100) {
      cerr << "Erreur lors de la lecture du fichier modele" << endl;
      exit(1);
    }
    o << line << endl;
  }
}
