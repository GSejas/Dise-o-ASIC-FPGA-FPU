/*

Copyright 2008-2013 by

Laboratoire de l'Informatique du Parallelisme,
UMR CNRS - ENS Lyon - UCB Lyon 1 - INRIA 5668,

LORIA (CNRS, INPL, INRIA, UHP, U-Nancy 2),

and by

Centre de recherche INRIA Sophia-Antipolis Mediterranee, equipe APICS,
Sophia Antipolis, France.

Contributors Ch. Lauter, S. Chevillard

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
herefore means  that it is reserved for developers  and  experienced
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


#include <iostream>

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#undef malloc
#undef realloc

#ifdef HAVE_SPECIAL_FPLLL_INCLUDE
#if HAVE_SPECIAL_FPLLL_INCLUDE
#include <fplll/fplll.h>
#else
#include <fplll.h>
#endif
#else
#include <fplll.h>
#endif

#include <gmp.h>
#include <mpfr.h>
#include <stdio.h>
#include <stdlib.h>


extern "C" {
#include "fpminimax.h"
#include "expression.h"
#include "remez.h"
#include "chain.h"

#include "execute.h"
}

#define coeff(i,j,n) ((i)-1)*(n)+(j)-1

#define MAXLOOP 10

extern "C" void printFPLLLMat(ZZ_mat<mpz_t> *M) { M->print(); }

extern "C" void printMpqMatrix(mpq_t *M, int p, int n) {
  int i,j;
  sollyaPrintf("[");
  for(i=1;i<=p;i++) {
    for(j=1;j<=n;j++) {
      mpq_out_str(stdout, 10, M[coeff(i,j,n)]); if(j!=n) sollyaPrintf(", ");
    }
    if(i!=n) sollyaPrintf(";\n");
  }
  sollyaPrintf("]\n");
  return;
}


extern "C" int mpq_cmpabs(mpq_t a, mpq_t b) {
  mpq_t temp1, temp2;
  int res;

  mpq_init(temp1);
  mpq_init(temp2);

  mpq_abs(temp1, a);
  mpq_abs(temp2, b);
  res = mpq_cmp(temp1, temp2);

  mpq_clear(temp1);
  mpq_clear(temp2);

  return res;
}

extern "C" void mpq_fma(mpq_t r, mpq_t a, mpq_t b, mpq_t c) {
  mpq_t temp;
  mpq_init(temp);

  mpq_mul(temp, a, b);
  mpq_add(r, temp, c);
  mpq_clear(temp);
  return;
}


/* n is the number of columns                */
/* p is the number of lines (p>=n)           */
/* the system is supposed to be invertible   */
/* returns 1 if the system is singular       */
extern "C" int exact_system_solve(mpq_t *res, mpq_t *M, mpq_t *b, int p, int n) {
  chain *i_list=NULL;
  chain *j_list=NULL;
  chain *curri;
  chain *currj;
  int i0, j0, i, j, k;
  int *var;
  mpq_t max,lambda;
  int *order_i = (int *)safeMalloc(n*sizeof(int));
  int *order_j = (int *)safeMalloc(n*sizeof(int));

  mpq_init(max);
  mpq_init(lambda);

  for(i=1;i<=p;i++) {
    var = (int *)safeMalloc(sizeof(int));
    *var = i;
    i_list = addElement(i_list, (void *)var);
  }
  for(j=1;j<=n;j++) {
    var = (int *)safeMalloc(sizeof(int));
    *var = j;
    j_list = addElement(j_list, (void *)var);
  }


  // Triangulation by Gaussian elimination
  i0 = j0 = -1;
  for(k=1;k<=n;k++) {
    mpq_set_ui(max, 0, 1);

    // In this part, we search for the biggest element of the matrix
    curri = i_list;
    while(curri!=NULL) {
      currj = j_list;
      while(currj!=NULL) {
	i = *(int *)(curri->value);
	j = *(int *)(currj->value);
	if(mpq_cmpabs(M[coeff(i,j,n)],max)>=0) {
	  i0 = i;
	  j0 = j;
	  mpq_set(max, M[coeff(i,j,n)]);
	}
	currj = currj->next;
      }
      curri = curri->next;
    }

    i_list = removeInt(i_list, i0);
    j_list = removeInt(j_list, j0);

    order_i[k-1] = i0;
    order_j[k-1] = j0;

    if(mpq_cmp_ui(M[coeff(i0,j0,n)], 0, 1)==0) {
      printMessage(1, SOLLYA_MSG_FPMINIMAX_SINGULAR_MATRIX, "Error: fpminimax: singular matrix\n");
      freeChain(i_list, freeIntPtr);
      freeChain(j_list, freeIntPtr);
      mpq_clear(max);
      mpq_clear(lambda);
      safeFree(order_i);
      safeFree(order_j);
      return 1;
    }

    // Here we update the matrix and the second member
    curri = i_list;
    while(curri!=NULL) {
      i = *(int *)(curri->value);
      mpq_div(lambda, M[coeff(i,j0,n)], M[coeff(i0,j0,n)]);
      mpq_neg(lambda, lambda);

      currj = j_list;
      while(currj!=NULL) {
	j = *(int *)(currj->value);
	mpq_fma(M[coeff(i,j,n)], lambda, M[coeff(i0,j,n)], M[coeff(i,j,n)]);
	currj = currj->next;
      }

      mpq_fma(b[i-1], lambda, b[i0-1], b[i-1]);
      mpq_set_ui(M[coeff(i,j0,n)], 0, 1); // this line is not useful strictly speaking
      curri = curri->next;
    }
  }
  /*********************************************************************/

  freeChain(i_list, freeIntPtr);
  freeChain(j_list, freeIntPtr);

  // Resolution of the system itself
  i_list=NULL;
  for(i=1;i<=n;i++) {
    var = (int *)safeMalloc(sizeof(int));
    *var = order_i[i-1];
    i_list = addElement(i_list, (void *)var);
  }

  for(k=n;k>=1;k--) {
    i0 = order_i[k-1];
    j0 = order_j[k-1];

    mpq_div(res[j0-1], b[i0-1], M[coeff(i0,j0,n)]);

    i_list = removeInt(i_list, i0);

    curri = i_list;
    while(curri!=NULL) {
      i = *(int *)(curri->value);
      mpq_neg(M[coeff(i,j0,n)], M[coeff(i,j0,n)]);
      mpq_fma(b[i-1], M[coeff(i,j0,n)], res[j0-1], b[i-1]);
      curri=curri->next;
    }
  }

  safeFree(order_i);
  safeFree(order_j);
  freeChain(i_list, freeIntPtr);
  mpq_clear(max);
  mpq_clear(lambda);
  return 0;
}






