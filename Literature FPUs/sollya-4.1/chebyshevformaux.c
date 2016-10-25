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

#include "chebyshevformaux.h"
#include "general.h"
#include "autodiff.h"
#include "infnorm.h"

/*This file contains auxiliary functions for constructing
  Chebyshev Models/forms
*/

/*This function sets an mpfi from evaluating a node* c:
  if c constant after simplification-> ok
  if not sets the value to 0
*/

/* Remark by Christoph: what about using evaluateConstantExpressionToInterval ? */
int mpfi_set_node( sollya_mpfi_t r, node * c,  mp_prec_t prec) {
  sollya_mpfi_t rr;
  sollya_mpfi_t *rrr;
  node *cc;
  sollya_mpfi_t dummy;

  /*  mp_prec_t prec;*/
  /*  prec = getToolPrecision();*/
  sollya_mpfi_init2(rr,prec);
  sollya_mpfi_init2(dummy,prec);
  rrr=safeMalloc(sizeof(sollya_mpfi_t));
  sollya_mpfi_init2(*rrr,prec);
  if (c!=NULL){
    cc=simplifyTreeErrorfree(c);
    switch (accessThruMemRef(cc)->nodeType){
    case PI_CONST: sollya_mpfi_const_pi(rr);
      break;
    case CONSTANT:sollya_mpfi_set_fr(rr,*(accessThruMemRef(cc)->value));
      break;
    default:  auto_diff(rrr,c,dummy,0); sollya_mpfi_set(rr, *rrr);
      break;
    }
    free_memory(cc);
  }
  else sollya_mpfi_set_ui(rr,0);
  sollya_mpfi_set(r,rr);
  sollya_mpfi_clear(rr);
  sollya_mpfi_clear(dummy);
  sollya_mpfi_clear(*rrr);
  safeFree(rrr);
  return 0;
}


/**************************************************************************************/
/**************************************************************************************/
/***************************Functions related to Chebyshev points**********************/
/**************************************************************************************/
/**************************************************************************************/


/*returns n chebyshev points of first kind in interval x*/

void getChebyshevPoints(sollya_mpfi_t *chebPoints, int n, sollya_mpfi_t x){
  int i;
  mpfr_t u, v;
  sollya_mpfi_t ui, vi, temp1, temp2, mpfiPi, mpfiPiArg;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(chebPoints[0]);

  sollya_mpfi_init2(ui,prec);
  sollya_mpfi_init2(vi, prec);
  sollya_mpfi_init2(temp1, prec);
  sollya_mpfi_init2(temp2, prec);
  sollya_mpfi_init2(mpfiPi, prec);
  sollya_mpfi_init2(mpfiPiArg, prec);

  mpfr_init2(u, prec);
  mpfr_init2(v, prec);

  sollya_mpfi_get_left(u,x);
  sollya_mpfi_get_right(v,x);

  sollya_mpfi_set_fr(ui,u);
  sollya_mpfi_set_fr(vi,v);

  sollya_mpfi_sub(temp1, ui, vi);
  sollya_mpfi_div_ui(temp1, temp1,2);



  sollya_mpfi_add(temp2, ui, vi);
  sollya_mpfi_div_ui(temp2, temp2,2);


  sollya_mpfi_const_pi(mpfiPi);
  sollya_mpfi_div_ui(mpfiPi,mpfiPi,2*n);

  for (i=1;i<=n;i++){

    sollya_mpfi_mul_ui(mpfiPiArg,mpfiPi,(2*i-1));
    sollya_mpfi_cos(chebPoints[i-1],mpfiPiArg);

    sollya_mpfi_mul( chebPoints[i-1], chebPoints[i-1], temp1);
    sollya_mpfi_add( chebPoints[i-1], chebPoints[i-1], temp2);

  }

  sollya_mpfi_clear(ui);
  sollya_mpfi_clear(vi);
  sollya_mpfi_clear(temp1);
  sollya_mpfi_clear(temp2);
  sollya_mpfi_clear(mpfiPi);
  sollya_mpfi_clear(mpfiPiArg);

  mpfr_clear(u);
  mpfr_clear(v);
}


/*returns n-1 chebyshev points of second kind in interval x (extremas of T_n((2x-b-a)/(b-a)))*/

