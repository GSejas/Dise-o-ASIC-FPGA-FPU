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


#include "infnorm.h"
#include "autodiff.h"
#include "general.h"
#include <mpfr.h>
#include <stdio.h>
#include <stdlib.h>
#include "chebyshevformaux.h"
#include "chebyshevform.h"
#include "taylorform.h"

/***************************************************************/
/***************************************************************/
/**********Functions related to Chebyshev Models****************/
/***************************************************************/
/***************************************************************/


/* This function creates an empty cheb model */
chebModel* createEmptycModel(int n,sollya_mpfi_t x, mp_prec_t p){
  chebModel* t;
  int i;
  mp_prec_t prec;
  prec=p;
  t= (chebModel *)safeMalloc(sizeof(chebModel));
  sollya_mpfi_init2(t->rem_bound, prec);
  sollya_mpfi_init2(t->poly_bound,prec);

  sollya_mpfi_init2(t->x,prec);
  sollya_mpfi_set(t->x,x);

  t->n=n;
  t->poly_array= (sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));
  for(i=0;i<n;i++){
    sollya_mpfi_init2(t->poly_array[i], prec);
  }
  t->cheb_array= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));
  t->cheb_matrix= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));
  return t;
}

/*This function creates an empty chebyshev model
  and depending on two flags: flag_points, flag_matrix,
  with convention 1= compute, 0=do not compute
  computes the chebyshev points of order n over x, x_i^{[a,b]}
  and the chebMatrix (T_j(x_i)), i=0..n-1, j=0..n-1
*/
chebModel* createEmptycModelCompute(int n,sollya_mpfi_t x, int flag_points, int flag_matrix,  mp_prec_t p){
  chebModel* t;
  int i;
  mp_prec_t prec;
  prec=p;
  t= (chebModel *)safeMalloc(sizeof(chebModel));
  sollya_mpfi_init2(t->rem_bound, prec);
  sollya_mpfi_init2(t->poly_bound,prec);


  sollya_mpfi_init2(t->x,prec);
  sollya_mpfi_set(t->x,x);

  t->n=n;
  t->poly_array= (sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));
  for(i=0;i<n;i++){
    sollya_mpfi_init2(t->poly_array[i], prec);
  }
  t->cheb_matrix= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));

  t->cheb_array= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));
  *(t->cheb_array)= (sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));
  for(i=0;i<n;i++){
    sollya_mpfi_init2((*(t->cheb_array))[i], prec);
  }
  if (flag_points!=0) getChebyshevPoints(*(t->cheb_array),n,x);

  if (flag_matrix!=0) getChebMatrix(t->cheb_matrix,n,prec);
  return t;
}

/*This function creates an empty chebyshev model
  and makes the link from chebpoints and chebMatrix into the new cmodel
  (this function assumes that we have already computed
  chebpoints and chebMatrix (if the respective pointers are not NULL)
*/
chebModel* createEmptycModelPrecomp(int n,sollya_mpfi_t x, sollya_mpfi_t **chebPoints, sollya_mpfi_t **chebM,  mp_prec_t p){
  chebModel* t;
  int i;
  mp_prec_t prec;
  prec=p;
  t= (chebModel *)safeMalloc(sizeof(chebModel));
  sollya_mpfi_init2(t->rem_bound, prec);
  sollya_mpfi_init2(t->poly_bound,prec);

  sollya_mpfi_init2(t->x,sollya_mpfi_get_prec(x));
  sollya_mpfi_set(t->x,x);

  t->n=n;
  t->poly_array= (sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));
  for(i=0;i<n;i++){
    sollya_mpfi_init2(t->poly_array[i], prec);
  }

  t->cheb_matrix= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));
  t->cheb_array= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));

  if (chebPoints!=NULL) if ((*chebPoints)!=NULL) *(t->cheb_array)=*chebPoints;
  if (chebM!=NULL) if ((*chebM)!=NULL) *(t->cheb_matrix)=*chebM;

  return t;
}

/*This function dealocates a cheb model, without touching the memory
  referenced by cheb_array and cheb_matrix parts
*/
void clearcModelLight(chebModel *t){
  int i;
  for(i=0;i<t->n;i++) sollya_mpfi_clear(t->poly_array[i]);
  safeFree(t->poly_array);

  sollya_mpfi_clear(t->rem_bound);
  sollya_mpfi_clear(t->poly_bound);

  sollya_mpfi_clear(t->x);
  safeFree(t->cheb_matrix);
  safeFree(t->cheb_array);
  safeFree(t);
}

/*This function dealocates a cheb model, distroying
  the cheb_array and cheb_matrix parts
*/
void clearcModelComplete(chebModel *t){
  int i;
  for(i=0;i<t->n;i++) sollya_mpfi_clear(t->poly_array[i]);
  safeFree(t->poly_array);

  sollya_mpfi_clear(t->rem_bound);
  sollya_mpfi_clear(t->poly_bound);

  sollya_mpfi_clear(t->x);
  for(i=0;i<t->n;i++) sollya_mpfi_clear((*(t->cheb_array))[i]);
  safeFree(*(t->cheb_array));
  safeFree(t->cheb_array);

  for(i=0;i<(t->n)* (t->n);i++) sollya_mpfi_clear((*(t->cheb_matrix))[i]);
  safeFree(*(t->cheb_matrix));
  safeFree(t->cheb_matrix);
  safeFree(t);
}


/***************************************************************/
/*******The convention for all the following functions is:******/
/***the cmodel given as parameter must be previously created ***/
/***************************************************************/
/***************************************************************/

/*This function sets the chebModel t with constant ct;
  It updates the bound.
*/

void constcModel(chebModel*t, sollya_mpfi_t ct){
  int i,n;
  n=t->n;

  for(i=1;i<n;i++){
    sollya_mpfi_set_ui(t->poly_array[i],0);
  }

  sollya_mpfi_set(t->poly_array[0],ct);
  sollya_mpfi_set(t->poly_bound,ct);
  sollya_mpfi_set_ui(t->rem_bound,0);
}


/* Check that models are compatible one with another:
   i.e. they can be added, mulitplied, copied, etc. */
int cModelsAreCompatible(chebModel *t1, chebModel *t2) {
  return ((t1 != NULL) && (t2 != NULL) &&
          (sollya_mpfi_equal_p(t1->x, t2->x) || (sollya_mpfi_nan_p(t1->x) && sollya_mpfi_nan_p(t2->x))) &&
          (t1->n == t2->n));
}

