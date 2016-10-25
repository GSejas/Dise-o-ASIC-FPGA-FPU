#include <iostream>
#include <sstream>
#include <string>
#include "math_lib.h"
#include "signal.h"

using namespace FloPoCo::import::FPExp;

string FloPoCo::import::FPExp::zeros(int number, bool quoted)
{
  if (quoted)
    return '"' + string(number, '0') + '"';
  else
    return string(number, '0');
}

Signal::Signal(const char* name, int accuracy, int start, int end) :
name(name), accuracy(accuracy), start(start), end(end)
{
  if (end == -1) this->end = accuracy;
  // les tableaux ne peuvent pas descendre en-dessous de 0 en VHDL, on le simule ici
  if (end > accuracy) shift = end - accuracy; else shift = 0;
  length = this->end - start;
  ostringstream o;
  o << "  signal " << name << " : std_logic_vector(" << accuracy - start + shift << " - 1 downto " << accuracy - this->end + shift << ");" << endl;
  declaration = o.str();
}

string Signal::getPart(int part_start, int part_end)
{
  if (part_end == -1) part_end = accuracy;
  if (part_end <= part_start) {
    cerr << "Impossible d'extraire une partie de taille " << part_end - part_start << " du signal " << name << endl;
    exit(1);
  }
  else if (part_end <= start || part_start >= end) {
    cerr << "Avertissement : Extraction de la plage [" << part_start + 1 << ',' << part_end
         << "] sur le signal " << name << '[' << start + 1 << ',' << end << "]." << endl
	 << "                Le calcul de ce signal est probablement inutile." << endl;
    return zeros(part_end - part_start);
  }
  else {
    ostringstream o;
    bool parenthesis = part_start < start || part_end > end;
    if (parenthesis) o << "(";
    if (part_start < start)
      o << zeros(start - part_start) << " & ";
    o << name;
    if (part_start > start || part_end < end)
      o << "(" << accuracy - max(part_start, start) + shift << " - 1 downto " << accuracy - min(part_end, end) + shift << ")";
    if (part_end > end)
      o << " & " << zeros(part_end - end);
    if (parenthesis) o << ")";
    return o.str();
  }
}
