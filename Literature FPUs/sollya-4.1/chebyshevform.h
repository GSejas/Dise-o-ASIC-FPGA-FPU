/*
  Copyright 2011-2012 by

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668

  Contributor M. Joldes

  joldes@lass.fr

  This software is a computer program whose purpose is to provide an
  environment for safe floating-point code development. It is
  particularily targeted to the automatized implementation of
  mathematical floating-point libraries (libm). Amongst other features,
  it offers a certified infinity norm, an automatic polynomial
  implementer and a fast Remez algorithm.

  This software is governed by the CeCILL-C license under French law and
  abiding by the rules of distribution of free software.  You can  use,
  modify and/ or redistribute the software under the terms of the CeCILL-C
  license as circulated by CEA, CNRS and INRIA at the following URL
  "http://www.cecill.info".

  As a counterpart to the access to the source code and  rights to copy,
  modify and redistribute granted by the license, users are provided only
  with a limited warranty  and the software's author,  the holder of the
  economic rights,  and the successive licensors  have only  limited
  liability.

  In this respect, the user's attention is drawn to the risks associated
  with loading,  using,  modifying and/or developing or reproducing the
  software by the user in light of its specific status of free software,
  that may mean  that it is complicated to manipulate,  and  that  also
  therefore means  that it is reserved for developers  and  experienced
  professionals having in-depth computer knowledge. Users are therefore
  encouraged to load and test the software's suitability as regards their
  requirements in conditions enabling the security of their systems and/or
  data to be ensured and,  more generally, to use and operate it in the
  same conditions as regards security.

  The fact that you are presently reading this means that you have had
  knowledge of the CeCILL-C license and that you accept its terms.

  This program is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

*/

#ifndef CHEBYSHEVFORM_H
#define CHEBYSHEVFORM_H

#include "expression.h"
#include "chain.h"
#include "chebyshevformaux.h"
/*Cheb model (CM, cm) structure:
  n - order: polynomial of degree n-1, remainder of order O(x^n)
  x - interval on which the cm is computed
  cheb_array - n chebyshev points (of first kind) kept; denoted x_i
  these are computed only once for each interval x
  cheb_matix - T_j(x_i);  i, j in {0,..., n-1};
  This has to be computed only once on each interval x
  poly_array - array of n coeffs (in Cheb Basis)
  corresponding to polynomial of degree n-1
  rem_bound - bound for the remainder
  poly_bound - bound for the polynomial (helpful for computations)
*/
typedef struct cmdl {
  int n;
  sollya_mpfi_t x;
  sollya_mpfi_t **cheb_array;
  sollya_mpfi_t **cheb_matrix;
  sollya_mpfi_t *poly_array;
  sollya_mpfi_t rem_bound;
  sollya_mpfi_t poly_bound;
} chebModel;

/***************************************************************/
/***************************************************************/
/**********Functions related to Chebyshev Models****************/
/***************************************************************/
/***************************************************************/

/* This function creates an empty cheb model */
chebModel* createEmptycModel(int n,sollya_mpfi_t x, mp_prec_t p);

/*This function creates an empty chebyshev model
  and depending on two flags: flag_points, flag_matrix,
  with convention 1= compute, 0=do not compute
  computes the chebyshev points of order n over x, x_i^{[a,b]}
  and the chebMatrix (T_j(x_i)), i=0..n-1, j=0..n-1
*/
chebModel* createEmptycModelCompute(int n,sollya_mpfi_t x, int flag_points,
                                    int flag_matrix,  mp_prec_t p);


/*This function creates an empty chebyshev model
  and makes the link from chebpoints and chebMatrix into the new cmodel
  (this function assumes that we have already computed
  chebpoints and chebMatrix (if the respective pointers are not NULL)
*/
chebModel* createEmptycModelPrecomp(int n,sollya_mpfi_t x,
                                    sollya_mpfi_t **chebPoints, sollya_mpfi_t **chebM,  mp_prec_t p);

/*This function dealocates a cheb model, without touching the memory
  referenced by cheb_array and cheb_matrix parts
*/
void clearcModelLight(chebModel *t);

/*This function dealocates a cheb model, distroying
  the cheb_array and cheb_matrix parts
*/
void clearcModelComplete(chebModel *t);

/*This function pretty prints a cheb model
 */
void printcModel(chebModel *t);

/***************************************************************/
/*******The convention for all the following functions is:******/
/***the cmodel given as parameter must be previously created ***/
/***************************************************************/
/***************************************************************/

/*This function sets the chebModel t with constant ct;
  It updates the bound.
*/
void constcModel(chebModel*t, sollya_mpfi_t ct);

/* Check that models are compatible one with another:
   i.e. they can be added, mulitplied, copied, etc. */
int cModelsAreCompatible(chebModel *t1, chebModel *t2);

/*This function sets a cm t with the values given by anoter cm tt
  they should have the same basis and interval,
  if an incompatibility is detected, no modification is made.
*/
void copycModel(chebModel *t, chebModel *tt);
/***************************************************************/
/*********************Operations on ChebModels******************/
/***************************************************************/

/* Compute the multiplication of a cm by a constant */
void ctMultiplication_CM(chebModel*d, chebModel*s, sollya_mpfi_t c, mp_prec_t prec);


/*Compute the cm for addition of two given cms.
  Updates the resulting polynomial bound.
*/
void addition_CM(chebModel *t,chebModel *child1_tm, chebModel *child2_tm, mp_prec_t prec);

/*This function multiplies two given cms;
  -- parameter *boundLevel* controls the algorithm used for bounding polynomials
  -- parameter *forComposition* specifies whether:
  forComposition=1 --> we are using the multiplication inside a composition,
  we suppose bounds for the polynomials are already updated inside models
  OTHERWISE --> we rebound them
*/
void  multiplication_CM(chebModel *t,chebModel *c1, chebModel *c2, int boundLevel, int forComposition, mp_prec_t prec);

/* composition: g o f
   VERY IMPORTANT ASSUMPTIONS:
   We are given a cm for the function f over x, order n
   and a cm for basic function g over y, order n with:
   range(f->poly)+ f->rem_bound \subseteq y

   Note that these assumptions ARE NOT CHECKED inside the function.
   If these assumptions are true, it returns a valid tm for g(f(x)) over x.

   Note that it is indicated to bound f tightly before,
   such that the image over which g is computed is small.
   We suppose here that the image for f is already computed tightly,
   and will not be recomputed here.
*/
/*NOTE: targetRem is a parameter that will stop the composition
  of the computed remainder gets too large;
  currently, it is not used, but this should change in the future*/
void composition_CM(chebModel *t,chebModel *g, chebModel *f, int boundLevel, mpfr_t targetRem, mp_prec_t prec);


void chebyshevform(node **Ch, chain **errors, sollya_mpfi_t delta,
                   chain **chebyshevCoefficients, node *f, int n,
                   sollya_mpfi_t dom, mp_prec_t prec);

#endif /* CHEBYSHEVFORM_H */