/*This function sets a cm t with the values given by anoter cm tt
  they should have the same basis and interval,
  if an incompatibility is detected, no modification is made.
*/
void copycModel(chebModel *t, chebModel *tt){
  int i;

  if (!cModelsAreCompatible(t, tt)) {
    printMessage(0, SOLLYA_MSG_ERROR_IN_CHEBYSHEVFORM_COPYING_INCOMPAT_MODELS, "Error in chebyshevform: trying to copy incompatible models.\n");
    printMessage(0, SOLLYA_MSG_CONTINUATION, "No modification is made.\n");
    return;
  }

  for(i=0;i<tt->n;i++) {
    sollya_mpfi_set(t->poly_array[i],tt->poly_array[i]);
  }

  sollya_mpfi_set(t->rem_bound,tt->rem_bound);
  sollya_mpfi_set(t->poly_bound,tt->poly_bound);

  if (tt->cheb_matrix!=NULL) if ((*tt->cheb_matrix)!=NULL) *(t->cheb_matrix)=*tt->cheb_matrix;
  if (tt->cheb_array!=NULL) if ((*tt->cheb_array)!=NULL) *(t->cheb_array)=*tt->cheb_array;
}

/***************************************************************/
/*********************Operations on ChebModels******************/
/***************************************************************/

/*Compute the cm for addition of two given cms.
  Updates the resulting polynomial bound.
*/
void addition_CM(chebModel *t,chebModel *child1_tm, chebModel *child2_tm, mp_prec_t prec){
  int i;
  int n;
  chebModel *tt;
  if ( (!cModelsAreCompatible(child1_tm, child2_tm)) || (!cModelsAreCompatible(t, child1_tm)) ) {
    printMessage(0, SOLLYA_MSG_ERROR_IN_CHEBYSHEVFORM_COPYING_INCOMPAT_MODELS, "Error in chebyshevform: trying to copy incompatible models.\n");
    printMessage(0, SOLLYA_MSG_CONTINUATION, "No modification is made.\n");
    return;
  }
  n=t->n;
  tt=createEmptycModelPrecomp(n,t->x, child1_tm->cheb_array,child1_tm->cheb_matrix, prec);
  for(i=0;i<n;i++)
    sollya_mpfi_add(tt->poly_array[i], child1_tm->poly_array[i],child2_tm->poly_array[i]);


  sollya_mpfi_add(tt->rem_bound, child1_tm->rem_bound, child2_tm->rem_bound);
  copycModel(t,tt);
  clearcModelLight(tt);
}

/* Compute the multiplication of a cm by a constant */
void ctMultiplication_CM(chebModel*d, chebModel*s, sollya_mpfi_t c, mp_prec_t prec){
  int i;
  int n;
  chebModel *tt;

  n=s->n;
  tt=createEmptycModelPrecomp(n,s->x, s->cheb_array,s->cheb_matrix, prec);

  for(i=0; i<n; i++)  sollya_mpfi_mul(tt->poly_array[i], s->poly_array[i], c);
  sollya_mpfi_mul(tt->rem_bound, s->rem_bound, c);
  sollya_mpfi_mul(tt->poly_bound, s->poly_bound, c);

  copycModel(d,tt);
  clearcModelLight(tt);
}

/*This function multiplies two given cms;
  -- parameter *boundLevel* controls the algorithm used for bounding polynomials
  -- parameter *forComposition* specifies whether:
  forComposition=1 --> we are using the multiplication inside a composition,
  we suppose bounds for the polynomials are already updated inside models
  OTHERWISE --> we rebound them
*/