extern "C" chain *ChebychevPoints(mpfr_t a, mpfr_t b, int n) {
  chain *res=NULL;
  mpfr_t temp, temp2, u;
  mpfr_t *mpfrptr;
  int i;

  mpfr_init2(temp, tools_precision);
  mpfr_init2(temp2, tools_precision);
  mpfr_init2(u, tools_precision);

  mpfr_sub(u, b, a, GMP_RNDN);
  mpfr_div_2ui(u, u, 1, GMP_RNDN);

  for(i=1; i<=n; i++) {
    mpfrptr = (mpfr_t *)safeMalloc(sizeof(mpfr_t));
    mpfr_init2(*mpfrptr, tools_precision);

    mpfr_set_ui(temp, 2*i-1, GMP_RNDN);
    mpfr_const_pi(temp2, GMP_RNDN);
    mpfr_mul(temp, temp, temp2, GMP_RNDN);
    mpfr_div_ui(temp, temp, 2*n, GMP_RNDN);
    mpfr_cos(temp, temp, GMP_RNDN);
    mpfr_add_ui(temp, temp, 1, GMP_RNDN);
    mpfr_mul(temp, temp, u, GMP_RNDN);
    mpfr_add(*mpfrptr, temp, a, GMP_RNDN);
    res = addElement(res, mpfrptr);
  }

  mpfr_clear(temp);
  mpfr_clear(temp2);
  mpfr_clear(u);
  return res;
}

