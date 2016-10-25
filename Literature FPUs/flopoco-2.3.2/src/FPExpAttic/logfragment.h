#ifndef LOG_FRAGMENT_H
#define LOG_FRAGMENT_H

#include "fragment.h"

class LogFragment : public Fragment
{
public:
  LogFragment(int length, Fragment* next_part = 0);
private:
  double area();
  double max_error(double input_error);
  void evalpos(int accuracy, int start, int& overlapping, bool& is_signed);
  void showinfo(int number);
  void write_arch(std::string prefix, ostream& o);
  void write_tbl_declaration(std::string prefix, ostream& o);
  void write_tbl_arch(std::string prefix, ostream& o);
  int exp_bits, log_bits;
  int product_ibits1, product_ibits2;
};

#endif