void  multiplication_CM(chebModel *t,chebModel *c1, chebModel *c2, int boundLevel, int forComposition, mp_prec_t prec){
  /*we will multiply two cm of order n; and obtain a new cm of order n;*/
  int n,i,j;
  chebModel *tt;
  sollya_mpfi_t temp1, temp2;
  sollya_mpfi_t *r;
  if ( (!cModelsAreCompatible(c2, c1)) || (!cModelsAreCompatible(t, c1)) ) {
    printMessage(0, SOLLYA_MSG_ERROR_IN_CHEBYSHEVFORM_COPYING_INCOMPAT_MODELS, "Error in chebyshevform: trying to copy incompatible models.\n");
    printMessage(0, SOLLYA_MSG_CONTINUATION, "No modification is made.\n");
    return;
  }
  n=t->n;

  /*aux cm for doing the multiplications*/
  tt=createEmptycModelPrecomp(n, t->x, t->cheb_array, t->cheb_matrix, prec);
  for(i=0;i<n;i++){
    sollya_mpfi_set_ui(tt->poly_array[i],0);
  }

  sollya_mpfi_init2(temp1, prec);
  sollya_mpfi_init2(temp2, prec);


  /*absolute error only*/
  /*We are multiplying chebmodels, considering the absolute error
    We are given:  (C1, r1)
    (C2, r2)*/

  /*compute in temp1 r1*r2*/
  sollya_mpfi_mul(temp1, c1->rem_bound, c2->rem_bound);

  if (forComposition==0){
    /*update the bounds for polynomials*/
    chebPolynomialBound(c1->poly_bound, n, c1->poly_array, boundLevel);
    chebPolynomialBound(c2->poly_bound, n, c2->poly_array, boundLevel);
  }
  /*if we use multiplication inside a composition,
    we suppose the the bounds are already computed*/

  /*compute in temp2 delta1*B(C2)*/

  sollya_mpfi_mul(temp2, c1->rem_bound, c2->poly_bound);
  sollya_mpfi_add(tt->rem_bound, temp2, temp1);

  /*compute in temp2 delta2*B(C1)*/
  sollya_mpfi_mul(temp2, c2->rem_bound, c1->poly_bound);
  sollya_mpfi_add(tt->rem_bound, tt->rem_bound,temp2);

  /*compute the product of the two polynomials*/
  /*the product has degree 2n-2=> we have to store 2n-1 coeffs*/
  /*in r we store only the upper part of the polynomial*/
  /*r = [0, 0 ...., 0, r0, ..., r(n-2)]                          */
  /* it represents the polynomial T1*T2|[n....2n-2]*/
  r = (sollya_mpfi_t *)safeMalloc((2*n-1)*sizeof(sollya_mpfi_t));

  for(i=0; i < 2*n-1; i++){
    sollya_mpfi_init2(r[i], prec);
    sollya_mpfi_set_ui(r[i],0);
  }

  for(i=0; i<n; i++) {
    for (j=0; j<n; j++){
      sollya_mpfi_mul(temp1, c1->poly_array[i], c2->poly_array[j]);
      if ( (i+j) < n )
        sollya_mpfi_add(tt->poly_array[i+j], tt->poly_array[i+j], temp1);
      else
        sollya_mpfi_add(r[i+j], r[i+j], temp1);

      if ( abs(i-j) < n )
        sollya_mpfi_add(tt->poly_array[abs(i-j)], tt->poly_array[abs(i-j)], temp1);
      else
        sollya_mpfi_add(r[abs(i-j)], r[abs(i-j)], temp1);
    }
  }

  for(i=0; i<n; i++) {
    sollya_mpfi_div_ui(tt->poly_array[i], tt->poly_array[i], 2);
  }
  for(i=n; i<2*n-1; i++) {
    sollya_mpfi_div_ui(r[i], r[i], 2);
  }

  /*bound the upper part*/
  chebPolynomialBound(temp1, 2*n-1, r, boundLevel);

  sollya_mpfi_add(tt->rem_bound, tt->rem_bound,temp1);

  for(i=0;i<2*n-1;i++) { sollya_mpfi_clear(r[i]);}
  safeFree(r);

  sollya_mpfi_clear(temp1);
  sollya_mpfi_clear(temp2);
  /*set the result*/
  copycModel(t,tt);
  /*clear the aux tm*/
  clearcModelLight(tt);
}


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
void composition_CM(chebModel *t,chebModel *g, chebModel *f, int boundLevel, mpfr_t targetRem, mp_prec_t prec){

  int i;
  int n,m;

  chebModel *tt,*tinterm,*tadd, *tcheb0,*tcheb1 ;
  sollya_mpfi_t z, zz, z1,doi,minusOne, one;
  mpfr_t a, b;

  UNUSED_PARAM(targetRem);

  n=g->n;
  m=f->n;

  /*create tinterm an intermediary cm for 2/(b-a) *f(x)-(b+a)/(b-a)
    that will be used just as a clone in multiplications:
    tinterm can be viewed as the variable in T_n(x).
  */
  tinterm=createEmptycModelPrecomp(m,f->x, f->cheb_array, f->cheb_matrix, prec);
  copycModel(tinterm,f);

  sollya_mpfi_init2(z,prec);
  sollya_mpfi_init2(zz,prec);
  sollya_mpfi_init2(z1,prec);
  sollya_mpfi_init2(doi,prec);
  sollya_mpfi_init2(minusOne,prec);
  sollya_mpfi_init2(one,prec);
  mpfr_init2(a,sollya_mpfi_get_prec(f->x));
  mpfr_init2(b,sollya_mpfi_get_prec(f->x));
  sollya_mpfi_set_ui(doi,2);
  sollya_mpfi_set_ui(one,1);
  sollya_mpfi_set_si(minusOne,-1);


  sollya_mpfi_get_right(b,g->x);
  sollya_mpfi_get_left(a,g->x);
  sollya_mpfi_set_fr(z1,b);
  sollya_mpfi_sub_fr(z1,z1,a);
  sollya_mpfi_inv(z1,z1);
  sollya_mpfi_mul_ui(z,z1,2);
  ctMultiplication_CM(tinterm, tinterm, z, prec);

  sollya_mpfi_set_fr(zz,b);
  sollya_mpfi_add_fr(zz,zz,a);
  /*mpfi_add_fr(zz,zz,a);*/
  sollya_mpfi_mul(zz,zz,z1);

  sollya_mpfi_sub(tinterm->poly_array[0],tinterm->poly_array[0],zz);
  sollya_mpfi_sub(tinterm->poly_bound,tinterm->poly_bound,zz);

  tt=createEmptycModelPrecomp(m,f->x,f->cheb_array, f->cheb_matrix, prec);
  constcModel(tt,g->poly_array[0]);

  if(n>0) {
    tadd=createEmptycModelPrecomp(m,f->x,f->cheb_array, f->cheb_matrix, prec);
    ctMultiplication_CM(tadd, tinterm, g->poly_array[1], prec);
    addition_CM(tt,tt,tadd, prec);

    /*T_0(x)=1*/
    tcheb0=createEmptycModelPrecomp(m,f->x,f->cheb_array,f->cheb_matrix, prec);
    constcModel( tcheb0, one);
    /*T_1(x)=x*/
    tcheb1=createEmptycModelPrecomp(m,f->x,f->cheb_array,f->cheb_matrix, prec);
    copycModel(tcheb1,tinterm);

    /*tinterm <-- 2*tinterm, to be used in recurrence: T_{i+1}(x)=2*x*T_i(x) - T_{i-1}(x)*/
    ctMultiplication_CM(tinterm, tinterm, doi, prec);
    /*tinterm is already bounded*/

    for (i=2;i<n;i++){
      /*Compute 2*x*T_i(x)*/
      chebPolynomialBound(tcheb1->poly_bound, m, tcheb1->poly_array, boundLevel);

      multiplication_CM(tadd,tinterm,tcheb1,boundLevel,1, prec);

      /*t_{i+1}=2x*t_i(x)-t_{i-1}(x)*/
      ctMultiplication_CM(tcheb0, tcheb0,minusOne, prec);
      addition_CM(tadd,tadd,tcheb0, prec);
      copycModel(tcheb0,tcheb1); /*t_{i-1}:=t_i*/
      copycModel(tcheb1,tadd); /*t_i:= t_{i+1}*/
      ctMultiplication_CM(tadd,tadd,g->poly_array[i], prec);
      addition_CM(tt,tt,tadd, prec);
    }
  }
  sollya_mpfi_add(tt->rem_bound,tt->rem_bound,g->rem_bound);
  /*the polybound is not updated in the end*/


  /*cleaning stuff*/
  copycModel(t,tt);
  clearcModelLight(tt);
  clearcModelLight(tinterm);
  if(n>0){
    clearcModelLight(tadd);
    clearcModelLight(tcheb0);
    clearcModelLight(tcheb1);
  }

  sollya_mpfi_clear(z);
  sollya_mpfi_clear(zz);
  sollya_mpfi_clear(z1);
  sollya_mpfi_clear(doi);
  sollya_mpfi_clear(minusOne);
  sollya_mpfi_clear(one);
  mpfr_clear(a);
  mpfr_clear(b);
}


/*******************************************************************************/
/*****************Chebyshev models for a basic functions************************/
/*******************************************************************************/

#define MONOTONE_REMAINDER_BASE_FUNCTION 0
#define MONOTONE_REMAINDER_LIBRARY_FUNCTION 1
#define MONOTONE_REMAINDER_INV 2
#define MONOTONE_REMAINDER_CONSTPOWERVAR 3
#define MONOTONE_REMAINDER_VARCONSTPOWER 4
#define MONOTONE_REMAINDER_PROCEDURE_FUNCTION 5

