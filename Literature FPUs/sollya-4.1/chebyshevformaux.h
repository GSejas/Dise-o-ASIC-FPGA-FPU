/*
  Copyright 2011-2012 by

  Centre de recherche INRIA Sophia-Antipolis Mediterranee, equipe APICS,
  Sophia Antipolis, France.

  Laboratoire de l'Informatique du Parallelisme,
  UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668

  Laboratoire d'Informatique de Paris 6, equipe PEQUAN,
  UPMC Universite Paris 06 - CNRS - UMR 7606 - LIP6, Paris, France,

  Contributors S. Chevillard, M. Joldes, Ch. Lauter

  joldes@lass.fr
  christoph.lauter@ens-lyon.org
  sylvain.chevillard@ens-lyon.org

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

#ifndef CHEBYSHEVFORMAUX_H
#define CHEBYSHEVFORMAUX_H

#include <gmp.h>
#include <mpfr.h>
#include "mpfi-compat.h"
#include "expression.h"

/*This file contains headers of functions in chebModelsAux.c
  i.e. of auxiliary functions for constructing Chebyshev Models/forms*/

/*This function sets an mpfi from evaluating a node* c:
  if c constant after simplification-> ok
  if not sets the value to 0
*/
int mpfi_set_node( sollya_mpfi_t r, node *c, mp_prec_t prec);


/**************************************************************/
/*************Functions related to Chebyshev points************/
/**************************************************************/

/*returns n chebyshev points of first kind in interval x*/
void getChebyshevPoints(sollya_mpfi_t *chebPoints, int n, sollya_mpfi_t x);

/*returns n-1 chebyshev points of second kind in interval x (extremas of T_n((2x-b-a)/(b-a)))*/
void getChebyshevExtrema(sollya_mpfi_t *chebPoints, int n, sollya_mpfi_t x);

/* Returns a matrix chebMatrix of dimension nxn,
   s.t. chebMatrix[i,j]=T_i(x_j), for  i=0..n-1, j=0..n-1, and
   x_j \in [-1,1] the chebyshev points of first kind in [-1,1].
*/
void getChebMatrix(sollya_mpfi_t**chebMatrix, int n, mp_prec_t prec);

/* Returns a matrix chebCoeffsMatrix of dimension nxn,
   s.t. chebCoeffsMatrix[i,j]=coeff(T_i(x), j), for  i=0..n-1, j=0..n-1
*/
void getChebPolyCoeffs(mpz_t* chebCoeffsMatrix, int n, mp_prec_t prec);

/*Returns in chebCoeffs the coeffs of the finite Chebyshev basis expansion
  of the polynomial p of degree n-1, over [-1,1];
  The coefficients in monomial basis of p are in *p
*/
void getPolyCoeffsChebBasis(sollya_mpfi_t *chebCoeffs, sollya_mpfi_t *p, int n);

/*Returns in c the coeffs in the monomial basis for the polynomial p(a*x+b), where:
  -- a and b are mpfi_s
  -- polynomial p  of degree n-1 given by the monomial coefficients stored as mpfi_s in *p*/
void getTranslatedPolyCoeffs(sollya_mpfi_t *c, sollya_mpfi_t *p, int n, sollya_mpfi_t a, sollya_mpfi_t b);

/***************************************************************/
/**********Functions related to Obtaining Chebyshev Coeffs******/
/***************************************************************/

/*evaluate a function in n chebPoints*/
void getFunctionValues(sollya_mpfi_t* fValues, sollya_mpfi_t * chebPoints,node* f,int n);

/*Compute the cheb coeffs for the interpolation polynomial
  of degree n-1 at chebpoints of first kind, we are given:
  n chebpoints x_i and a n*n chebMatrix T_i(x_j))
*/
void getChebCoeffs(sollya_mpfi_t* coeffs, sollya_mpfi_t *chebMatrix, sollya_mpfi_t *fValues,int n);

/*Wrapper that returns the coeffs
  of the interpolation polynomial of f at chebpoints
*/
void getChebCoeffsFromFunction(sollya_mpfi_t* coeffs, sollya_mpfi_t * chebPoints, sollya_mpfi_t * chebMatrix,node *f,int n);

/*Wrapper to get directly the coeffs in the Chebyshev basis
  from a polynomial in the monomial basis given by a node*
*/
void getChebCoeffsFromPolynomial(sollya_mpfi_t**coeffs, int *n, node *f, sollya_mpfi_t x, mp_prec_t prec);

/*Wrapper to get directly the coeffs in the monomial basis
  from a polynomial in the Chebyshev basis given by a list of coeffs*/
void getCoeffsFromChebPolynomial(sollya_mpfi_t**coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x);

/*Wrapper to get directly the coeffs in the monomial basis
  from a polynomial in the Chebyshev basis, over a given interval x*/
void getCoeffsFromChebPolynomial(sollya_mpfi_t**coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x);

/*wrapper to get directly the coeffs in the chebyshev basis up to degree n-1 (first n coeffs)
  and a bound for the remaining polynomial,from a polynomial in the monomial basis(given by a pointer to node),
  over a given interval x*/
void getNChebCoeffsFromPolynomial(sollya_mpfi_t *coeffs, sollya_mpfi_t bound, node *f, sollya_mpfi_t x, int n, int boundLevel);

/******************************************************************************/
/*Functions related to derivation and integration of polynomials in cheb basis*/
/******************************************************************************/

/*Get the derivative of a polynomial in Chebyshev basis, using classical formula*/
void getChebCoeffsDerivativePolynomial(sollya_mpfi_t*coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x);

/*Computes the antiderivative of a polynomial in Chebyshev basis.
  NOTE: the constant coefficient is set to zero, but it should be viewed as a constant*/
void getChebCoeffsIntegrationPolynomial(sollya_mpfi_t*coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x);


void getChebCoeffsDerivativePolynomial(sollya_mpfi_t*coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x);

/*Computes the antiderivative of a polynomial in Chebyshev basis.
  NOTE: the constant coefficient is set to zero, but it should be viewed as a constant*/
void getChebCoeffsIntegrationPolynomial(sollya_mpfi_t*coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x);


/*****************************************************************************/
/*************Functions related to bounding polynomials in ChebBasis**********/
/*****************************************************************************/

/* Computes an interval bound for a polynomial in cheb basis, over [-1,1],
   by just adding the absolute values of the coeffs;
   The n coefficients are given in coeffs.*/
void chebPolynomialBoundSimple(sollya_mpfi_t bound, int n, sollya_mpfi_t *coeffs);

/* Computes an interval bound for a polynomial in cheb basis.
   One day this function may become more complex*/
void chebPolynomialBound(sollya_mpfi_t bound, int n, sollya_mpfi_t *coeffs, int boundLevel);

/* Computes an interval bound for a polynomial in cheb basis.
   by using Clenshaw's method.
   The n coefficients are given in coeffs.*/
void evaluateChebPolynomialClenshaw(sollya_mpfi_t bound, int n, sollya_mpfi_t *coeffs, mpfi_t x,mpfi_t x0);


#endif /* CHEBYSHEVFORMAUX_H */
