#include <iostream>
#include <cstdlib>
#include "math_lib.h"
#include "math.h"

using namespace std;

/* Affiche une partie du développement binaire d'un nombre
   compris entre -1 et 1 (exclus tous les deux)
   accuracy : position du dernier bit affiché (1 = juste après la virgule)
              le nombre est tronqué après ce bit
   size     : longueur du mot à afficher (si size < accuracy,
              les bits de poids fort ne sont pas affichés, mais
              dans ce cas ils doivent être nuls)
   (remarque : aucune marque du signe n'est pas affichée) */

void printBinNum(ostream& o, double number, int accuracy, int size)
{
  double po2 = 1; char bit;

  if (number < 0) number = -number;
  if (number >= 1) {
    cerr << "\nErreur : impossible d'afficher un nombre plus grand que 1" << endl;
    exit(1);
  }
  for (int i = 0; i < accuracy; i++) {
    // affiche les bits des poids forts au poids faibles
    po2 /= 2;
    if (number >= po2) {
      bit = '1';
      number -= po2;
    }
    else {
      bit = '0';
    }
    if (i >= accuracy - size)
      o << bit;
    else if (bit == '1') {
      cerr << "\nErreur : le nombre a afficher est plus grand que prevu" << endl;
      exit(1);
    }
  }
}

#ifdef USE_MPFR
  // attention, number est modifié par cette fonction
  void printBinNumMPFR(ostream& o, mpfr_t& number, int accuracy, int size)
  {
    // toutes les opérations sont exactes
    mpfr_t po2, num2;
    char bit;
    mpfr_init2(po2, 2);
    mpfr_init2(num2, 2);
    mpfr_set_d(po2, 1.0, GMP_RNDD);
    mpfr_set_d(num2, 2.0, GMP_RNDD);
    mpfr_abs(number, number, GMP_RNDD);

    if (mpfr_greaterequal_p(number, po2)) {
      cerr << "\nErreur : impossible d'afficher un nombre plus grand que 1" << endl;
      exit(1);
    }
    for (int i = 0; i < accuracy; i++) {
      // affiche les bits des poids forts au poids faibles
      mpfr_div(po2, po2, num2, GMP_RNDD);
      if (mpfr_greaterequal_p(number, po2)) {
	bit = '1';
	mpfr_sub(number, number, po2, GMP_RNDD);
      }
      else {
	bit = '0';
      }
      if (i >= accuracy - size)
	o << bit;
      else if (bit == '1') {
	cerr << "\nErreur : le nombre a afficher est plus grand que prevu" << endl;
	exit(1);
      }
    }
    mpfr_clear(po2);
    mpfr_clear(num2);
  }
#endif

double round(double number, int bits)
{
  double shift = powOf2(bits);
  double x = number * shift;
  return floor(x + 0.5) / shift;
}

double floor(double number, int bits)
{
  double shift = powOf2(bits);
  return floor(number * shift) / shift;
}

// Calcule 2 ^ power
double powOf2(int power)
{
  double x = 1;
  for (int i = 0; i < power; i++)
    x *= 2;
  return x;
}

// Calcule 2 ^ -minusPower
double negPowOf2(int minusPower)
{
  double x = 1;
  for (int i = 0; i < minusPower; i++)
    x /= 2;
  return x;
}