/* This function computes a cheb remainder for a function on an interval, assuming
   the n-th derivative is monotone.
   typeOfFunction is used to separate the cases:
   * MONOTONE_REMAINDER_BASE_FUNCTION --> we consider a base function, represented by its nodeType (p and f are useless)
   * MONOTONE_REMAINDER_LIBRARY_FUNCTION --> we consider a base function, represented by its nodeType (p and nodeType are useless)
   * MONOTONE_REMAINDER_PROCEDURE_FUNCTION --> we consider a base function, represented by its nodeType (p and nodeType are useless)
   * MONOTONE_REMAINDER_INV  --> we consider (x -> 1/x) (nodeType, f, and p are useless)
   * MONOTONE_REMAINDER_CONSTPOWERVAR --> we consider (x -> p^x) (nodeType and f are useless)
   * MONOTONE_REMAINDER_VARCONSTPOWER --> we consider (x -> x^p) (nodeType and f are useless)

   The coeffs of the interpolation polynomial
   are given as an array of mpfi's, developed over x.
   For more details, see the issac article.
*/


void computeMonotoneRemainderCheb(sollya_mpfi_t *bound, int typeOfFunction, int nodeType, node *f, mpfr_t p,
                                  int n, sollya_mpfi_t *poly_array, sollya_mpfi_t x){
  sollya_mpfi_t xinf, xsup;
  mpfr_t xinfFr, xsupFr;
  sollya_mpfi_t bound1, bound2, boundf1, boundf2;
  sollya_mpfi_t p_interv;
  mp_prec_t prec;
  int silent;
  silent=1;
  prec= sollya_mpfi_get_prec(poly_array[0]);
  sollya_mpfi_init2(xinf, prec);  sollya_mpfi_init2(xsup, prec);
  mpfr_init2(xinfFr, prec);   mpfr_init2(xsupFr,prec);
  sollya_mpfi_init2(bound1, prec);
  sollya_mpfi_init2(bound2, prec);

  sollya_mpfi_init2(boundf1, prec);
  sollya_mpfi_init2(boundf2, prec);

  sollya_mpfi_init2(p_interv, prec);

  sollya_mpfi_get_left(xinfFr,x);  sollya_mpfi_get_right(xsupFr,x);
  sollya_mpfi_set_fr(xinf, xinfFr);  sollya_mpfi_set_fr(xsup, xsupFr);

  evaluateChebPolynomialClenshaw(bound1, n, poly_array, x,xinf); /* enclosure of p(xinf) */

  evaluateChebPolynomialClenshaw(bound2, n, poly_array, x,xsup); /* enclosure of p(xsup) */

  /* enclosure of f(xinf) and f(xsup) */
  switch(typeOfFunction) {
  case MONOTONE_REMAINDER_BASE_FUNCTION:
    baseFunction_diff(&boundf1,nodeType,xinf,0, &silent);
    baseFunction_diff(&boundf2,nodeType,xsup,0, &silent);
    break;
  case MONOTONE_REMAINDER_LIBRARY_FUNCTION:
    libraryFunction_diff(&boundf1, accessThruMemRef(f), xinf, 0, &silent);
    libraryFunction_diff(&boundf2, accessThruMemRef(f), xsup, 0, &silent);
    break;
  case MONOTONE_REMAINDER_PROCEDURE_FUNCTION:
    procedureFunction_diff(&boundf1, accessThruMemRef(f), xinf, 0, &silent);
    procedureFunction_diff(&boundf2, accessThruMemRef(f), xsup, 0, &silent);
    break;
  case MONOTONE_REMAINDER_INV:
    sollya_mpfi_inv(boundf1, xinf);
    sollya_mpfi_inv(boundf2, xsup);
    break;
  case MONOTONE_REMAINDER_CONSTPOWERVAR:
    sollya_mpfi_set_fr(p_interv, p);
    sollya_mpfi_pow(boundf1, xinf, p_interv);
    sollya_mpfi_pow(boundf2, xsup, p_interv);
    break;
  case MONOTONE_REMAINDER_VARCONSTPOWER:
    sollya_mpfi_set_fr(p_interv,p);
    sollya_mpfi_pow(boundf1, p_interv, xinf);
    sollya_mpfi_pow(boundf2, p_interv, xsup);
    break;
  default:
    printMessage(0, SOLLYA_MSG_ERROR_IN_CHEBYSHEVFORM_UNKNOWN_FUNC_FOR_ZUMKELLER, "Error in chebyshev: unkown type of function used with Zumkeller's technique\n");
    return;
  }


  sollya_mpfi_sub(bound1,boundf1,bound1); /* enclosure of f(xinf)-p(xinf-x0) */
  sollya_mpfi_sub(bound2,boundf2,bound2); /* enclosure of f(xsup)-p(xsup-x0) */

  sollya_mpfi_abs(bound1, bound1);
  sollya_mpfi_abs(bound2, bound2);

  sollya_mpfi_union(bound1, bound1, bound2);
  sollya_mpfi_neg(bound2, bound1);
  /* the remainder is bounded by the values it takes on the two extremas of the interval */
  sollya_mpfi_union(*bound, bound1, bound2);


  mpfr_clear(xinfFr); mpfr_clear(xsupFr);
  sollya_mpfi_clear(xinf); sollya_mpfi_clear(xsup);
  sollya_mpfi_clear(bound1); sollya_mpfi_clear(bound2);
  sollya_mpfi_clear(boundf1);  sollya_mpfi_clear(boundf2);
  sollya_mpfi_clear(p_interv);
  return;
}


/* This function computes a cheb model for a basic function, with the same convention
   as with computeMonotoneRemainderCheb */