void getChebyshevExtrema(sollya_mpfi_t *chebPoints, int n, sollya_mpfi_t x){
  int i;
  mpfr_t u, v;

  sollya_mpfi_t ui, vi, temp1, temp2, mpfiPi, mpfiPiArg;

  /*print("The chebyshev extremas are:");
    };
    for i from 1 to n-1 do{
    chebExtremas[i-1]=(cos((i)*Pi/(n)))*(u-v)/2 + (u+v)/2;
    };
  */
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(chebPoints[0]);
  sollya_mpfi_init2(ui,prec);
  sollya_mpfi_init2(vi, prec);
  sollya_mpfi_init2(temp1, prec);
  sollya_mpfi_init2(temp2, prec);
  sollya_mpfi_init2(mpfiPi, prec);
  sollya_mpfi_init2(mpfiPiArg, prec);

  mpfr_init2(u, prec);
  mpfr_init2(v, prec);

  sollya_mpfi_get_left(u,x);
  sollya_mpfi_get_right(v,x);

  sollya_mpfi_set_fr(ui,u);
  sollya_mpfi_set_fr(vi,v);

  sollya_mpfi_sub(temp1, ui, vi);
  sollya_mpfi_div_ui(temp1, temp1,2);



  sollya_mpfi_add(temp2, ui, vi);
  sollya_mpfi_div_ui(temp2, temp2,2);


  sollya_mpfi_const_pi(mpfiPi);
  sollya_mpfi_div_ui(mpfiPi,mpfiPi,n);


  for (i=1;i<=n-1;i++){
    sollya_mpfi_mul_ui(mpfiPiArg,mpfiPi,i);
    sollya_mpfi_cos(chebPoints[i-1],mpfiPiArg);

    sollya_mpfi_mul( chebPoints[i-1], chebPoints[i-1], temp1);
    sollya_mpfi_add( chebPoints[i-1], chebPoints[i-1], temp2);

  }

  sollya_mpfi_clear(ui);
  sollya_mpfi_clear(vi);
  sollya_mpfi_clear(temp1);
  sollya_mpfi_clear(temp2);
  sollya_mpfi_clear(mpfiPi);
  sollya_mpfi_clear(mpfiPiArg);

  mpfr_clear(u);
  mpfr_clear(v);
}


/* Returns a matrix chebMatrix of dimension nxn,
   s.t. chebMatrix[i,j]=T_i(x_j), for  i=0..n-1, j=0..n-1, and
   x_j \in [-1,1] the chebyshev points of first kind in [-1,1].
*/

void getChebMatrix(sollya_mpfi_t**chebMatrix, int n, mp_prec_t prec){
  int i,j;
  sollya_mpfi_t *chebPoints;
  sollya_mpfi_t intrval;

  sollya_mpfi_t temp;
  /*mp_prec_t prec;*/
  /*prec = getToolPrecision();*/

  sollya_mpfi_init2(temp, prec);

  chebPoints=safeMalloc((n)*sizeof(sollya_mpfi_t));
  for (i=0;i<n;i++){
    sollya_mpfi_init2(chebPoints[i],prec);
  }

  sollya_mpfi_init2(intrval,prec);
  sollya_mpfi_interv_si(intrval,-1,1);

  getChebyshevPoints(chebPoints, n, intrval);

  *chebMatrix= (sollya_mpfi_t *)safeMalloc((n*n)*sizeof(sollya_mpfi_t));

  for (i=0;i<n;i++){
    for (j=0;j<n;j++){
      sollya_mpfi_init2((*chebMatrix)[i*n+j],prec);
    }
  }

  for (i=0;i<n;i++){
    sollya_mpfi_set_ui((*chebMatrix)[i],1);
  }

  for (i=0;i<n;i++){
    sollya_mpfi_set((*chebMatrix)[i+n],chebPoints[i]);
  }

  for (i=2;i<n;i++){
    for (j=0;j<n;j++){

      sollya_mpfi_mul(temp,(*chebMatrix)[(i-1)*n+j], (*chebMatrix)[n+j]);
      sollya_mpfi_mul_ui(temp,temp,2);
      sollya_mpfi_sub((*chebMatrix)[i*n+j],temp,(*chebMatrix)[(i-2)*n+j]);
    }
  }


  sollya_mpfi_clear(intrval);
  sollya_mpfi_clear(temp);
  for (i=0;i<n;i++){
    sollya_mpfi_clear(chebPoints[i]);
  }
  safeFree(chebPoints);
}

/* Returns a matrix chebCoeffsMatrix of dimension nxn,
   s.t. chebCoeffsMatrix[i,j]=coeff(T_i(x), j), for  i=0..n-1, j=0..n-1
*/

