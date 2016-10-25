#ifndef SIGNAL_H
#define SIGNAL_H

#include <iostream>
#include <cstdlib>
#include <string>
using namespace std;

namespace FloPoCo {
namespace import {
namespace FPExp {

string zeros(int number, bool quoted = true);

class Signal
{
public:
  Signal(const char* name, int accuracy, int start, int end = -1);
  string getPart(int part_start, int part_end = -1);
  const char* name;
  int accuracy, start, end, length, shift;
  string declaration;
};

}}};	/* namespace FloPoCo::import::Exp */

#endif