void base_CMAux(chebModel *t, int typeOfFunction, int nodeType, node *f, mpfr_t p, int n, sollya_mpfi_t x,int verbosity, mp_prec_t prec){
  int i;
  chebModel *tt;
  sollya_mpfi_t *nDeriv;
  sollya_mpfi_t temp, pow;
  mpfr_t minusOne, a,b;
  sollya_mpfi_t *fValues;

  int silent;
  silent=1;

  UNUSED_PARAM(verbosity);

  tt=createEmptycModelPrecomp(n,x, t->cheb_array,t->cheb_matrix, prec);

  fValues= (sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));
  for(i=0;i<n;i++){
    sollya_mpfi_init2(fValues[i], prec);
  }
  /* We use AD for computing bound on the derivatives up to (n+1)th derivative */
  nDeriv= (sollya_mpfi_t *)safeCalloc((n+2),sizeof(sollya_mpfi_t));
  for(i=0;i<=n+1;i++) sollya_mpfi_init2(nDeriv[i], prec);

  switch(typeOfFunction) {
  case MONOTONE_REMAINDER_BASE_FUNCTION:
    baseFunction_diff(nDeriv, nodeType, x, n+1,&silent);
    for(i=0;i<n;i++){
      baseFunction_diff(&fValues[i],nodeType,(*tt->cheb_array)[i],0,&silent);
    }
    break;
  case MONOTONE_REMAINDER_LIBRARY_FUNCTION:
    libraryFunction_diff(nDeriv, accessThruMemRef(f), x, n+1,&silent);
    for(i=0;i<n;i++){
      libraryFunction_diff(&fValues[i],accessThruMemRef(f),(*tt->cheb_array)[i],0,&silent);
    }
    break;
  case MONOTONE_REMAINDER_PROCEDURE_FUNCTION:
    procedureFunction_diff(nDeriv, accessThruMemRef(f), x, n+1,&silent);
    for(i=0;i<n;i++){
      procedureFunction_diff(&fValues[i],accessThruMemRef(f),(*tt->cheb_array)[i],0,&silent);
    }
    break;
  case MONOTONE_REMAINDER_INV:
    mpfr_init2(minusOne, prec);
    mpfr_set_si(minusOne, -1, GMP_RNDN);
    constantPower_diff(nDeriv, x, minusOne, n+1,&silent);
    for(i=0;i<n;i++){
      constantPower_diff(&fValues[i],(*tt->cheb_array)[i],minusOne,0,&silent);
    }
    mpfr_clear(minusOne);
    break;
  case MONOTONE_REMAINDER_CONSTPOWERVAR:
    constantPower_diff(nDeriv, x, p, n+1,&silent);
    for(i=0;i<n;i++){
      constantPower_diff(&fValues[i],(*tt->cheb_array)[i],p,0,&silent);
    }
    break;
  case MONOTONE_REMAINDER_VARCONSTPOWER:
    powerFunction_diff(nDeriv, p, x, n+1,&silent);
    for(i=0;i<n;i++){
      powerFunction_diff(&fValues[i],p,(*tt->cheb_array)[i],0,&silent);
    }
    break;
  default:
    printMessage(0, SOLLYA_MSG_ERROR_IN_CHEBYSHEVFORM_UNKNOWN_FUNC_FOR_ZUMKELLER, "Error in chebyshev: unkown type of function used with Zumkeller's technique\n");
    return;
  }
  /*compute the values of the coefficients*/
  getChebCoeffs(tt->poly_array, *(tt->cheb_matrix), fValues,n);

  /* Use Zumkeller technique to improve the bound in the absolute case,
     when the (n+1)th derivative has constant sign */
  if((sollya_mpfi_is_nonpos(nDeriv[n+1]) > 0)||(sollya_mpfi_is_nonneg(nDeriv[n+1]) > 0)){
    computeMonotoneRemainderCheb(&tt->rem_bound, typeOfFunction, nodeType, accessThruMemRef(f), p, n, tt->poly_array, x);
  }
  else{
    /* just keep the bound obtained using AD, nDeriv[n] */
    /* diffValue:=(2*nDeriv[n]*((op(2,X)-op(1,X))^(n)))/(4^n );*/

    sollya_mpfi_set(tt->rem_bound, nDeriv[n]);
    mpfr_init2(a, sollya_mpfi_get_prec(x));
    mpfr_init2(b, sollya_mpfi_get_prec(x));
    sollya_mpfi_get_left(a,x);
    sollya_mpfi_get_right(b,x);
    sollya_mpfi_init2(temp, prec);
    sollya_mpfi_set_fr(temp, b);
    sollya_mpfi_sub_fr(temp, temp,a);
    sollya_mpfi_init2(pow, prec);
    sollya_mpfi_set_ui(pow, n);
    sollya_mpfi_pow(temp, temp, pow);
    sollya_mpfi_mul(tt->rem_bound,tt->rem_bound,temp);
    sollya_mpfi_mul_ui(tt->rem_bound,tt->rem_bound,2);
    sollya_mpfi_set_ui(temp, 4);
    sollya_mpfi_pow(temp, temp, pow);

    sollya_mpfi_div(tt->rem_bound,tt->rem_bound,temp);
    sollya_mpfi_neg(temp,tt->rem_bound);
    sollya_mpfi_union(tt->rem_bound,tt->rem_bound,temp);
    sollya_mpfi_clear(temp);
    sollya_mpfi_clear(pow);
    mpfr_clear(a);
    mpfr_clear(b);

  }

  /* We do not bound the polynomial obtained here*/

  copycModel(t,tt);
  clearcModelLight(tt);

  for(i=0;i<=n+1;i++)  sollya_mpfi_clear(nDeriv[i]);
  safeFree(nDeriv);

  for(i=0;i<n;i++){
    sollya_mpfi_clear(fValues[i]);
  }
  safeFree(fValues);
}