void getChebPolyCoeffs(mpz_t* chebCoeffsMatrix, int n, mp_prec_t prec){
  int i,j;
  mpz_t temp;
  /*mp_prec_t prec;*/
  /*prec = getToolPrecision();*/
  mpz_init2(temp, prec);
  for (i=0;i<n;i++)
    for (j=0;j<n;j++)
      mpz_set_ui(chebCoeffsMatrix[i*n+j],0);

  if (n>0) mpz_set_ui(chebCoeffsMatrix[0],1);
  if (n>1) mpz_set_ui(chebCoeffsMatrix[n+1],1);

  for (i=2;i<n;i++){
    mpz_neg(chebCoeffsMatrix[i*n],chebCoeffsMatrix[(i-2)*n]); /*put constant coeff of T_{n-2}*/
    for (j=0;j<i;j++){
      mpz_mul_ui(temp,chebCoeffsMatrix[(i-1)*n+j],2);
      mpz_sub(chebCoeffsMatrix[i*n+j+1],temp,chebCoeffsMatrix[(i-2)*n+j+1]);
    }
  }
  mpz_clear(temp);
}

/*Returns in chebCoeffs the coeffs of the finite Chebyshev basis expansion
  of the polynomial p of degree n-1, over [-1,1];
  The coefficients in monomial basis of p are in *p

  This algorithm uses simply euclidean division.
*/
void getPolyCoeffsChebBasis(sollya_mpfi_t *chebCoeffs, sollya_mpfi_t *p, int n){
  sollya_mpfi_t *pAux, temp;
  mpz_t *chebMatrix;
  int i,j;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(chebCoeffs[0]);
  pAux=safeMalloc((n)*sizeof(sollya_mpfi_t));

  for (i=0;i<n;i++){

    sollya_mpfi_init2(pAux[i],prec);
    sollya_mpfi_set(pAux[i], p[i]);
  }

  chebMatrix=(mpz_t *)safeMalloc((n*n)*sizeof(mpz_t));

  for (i=0;i<n*n;i++){
    mpz_init2(chebMatrix[i],prec);
  }

  getChebPolyCoeffs(chebMatrix, n, prec);
  sollya_mpfi_init2(temp,prec);

  for(i=n-1; i>=0;i--){

    mpfi_div_z(chebCoeffs[i],pAux[i],chebMatrix[i*n+i]);
    for(j=i-1;j>=0;j--){
      mpfi_mul_z(temp,chebCoeffs[i],chebMatrix[i*n+j]);
      mpfi_sub(pAux[j],pAux[j],temp);
    }
  }
  for (i=0;i<n;i++){
    sollya_mpfi_clear(pAux[i]);
  }
  safeFree(pAux);

  for (i=0;i<n*n;i++){
    mpz_clear(chebMatrix[i]);
  }
  safeFree(chebMatrix);

  sollya_mpfi_clear(temp);
}

/*Returns in c the coeffs in the monomial basis for the polynomial p(a*x+b), where:
  -- a and b are mpfi_s
  -- polynomial p  of degree n-1 given by the monomial coefficients stored as mpfi_s in *p*/
void getTranslatedPolyCoeffs(sollya_mpfi_t *c, sollya_mpfi_t *p, int n, sollya_mpfi_t a, sollya_mpfi_t b){
  sollya_mpfi_t *pAux, temp, pow, alpha, evalP;
  int i;
  mp_prec_t prec;
  prec =sollya_mpfi_get_prec(c[0]);
  pAux=safeMalloc((n)*sizeof(sollya_mpfi_t));
  sollya_mpfi_init2(temp,prec);
  sollya_mpfi_init2(pow,prec);
  sollya_mpfi_init2(alpha,prec);
  sollya_mpfi_init2(evalP,prec);

  for (i=0;i<n;i++){
    sollya_mpfi_init2(pAux[i],prec);
    sollya_mpfi_set(pAux[i], p[i]);
  }

  /*do the transformation : P(a*x+b) = \sum p_i*a^i *(x+b/a)^i*/
  for (i=0;i<n;i++){
    sollya_mpfi_set_ui(pow,i);
    sollya_mpfi_pow(temp, a,pow);
    sollya_mpfi_mul(pAux[i], pAux[i],temp);
  }
  sollya_mpfi_div(alpha, b,a);
  /*do the translation from P(x+alpha) --> Q(x)*/
  /*P(x+alpha)= \sum P^{(i)}(alpha)/i! *x^i */
  /*we have to compute the first n-1 derivatives in alpha: P(alpha), P'(alpha), ..., P^(n-1)(alpha)*/
  /*evaluate P in alpha, P is of degree n-1*/
  symbolic_poly_evaluation_horner(evalP, pAux,alpha,n-1);
  sollya_mpfi_set(c[0],evalP);
  mpfi_set_ui(temp, 1);
  for(i=1;i<n;i++){
    symbolic_poly_diff(pAux, pAux, n-i); /*differentiate in place pAux*/
    symbolic_poly_evaluation_horner(evalP, pAux,alpha,n-i-1);/*evaluate P^(i)(alpha)*/
    sollya_mpfi_mul_ui(temp,temp,i);
    sollya_mpfi_div(c[i],evalP, temp);
  }


  for (i=0;i<n;i++){
    sollya_mpfi_clear(pAux[i]);
  }
  safeFree(pAux);

  sollya_mpfi_clear(temp);
  sollya_mpfi_clear(pow);
  sollya_mpfi_clear(alpha);
  sollya_mpfi_clear(evalP);
}