/* Assuming that poly = sum a_i *gi(x), find a_i such that gi(x) = g(x) and store it as a constant expression in c */
/* Returns 1 in case of success and 0 in case of failure. In this case, c is unchanged */
/* Nothing is done for trying to recognize equivalent expressions: for instance, if g(x) = (x+1) and poly = 2*(1+x)
   the algorithm fails. The algorithm fails also if g(x) = (x+1) and poly = 2*(x+1)*3, whatever the way you
   put parentheses.
*/
extern "C" int findCoeffInPseudoPolynomial(node **c, node *poly, node *g) {
  node *a, *b;
  node *temp;
  int r1, r2;

  if (poly == NULL)  return 0;
  switch (accessThruMemRef(poly)->nodeType) {
  case ADD:
    r1 = findCoeffInPseudoPolynomial(&a, accessThruMemRef(poly)->child1, g);
    r2 = findCoeffInPseudoPolynomial(&b, accessThruMemRef(poly)->child2, g);
    if (r1) {
      if (r2) *c = makeAdd(a,b);
      else *c = a;
      return 1;
    }
    else {
      if (r2) { *c = b; return 1; }
    }
    break;
  case SUB:
    r1 = findCoeffInPseudoPolynomial(&a, accessThruMemRef(poly)->child1, g);
    r2 = findCoeffInPseudoPolynomial(&b, accessThruMemRef(poly)->child2, g);
    if (r1) {
      if (r2) *c = makeSub(a,b);
      else *c = a;
      return 1;
    }
    else {
      if (r2) { *c = makeNeg(b); return 1; }
    }
    break;
  case NEG:
    r1 = findCoeffInPseudoPolynomial(&a, accessThruMemRef(poly)->child1, g);
    if (r1) { *c = makeNeg(a); return 1; }
    break;
  case MUL:
    if ( isSyntacticallyEqual(accessThruMemRef(poly)->child2, g) && isConstant(accessThruMemRef(poly)->child1) ) {
      *c = copyTree(accessThruMemRef(poly)->child1); return 1;
    }
    if ( isSyntacticallyEqual(accessThruMemRef(poly)->child1, g) && isConstant(accessThruMemRef(poly)->child2) ) {
      *c = copyTree(accessThruMemRef(poly)->child2); return 1;
    }
    break;
  case DIV:
    if ( isSyntacticallyEqual(accessThruMemRef(poly)->child1, g) && isConstant(accessThruMemRef(poly)->child2) ) {
      *c = makeDiv(makeConstantDouble(1.0), copyTree(accessThruMemRef(poly)->child2)); return 1;
    }
    temp = makeDiv(makeConstantDouble(1.0), copyTree(accessThruMemRef(poly)->child2));
    if ( isSyntacticallyEqual(temp, g) && isConstant(accessThruMemRef(poly)->child1) ) {
      *c = copyTree(poly->child1);
      free_memory(temp); return 1;
    }
    free_memory(temp);
    break;
  }

  /* Nothing worked. Maybe, poly = g, in which case, the coefficient is implicitely 1,
     or poly = constant and g = constant, in which case the coefficient is implicitely poly/g,
     or poly = 0, in which case the coefficient is implicitely 0.  */
  if (isSyntacticallyEqual(poly, g)) { *c = makeConstantDouble(1.0); return 1; }

  if ( (isConstant(poly)) && (isConstant(g)) ) {
    *c = makeDiv(copyTree(poly), copyTree(g)); return 1;
  }

  temp = makeConstantDouble(0.0);
  if (isSyntacticallyEqual(poly, temp)) { *c = temp; return 1; }

  /* Otherwise, we fail */
  free_memory(temp);
  return 0;
}

/* Assuming that poly = sum a_i * monomials[i](x), this function computes the array of the a_i
   and store it in coefficients. Enough room must be available in coefficients to store them all,
   and the mpfr_t must already be initialized.
   Note that the same restrictions hold as with function findCoeffInPseudoPolynomial.
   Returns 1 in case of success and 0 in case of failure (in this case nothing can be said about
   the content of coefficients)
*/
extern "C" int getCoefficientsInPseudoPolynomial(mpfr_t *coefficients, node *poly, chain *monomials) {
  chain *curr;
  node *coeff;
  int i = 0;
  for (curr = monomials; curr != NULL; curr = curr->next) {
    if (findCoeffInPseudoPolynomial(&coeff, poly, (node *)(curr->value))) {
      evaluateThingToConstant(coefficients[i], coeff, NULL, 1, 0);
      free_memory(coeff);
      i++;
    }
    else { return 0;}
  }
  return 1;
}