/*This function computes a chebyshevform of order n, over x, for a function f;
  It uses precision prec for computations, it displays aux informations based on
  verbosity level and bounds the polynomials appearing based on boundLevel
*/
void cheb_model(chebModel *t, node *f, int n, sollya_mpfi_t x, int boundLevel, int verbosity, mp_prec_t prec) {
  int i;

  node *simplifiedChild1, *simplifiedChild2;
  sollya_mpfi_t temp1,temp2;


  chebModel *tt, *child1_tm, *child2_tm, *ctPowVar_tm, *logx_tm, *expx_tm, *logf_tm;

  /*used by division*/
  sollya_mpfi_t rangeg;
  chebModel *ttt, *inv_tm;



  sollya_mpfi_t minusOne;
  /*used by basic functions*/
  sollya_mpfi_t rangef;

  if (isPolynomial(f) ){

    /*Do the basis conversion*/
    tt=createEmptycModelPrecomp(n,t->x, t->cheb_array, t->cheb_matrix, prec);
    getNChebCoeffsFromPolynomial(tt->poly_array, tt->rem_bound, f, x,n,boundLevel);
    copycModel(t,tt);
    /*clear old cheby models*/
    clearcModelLight(tt);
  }
  else {
    switch (accessThruMemRef(f)->nodeType) {

    case NEG:
      /*create a new empty cheb model the child*/
      child1_tm=createEmptycModelPrecomp(n,t->x, t->cheb_array,t->cheb_matrix,prec);
      /*call cheby_model on the child*/
      cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x, boundLevel, verbosity, prec);
      tt=createEmptycModelPrecomp(n,t->x, t->cheb_array,t->cheb_matrix, prec);
      /*do the necessary chages from child to parent*/
      for(i=0;i<n;i++)
        sollya_mpfi_neg(tt->poly_array[i], child1_tm->poly_array[i]);
      sollya_mpfi_neg(tt->rem_bound,child1_tm->rem_bound);

      copycModel(t,tt);
      /*clear old cheby models*/
      clearcModelLight(child1_tm);
      clearcModelLight(tt);
      break;


    case ADD:

      /*create a new empty chebmodel the children*/

      child1_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array,t->cheb_matrix, prec);
      child2_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array,t->cheb_matrix, prec);
      /*call cheby_model on the children*/
      cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x,boundLevel, verbosity, prec);
      cheb_model(child2_tm, accessThruMemRef(f)->child2,n,x,boundLevel, verbosity, prec);
      tt=createEmptycModelPrecomp(n,child1_tm->x, child1_tm->cheb_array,child1_tm->cheb_matrix, prec);
      addition_CM(tt,child1_tm, child2_tm, prec);
      copycModel(t,tt);
      /*clear old cheby model*/
      clearcModelLight(child1_tm);
      clearcModelLight(child2_tm);
      clearcModelLight(tt);
      break;

    case SUB:

      /*create a new empty cheby model the children*/
      child1_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array,t->cheb_matrix, prec);
      child2_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array,t->cheb_matrix, prec);
      /*call cheby_model on the children*/
      cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x,boundLevel, verbosity, prec);
      cheb_model(child2_tm, accessThruMemRef(f)->child2,n,x,boundLevel, verbosity, prec);

      /*do the necessary chages from children to parent*/
      sollya_mpfi_init2(minusOne,prec);
      sollya_mpfi_set_si(minusOne,-1);
      ctMultiplication_CM(child2_tm,child2_tm, minusOne, prec);
      tt=createEmptycModelPrecomp(n,child1_tm->x, child1_tm->cheb_array, child1_tm->cheb_matrix, prec);
      addition_CM(tt,child1_tm, child2_tm, prec);

      copycModel(t,tt);

      /*clear old cheby model*/
      clearcModelLight(child1_tm);
      clearcModelLight(child2_tm);
      clearcModelLight(tt);
      sollya_mpfi_clear(minusOne);
      break;

    case MUL:
      /*create a new empty taylor model the children*/
      child1_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
      child2_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
      /*call cheby_model on the children*/
      cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x,boundLevel, verbosity, prec);
      cheb_model(child2_tm, accessThruMemRef(f)->child2,n,x,boundLevel, verbosity, prec);

      /*do the necessary chages from children to parent*/
      tt=createEmptycModelPrecomp(n,child1_tm->x, child1_tm->cheb_array,  child1_tm->cheb_matrix, prec);

      multiplication_CM(tt,child1_tm, child2_tm,boundLevel,0,prec);

      copycModel(t,tt);

      /*clear old cheby model*/
      clearcModelLight(child1_tm);
      clearcModelLight(child2_tm);
      clearcModelLight(tt);
      break;

    case DIV:


      /*create a new empty cheby model the child*/
      child1_tm=createEmptycModelPrecomp(n,t->x, t->cheb_array, t->cheb_matrix, prec);
      /*call cheb_model on the child*/
      cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x,boundLevel, verbosity, prec);
      /*create a new empty cheby model the child*/
      child2_tm=createEmptycModelPrecomp(n,t->x, t->cheb_array,t->cheb_matrix, prec);
      /*call cheb_model on the child*/
      cheb_model(child2_tm, accessThruMemRef(f)->child2,n,x,boundLevel, verbosity, prec);
      /*compute cm for the basic case*/
      sollya_mpfi_init2(rangeg, prec);
      chebPolynomialBound(child2_tm->poly_bound, n, child2_tm->poly_array, boundLevel);
      sollya_mpfi_add(rangeg,child2_tm->rem_bound, child2_tm->poly_bound);

      inv_tm=createEmptycModelCompute(n,rangeg,1,1,prec);
      base_CMAux(inv_tm, MONOTONE_REMAINDER_INV, 0, NULL, NULL, n, rangeg,verbosity,prec);

      /*Composition of models*/
      ttt=createEmptycModelPrecomp(n,child2_tm->x, child2_tm->cheb_array,child2_tm->cheb_matrix, prec);
      composition_CM(ttt,inv_tm, child2_tm, boundLevel, NULL,prec);

      /*child1 * inverse(child2)*/
      tt=createEmptycModelPrecomp(n,child1_tm->x, child1_tm->cheb_array,  child1_tm->cheb_matrix, prec);
      multiplication_CM(tt, ttt, child1_tm, boundLevel,0,prec);

      /*clear old children*/
      clearcModelLight(child1_tm);
      clearcModelLight(child2_tm);
      clearcModelComplete(inv_tm);
      clearcModelLight(ttt);
      copycModel(t,tt);


      clearcModelLight(tt);
      sollya_mpfi_clear(rangeg);
      break;
    case SQRT:
    case EXP:
    case LOG:
    case LOG_2:
    case LOG_10:
    case SIN:
    case COS:
    case TAN:
    case ASIN:
    case ACOS:
    case ATAN:
    case SINH:
    case COSH:
    case TANH:
    case ASINH:
    case ACOSH:
    case ATANH:
    case ABS:
    case SINGLE:
    case DOUBLE:
    case DOUBLEDOUBLE:
    case TRIPLEDOUBLE:
    case ERF:
    case ERFC:
    case LOG_1P:
    case EXP_M1:
    case DOUBLEEXTENDED:
    case CEIL:
    case FLOOR:
    case NEARESTINT:
    case LIBRARYFUNCTION:
    case PROCEDUREFUNCTION:

      if ((accessThruMemRef((accessThruMemRef(f)->child1))->nodeType)==VARIABLE) {
        child1_tm=createEmptycModelPrecomp(n,t->x, t->cheb_array,t->cheb_matrix, prec);
        /* CM for elementary function */
        if (accessThruMemRef(f)->nodeType == LIBRARYFUNCTION)
          base_CMAux(child1_tm, MONOTONE_REMAINDER_LIBRARY_FUNCTION, 0, accessThruMemRef(f), NULL, n, x, verbosity,prec);
        else if (accessThruMemRef(f)->nodeType == PROCEDUREFUNCTION)
          base_CMAux(child1_tm, MONOTONE_REMAINDER_PROCEDURE_FUNCTION, 0, accessThruMemRef(f), NULL, n, x, verbosity,prec);
        else
          base_CMAux(child1_tm, MONOTONE_REMAINDER_BASE_FUNCTION, accessThruMemRef(f)->nodeType, NULL, NULL, n,x, verbosity,prec);

        copycModel(t,child1_tm);
        clearcModelLight(child1_tm);
      }
      else{

        /*create a new empty CM for the child*/
        child1_tm=createEmptycModelPrecomp(n,t->x, t->cheb_array,t->cheb_matrix, prec);

        /*call cheb_model on the child*/
        cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x,boundLevel, verbosity, prec);

        sollya_mpfi_init2(rangeg, prec);

        chebPolynomialBound(child1_tm->poly_bound, n, child1_tm->poly_array, boundLevel);
        sollya_mpfi_add(rangeg,child1_tm->rem_bound, child1_tm->poly_bound);

        child2_tm=createEmptycModelCompute(n,rangeg,1,1, prec);

        /*CM for elementary functions*/
        if (accessThruMemRef(f)->nodeType == LIBRARYFUNCTION)
          base_CMAux(child2_tm, MONOTONE_REMAINDER_LIBRARY_FUNCTION, 0, accessThruMemRef(f), NULL, n, rangeg, verbosity,prec);
        else if (accessThruMemRef(f)->nodeType == PROCEDUREFUNCTION)
          base_CMAux(child2_tm, MONOTONE_REMAINDER_PROCEDURE_FUNCTION, 0, accessThruMemRef(f), NULL, n, rangeg, verbosity,prec);
        else
          base_CMAux(child2_tm, MONOTONE_REMAINDER_BASE_FUNCTION, accessThruMemRef(f)->nodeType, NULL, NULL, n,rangeg, verbosity,prec);



        tt=createEmptycModelPrecomp(n,child1_tm->x, child1_tm->cheb_array, child1_tm->cheb_matrix, prec);
        composition_CM(tt,child2_tm, child1_tm, boundLevel,NULL, prec);

        /*clear old child*/
        clearcModelLight(child1_tm);
        /*we do not need values of chebpoints and chebMatrix in interval rangeg*/
        clearcModelComplete(child2_tm);
        copycModel(t,tt);
        clearcModelLight(tt);
        sollya_mpfi_clear(rangeg);
      }
      break;

    case POW:
      simplifiedChild2=simplifyTreeErrorfree(accessThruMemRef(f)->child2);
      simplifiedChild1=simplifyTreeErrorfree(accessThruMemRef(f)->child1);

      if ((accessThruMemRef(simplifiedChild2)->nodeType==CONSTANT) &&(accessThruMemRef(simplifiedChild1)->nodeType==CONSTANT)) {
        /*We are in the  ct1^ct2 case*/
        sollya_mpfi_init2(temp1, prec);
        sollya_mpfi_set_fr(temp1, *(accessThruMemRef(simplifiedChild1)->value));
        sollya_mpfi_init2(temp2, prec);
        sollya_mpfi_set_fr(temp2, *(accessThruMemRef(simplifiedChild2)->value));
        sollya_mpfi_pow(temp1,temp1,temp2);
        tt=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        constcModel(tt,temp1);
        copycModel(t,tt);
        clearcModelLight(tt);
        sollya_mpfi_clear(temp1);
        sollya_mpfi_clear(temp2);
      }
      else if (accessThruMemRef(simplifiedChild2)->nodeType==CONSTANT) {
        /*We are in the  f^p case*/
        child1_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        /*call cheb_model for the child*/
        cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x, boundLevel, verbosity, prec);

        /*bound the child*/
        sollya_mpfi_init2(rangeg, prec);
        chebPolynomialBound(child1_tm->poly_bound, n, child1_tm->poly_array, boundLevel);
        sollya_mpfi_add(rangeg,child1_tm->rem_bound, child1_tm->poly_bound);

        /*create cm for x^p over rangeg*/
        ctPowVar_tm=createEmptycModelCompute(n,rangeg,1,1, prec);
        base_CMAux(ctPowVar_tm, MONOTONE_REMAINDER_CONSTPOWERVAR, 0, NULL, *(accessThruMemRef(simplifiedChild2)->value), n,rangeg, verbosity,prec);

        /*compose*/
        tt=createEmptycModelPrecomp(n,child1_tm->x, child1_tm->cheb_array, child1_tm->cheb_matrix, prec);
        composition_CM(tt,ctPowVar_tm,child1_tm, boundLevel, NULL, prec);

        /*clear old child*/
        clearcModelLight(child1_tm);
        /*we do not need values of chebpoints and chebMatrix in interval rangeg*/
        clearcModelComplete(ctPowVar_tm);
        copycModel(t,tt);
        clearcModelLight(tt);
        sollya_mpfi_clear(rangeg);

      }
      else if (accessThruMemRef(simplifiedChild1)->nodeType==CONSTANT) {
        /*we have the p^f case*/
        /*create a new empty cheby model for the child*/
        child2_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        /*call cheb_model for the child*/
        cheb_model(child2_tm, accessThruMemRef(f)->child2,n,x, boundLevel, verbosity, prec);

        /*bound the child*/
        sollya_mpfi_init2(rangeg, prec);
        chebPolynomialBound(child2_tm->poly_bound, n, child2_tm->poly_array, boundLevel);
        sollya_mpfi_add(rangeg,child2_tm->rem_bound, child2_tm->poly_bound);
        /*create cm for p^x over rangeg*/
        ctPowVar_tm=createEmptycModelCompute(n,rangeg,1,1, prec);
        base_CMAux(ctPowVar_tm, MONOTONE_REMAINDER_VARCONSTPOWER, 0, NULL, *(accessThruMemRef(simplifiedChild1)->value), n,rangeg, verbosity,prec);
        /*compose*/
        tt=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        composition_CM(tt,ctPowVar_tm,child2_tm, boundLevel, NULL,prec);

        /*clear old child*/
        clearcModelLight(child2_tm);
        /*we do not need values of chebpoints and chebMatrix in interval rangeg*/
        clearcModelComplete(ctPowVar_tm);
        copycModel(t,tt);
        clearcModelLight(tt);
        sollya_mpfi_clear(rangeg);
      }
      else {
        /*We are in the  f^g case*/
        /*We use the formula exp(g log(f))*/

        /*create a new empty cheb model the children*/
        /*g*/
        child2_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        cheb_model(child2_tm, accessThruMemRef(f)->child2,n,x, boundLevel, verbosity, prec);
        /*f*/
        child1_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        cheb_model(child1_tm, accessThruMemRef(f)->child1,n,x, boundLevel, verbosity, prec);

        /*create  cheb_model for log (child 1) = log(f)*/

        /*log f*/
        sollya_mpfi_init2(rangef, prec);
        chebPolynomialBound(child1_tm->poly_bound, n, child1_tm->poly_array, boundLevel);
        sollya_mpfi_add(rangef,child1_tm->rem_bound, child1_tm->poly_bound);
        logx_tm=createEmptycModelCompute(n,rangef,1,1, prec);
        base_CMAux(logx_tm, MONOTONE_REMAINDER_BASE_FUNCTION, LOG, NULL, NULL, n, rangef, verbosity,prec);
        logf_tm=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        composition_CM(logf_tm, logx_tm,child1_tm, boundLevel, NULL,prec);

        /*glog f*/
        ttt=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        multiplication_CM(ttt,logf_tm,child2_tm, boundLevel,0,prec);


        /*exp(g log f)*/
        chebPolynomialBound(ttt->poly_bound, n,ttt->poly_array,boundLevel);
        sollya_mpfi_add(rangef,ttt->rem_bound, ttt->poly_bound);
        expx_tm=createEmptycModelCompute(n,rangef,1,1, prec);
        base_CMAux(expx_tm, MONOTONE_REMAINDER_BASE_FUNCTION, EXP, NULL, NULL, n,rangef, verbosity,prec);

        tt=createEmptycModelPrecomp(n,t->x,t->cheb_array, t->cheb_matrix, prec);
        composition_CM(tt,expx_tm,ttt, boundLevel, NULL,prec);

        /*cleaning*/
        clearcModelLight(child2_tm);
        clearcModelLight(child1_tm);
        clearcModelLight(ttt);
        clearcModelLight(logf_tm);
        /*we do not need values of chebpoints and chebMatrix in interval rangef*/
        clearcModelComplete(expx_tm);
        clearcModelComplete(logx_tm);


        copycModel(t,tt);
        clearcModelLight(tt);
        sollya_mpfi_clear(rangef);
      }
      free_memory(simplifiedChild2);
      free_memory(simplifiedChild1);
      break;

    default:
      sollyaFprintf(stderr,"Error: CM: unknown identifier (%d) in the tree\n",accessThruMemRef(f)->nodeType);
      exit(1);
    }
  }
  return;
}