/***************************************************************/
/***************************************************************/
/**********Functions related to Obtaining Chebyshev Coeffs******/
/***************************************************************/
/***************************************************************/


/*evaluate a function in n chebPoints*/
void getFunctionValues(sollya_mpfi_t* fValues, sollya_mpfi_t * chebPoints,node* f,int n){
  int i;
  for (i=0;i<n;i++){
    auto_diff(&fValues[i],f,chebPoints[i],0);
  }
}


/*Compute the cheb coeffs for the interpolation polynomial
  of degree n-1 at chebpoints of first kind, we are given:
  n chebpoints x_i and a n*n chebMatrix T_i(x_j))
  Formula is given in "Summary of Formulas" in MJ thesis
*/
void getChebCoeffs(sollya_mpfi_t* coeffs, sollya_mpfi_t *chebMatrix, sollya_mpfi_t *fValues,int n){

  int i,j;
  sollya_mpfi_t temp;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(coeffs[0]);
  sollya_mpfi_init2(temp, prec);

  for (i=0;i<n;i++)
    sollya_mpfi_set_ui(coeffs[i], 0);

  for (i=0;i<n;i++)
    sollya_mpfi_add(coeffs[0],coeffs[0],fValues[i]);
  sollya_mpfi_div_ui(coeffs[0],coeffs[0], n);


  for(i=1;i<n;i++){
    for(j=0;j<n;j++){
      sollya_mpfi_mul(temp, fValues[j], chebMatrix[i*n+j]);
      sollya_mpfi_add(coeffs[i],coeffs[i],temp);
    }
    sollya_mpfi_mul_ui(coeffs[i],coeffs[i], 2);
    sollya_mpfi_div_ui(coeffs[i],coeffs[i], n);
  }

  sollya_mpfi_clear(temp);
}

/*Wrapper that returns the coeffs
  of the interpolation polynomial of f at chebpoints
*/
void getChebCoeffsFromFunction(sollya_mpfi_t* coeffs, sollya_mpfi_t * chebPoints, sollya_mpfi_t * chebMatrix,node *f,int n){

  sollya_mpfi_t *fValues ;
  int i;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(coeffs[0]);

  fValues=safeMalloc((n+1)*sizeof(sollya_mpfi_t));
  for (i=0;i<=n;i++){
    sollya_mpfi_init2(fValues[i],prec);
  }
  getFunctionValues(fValues, chebPoints,f,n);
  getChebCoeffs(coeffs,chebMatrix,fValues,n);

  for (i=0;i<=n;i++){
    sollya_mpfi_clear(fValues[i]);
  }
  safeFree(fValues);

}

