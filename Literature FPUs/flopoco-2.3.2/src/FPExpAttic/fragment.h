#ifndef FRAGMENT_H
#define FRAGMENT_H

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <cstdlib>
using namespace std;

class Fragment
{
public:
  Fragment(int length, Fragment* next_part);
  virtual ~Fragment() {} // ne supprime pas next_part, car l'objet peut être partagé avec d'autres morceaux
  int prepare(double& area, double& max_error, bool with_sign = true, int accuracy = -1, bool showinfo = true);
  void generate(std::string prefix, ostream& code_file, ostream& table_file);
  int getStart() {return start;}

protected:
  int totallength();                            // calcule récursivement la somme des longueurs des morceaux
  virtual double area();                        // évalue l'aire des multiplieurs et des tables (récursivement)
  virtual double max_error(double input_error); // évalue l'erreur maximale en ULPs
  virtual void evalpos(int accuracy, int start, // calcule l'emplacement et la longueur du morceau dans la mantisse
    int& overlapping, bool& is_signed) = 0;
  virtual void showinfo(int number);            // affiche l'emplacement du morceau et son type
  virtual void write_declaration(std::string prefix, ostream& o);   // écrit la déclaration du composant (dans le package)
  virtual void write_arch(std::string prefix, ostream& o);          // écrit l'entité et l'architecture
  virtual void write_tbl_declaration(std::string prefix, ostream& o); // écrit la déclaration du ou des composant(s) servant de table
  virtual void write_tbl_arch(std::string prefix, ostream& o);      // écrit les tables

  // données sur le morceau
  int length;		// longueur demandée, CE N'EST PAS LA LONGUEUR REELLE (il faut ajouter le recouvrement)
  Fragment* next_part;	// morceau suivant de la liste chaînée

  // paramètres calculées à partir des données
  int accuracy;		// nombre de chiffres après la virgule (pour la totalité de l'entrée et le résultat)
  int start;		// le premier chiffre du morceau est le (start+1)-ième après la virgule
  int end;		// le dernier chiffre du morceau est le end-ième après la virgule
  int reallength;	// reallength = end - start, nombre de bits du morceau
  bool is_signed;	// indique si l'entrée peut être négative (la plage dans les négatifs étant identique)
};

double table_area(int input_bits, int output_bits); // in slices
double multiplier_area(int input1, int input2);


#endif
