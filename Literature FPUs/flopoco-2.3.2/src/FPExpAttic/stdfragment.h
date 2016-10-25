#ifndef STD_FRAGMENT_H
#define STD_FRAGMENT_H

#include "fragment.h"

class StdFragment : public Fragment
{
public:
  StdFragment(int length, Fragment* next_part = 0);
private:
  double area();
  double max_error(double input_error);
  void evalpos(int accuracy, int start, int& overlapping, bool& is_signed);
  void showinfo(int number);
  void write_arch(std::string prefix, ostream& o);
  void write_tbl_declaration(std::string prefix, ostream& o);
  void write_tbl_arch(std::string prefix, ostream& o);
  int input_bits, output_bits;
  int exp_part1_start, exp_part2_start;
  int product_ibits1, product_ibits2, product_obits;
};

#endif