extern "C" chain *computeExponents(chain *formats, mpfr_t* coefficients, int dim) {
  chain *curr;
  chain *res = NULL;
  int *intptr;
  chain *tempChain;
  int i;

  curr = formats;
  for(i=0; i<dim; i++) {
    intptr = (int *)safeMalloc(sizeof(int));

    if(mpfr_zero_p(coefficients[i])) {
      printMessage(1, SOLLYA_MSG_FPMINIMAX_A_CERTAIN_COEFF_IS_EXACT_ZERO, "Information: fpminimax: the %dth coefficient of the minimax is an exact zero\n", i);
      printMessage(1, SOLLYA_MSG_CONTINUATION, "You should probably take this into account\n");
      *intptr=*(int *)(curr->value);
    }
    else *intptr = *(int *)(curr->value) - mpfr_get_exp(coefficients[i]);
    res = addElement(res, intptr);
    curr = curr->next;
  }

  tempChain = copyChain(res, copyIntPtrOnVoid);
  freeChain(res, freeIntPtr);
  res = tempChain;

  return res;
}

extern "C" int fitInFormat(chain *formats, mpfr_t* coefficients, int dim) {
  chain *curr;
  mpfr_t val;
  int prec, i;
  int test=1;

  curr = formats;
  for(i=0; (i<dim) && test; i++) {
    if(!mpfr_zero_p(coefficients[i])) {
      prec = *(int *)(curr->value);
      if (prec==1) {
	mpfr_init2(val, 12);
	mpfr_set_ui(val, 1, GMP_RNDN);
	mpfr_mul_2si(val, val, mpfr_get_exp(coefficients[i])-1, GMP_RNDN);
	if ( !mpfr_equal_p(val, coefficients[i]) ) test=0;
	mpfr_clear(val);
      }
      else {
	mpfr_init2(val, prec);
	if (mpfr_set(val, coefficients[i], GMP_RNDN)!=0) test=0;
	mpfr_clear(val);
      }
    }
    curr = curr->next;
  }

  return test;
}



extern "C" node *FPminimaxMain(node *, chain *, chain *, chain *, node *);