/*Wrapper to get directly the coeffs in the Chebyshev basis
  from a polynomial in the monomial basis given by a *node
  We return in n = deg(f)+1;
*/
void getChebCoeffsFromPolynomial(sollya_mpfi_t**coeffs, int *n, node *f, sollya_mpfi_t x, mp_prec_t prec){
  sollya_mpfi_t z1, z2, ui, vi;
  node **coefficients;
  int d,i;
  sollya_mpfi_t *p, *c;
  mpfr_t u,v;
  if (isPolynomial(f) ){
    getCoefficients(&d, &coefficients, f);

    *n=d+1;

    *coeffs= (sollya_mpfi_t *)safeMalloc((d+1)*sizeof(sollya_mpfi_t));

    p=safeMalloc((d+1)*sizeof(sollya_mpfi_t));
    c=safeMalloc((d+1)*sizeof(sollya_mpfi_t));
    for (i=0;i<d+1;i++){
      sollya_mpfi_init2((*coeffs)[i],prec);
      sollya_mpfi_init2(p[i],prec);
      sollya_mpfi_init2(c[i],prec);
      if (coefficients[i]!= NULL)  mpfi_set_node(p[i],coefficients[i], prec);
      else sollya_mpfi_set_ui(p[i],0);
    }

    for (i=0;i<d+1;i++) {
      if (coefficients[i] != NULL)
        free_memory(coefficients[i]);
    }
    safeFree(coefficients);

    /*Here we have the coeffs of the polynomial in p, over the interval x=[a,b]*/
    /*we need to compute the polynomial over [-1,1]*/
    /*we make the change of variable: x= y*(b-a)/2 + (b+a)/2, hence for y \in [-1,1] we have x\in [a,b]*/
    /* we compute P(x)=Q(y)*/
    sollya_mpfi_init2(ui, prec);
    sollya_mpfi_init2(vi, prec);


    mpfr_init2(u, prec);
    mpfr_init2(v, prec);

    sollya_mpfi_init2(z1, prec);
    sollya_mpfi_init2(z2, prec);

    sollya_mpfi_get_left(u,x);
    sollya_mpfi_get_right(v,x);

    sollya_mpfi_set_fr(ui,u);
    sollya_mpfi_set_fr(vi,v);

    sollya_mpfi_add(z2,ui,vi);
    sollya_mpfi_sub(z1,vi,ui);

    sollya_mpfi_div_ui(z1,z1,2);
    sollya_mpfi_div_ui(z2,z2,2);

    getTranslatedPolyCoeffs(c, p, d+1, z1,z2);

    getPolyCoeffsChebBasis(*coeffs, c, d+1);

    /*cleaning*/

    for (i=0;i<d+1;i++){
      sollya_mpfi_clear(p[i]);
      sollya_mpfi_clear(c[i]);
    }
    safeFree(p);
    safeFree(c);

    sollya_mpfi_clear(ui);
    sollya_mpfi_clear(vi);


    mpfr_clear(u);
    mpfr_clear(v);

    sollya_mpfi_clear(z1);
    sollya_mpfi_clear(z2);


  }
  else{
    printMessage(1,SOLLYA_MSG_ERROR_IN_CHEBYSHEVFORM_NOT_A_POLYNOMIAL,
		 "The given function is not a polynomial, no modification is made.\n");
  }
}


/*Wrapper to get directly the coeffs in the monomial basis
  from a polynomial in the Chebyshev basis, over a given interval x*/
void getCoeffsFromChebPolynomial(sollya_mpfi_t**coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x){
  sollya_mpfi_t z1, z2, ui, vi, temp;

  int j,i;
  sollya_mpfi_t *c;
  mpfr_t u,v;
  mpz_t *chebMatrix;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(chebCoeffs[0]);

  sollya_mpfi_init2(temp, prec);

  chebMatrix= (mpz_t *)safeMalloc((n*n)*sizeof(mpz_t));

  for (i=0;i<n*n;i++){
    mpz_init2(chebMatrix[i], prec);
  }
  getChebPolyCoeffs(chebMatrix, n,prec);

  *coeffs= (sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));
  c=(sollya_mpfi_t *)safeMalloc((n)*sizeof(sollya_mpfi_t));

  for (i=0;i<n;i++){
    sollya_mpfi_init2((*coeffs)[i],prec);
    sollya_mpfi_init2(c[i],prec);
    sollya_mpfi_set_ui(c[i],0);
  }

  for (j=0;j<n;j++){
    for (i=j;i<n;i++){
      mpfi_mul_z(temp, chebCoeffs[i], chebMatrix[i*n+j]);
      sollya_mpfi_add(c[j], c[j], temp);
    }
  }

  /*we have in c_i the values of the coefs of P(2/(b-a)x- (b+a)/(b-a)) = \sum c_i (2/(b-a)x- (b+a)/(b-a))^i*/
  /*we need to the translation*/

  /*we compute z1=2/(b-a); z2=-(b+a)/(b-a)*/

  sollya_mpfi_init2(ui, prec);
  sollya_mpfi_init2(vi, prec);

  mpfr_init2(u, prec);
  mpfr_init2(v, prec);

  sollya_mpfi_init2(z1, prec);
  sollya_mpfi_init2(z2, prec);

  sollya_mpfi_get_left(u,x);
  sollya_mpfi_get_right(v,x);

  sollya_mpfi_set_fr(ui,u);
  sollya_mpfi_set_fr(vi,v);

  sollya_mpfi_sub(z2,vi,ui);

  sollya_mpfi_ui_div(z1,2,z2);
  sollya_mpfi_add(temp, ui, vi);
  sollya_mpfi_div(z2, temp, z2);
  sollya_mpfi_neg(z2, z2);
  getTranslatedPolyCoeffs((*coeffs), c, n, z1,z2);

  /*cleaning*/
  sollya_mpfi_clear(z1);
  sollya_mpfi_clear(z2);
  sollya_mpfi_clear(ui);
  sollya_mpfi_clear(vi);
  sollya_mpfi_clear(temp);
  mpfr_clear(u);
  mpfr_clear(v);

  for (i=0;i<n*n;i++){
    mpz_clear(chebMatrix[i]);
  }
  safeFree(chebMatrix);

  for (i=0;i<n;i++){
    sollya_mpfi_clear(c[i]);
  }
  safeFree(c);

}