/* Compute a Chebyshev form of order n for f over dom

   Make a base change such that Ch + sum errors_i * x^i + delta is an
   absolute-error Taylor form for f over dom, developed at a point in
   the middle of dom.

   Return the original Chebyshev coefficients (in the Chebyshev basis)
   as chebyshevCoefficients.

   Upon entry, delta has already been initialized with sollya_mpfi_init2.
   The (sollya_mpfi_t *) intervals in errors and chebyshevCoefficients
   must be allocated (safeMalloc'ed) and initialized with sollya_mpfi_init2.

   The entries in errors and chebyshevCoefficients are in natural order,
   i.e. errors->value points to the 0-th (constant) radius interval
   around the 0-th (constant) coefficient in Ch.

   An error during computation can be signaled by setting Ch to NULL.
   In this case, no memory must be left allocated by the function
   upon return.

   All computations should be performed using prec as working precision
   (try to refrain from using getToolsPrecision()).

*/
void chebyshevform(node **Ch, chain **errors, sollya_mpfi_t delta,
		   chain **chebyshevCoefficients,
		   node *f, int n, sollya_mpfi_t dom, mp_prec_t prec) {

  chebModel *t;
  mpfr_t *coeffsMpfr, domL, domR;
  sollya_mpfi_t *coeffsErrors, **monomialCoeffs, *chebCoeffs;
  int i;
  chain *err;
  sollya_mpfi_t *rest, zero;

  /* Adjust n to the notion of degree in the chebyshev command */
  n++;

  /* Check if degree is at least 1, once it has been adjusted */
  if (n < 1) {
    printMessage(1,SOLLYA_MSG_CHEBYSHEVFORM_DEGREE_MUST_NOT_BE_NEGATIVE,"Warning: the degree of a Chebyshev must not be negative.\n");
    *Ch = NULL;
    return;
  }

  /*  Check that the interval dom is not a point interval*/
  mpfr_init2(domR, sollya_mpfi_get_prec(dom));
  sollya_mpfi_get_right(domR, dom);

  mpfr_init2(domL, sollya_mpfi_get_prec(dom));
  sollya_mpfi_get_left(domL, dom);


  if (mpfr_cmp(domR,domL)==0) {
    printMessage(1,SOLLYA_MSG_CHEBYSHEVFORM_DOMAIN_MUST_NOT_BE_POINT_INTERVAL,"Warning: the domain of a Chebyshev Model can not be a point interval.\n");
    mpfr_clear(domL);
    mpfr_clear(domR);
    *Ch = NULL;
    return;
  }
  mpfr_clear(domL);
  mpfr_clear(domR);

  t=createEmptycModelCompute(n,dom,1,1, prec);


  cheb_model(t, accessThruMemRef(f), n, dom, 0, 0, prec);



  monomialCoeffs= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t *));

  /*get interval coefficients in monomial basis*/
  getCoeffsFromChebPolynomial(monomialCoeffs, t->poly_array, n, dom);

  /*Transform interval coeffs in monomial basis into (mpfr, error)*/
  coeffsMpfr= (mpfr_t *)safeCalloc((n),sizeof(mpfr_t));
  coeffsErrors = (sollya_mpfi_t *)safeCalloc((n),sizeof(sollya_mpfi_t));


  rest= (sollya_mpfi_t*)safeMalloc(sizeof(sollya_mpfi_t));
  sollya_mpfi_init2(*rest,prec);

  for(i=0;i<n;i++){
    sollya_mpfi_init2(coeffsErrors[i],prec);
    mpfr_init2(coeffsMpfr[i],prec);
  }
  sollya_mpfi_init2(zero, prec);
  sollya_mpfi_set_ui(zero,0);
  mpfr_get_poly(coeffsMpfr, coeffsErrors, *rest, t->n -1,*monomialCoeffs, zero, t->x);

  /*create Ch;*/
  *Ch=makePolynomial(coeffsMpfr, (t->n)-1);

  /*  create errors;*/
  err=constructChain(coeffsErrors,t->n-1);


  chebCoeffs = (sollya_mpfi_t *)safeCalloc((n),sizeof(sollya_mpfi_t));

  for (i=0; i<n;i++){
    sollya_mpfi_init2(chebCoeffs[i],prec);
    sollya_mpfi_set(chebCoeffs[i], t->poly_array[i]);
  }
  /*  create chebycoeffsList;*/
  *chebyshevCoefficients=constructChain(chebCoeffs,t->n-1);

  *errors = err;
  sollya_mpfi_set(delta,t->rem_bound);


  for(i=0;i<n;i++){
    mpfr_clear(coeffsMpfr[i]);
    sollya_mpfi_clear(coeffsErrors[i]);
    sollya_mpfi_clear(chebCoeffs[i]);
    sollya_mpfi_clear((*monomialCoeffs)[i]);
  }
  sollya_mpfi_clear(zero);
  safeFree(coeffsMpfr);
  safeFree(coeffsErrors);
  safeFree(chebCoeffs);
  safeFree(*monomialCoeffs);
  safeFree(monomialCoeffs);
  clearcModelComplete(t);
  sollya_mpfi_clear(*rest);
  safeFree(rest);
}