extern "C" node *FPminimax(node *f,
		chain *monomials,
		chain *formats,
		chain *points,
		mpfr_t a, mpfr_t b,
		int fp, int absrel,
		node *consPart,
		node *minimax) {

  node *g, *w;
  node *pstar;
  node *err;
  node *tempTree;
  chain *pointslist;
  node *res;
  chain *correctedFormats, *newFormats;
  chain *curr;
  int i, test, count;
  mpfr_t zero, infinity, quality;
  mpfr_t *coefficients;
  int dim = lengthChain(monomials);

  newFormats = NULL;

  if (absrel== ABSOLUTESYM) {
    tempTree = makeSub(copyTree(f),copyTree(consPart));
    g = simplifyTreeErrorfree(tempTree);
    free_memory(tempTree);

    w = makeConstantDouble(1.);
  }
  else {
    tempTree = makeSub(makeConstantDouble(1.), makeDiv(copyTree(consPart),copyTree(f)));
    g = simplifyTreeErrorfree(tempTree);
    free_memory(tempTree);

    tempTree = makeDiv(makeConstantDouble(1.), copyTree(f));
    w = simplifyTreeErrorfree(tempTree);
    free_memory(tempTree);
  }

  mpfr_init2(zero, 53); mpfr_set_ui(zero, 0, GMP_RNDN);
  mpfr_init2(infinity, 53); mpfr_set_inf(infinity, 1);
  pstar = NULL;
  if( (fp==FLOATING) || (points==NULL) ) {
    if (minimax == NULL) {
      pushTimeCounter();
      mpfr_init2(quality, 53); mpfr_set_d(quality, 0.00001, GMP_RNDN);
      pstar = remez(g, w, monomials, a, b, quality, zero, infinity, tools_precision);
      mpfr_clear(quality);
      popTimeCounter((char *)"FPminimax: computing minimax approximation");
    }
    else pstar = copyTree(minimax);
  }

  if (isError(pstar)) {
      printMessage(1, SOLLYA_MSG_FPMINIMAX_FAILED_TO_RECOVER_COEFFS_FROM_POLY, "Warning: fpminimax failed to recover the coefficients from the minimax pseudo-polynomial\n");
      free_memory(g); free_memory(w); freeThing(pstar);
      mpfr_clear(zero); mpfr_clear(infinity);
      return NULL;
  }

  if ((pstar != NULL) && (isHorner(pstar))) {
    tempTree = makeCanonical(pstar, tools_precision);
    free_memory(pstar);
    pstar = tempTree;
  }

  err = NULL;
  if(points == NULL) {
    tempTree = makeSub(makeMul(copyTree(pstar), copyTree(w)), copyTree(g));
    err = simplifyTreeErrorfree(tempTree);
    free_memory(tempTree);

    pushTimeCounter();
    pointslist = uncertifiedFindZeros(err, a, b, defaultpoints, tools_precision);
    popTimeCounter((char *)"FPminimax: finding valuable interpolation points.");

    // Tests if there is enough points
    // if not, Chebychev points are used and we approximate pstar instead of f
    if(lengthChain(pointslist)< dim) {
      printMessage(2, SOLLYA_MSG_FPMINIMAX_MINIMAX_DOES_NOT_GIVE_ENOUGH_POINTS, "Information: FPminimax: the minimax does not provide enough points.\n");
      printMessage(2, SOLLYA_MSG_CONTINUATION, "Switching to Chebyshev points.\n");

      freeChain(pointslist, freeMpfrPtr);
      pointslist = ChebychevPoints(a,b, dim);
      free_memory(g);
      free_memory(w);

      if (absrel== ABSOLUTESYM) {
	g = copyTree(pstar);
	w = makeConstantDouble(1);
      }
      else {
	tempTree = makeSub(makeConstantDouble(1),
			   makeDiv(copyTree(consPart),
				   makeAdd(copyTree(pstar),copyTree(consPart))
				   )
			   );
	g = simplifyTreeErrorfree(tempTree);
	free_memory(tempTree);

	tempTree = makeDiv(makeConstantDouble(1),
			   makeAdd(copyTree(pstar),copyTree(consPart))
			   );
	w = simplifyTreeErrorfree(tempTree);
	free_memory(tempTree);
      }
    }
  }
  else pointslist = copyChainWithoutReversal(points, copyMpfrPtr);


  curr = pointslist;
  printMessage(4,SOLLYA_MSG_FPMINIMAX_THE_POINTS_ARE_CERTAIN_VALUES,"points list: [");
  while(curr != NULL) {
    printMessage(4, SOLLYA_MSG_CONTINUATION, "%v", *(mpfr_t *)(curr->value));
    if(curr->next != NULL) printMessage(4, SOLLYA_MSG_CONTINUATION, ", ");
    curr = curr->next;
  }


  if (fp == FIXED)   res = FPminimaxMain(g, monomials, formats, pointslist, w);

  else {   // Floating-point coefficients: we must compute good exponents
    test=1; count=0;

    coefficients = (mpfr_t *)safeCalloc(dim, sizeof(mpfr_t));
    for(i=0; i<dim; i++) mpfr_init2(coefficients[i], tools_precision);

    if (!getCoefficientsInPseudoPolynomial(coefficients, pstar, monomials)) {
      printMessage(1, SOLLYA_MSG_FPMINIMAX_FAILED_TO_RECOVER_COEFFS_FROM_POLY, "Warning: fpminimax failed to recover the coefficients from the minimax pseudo-polynomial\n");
      res = NULL;
      test = 0;
      correctedFormats = NULL;
    }
    else {
      correctedFormats = computeExponents(formats, coefficients, dim);
    }

    while(test) {
      printMessage(3,SOLLYA_MSG_FPMINIMAX_THE_EXPONENTS_ARE_CERTAIN_VALUES,"Information: fpminimax: computed exponents: [|");
      curr = correctedFormats;
      while(curr != NULL) {
	printMessage(3,SOLLYA_MSG_CONTINUATION,"%d", *(int *)(curr->value));
	if (curr->next != NULL) printMessage(3,SOLLYA_MSG_CONTINUATION,", ");
	curr = curr->next;
      }
      printMessage(3,SOLLYA_MSG_CONTINUATION,"|]\n");

      res = FPminimaxMain(g, monomials, correctedFormats, pointslist, w);
      count++;

      if(res==NULL) test=0;
      else {
	if (!getCoefficientsInPseudoPolynomial(coefficients, res, monomials)) {
	  printMessage(1, SOLLYA_MSG_FPMINIMAX_FAILED_TO_RECOVER_COEFFS_FROM_POLY, "Warning: fpminimax failed to recover the coefficients from the minimax pseudo-polynomial\n");
	  res = NULL;
	  test = 0;
	  correctedFormats = NULL;
	  newFormats = NULL;
	}
	else newFormats =  computeExponents(formats, coefficients, dim);

	if( isEqualChain(newFormats,correctedFormats, isEqualIntPtrOnVoid) ) test=0;
	else {
	  if( (count > MAXLOOP) && (fitInFormat(formats, coefficients, dim)) ) test=0;
	  else {
	    if( (count > 2*MAXLOOP) ) {
	      res=NULL;
	      test=0;
	      printMessage(1,SOLLYA_MSG_FPMINIMAX_DID_NOT_CONVERGE, "Warning: fpminimax did not converge.\n");
	    }
	    else {
	      free_memory(res);
	      freeChain(correctedFormats, freeIntPtr);
	      correctedFormats = newFormats;
	    }
	  }
	}
      }
    }
    freeChain(correctedFormats, freeIntPtr);
    if (res!=NULL) freeChain(newFormats, freeIntPtr);
    for(i=0; i<dim; i++) mpfr_clear(coefficients[i]);
    safeFree(coefficients);
  }

  free_memory(g);
  free_memory(w);
  if(pstar!=NULL) free_memory(pstar);
  if(err!=NULL) free_memory(err);
  freeChain(pointslist, freeMpfrPtr);

  if(res!=NULL) {
    tempTree = makeAdd(copyTree(consPart), res);
    res = simplifyTreeErrorfree(tempTree);
    free_memory(tempTree);
  }

  mpfr_clear(zero);
  mpfr_clear(infinity);

  return res;
}