/*wrapper to get directly the coeffs in the chebyshev basis up to degree n-1 (first n coeffs)
  and a bound for the remaining polynomial,from a polynomial in the monomial basis(given by a pointer to node),
  over a given interval x*/
void getNChebCoeffsFromPolynomial(sollya_mpfi_t *coeffs, sollya_mpfi_t bound, node *f, sollya_mpfi_t x, int n, int boundLevel){

  sollya_mpfi_t **c, *r;
  int d,i;
  mp_prec_t prec;
  prec=sollya_mpfi_get_prec(coeffs[0]);
  c= (sollya_mpfi_t **)safeMalloc(sizeof(sollya_mpfi_t*));
  getChebCoeffsFromPolynomial(c, &d, f, x, prec);

  if (d<=n) {
    for(i=0;i<d;i++)
      sollya_mpfi_set(coeffs[i],(*c)[i]);
    for(i=d;i<n;i++)
      sollya_mpfi_set_ui(coeffs[i],0);

    sollya_mpfi_set_ui(bound,0);
  }
  else{
    /*in r we store only the upper part of the polynomial*/
    /*r = [0, 0 ...., 0, c_n, ..., c_{d-1}]              */
    r = (sollya_mpfi_t *)safeMalloc((d)*sizeof(sollya_mpfi_t));
    for(i=0; i < d; i++){
      sollya_mpfi_init2(r[i], prec);
      sollya_mpfi_set_ui(r[i],0);
    }
    for(i=0;i<n;i++)
      sollya_mpfi_set(coeffs[i],(*c)[i]);
    for(i=n;i<d;i++)
      sollya_mpfi_set(r[i],(*c)[i]);
    chebPolynomialBound(bound, d, r, boundLevel);
    /*cleaning r*/
    for(i=0; i < d; i++)
      sollya_mpfi_clear(r[i]);
    safeFree(r);
  }

  /*cleaning*/
  for (i=0;i<d;i++){
    sollya_mpfi_clear((*c)[i]);
  }
  safeFree(*c);
  safeFree(c);

}


