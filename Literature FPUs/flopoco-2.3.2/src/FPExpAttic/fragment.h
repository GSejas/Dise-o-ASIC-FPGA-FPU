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
  virtual ~Fragment() {} // ne supprime pas next_part, car l'objet peut �tre partag� avec d'autres morceaux
  int prepare(double& area, double& max_error, bool with_sign = true, int accuracy = -1, bool showinfo = true);
  void generate(std::string prefix, ostream& code_file, ostream& table_file);
  int getStart() {return start;}

protected:
  int totallength();                            // calcule r�cursivement la somme des longueurs des morceaux
  virtual double area();                        // �value l'aire des multiplieurs et des tables (r�cursivement)
  virtual double max_error(double input_error); // �value l'erreur maximale en ULPs
  virtual void evalpos(int accuracy, int start, // calcule l'emplacement et la longueur du morceau dans la mantisse
    int& overlapping, bool& is_signed) = 0;
  virtual void showinfo(int number);            // affiche l'emplacement du morceau et son type
  virtual void write_declaration(std::string prefix, ostream& o);   // �crit la d�claration du composant (dans le package)
  virtual void write_arch(std::string prefix, ostream& o);          // �crit l'entit� et l'architecture
  virtual void write_tbl_declaration(std::string prefix, ostream& o); // �crit la d�claration du ou des composant(s) servant de table
  virtual void write_tbl_arch(std::string prefix, ostream& o);      // �crit les tables

  // donn�es sur le morceau
  int length;		// longueur demand�e, CE N'EST PAS LA LONGUEUR REELLE (il faut ajouter le recouvrement)
  Fragment* next_part;	// morceau suivant de la liste cha�n�e

  // param�tres calcul�es � partir des donn�es
  int accuracy;		// nombre de chiffres apr�s la virgule (pour la totalit� de l'entr�e et le r�sultat)
  int start;		// le premier chiffre du morceau est le (start+1)-i�me apr�s la virgule
  int end;		// le dernier chiffre du morceau est le end-i�me apr�s la virgule
  int reallength;	// reallength = end - start, nombre de bits du morceau
  bool is_signed;	// indique si l'entr�e peut �tre n�gative (la plage dans les n�gatifs �tant identique)
};

double table_area(int input_bits, int output_bits); // in slices
double multiplier_area(int input1, int input2);


#endif