extern "C" node *FPminimaxMain(node *f,
		    chain *monomials,
		    chain *formats,
		    chain *points,
		    node *w) {
  int i,j, test, r, testIfSingular;
  mp_prec_t prec = getToolPrecision();
  int dim = lengthChain(monomials);
  int nbpoints = lengthChain(points);
  node *res;
  mpfr_t zero_mpfr, var1, var2, var3, max;
  node * temp_tree, *temp_tree2;
  mpfr_t *M;
  chain *curr;
  node **monomials_tree;
  mpfr_t *x;
  mp_exp_t expo_min;

  mpq_t *coefficients;
  mpq_t *exactMatrix;
  mpq_t *reducedVect;
  mpfr_t *mpfr_coefficients;

  ZZ_mat<mpz_t> * FPlllMat;
  Z_NR<mpz_t>  zval;
  mpz_t mpzval;
  wrapper *LLLwrapper;

  mpz_init(mpzval);


  if(nbpoints < dim) {
    printMessage(1,SOLLYA_MSG_FPMINIMAX_NOT_ENOUGH_POINTS,"Error: FPminimax: not enough points!\n");
    return NULL;
  }
  if(lengthChain(formats) < dim) {
    printMessage(1,SOLLYA_MSG_FPMINIMAX_NOT_ENOUGH_FORMATS,"Error: FPminimax: not enough formats!\n");
    return NULL;
  }

 // Initialisations and precomputations
  mpfr_init2(var1, prec);
  mpfr_init2(var2, prec);
  mpfr_init2(var3, prec);
  mpfr_init2(max, prec);

  mpfr_init2(zero_mpfr, 53);
  mpfr_set_d(zero_mpfr, 0., GMP_RNDN);


  // Initializing the matrix
  M = (mpfr_t *)safeMalloc((dim+1)*(nbpoints+1)*sizeof(mpfr_t));
  exactMatrix = (mpq_t *)safeMalloc((nbpoints+1)*(dim+1)*sizeof(mpq_t));
  for(i=1; i<=nbpoints+1; i++) {
    for(j=1; j<=dim+1; j++) {
      mpfr_init2(M[coeff(i,j,dim+1)],prec);
      mpq_init(exactMatrix[coeff(i,j,dim+1)]);
    }
  }

  mpfr_coefficients = (mpfr_t *)safeMalloc(dim*sizeof(mpfr_t));
  for(i=1; i<=dim; i++) {
    mpfr_init2(mpfr_coefficients[i-1], prec);
  }

  coefficients = (mpq_t *)safeMalloc((dim+1)*sizeof(mpq_t));
  reducedVect = (mpq_t *)safeMalloc((nbpoints+1)*sizeof(mpq_t));

  for(j=1; j<=dim+1; j++)    mpq_init(coefficients[j-1]);
  for(i=1; i<=nbpoints+1; i++)   mpq_init(reducedVect[i-1]);

  FPlllMat = new ZZ_mat<mpz_t>(dim+1,nbpoints+1);

  // Computing useful arrays
  monomials_tree = (node **)safeMalloc(dim*sizeof(node *));
  curr = monomials;
  for(j=0; j<dim; j++) {
    monomials_tree[j] = copyTree((node *)curr->value);
    curr=curr->next;
  }


  x = (mpfr_t *)safeMalloc(nbpoints*sizeof(mpfr_t));
  curr=points;
  for(i=1; i<=nbpoints; i++) {
    mpfr_init2(x[i-1], prec);
    mpfr_set(x[i-1], *(mpfr_t *)(curr->value), GMP_RNDN);
    curr=curr->next;
  }



  // Filling the matrix
  pushTimeCounter();
  for (i=1; i <= nbpoints; i++) {
    r = evaluateFaithfulWithCutOffFast(var1, w, NULL, x[i-1], zero_mpfr, prec);
    if(((r==1) || (r==4) || (r==5) || (r==6) || (r==7)) && (mpfr_number_p(var1))) test=1;
    else test=0;

    for (j=1; j <= dim; j++) {
      if(test==1) {
	r = evaluateFaithfulWithCutOffFast(var2, monomials_tree[j-1], NULL, x[i-1], zero_mpfr, prec);
	if(((r==1) || (r==4) || (r==5) || (r==6) || (r==7)) && (mpfr_number_p(var2))) {
	  mpfr_mul(var2, var1, var2, GMP_RNDN);
	  mpfr_set(M[coeff(i,j,dim+1)],var2,GMP_RNDN);
	}
      }
      if((test==0) || (r==0) || (!mpfr_number_p(var2))) {
	printMessage(2,SOLLYA_MSG_FPMINIMAX_COMP_OF_MATRIX_ENTRY_USES_SLOWER_ALGO,"Information: the construction of M[%d,%d] uses a slower algorithm\n",i,j);
	temp_tree = (node *)safeMalloc(sizeof(node));
	temp_tree->nodeType = MUL;
	temp_tree->child1 = copyTree(monomials_tree[j-1]);
	temp_tree->child2 = copyTree(w);

	temp_tree2 = simplifyTreeErrorfree(temp_tree);
	free_memory(temp_tree);
	temp_tree = temp_tree2; // temp_tree = x^(monomials[j])*w(x)

	r = evaluateFaithfulWithCutOffFast(var3, temp_tree, NULL, x[i-1], zero_mpfr, prec);

	if(r==0) mpfr_set_d(var3, 0., GMP_RNDN);
	mpfr_set(M[coeff(i,j,dim+1)],var3,GMP_RNDN);
	free_memory(temp_tree);
      }
    }
  }

  for(j=1; j<=dim; j++)
    mpfr_set_ui(M[coeff(nbpoints+1, j, dim+1)], 0, GMP_RNDN);

  for(i=1; i<=nbpoints; i++) {
    r = evaluateFaithfulWithCutOffFast(var1, f, NULL, x[i-1], zero_mpfr, prec);
    if(r==0) mpfr_set_d(var1, 0., GMP_RNDN);
    mpfr_set(M[coeff(i,dim+1,dim+1)],var1,GMP_RNDN);
  }

  mpfr_set_ui(max, 0, GMP_RNDN);
  expo_min = mpfr_get_emax();

  for(i=1; i<=nbpoints; i++) {
    for(j=1; j<=dim; j++) {
      mpfr_div_2si(M[coeff(i,j,dim+1)], M[coeff(i,j,dim+1)], *(int *)accessInList(formats,j-1), GMP_RNDN);
      if(mpfr_cmpabs(max, M[coeff(i,j,dim+1)])<0)
	mpfr_abs(max, M[coeff(i,j,dim+1)], GMP_RNDN);
      if( (!mpfr_zero_p(M[coeff(i,j,dim+1)])) && (mpfr_get_exp(M[coeff(i,j,dim+1)]) < expo_min) )
	expo_min = mpfr_get_exp(M[coeff(i,j,dim+1)]);
    }

    if( (!mpfr_zero_p(M[coeff(i,dim+1,dim+1)])) &&
	(mpfr_get_exp(M[coeff(i,dim+1,dim+1)]) < expo_min) )
      expo_min = mpfr_get_exp(M[coeff(i,j,dim+1)]);
  }

  mpfr_mul_ui(M[coeff(nbpoints+1,dim+1,dim+1)], max, nbpoints, GMP_RNDN);

  if( (!mpfr_zero_p(M[coeff(nbpoints+1,dim+1,dim+1)])) &&
      (mpfr_get_exp(M[coeff(nbpoints+1,dim+1,dim+1)]) < expo_min) )
    expo_min = mpfr_get_exp(M[coeff(nbpoints+1,dim+1,dim+1)]);

  popTimeCounter((char *)"FPminimax: constructing the matrix");


  pushTimeCounter();
  mpfr_mul_2si(M[coeff(nbpoints+1,dim+1,dim+1)], M[coeff(nbpoints+1,dim+1,dim+1)], prec-expo_min, GMP_RNDN);

  for(i=1; i<=nbpoints; i++) {
    for(j=1; j<=dim+1; j++) {
      mpfr_mul_2si(M[coeff(i, j, dim+1)], M[coeff(i, j,dim+1)], prec-expo_min, GMP_RNDN);

      mpfr_get_z(mpzval, M[coeff(i,j,dim+1)], GMP_RNDN);
      zval.set(mpzval);
      FPlllMat->Set(j-1,i-1,zval);
      mpq_set_z(exactMatrix[coeff(i,j,dim+1)], mpzval);
    }
  }

  for(j=1; j<=dim+1; j++) {
    mpfr_get_z(mpzval, M[coeff(nbpoints+1,j,dim+1)], GMP_RNDN);
    zval.set(mpzval);
    FPlllMat->Set(j-1,nbpoints,zval);
    mpq_set_z(exactMatrix[coeff(nbpoints+1,j,dim+1)], mpzval);
  }
  popTimeCounter((char *)"FPminimax: preparing exact matrices for the call to LLL");

  // LLL reduction
  pushTimeCounter();
  LLLwrapper = new wrapper(FPlllMat);
  LLLwrapper->LLL();
  popTimeCounter((char *)"FPminimax: LLL call");

  // Converting all stuff into exact numbers

  for(i=1; i<=nbpoints+1; i++) {
    mpq_set_z(reducedVect[i-1], LLLwrapper->GetBase()->Get(dim, i-1).GetData());
  }

  // Getting the coefficients
  pushTimeCounter();
  testIfSingular = exact_system_solve(coefficients, exactMatrix, reducedVect, nbpoints+1, dim+1);
  popTimeCounter((char *)"FPminimax: computing the coefficients");

  if(testIfSingular == 0) { /* The system has been correctly solved */

    // Construction of the resulting polynomial
    for(j=1;j<=dim;j++) {
      mpfr_set_q(mpfr_coefficients[j-1], coefficients[j-1], GMP_RNDN);

      // We check that the precision is sufficient to represent exactly the coefficient
      if( (!mpfr_zero_p(mpfr_coefficients[j-1])) &&
	  (mpfr_get_exp(mpfr_coefficients[j-1]) > (int)mpfr_get_prec(mpfr_coefficients[j-1]))
	  ) {
	mpfr_set_prec(mpfr_coefficients[j-1], mpfr_get_exp(mpfr_coefficients[j-1]));
	mpfr_set_q(mpfr_coefficients[j-1], coefficients[j-1], GMP_RNDN);
      }

      mpfr_neg(mpfr_coefficients[j-1], mpfr_coefficients[j-1], GMP_RNDN);
      mpfr_div_2si(mpfr_coefficients[j-1],
		   mpfr_coefficients[j-1],
		   *(int *)accessInList(formats,j-1), GMP_RNDN);
    }

    res = constructPolynomialFromArray(mpfr_coefficients, monomials_tree, dim);
  }
  else res = NULL;

  // Cleaning
  delete FPlllMat;
  delete LLLwrapper;

  mpfr_clear(zero_mpfr);
  mpfr_clear(var1);
  mpfr_clear(var2);
  mpfr_clear(var3);
  mpfr_clear(max);

  for(i=1; i<=nbpoints+1; i++) {
    for(j=1; j<=dim+1; j++) {
      mpfr_clear(M[coeff(i,j,dim+1)]);
      mpq_clear(exactMatrix[coeff(i,j,dim+1)]);
    }
  }
  safeFree(M);
  safeFree(exactMatrix);


  for(j=1; j<=dim; j++)   free_memory(monomials_tree[j-1]);
  safeFree(monomials_tree);

  for(i=1; i<=nbpoints; i++)  mpfr_clear(x[i-1]);
  safeFree(x);

  for(j=1;j<=dim+1; j++) mpq_clear(coefficients[j-1]);
  safeFree(coefficients);

  for(i=1; i<=nbpoints+1; i++)   mpq_clear(reducedVect[i-1]);
  safeFree(reducedVect);

  for(j=1; j<=dim; j++)   mpfr_clear(mpfr_coefficients[j-1]);
  safeFree(mpfr_coefficients);

  mpz_clear(mpzval);

  return res;
}