/********************************Functions related to derivation and integration of polynomials in cheb basis*************************/
/*Get the derivative of a polynomial in Chebyshev basis, using classical formula*/
void getChebCoeffsDerivativePolynomial(sollya_mpfi_t*coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x){
  sollya_mpfi_t z1, z2, ui, vi;
  int i;
  sollya_mpfi_t *c;
  mpfr_t u,v;
  mp_prec_t prec;
  prec =sollya_mpfi_get_prec(coeffs[0]);


  c=(sollya_mpfi_t *)safeMalloc((n-1)*sizeof(sollya_mpfi_t));


  for (i=0;i<n-1;i++){
    sollya_mpfi_init2(c[i],prec);
    sollya_mpfi_set_ui(c[i],0);
  }

  if(n>1) {
    sollya_mpfi_mul_ui(c[n-2],chebCoeffs[n-1],2*(n-1));
  }
  if(n>2) {
    sollya_mpfi_mul_ui(c[n-3],chebCoeffs[n-2],2*(n-2));
  }
  for (i=n-3;i>0;i--){
    sollya_mpfi_mul_ui(c[i-1],chebCoeffs[i],2*i);
    sollya_mpfi_add(c[i-1],c[i-1],c[i+1]);
  }
  sollya_mpfi_div_ui(c[0],c[0],2);


  /*we have in c_i the values of the coefs of P'(y) = \sum c_i T_i(x)*/
  /*we have to multiply by y'(x), which is z1=2/(b-a) */

  /*we compute z1=2/(b-a)*/

  sollya_mpfi_init2(ui, prec);
  sollya_mpfi_init2(vi, prec);


  mpfr_init2(u, prec);
  mpfr_init2(v, prec);

  sollya_mpfi_init2(z1, prec);
  sollya_mpfi_init2(z2, prec);

  sollya_mpfi_get_left(u,x);
  sollya_mpfi_get_right(v,x);

  sollya_mpfi_set_fr(ui,u);
  sollya_mpfi_set_fr(vi,v);

  sollya_mpfi_sub(z2,vi,ui);

  sollya_mpfi_ui_div(z1,2,z2);

  for (i=0;i<n-1;i++){
    sollya_mpfi_mul(c[i], c[i],z1);
  }

  for (i=0;i<n-1;i++){
    sollya_mpfi_set(coeffs[i], c[i]);
  }
  for (i=0;i<n-1;i++){
    sollya_mpfi_clear(c[i]);
  }
  safeFree(c);
  sollya_mpfi_clear(z1);
  sollya_mpfi_clear(z2);
  sollya_mpfi_clear(ui);
  sollya_mpfi_clear(vi);
  mpfr_clear(u);
  mpfr_clear(v);
}

/*Computes the antiderivative of a polynomial in Chebyshev basis.
  NOTE: the constant coefficient is set to zero, but it should be viewed as a constant*/
void getChebCoeffsIntegrationPolynomial(sollya_mpfi_t*coeffs, sollya_mpfi_t *chebCoeffs, int n, sollya_mpfi_t x){
  sollya_mpfi_t z1, z2, ui, vi;

  int i;
  sollya_mpfi_t *c;
  mpfr_t u,v;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(coeffs[0]);

  c=(sollya_mpfi_t *)safeMalloc((n+1)*sizeof(sollya_mpfi_t));

  for (i=0;i<n+1;i++){
    sollya_mpfi_init2(c[i],prec);
    sollya_mpfi_set_ui(c[i],0);
  }

  if(n>0){
    sollya_mpfi_div_ui(c[1],chebCoeffs[2],2);
    sollya_mpfi_sub(c[1],chebCoeffs[0], c[1]);
  }


  for (i=2;i<n-1;i++){
    sollya_mpfi_sub(c[i],chebCoeffs[i-1],chebCoeffs[i+1]);
    sollya_mpfi_div_ui(c[i],c[i],2*i);

  }


  if(n>1){
    sollya_mpfi_set(c[n-1],chebCoeffs[n-2]);
    sollya_mpfi_div_ui(c[n-1],c[n-1],2*(n-1));
  }

  if(n>0){
    sollya_mpfi_set(c[n],chebCoeffs[n-1]);
    sollya_mpfi_div_ui(c[n],c[n],2*(n));
  }



  /*we have in c_i the values of the coefs of \int P(y) = \sum c_i T_i(x) (the constant of integration in c_0 is not computed*/
  /*we have to multiply by 1/y'(x), which is z1=(b-a)/2 */

  /*we compute z1=(b-a)/2*/

  sollya_mpfi_init2(ui, prec);
  sollya_mpfi_init2(vi, prec);


  mpfr_init2(u, prec);
  mpfr_init2(v, prec);

  sollya_mpfi_init2(z1, prec);
  sollya_mpfi_init2(z2, prec);

  sollya_mpfi_get_left(u,x);
  sollya_mpfi_get_right(v,x);

  sollya_mpfi_set_fr(ui,u);
  sollya_mpfi_set_fr(vi,v);

  sollya_mpfi_sub(z2,vi,ui);

  sollya_mpfi_div_ui(z1,z2,2);

  for (i=1;i<n+1;i++){
    sollya_mpfi_mul(c[i], c[i],z1);
  }

  for (i=0;i<n+1;i++){
    sollya_mpfi_set(coeffs[i], c[i]);
  }
  for (i=0;i<n+1;i++){
    sollya_mpfi_clear(c[i]);
  }
  safeFree(c);
  sollya_mpfi_clear(z1);
  sollya_mpfi_clear(z2);
  sollya_mpfi_clear(ui);
  sollya_mpfi_clear(vi);
  mpfr_clear(u);
  mpfr_clear(v);
}



/*****************************************************************************/
/*************Functions related to bounding polynomials in ChebBasis**********/
/*****************************************************************************/

/* This function computes an interval bound for a polynomial in cheb basis, over [-1,1],
   by just adding the absolute values of the coeffs;
   The n coefficients are given in coeffs.*/

void chebPolynomialBoundSimple(sollya_mpfi_t bound, int n, sollya_mpfi_t *coeffs){
  sollya_mpfi_t temp, temp2, intrval;
  int i;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(bound);
  sollya_mpfi_init2(temp, prec);
  sollya_mpfi_init2(temp2, prec);
  sollya_mpfi_init2(intrval, prec);
  sollya_mpfi_set_ui(temp, 0);
  sollya_mpfi_interv_si(intrval, -1,1);
  if (n>0) sollya_mpfi_set(temp, coeffs[0]);
  for(i=1;i<n;i++) {
    sollya_mpfi_mul(temp2,coeffs[i], intrval);
    sollya_mpfi_add(temp, temp,temp2);
  }
  sollya_mpfi_set(bound, temp);
  sollya_mpfi_clear(temp);
  sollya_mpfi_clear(temp2);
  sollya_mpfi_clear(intrval);
}

/* This function computes an interval bound for a polynomial in cheb basis. */
/*One day this function may become more complex*/
void chebPolynomialBound(sollya_mpfi_t bound, int n, sollya_mpfi_t *coeffs, int boundLevel){
  if (boundLevel==0) chebPolynomialBoundSimple(bound, n,coeffs);
  else chebPolynomialBoundSimple(bound, n,coeffs);
}


/* This function computes an interval bound for a polynomial in cheb basis.
   by using Clenshaw's method --
   The n coefficients are given in coeffs.*/
void evaluateChebPolynomialClenshaw(sollya_mpfi_t bound, int n, sollya_mpfi_t *coeffs, mpfi_t x,mpfi_t x0){
  int i;
  sollya_mpfi_t z, zz, z1,b0,b1;
  mpfr_t a, b;
  mp_prec_t prec;
  prec = sollya_mpfi_get_prec(bound);

  sollya_mpfi_init2(z, prec);
  sollya_mpfi_init2(zz, prec);
  sollya_mpfi_init2(z1, prec);
  sollya_mpfi_init2(b0, prec);
  sollya_mpfi_init2(b1, prec);
  mpfr_init2(a, prec);
  mpfr_init2(b, prec);

  sollya_mpfi_get_right(b,x);
  sollya_mpfi_get_left(a,x);
  sollya_mpfi_set_fr(z1,b);
  sollya_mpfi_sub_fr(z1,z1,a);
  sollya_mpfi_inv(z1,z1);
  sollya_mpfi_mul_ui(z,z1,2);
  /*z=2/(b-a)*/
  sollya_mpfi_set_fr(zz,b);
  mpfi_add_fr(zz,zz,a);
  sollya_mpfi_mul(zz,zz,z1);
  /*zz=(b+a)/(b-a)*/
  sollya_mpfi_mul(z,z,x0);
  sollya_mpfi_sub(z,z,zz);

  /*z=2/(b-a) * x0 - (b+a)/(b-a)*/

  /*Do the clenshaw algo*/
  /*b1:=[0.,0.];
    b0:=[0.,0.];
    for i from n to 2 by -1 do
    bb:=(((2&*z)&*b0) &-b1) &+L[i];
    b1:=b0;
    b0:=bb;
    end do;
    bb:=((z&*b0) &-b1) &+L[1];
    return bb;
  */
  sollya_mpfi_set_ui(b0,0);
  sollya_mpfi_set_ui(b1,0);

  for(i=n-1;i>0; i--){
    sollya_mpfi_mul(zz,z,b0);
    sollya_mpfi_mul_ui(zz,zz,2);
    sollya_mpfi_sub(zz,zz,b1);
    sollya_mpfi_add(zz,zz,coeffs[i]);
    sollya_mpfi_set(b1,b0);
    sollya_mpfi_set(b0,zz);
  }
  sollya_mpfi_mul(zz,z,b0);
  sollya_mpfi_sub(zz,zz,b1);
  sollya_mpfi_add(zz,zz,coeffs[0]);
  sollya_mpfi_set(bound, zz);

  sollya_mpfi_clear(zz);
  sollya_mpfi_clear(z);
  sollya_mpfi_clear(z1);
  sollya_mpfi_clear(b0);
  sollya_mpfi_clear(b1);
  mpfr_clear(b); mpfr_clear(a);
}


